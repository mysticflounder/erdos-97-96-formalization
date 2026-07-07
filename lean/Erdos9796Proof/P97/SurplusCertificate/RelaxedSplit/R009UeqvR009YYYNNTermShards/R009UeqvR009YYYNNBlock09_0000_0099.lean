/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 9:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0000 : Poly :=
[
  term ((-126641682 : Rat) / 21337981) []
]

/-- Partial product 0 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0000 : Poly :=
[
  term ((253283364 : Rat) / 21337981) [(0, 1), (2, 1)],
  term ((-253283364 : Rat) / 21337981) [(0, 1), (12, 1)],
  term ((253283364 : Rat) / 21337981) [(1, 1), (3, 1)],
  term ((-253283364 : Rat) / 21337981) [(1, 1), (13, 1)],
  term ((-126641682 : Rat) / 21337981) [(2, 2)],
  term ((-126641682 : Rat) / 21337981) [(3, 2)],
  term ((126641682 : Rat) / 21337981) [(12, 2)],
  term ((126641682 : Rat) / 21337981) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0000_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0000
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0001 : Poly :=
[
  term ((-167699916 : Rat) / 21337981) [(0, 1), (2, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0001 : Poly :=
[
  term ((335399832 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((-335399832 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((-167699916 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2)],
  term ((167699916 : Rat) / 21337981) [(0, 1), (2, 1), (12, 2)],
  term ((167699916 : Rat) / 21337981) [(0, 1), (2, 1), (13, 2)],
  term ((-167699916 : Rat) / 21337981) [(0, 1), (2, 3)],
  term ((-335399832 : Rat) / 21337981) [(0, 2), (2, 1), (12, 1)],
  term ((335399832 : Rat) / 21337981) [(0, 2), (2, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0001_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0001
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0002 : Poly :=
[
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0002 : Poly :=
[
  term ((-682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 2)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 3), (9, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((-682683336 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0002_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0002
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0003 : Poly :=
[
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (14, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0003 : Poly :=
[
  term ((682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (9, 1), (14, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 2), (14, 1)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (13, 2), (14, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 3), (9, 1), (14, 1)],
  term ((-682683336 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0003_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0003
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0004 : Poly :=
[
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0004 : Poly :=
[
  term ((-1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (2, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 3), (9, 1), (14, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 2), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 2), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0004_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0004
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0005 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0005 : Poly :=
[
  term ((1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 2), (9, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (12, 2), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (13, 2), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 3), (9, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 2), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 2), (3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0005_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0005
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0006 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0006 : Poly :=
[
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (11, 1), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 3), (11, 1), (14, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 2), (3, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0006_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0006
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0007 : Poly :=
[
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0007 : Poly :=
[
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 3)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 3), (13, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 2), (3, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0007_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0007
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0008 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1), (14, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0008 : Poly :=
[
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (13, 2), (14, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (13, 1), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (12, 2), (13, 1), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 3), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 3), (13, 1), (14, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 2), (3, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0008_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0008
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0009 : Poly :=
[
  term ((1630617804 : Rat) / 21337981) [(0, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0009 : Poly :=
[
  term ((3261235608 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3261235608 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (14, 1), (15, 1)],
  term ((1630617804 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-1630617804 : Rat) / 21337981) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1630617804 : Rat) / 21337981) [(0, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((1630617804 : Rat) / 21337981) [(0, 1), (3, 3), (14, 1), (15, 1)],
  term ((-3261235608 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((3261235608 : Rat) / 21337981) [(0, 2), (3, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0009_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0009
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0010 : Poly :=
[
  term ((-52480755 : Rat) / 3048283) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0010 : Poly :=
[
  term ((-104961510 : Rat) / 3048283) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((104961510 : Rat) / 3048283) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-52480755 : Rat) / 3048283) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((52480755 : Rat) / 3048283) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((52480755 : Rat) / 3048283) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-52480755 : Rat) / 3048283) [(0, 1), (3, 3), (15, 1)],
  term ((104961510 : Rat) / 3048283) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((-104961510 : Rat) / 3048283) [(0, 2), (3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0010_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0010
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0011 : Poly :=
[
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0011 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0011_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0011
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0012 : Poly :=
[
  term ((75824100 : Rat) / 21337981) [(0, 1), (3, 2)]
]

/-- Partial product 12 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0012 : Poly :=
[
  term ((151648200 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((-151648200 : Rat) / 21337981) [(0, 1), (1, 1), (3, 3)],
  term ((75824100 : Rat) / 21337981) [(0, 1), (2, 2), (3, 2)],
  term ((-75824100 : Rat) / 21337981) [(0, 1), (3, 2), (12, 2)],
  term ((-75824100 : Rat) / 21337981) [(0, 1), (3, 2), (13, 2)],
  term ((75824100 : Rat) / 21337981) [(0, 1), (3, 4)],
  term ((-151648200 : Rat) / 21337981) [(0, 2), (2, 1), (3, 2)],
  term ((151648200 : Rat) / 21337981) [(0, 2), (3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0012_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0012
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0013 : Poly :=
[
  term ((-212664591 : Rat) / 21337981) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0013 : Poly :=
[
  term ((425329182 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0013_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0013
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0014 : Poly :=
[
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0014 : Poly :=
[
  term ((41636646 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0014_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0014
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0015 : Poly :=
[
  term ((212664591 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0015 : Poly :=
[
  term ((-425329182 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0015_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0015
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0016 : Poly :=
[
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0016 : Poly :=
[
  term ((-41636646 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0016_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0016
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0017 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0017 : Poly :=
[
  term ((-197559972 : Rat) / 3048283) [(0, 1), (1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (2, 2), (11, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0017_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0017
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0018 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0018 : Poly :=
[
  term ((-197559972 : Rat) / 3048283) [(0, 1), (1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (13, 3), (14, 1), (15, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 2), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0018_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0018
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0019 : Poly :=
[
  term ((-98779986 : Rat) / 3048283) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0019 : Poly :=
[
  term ((197559972 : Rat) / 3048283) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (13, 3), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0019_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0019
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0020 : Poly :=
[
  term ((-348102729 : Rat) / 42675962) [(0, 1), (14, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0020 : Poly :=
[
  term ((348102729 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((-348102729 : Rat) / 21337981) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((-348102729 : Rat) / 42675962) [(0, 1), (2, 2), (14, 1)],
  term ((-348102729 : Rat) / 42675962) [(0, 1), (3, 2), (14, 1)],
  term ((348102729 : Rat) / 42675962) [(0, 1), (12, 2), (14, 1)],
  term ((348102729 : Rat) / 42675962) [(0, 1), (13, 2), (14, 1)],
  term ((348102729 : Rat) / 21337981) [(0, 2), (2, 1), (14, 1)],
  term ((-348102729 : Rat) / 21337981) [(0, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0020_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0020
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0021 : Poly :=
[
  term ((-744926031 : Rat) / 21337981) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 21 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0021 : Poly :=
[
  term ((1489852062 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-1489852062 : Rat) / 21337981) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-744926031 : Rat) / 21337981) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((-744926031 : Rat) / 21337981) [(0, 1), (3, 2), (14, 1), (15, 2)],
  term ((744926031 : Rat) / 21337981) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((744926031 : Rat) / 21337981) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((1489852062 : Rat) / 21337981) [(0, 2), (2, 1), (14, 1), (15, 2)],
  term ((-1489852062 : Rat) / 21337981) [(0, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0021_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0021
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0022 : Poly :=
[
  term ((801961317 : Rat) / 42675962) [(0, 1), (15, 2)]
]

/-- Partial product 22 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0022 : Poly :=
[
  term ((-801961317 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((801961317 : Rat) / 21337981) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((801961317 : Rat) / 42675962) [(0, 1), (2, 2), (15, 2)],
  term ((801961317 : Rat) / 42675962) [(0, 1), (3, 2), (15, 2)],
  term ((-801961317 : Rat) / 42675962) [(0, 1), (12, 2), (15, 2)],
  term ((-801961317 : Rat) / 42675962) [(0, 1), (13, 2), (15, 2)],
  term ((-801961317 : Rat) / 21337981) [(0, 2), (2, 1), (15, 2)],
  term ((801961317 : Rat) / 21337981) [(0, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0022_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0022
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0023 : Poly :=
[
  term ((20818323 : Rat) / 42675962) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0023 : Poly :=
[
  term ((-20818323 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0023_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0023
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0024 : Poly :=
[
  term ((75824100 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0024 : Poly :=
[
  term ((151648200 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1)],
  term ((-151648200 : Rat) / 21337981) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((-75824100 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (12, 2)],
  term ((-75824100 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((75824100 : Rat) / 21337981) [(1, 1), (2, 1), (3, 3)],
  term ((75824100 : Rat) / 21337981) [(1, 1), (2, 3), (3, 1)],
  term ((151648200 : Rat) / 21337981) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-151648200 : Rat) / 21337981) [(1, 2), (2, 1), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0024_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0024
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0025 : Poly :=
[
  term ((-4091544 : Rat) / 435469) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0025 : Poly :=
[
  term ((-8183088 : Rat) / 435469) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((8183088 : Rat) / 435469) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-4091544 : Rat) / 435469) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((4091544 : Rat) / 435469) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((4091544 : Rat) / 435469) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-4091544 : Rat) / 435469) [(1, 1), (2, 3), (15, 1)],
  term ((8183088 : Rat) / 435469) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-8183088 : Rat) / 435469) [(1, 2), (2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0025_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0025
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0026 : Poly :=
[
  term ((-495960786 : Rat) / 21337981) [(1, 1), (3, 1)]
]

/-- Partial product 26 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0026 : Poly :=
[
  term ((991921572 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((-991921572 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((-495960786 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1)],
  term ((495960786 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2)],
  term ((495960786 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2)],
  term ((-495960786 : Rat) / 21337981) [(1, 1), (3, 3)],
  term ((-991921572 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1)],
  term ((991921572 : Rat) / 21337981) [(1, 2), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0026_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0026
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0027 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (15, 1)]
]

/-- Partial product 27 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0027 : Poly :=
[
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 3), (11, 1), (15, 1)],
  term ((-2654642808 : Rat) / 21337981) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((2654642808 : Rat) / 21337981) [(1, 2), (3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0027_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0027
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0028 : Poly :=
[
  term ((508221297 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 28 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0028 : Poly :=
[
  term ((-1016442594 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((1016442594 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((508221297 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-508221297 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2), (14, 1)],
  term ((-508221297 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((508221297 : Rat) / 21337981) [(1, 1), (3, 3), (14, 1)],
  term ((1016442594 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-1016442594 : Rat) / 21337981) [(1, 2), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0028_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0028
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0029 : Poly :=
[
  term ((-663660702 : Rat) / 21337981) [(1, 1), (3, 1), (14, 2)]
]

/-- Partial product 29 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0029 : Poly :=
[
  term ((1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (14, 2)],
  term ((663660702 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2), (14, 2)],
  term ((663660702 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(1, 1), (3, 3), (14, 2)],
  term ((-1327321404 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(1, 2), (3, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0029_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0029
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0030 : Poly :=
[
  term ((966957102 : Rat) / 21337981) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 30 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0030 : Poly :=
[
  term ((-1933914204 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (15, 2)],
  term ((1933914204 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (12, 1), (15, 2)],
  term ((966957102 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((-966957102 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2), (15, 2)],
  term ((-966957102 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((966957102 : Rat) / 21337981) [(1, 1), (3, 3), (15, 2)],
  term ((1933914204 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-1933914204 : Rat) / 21337981) [(1, 2), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0030_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0030
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0031 : Poly :=
[
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 31 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0031 : Poly :=
[
  term ((-67598721 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (2, 2), (9, 1), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0031_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0031
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0032 : Poly :=
[
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 32 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0032 : Poly :=
[
  term ((67598721 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0032_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0032
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0033 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 33 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0033 : Poly :=
[
  term ((-197559972 : Rat) / 3048283) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2)],
  term ((197559972 : Rat) / 3048283) [(0, 1), (1, 1), (11, 1), (12, 1), (15, 2)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-197559972 : Rat) / 3048283) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((197559972 : Rat) / 3048283) [(1, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0033_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0033
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0034 : Poly :=
[
  term ((-239407002 : Rat) / 21337981) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 34 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0034 : Poly :=
[
  term ((478814004 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-478814004 : Rat) / 21337981) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-239407002 : Rat) / 21337981) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-239407002 : Rat) / 21337981) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((239407002 : Rat) / 21337981) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((239407002 : Rat) / 21337981) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((478814004 : Rat) / 21337981) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-478814004 : Rat) / 21337981) [(1, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0034_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0034
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0035 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 35 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0035 : Poly :=
[
  term ((-98779986 : Rat) / 3048283) [(0, 1), (1, 1), (2, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 1), (2, 2), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0035_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0035
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0036 : Poly :=
[
  term ((-327442491 : Rat) / 42675962) [(1, 1), (15, 1)]
]

/-- Partial product 36 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0036 : Poly :=
[
  term ((327442491 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((-327442491 : Rat) / 21337981) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-327442491 : Rat) / 42675962) [(1, 1), (2, 2), (15, 1)],
  term ((-327442491 : Rat) / 42675962) [(1, 1), (3, 2), (15, 1)],
  term ((327442491 : Rat) / 42675962) [(1, 1), (12, 2), (15, 1)],
  term ((327442491 : Rat) / 42675962) [(1, 1), (13, 2), (15, 1)],
  term ((327442491 : Rat) / 21337981) [(1, 2), (3, 1), (15, 1)],
  term ((-327442491 : Rat) / 21337981) [(1, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0036_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0036
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0037 : Poly :=
[
  term ((-67598721 : Rat) / 85351924) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0037 : Poly :=
[
  term ((67598721 : Rat) / 42675962) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0037_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0037
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0038 : Poly :=
[
  term ((-399196080 : Rat) / 21337981) [(1, 1), (15, 3)]
]

/-- Partial product 38 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0038 : Poly :=
[
  term ((798392160 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (15, 3)],
  term ((-798392160 : Rat) / 21337981) [(0, 1), (1, 1), (12, 1), (15, 3)],
  term ((-399196080 : Rat) / 21337981) [(1, 1), (2, 2), (15, 3)],
  term ((-399196080 : Rat) / 21337981) [(1, 1), (3, 2), (15, 3)],
  term ((399196080 : Rat) / 21337981) [(1, 1), (12, 2), (15, 3)],
  term ((399196080 : Rat) / 21337981) [(1, 1), (13, 2), (15, 3)],
  term ((798392160 : Rat) / 21337981) [(1, 2), (3, 1), (15, 3)],
  term ((-798392160 : Rat) / 21337981) [(1, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0038_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0038
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0039 : Poly :=
[
  term ((81060768 : Rat) / 21337981) [(2, 1)]
]

/-- Partial product 39 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0039 : Poly :=
[
  term ((162121536 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1)],
  term ((-162121536 : Rat) / 21337981) [(0, 1), (2, 2)],
  term ((-162121536 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)],
  term ((162121536 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1)],
  term ((81060768 : Rat) / 21337981) [(2, 1), (3, 2)],
  term ((-81060768 : Rat) / 21337981) [(2, 1), (12, 2)],
  term ((-81060768 : Rat) / 21337981) [(2, 1), (13, 2)],
  term ((81060768 : Rat) / 21337981) [(2, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0039_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0039
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0040 : Poly :=
[
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1)]
]

/-- Partial product 40 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0040 : Poly :=
[
  term ((3600183024 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1)],
  term ((-3600183024 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (5, 1)],
  term ((3600183024 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)],
  term ((-3600183024 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (5, 1)],
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (12, 2)],
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (13, 2)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 3), (5, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 3), (3, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0040_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0040
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0041 : Poly :=
[
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (14, 1)]
]

/-- Partial product 41 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0041 : Poly :=
[
  term ((-3600183024 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1), (14, 1)],
  term ((3600183024 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (5, 1), (14, 1)],
  term ((-3600183024 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((3600183024 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (5, 1), (14, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (12, 2), (14, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1)],
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 3), (5, 1), (14, 1)],
  term ((-1800091512 : Rat) / 21337981) [(2, 3), (3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0041_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0041
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0042 : Poly :=
[
  term ((-1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 42 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0042 : Poly :=
[
  term ((-2775961368 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((2775961368 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-2775961368 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((2775961368 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (12, 2), (13, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (13, 3)],
  term ((-1387980684 : Rat) / 21337981) [(2, 1), (3, 3), (13, 1)],
  term ((-1387980684 : Rat) / 21337981) [(2, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0042_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0042
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0043 : Poly :=
[
  term ((1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 1)]
]

/-- Partial product 43 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0043 : Poly :=
[
  term ((2775961368 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2775961368 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (13, 1), (14, 1)],
  term ((2775961368 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 2), (14, 1)],
  term ((-2775961368 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1), (14, 1)],
  term ((-1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (13, 3), (14, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 1), (3, 3), (13, 1), (14, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 3), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0043_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0043
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0044 : Poly :=
[
  term ((221728392 : Rat) / 3048283) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 44 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0044 : Poly :=
[
  term ((443456784 : Rat) / 3048283) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-443456784 : Rat) / 3048283) [(0, 1), (2, 2), (3, 1), (14, 1), (15, 1)],
  term ((443456784 : Rat) / 3048283) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-443456784 : Rat) / 3048283) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1)],
  term ((-221728392 : Rat) / 3048283) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-221728392 : Rat) / 3048283) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((221728392 : Rat) / 3048283) [(2, 1), (3, 3), (14, 1), (15, 1)],
  term ((221728392 : Rat) / 3048283) [(2, 3), (3, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0044_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0044
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0045 : Poly :=
[
  term ((-710251407 : Rat) / 21337981) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 45 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0045 : Poly :=
[
  term ((-1420502814 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((1420502814 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-1420502814 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((1420502814 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((710251407 : Rat) / 21337981) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((710251407 : Rat) / 21337981) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-710251407 : Rat) / 21337981) [(2, 1), (3, 3), (15, 1)],
  term ((-710251407 : Rat) / 21337981) [(2, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0045_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0045
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0046 : Poly :=
[
  term ((-151648200 : Rat) / 21337981) [(2, 1), (3, 2)]
]

/-- Partial product 46 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0046 : Poly :=
[
  term ((-303296400 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (12, 1)],
  term ((303296400 : Rat) / 21337981) [(0, 1), (2, 2), (3, 2)],
  term ((-303296400 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((303296400 : Rat) / 21337981) [(1, 1), (2, 1), (3, 3)],
  term ((151648200 : Rat) / 21337981) [(2, 1), (3, 2), (12, 2)],
  term ((151648200 : Rat) / 21337981) [(2, 1), (3, 2), (13, 2)],
  term ((-151648200 : Rat) / 21337981) [(2, 1), (3, 4)],
  term ((-151648200 : Rat) / 21337981) [(2, 3), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0046_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0046
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0047 : Poly :=
[
  term ((151648200 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1)]
]

/-- Partial product 47 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0047 : Poly :=
[
  term ((303296400 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (12, 1), (14, 1)],
  term ((-303296400 : Rat) / 21337981) [(0, 1), (2, 2), (3, 2), (14, 1)],
  term ((303296400 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1), (14, 1)],
  term ((-303296400 : Rat) / 21337981) [(1, 1), (2, 1), (3, 3), (14, 1)],
  term ((-151648200 : Rat) / 21337981) [(2, 1), (3, 2), (12, 2), (14, 1)],
  term ((-151648200 : Rat) / 21337981) [(2, 1), (3, 2), (13, 2), (14, 1)],
  term ((151648200 : Rat) / 21337981) [(2, 1), (3, 4), (14, 1)],
  term ((151648200 : Rat) / 21337981) [(2, 3), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0047_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0047
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0048 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 48 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0048 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2478610224 : Rat) / 21337981) [(0, 1), (2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-2478610224 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((2478610224 : Rat) / 21337981) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 3), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0048_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0048
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0049 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 49 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0049 : Poly :=
[
  term ((-2478610224 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((2478610224 : Rat) / 21337981) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((2478610224 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((-2478610224 : Rat) / 21337981) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0049_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0049
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0050 : Poly :=
[
  term ((-327566196 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 50 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0050 : Poly :=
[
  term ((-655132392 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((655132392 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1)],
  term ((655132392 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-655132392 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 3), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0050_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0050
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0051 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0051 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0051_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0051
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0052 : Poly :=
[
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 52 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0052 : Poly :=
[
  term ((655132392 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-655132392 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((-655132392 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((655132392 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0052_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0052
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0053 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0053 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0053_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0053
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0054 : Poly :=
[
  term ((-538372368 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 54 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0054 : Poly :=
[
  term ((-1076744736 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1076744736 : Rat) / 21337981) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((1076744736 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1076744736 : Rat) / 21337981) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1)],
  term ((-538372368 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((538372368 : Rat) / 21337981) [(2, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((538372368 : Rat) / 21337981) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((-538372368 : Rat) / 21337981) [(2, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0054_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0054
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0055 : Poly :=
[
  term ((538372368 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 55 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0055 : Poly :=
[
  term ((1076744736 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1076744736 : Rat) / 21337981) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-1076744736 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((1076744736 : Rat) / 21337981) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((538372368 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-538372368 : Rat) / 21337981) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-538372368 : Rat) / 21337981) [(2, 1), (13, 3), (15, 1)],
  term ((538372368 : Rat) / 21337981) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0055_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0055
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0056 : Poly :=
[
  term ((86639148 : Rat) / 21337981) [(2, 1), (14, 1)]
]

/-- Partial product 56 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0056 : Poly :=
[
  term ((173278296 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((-173278296 : Rat) / 21337981) [(0, 1), (2, 2), (14, 1)],
  term ((-173278296 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((173278296 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((86639148 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1)],
  term ((-86639148 : Rat) / 21337981) [(2, 1), (12, 2), (14, 1)],
  term ((-86639148 : Rat) / 21337981) [(2, 1), (13, 2), (14, 1)],
  term ((86639148 : Rat) / 21337981) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0056_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0056
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0057 : Poly :=
[
  term ((-170863704 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)]
]

/-- Partial product 57 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0057 : Poly :=
[
  term ((-341727408 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (14, 1), (15, 2)],
  term ((341727408 : Rat) / 21337981) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((341727408 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2)],
  term ((-341727408 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2)],
  term ((-170863704 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1), (15, 2)],
  term ((170863704 : Rat) / 21337981) [(2, 1), (12, 2), (14, 1), (15, 2)],
  term ((170863704 : Rat) / 21337981) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((-170863704 : Rat) / 21337981) [(2, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0057_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0057
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0058 : Poly :=
[
  term ((118317438 : Rat) / 21337981) [(2, 1), (15, 2)]
]

/-- Partial product 58 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0058 : Poly :=
[
  term ((236634876 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-236634876 : Rat) / 21337981) [(0, 1), (2, 2), (15, 2)],
  term ((-236634876 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((236634876 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((118317438 : Rat) / 21337981) [(2, 1), (3, 2), (15, 2)],
  term ((-118317438 : Rat) / 21337981) [(2, 1), (12, 2), (15, 2)],
  term ((-118317438 : Rat) / 21337981) [(2, 1), (13, 2), (15, 2)],
  term ((118317438 : Rat) / 21337981) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0058_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0058
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0059 : Poly :=
[
  term ((-81891549 : Rat) / 42675962) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 59 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0059 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0059_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0059
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0060 : Poly :=
[
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 1)]
]

/-- Partial product 60 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0060 : Poly :=
[
  term ((1800091512 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1)],
  term ((-1800091512 : Rat) / 21337981) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((-1800091512 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((1800091512 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1)],
  term ((-900045756 : Rat) / 21337981) [(2, 2), (3, 1), (5, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2)],
  term ((-900045756 : Rat) / 21337981) [(3, 3), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0060_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0060
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0061 : Poly :=
[
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 2)]
]

/-- Partial product 61 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0061 : Poly :=
[
  term ((-1800091512 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1), (14, 2)],
  term ((1800091512 : Rat) / 21337981) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 2)],
  term ((1800091512 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 2)],
  term ((-1800091512 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (14, 2)],
  term ((900045756 : Rat) / 21337981) [(2, 2), (3, 1), (5, 1), (14, 2)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (14, 2)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (14, 2)],
  term ((900045756 : Rat) / 21337981) [(3, 3), (5, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0061_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0061
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0062 : Poly :=
[
  term ((2139350868 : Rat) / 21337981) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 62 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0062 : Poly :=
[
  term ((-4278701736 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1), (15, 2)],
  term ((4278701736 : Rat) / 21337981) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((4278701736 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((-4278701736 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((2139350868 : Rat) / 21337981) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((-2139350868 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (15, 2)],
  term ((-2139350868 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((2139350868 : Rat) / 21337981) [(3, 3), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0062_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0062
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0063 : Poly :=
[
  term ((449727246 : Rat) / 21337981) [(3, 1), (9, 1)]
]

/-- Partial product 63 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0063 : Poly :=
[
  term ((-899454492 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((899454492 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1)],
  term ((899454492 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-899454492 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1)],
  term ((449727246 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1)],
  term ((-449727246 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2)],
  term ((-449727246 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2)],
  term ((449727246 : Rat) / 21337981) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0063_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0063
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0064 : Poly :=
[
  term ((-764020422 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 64 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0064 : Poly :=
[
  term ((1528040844 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-1528040844 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1528040844 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((1528040844 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((-764020422 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((764020422 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((764020422 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((-764020422 : Rat) / 21337981) [(3, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0064_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0064
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0065 : Poly :=
[
  term ((187173297 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 65 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0065 : Poly :=
[
  term ((-374346594 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((374346594 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((374346594 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-374346594 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((187173297 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-187173297 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-187173297 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((187173297 : Rat) / 21337981) [(3, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0065_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0065
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0066 : Poly :=
[
  term ((314293176 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2)]
]

/-- Partial product 66 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0066 : Poly :=
[
  term ((-628586352 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 2)],
  term ((628586352 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 2)],
  term ((628586352 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2)],
  term ((-628586352 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (14, 2)],
  term ((314293176 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 2)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 2)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 2)],
  term ((314293176 : Rat) / 21337981) [(3, 3), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0066_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0066
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0067 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 67 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0067 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (14, 2), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 2), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 3), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0067_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0067
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0068 : Poly :=
[
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 68 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0068 : Poly :=
[
  term ((210563496 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0068_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0068
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0069 : Poly :=
[
  term ((663660702 : Rat) / 21337981) [(3, 1), (11, 1), (14, 2)]
]

/-- Partial product 69 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0069 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 2), (11, 1), (14, 2)],
  term ((663660702 : Rat) / 21337981) [(2, 2), (3, 1), (11, 1), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (12, 2), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (13, 2), (14, 2)],
  term ((663660702 : Rat) / 21337981) [(3, 3), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0069_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0069
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0070 : Poly :=
[
  term ((663660702 : Rat) / 21337981) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 70 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0070 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (11, 1), (15, 2)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((663660702 : Rat) / 21337981) [(2, 2), (3, 1), (11, 1), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((663660702 : Rat) / 21337981) [(3, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0070_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0070
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0071 : Poly :=
[
  term ((675034317 : Rat) / 21337981) [(3, 1), (13, 1)]
]

/-- Partial product 71 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0071 : Poly :=
[
  term ((-1350068634 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((1350068634 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((1350068634 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2)],
  term ((-1350068634 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1)],
  term ((675034317 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1)],
  term ((-675034317 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1)],
  term ((-675034317 : Rat) / 21337981) [(3, 1), (13, 3)],
  term ((675034317 : Rat) / 21337981) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0071_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0071
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0072 : Poly :=
[
  term ((-663660702 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 72 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0072 : Poly :=
[
  term ((1327321404 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-663660702 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (13, 3), (14, 1)],
  term ((-663660702 : Rat) / 21337981) [(3, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0072_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0072
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0073 : Poly :=
[
  term ((-30329640 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2)]
]

/-- Partial product 73 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0073 : Poly :=
[
  term ((60659280 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-60659280 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-60659280 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (14, 2)],
  term ((60659280 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((-30329640 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (14, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (14, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 1), (13, 3), (14, 2)],
  term ((-30329640 : Rat) / 21337981) [(3, 3), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0073_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0073
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0074 : Poly :=
[
  term ((-1232362710 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 74 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0074 : Poly :=
[
  term ((2464725420 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-2464725420 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2464725420 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((2464725420 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-1232362710 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((1232362710 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (15, 2)],
  term ((1232362710 : Rat) / 21337981) [(3, 1), (13, 3), (15, 2)],
  term ((-1232362710 : Rat) / 21337981) [(3, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0074_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0074
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0075 : Poly :=
[
  term ((204147837 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 75 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0075 : Poly :=
[
  term ((-408295674 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((408295674 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((408295674 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-408295674 : Rat) / 21337981) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((204147837 : Rat) / 21337981) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((-204147837 : Rat) / 21337981) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-204147837 : Rat) / 21337981) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((204147837 : Rat) / 21337981) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0075_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0075
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0076 : Poly :=
[
  term ((81891549 : Rat) / 42675962) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0076 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0076_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0076
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0077 : Poly :=
[
  term ((-1259527923 : Rat) / 21337981) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 77 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0077 : Poly :=
[
  term ((2519055846 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-2519055846 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-2519055846 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((2519055846 : Rat) / 21337981) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((-1259527923 : Rat) / 21337981) [(2, 2), (3, 1), (14, 2), (15, 1)],
  term ((1259527923 : Rat) / 21337981) [(3, 1), (12, 2), (14, 2), (15, 1)],
  term ((1259527923 : Rat) / 21337981) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((-1259527923 : Rat) / 21337981) [(3, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0077_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0077
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0078 : Poly :=
[
  term ((-193635720 : Rat) / 21337981) [(3, 1), (15, 1)]
]

/-- Partial product 78 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0078 : Poly :=
[
  term ((387271440 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-387271440 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-387271440 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((387271440 : Rat) / 21337981) [(1, 1), (3, 2), (15, 1)],
  term ((-193635720 : Rat) / 21337981) [(2, 2), (3, 1), (15, 1)],
  term ((193635720 : Rat) / 21337981) [(3, 1), (12, 2), (15, 1)],
  term ((193635720 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1)],
  term ((-193635720 : Rat) / 21337981) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0078_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0078
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0079 : Poly :=
[
  term ((-52640874 : Rat) / 21337981) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0079 : Poly :=
[
  term ((105281748 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-52640874 : Rat) / 21337981) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-52640874 : Rat) / 21337981) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0079_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0079
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0080 : Poly :=
[
  term ((-204341661 : Rat) / 3048283) [(3, 1), (15, 3)]
]

/-- Partial product 80 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0080 : Poly :=
[
  term ((408683322 : Rat) / 3048283) [(0, 1), (2, 1), (3, 1), (15, 3)],
  term ((-408683322 : Rat) / 3048283) [(0, 1), (3, 1), (12, 1), (15, 3)],
  term ((-408683322 : Rat) / 3048283) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((408683322 : Rat) / 3048283) [(1, 1), (3, 2), (15, 3)],
  term ((-204341661 : Rat) / 3048283) [(2, 2), (3, 1), (15, 3)],
  term ((204341661 : Rat) / 3048283) [(3, 1), (12, 2), (15, 3)],
  term ((204341661 : Rat) / 3048283) [(3, 1), (13, 2), (15, 3)],
  term ((-204341661 : Rat) / 3048283) [(3, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0080_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0080
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0081 : Poly :=
[
  term ((993495537 : Rat) / 21337981) [(3, 2)]
]

/-- Partial product 81 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0081 : Poly :=
[
  term ((-1986991074 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2)],
  term ((1986991074 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1)],
  term ((1986991074 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1)],
  term ((-1986991074 : Rat) / 21337981) [(1, 1), (3, 3)],
  term ((993495537 : Rat) / 21337981) [(2, 2), (3, 2)],
  term ((-993495537 : Rat) / 21337981) [(3, 2), (12, 2)],
  term ((-993495537 : Rat) / 21337981) [(3, 2), (13, 2)],
  term ((993495537 : Rat) / 21337981) [(3, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0081_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0081
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0082 : Poly :=
[
  term ((-1800091512 : Rat) / 21337981) [(3, 2), (5, 1), (15, 1)]
]

/-- Partial product 82 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0082 : Poly :=
[
  term ((3600183024 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-3600183024 : Rat) / 21337981) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3600183024 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((3600183024 : Rat) / 21337981) [(1, 1), (3, 3), (5, 1), (15, 1)],
  term ((-1800091512 : Rat) / 21337981) [(2, 2), (3, 2), (5, 1), (15, 1)],
  term ((1800091512 : Rat) / 21337981) [(3, 2), (5, 1), (12, 2), (15, 1)],
  term ((1800091512 : Rat) / 21337981) [(3, 2), (5, 1), (13, 2), (15, 1)],
  term ((-1800091512 : Rat) / 21337981) [(3, 4), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0082_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0082
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0083 : Poly :=
[
  term ((1387980684 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 83 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0083 : Poly :=
[
  term ((-2775961368 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (13, 1), (15, 1)],
  term ((2775961368 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((2775961368 : Rat) / 21337981) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((-2775961368 : Rat) / 21337981) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 2), (3, 2), (13, 1), (15, 1)],
  term ((-1387980684 : Rat) / 21337981) [(3, 2), (12, 2), (13, 1), (15, 1)],
  term ((-1387980684 : Rat) / 21337981) [(3, 2), (13, 3), (15, 1)],
  term ((1387980684 : Rat) / 21337981) [(3, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0083_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0083
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0084 : Poly :=
[
  term ((-993495537 : Rat) / 21337981) [(3, 2), (14, 1)]
]

/-- Partial product 84 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0084 : Poly :=
[
  term ((1986991074 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((-1986991074 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1), (14, 1)],
  term ((-1986991074 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((1986991074 : Rat) / 21337981) [(1, 1), (3, 3), (14, 1)],
  term ((-993495537 : Rat) / 21337981) [(2, 2), (3, 2), (14, 1)],
  term ((993495537 : Rat) / 21337981) [(3, 2), (12, 2), (14, 1)],
  term ((993495537 : Rat) / 21337981) [(3, 2), (13, 2), (14, 1)],
  term ((-993495537 : Rat) / 21337981) [(3, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0084_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0084
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0085 : Poly :=
[
  term ((-75824100 : Rat) / 21337981) [(3, 2), (14, 2)]
]

/-- Partial product 85 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0085 : Poly :=
[
  term ((151648200 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (14, 2)],
  term ((-151648200 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1), (14, 2)],
  term ((-151648200 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((151648200 : Rat) / 21337981) [(1, 1), (3, 3), (14, 2)],
  term ((-75824100 : Rat) / 21337981) [(2, 2), (3, 2), (14, 2)],
  term ((75824100 : Rat) / 21337981) [(3, 2), (12, 2), (14, 2)],
  term ((75824100 : Rat) / 21337981) [(3, 2), (13, 2), (14, 2)],
  term ((-75824100 : Rat) / 21337981) [(3, 4), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0085_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0085
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0086 : Poly :=
[
  term ((1476274644 : Rat) / 21337981) [(3, 2), (15, 2)]
]

/-- Partial product 86 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0086 : Poly :=
[
  term ((-2952549288 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (15, 2)],
  term ((2952549288 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((2952549288 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-2952549288 : Rat) / 21337981) [(1, 1), (3, 3), (15, 2)],
  term ((1476274644 : Rat) / 21337981) [(2, 2), (3, 2), (15, 2)],
  term ((-1476274644 : Rat) / 21337981) [(3, 2), (12, 2), (15, 2)],
  term ((-1476274644 : Rat) / 21337981) [(3, 2), (13, 2), (15, 2)],
  term ((1476274644 : Rat) / 21337981) [(3, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0086_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0086
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0087 : Poly :=
[
  term ((151648200 : Rat) / 21337981) [(3, 3), (15, 1)]
]

/-- Partial product 87 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0087 : Poly :=
[
  term ((-303296400 : Rat) / 21337981) [(0, 1), (2, 1), (3, 3), (15, 1)],
  term ((303296400 : Rat) / 21337981) [(0, 1), (3, 3), (12, 1), (15, 1)],
  term ((303296400 : Rat) / 21337981) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((-303296400 : Rat) / 21337981) [(1, 1), (3, 4), (15, 1)],
  term ((151648200 : Rat) / 21337981) [(2, 2), (3, 3), (15, 1)],
  term ((-151648200 : Rat) / 21337981) [(3, 3), (12, 2), (15, 1)],
  term ((-151648200 : Rat) / 21337981) [(3, 3), (13, 2), (15, 1)],
  term ((151648200 : Rat) / 21337981) [(3, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0087_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0087
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0088 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 88 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0088 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(2, 2), (5, 1), (14, 2), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(3, 2), (5, 1), (14, 2), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0088_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0088
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0089 : Poly :=
[
  term ((619652556 : Rat) / 21337981) [(5, 1), (15, 1)]
]

/-- Partial product 89 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0089 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(2, 2), (5, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(3, 2), (5, 1), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (12, 2), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0089_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0089
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0090 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(5, 1), (15, 3)]
]

/-- Partial product 90 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0090 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (15, 3)],
  term ((-1239305112 : Rat) / 21337981) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((1239305112 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-1239305112 : Rat) / 21337981) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((-619652556 : Rat) / 21337981) [(2, 2), (5, 1), (15, 3)],
  term ((-619652556 : Rat) / 21337981) [(3, 2), (5, 1), (15, 3)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (12, 2), (15, 3)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0090_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0090
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0091 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 91 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0091 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0091_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0091
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0092 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 92 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0092 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0092_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0092
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0093 : Poly :=
[
  term ((61483350 : Rat) / 3048283) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 93 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0093 : Poly :=
[
  term ((-122966700 : Rat) / 3048283) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((122966700 : Rat) / 3048283) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-122966700 : Rat) / 3048283) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((122966700 : Rat) / 3048283) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((61483350 : Rat) / 3048283) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((61483350 : Rat) / 3048283) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-61483350 : Rat) / 3048283) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-61483350 : Rat) / 3048283) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0093_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0093
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0094 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0094 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0094_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0094
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0095 : Poly :=
[
  term ((-17769393 : Rat) / 3048283) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 95 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0095 : Poly :=
[
  term ((35538786 : Rat) / 3048283) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-35538786 : Rat) / 3048283) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((35538786 : Rat) / 3048283) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((-35538786 : Rat) / 3048283) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-17769393 : Rat) / 3048283) [(2, 2), (9, 1), (14, 2), (15, 1)],
  term ((-17769393 : Rat) / 3048283) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((17769393 : Rat) / 3048283) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((17769393 : Rat) / 3048283) [(9, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0095_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0095
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0096 : Poly :=
[
  term ((-6244851 : Rat) / 435469) [(9, 1), (15, 1)]
]

/-- Partial product 96 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0096 : Poly :=
[
  term ((12489702 : Rat) / 435469) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-12489702 : Rat) / 435469) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((12489702 : Rat) / 435469) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-12489702 : Rat) / 435469) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-6244851 : Rat) / 435469) [(2, 2), (9, 1), (15, 1)],
  term ((-6244851 : Rat) / 435469) [(3, 2), (9, 1), (15, 1)],
  term ((6244851 : Rat) / 435469) [(9, 1), (12, 2), (15, 1)],
  term ((6244851 : Rat) / 435469) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0096_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0096
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0097 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0097 : Poly :=
[
  term ((-142964775 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0097_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0097
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0098 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 98 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0098 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0098_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0098
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 9. -/
def rs_R009_ueqv_R009YYYNN_coefficient_09_0099 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(11, 1), (15, 3)]
]

/-- Partial product 99 for generator 9. -/
def rs_R009_ueqv_R009YYYNN_partial_09_0099 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-49389993 : Rat) / 3048283) [(2, 2), (11, 1), (15, 3)],
  term ((-49389993 : Rat) / 3048283) [(3, 2), (11, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (12, 2), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 9. -/
theorem rs_R009_ueqv_R009YYYNN_partial_09_0099_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_09_0099
        rs_R009_ueqv_R009YYYNN_generator_09_0000_0099 =
      rs_R009_ueqv_R009YYYNN_partial_09_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_09_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_09_0000,
  rs_R009_ueqv_R009YYYNN_partial_09_0001,
  rs_R009_ueqv_R009YYYNN_partial_09_0002,
  rs_R009_ueqv_R009YYYNN_partial_09_0003,
  rs_R009_ueqv_R009YYYNN_partial_09_0004,
  rs_R009_ueqv_R009YYYNN_partial_09_0005,
  rs_R009_ueqv_R009YYYNN_partial_09_0006,
  rs_R009_ueqv_R009YYYNN_partial_09_0007,
  rs_R009_ueqv_R009YYYNN_partial_09_0008,
  rs_R009_ueqv_R009YYYNN_partial_09_0009,
  rs_R009_ueqv_R009YYYNN_partial_09_0010,
  rs_R009_ueqv_R009YYYNN_partial_09_0011,
  rs_R009_ueqv_R009YYYNN_partial_09_0012,
  rs_R009_ueqv_R009YYYNN_partial_09_0013,
  rs_R009_ueqv_R009YYYNN_partial_09_0014,
  rs_R009_ueqv_R009YYYNN_partial_09_0015,
  rs_R009_ueqv_R009YYYNN_partial_09_0016,
  rs_R009_ueqv_R009YYYNN_partial_09_0017,
  rs_R009_ueqv_R009YYYNN_partial_09_0018,
  rs_R009_ueqv_R009YYYNN_partial_09_0019,
  rs_R009_ueqv_R009YYYNN_partial_09_0020,
  rs_R009_ueqv_R009YYYNN_partial_09_0021,
  rs_R009_ueqv_R009YYYNN_partial_09_0022,
  rs_R009_ueqv_R009YYYNN_partial_09_0023,
  rs_R009_ueqv_R009YYYNN_partial_09_0024,
  rs_R009_ueqv_R009YYYNN_partial_09_0025,
  rs_R009_ueqv_R009YYYNN_partial_09_0026,
  rs_R009_ueqv_R009YYYNN_partial_09_0027,
  rs_R009_ueqv_R009YYYNN_partial_09_0028,
  rs_R009_ueqv_R009YYYNN_partial_09_0029,
  rs_R009_ueqv_R009YYYNN_partial_09_0030,
  rs_R009_ueqv_R009YYYNN_partial_09_0031,
  rs_R009_ueqv_R009YYYNN_partial_09_0032,
  rs_R009_ueqv_R009YYYNN_partial_09_0033,
  rs_R009_ueqv_R009YYYNN_partial_09_0034,
  rs_R009_ueqv_R009YYYNN_partial_09_0035,
  rs_R009_ueqv_R009YYYNN_partial_09_0036,
  rs_R009_ueqv_R009YYYNN_partial_09_0037,
  rs_R009_ueqv_R009YYYNN_partial_09_0038,
  rs_R009_ueqv_R009YYYNN_partial_09_0039,
  rs_R009_ueqv_R009YYYNN_partial_09_0040,
  rs_R009_ueqv_R009YYYNN_partial_09_0041,
  rs_R009_ueqv_R009YYYNN_partial_09_0042,
  rs_R009_ueqv_R009YYYNN_partial_09_0043,
  rs_R009_ueqv_R009YYYNN_partial_09_0044,
  rs_R009_ueqv_R009YYYNN_partial_09_0045,
  rs_R009_ueqv_R009YYYNN_partial_09_0046,
  rs_R009_ueqv_R009YYYNN_partial_09_0047,
  rs_R009_ueqv_R009YYYNN_partial_09_0048,
  rs_R009_ueqv_R009YYYNN_partial_09_0049,
  rs_R009_ueqv_R009YYYNN_partial_09_0050,
  rs_R009_ueqv_R009YYYNN_partial_09_0051,
  rs_R009_ueqv_R009YYYNN_partial_09_0052,
  rs_R009_ueqv_R009YYYNN_partial_09_0053,
  rs_R009_ueqv_R009YYYNN_partial_09_0054,
  rs_R009_ueqv_R009YYYNN_partial_09_0055,
  rs_R009_ueqv_R009YYYNN_partial_09_0056,
  rs_R009_ueqv_R009YYYNN_partial_09_0057,
  rs_R009_ueqv_R009YYYNN_partial_09_0058,
  rs_R009_ueqv_R009YYYNN_partial_09_0059,
  rs_R009_ueqv_R009YYYNN_partial_09_0060,
  rs_R009_ueqv_R009YYYNN_partial_09_0061,
  rs_R009_ueqv_R009YYYNN_partial_09_0062,
  rs_R009_ueqv_R009YYYNN_partial_09_0063,
  rs_R009_ueqv_R009YYYNN_partial_09_0064,
  rs_R009_ueqv_R009YYYNN_partial_09_0065,
  rs_R009_ueqv_R009YYYNN_partial_09_0066,
  rs_R009_ueqv_R009YYYNN_partial_09_0067,
  rs_R009_ueqv_R009YYYNN_partial_09_0068,
  rs_R009_ueqv_R009YYYNN_partial_09_0069,
  rs_R009_ueqv_R009YYYNN_partial_09_0070,
  rs_R009_ueqv_R009YYYNN_partial_09_0071,
  rs_R009_ueqv_R009YYYNN_partial_09_0072,
  rs_R009_ueqv_R009YYYNN_partial_09_0073,
  rs_R009_ueqv_R009YYYNN_partial_09_0074,
  rs_R009_ueqv_R009YYYNN_partial_09_0075,
  rs_R009_ueqv_R009YYYNN_partial_09_0076,
  rs_R009_ueqv_R009YYYNN_partial_09_0077,
  rs_R009_ueqv_R009YYYNN_partial_09_0078,
  rs_R009_ueqv_R009YYYNN_partial_09_0079,
  rs_R009_ueqv_R009YYYNN_partial_09_0080,
  rs_R009_ueqv_R009YYYNN_partial_09_0081,
  rs_R009_ueqv_R009YYYNN_partial_09_0082,
  rs_R009_ueqv_R009YYYNN_partial_09_0083,
  rs_R009_ueqv_R009YYYNN_partial_09_0084,
  rs_R009_ueqv_R009YYYNN_partial_09_0085,
  rs_R009_ueqv_R009YYYNN_partial_09_0086,
  rs_R009_ueqv_R009YYYNN_partial_09_0087,
  rs_R009_ueqv_R009YYYNN_partial_09_0088,
  rs_R009_ueqv_R009YYYNN_partial_09_0089,
  rs_R009_ueqv_R009YYYNN_partial_09_0090,
  rs_R009_ueqv_R009YYYNN_partial_09_0091,
  rs_R009_ueqv_R009YYYNN_partial_09_0092,
  rs_R009_ueqv_R009YYYNN_partial_09_0093,
  rs_R009_ueqv_R009YYYNN_partial_09_0094,
  rs_R009_ueqv_R009YYYNN_partial_09_0095,
  rs_R009_ueqv_R009YYYNN_partial_09_0096,
  rs_R009_ueqv_R009YYYNN_partial_09_0097,
  rs_R009_ueqv_R009YYYNN_partial_09_0098,
  rs_R009_ueqv_R009YYYNN_partial_09_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_09_0000_0099 : Poly :=
[
  term ((1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1)],
  term ((151648200 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1)],
  term ((-1016442594 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-1933914204 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-67598721 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-8183088 : Rat) / 435469) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-335399832 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (13, 1)],
  term ((478814004 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (1, 1), (2, 1), (14, 2), (15, 1)],
  term ((327442491 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((67598721 : Rat) / 42675962) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((798392160 : Rat) / 21337981) [(0, 1), (1, 1), (2, 1), (15, 3)],
  term ((-151648200 : Rat) / 21337981) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((8183088 : Rat) / 435469) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((-682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 1), (1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-991921572 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((1016442594 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 2)],
  term ((1933914204 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (12, 1), (15, 2)],
  term ((1878315804 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((92598462 : Rat) / 3048283) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (13, 2), (14, 1)],
  term ((348102729 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((1489852062 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-801961317 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (9, 1), (14, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 2), (9, 1), (16, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (11, 1), (14, 1)],
  term ((-2502994608 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-3261235608 : Rat) / 21337981) [(0, 1), (1, 1), (3, 2), (14, 1), (15, 1)],
  term ((104961510 : Rat) / 3048283) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-151648200 : Rat) / 21337981) [(0, 1), (1, 1), (3, 3)],
  term ((67598721 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (12, 1), (16, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 1), (1, 1), (11, 1), (12, 1), (15, 2)],
  term ((197559972 : Rat) / 3048283) [(0, 1), (1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-478814004 : Rat) / 21337981) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-327442491 : Rat) / 21337981) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-67598721 : Rat) / 42675962) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-798392160 : Rat) / 21337981) [(0, 1), (1, 1), (12, 1), (15, 3)],
  term ((-348102729 : Rat) / 21337981) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((-1489852062 : Rat) / 21337981) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((801961317 : Rat) / 21337981) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 1), (1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((253283364 : Rat) / 21337981) [(0, 1), (2, 1)],
  term ((1800091512 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1)],
  term ((3600183024 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1)],
  term ((-3600183024 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1), (12, 1), (14, 1)],
  term ((-1800091512 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1), (14, 2)],
  term ((-4278701736 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (5, 1), (15, 2)],
  term ((-899454492 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((1528040844 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-374346594 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-628586352 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 2)],
  term ((163783098 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (11, 1), (15, 2)],
  term ((-2775961368 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((2775961368 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((443456784 : Rat) / 3048283) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1420502814 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-1350068634 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((60659280 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 2)],
  term ((2464725420 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-408295674 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2519055846 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (14, 2), (15, 1)],
  term ((387271440 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((105281748 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((408683322 : Rat) / 3048283) [(0, 1), (2, 1), (3, 1), (15, 3)],
  term ((-2154690990 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2)],
  term ((3600183024 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-303296400 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (12, 1)],
  term ((303296400 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (12, 1), (14, 1)],
  term ((-2775961368 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (13, 1), (15, 1)],
  term ((1986991074 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((151648200 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (14, 2)],
  term ((-2952549288 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (15, 2)],
  term ((-303296400 : Rat) / 21337981) [(0, 1), (2, 1), (3, 3), (15, 1)],
  term ((2478610224 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2478610224 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(0, 1), (2, 1), (5, 1), (15, 3)],
  term ((-655132392 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((655132392 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-122966700 : Rat) / 3048283) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35538786 : Rat) / 3048283) [(0, 1), (2, 1), (9, 1), (14, 2), (15, 1)],
  term ((12489702 : Rat) / 435469) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((162121536 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1)],
  term ((-1076744736 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1076744736 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((173278296 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((-341727408 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (14, 1), (15, 2)],
  term ((236634876 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-81891549 : Rat) / 21337981) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((167699916 : Rat) / 21337981) [(0, 1), (2, 1), (12, 2)],
  term ((167699916 : Rat) / 21337981) [(0, 1), (2, 1), (13, 2)],
  term ((-162121536 : Rat) / 21337981) [(0, 1), (2, 2)],
  term ((-3600183024 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (5, 1)],
  term ((3600183024 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (5, 1), (14, 1)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (9, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (2, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (2, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (11, 1), (14, 1)],
  term ((4103282772 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-4103282772 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-1473579684 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (14, 1), (15, 1)],
  term ((1053137529 : Rat) / 21337981) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((379120500 : Rat) / 21337981) [(0, 1), (2, 2), (3, 2)],
  term ((-303296400 : Rat) / 21337981) [(0, 1), (2, 2), (3, 2), (14, 1)],
  term ((-2478610224 : Rat) / 21337981) [(0, 1), (2, 2), (5, 1), (14, 1), (15, 1)],
  term ((2478610224 : Rat) / 21337981) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((442467801 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-184601421 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-442467801 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((184601421 : Rat) / 21337981) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (2, 2), (11, 1), (14, 1), (15, 1)],
  term ((1768204638 : Rat) / 21337981) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1768204638 : Rat) / 21337981) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-694659321 : Rat) / 42675962) [(0, 1), (2, 2), (14, 1)],
  term ((-403198623 : Rat) / 21337981) [(0, 1), (2, 2), (14, 1), (15, 2)],
  term ((328691565 : Rat) / 42675962) [(0, 1), (2, 2), (15, 2)],
  term ((184601421 : Rat) / 42675962) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-167699916 : Rat) / 21337981) [(0, 1), (2, 3)],
  term ((-1800091512 : Rat) / 21337981) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((1800091512 : Rat) / 21337981) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 2)],
  term ((4278701736 : Rat) / 21337981) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((899454492 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1)],
  term ((-1528040844 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((374346594 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((628586352 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-163783098 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 2)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (12, 2), (14, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (12, 2), (16, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (13, 2)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (13, 2), (14, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (13, 2), (16, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (13, 2), (14, 1)],
  term ((1350068634 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-60659280 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2464725420 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((408295674 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2519055846 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-387271440 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-105281748 : Rat) / 21337981) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-408683322 : Rat) / 3048283) [(0, 1), (3, 1), (12, 1), (15, 3)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1630617804 : Rat) / 21337981) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((52480755 : Rat) / 3048283) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1630617804 : Rat) / 21337981) [(0, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((52480755 : Rat) / 3048283) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 3)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 3), (14, 1)],
  term ((-3600183024 : Rat) / 21337981) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (3, 2), (11, 1), (14, 1), (15, 1)],
  term ((1986991074 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1)],
  term ((2775961368 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1986991074 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1), (14, 1)],
  term ((-151648200 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1), (14, 2)],
  term ((2952549288 : Rat) / 21337981) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((-75824100 : Rat) / 21337981) [(0, 1), (3, 2), (12, 2)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-75824100 : Rat) / 21337981) [(0, 1), (3, 2), (13, 2)],
  term ((-348102729 : Rat) / 42675962) [(0, 1), (3, 2), (14, 1)],
  term ((-744926031 : Rat) / 21337981) [(0, 1), (3, 2), (14, 1), (15, 2)],
  term ((801961317 : Rat) / 42675962) [(0, 1), (3, 2), (15, 2)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 3), (9, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 3), (9, 1), (14, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 3), (9, 1), (14, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 3), (9, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 3), (11, 1), (14, 1)],
  term ((303296400 : Rat) / 21337981) [(0, 1), (3, 3), (12, 1), (15, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 3), (13, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 3), (13, 1), (14, 1)],
  term ((1630617804 : Rat) / 21337981) [(0, 1), (3, 3), (14, 1), (15, 1)],
  term ((-52480755 : Rat) / 3048283) [(0, 1), (3, 3), (15, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((75824100 : Rat) / 21337981) [(0, 1), (3, 4)],
  term ((-1239305112 : Rat) / 21337981) [(0, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((17753203 : Rat) / 21337981) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((122966700 : Rat) / 3048283) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35538786 : Rat) / 3048283) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-12489702 : Rat) / 435469) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-253283364 : Rat) / 21337981) [(0, 1), (12, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((348102729 : Rat) / 42675962) [(0, 1), (12, 2), (14, 1)],
  term ((744926031 : Rat) / 21337981) [(0, 1), (12, 2), (14, 1), (15, 2)],
  term ((-801961317 : Rat) / 42675962) [(0, 1), (12, 2), (15, 2)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((348102729 : Rat) / 42675962) [(0, 1), (13, 2), (14, 1)],
  term ((744926031 : Rat) / 21337981) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((-801961317 : Rat) / 42675962) [(0, 1), (13, 2), (15, 2)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (13, 3), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (13, 3), (15, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((-682683336 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((1909404 : Rat) / 435469) [(0, 2), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 2), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-3261235608 : Rat) / 21337981) [(0, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((104961510 : Rat) / 3048283) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((-954702 : Rat) / 435469) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-151648200 : Rat) / 21337981) [(0, 2), (2, 1), (3, 2)],
  term ((425329182 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-335399832 : Rat) / 21337981) [(0, 2), (2, 1), (12, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 2), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((348102729 : Rat) / 21337981) [(0, 2), (2, 1), (14, 1)],
  term ((1489852062 : Rat) / 21337981) [(0, 2), (2, 1), (14, 1), (15, 2)],
  term ((-801961317 : Rat) / 21337981) [(0, 2), (2, 1), (15, 2)],
  term ((-20818323 : Rat) / 21337981) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((335399832 : Rat) / 21337981) [(0, 2), (2, 2)],
  term ((-682683336 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (12, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 2), (3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 2), (3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 2), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 2), (3, 1), (12, 1), (13, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 2), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((3261235608 : Rat) / 21337981) [(0, 2), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-104961510 : Rat) / 3048283) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((954702 : Rat) / 435469) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((151648200 : Rat) / 21337981) [(0, 2), (3, 2), (12, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-348102729 : Rat) / 21337981) [(0, 2), (12, 1), (14, 1)],
  term ((-1489852062 : Rat) / 21337981) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((801961317 : Rat) / 21337981) [(0, 2), (12, 1), (15, 2)],
  term ((20818323 : Rat) / 21337981) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-162121536 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)],
  term ((3600183024 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)],
  term ((-3600183024 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((-2478610224 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((2478610224 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((655132392 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-655132392 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-75824100 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (12, 2)],
  term ((4180942224 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-356749650 : Rat) / 3048283) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-407397924 : Rat) / 3048283) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((2775961368 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 2), (14, 1)],
  term ((-173278296 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((341727408 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2)],
  term ((-236634876 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((81891549 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-3600183024 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (5, 1)],
  term ((3600183024 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (5, 1), (14, 1)],
  term ((2472664968 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((-2472664968 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1), (14, 1)],
  term ((-443456784 : Rat) / 3048283) [(1, 1), (2, 1), (3, 2), (14, 1), (15, 1)],
  term ((1220017158 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((379120500 : Rat) / 21337981) [(1, 1), (2, 1), (3, 3)],
  term ((-303296400 : Rat) / 21337981) [(1, 1), (2, 1), (3, 3), (14, 1)],
  term ((2478610224 : Rat) / 21337981) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2478610224 : Rat) / 21337981) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-655132392 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((655132392 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((4091544 : Rat) / 435469) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((162121536 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1)],
  term ((173278296 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-341727408 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2)],
  term ((236634876 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-81891549 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1076744736 : Rat) / 21337981) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1)],
  term ((1277230392 : Rat) / 21337981) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-495960786 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1)],
  term ((508221297 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-663660702 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (14, 2)],
  term ((966957102 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (2, 2), (9, 1), (14, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (2, 2), (9, 1), (16, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((-239407002 : Rat) / 21337981) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 1), (2, 2), (14, 2), (15, 1)],
  term ((-327442491 : Rat) / 42675962) [(1, 1), (2, 2), (15, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-399196080 : Rat) / 21337981) [(1, 1), (2, 2), (15, 3)],
  term ((75824100 : Rat) / 21337981) [(1, 1), (2, 3), (3, 1)],
  term ((-4091544 : Rat) / 435469) [(1, 1), (2, 3), (15, 1)],
  term ((253283364 : Rat) / 21337981) [(1, 1), (3, 1)],
  term ((-1800091512 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((1800091512 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 2)],
  term ((4278701736 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((1239305112 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((899454492 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-1528040844 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((50941913 : Rat) / 3048283) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((628586352 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2)],
  term ((-163783098 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192810293 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-122966700 : Rat) / 3048283) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35538786 : Rat) / 3048283) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((12489702 : Rat) / 435469) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((495960786 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2)],
  term ((-508221297 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2), (14, 1)],
  term ((663660702 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2), (14, 2)],
  term ((-966957102 : Rat) / 21337981) [(1, 1), (3, 1), (12, 2), (15, 2)],
  term ((408295674 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2519055846 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-387271440 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-105281748 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-408683322 : Rat) / 3048283) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((1846029420 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2)],
  term ((-1835542701 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((603001422 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (14, 2)],
  term ((-3431682522 : Rat) / 21337981) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((1800091512 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1)],
  term ((-3600183024 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1)],
  term ((-1800091512 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (14, 2)],
  term ((-4278701736 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1), (15, 2)],
  term ((-899454492 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1)],
  term ((1528040844 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (14, 1)],
  term ((-681094467 : Rat) / 42675962) [(1, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((-628586352 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (14, 2)],
  term ((163783098 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (14, 2), (16, 1)],
  term ((353528271 : Rat) / 42675962) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 2), (11, 1), (14, 2)],
  term ((-635861502 : Rat) / 21337981) [(1, 1), (3, 2), (11, 1), (15, 2)],
  term ((90988920 : Rat) / 3048283) [(1, 1), (3, 2), (13, 1)],
  term ((-659669670 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((-90988920 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((5417274708 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((2775961368 : Rat) / 21337981) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((-647702676 : Rat) / 21337981) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((2864785797 : Rat) / 21337981) [(1, 1), (3, 2), (14, 2), (15, 1)],
  term ((447100389 : Rat) / 42675962) [(1, 1), (3, 2), (15, 1)],
  term ((353528271 : Rat) / 85351924) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((2461587174 : Rat) / 21337981) [(1, 1), (3, 2), (15, 3)],
  term ((-2482951860 : Rat) / 21337981) [(1, 1), (3, 3)],
  term ((3600183024 : Rat) / 21337981) [(1, 1), (3, 3), (5, 1), (15, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 3), (11, 1), (15, 1)],
  term ((-2472664968 : Rat) / 21337981) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((2495212371 : Rat) / 21337981) [(1, 1), (3, 3), (14, 1)],
  term ((-512012502 : Rat) / 21337981) [(1, 1), (3, 3), (14, 2)],
  term ((-1985592186 : Rat) / 21337981) [(1, 1), (3, 3), (15, 2)],
  term ((-303296400 : Rat) / 21337981) [(1, 1), (3, 4), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 1), (12, 2), (16, 1)],
  term ((122966700 : Rat) / 3048283) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35538786 : Rat) / 3048283) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-12489702 : Rat) / 435469) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32092315 : Rat) / 42675962) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((32092315 : Rat) / 42675962) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((239407002 : Rat) / 21337981) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((327442491 : Rat) / 42675962) [(1, 1), (12, 2), (15, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((399196080 : Rat) / 21337981) [(1, 1), (12, 2), (15, 3)],
  term ((-253283364 : Rat) / 21337981) [(1, 1), (13, 1)],
  term ((239407002 : Rat) / 21337981) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((327442491 : Rat) / 42675962) [(1, 1), (13, 2), (15, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((399196080 : Rat) / 21337981) [(1, 1), (13, 2), (15, 3)],
  term ((151648200 : Rat) / 21337981) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((8183088 : Rat) / 435469) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-151648200 : Rat) / 21337981) [(1, 2), (2, 1), (3, 2)],
  term ((-8183088 : Rat) / 435469) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-2654642808 : Rat) / 21337981) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-197559972 : Rat) / 3048283) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((-991921572 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1)],
  term ((1016442594 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1), (14, 2)],
  term ((1933914204 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((478814004 : Rat) / 21337981) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((327442491 : Rat) / 21337981) [(1, 2), (3, 1), (15, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((798392160 : Rat) / 21337981) [(1, 2), (3, 1), (15, 3)],
  term ((991921572 : Rat) / 21337981) [(1, 2), (3, 2)],
  term ((2654642808 : Rat) / 21337981) [(1, 2), (3, 2), (11, 1), (15, 1)],
  term ((-1016442594 : Rat) / 21337981) [(1, 2), (3, 2), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 2), (3, 2), (14, 2)],
  term ((-1933914204 : Rat) / 21337981) [(1, 2), (3, 2), (15, 2)],
  term ((67598721 : Rat) / 21337981) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((197559972 : Rat) / 3048283) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-478814004 : Rat) / 21337981) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-327442491 : Rat) / 21337981) [(1, 2), (13, 1), (15, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-798392160 : Rat) / 21337981) [(1, 2), (13, 1), (15, 3)],
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (12, 2)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (12, 2), (14, 1)],
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (13, 2)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (13, 2), (14, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (12, 2), (13, 1)],
  term ((-1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-221728392 : Rat) / 3048283) [(2, 1), (3, 1), (12, 2), (14, 1), (15, 1)],
  term ((710251407 : Rat) / 21337981) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((-221728392 : Rat) / 3048283) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((710251407 : Rat) / 21337981) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (13, 3)],
  term ((-1387980684 : Rat) / 21337981) [(2, 1), (3, 1), (13, 3), (14, 1)],
  term ((81060768 : Rat) / 21337981) [(2, 1), (3, 2)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((151648200 : Rat) / 21337981) [(2, 1), (3, 2), (12, 2)],
  term ((-151648200 : Rat) / 21337981) [(2, 1), (3, 2), (12, 2), (14, 1)],
  term ((-538372368 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((538372368 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((151648200 : Rat) / 21337981) [(2, 1), (3, 2), (13, 2)],
  term ((-151648200 : Rat) / 21337981) [(2, 1), (3, 2), (13, 2), (14, 1)],
  term ((86639148 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1)],
  term ((-170863704 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1), (15, 2)],
  term ((118317438 : Rat) / 21337981) [(2, 1), (3, 2), (15, 2)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 3), (5, 1)],
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 3), (5, 1), (14, 1)],
  term ((-1387980684 : Rat) / 21337981) [(2, 1), (3, 3), (13, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 1), (3, 3), (13, 1), (14, 1)],
  term ((221728392 : Rat) / 3048283) [(2, 1), (3, 3), (14, 1), (15, 1)],
  term ((-710251407 : Rat) / 21337981) [(2, 1), (3, 3), (15, 1)],
  term ((-151648200 : Rat) / 21337981) [(2, 1), (3, 4)],
  term ((151648200 : Rat) / 21337981) [(2, 1), (3, 4), (14, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (14, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-81060768 : Rat) / 21337981) [(2, 1), (12, 2)],
  term ((538372368 : Rat) / 21337981) [(2, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-538372368 : Rat) / 21337981) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-86639148 : Rat) / 21337981) [(2, 1), (12, 2), (14, 1)],
  term ((170863704 : Rat) / 21337981) [(2, 1), (12, 2), (14, 1), (15, 2)],
  term ((-118317438 : Rat) / 21337981) [(2, 1), (12, 2), (15, 2)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-81060768 : Rat) / 21337981) [(2, 1), (13, 2)],
  term ((-86639148 : Rat) / 21337981) [(2, 1), (13, 2), (14, 1)],
  term ((170863704 : Rat) / 21337981) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((-118317438 : Rat) / 21337981) [(2, 1), (13, 2), (15, 2)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((538372368 : Rat) / 21337981) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((-538372368 : Rat) / 21337981) [(2, 1), (13, 3), (15, 1)],
  term ((-126641682 : Rat) / 21337981) [(2, 2)],
  term ((-900045756 : Rat) / 21337981) [(2, 2), (3, 1), (5, 1)],
  term ((900045756 : Rat) / 21337981) [(2, 2), (3, 1), (5, 1), (14, 2)],
  term ((2139350868 : Rat) / 21337981) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((449727246 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1)],
  term ((-764020422 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((187173297 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((314293176 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 2)],
  term ((-81891549 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (16, 1)],
  term ((663660702 : Rat) / 21337981) [(2, 2), (3, 1), (11, 1), (14, 2)],
  term ((663660702 : Rat) / 21337981) [(2, 2), (3, 1), (11, 1), (15, 2)],
  term ((675034317 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1)],
  term ((-663660702 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-30329640 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (14, 2)],
  term ((-1232362710 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((204147837 : Rat) / 21337981) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1259527923 : Rat) / 21337981) [(2, 2), (3, 1), (14, 2), (15, 1)],
  term ((-193635720 : Rat) / 21337981) [(2, 2), (3, 1), (15, 1)],
  term ((-52640874 : Rat) / 21337981) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-204341661 : Rat) / 3048283) [(2, 2), (3, 1), (15, 3)],
  term ((993495537 : Rat) / 21337981) [(2, 2), (3, 2)],
  term ((-1800091512 : Rat) / 21337981) [(2, 2), (3, 2), (5, 1), (15, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 2), (3, 2), (13, 1), (15, 1)],
  term ((-993495537 : Rat) / 21337981) [(2, 2), (3, 2), (14, 1)],
  term ((-75824100 : Rat) / 21337981) [(2, 2), (3, 2), (14, 2)],
  term ((1476274644 : Rat) / 21337981) [(2, 2), (3, 2), (15, 2)],
  term ((151648200 : Rat) / 21337981) [(2, 2), (3, 3), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(2, 2), (5, 1), (14, 2), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(2, 2), (5, 1), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(2, 2), (5, 1), (15, 3)],
  term ((17753203 : Rat) / 42675962) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((61483350 : Rat) / 3048283) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17769393 : Rat) / 3048283) [(2, 2), (9, 1), (14, 2), (15, 1)],
  term ((-6244851 : Rat) / 435469) [(2, 2), (9, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-49389993 : Rat) / 3048283) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(2, 2), (11, 1), (15, 3)],
  term ((81060768 : Rat) / 21337981) [(2, 3)],
  term ((1800091512 : Rat) / 21337981) [(2, 3), (3, 1), (5, 1)],
  term ((-1800091512 : Rat) / 21337981) [(2, 3), (3, 1), (5, 1), (14, 1)],
  term ((-1387980684 : Rat) / 21337981) [(2, 3), (3, 1), (13, 1)],
  term ((1387980684 : Rat) / 21337981) [(2, 3), (3, 1), (13, 1), (14, 1)],
  term ((221728392 : Rat) / 3048283) [(2, 3), (3, 1), (14, 1), (15, 1)],
  term ((-710251407 : Rat) / 21337981) [(2, 3), (3, 1), (15, 1)],
  term ((-151648200 : Rat) / 21337981) [(2, 3), (3, 2)],
  term ((151648200 : Rat) / 21337981) [(2, 3), (3, 2), (14, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 3), (5, 1), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 3), (5, 1), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 3), (9, 1), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 3), (9, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 3), (9, 1), (15, 1), (16, 1)],
  term ((-538372368 : Rat) / 21337981) [(2, 3), (13, 1), (14, 1), (15, 1)],
  term ((538372368 : Rat) / 21337981) [(2, 3), (13, 1), (15, 1)],
  term ((86639148 : Rat) / 21337981) [(2, 3), (14, 1)],
  term ((-170863704 : Rat) / 21337981) [(2, 3), (14, 1), (15, 2)],
  term ((118317438 : Rat) / 21337981) [(2, 3), (15, 2)],
  term ((-81891549 : Rat) / 42675962) [(2, 3), (15, 2), (16, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (14, 2)],
  term ((-2139350868 : Rat) / 21337981) [(3, 1), (5, 1), (12, 2), (15, 2)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (14, 2)],
  term ((-2139350868 : Rat) / 21337981) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((-449727246 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2)],
  term ((764020422 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((-187173297 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 2)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (14, 2), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((-449727246 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2)],
  term ((764020422 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((-187173297 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 2)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (12, 2), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (13, 2), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-675034317 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (14, 2)],
  term ((1232362710 : Rat) / 21337981) [(3, 1), (12, 2), (13, 1), (15, 2)],
  term ((-204147837 : Rat) / 21337981) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1259527923 : Rat) / 21337981) [(3, 1), (12, 2), (14, 2), (15, 1)],
  term ((193635720 : Rat) / 21337981) [(3, 1), (12, 2), (15, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((204341661 : Rat) / 3048283) [(3, 1), (12, 2), (15, 3)],
  term ((-204147837 : Rat) / 21337981) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1259527923 : Rat) / 21337981) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((193635720 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((204341661 : Rat) / 3048283) [(3, 1), (13, 2), (15, 3)],
  term ((-675034317 : Rat) / 21337981) [(3, 1), (13, 3)],
  term ((663660702 : Rat) / 21337981) [(3, 1), (13, 3), (14, 1)],
  term ((30329640 : Rat) / 21337981) [(3, 1), (13, 3), (14, 2)],
  term ((1232362710 : Rat) / 21337981) [(3, 1), (13, 3), (15, 2)],
  term ((-126641682 : Rat) / 21337981) [(3, 2)],
  term ((1800091512 : Rat) / 21337981) [(3, 2), (5, 1), (12, 2), (15, 1)],
  term ((1800091512 : Rat) / 21337981) [(3, 2), (5, 1), (13, 2), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(3, 2), (5, 1), (14, 2), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(3, 2), (5, 1), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(3, 2), (5, 1), (15, 3)],
  term ((17753203 : Rat) / 42675962) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((61483350 : Rat) / 3048283) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17769393 : Rat) / 3048283) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((-6244851 : Rat) / 435469) [(3, 2), (9, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-49389993 : Rat) / 3048283) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(3, 2), (11, 1), (15, 3)],
  term ((-993495537 : Rat) / 21337981) [(3, 2), (12, 2)],
  term ((-1387980684 : Rat) / 21337981) [(3, 2), (12, 2), (13, 1), (15, 1)],
  term ((993495537 : Rat) / 21337981) [(3, 2), (12, 2), (14, 1)],
  term ((75824100 : Rat) / 21337981) [(3, 2), (12, 2), (14, 2)],
  term ((-1476274644 : Rat) / 21337981) [(3, 2), (12, 2), (15, 2)],
  term ((-993495537 : Rat) / 21337981) [(3, 2), (13, 2)],
  term ((993495537 : Rat) / 21337981) [(3, 2), (13, 2), (14, 1)],
  term ((75824100 : Rat) / 21337981) [(3, 2), (13, 2), (14, 2)],
  term ((-1476274644 : Rat) / 21337981) [(3, 2), (13, 2), (15, 2)],
  term ((-1387980684 : Rat) / 21337981) [(3, 2), (13, 3), (15, 1)],
  term ((-900045756 : Rat) / 21337981) [(3, 3), (5, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 3), (5, 1), (14, 2)],
  term ((2139350868 : Rat) / 21337981) [(3, 3), (5, 1), (15, 2)],
  term ((449727246 : Rat) / 21337981) [(3, 3), (9, 1)],
  term ((-764020422 : Rat) / 21337981) [(3, 3), (9, 1), (14, 1)],
  term ((187173297 : Rat) / 21337981) [(3, 3), (9, 1), (14, 1), (16, 1)],
  term ((314293176 : Rat) / 21337981) [(3, 3), (9, 1), (14, 2)],
  term ((-81891549 : Rat) / 21337981) [(3, 3), (9, 1), (14, 2), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 3), (9, 1), (16, 1)],
  term ((663660702 : Rat) / 21337981) [(3, 3), (11, 1), (14, 2)],
  term ((663660702 : Rat) / 21337981) [(3, 3), (11, 1), (15, 2)],
  term ((-151648200 : Rat) / 21337981) [(3, 3), (12, 2), (15, 1)],
  term ((675034317 : Rat) / 21337981) [(3, 3), (13, 1)],
  term ((-663660702 : Rat) / 21337981) [(3, 3), (13, 1), (14, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 3), (13, 1), (14, 2)],
  term ((-1232362710 : Rat) / 21337981) [(3, 3), (13, 1), (15, 2)],
  term ((-151648200 : Rat) / 21337981) [(3, 3), (13, 2), (15, 1)],
  term ((204147837 : Rat) / 21337981) [(3, 3), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1259527923 : Rat) / 21337981) [(3, 3), (14, 2), (15, 1)],
  term ((-193635720 : Rat) / 21337981) [(3, 3), (15, 1)],
  term ((-52640874 : Rat) / 21337981) [(3, 3), (15, 1), (16, 1)],
  term ((-204341661 : Rat) / 3048283) [(3, 3), (15, 3)],
  term ((993495537 : Rat) / 21337981) [(3, 4)],
  term ((-1800091512 : Rat) / 21337981) [(3, 4), (5, 1), (15, 1)],
  term ((1387980684 : Rat) / 21337981) [(3, 4), (13, 1), (15, 1)],
  term ((-993495537 : Rat) / 21337981) [(3, 4), (14, 1)],
  term ((-75824100 : Rat) / 21337981) [(3, 4), (14, 2)],
  term ((1476274644 : Rat) / 21337981) [(3, 4), (15, 2)],
  term ((151648200 : Rat) / 21337981) [(3, 5), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (12, 2), (14, 2), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (12, 2), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (12, 2), (15, 3)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (13, 2), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (13, 2), (15, 3)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-61483350 : Rat) / 3048283) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((17769393 : Rat) / 3048283) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((6244851 : Rat) / 435469) [(9, 1), (12, 2), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-61483350 : Rat) / 3048283) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((17769393 : Rat) / 3048283) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((6244851 : Rat) / 435469) [(9, 1), (13, 2), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 3), (16, 1)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (12, 2), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (13, 2), (15, 3)],
  term ((126641682 : Rat) / 21337981) [(12, 2)],
  term ((126641682 : Rat) / 21337981) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YYYNN_block_09_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_09_0000_0099
      rs_R009_ueqv_R009YYYNN_block_09_0000_0099 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
