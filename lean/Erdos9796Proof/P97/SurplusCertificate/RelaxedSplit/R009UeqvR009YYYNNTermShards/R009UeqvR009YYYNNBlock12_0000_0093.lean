/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 12:0-93

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(2, 1)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0000 : Poly :=
[
  term ((120724407 : Rat) / 42675962) []
]

/-- Partial product 0 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0000 : Poly :=
[
  term ((120724407 : Rat) / 42675962) [],
  term ((-120724407 : Rat) / 21337981) [(2, 1)],
  term ((120724407 : Rat) / 21337981) [(2, 1), (14, 1)],
  term ((120724407 : Rat) / 21337981) [(3, 1), (15, 1)],
  term ((-120724407 : Rat) / 42675962) [(14, 2)],
  term ((-120724407 : Rat) / 42675962) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0000_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0000
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0001 : Poly :=
[
  term ((5197455 : Rat) / 3048283) [(0, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0001 : Poly :=
[
  term ((5197455 : Rat) / 3048283) [(0, 1)],
  term ((-10394910 : Rat) / 3048283) [(0, 1), (2, 1)],
  term ((10394910 : Rat) / 3048283) [(0, 1), (2, 1), (14, 1)],
  term ((10394910 : Rat) / 3048283) [(0, 1), (3, 1), (15, 1)],
  term ((-5197455 : Rat) / 3048283) [(0, 1), (14, 2)],
  term ((-5197455 : Rat) / 3048283) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0001_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0001
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0002 : Poly :=
[
  term ((-14208318 : Rat) / 3048283) [(0, 1), (2, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0002 : Poly :=
[
  term ((-14208318 : Rat) / 3048283) [(0, 1), (2, 1)],
  term ((-28416636 : Rat) / 3048283) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((14208318 : Rat) / 3048283) [(0, 1), (2, 1), (14, 2)],
  term ((14208318 : Rat) / 3048283) [(0, 1), (2, 1), (15, 2)],
  term ((28416636 : Rat) / 3048283) [(0, 1), (2, 2)],
  term ((-28416636 : Rat) / 3048283) [(0, 1), (2, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0002_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0002
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0003 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0003 : Poly :=
[
  term ((-1909404 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0003_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0003
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0004 : Poly :=
[
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0004 : Poly :=
[
  term ((-954702 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0004_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0004
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0005 : Poly :=
[
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0005 : Poly :=
[
  term ((3818808 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (13, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0005_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0005
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0006 : Poly :=
[
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0006 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0006_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0006
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0007 : Poly :=
[
  term ((1383772122 : Rat) / 21337981) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 7 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0007 : Poly :=
[
  term ((2767544244 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-2767544244 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((-1383772122 : Rat) / 21337981) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((1383772122 : Rat) / 21337981) [(0, 1), (3, 1), (15, 1)],
  term ((-1383772122 : Rat) / 21337981) [(0, 1), (3, 1), (15, 3)],
  term ((2767544244 : Rat) / 21337981) [(0, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0007_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0007
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0008 : Poly :=
[
  term ((-917671437 : Rat) / 21337981) [(0, 1), (3, 2)]
]

/-- Partial product 8 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0008 : Poly :=
[
  term ((1835342874 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2)],
  term ((-1835342874 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((-917671437 : Rat) / 21337981) [(0, 1), (3, 2)],
  term ((917671437 : Rat) / 21337981) [(0, 1), (3, 2), (14, 2)],
  term ((917671437 : Rat) / 21337981) [(0, 1), (3, 2), (15, 2)],
  term ((-1835342874 : Rat) / 21337981) [(0, 1), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0008_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0008
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0009 : Poly :=
[
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0009 : Poly :=
[
  term ((41636646 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0009_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0009
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0010 : Poly :=
[
  term ((-20818323 : Rat) / 42675962) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0010 : Poly :=
[
  term ((-20818323 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0010_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0010
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0011 : Poly :=
[
  term ((-41636646 : Rat) / 21337981) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 11 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0011 : Poly :=
[
  term ((-83273292 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((83273292 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (13, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0011_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0011
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0012 : Poly :=
[
  term ((20818323 : Rat) / 42675962) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0012 : Poly :=
[
  term ((20818323 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0012_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0012
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0013 : Poly :=
[
  term ((-399196080 : Rat) / 21337981) [(0, 1), (15, 2)]
]

/-- Partial product 13 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0013 : Poly :=
[
  term ((-798392160 : Rat) / 21337981) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((798392160 : Rat) / 21337981) [(0, 1), (2, 1), (15, 2)],
  term ((-798392160 : Rat) / 21337981) [(0, 1), (3, 1), (15, 3)],
  term ((399196080 : Rat) / 21337981) [(0, 1), (14, 2), (15, 2)],
  term ((-399196080 : Rat) / 21337981) [(0, 1), (15, 2)],
  term ((399196080 : Rat) / 21337981) [(0, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0013_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0013
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0014 : Poly :=
[
  term ((1641991419 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 14 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0014 : Poly :=
[
  term ((1641991419 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)],
  term ((-1641991419 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-1641991419 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((3283982838 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-3283982838 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1)],
  term ((3283982838 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0014_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0014
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0015 : Poly :=
[
  term ((-835645473 : Rat) / 21337981) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 15 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0015 : Poly :=
[
  term ((-1671290946 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((835645473 : Rat) / 21337981) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-835645473 : Rat) / 21337981) [(1, 1), (2, 1), (15, 1)],
  term ((835645473 : Rat) / 21337981) [(1, 1), (2, 1), (15, 3)],
  term ((-1671290946 : Rat) / 21337981) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((1671290946 : Rat) / 21337981) [(1, 1), (2, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0015_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0015
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0016 : Poly :=
[
  term ((-61546176 : Rat) / 21337981) [(1, 1), (3, 1)]
]

/-- Partial product 16 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0016 : Poly :=
[
  term ((123092352 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)],
  term ((-123092352 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-61546176 : Rat) / 21337981) [(1, 1), (3, 1)],
  term ((61546176 : Rat) / 21337981) [(1, 1), (3, 1), (14, 2)],
  term ((61546176 : Rat) / 21337981) [(1, 1), (3, 1), (15, 2)],
  term ((-123092352 : Rat) / 21337981) [(1, 1), (3, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0016_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0016
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0017 : Poly :=
[
  term ((837660906 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 17 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0017 : Poly :=
[
  term ((1675321812 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((837660906 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0017_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0017
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0018 : Poly :=
[
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 18 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0018 : Poly :=
[
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((3350643624 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0018_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0018
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0019 : Poly :=
[
  term ((-1042781202 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 19 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0019 : Poly :=
[
  term ((2085562404 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-2085562404 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-1042781202 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1)],
  term ((1042781202 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((1042781202 : Rat) / 21337981) [(1, 1), (3, 1), (14, 3)],
  term ((-2085562404 : Rat) / 21337981) [(1, 1), (3, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0019_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0019
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0020 : Poly :=
[
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1)]
]

/-- Partial product 20 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0020 : Poly :=
[
  term ((2897279928 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1)],
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (14, 2)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (15, 2)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0020_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0020
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0021 : Poly :=
[
  term ((2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1)]
]

/-- Partial product 21 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0021 : Poly :=
[
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1), (14, 1)],
  term ((2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0021_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0021
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0022 : Poly :=
[
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1)]
]

/-- Partial product 22 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0022 : Poly :=
[
  term ((67598721 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 1), (14, 2)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0022_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0022
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0023 : Poly :=
[
  term ((67598721 : Rat) / 85351924) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 23 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0023 : Poly :=
[
  term ((67598721 : Rat) / 42675962) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0023_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0023
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0024 : Poly :=
[
  term ((67598721 : Rat) / 21337981) [(1, 1), (13, 1)]
]

/-- Partial product 24 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0024 : Poly :=
[
  term ((-135197442 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (13, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (13, 1), (14, 2)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0024_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0024
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0025 : Poly :=
[
  term ((-67598721 : Rat) / 85351924) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0025 : Poly :=
[
  term ((-67598721 : Rat) / 42675962) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0025_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0025
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0026 : Poly :=
[
  term ((599681736 : Rat) / 21337981) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 26 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0026 : Poly :=
[
  term ((-1199363472 : Rat) / 21337981) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((1199363472 : Rat) / 21337981) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((1199363472 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((599681736 : Rat) / 21337981) [(1, 1), (14, 1), (15, 1)],
  term ((-599681736 : Rat) / 21337981) [(1, 1), (14, 1), (15, 3)],
  term ((-599681736 : Rat) / 21337981) [(1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0026_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0026
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0027 : Poly :=
[
  term ((2757420 : Rat) / 3048283) [(1, 1), (15, 1)]
]

/-- Partial product 27 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0027 : Poly :=
[
  term ((5514840 : Rat) / 3048283) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-5514840 : Rat) / 3048283) [(1, 1), (2, 1), (15, 1)],
  term ((5514840 : Rat) / 3048283) [(1, 1), (3, 1), (15, 2)],
  term ((-2757420 : Rat) / 3048283) [(1, 1), (14, 2), (15, 1)],
  term ((2757420 : Rat) / 3048283) [(1, 1), (15, 1)],
  term ((-2757420 : Rat) / 3048283) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0027_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0027
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0028 : Poly :=
[
  term ((147879198 : Rat) / 21337981) [(2, 1)]
]

/-- Partial product 28 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0028 : Poly :=
[
  term ((147879198 : Rat) / 21337981) [(2, 1)],
  term ((295758396 : Rat) / 21337981) [(2, 1), (3, 1), (15, 1)],
  term ((-147879198 : Rat) / 21337981) [(2, 1), (14, 2)],
  term ((-147879198 : Rat) / 21337981) [(2, 1), (15, 2)],
  term ((-295758396 : Rat) / 21337981) [(2, 2)],
  term ((295758396 : Rat) / 21337981) [(2, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0028_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0028
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0029 : Poly :=
[
  term ((945540216 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 29 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0029 : Poly :=
[
  term ((945540216 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1)],
  term ((-945540216 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((-945540216 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((1891080432 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-1891080432 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1)],
  term ((1891080432 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0029_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0029
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0030 : Poly :=
[
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

/-- Partial product 30 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0030 : Poly :=
[
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 4)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (15, 3)],
  term ((-3600183024 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((3600183024 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0030_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0030
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0031 : Poly :=
[
  term ((-998617086 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 31 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0031 : Poly :=
[
  term ((-998617086 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1)],
  term ((998617086 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((998617086 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-1997234172 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((1997234172 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1)],
  term ((-1997234172 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0031_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0031
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0032 : Poly :=
[
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2)]
]

/-- Partial product 32 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0032 : Poly :=
[
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 2), (15, 2)],
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 4)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (15, 3)],
  term ((7200366048 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7200366048 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0032_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0032
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0033 : Poly :=
[
  term ((900045756 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 33 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0033 : Poly :=
[
  term ((900045756 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-900045756 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-900045756 : Rat) / 21337981) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1), (15, 2)],
  term ((-1800091512 : Rat) / 21337981) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 2), (3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0033_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0033
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0034 : Poly :=
[
  term ((-2108509461 : Rat) / 21337981) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 34 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0034 : Poly :=
[
  term ((2108509461 : Rat) / 21337981) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-2108509461 : Rat) / 21337981) [(2, 1), (3, 1), (15, 1)],
  term ((2108509461 : Rat) / 21337981) [(2, 1), (3, 1), (15, 3)],
  term ((-4217018922 : Rat) / 21337981) [(2, 1), (3, 2), (15, 2)],
  term ((-4217018922 : Rat) / 21337981) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((4217018922 : Rat) / 21337981) [(2, 2), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0034_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0034
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0035 : Poly :=
[
  term ((-701544105 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 35 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0035 : Poly :=
[
  term ((-1403088210 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((701544105 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-701544105 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1)],
  term ((701544105 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)],
  term ((-1403088210 : Rat) / 21337981) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((1403088210 : Rat) / 21337981) [(2, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0035_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0035
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0036 : Poly :=
[
  term ((81891549 : Rat) / 42675962) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0036 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0036_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0036
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0037 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)]
]

/-- Partial product 37 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0037 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 4)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 3)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (9, 1), (15, 5)],
  term ((2478610224 : Rat) / 21337981) [(2, 2), (9, 1), (14, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0037_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0037
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0038 : Poly :=
[
  term ((798590538 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 38 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0038 : Poly :=
[
  term ((1597181076 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-798590538 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((798590538 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)],
  term ((-798590538 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)],
  term ((1597181076 : Rat) / 21337981) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1597181076 : Rat) / 21337981) [(2, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0038_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0038
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0039 : Poly :=
[
  term ((-81891549 : Rat) / 42675962) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0039 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0039_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0039
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0040 : Poly :=
[
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)]
]

/-- Partial product 40 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0040 : Poly :=
[
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 4)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (15, 5)],
  term ((-4957220448 : Rat) / 21337981) [(2, 2), (13, 1), (14, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(2, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0040_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0040
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0041 : Poly :=
[
  term ((-162800091 : Rat) / 21337981) [(2, 1), (14, 1)]
]

/-- Partial product 41 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0041 : Poly :=
[
  term ((-325600182 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-162800091 : Rat) / 21337981) [(2, 1), (14, 1)],
  term ((162800091 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((162800091 : Rat) / 21337981) [(2, 1), (14, 3)],
  term ((325600182 : Rat) / 21337981) [(2, 2), (14, 1)],
  term ((-325600182 : Rat) / 21337981) [(2, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0041_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0041
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0042 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)]
]

/-- Partial product 42 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0042 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-619652556 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (14, 1), (15, 4)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (14, 3), (15, 2)],
  term ((1239305112 : Rat) / 21337981) [(2, 2), (14, 1), (15, 2)],
  term ((-1239305112 : Rat) / 21337981) [(2, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0042_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0042
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0043 : Poly :=
[
  term ((150672276 : Rat) / 3048283) [(2, 1), (15, 2)]
]

/-- Partial product 43 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0043 : Poly :=
[
  term ((301344552 : Rat) / 3048283) [(2, 1), (3, 1), (15, 3)],
  term ((-150672276 : Rat) / 3048283) [(2, 1), (14, 2), (15, 2)],
  term ((150672276 : Rat) / 3048283) [(2, 1), (15, 2)],
  term ((-150672276 : Rat) / 3048283) [(2, 1), (15, 4)],
  term ((301344552 : Rat) / 3048283) [(2, 2), (14, 1), (15, 2)],
  term ((-301344552 : Rat) / 3048283) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0043_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0043
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0044 : Poly :=
[
  term ((-22747230 : Rat) / 21337981) [(2, 2)]
]

/-- Partial product 44 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0044 : Poly :=
[
  term ((-22747230 : Rat) / 21337981) [(2, 2)],
  term ((-45494460 : Rat) / 21337981) [(2, 2), (3, 1), (15, 1)],
  term ((22747230 : Rat) / 21337981) [(2, 2), (14, 2)],
  term ((22747230 : Rat) / 21337981) [(2, 2), (15, 2)],
  term ((45494460 : Rat) / 21337981) [(2, 3)],
  term ((-45494460 : Rat) / 21337981) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0044_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0044
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0045 : Poly :=
[
  term ((-1800091512 : Rat) / 21337981) [(3, 1), (5, 1), (10, 1)]
]

/-- Partial product 45 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0045 : Poly :=
[
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (10, 1)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1)],
  term ((-1800091512 : Rat) / 21337981) [(3, 1), (5, 1), (10, 1)],
  term ((1800091512 : Rat) / 21337981) [(3, 1), (5, 1), (10, 1), (14, 2)],
  term ((1800091512 : Rat) / 21337981) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((-3600183024 : Rat) / 21337981) [(3, 2), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0045_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0045
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0046 : Poly :=
[
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 46 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0046 : Poly :=
[
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (14, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (14, 2)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 3)],
  term ((1800091512 : Rat) / 21337981) [(3, 2), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0046_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0046
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0047 : Poly :=
[
  term ((-640772955 : Rat) / 21337981) [(3, 1), (9, 1)]
]

/-- Partial product 47 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0047 : Poly :=
[
  term ((1281545910 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1)],
  term ((-1281545910 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-640772955 : Rat) / 21337981) [(3, 1), (9, 1)],
  term ((640772955 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2)],
  term ((640772955 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)],
  term ((-1281545910 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0047_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0047
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0048 : Poly :=
[
  term ((-30309768 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 48 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0048 : Poly :=
[
  term ((-60619536 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((30309768 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-30309768 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((30309768 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-60619536 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0048_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0048
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0049 : Poly :=
[
  term ((-15824691 : Rat) / 3048283) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 49 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0049 : Poly :=
[
  term ((31649382 : Rat) / 3048283) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-31649382 : Rat) / 3048283) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((-15824691 : Rat) / 3048283) [(3, 1), (9, 1), (14, 1)],
  term ((15824691 : Rat) / 3048283) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((15824691 : Rat) / 3048283) [(3, 1), (9, 1), (14, 3)],
  term ((-31649382 : Rat) / 3048283) [(3, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0049_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0049
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0050 : Poly :=
[
  term ((-81891549 : Rat) / 42675962) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 50 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0050 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (9, 1), (14, 3), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0050_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0050
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0051 : Poly :=
[
  term ((1362643488 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 51 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0051 : Poly :=
[
  term ((2725286976 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-2725286976 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((-1362643488 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((1362643488 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)],
  term ((-1362643488 : Rat) / 21337981) [(3, 1), (9, 1), (15, 4)],
  term ((2725286976 : Rat) / 21337981) [(3, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0051_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0051
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0052 : Poly :=
[
  term ((52640874 : Rat) / 21337981) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 52 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0052 : Poly :=
[
  term ((105281748 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (9, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0052_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0052
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0053 : Poly :=
[
  term ((1387980684 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 53 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0053 : Poly :=
[
  term ((-2775961368 : Rat) / 21337981) [(2, 1), (3, 1), (10, 1), (13, 1)],
  term ((2775961368 : Rat) / 21337981) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((1387980684 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1)],
  term ((-1387980684 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1387980684 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((2775961368 : Rat) / 21337981) [(3, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0053_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0053
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0054 : Poly :=
[
  term ((221728392 : Rat) / 3048283) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 54 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0054 : Poly :=
[
  term ((443456784 : Rat) / 3048283) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-443456784 : Rat) / 3048283) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-221728392 : Rat) / 3048283) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((221728392 : Rat) / 3048283) [(3, 1), (10, 1), (15, 1)],
  term ((-221728392 : Rat) / 3048283) [(3, 1), (10, 1), (15, 3)],
  term ((443456784 : Rat) / 3048283) [(3, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0054_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0054
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0055 : Poly :=
[
  term ((-933932502 : Rat) / 21337981) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 55 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0055 : Poly :=
[
  term ((-1867865004 : Rat) / 21337981) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((1867865004 : Rat) / 21337981) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((933932502 : Rat) / 21337981) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-933932502 : Rat) / 21337981) [(3, 1), (12, 1), (15, 1)],
  term ((933932502 : Rat) / 21337981) [(3, 1), (12, 1), (15, 3)],
  term ((-1867865004 : Rat) / 21337981) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0055_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0055
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0056 : Poly :=
[
  term ((1083072906 : Rat) / 21337981) [(3, 1), (13, 1)]
]

/-- Partial product 56 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0056 : Poly :=
[
  term ((-2166145812 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1)],
  term ((2166145812 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((1083072906 : Rat) / 21337981) [(3, 1), (13, 1)],
  term ((-1083072906 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2)],
  term ((-1083072906 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)],
  term ((2166145812 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0056_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0056
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0057 : Poly :=
[
  term ((-131781078 : Rat) / 3048283) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 57 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0057 : Poly :=
[
  term ((263562156 : Rat) / 3048283) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-263562156 : Rat) / 3048283) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-131781078 : Rat) / 3048283) [(3, 1), (13, 1), (14, 1)],
  term ((131781078 : Rat) / 3048283) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((131781078 : Rat) / 3048283) [(3, 1), (13, 1), (14, 3)],
  term ((-263562156 : Rat) / 3048283) [(3, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0057_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0057
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0058 : Poly :=
[
  term ((81891549 : Rat) / 42675962) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 58 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0058 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0058_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0058
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0059 : Poly :=
[
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 59 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0059 : Poly :=
[
  term ((-5450573952 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((5450573952 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2725286976 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (13, 1), (15, 4)],
  term ((-5450573952 : Rat) / 21337981) [(3, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0059_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0059
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0060 : Poly :=
[
  term ((-52640874 : Rat) / 21337981) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 60 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0060 : Poly :=
[
  term ((-105281748 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (13, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0060_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0060
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0061 : Poly :=
[
  term ((60619536 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 61 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0061 : Poly :=
[
  term ((121239072 : Rat) / 21337981) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-121239072 : Rat) / 21337981) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (13, 2), (15, 3)],
  term ((121239072 : Rat) / 21337981) [(3, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0061_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0061
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0062 : Poly :=
[
  term ((-1593170532 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 62 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0062 : Poly :=
[
  term ((3186341064 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-3186341064 : Rat) / 21337981) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-1593170532 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)],
  term ((1593170532 : Rat) / 21337981) [(3, 1), (14, 1), (15, 3)],
  term ((1593170532 : Rat) / 21337981) [(3, 1), (14, 3), (15, 1)],
  term ((-3186341064 : Rat) / 21337981) [(3, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0062_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0062
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0063 : Poly :=
[
  term ((406984518 : Rat) / 21337981) [(3, 1), (15, 1)]
]

/-- Partial product 63 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0063 : Poly :=
[
  term ((813969036 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-813969036 : Rat) / 21337981) [(2, 1), (3, 1), (15, 1)],
  term ((-406984518 : Rat) / 21337981) [(3, 1), (14, 2), (15, 1)],
  term ((406984518 : Rat) / 21337981) [(3, 1), (15, 1)],
  term ((-406984518 : Rat) / 21337981) [(3, 1), (15, 3)],
  term ((813969036 : Rat) / 21337981) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0063_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0063
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0064 : Poly :=
[
  term ((-75824100 : Rat) / 21337981) [(3, 2)]
]

/-- Partial product 64 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0064 : Poly :=
[
  term ((151648200 : Rat) / 21337981) [(2, 1), (3, 2)],
  term ((-151648200 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1)],
  term ((-75824100 : Rat) / 21337981) [(3, 2)],
  term ((75824100 : Rat) / 21337981) [(3, 2), (14, 2)],
  term ((75824100 : Rat) / 21337981) [(3, 2), (15, 2)],
  term ((-151648200 : Rat) / 21337981) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0064_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0064
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0065 : Poly :=
[
  term ((15164820 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1)]
]

/-- Partial product 65 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0065 : Poly :=
[
  term ((-30329640 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((30329640 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (13, 1), (14, 1)],
  term ((15164820 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1)],
  term ((-15164820 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((-15164820 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0065_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0065
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0066 : Poly :=
[
  term ((733232736 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1)]
]

/-- Partial product 66 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0066 : Poly :=
[
  term ((1466465472 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1466465472 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-733232736 : Rat) / 21337981) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((733232736 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1)],
  term ((-733232736 : Rat) / 21337981) [(3, 2), (9, 1), (15, 3)],
  term ((1466465472 : Rat) / 21337981) [(3, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0066_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0066
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0067 : Poly :=
[
  term ((151648200 : Rat) / 21337981) [(3, 2), (10, 1)]
]

/-- Partial product 67 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0067 : Poly :=
[
  term ((-303296400 : Rat) / 21337981) [(2, 1), (3, 2), (10, 1)],
  term ((303296400 : Rat) / 21337981) [(2, 1), (3, 2), (10, 1), (14, 1)],
  term ((151648200 : Rat) / 21337981) [(3, 2), (10, 1)],
  term ((-151648200 : Rat) / 21337981) [(3, 2), (10, 1), (14, 2)],
  term ((-151648200 : Rat) / 21337981) [(3, 2), (10, 1), (15, 2)],
  term ((303296400 : Rat) / 21337981) [(3, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0067_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0067
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0068 : Poly :=
[
  term ((-151648200 : Rat) / 21337981) [(3, 2), (12, 1)]
]

/-- Partial product 68 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0068 : Poly :=
[
  term ((303296400 : Rat) / 21337981) [(2, 1), (3, 2), (12, 1)],
  term ((-303296400 : Rat) / 21337981) [(2, 1), (3, 2), (12, 1), (14, 1)],
  term ((-151648200 : Rat) / 21337981) [(3, 2), (12, 1)],
  term ((151648200 : Rat) / 21337981) [(3, 2), (12, 1), (14, 2)],
  term ((151648200 : Rat) / 21337981) [(3, 2), (12, 1), (15, 2)],
  term ((-303296400 : Rat) / 21337981) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0068_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0068
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0069 : Poly :=
[
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)]
]

/-- Partial product 69 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0069 : Poly :=
[
  term ((-2932930944 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((2932930944 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1466465472 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (13, 1), (15, 3)],
  term ((-2932930944 : Rat) / 21337981) [(3, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0069_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0069
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0070 : Poly :=
[
  term ((-30329640 : Rat) / 21337981) [(3, 2), (13, 2)]
]

/-- Partial product 70 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0070 : Poly :=
[
  term ((60659280 : Rat) / 21337981) [(2, 1), (3, 2), (13, 2)],
  term ((-60659280 : Rat) / 21337981) [(2, 1), (3, 2), (13, 2), (14, 1)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (13, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (13, 2), (14, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (13, 2), (15, 2)],
  term ((-60659280 : Rat) / 21337981) [(3, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0070_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0070
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0071 : Poly :=
[
  term ((993495537 : Rat) / 21337981) [(3, 2), (14, 1)]
]

/-- Partial product 71 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0071 : Poly :=
[
  term ((-1986991074 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1)],
  term ((1986991074 : Rat) / 21337981) [(2, 1), (3, 2), (14, 2)],
  term ((993495537 : Rat) / 21337981) [(3, 2), (14, 1)],
  term ((-993495537 : Rat) / 21337981) [(3, 2), (14, 1), (15, 2)],
  term ((-993495537 : Rat) / 21337981) [(3, 2), (14, 3)],
  term ((1986991074 : Rat) / 21337981) [(3, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0071_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0071
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0072 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 72 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0072 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (10, 1), (15, 1)],
  term ((2478610224 : Rat) / 21337981) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(5, 1), (10, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0072_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0072
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0073 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 73 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0073 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (14, 1), (15, 3)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0073_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0073
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0074 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1)]
]

/-- Partial product 74 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0074 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(2, 1), (9, 1), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-17753203 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 2)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0074_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0074
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0075 : Poly :=
[
  term ((17753203 : Rat) / 85351924) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 75 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0075 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0075_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0075
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0076 : Poly :=
[
  term ((309826278 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 76 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0076 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((309826278 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)],
  term ((-309826278 : Rat) / 21337981) [(9, 1), (14, 1), (15, 3)],
  term ((-309826278 : Rat) / 21337981) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0076_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0076
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0077 : Poly :=
[
  term ((15563619 : Rat) / 870938) [(9, 1), (15, 1)]
]

/-- Partial product 77 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0077 : Poly :=
[
  term ((15563619 : Rat) / 435469) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-15563619 : Rat) / 435469) [(2, 1), (9, 1), (15, 1)],
  term ((15563619 : Rat) / 435469) [(3, 1), (9, 1), (15, 2)],
  term ((-15563619 : Rat) / 870938) [(9, 1), (14, 2), (15, 1)],
  term ((15563619 : Rat) / 870938) [(9, 1), (15, 1)],
  term ((-15563619 : Rat) / 870938) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0077_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0077
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0078 : Poly :=
[
  term ((-142964775 : Rat) / 85351924) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0078 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0078_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0078
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0079 : Poly :=
[
  term ((-1239305112 : Rat) / 21337981) [(9, 1), (15, 3)]
]

/-- Partial product 79 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0079 : Poly :=
[
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(3, 1), (9, 1), (15, 4)],
  term ((1239305112 : Rat) / 21337981) [(9, 1), (14, 2), (15, 3)],
  term ((-1239305112 : Rat) / 21337981) [(9, 1), (15, 3)],
  term ((1239305112 : Rat) / 21337981) [(9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0079_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0079
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0080 : Poly :=
[
  term ((86639148 : Rat) / 21337981) [(10, 1)]
]

/-- Partial product 80 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0080 : Poly :=
[
  term ((-173278296 : Rat) / 21337981) [(2, 1), (10, 1)],
  term ((173278296 : Rat) / 21337981) [(2, 1), (10, 1), (14, 1)],
  term ((173278296 : Rat) / 21337981) [(3, 1), (10, 1), (15, 1)],
  term ((86639148 : Rat) / 21337981) [(10, 1)],
  term ((-86639148 : Rat) / 21337981) [(10, 1), (14, 2)],
  term ((-86639148 : Rat) / 21337981) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0080_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0080
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0081 : Poly :=
[
  term ((-538372368 : Rat) / 21337981) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 81 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0081 : Poly :=
[
  term ((-1076744736 : Rat) / 21337981) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1076744736 : Rat) / 21337981) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1076744736 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((538372368 : Rat) / 21337981) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-538372368 : Rat) / 21337981) [(10, 1), (13, 1), (15, 1)],
  term ((538372368 : Rat) / 21337981) [(10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0081_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0081
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0082 : Poly :=
[
  term ((-170863704 : Rat) / 21337981) [(10, 1), (15, 2)]
]

/-- Partial product 82 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0082 : Poly :=
[
  term ((-341727408 : Rat) / 21337981) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((341727408 : Rat) / 21337981) [(2, 1), (10, 1), (15, 2)],
  term ((-341727408 : Rat) / 21337981) [(3, 1), (10, 1), (15, 3)],
  term ((170863704 : Rat) / 21337981) [(10, 1), (14, 2), (15, 2)],
  term ((-170863704 : Rat) / 21337981) [(10, 1), (15, 2)],
  term ((170863704 : Rat) / 21337981) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0082_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0082
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0083 : Poly :=
[
  term ((102163176 : Rat) / 21337981) [(12, 1), (15, 2)]
]

/-- Partial product 83 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0083 : Poly :=
[
  term ((204326352 : Rat) / 21337981) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-204326352 : Rat) / 21337981) [(2, 1), (12, 1), (15, 2)],
  term ((204326352 : Rat) / 21337981) [(3, 1), (12, 1), (15, 3)],
  term ((-102163176 : Rat) / 21337981) [(12, 1), (14, 2), (15, 2)],
  term ((102163176 : Rat) / 21337981) [(12, 1), (15, 2)],
  term ((-102163176 : Rat) / 21337981) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0083_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0083
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0084 : Poly :=
[
  term ((-40640094 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 84 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0084 : Poly :=
[
  term ((81280188 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-81280188 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-81280188 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-40640094 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1)],
  term ((40640094 : Rat) / 21337981) [(13, 1), (14, 1), (15, 3)],
  term ((40640094 : Rat) / 21337981) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0084_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0084
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0085 : Poly :=
[
  term ((-96140070 : Rat) / 3048283) [(13, 1), (15, 1)]
]

/-- Partial product 85 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0085 : Poly :=
[
  term ((-192280140 : Rat) / 3048283) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((192280140 : Rat) / 3048283) [(2, 1), (13, 1), (15, 1)],
  term ((-192280140 : Rat) / 3048283) [(3, 1), (13, 1), (15, 2)],
  term ((96140070 : Rat) / 3048283) [(13, 1), (14, 2), (15, 1)],
  term ((-96140070 : Rat) / 3048283) [(13, 1), (15, 1)],
  term ((96140070 : Rat) / 3048283) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0085_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0085
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0086 : Poly :=
[
  term ((142964775 : Rat) / 85351924) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 86 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0086 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 85351924) [(13, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 85351924) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0086_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0086
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0087 : Poly :=
[
  term ((2478610224 : Rat) / 21337981) [(13, 1), (15, 3)]
]

/-- Partial product 87 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0087 : Poly :=
[
  term ((4957220448 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((-4957220448 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)],
  term ((4957220448 : Rat) / 21337981) [(3, 1), (13, 1), (15, 4)],
  term ((-2478610224 : Rat) / 21337981) [(13, 1), (14, 2), (15, 3)],
  term ((2478610224 : Rat) / 21337981) [(13, 1), (15, 3)],
  term ((-2478610224 : Rat) / 21337981) [(13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0087_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0087
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0088 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(13, 2)]
]

/-- Partial product 88 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0088 : Poly :=
[
  term ((-35506406 : Rat) / 21337981) [(2, 1), (13, 2)],
  term ((35506406 : Rat) / 21337981) [(2, 1), (13, 2), (14, 1)],
  term ((35506406 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1)],
  term ((17753203 : Rat) / 21337981) [(13, 2)],
  term ((-17753203 : Rat) / 21337981) [(13, 2), (14, 2)],
  term ((-17753203 : Rat) / 21337981) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0088_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0088
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0089 : Poly :=
[
  term ((-17753203 : Rat) / 85351924) [(13, 2), (16, 1)]
]

/-- Partial product 89 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0089 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(2, 1), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(13, 2), (14, 2), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(13, 2), (15, 2), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0089_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0089
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0090 : Poly :=
[
  term ((-296665290 : Rat) / 21337981) [(14, 1)]
]

/-- Partial product 90 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0090 : Poly :=
[
  term ((593330580 : Rat) / 21337981) [(2, 1), (14, 1)],
  term ((-593330580 : Rat) / 21337981) [(2, 1), (14, 2)],
  term ((-593330580 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)],
  term ((-296665290 : Rat) / 21337981) [(14, 1)],
  term ((296665290 : Rat) / 21337981) [(14, 1), (15, 2)],
  term ((296665290 : Rat) / 21337981) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0090_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0090
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0091 : Poly :=
[
  term ((820138212 : Rat) / 21337981) [(14, 1), (15, 2)]
]

/-- Partial product 91 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0091 : Poly :=
[
  term ((-1640276424 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((1640276424 : Rat) / 21337981) [(2, 1), (14, 2), (15, 2)],
  term ((1640276424 : Rat) / 21337981) [(3, 1), (14, 1), (15, 3)],
  term ((820138212 : Rat) / 21337981) [(14, 1), (15, 2)],
  term ((-820138212 : Rat) / 21337981) [(14, 1), (15, 4)],
  term ((-820138212 : Rat) / 21337981) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0091_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0091
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0092 : Poly :=
[
  term ((167699916 : Rat) / 21337981) [(14, 2)]
]

/-- Partial product 92 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0092 : Poly :=
[
  term ((-335399832 : Rat) / 21337981) [(2, 1), (14, 2)],
  term ((335399832 : Rat) / 21337981) [(2, 1), (14, 3)],
  term ((335399832 : Rat) / 21337981) [(3, 1), (14, 2), (15, 1)],
  term ((167699916 : Rat) / 21337981) [(14, 2)],
  term ((-167699916 : Rat) / 21337981) [(14, 2), (15, 2)],
  term ((-167699916 : Rat) / 21337981) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0092_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0092
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YYYNN_coefficient_12_0093 : Poly :=
[
  term ((-552229641 : Rat) / 21337981) [(15, 2)]
]

/-- Partial product 93 for generator 12. -/
def rs_R009_ueqv_R009YYYNN_partial_12_0093 : Poly :=
[
  term ((-1104459282 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((1104459282 : Rat) / 21337981) [(2, 1), (15, 2)],
  term ((-1104459282 : Rat) / 21337981) [(3, 1), (15, 3)],
  term ((552229641 : Rat) / 21337981) [(14, 2), (15, 2)],
  term ((-552229641 : Rat) / 21337981) [(15, 2)],
  term ((552229641 : Rat) / 21337981) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 12. -/
theorem rs_R009_ueqv_R009YYYNN_partial_12_0093_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_12_0093
        rs_R009_ueqv_R009YYYNN_generator_12_0000_0093 =
      rs_R009_ueqv_R009YYYNN_partial_12_0093 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_12_0000_0093 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_12_0000,
  rs_R009_ueqv_R009YYYNN_partial_12_0001,
  rs_R009_ueqv_R009YYYNN_partial_12_0002,
  rs_R009_ueqv_R009YYYNN_partial_12_0003,
  rs_R009_ueqv_R009YYYNN_partial_12_0004,
  rs_R009_ueqv_R009YYYNN_partial_12_0005,
  rs_R009_ueqv_R009YYYNN_partial_12_0006,
  rs_R009_ueqv_R009YYYNN_partial_12_0007,
  rs_R009_ueqv_R009YYYNN_partial_12_0008,
  rs_R009_ueqv_R009YYYNN_partial_12_0009,
  rs_R009_ueqv_R009YYYNN_partial_12_0010,
  rs_R009_ueqv_R009YYYNN_partial_12_0011,
  rs_R009_ueqv_R009YYYNN_partial_12_0012,
  rs_R009_ueqv_R009YYYNN_partial_12_0013,
  rs_R009_ueqv_R009YYYNN_partial_12_0014,
  rs_R009_ueqv_R009YYYNN_partial_12_0015,
  rs_R009_ueqv_R009YYYNN_partial_12_0016,
  rs_R009_ueqv_R009YYYNN_partial_12_0017,
  rs_R009_ueqv_R009YYYNN_partial_12_0018,
  rs_R009_ueqv_R009YYYNN_partial_12_0019,
  rs_R009_ueqv_R009YYYNN_partial_12_0020,
  rs_R009_ueqv_R009YYYNN_partial_12_0021,
  rs_R009_ueqv_R009YYYNN_partial_12_0022,
  rs_R009_ueqv_R009YYYNN_partial_12_0023,
  rs_R009_ueqv_R009YYYNN_partial_12_0024,
  rs_R009_ueqv_R009YYYNN_partial_12_0025,
  rs_R009_ueqv_R009YYYNN_partial_12_0026,
  rs_R009_ueqv_R009YYYNN_partial_12_0027,
  rs_R009_ueqv_R009YYYNN_partial_12_0028,
  rs_R009_ueqv_R009YYYNN_partial_12_0029,
  rs_R009_ueqv_R009YYYNN_partial_12_0030,
  rs_R009_ueqv_R009YYYNN_partial_12_0031,
  rs_R009_ueqv_R009YYYNN_partial_12_0032,
  rs_R009_ueqv_R009YYYNN_partial_12_0033,
  rs_R009_ueqv_R009YYYNN_partial_12_0034,
  rs_R009_ueqv_R009YYYNN_partial_12_0035,
  rs_R009_ueqv_R009YYYNN_partial_12_0036,
  rs_R009_ueqv_R009YYYNN_partial_12_0037,
  rs_R009_ueqv_R009YYYNN_partial_12_0038,
  rs_R009_ueqv_R009YYYNN_partial_12_0039,
  rs_R009_ueqv_R009YYYNN_partial_12_0040,
  rs_R009_ueqv_R009YYYNN_partial_12_0041,
  rs_R009_ueqv_R009YYYNN_partial_12_0042,
  rs_R009_ueqv_R009YYYNN_partial_12_0043,
  rs_R009_ueqv_R009YYYNN_partial_12_0044,
  rs_R009_ueqv_R009YYYNN_partial_12_0045,
  rs_R009_ueqv_R009YYYNN_partial_12_0046,
  rs_R009_ueqv_R009YYYNN_partial_12_0047,
  rs_R009_ueqv_R009YYYNN_partial_12_0048,
  rs_R009_ueqv_R009YYYNN_partial_12_0049,
  rs_R009_ueqv_R009YYYNN_partial_12_0050,
  rs_R009_ueqv_R009YYYNN_partial_12_0051,
  rs_R009_ueqv_R009YYYNN_partial_12_0052,
  rs_R009_ueqv_R009YYYNN_partial_12_0053,
  rs_R009_ueqv_R009YYYNN_partial_12_0054,
  rs_R009_ueqv_R009YYYNN_partial_12_0055,
  rs_R009_ueqv_R009YYYNN_partial_12_0056,
  rs_R009_ueqv_R009YYYNN_partial_12_0057,
  rs_R009_ueqv_R009YYYNN_partial_12_0058,
  rs_R009_ueqv_R009YYYNN_partial_12_0059,
  rs_R009_ueqv_R009YYYNN_partial_12_0060,
  rs_R009_ueqv_R009YYYNN_partial_12_0061,
  rs_R009_ueqv_R009YYYNN_partial_12_0062,
  rs_R009_ueqv_R009YYYNN_partial_12_0063,
  rs_R009_ueqv_R009YYYNN_partial_12_0064,
  rs_R009_ueqv_R009YYYNN_partial_12_0065,
  rs_R009_ueqv_R009YYYNN_partial_12_0066,
  rs_R009_ueqv_R009YYYNN_partial_12_0067,
  rs_R009_ueqv_R009YYYNN_partial_12_0068,
  rs_R009_ueqv_R009YYYNN_partial_12_0069,
  rs_R009_ueqv_R009YYYNN_partial_12_0070,
  rs_R009_ueqv_R009YYYNN_partial_12_0071,
  rs_R009_ueqv_R009YYYNN_partial_12_0072,
  rs_R009_ueqv_R009YYYNN_partial_12_0073,
  rs_R009_ueqv_R009YYYNN_partial_12_0074,
  rs_R009_ueqv_R009YYYNN_partial_12_0075,
  rs_R009_ueqv_R009YYYNN_partial_12_0076,
  rs_R009_ueqv_R009YYYNN_partial_12_0077,
  rs_R009_ueqv_R009YYYNN_partial_12_0078,
  rs_R009_ueqv_R009YYYNN_partial_12_0079,
  rs_R009_ueqv_R009YYYNN_partial_12_0080,
  rs_R009_ueqv_R009YYYNN_partial_12_0081,
  rs_R009_ueqv_R009YYYNN_partial_12_0082,
  rs_R009_ueqv_R009YYYNN_partial_12_0083,
  rs_R009_ueqv_R009YYYNN_partial_12_0084,
  rs_R009_ueqv_R009YYYNN_partial_12_0085,
  rs_R009_ueqv_R009YYYNN_partial_12_0086,
  rs_R009_ueqv_R009YYYNN_partial_12_0087,
  rs_R009_ueqv_R009YYYNN_partial_12_0088,
  rs_R009_ueqv_R009YYYNN_partial_12_0089,
  rs_R009_ueqv_R009YYYNN_partial_12_0090,
  rs_R009_ueqv_R009YYYNN_partial_12_0091,
  rs_R009_ueqv_R009YYYNN_partial_12_0092,
  rs_R009_ueqv_R009YYYNN_partial_12_0093
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_12_0000_0093 : Poly :=
[
  term ((120724407 : Rat) / 42675962) [],
  term ((5197455 : Rat) / 3048283) [(0, 1)],
  term ((-24603228 : Rat) / 3048283) [(0, 1), (2, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (9, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((3818808 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((2767544244 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-2966460696 : Rat) / 21337981) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term ((1835342874 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2)],
  term ((-1835342874 : Rat) / 21337981) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-83273292 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((83273292 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((10394910 : Rat) / 3048283) [(0, 1), (2, 1), (14, 1)],
  term ((-798392160 : Rat) / 21337981) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((14208318 : Rat) / 3048283) [(0, 1), (2, 1), (14, 2)],
  term ((897850386 : Rat) / 21337981) [(0, 1), (2, 1), (15, 2)],
  term ((28416636 : Rat) / 3048283) [(0, 1), (2, 2)],
  term ((-28416636 : Rat) / 3048283) [(0, 1), (2, 2), (14, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-5143752 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((2571876 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (13, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((-477351 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((10287504 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-2571876 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((477351 : Rat) / 435469) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term ((-1383772122 : Rat) / 21337981) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((1456536492 : Rat) / 21337981) [(0, 1), (3, 1), (15, 1)],
  term ((-2182164282 : Rat) / 21337981) [(0, 1), (3, 1), (15, 3)],
  term ((-917671437 : Rat) / 21337981) [(0, 1), (3, 2)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3818808 : Rat) / 435469) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((917671437 : Rat) / 21337981) [(0, 1), (3, 2), (14, 2)],
  term ((526459383 : Rat) / 3048283) [(0, 1), (3, 2), (15, 2)],
  term ((-1835342874 : Rat) / 21337981) [(0, 1), (3, 3), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 3)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (13, 1), (15, 1)],
  term ((20818323 : Rat) / 42675962) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (13, 1), (15, 3)],
  term ((-20818323 : Rat) / 42675962) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5197455 : Rat) / 3048283) [(0, 1), (14, 2)],
  term ((399196080 : Rat) / 21337981) [(0, 1), (14, 2), (15, 2)],
  term ((-435578265 : Rat) / 21337981) [(0, 1), (15, 2)],
  term ((399196080 : Rat) / 21337981) [(0, 1), (15, 4)],
  term ((1765083771 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1675321812 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term ((-3350643624 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((3350643624 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((1962470052 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-76072527 : Rat) / 435469) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((-3313282365 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((2897279928 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1)],
  term ((-5794559856 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (13, 1), (14, 1)],
  term ((3283982838 : Rat) / 21337981) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-135197442 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1)],
  term ((135197442 : Rat) / 21337981) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-1160759592 : Rat) / 21337981) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((2035008945 : Rat) / 21337981) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-874249353 : Rat) / 21337981) [(1, 1), (2, 1), (15, 1)],
  term ((835645473 : Rat) / 21337981) [(1, 1), (2, 1), (15, 3)],
  term ((-3283982838 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1)],
  term ((3283982838 : Rat) / 21337981) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-1671290946 : Rat) / 21337981) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((1671290946 : Rat) / 21337981) [(1, 1), (2, 2), (15, 1)],
  term ((-61546176 : Rat) / 21337981) [(1, 1), (3, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((770062185 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1540124370 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((1675321812 : Rat) / 21337981) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-1042781202 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1)],
  term ((320306382 : Rat) / 3048283) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((61546176 : Rat) / 21337981) [(1, 1), (3, 1), (14, 2)],
  term ((1042781202 : Rat) / 21337981) [(1, 1), (3, 1), (14, 3)],
  term ((100150056 : Rat) / 21337981) [(1, 1), (3, 1), (15, 2)],
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1)],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (14, 2)],
  term ((3123961776 : Rat) / 21337981) [(1, 1), (3, 2), (9, 1), (15, 2)],
  term ((2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (14, 2)],
  term ((-6247923552 : Rat) / 21337981) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-2085562404 : Rat) / 21337981) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-123092352 : Rat) / 21337981) [(1, 1), (3, 2), (15, 1)],
  term ((-2897279928 : Rat) / 21337981) [(1, 1), (3, 3), (9, 1), (15, 1)],
  term ((5794559856 : Rat) / 21337981) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 1), (14, 2)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 1), (15, 2)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (9, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (13, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (13, 1), (14, 2)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (13, 1), (15, 2)],
  term ((67598721 : Rat) / 85351924) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-67598721 : Rat) / 85351924) [(1, 1), (13, 1), (16, 1)],
  term ((599681736 : Rat) / 21337981) [(1, 1), (14, 1), (15, 1)],
  term ((-599681736 : Rat) / 21337981) [(1, 1), (14, 1), (15, 3)],
  term ((-2757420 : Rat) / 3048283) [(1, 1), (14, 2), (15, 1)],
  term ((-599681736 : Rat) / 21337981) [(1, 1), (14, 3), (15, 1)],
  term ((2757420 : Rat) / 3048283) [(1, 1), (15, 1)],
  term ((-2757420 : Rat) / 3048283) [(1, 1), (15, 3)],
  term ((27154791 : Rat) / 21337981) [(2, 1)],
  term ((3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (10, 1)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (10, 1), (14, 1)],
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (14, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1), (14, 2)],
  term ((2227086126 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1)],
  term ((-60619536 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((60619536 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1060000236 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 1)],
  term ((2725286976 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((187173297 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1167085890 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-6874006914 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((4278701736 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (15, 4)],
  term ((-105281748 : Rat) / 21337981) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-2775961368 : Rat) / 21337981) [(2, 1), (3, 1), (10, 1), (13, 1)],
  term ((2775961368 : Rat) / 21337981) [(2, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((443456784 : Rat) / 3048283) [(2, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-443456784 : Rat) / 3048283) [(2, 1), (3, 1), (10, 1), (15, 1)],
  term ((-1867865004 : Rat) / 21337981) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((1867865004 : Rat) / 21337981) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-3164762898 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1)],
  term ((4011080904 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((-5450573952 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-187173297 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-846318006 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 2), (15, 2)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((11646555138 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8557403472 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (15, 4)],
  term ((105281748 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((121239072 : Rat) / 21337981) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-121239072 : Rat) / 21337981) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((4574755674 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-2139350868 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-1077831603 : Rat) / 21337981) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-900045756 : Rat) / 21337981) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((-2626720101 : Rat) / 21337981) [(2, 1), (3, 1), (15, 1)],
  term ((4217921325 : Rat) / 21337981) [(2, 1), (3, 1), (15, 3)],
  term ((151648200 : Rat) / 21337981) [(2, 1), (3, 2)],
  term ((-30329640 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (13, 1)],
  term ((30329640 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (13, 1), (14, 1)],
  term ((1466465472 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (14, 1), (15, 1)],
  term ((60659280 : Rat) / 3048283) [(2, 1), (3, 2), (9, 1), (15, 1)],
  term ((-3600183024 : Rat) / 21337981) [(2, 1), (3, 2), (9, 1), (15, 3)],
  term ((-303296400 : Rat) / 21337981) [(2, 1), (3, 2), (10, 1)],
  term ((303296400 : Rat) / 21337981) [(2, 1), (3, 2), (10, 1), (14, 1)],
  term ((303296400 : Rat) / 21337981) [(2, 1), (3, 2), (12, 1)],
  term ((-303296400 : Rat) / 21337981) [(2, 1), (3, 2), (12, 1), (14, 1)],
  term ((-2932930944 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((935696772 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((7200366048 : Rat) / 21337981) [(2, 1), (3, 2), (13, 1), (15, 3)],
  term ((60659280 : Rat) / 21337981) [(2, 1), (3, 2), (13, 2)],
  term ((-60659280 : Rat) / 21337981) [(2, 1), (3, 2), (13, 2), (14, 1)],
  term ((-2138639274 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 2), (14, 1), (15, 2)],
  term ((1986991074 : Rat) / 21337981) [(2, 1), (3, 2), (14, 2)],
  term ((-4217018922 : Rat) / 21337981) [(2, 1), (3, 2), (15, 2)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (5, 1), (10, 1), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((17753203 : Rat) / 21337981) [(2, 1), (9, 1), (13, 1)],
  term ((-17753203 : Rat) / 21337981) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((17753203 : Rat) / 42675962) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 1), (9, 1), (14, 1), (15, 3)],
  term ((1321196661 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 3)],
  term ((-1464161436 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1)],
  term ((16061166 : Rat) / 3048283) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((4419459441 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)],
  term ((-81891549 : Rat) / 42675962) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (9, 1), (15, 5)],
  term ((-173278296 : Rat) / 21337981) [(2, 1), (10, 1)],
  term ((-1076744736 : Rat) / 21337981) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1076744736 : Rat) / 21337981) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((173278296 : Rat) / 21337981) [(2, 1), (10, 1), (14, 1)],
  term ((-341727408 : Rat) / 21337981) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((341727408 : Rat) / 21337981) [(2, 1), (10, 1), (15, 2)],
  term ((204326352 : Rat) / 21337981) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-204326352 : Rat) / 21337981) [(2, 1), (12, 1), (15, 2)],
  term ((-1264680792 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((-125695818 : Rat) / 3048283) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (14, 2), (15, 3)],
  term ((2144551518 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)],
  term ((-16061166 : Rat) / 3048283) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8234421210 : Rat) / 21337981) [(2, 1), (13, 1), (15, 3)],
  term ((81891549 : Rat) / 42675962) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 1), (13, 1), (15, 5)],
  term ((-35506406 : Rat) / 21337981) [(2, 1), (13, 2)],
  term ((35506406 : Rat) / 21337981) [(2, 1), (13, 2), (14, 1)],
  term ((-17753203 : Rat) / 42675962) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(2, 1), (13, 2), (16, 1)],
  term ((551254896 : Rat) / 21337981) [(2, 1), (14, 1)],
  term ((-3201588171 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (14, 1), (15, 4)],
  term ((-2430270 : Rat) / 48167) [(2, 1), (14, 2)],
  term ((585570492 : Rat) / 21337981) [(2, 1), (14, 2), (15, 2)],
  term ((498199923 : Rat) / 21337981) [(2, 1), (14, 3)],
  term ((619652556 : Rat) / 21337981) [(2, 1), (14, 3), (15, 2)],
  term ((2011286016 : Rat) / 21337981) [(2, 1), (15, 2)],
  term ((-150672276 : Rat) / 3048283) [(2, 1), (15, 4)],
  term ((-318505626 : Rat) / 21337981) [(2, 2)],
  term ((-1891080432 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1)],
  term ((1891080432 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 1)],
  term ((-3600183024 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((3600183024 : Rat) / 21337981) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((1997234172 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1)],
  term ((-1997234172 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((7200366048 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7200366048 : Rat) / 21337981) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((-6017110434 : Rat) / 21337981) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 2), (3, 1), (14, 2), (15, 1)],
  term ((595932066 : Rat) / 3048283) [(2, 2), (3, 1), (15, 1)],
  term ((-1403088210 : Rat) / 21337981) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2478610224 : Rat) / 21337981) [(2, 2), (9, 1), (14, 1), (15, 3)],
  term ((1403088210 : Rat) / 21337981) [(2, 2), (9, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(2, 2), (9, 1), (15, 3)],
  term ((1597181076 : Rat) / 21337981) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4957220448 : Rat) / 21337981) [(2, 2), (13, 1), (14, 1), (15, 3)],
  term ((-1597181076 : Rat) / 21337981) [(2, 2), (13, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((4957220448 : Rat) / 21337981) [(2, 2), (13, 1), (15, 3)],
  term ((621358578 : Rat) / 21337981) [(2, 2), (14, 1)],
  term ((3348716976 : Rat) / 21337981) [(2, 2), (14, 1), (15, 2)],
  term ((-302852952 : Rat) / 21337981) [(2, 2), (14, 2)],
  term ((-1239305112 : Rat) / 21337981) [(2, 2), (14, 2), (15, 2)],
  term ((-2086664634 : Rat) / 21337981) [(2, 2), (15, 2)],
  term ((45494460 : Rat) / 21337981) [(2, 3)],
  term ((-45494460 : Rat) / 21337981) [(2, 3), (14, 1)],
  term ((-1800091512 : Rat) / 21337981) [(3, 1), (5, 1), (10, 1)],
  term ((1800091512 : Rat) / 21337981) [(3, 1), (5, 1), (10, 1), (14, 2)],
  term ((4278701736 : Rat) / 21337981) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1)],
  term ((-2139350868 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (5, 1), (14, 3)],
  term ((-640772955 : Rat) / 21337981) [(3, 1), (9, 1)],
  term ((30309768 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-48062971 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((17753203 : Rat) / 42675962) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((30309768 : Rat) / 21337981) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-15824691 : Rat) / 3048283) [(3, 1), (9, 1), (14, 1)],
  term ((730425393 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((640772955 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2)],
  term ((-1362643488 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((15824691 : Rat) / 3048283) [(3, 1), (9, 1), (14, 3)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (9, 1), (14, 3), (16, 1)],
  term ((395147682 : Rat) / 3048283) [(3, 1), (9, 1), (15, 2)],
  term ((-35463789 : Rat) / 6096566) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3841253712 : Rat) / 21337981) [(3, 1), (9, 1), (15, 4)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (9, 1), (16, 1)],
  term ((1387980684 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1)],
  term ((-1387980684 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-2464725420 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-221728392 : Rat) / 3048283) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((1725377040 : Rat) / 21337981) [(3, 1), (10, 1), (15, 1)],
  term ((-1893826152 : Rat) / 21337981) [(3, 1), (10, 1), (15, 3)],
  term ((933932502 : Rat) / 21337981) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-933932502 : Rat) / 21337981) [(3, 1), (12, 1), (15, 1)],
  term ((1138258854 : Rat) / 21337981) [(3, 1), (12, 1), (15, 3)],
  term ((1083072906 : Rat) / 21337981) [(3, 1), (13, 1)],
  term ((-131781078 : Rat) / 3048283) [(3, 1), (13, 1), (14, 1)],
  term ((841187358 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 42675962) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1083072906 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2)],
  term ((2725286976 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((52640874 : Rat) / 21337981) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((131781078 : Rat) / 3048283) [(3, 1), (13, 1), (14, 3)],
  term ((-81891549 : Rat) / 42675962) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((-5154320862 : Rat) / 21337981) [(3, 1), (13, 1), (15, 2)],
  term ((35463789 : Rat) / 6096566) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((7682507424 : Rat) / 21337981) [(3, 1), (13, 1), (15, 4)],
  term ((-52640874 : Rat) / 21337981) [(3, 1), (13, 1), (16, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((96125942 : Rat) / 21337981) [(3, 1), (13, 2), (15, 1)],
  term ((-17753203 : Rat) / 42675962) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-60619536 : Rat) / 21337981) [(3, 1), (13, 2), (15, 3)],
  term ((-2186501112 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)],
  term ((3233446956 : Rat) / 21337981) [(3, 1), (14, 1), (15, 3)],
  term ((-71584686 : Rat) / 21337981) [(3, 1), (14, 2), (15, 1)],
  term ((1593170532 : Rat) / 21337981) [(3, 1), (14, 3), (15, 1)],
  term ((527708925 : Rat) / 21337981) [(3, 1), (15, 1)],
  term ((-1511443800 : Rat) / 21337981) [(3, 1), (15, 3)],
  term ((-75824100 : Rat) / 21337981) [(3, 2)],
  term ((-3600183024 : Rat) / 21337981) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((1800091512 : Rat) / 21337981) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((15164820 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1)],
  term ((-15164820 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (14, 2)],
  term ((-75784356 : Rat) / 21337981) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-31649382 : Rat) / 3048283) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-733232736 : Rat) / 21337981) [(3, 2), (9, 1), (14, 2), (15, 1)],
  term ((-548313174 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((1992054240 : Rat) / 21337981) [(3, 2), (9, 1), (15, 3)],
  term ((151648200 : Rat) / 21337981) [(3, 2), (10, 1)],
  term ((2775961368 : Rat) / 21337981) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-151648200 : Rat) / 21337981) [(3, 2), (10, 1), (14, 2)],
  term ((2952549288 : Rat) / 21337981) [(3, 2), (10, 1), (15, 2)],
  term ((-151648200 : Rat) / 21337981) [(3, 2), (12, 1)],
  term ((151648200 : Rat) / 21337981) [(3, 2), (12, 1), (14, 2)],
  term ((-1716216804 : Rat) / 21337981) [(3, 2), (12, 1), (15, 2)],
  term ((-263562156 : Rat) / 3048283) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((699680340 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3984108480 : Rat) / 21337981) [(3, 2), (13, 1), (15, 3)],
  term ((-30329640 : Rat) / 21337981) [(3, 2), (13, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 2), (13, 2), (14, 2)],
  term ((151568712 : Rat) / 21337981) [(3, 2), (13, 2), (15, 2)],
  term ((993495537 : Rat) / 21337981) [(3, 2), (14, 1)],
  term ((-4179836601 : Rat) / 21337981) [(3, 2), (14, 1), (15, 2)],
  term ((75824100 : Rat) / 21337981) [(3, 2), (14, 2)],
  term ((-993495537 : Rat) / 21337981) [(3, 2), (14, 3)],
  term ((889793136 : Rat) / 21337981) [(3, 2), (15, 2)],
  term ((30329640 : Rat) / 21337981) [(3, 3), (9, 1), (13, 1), (15, 1)],
  term ((1466465472 : Rat) / 21337981) [(3, 3), (9, 1), (15, 2)],
  term ((303296400 : Rat) / 21337981) [(3, 3), (10, 1), (15, 1)],
  term ((-303296400 : Rat) / 21337981) [(3, 3), (12, 1), (15, 1)],
  term ((-2932930944 : Rat) / 21337981) [(3, 3), (13, 1), (15, 2)],
  term ((-60659280 : Rat) / 21337981) [(3, 3), (13, 2), (15, 1)],
  term ((1986991074 : Rat) / 21337981) [(3, 3), (14, 1), (15, 1)],
  term ((-151648200 : Rat) / 21337981) [(3, 3), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((1239305112 : Rat) / 21337981) [(5, 1), (10, 1), (15, 1)],
  term ((-1239305112 : Rat) / 21337981) [(5, 1), (10, 1), (15, 3)],
  term ((-619652556 : Rat) / 21337981) [(5, 1), (14, 1), (15, 1)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (14, 1), (15, 3)],
  term ((619652556 : Rat) / 21337981) [(5, 1), (14, 3), (15, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 2)],
  term ((-17753203 : Rat) / 85351924) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (15, 2)],
  term ((-17753203 : Rat) / 85351924) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((17753203 : Rat) / 85351924) [(9, 1), (13, 1), (16, 1)],
  term ((309826278 : Rat) / 21337981) [(9, 1), (14, 1), (15, 1)],
  term ((-309826278 : Rat) / 21337981) [(9, 1), (14, 1), (15, 3)],
  term ((-15563619 : Rat) / 870938) [(9, 1), (14, 2), (15, 1)],
  term ((142964775 : Rat) / 85351924) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((1239305112 : Rat) / 21337981) [(9, 1), (14, 2), (15, 3)],
  term ((-309826278 : Rat) / 21337981) [(9, 1), (14, 3), (15, 1)],
  term ((15563619 : Rat) / 870938) [(9, 1), (15, 1)],
  term ((-142964775 : Rat) / 85351924) [(9, 1), (15, 1), (16, 1)],
  term ((-3241227555 : Rat) / 42675962) [(9, 1), (15, 3)],
  term ((142964775 : Rat) / 85351924) [(9, 1), (15, 3), (16, 1)],
  term ((1239305112 : Rat) / 21337981) [(9, 1), (15, 5)],
  term ((86639148 : Rat) / 21337981) [(10, 1)],
  term ((538372368 : Rat) / 21337981) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-538372368 : Rat) / 21337981) [(10, 1), (13, 1), (15, 1)],
  term ((538372368 : Rat) / 21337981) [(10, 1), (13, 1), (15, 3)],
  term ((-86639148 : Rat) / 21337981) [(10, 1), (14, 2)],
  term ((170863704 : Rat) / 21337981) [(10, 1), (14, 2), (15, 2)],
  term ((-257502852 : Rat) / 21337981) [(10, 1), (15, 2)],
  term ((170863704 : Rat) / 21337981) [(10, 1), (15, 4)],
  term ((-102163176 : Rat) / 21337981) [(12, 1), (14, 2), (15, 2)],
  term ((102163176 : Rat) / 21337981) [(12, 1), (15, 2)],
  term ((-102163176 : Rat) / 21337981) [(12, 1), (15, 4)],
  term ((-40640094 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1)],
  term ((40640094 : Rat) / 21337981) [(13, 1), (14, 1), (15, 3)],
  term ((96140070 : Rat) / 3048283) [(13, 1), (14, 2), (15, 1)],
  term ((-142964775 : Rat) / 85351924) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(13, 1), (14, 2), (15, 3)],
  term ((40640094 : Rat) / 21337981) [(13, 1), (14, 3), (15, 1)],
  term ((-96140070 : Rat) / 3048283) [(13, 1), (15, 1)],
  term ((142964775 : Rat) / 85351924) [(13, 1), (15, 1), (16, 1)],
  term ((3151590714 : Rat) / 21337981) [(13, 1), (15, 3)],
  term ((-142964775 : Rat) / 85351924) [(13, 1), (15, 3), (16, 1)],
  term ((-2478610224 : Rat) / 21337981) [(13, 1), (15, 5)],
  term ((17753203 : Rat) / 21337981) [(13, 2)],
  term ((-17753203 : Rat) / 21337981) [(13, 2), (14, 2)],
  term ((17753203 : Rat) / 85351924) [(13, 2), (14, 2), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(13, 2), (15, 2)],
  term ((17753203 : Rat) / 85351924) [(13, 2), (15, 2), (16, 1)],
  term ((-17753203 : Rat) / 85351924) [(13, 2), (16, 1)],
  term ((-296665290 : Rat) / 21337981) [(14, 1)],
  term ((1116803502 : Rat) / 21337981) [(14, 1), (15, 2)],
  term ((-820138212 : Rat) / 21337981) [(14, 1), (15, 4)],
  term ((214675425 : Rat) / 42675962) [(14, 2)],
  term ((384529725 : Rat) / 21337981) [(14, 2), (15, 2)],
  term ((296665290 : Rat) / 21337981) [(14, 3)],
  term ((-820138212 : Rat) / 21337981) [(14, 3), (15, 2)],
  term ((-167699916 : Rat) / 21337981) [(14, 4)],
  term ((-1225183689 : Rat) / 42675962) [(15, 2)],
  term ((552229641 : Rat) / 21337981) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 93. -/
theorem rs_R009_ueqv_R009YYYNN_block_12_0000_0093_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_12_0000_0093
      rs_R009_ueqv_R009YYYNN_block_12_0000_0093 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
