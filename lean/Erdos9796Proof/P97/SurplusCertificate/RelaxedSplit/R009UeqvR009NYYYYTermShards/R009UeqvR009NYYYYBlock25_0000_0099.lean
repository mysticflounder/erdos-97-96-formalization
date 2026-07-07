/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 25:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (12, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(12, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0000 : Poly :=
[
  term ((19 : Rat) / 10) []
]

/-- Partial product 0 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0000 : Poly :=
[
  term ((19 : Rat) / 10) [],
  term ((19 : Rat) / 5) [(2, 1), (12, 1)],
  term ((-19 : Rat) / 10) [(2, 2)],
  term ((19 : Rat) / 5) [(3, 1), (13, 1)],
  term ((-19 : Rat) / 10) [(3, 2)],
  term ((-19 : Rat) / 5) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0000
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0001 : Poly :=
[
  term ((-31 : Rat) / 20) [(3, 1), (5, 1)]
]

/-- Partial product 1 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0001 : Poly :=
[
  term ((-31 : Rat) / 10) [(2, 1), (3, 1), (5, 1), (12, 1)],
  term ((31 : Rat) / 20) [(2, 2), (3, 1), (5, 1)],
  term ((-31 : Rat) / 20) [(3, 1), (5, 1)],
  term ((31 : Rat) / 10) [(3, 1), (5, 1), (12, 1)],
  term ((-31 : Rat) / 10) [(3, 2), (5, 1), (13, 1)],
  term ((31 : Rat) / 20) [(3, 3), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0001
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0002 : Poly :=
[
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 2 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0002 : Poly :=
[
  term ((-128 : Rat) / 29) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((64 : Rat) / 29) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-128 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((64 : Rat) / 29) [(3, 3), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0002
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0003 : Poly :=
[
  term ((4081084722 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 3 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0003 : Poly :=
[
  term ((8162169444 : Rat) / 6637897) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4081084722 : Rat) / 6637897) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-8162169444 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((4081084722 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((8162169444 : Rat) / 6637897) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4081084722 : Rat) / 6637897) [(3, 3), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0003
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0004 : Poly :=
[
  term ((-3875040 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0004 : Poly :=
[
  term ((-7750080 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3875040 : Rat) / 32699) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((7750080 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3875040 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7750080 : Rat) / 32699) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3875040 : Rat) / 32699) [(3, 3), (5, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0004
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0005 : Poly :=
[
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 5 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0005 : Poly :=
[
  term ((-5315344096 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((2657672048 : Rat) / 33189485) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((5315344096 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (15, 1)],
  term ((-5315344096 : Rat) / 33189485) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((2657672048 : Rat) / 33189485) [(3, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0005
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0006 : Poly :=
[
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0006 : Poly :=
[
  term ((1016640 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-508320 : Rat) / 32699) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1016640 : Rat) / 32699) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-508320 : Rat) / 32699) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0006
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0007 : Poly :=
[
  term ((8637434156 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 7 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0007 : Poly :=
[
  term ((17274868312 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8637434156 : Rat) / 33189485) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-17274868312 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((8637434156 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((17274868312 : Rat) / 33189485) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8637434156 : Rat) / 33189485) [(3, 3), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0007
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0008 : Poly :=
[
  term ((-1652040 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0008 : Poly :=
[
  term ((-3304080 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1652040 : Rat) / 32699) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((3304080 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1652040 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3304080 : Rat) / 32699) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1652040 : Rat) / 32699) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0008
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0009 : Poly :=
[
  term ((15502696 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 9 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0009 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-15502696 : Rat) / 33189485) [(2, 2), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-31005392 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((15502696 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(3, 2), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-15502696 : Rat) / 33189485) [(3, 3), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0009_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0009
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0010 : Poly :=
[
  term ((-2944 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0010 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2944 : Rat) / 32699) [(2, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((5888 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2944 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(3, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2944 : Rat) / 32699) [(3, 3), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0010_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0010
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0011 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 11 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0011 : Poly :=
[
  term ((248043136 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(2, 2), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-248043136 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(3, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(3, 3), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0011_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0011
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0012 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0012 : Poly :=
[
  term ((-47104 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(2, 2), (3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((47104 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-23552 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(3, 2), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(3, 3), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0012_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0012
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0013 : Poly :=
[
  term ((88350015629 : Rat) / 398273820) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 13 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0013 : Poly :=
[
  term ((88350015629 : Rat) / 199136910) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-88350015629 : Rat) / 398273820) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-88350015629 : Rat) / 199136910) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((88350015629 : Rat) / 398273820) [(3, 1), (8, 1), (15, 1)],
  term ((88350015629 : Rat) / 199136910) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-88350015629 : Rat) / 398273820) [(3, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0013_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0013
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0014 : Poly :=
[
  term ((-4210004 : Rat) / 98097) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0014 : Poly :=
[
  term ((-8420008 : Rat) / 98097) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4210004 : Rat) / 98097) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((8420008 : Rat) / 98097) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4210004 : Rat) / 98097) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8420008 : Rat) / 98097) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4210004 : Rat) / 98097) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0014_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0014
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0015 : Poly :=
[
  term ((17 : Rat) / 16) [(3, 1), (9, 1)]
]

/-- Partial product 15 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0015 : Poly :=
[
  term ((17 : Rat) / 8) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-17 : Rat) / 16) [(2, 2), (3, 1), (9, 1)],
  term ((17 : Rat) / 16) [(3, 1), (9, 1)],
  term ((-17 : Rat) / 8) [(3, 1), (9, 1), (12, 1)],
  term ((17 : Rat) / 8) [(3, 2), (9, 1), (13, 1)],
  term ((-17 : Rat) / 16) [(3, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0015_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0015
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0016 : Poly :=
[
  term ((-16 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (15, 2)]
]

/-- Partial product 16 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0016 : Poly :=
[
  term ((-32 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((16 : Rat) / 29) [(2, 2), (3, 1), (9, 1), (10, 1), (15, 2)],
  term ((32 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-16 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-32 : Rat) / 29) [(3, 2), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 29) [(3, 3), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0016_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0016
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0017 : Poly :=
[
  term ((-7751348 : Rat) / 6637897) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 17 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0017 : Poly :=
[
  term ((-15502696 : Rat) / 6637897) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((7751348 : Rat) / 6637897) [(2, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7751348 : Rat) / 6637897) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((15502696 : Rat) / 6637897) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-15502696 : Rat) / 6637897) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((7751348 : Rat) / 6637897) [(3, 3), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0017_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0017
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0018 : Poly :=
[
  term ((7360 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0018 : Poly :=
[
  term ((14720 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7360 : Rat) / 32699) [(2, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7360 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14720 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((14720 : Rat) / 32699) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7360 : Rat) / 32699) [(3, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0018_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0018
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0019 : Poly :=
[
  term ((15502696 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 19 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0019 : Poly :=
[
  term ((31005392 : Rat) / 19913691) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-15502696 : Rat) / 19913691) [(2, 2), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-31005392 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((15502696 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((31005392 : Rat) / 19913691) [(3, 2), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-15502696 : Rat) / 19913691) [(3, 3), (9, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0019_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0019
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0020 : Poly :=
[
  term ((-14720 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0020 : Poly :=
[
  term ((-29440 : Rat) / 98097) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14720 : Rat) / 98097) [(2, 2), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((29440 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-14720 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29440 : Rat) / 98097) [(3, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((14720 : Rat) / 98097) [(3, 3), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0020_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0020
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0021 : Poly :=
[
  term ((65886458 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 21 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0021 : Poly :=
[
  term ((131772916 : Rat) / 33189485) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-65886458 : Rat) / 33189485) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-131772916 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((65886458 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((131772916 : Rat) / 33189485) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-65886458 : Rat) / 33189485) [(3, 3), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0021_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0021
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0022 : Poly :=
[
  term ((-12512 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0022 : Poly :=
[
  term ((-25024 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12512 : Rat) / 32699) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((25024 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12512 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25024 : Rat) / 32699) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((12512 : Rat) / 32699) [(3, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0022_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0022
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0023 : Poly :=
[
  term ((32 : Rat) / 87) [(3, 1), (9, 1), (11, 1), (15, 3)]
]

/-- Partial product 23 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0023 : Poly :=
[
  term ((64 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-32 : Rat) / 87) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-64 : Rat) / 87) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((32 : Rat) / 87) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((64 : Rat) / 87) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-32 : Rat) / 87) [(3, 3), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0023_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0023
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0024 : Poly :=
[
  term ((-5 : Rat) / 8) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 24 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0024 : Poly :=
[
  term ((-5 : Rat) / 4) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((5 : Rat) / 8) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((-5 : Rat) / 8) [(3, 1), (9, 1), (12, 1)],
  term ((5 : Rat) / 4) [(3, 1), (9, 1), (12, 2)],
  term ((-5 : Rat) / 4) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 8) [(3, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0024_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0024
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0025 : Poly :=
[
  term ((-20 : Rat) / 29) [(3, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 25 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0025 : Poly :=
[
  term ((-40 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (12, 2), (15, 2)],
  term ((20 : Rat) / 29) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-20 : Rat) / 29) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((40 : Rat) / 29) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((-40 : Rat) / 29) [(3, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((20 : Rat) / 29) [(3, 3), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0025_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0025
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0026 : Poly :=
[
  term ((5 : Rat) / 12) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 26 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0026 : Poly :=
[
  term ((5 : Rat) / 6) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5 : Rat) / 12) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5 : Rat) / 6) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((5 : Rat) / 12) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((5 : Rat) / 6) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((-5 : Rat) / 12) [(3, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0026_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0026
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0027 : Poly :=
[
  term ((40 : Rat) / 87) [(3, 1), (9, 1), (13, 1), (15, 3)]
]

/-- Partial product 27 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0027 : Poly :=
[
  term ((80 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-40 : Rat) / 87) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-80 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((40 : Rat) / 87) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((80 : Rat) / 87) [(3, 2), (9, 1), (13, 2), (15, 3)],
  term ((-40 : Rat) / 87) [(3, 3), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0027_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0027
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0028 : Poly :=
[
  term ((220 : Rat) / 87) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 28 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0028 : Poly :=
[
  term ((440 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-220 : Rat) / 87) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-440 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((220 : Rat) / 87) [(3, 1), (9, 1), (15, 2)],
  term ((440 : Rat) / 87) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-220 : Rat) / 87) [(3, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0028_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0028
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0029 : Poly :=
[
  term ((1023177936 : Rat) / 6637897) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 29 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0029 : Poly :=
[
  term ((2046355872 : Rat) / 6637897) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1023177936 : Rat) / 6637897) [(2, 2), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((1023177936 : Rat) / 6637897) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((2046355872 : Rat) / 6637897) [(3, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1023177936 : Rat) / 6637897) [(3, 3), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0029_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0029
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0030 : Poly :=
[
  term ((-971520 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0030 : Poly :=
[
  term ((-1943040 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((971520 : Rat) / 32699) [(2, 2), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1943040 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-971520 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1943040 : Rat) / 32699) [(3, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((971520 : Rat) / 32699) [(3, 3), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0030_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0030
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0031 : Poly :=
[
  term ((5979762108 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 31 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0031 : Poly :=
[
  term ((11959524216 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1)],
  term ((-5979762108 : Rat) / 33189485) [(2, 2), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((5979762108 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-11959524216 : Rat) / 33189485) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term ((11959524216 : Rat) / 33189485) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5979762108 : Rat) / 33189485) [(3, 3), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0031_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0031
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0032 : Poly :=
[
  term ((-1143720 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0032 : Poly :=
[
  term ((-2287440 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1143720 : Rat) / 32699) [(2, 2), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1143720 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((2287440 : Rat) / 32699) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2287440 : Rat) / 32699) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1143720 : Rat) / 32699) [(3, 3), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0032_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0032
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0033 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(3, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 33 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0033 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(2, 2), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((15946032288 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-7973016144 : Rat) / 33189485) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-15946032288 : Rat) / 33189485) [(3, 2), (10, 1), (13, 2), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(3, 3), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0033_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0033
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0034 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 34 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0034 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(2, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3049920 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1524960 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3049920 : Rat) / 32699) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(3, 3), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0034_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0034
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0035 : Poly :=
[
  term ((-28437799835 : Rat) / 79654764) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 35 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0035 : Poly :=
[
  term ((-28437799835 : Rat) / 39827382) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((28437799835 : Rat) / 79654764) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((28437799835 : Rat) / 39827382) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-28437799835 : Rat) / 79654764) [(3, 1), (10, 1), (15, 1)],
  term ((-28437799835 : Rat) / 39827382) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((28437799835 : Rat) / 79654764) [(3, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0035_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0035
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0036 : Poly :=
[
  term ((6794173 : Rat) / 98097) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0036 : Poly :=
[
  term ((13588346 : Rat) / 98097) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6794173 : Rat) / 98097) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-13588346 : Rat) / 98097) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6794173 : Rat) / 98097) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((13588346 : Rat) / 98097) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6794173 : Rat) / 98097) [(3, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0036_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0036
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0037 : Poly :=
[
  term ((664418012 : Rat) / 33189485) [(3, 1), (10, 1), (15, 3)]
]

/-- Partial product 37 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0037 : Poly :=
[
  term ((1328836024 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3)],
  term ((-664418012 : Rat) / 33189485) [(2, 2), (3, 1), (10, 1), (15, 3)],
  term ((-1328836024 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 3)],
  term ((664418012 : Rat) / 33189485) [(3, 1), (10, 1), (15, 3)],
  term ((1328836024 : Rat) / 33189485) [(3, 2), (10, 1), (13, 1), (15, 3)],
  term ((-664418012 : Rat) / 33189485) [(3, 3), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0037_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0037
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0038 : Poly :=
[
  term ((-127080 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 38 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0038 : Poly :=
[
  term ((-254160 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((127080 : Rat) / 32699) [(2, 2), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((254160 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-127080 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-254160 : Rat) / 32699) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((127080 : Rat) / 32699) [(3, 3), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0038_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0038
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0039 : Poly :=
[
  term ((1453377750 : Rat) / 6637897) [(3, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 39 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0039 : Poly :=
[
  term ((2906755500 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2)],
  term ((-1453377750 : Rat) / 6637897) [(2, 2), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((1453377750 : Rat) / 6637897) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2906755500 : Rat) / 6637897) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((2906755500 : Rat) / 6637897) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1453377750 : Rat) / 6637897) [(3, 3), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0039_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0039
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0040 : Poly :=
[
  term ((-1380000 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 40 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0040 : Poly :=
[
  term ((-2760000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((1380000 : Rat) / 32699) [(2, 2), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1380000 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2760000 : Rat) / 32699) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2760000 : Rat) / 32699) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1380000 : Rat) / 32699) [(3, 3), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0040_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0040
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0041 : Poly :=
[
  term ((-968918500 : Rat) / 6637897) [(3, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 41 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0041 : Poly :=
[
  term ((-1937837000 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((968918500 : Rat) / 6637897) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 3)],
  term ((1937837000 : Rat) / 6637897) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-968918500 : Rat) / 6637897) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-1937837000 : Rat) / 6637897) [(3, 2), (11, 1), (13, 2), (15, 3)],
  term ((968918500 : Rat) / 6637897) [(3, 3), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0041_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0041
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0042 : Poly :=
[
  term ((920000 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 42 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0042 : Poly :=
[
  term ((1840000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-920000 : Rat) / 32699) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1840000 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((920000 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((1840000 : Rat) / 32699) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-920000 : Rat) / 32699) [(3, 3), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0042_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0042
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0043 : Poly :=
[
  term ((-79179143641 : Rat) / 66378970) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 43 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0043 : Poly :=
[
  term ((-79179143641 : Rat) / 33189485) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((79179143641 : Rat) / 66378970) [(2, 2), (3, 1), (11, 1), (15, 2)],
  term ((79179143641 : Rat) / 33189485) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-79179143641 : Rat) / 66378970) [(3, 1), (11, 1), (15, 2)],
  term ((-79179143641 : Rat) / 33189485) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((79179143641 : Rat) / 66378970) [(3, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0043_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0043
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0044 : Poly :=
[
  term ((7542394 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 44 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0044 : Poly :=
[
  term ((15084788 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7542394 : Rat) / 32699) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15084788 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((7542394 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((15084788 : Rat) / 32699) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7542394 : Rat) / 32699) [(3, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0044_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0044
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0045 : Poly :=
[
  term ((-3441598512 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 45 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0045 : Poly :=
[
  term ((-6883197024 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((3441598512 : Rat) / 33189485) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3441598512 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-6883197024 : Rat) / 33189485) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((3441598512 : Rat) / 33189485) [(3, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0045_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0045
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0046 : Poly :=
[
  term ((653568 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0046 : Poly :=
[
  term ((1307136 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-653568 : Rat) / 32699) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((653568 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((1307136 : Rat) / 32699) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-653568 : Rat) / 32699) [(3, 3), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0046_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0046
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0047 : Poly :=
[
  term ((2294399008 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 47 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0047 : Poly :=
[
  term ((4588798016 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-2294399008 : Rat) / 33189485) [(2, 2), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-4588798016 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((2294399008 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((4588798016 : Rat) / 33189485) [(3, 2), (11, 2), (13, 2), (15, 2)],
  term ((-2294399008 : Rat) / 33189485) [(3, 3), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0047_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0047
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0048 : Poly :=
[
  term ((-435712 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 48 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0048 : Poly :=
[
  term ((-871424 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((435712 : Rat) / 32699) [(2, 2), (3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((871424 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-435712 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-871424 : Rat) / 32699) [(3, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((435712 : Rat) / 32699) [(3, 3), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0048_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0048
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0049 : Poly :=
[
  term ((3271068856 : Rat) / 33189485) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 49 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0049 : Poly :=
[
  term ((6542137712 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3271068856 : Rat) / 33189485) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-6542137712 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((3271068856 : Rat) / 33189485) [(3, 1), (11, 2), (15, 1)],
  term ((6542137712 : Rat) / 33189485) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-3271068856 : Rat) / 33189485) [(3, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0049_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0049
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0050 : Poly :=
[
  term ((-621184 : Rat) / 32699) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0050 : Poly :=
[
  term ((-1242368 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((621184 : Rat) / 32699) [(2, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((1242368 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-621184 : Rat) / 32699) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1242368 : Rat) / 32699) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((621184 : Rat) / 32699) [(3, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0050_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0050
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0051 : Poly :=
[
  term ((-682118624 : Rat) / 6637897) [(3, 1), (11, 2), (15, 3)]
]

/-- Partial product 51 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0051 : Poly :=
[
  term ((-1364237248 : Rat) / 6637897) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 3)],
  term ((682118624 : Rat) / 6637897) [(2, 2), (3, 1), (11, 2), (15, 3)],
  term ((1364237248 : Rat) / 6637897) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((-682118624 : Rat) / 6637897) [(3, 1), (11, 2), (15, 3)],
  term ((-1364237248 : Rat) / 6637897) [(3, 2), (11, 2), (13, 1), (15, 3)],
  term ((682118624 : Rat) / 6637897) [(3, 3), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0051_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0051
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0052 : Poly :=
[
  term ((647680 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)]
]

/-- Partial product 52 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0052 : Poly :=
[
  term ((1295360 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-647680 : Rat) / 32699) [(2, 2), (3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1295360 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((647680 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((1295360 : Rat) / 32699) [(3, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-647680 : Rat) / 32699) [(3, 3), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0052_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0052
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0053 : Poly :=
[
  term ((-149334339227 : Rat) / 531031760) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 53 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0053 : Poly :=
[
  term ((-149334339227 : Rat) / 265515880) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((149334339227 : Rat) / 531031760) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-149334339227 : Rat) / 531031760) [(3, 1), (12, 1), (15, 1)],
  term ((149334339227 : Rat) / 265515880) [(3, 1), (12, 2), (15, 1)],
  term ((-149334339227 : Rat) / 265515880) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((149334339227 : Rat) / 531031760) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0053_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0053
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0054 : Poly :=
[
  term ((3537583 : Rat) / 65398) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0054 : Poly :=
[
  term ((3537583 : Rat) / 32699) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3537583 : Rat) / 65398) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((3537583 : Rat) / 65398) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3537583 : Rat) / 32699) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((3537583 : Rat) / 32699) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3537583 : Rat) / 65398) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0054_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0054
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0055 : Poly :=
[
  term ((41 : Rat) / 40) [(3, 1), (13, 1)]
]

/-- Partial product 55 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0055 : Poly :=
[
  term ((41 : Rat) / 20) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((-41 : Rat) / 40) [(2, 2), (3, 1), (13, 1)],
  term ((-41 : Rat) / 20) [(3, 1), (12, 1), (13, 1)],
  term ((41 : Rat) / 40) [(3, 1), (13, 1)],
  term ((41 : Rat) / 20) [(3, 2), (13, 2)],
  term ((-41 : Rat) / 40) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0055_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0055
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0056 : Poly :=
[
  term ((-24226615219 : Rat) / 113792520) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 56 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0056 : Poly :=
[
  term ((-24226615219 : Rat) / 56896260) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((24226615219 : Rat) / 113792520) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((24226615219 : Rat) / 56896260) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-24226615219 : Rat) / 113792520) [(3, 1), (13, 1), (15, 2)],
  term ((-24226615219 : Rat) / 56896260) [(3, 2), (13, 2), (15, 2)],
  term ((24226615219 : Rat) / 113792520) [(3, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0056_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0056
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0057 : Poly :=
[
  term ((4087217 : Rat) / 98097) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 57 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0057 : Poly :=
[
  term ((8174434 : Rat) / 98097) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4087217 : Rat) / 98097) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8174434 : Rat) / 98097) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4087217 : Rat) / 98097) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((8174434 : Rat) / 98097) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-4087217 : Rat) / 98097) [(3, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0057_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0057
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0058 : Poly :=
[
  term ((20385995443 : Rat) / 265515880) [(3, 1), (15, 1)]
]

/-- Partial product 58 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0058 : Poly :=
[
  term ((20385995443 : Rat) / 132757940) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-20385995443 : Rat) / 265515880) [(2, 2), (3, 1), (15, 1)],
  term ((-20385995443 : Rat) / 132757940) [(3, 1), (12, 1), (15, 1)],
  term ((20385995443 : Rat) / 265515880) [(3, 1), (15, 1)],
  term ((20385995443 : Rat) / 132757940) [(3, 2), (13, 1), (15, 1)],
  term ((-20385995443 : Rat) / 265515880) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0058_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0058
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0059 : Poly :=
[
  term ((-475125 : Rat) / 32699) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0059 : Poly :=
[
  term ((-950250 : Rat) / 32699) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((475125 : Rat) / 32699) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((950250 : Rat) / 32699) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-475125 : Rat) / 32699) [(3, 1), (15, 1), (16, 1)],
  term ((-950250 : Rat) / 32699) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((475125 : Rat) / 32699) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0059_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0059
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0060 : Poly :=
[
  term ((2657672048 : Rat) / 14224065) [(3, 1), (15, 3)]
]

/-- Partial product 60 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0060 : Poly :=
[
  term ((5315344096 : Rat) / 14224065) [(2, 1), (3, 1), (12, 1), (15, 3)],
  term ((-2657672048 : Rat) / 14224065) [(2, 2), (3, 1), (15, 3)],
  term ((-5315344096 : Rat) / 14224065) [(3, 1), (12, 1), (15, 3)],
  term ((2657672048 : Rat) / 14224065) [(3, 1), (15, 3)],
  term ((5315344096 : Rat) / 14224065) [(3, 2), (13, 1), (15, 3)],
  term ((-2657672048 : Rat) / 14224065) [(3, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0060_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0060
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0061 : Poly :=
[
  term ((-1186080 : Rat) / 32699) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 61 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0061 : Poly :=
[
  term ((-2372160 : Rat) / 32699) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((1186080 : Rat) / 32699) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((2372160 : Rat) / 32699) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1186080 : Rat) / 32699) [(3, 1), (15, 3), (16, 1)],
  term ((-2372160 : Rat) / 32699) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((1186080 : Rat) / 32699) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0061_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0061
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0062 : Poly :=
[
  term ((-34549736624 : Rat) / 33189485) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 62 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0062 : Poly :=
[
  term ((-69099473248 : Rat) / 33189485) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((34549736624 : Rat) / 33189485) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-69099473248 : Rat) / 33189485) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((34549736624 : Rat) / 33189485) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((69099473248 : Rat) / 33189485) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-34549736624 : Rat) / 33189485) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0062_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0062
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0063 : Poly :=
[
  term ((6608160 : Rat) / 32699) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0063 : Poly :=
[
  term ((13216320 : Rat) / 32699) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6608160 : Rat) / 32699) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((13216320 : Rat) / 32699) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6608160 : Rat) / 32699) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13216320 : Rat) / 32699) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6608160 : Rat) / 32699) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0063_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0063
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0064 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(5, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 64 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0064 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(2, 2), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-124021568 : Rat) / 33189485) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(3, 2), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((124021568 : Rat) / 33189485) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(5, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0064_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0064
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0065 : Poly :=
[
  term ((11776 : Rat) / 32699) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 65 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0065 : Poly :=
[
  term ((23552 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(2, 2), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((23552 : Rat) / 32699) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(3, 2), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-23552 : Rat) / 32699) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0065_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0065
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0066 : Poly :=
[
  term ((-496086272 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 66 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0066 : Poly :=
[
  term ((-992172544 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((496086272 : Rat) / 33189485) [(2, 2), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((-992172544 : Rat) / 33189485) [(3, 1), (5, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((496086272 : Rat) / 33189485) [(3, 2), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((992172544 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-496086272 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0066_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0066
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0067 : Poly :=
[
  term ((94208 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 67 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0067 : Poly :=
[
  term ((188416 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-94208 : Rat) / 32699) [(2, 2), (5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((188416 : Rat) / 32699) [(3, 1), (5, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-94208 : Rat) / 32699) [(3, 2), (5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-188416 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((94208 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0067_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0067
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0068 : Poly :=
[
  term ((-3434493127 : Rat) / 33189485) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 68 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0068 : Poly :=
[
  term ((-6868986254 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((3434493127 : Rat) / 33189485) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-6868986254 : Rat) / 33189485) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((3434493127 : Rat) / 33189485) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((6868986254 : Rat) / 33189485) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-3434493127 : Rat) / 33189485) [(5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0068_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0068
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0069 : Poly :=
[
  term ((609696 : Rat) / 32699) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0069 : Poly :=
[
  term ((1219392 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-609696 : Rat) / 32699) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((1219392 : Rat) / 32699) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-609696 : Rat) / 32699) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1219392 : Rat) / 32699) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((609696 : Rat) / 32699) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0069_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0069
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0070 : Poly :=
[
  term ((-17 : Rat) / 4) [(5, 1), (9, 1)]
]

/-- Partial product 70 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0070 : Poly :=
[
  term ((-17 : Rat) / 2) [(2, 1), (5, 1), (9, 1), (12, 1)],
  term ((17 : Rat) / 4) [(2, 2), (5, 1), (9, 1)],
  term ((-17 : Rat) / 2) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((17 : Rat) / 4) [(3, 2), (5, 1), (9, 1)],
  term ((-17 : Rat) / 4) [(5, 1), (9, 1)],
  term ((17 : Rat) / 2) [(5, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0070_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0070
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0071 : Poly :=
[
  term ((64 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (15, 2)]
]

/-- Partial product 71 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0071 : Poly :=
[
  term ((128 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-64 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-64 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-128 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((64 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0071_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0071
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0072 : Poly :=
[
  term ((31005392 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 72 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0072 : Poly :=
[
  term ((62010784 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-31005392 : Rat) / 6637897) [(2, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((62010784 : Rat) / 6637897) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-31005392 : Rat) / 6637897) [(3, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((31005392 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0072_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0072
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0073 : Poly :=
[
  term ((-29440 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0073 : Poly :=
[
  term ((-58880 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((29440 : Rat) / 32699) [(2, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-58880 : Rat) / 32699) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((29440 : Rat) / 32699) [(3, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29440 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0073_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0073
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0074 : Poly :=
[
  term ((62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 74 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0074 : Poly :=
[
  term ((124021568 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-62010784 : Rat) / 6637897) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((124021568 : Rat) / 6637897) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-62010784 : Rat) / 6637897) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-124021568 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0074_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0074
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0075 : Poly :=
[
  term ((-58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 75 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0075 : Poly :=
[
  term ((-117760 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((58880 : Rat) / 32699) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-117760 : Rat) / 32699) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((58880 : Rat) / 32699) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((117760 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0075_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0075
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0076 : Poly :=
[
  term ((-263545832 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 76 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0076 : Poly :=
[
  term ((-527091664 : Rat) / 33189485) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((263545832 : Rat) / 33189485) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-527091664 : Rat) / 33189485) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((263545832 : Rat) / 33189485) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((527091664 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-263545832 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0076_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0076
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0077 : Poly :=
[
  term ((50048 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0077 : Poly :=
[
  term ((100096 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50048 : Rat) / 32699) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((100096 : Rat) / 32699) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50048 : Rat) / 32699) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-100096 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((50048 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0077_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0077
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0078 : Poly :=
[
  term ((128 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (15, 3)]
]

/-- Partial product 78 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0078 : Poly :=
[
  term ((256 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-128 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 3)],
  term ((256 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-128 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-256 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((128 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0078_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0078
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0079 : Poly :=
[
  term ((5 : Rat) / 2) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 79 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0079 : Poly :=
[
  term (5 : Rat) [(2, 1), (5, 1), (9, 1), (12, 2)],
  term ((-5 : Rat) / 2) [(2, 2), (5, 1), (9, 1), (12, 1)],
  term (5 : Rat) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 2) [(3, 2), (5, 1), (9, 1), (12, 1)],
  term ((5 : Rat) / 2) [(5, 1), (9, 1), (12, 1)],
  term (-5 : Rat) [(5, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0079_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0079
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0080 : Poly :=
[
  term ((80 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 80 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0080 : Poly :=
[
  term ((160 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 2), (15, 2)],
  term ((-80 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((160 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((80 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-160 : Rat) / 29) [(5, 1), (9, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0080_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0080
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0081 : Poly :=
[
  term (5 : Rat) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 81 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0081 : Poly :=
[
  term (10 : Rat) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term (-5 : Rat) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term (10 : Rat) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1)],
  term (-5 : Rat) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term (-10 : Rat) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term (5 : Rat) [(5, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0081_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0081
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0082 : Poly :=
[
  term ((160 : Rat) / 29) [(5, 1), (9, 1), (13, 1), (15, 3)]
]

/-- Partial product 82 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0082 : Poly :=
[
  term ((320 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-160 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 3)],
  term ((320 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 3)],
  term ((-160 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 3)],
  term ((-320 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((160 : Rat) / 29) [(5, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0082_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0082
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0083 : Poly :=
[
  term ((-144 : Rat) / 29) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 83 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0083 : Poly :=
[
  term ((-288 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((144 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((-288 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((144 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((288 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-144 : Rat) / 29) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0083_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0083
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0084 : Poly :=
[
  term ((-4092711744 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 84 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0084 : Poly :=
[
  term ((-8185423488 : Rat) / 6637897) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(2, 2), (5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-8185423488 : Rat) / 6637897) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(3, 2), (5, 1), (10, 1), (11, 1), (15, 2)],
  term ((8185423488 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-4092711744 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0084_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0084
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0085 : Poly :=
[
  term ((3886080 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 85 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0085 : Poly :=
[
  term ((7772160 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3886080 : Rat) / 32699) [(2, 2), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((7772160 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3886080 : Rat) / 32699) [(3, 2), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7772160 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3886080 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0085_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0085
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0086 : Poly :=
[
  term ((-31892064576 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 86 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0086 : Poly :=
[
  term ((-63784129152 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1)],
  term ((31892064576 : Rat) / 33189485) [(2, 2), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-63784129152 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((31892064576 : Rat) / 33189485) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-31892064576 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0086_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0086
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0087 : Poly :=
[
  term ((6099840 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0087 : Poly :=
[
  term ((12199680 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6099840 : Rat) / 32699) [(2, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((12199680 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6099840 : Rat) / 32699) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6099840 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12199680 : Rat) / 32699) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0087_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0087
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0088 : Poly :=
[
  term ((-63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 88 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0088 : Poly :=
[
  term ((-127568258304 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((63784129152 : Rat) / 33189485) [(2, 2), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-127568258304 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2)],
  term ((63784129152 : Rat) / 33189485) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((127568258304 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0088_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0088
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0089 : Poly :=
[
  term ((12199680 : Rat) / 32699) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 89 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0089 : Poly :=
[
  term ((24399360 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12199680 : Rat) / 32699) [(2, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((24399360 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-12199680 : Rat) / 32699) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-24399360 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((12199680 : Rat) / 32699) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0089_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0089
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0090 : Poly :=
[
  term ((1486239228 : Rat) / 1746815) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 90 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0090 : Poly :=
[
  term ((2972478456 : Rat) / 1746815) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1486239228 : Rat) / 1746815) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((2972478456 : Rat) / 1746815) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1486239228 : Rat) / 1746815) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((-2972478456 : Rat) / 1746815) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((1486239228 : Rat) / 1746815) [(5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0090_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0090
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0091 : Poly :=
[
  term ((-283164 : Rat) / 1721) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0091 : Poly :=
[
  term ((-566328 : Rat) / 1721) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((283164 : Rat) / 1721) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-566328 : Rat) / 1721) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((283164 : Rat) / 1721) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((566328 : Rat) / 1721) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-283164 : Rat) / 1721) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0091_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0091
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0092 : Poly :=
[
  term ((-5813511000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 92 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0092 : Poly :=
[
  term ((-11627022000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2)],
  term ((5813511000 : Rat) / 6637897) [(2, 2), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-11627022000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5813511000 : Rat) / 6637897) [(3, 2), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-5813511000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0092_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0092
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0093 : Poly :=
[
  term ((5520000 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 93 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0093 : Poly :=
[
  term ((11040000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(2, 2), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((11040000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(3, 2), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5520000 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0093_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0093
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0094 : Poly :=
[
  term ((-11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 94 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0094 : Poly :=
[
  term ((-23254044000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((11627022000 : Rat) / 6637897) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-23254044000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3)],
  term ((11627022000 : Rat) / 6637897) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 3)],
  term ((23254044000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0094_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0094
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0095 : Poly :=
[
  term ((11040000 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 95 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0095 : Poly :=
[
  term ((22080000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((22080000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-22080000 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((11040000 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0095_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0095
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0096 : Poly :=
[
  term ((42227950906 : Rat) / 33189485) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 96 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0096 : Poly :=
[
  term ((84455901812 : Rat) / 33189485) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-42227950906 : Rat) / 33189485) [(2, 2), (5, 1), (11, 1), (15, 2)],
  term ((84455901812 : Rat) / 33189485) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-42227950906 : Rat) / 33189485) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((-84455901812 : Rat) / 33189485) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((42227950906 : Rat) / 33189485) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0096_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0096
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0097 : Poly :=
[
  term ((-7967368 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 97 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0097 : Poly :=
[
  term ((-15934736 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((7967368 : Rat) / 32699) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-15934736 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((7967368 : Rat) / 32699) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((15934736 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7967368 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0097_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0097
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0098 : Poly :=
[
  term ((13766394048 : Rat) / 33189485) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 98 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0098 : Poly :=
[
  term ((27532788096 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-13766394048 : Rat) / 33189485) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((27532788096 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13766394048 : Rat) / 33189485) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((13766394048 : Rat) / 33189485) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-27532788096 : Rat) / 33189485) [(5, 1), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0098_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0098
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NYYYY_coefficient_25_0099 : Poly :=
[
  term ((-2614272 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 25. -/
def rs_R009_ueqv_R009NYYYY_partial_25_0099 : Poly :=
[
  term ((-5228544 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((2614272 : Rat) / 32699) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2614272 : Rat) / 32699) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((5228544 : Rat) / 32699) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 25. -/
theorem rs_R009_ueqv_R009NYYYY_partial_25_0099_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_25_0099
        rs_R009_ueqv_R009NYYYY_generator_25_0000_0099 =
      rs_R009_ueqv_R009NYYYY_partial_25_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_25_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_25_0000,
  rs_R009_ueqv_R009NYYYY_partial_25_0001,
  rs_R009_ueqv_R009NYYYY_partial_25_0002,
  rs_R009_ueqv_R009NYYYY_partial_25_0003,
  rs_R009_ueqv_R009NYYYY_partial_25_0004,
  rs_R009_ueqv_R009NYYYY_partial_25_0005,
  rs_R009_ueqv_R009NYYYY_partial_25_0006,
  rs_R009_ueqv_R009NYYYY_partial_25_0007,
  rs_R009_ueqv_R009NYYYY_partial_25_0008,
  rs_R009_ueqv_R009NYYYY_partial_25_0009,
  rs_R009_ueqv_R009NYYYY_partial_25_0010,
  rs_R009_ueqv_R009NYYYY_partial_25_0011,
  rs_R009_ueqv_R009NYYYY_partial_25_0012,
  rs_R009_ueqv_R009NYYYY_partial_25_0013,
  rs_R009_ueqv_R009NYYYY_partial_25_0014,
  rs_R009_ueqv_R009NYYYY_partial_25_0015,
  rs_R009_ueqv_R009NYYYY_partial_25_0016,
  rs_R009_ueqv_R009NYYYY_partial_25_0017,
  rs_R009_ueqv_R009NYYYY_partial_25_0018,
  rs_R009_ueqv_R009NYYYY_partial_25_0019,
  rs_R009_ueqv_R009NYYYY_partial_25_0020,
  rs_R009_ueqv_R009NYYYY_partial_25_0021,
  rs_R009_ueqv_R009NYYYY_partial_25_0022,
  rs_R009_ueqv_R009NYYYY_partial_25_0023,
  rs_R009_ueqv_R009NYYYY_partial_25_0024,
  rs_R009_ueqv_R009NYYYY_partial_25_0025,
  rs_R009_ueqv_R009NYYYY_partial_25_0026,
  rs_R009_ueqv_R009NYYYY_partial_25_0027,
  rs_R009_ueqv_R009NYYYY_partial_25_0028,
  rs_R009_ueqv_R009NYYYY_partial_25_0029,
  rs_R009_ueqv_R009NYYYY_partial_25_0030,
  rs_R009_ueqv_R009NYYYY_partial_25_0031,
  rs_R009_ueqv_R009NYYYY_partial_25_0032,
  rs_R009_ueqv_R009NYYYY_partial_25_0033,
  rs_R009_ueqv_R009NYYYY_partial_25_0034,
  rs_R009_ueqv_R009NYYYY_partial_25_0035,
  rs_R009_ueqv_R009NYYYY_partial_25_0036,
  rs_R009_ueqv_R009NYYYY_partial_25_0037,
  rs_R009_ueqv_R009NYYYY_partial_25_0038,
  rs_R009_ueqv_R009NYYYY_partial_25_0039,
  rs_R009_ueqv_R009NYYYY_partial_25_0040,
  rs_R009_ueqv_R009NYYYY_partial_25_0041,
  rs_R009_ueqv_R009NYYYY_partial_25_0042,
  rs_R009_ueqv_R009NYYYY_partial_25_0043,
  rs_R009_ueqv_R009NYYYY_partial_25_0044,
  rs_R009_ueqv_R009NYYYY_partial_25_0045,
  rs_R009_ueqv_R009NYYYY_partial_25_0046,
  rs_R009_ueqv_R009NYYYY_partial_25_0047,
  rs_R009_ueqv_R009NYYYY_partial_25_0048,
  rs_R009_ueqv_R009NYYYY_partial_25_0049,
  rs_R009_ueqv_R009NYYYY_partial_25_0050,
  rs_R009_ueqv_R009NYYYY_partial_25_0051,
  rs_R009_ueqv_R009NYYYY_partial_25_0052,
  rs_R009_ueqv_R009NYYYY_partial_25_0053,
  rs_R009_ueqv_R009NYYYY_partial_25_0054,
  rs_R009_ueqv_R009NYYYY_partial_25_0055,
  rs_R009_ueqv_R009NYYYY_partial_25_0056,
  rs_R009_ueqv_R009NYYYY_partial_25_0057,
  rs_R009_ueqv_R009NYYYY_partial_25_0058,
  rs_R009_ueqv_R009NYYYY_partial_25_0059,
  rs_R009_ueqv_R009NYYYY_partial_25_0060,
  rs_R009_ueqv_R009NYYYY_partial_25_0061,
  rs_R009_ueqv_R009NYYYY_partial_25_0062,
  rs_R009_ueqv_R009NYYYY_partial_25_0063,
  rs_R009_ueqv_R009NYYYY_partial_25_0064,
  rs_R009_ueqv_R009NYYYY_partial_25_0065,
  rs_R009_ueqv_R009NYYYY_partial_25_0066,
  rs_R009_ueqv_R009NYYYY_partial_25_0067,
  rs_R009_ueqv_R009NYYYY_partial_25_0068,
  rs_R009_ueqv_R009NYYYY_partial_25_0069,
  rs_R009_ueqv_R009NYYYY_partial_25_0070,
  rs_R009_ueqv_R009NYYYY_partial_25_0071,
  rs_R009_ueqv_R009NYYYY_partial_25_0072,
  rs_R009_ueqv_R009NYYYY_partial_25_0073,
  rs_R009_ueqv_R009NYYYY_partial_25_0074,
  rs_R009_ueqv_R009NYYYY_partial_25_0075,
  rs_R009_ueqv_R009NYYYY_partial_25_0076,
  rs_R009_ueqv_R009NYYYY_partial_25_0077,
  rs_R009_ueqv_R009NYYYY_partial_25_0078,
  rs_R009_ueqv_R009NYYYY_partial_25_0079,
  rs_R009_ueqv_R009NYYYY_partial_25_0080,
  rs_R009_ueqv_R009NYYYY_partial_25_0081,
  rs_R009_ueqv_R009NYYYY_partial_25_0082,
  rs_R009_ueqv_R009NYYYY_partial_25_0083,
  rs_R009_ueqv_R009NYYYY_partial_25_0084,
  rs_R009_ueqv_R009NYYYY_partial_25_0085,
  rs_R009_ueqv_R009NYYYY_partial_25_0086,
  rs_R009_ueqv_R009NYYYY_partial_25_0087,
  rs_R009_ueqv_R009NYYYY_partial_25_0088,
  rs_R009_ueqv_R009NYYYY_partial_25_0089,
  rs_R009_ueqv_R009NYYYY_partial_25_0090,
  rs_R009_ueqv_R009NYYYY_partial_25_0091,
  rs_R009_ueqv_R009NYYYY_partial_25_0092,
  rs_R009_ueqv_R009NYYYY_partial_25_0093,
  rs_R009_ueqv_R009NYYYY_partial_25_0094,
  rs_R009_ueqv_R009NYYYY_partial_25_0095,
  rs_R009_ueqv_R009NYYYY_partial_25_0096,
  rs_R009_ueqv_R009NYYYY_partial_25_0097,
  rs_R009_ueqv_R009NYYYY_partial_25_0098,
  rs_R009_ueqv_R009NYYYY_partial_25_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_25_0000_0099 : Poly :=
[
  term ((19 : Rat) / 10) [],
  term ((-128 : Rat) / 29) [(2, 1), (3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((8162169444 : Rat) / 6637897) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7750080 : Rat) / 32699) [(2, 1), (3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 10) [(2, 1), (3, 1), (5, 1), (12, 1)],
  term ((-5315344096 : Rat) / 33189485) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((1016640 : Rat) / 32699) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(2, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(2, 1), (3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(2, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(2, 1), (3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((88350015629 : Rat) / 199136910) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-8420008 : Rat) / 98097) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((31005392 : Rat) / 19913691) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-29440 : Rat) / 98097) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((131772916 : Rat) / 33189485) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-25024 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-15502696 : Rat) / 6637897) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((14720 : Rat) / 32699) [(2, 1), (3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((17 : Rat) / 8) [(2, 1), (3, 1), (9, 1), (12, 1)],
  term ((5 : Rat) / 6) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((80 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((440 : Rat) / 87) [(2, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-5 : Rat) / 4) [(2, 1), (3, 1), (9, 1), (12, 2)],
  term ((-40 : Rat) / 29) [(2, 1), (3, 1), (9, 1), (12, 2), (15, 2)],
  term ((2046355872 : Rat) / 6637897) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1943040 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((3049920 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28437799835 : Rat) / 39827382) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((13588346 : Rat) / 98097) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3)],
  term ((-254160 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((11959524216 : Rat) / 33189485) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1)],
  term ((-2287440 : Rat) / 32699) [(2, 1), (3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1937837000 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((1840000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-79179143641 : Rat) / 33189485) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((15084788 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2906755500 : Rat) / 6637897) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2)],
  term ((-2760000 : Rat) / 32699) [(2, 1), (3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((4588798016 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-871424 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((6542137712 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1242368 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1364237248 : Rat) / 6637897) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 3)],
  term ((1295360 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((-6883197024 : Rat) / 33189485) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((1307136 : Rat) / 32699) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((41 : Rat) / 20) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term ((-24226615219 : Rat) / 56896260) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((8174434 : Rat) / 98097) [(2, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((20385995443 : Rat) / 132757940) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-950250 : Rat) / 32699) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 14224065) [(2, 1), (3, 1), (12, 1), (15, 3)],
  term ((-2372160 : Rat) / 32699) [(2, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-149334339227 : Rat) / 265515880) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((3537583 : Rat) / 32699) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-69099473248 : Rat) / 33189485) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((13216320 : Rat) / 32699) [(2, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((23552 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-992172544 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((188416 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6868986254 : Rat) / 33189485) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((1219392 : Rat) / 32699) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((124021568 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-117760 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-527091664 : Rat) / 33189485) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((100096 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((62010784 : Rat) / 6637897) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-58880 : Rat) / 32699) [(2, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-17 : Rat) / 2) [(2, 1), (5, 1), (9, 1), (12, 1)],
  term (10 : Rat) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((320 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-288 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 1), (15, 2)],
  term (5 : Rat) [(2, 1), (5, 1), (9, 1), (12, 2)],
  term ((160 : Rat) / 29) [(2, 1), (5, 1), (9, 1), (12, 2), (15, 2)],
  term ((-8185423488 : Rat) / 6637897) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((7772160 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-127568258304 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((24399360 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2972478456 : Rat) / 1746815) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-566328 : Rat) / 1721) [(2, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63784129152 : Rat) / 33189485) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1)],
  term ((12199680 : Rat) / 32699) [(2, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-23254044000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((22080000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((84455901812 : Rat) / 33189485) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-15934736 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2)],
  term ((11040000 : Rat) / 32699) [(2, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-5228544 : Rat) / 32699) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((19 : Rat) / 5) [(2, 1), (12, 1)],
  term ((-19 : Rat) / 10) [(2, 2)],
  term ((31 : Rat) / 20) [(2, 2), (3, 1), (5, 1)],
  term ((64 : Rat) / 29) [(2, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-4081084722 : Rat) / 6637897) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((3875040 : Rat) / 32699) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 33189485) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((-508320 : Rat) / 32699) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-8637434156 : Rat) / 33189485) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((1652040 : Rat) / 32699) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 33189485) [(2, 2), (3, 1), (8, 1), (11, 1), (15, 2)],
  term ((2944 : Rat) / 32699) [(2, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(2, 2), (3, 1), (8, 1), (11, 2), (15, 1)],
  term ((23552 : Rat) / 32699) [(2, 2), (3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-88350015629 : Rat) / 398273820) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((4210004 : Rat) / 98097) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 16) [(2, 2), (3, 1), (9, 1)],
  term ((16 : Rat) / 29) [(2, 2), (3, 1), (9, 1), (10, 1), (15, 2)],
  term ((7751348 : Rat) / 6637897) [(2, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7360 : Rat) / 32699) [(2, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 19913691) [(2, 2), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((14720 : Rat) / 98097) [(2, 2), (3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65886458 : Rat) / 33189485) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((12512 : Rat) / 32699) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 87) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 3)],
  term ((5 : Rat) / 8) [(2, 2), (3, 1), (9, 1), (12, 1)],
  term ((20 : Rat) / 29) [(2, 2), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-5 : Rat) / 12) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-40 : Rat) / 87) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-220 : Rat) / 87) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-1023177936 : Rat) / 6637897) [(2, 2), (3, 1), (10, 1), (11, 1), (15, 2)],
  term ((971520 : Rat) / 32699) [(2, 2), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(2, 2), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((1143720 : Rat) / 32699) [(2, 2), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(2, 2), (3, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(2, 2), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((28437799835 : Rat) / 79654764) [(2, 2), (3, 1), (10, 1), (15, 1)],
  term ((-6794173 : Rat) / 98097) [(2, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-664418012 : Rat) / 33189485) [(2, 2), (3, 1), (10, 1), (15, 3)],
  term ((127080 : Rat) / 32699) [(2, 2), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-1453377750 : Rat) / 6637897) [(2, 2), (3, 1), (11, 1), (12, 1), (15, 2)],
  term ((1380000 : Rat) / 32699) [(2, 2), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((968918500 : Rat) / 6637897) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-920000 : Rat) / 32699) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((79179143641 : Rat) / 66378970) [(2, 2), (3, 1), (11, 1), (15, 2)],
  term ((-7542394 : Rat) / 32699) [(2, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((3441598512 : Rat) / 33189485) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-653568 : Rat) / 32699) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2294399008 : Rat) / 33189485) [(2, 2), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((435712 : Rat) / 32699) [(2, 2), (3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3271068856 : Rat) / 33189485) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((621184 : Rat) / 32699) [(2, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((682118624 : Rat) / 6637897) [(2, 2), (3, 1), (11, 2), (15, 3)],
  term ((-647680 : Rat) / 32699) [(2, 2), (3, 1), (11, 2), (15, 3), (16, 1)],
  term ((149334339227 : Rat) / 531031760) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-3537583 : Rat) / 65398) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 40) [(2, 2), (3, 1), (13, 1)],
  term ((24226615219 : Rat) / 113792520) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((-4087217 : Rat) / 98097) [(2, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20385995443 : Rat) / 265515880) [(2, 2), (3, 1), (15, 1)],
  term ((475125 : Rat) / 32699) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 14224065) [(2, 2), (3, 1), (15, 3)],
  term ((1186080 : Rat) / 32699) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((34549736624 : Rat) / 33189485) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-6608160 : Rat) / 32699) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(2, 2), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-11776 : Rat) / 32699) [(2, 2), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(2, 2), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((-94208 : Rat) / 32699) [(2, 2), (5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((3434493127 : Rat) / 33189485) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-609696 : Rat) / 32699) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 4) [(2, 2), (5, 1), (9, 1)],
  term ((-64 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-31005392 : Rat) / 6637897) [(2, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((29440 : Rat) / 32699) [(2, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 6637897) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((58880 : Rat) / 32699) [(2, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((263545832 : Rat) / 33189485) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-50048 : Rat) / 32699) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-5 : Rat) / 2) [(2, 2), (5, 1), (9, 1), (12, 1)],
  term ((-80 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term (-5 : Rat) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-160 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (13, 1), (15, 3)],
  term ((144 : Rat) / 29) [(2, 2), (5, 1), (9, 1), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(2, 2), (5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3886080 : Rat) / 32699) [(2, 2), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((31892064576 : Rat) / 33189485) [(2, 2), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6099840 : Rat) / 32699) [(2, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((63784129152 : Rat) / 33189485) [(2, 2), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-12199680 : Rat) / 32699) [(2, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1486239228 : Rat) / 1746815) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((283164 : Rat) / 1721) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(2, 2), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(2, 2), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-11040000 : Rat) / 32699) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-42227950906 : Rat) / 33189485) [(2, 2), (5, 1), (11, 1), (15, 2)],
  term ((7967368 : Rat) / 32699) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 20) [(3, 1), (5, 1)],
  term ((-69099473248 : Rat) / 33189485) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((13216320 : Rat) / 32699) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((23552 : Rat) / 32699) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-992172544 : Rat) / 33189485) [(3, 1), (5, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((188416 : Rat) / 32699) [(3, 1), (5, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6868986254 : Rat) / 33189485) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((1219392 : Rat) / 32699) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((62010784 : Rat) / 6637897) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-58880 : Rat) / 32699) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-527091664 : Rat) / 33189485) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((100096 : Rat) / 32699) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((256 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((124021568 : Rat) / 6637897) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-117760 : Rat) / 32699) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (5 : Rat) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((160 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-17 : Rat) / 2) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-288 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term (10 : Rat) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 1)],
  term ((320 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (13, 2), (15, 3)],
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-8185423488 : Rat) / 6637897) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((7772160 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-63784129152 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((12199680 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2972478456 : Rat) / 1746815) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-566328 : Rat) / 1721) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-127568258304 : Rat) / 33189485) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2)],
  term ((24399360 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((11040000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8162169444 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((7750080 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((84455901812 : Rat) / 33189485) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-15934736 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-23254044000 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3)],
  term ((22080000 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((4081084722 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-3875040 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(3, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5228544 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((31 : Rat) / 10) [(3, 1), (5, 1), (12, 1)],
  term ((5315344096 : Rat) / 33189485) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (15, 1)],
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-17274868312 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((3304080 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8637434156 : Rat) / 33189485) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1652040 : Rat) / 32699) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((5888 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((15502696 : Rat) / 33189485) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-2944 : Rat) / 32699) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((47104 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-23552 : Rat) / 32699) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-88350015629 : Rat) / 199136910) [(3, 1), (8, 1), (12, 1), (15, 1)],
  term ((8420008 : Rat) / 98097) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((88350015629 : Rat) / 398273820) [(3, 1), (8, 1), (15, 1)],
  term ((-4210004 : Rat) / 98097) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 16) [(3, 1), (9, 1)],
  term ((32 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-16 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((-31005392 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((29440 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-170529656 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((32384 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 87) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((15502696 : Rat) / 6637897) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-14720 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((15502696 : Rat) / 19913691) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-14720 : Rat) / 98097) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((65886458 : Rat) / 33189485) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-12512 : Rat) / 32699) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 87) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-11 : Rat) / 4) [(3, 1), (9, 1), (12, 1)],
  term ((-5 : Rat) / 6) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-80 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-500 : Rat) / 87) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((5 : Rat) / 4) [(3, 1), (9, 1), (12, 2)],
  term ((40 : Rat) / 29) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((5 : Rat) / 12) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((40 : Rat) / 87) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((220 : Rat) / 87) [(3, 1), (9, 1), (15, 2)],
  term ((-2046355872 : Rat) / 6637897) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((1943040 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1023177936 : Rat) / 6637897) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((-971520 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3049920 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((178067571823 : Rat) / 199136910) [(3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-17019506 : Rat) / 98097) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1328836024 : Rat) / 33189485) [(3, 1), (10, 1), (12, 1), (15, 3)],
  term ((254160 : Rat) / 32699) [(3, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-11959524216 : Rat) / 33189485) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term ((2287440 : Rat) / 32699) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((1524960 : Rat) / 32699) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28437799835 : Rat) / 79654764) [(3, 1), (10, 1), (15, 1)],
  term ((6794173 : Rat) / 98097) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((664418012 : Rat) / 33189485) [(3, 1), (10, 1), (15, 3)],
  term ((-127080 : Rat) / 32699) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((1937837000 : Rat) / 6637897) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-1840000 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((86446032391 : Rat) / 33189485) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-16464788 : Rat) / 32699) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((2760000 : Rat) / 32699) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-968918500 : Rat) / 6637897) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((920000 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-79179143641 : Rat) / 66378970) [(3, 1), (11, 1), (15, 2)],
  term ((7542394 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4588798016 : Rat) / 33189485) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((871424 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1426248032 : Rat) / 4741355) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((1895936 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1364237248 : Rat) / 6637897) [(3, 1), (11, 2), (12, 1), (15, 3)],
  term ((-1295360 : Rat) / 32699) [(3, 1), (11, 2), (12, 1), (15, 3), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((2294399008 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-435712 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((3271068856 : Rat) / 33189485) [(3, 1), (11, 2), (15, 1)],
  term ((-621184 : Rat) / 32699) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-682118624 : Rat) / 6637897) [(3, 1), (11, 2), (15, 3)],
  term ((647680 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-41 : Rat) / 20) [(3, 1), (12, 1), (13, 1)],
  term ((24226615219 : Rat) / 56896260) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8174434 : Rat) / 98097) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-230878320999 : Rat) / 531031760) [(3, 1), (12, 1), (15, 1)],
  term ((5438083 : Rat) / 65398) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5315344096 : Rat) / 14224065) [(3, 1), (12, 1), (15, 3)],
  term ((2372160 : Rat) / 32699) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((149334339227 : Rat) / 265515880) [(3, 1), (12, 2), (15, 1)],
  term ((-3537583 : Rat) / 32699) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((193 : Rat) / 40) [(3, 1), (13, 1)],
  term ((-24226615219 : Rat) / 113792520) [(3, 1), (13, 1), (15, 2)],
  term ((4087217 : Rat) / 98097) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((20385995443 : Rat) / 265515880) [(3, 1), (15, 1)],
  term ((-475125 : Rat) / 32699) [(3, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 14224065) [(3, 1), (15, 3)],
  term ((-1186080 : Rat) / 32699) [(3, 1), (15, 3), (16, 1)],
  term ((-19 : Rat) / 10) [(3, 2)],
  term ((34549736624 : Rat) / 33189485) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-6608160 : Rat) / 32699) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(3, 2), (5, 1), (8, 1), (11, 1), (15, 2)],
  term ((-11776 : Rat) / 32699) [(3, 2), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(3, 2), (5, 1), (8, 1), (11, 2), (15, 1)],
  term ((-94208 : Rat) / 32699) [(3, 2), (5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((3434493127 : Rat) / 33189485) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-609696 : Rat) / 32699) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((17 : Rat) / 4) [(3, 2), (5, 1), (9, 1)],
  term ((-64 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-31005392 : Rat) / 6637897) [(3, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((29440 : Rat) / 32699) [(3, 2), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 6637897) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((58880 : Rat) / 32699) [(3, 2), (5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((263545832 : Rat) / 33189485) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-50048 : Rat) / 32699) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 3)],
  term ((-5 : Rat) / 2) [(3, 2), (5, 1), (9, 1), (12, 1)],
  term ((-80 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-273 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-160 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 3)],
  term ((144 : Rat) / 29) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(3, 2), (5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3886080 : Rat) / 32699) [(3, 2), (5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((31892064576 : Rat) / 33189485) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-6099840 : Rat) / 32699) [(3, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((63784129152 : Rat) / 33189485) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-12199680 : Rat) / 32699) [(3, 2), (5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1486239228 : Rat) / 1746815) [(3, 2), (5, 1), (10, 1), (15, 1)],
  term ((283164 : Rat) / 1721) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(3, 2), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(3, 2), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((8162169444 : Rat) / 6637897) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7750080 : Rat) / 32699) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-11040000 : Rat) / 32699) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-42227950906 : Rat) / 33189485) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((7967368 : Rat) / 32699) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 10) [(3, 2), (5, 1), (13, 1)],
  term ((-5315344096 : Rat) / 33189485) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((1016640 : Rat) / 32699) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((17274868312 : Rat) / 33189485) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3304080 : Rat) / 32699) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(3, 2), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(3, 2), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(3, 2), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(3, 2), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((88350015629 : Rat) / 199136910) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-8420008 : Rat) / 98097) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 29) [(3, 2), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-15502696 : Rat) / 6637897) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((14720 : Rat) / 32699) [(3, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((131772916 : Rat) / 33189485) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-25024 : Rat) / 32699) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 87) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((31005392 : Rat) / 19913691) [(3, 2), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-29440 : Rat) / 98097) [(3, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 4) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-40 : Rat) / 29) [(3, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((17 : Rat) / 8) [(3, 2), (9, 1), (13, 1)],
  term ((440 : Rat) / 87) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((5 : Rat) / 6) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((80 : Rat) / 87) [(3, 2), (9, 1), (13, 2), (15, 3)],
  term ((2046355872 : Rat) / 6637897) [(3, 2), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1943040 : Rat) / 32699) [(3, 2), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11959524216 : Rat) / 33189485) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2287440 : Rat) / 32699) [(3, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28437799835 : Rat) / 39827382) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((13588346 : Rat) / 98097) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1328836024 : Rat) / 33189485) [(3, 2), (10, 1), (13, 1), (15, 3)],
  term ((-254160 : Rat) / 32699) [(3, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(3, 2), (10, 1), (13, 2), (15, 2)],
  term ((3049920 : Rat) / 32699) [(3, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((2906755500 : Rat) / 6637897) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2760000 : Rat) / 32699) [(3, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-79179143641 : Rat) / 33189485) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((15084788 : Rat) / 32699) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1937837000 : Rat) / 6637897) [(3, 2), (11, 1), (13, 2), (15, 3)],
  term ((1840000 : Rat) / 32699) [(3, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-6883197024 : Rat) / 33189485) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1307136 : Rat) / 32699) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6542137712 : Rat) / 33189485) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1242368 : Rat) / 32699) [(3, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1364237248 : Rat) / 6637897) [(3, 2), (11, 2), (13, 1), (15, 3)],
  term ((1295360 : Rat) / 32699) [(3, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((4588798016 : Rat) / 33189485) [(3, 2), (11, 2), (13, 2), (15, 2)],
  term ((-871424 : Rat) / 32699) [(3, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-149334339227 : Rat) / 265515880) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((3537583 : Rat) / 32699) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((20385995443 : Rat) / 132757940) [(3, 2), (13, 1), (15, 1)],
  term ((-950250 : Rat) / 32699) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 14224065) [(3, 2), (13, 1), (15, 3)],
  term ((-2372160 : Rat) / 32699) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 20) [(3, 2), (13, 2)],
  term ((-24226615219 : Rat) / 56896260) [(3, 2), (13, 2), (15, 2)],
  term ((8174434 : Rat) / 98097) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((31 : Rat) / 20) [(3, 3), (5, 1)],
  term ((64 : Rat) / 29) [(3, 3), (5, 1), (9, 1), (15, 1)],
  term ((-4081084722 : Rat) / 6637897) [(3, 3), (5, 1), (11, 1), (15, 1)],
  term ((3875040 : Rat) / 32699) [(3, 3), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((2657672048 : Rat) / 33189485) [(3, 3), (6, 1), (15, 1)],
  term ((-508320 : Rat) / 32699) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((-8637434156 : Rat) / 33189485) [(3, 3), (7, 1), (11, 1), (15, 1)],
  term ((1652040 : Rat) / 32699) [(3, 3), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 33189485) [(3, 3), (8, 1), (11, 1), (15, 2)],
  term ((2944 : Rat) / 32699) [(3, 3), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(3, 3), (8, 1), (11, 2), (15, 1)],
  term ((23552 : Rat) / 32699) [(3, 3), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-88350015629 : Rat) / 398273820) [(3, 3), (8, 1), (15, 1)],
  term ((4210004 : Rat) / 98097) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 16) [(3, 3), (9, 1)],
  term ((16 : Rat) / 29) [(3, 3), (9, 1), (10, 1), (15, 2)],
  term ((7751348 : Rat) / 6637897) [(3, 3), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-7360 : Rat) / 32699) [(3, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15502696 : Rat) / 19913691) [(3, 3), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((14720 : Rat) / 98097) [(3, 3), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65886458 : Rat) / 33189485) [(3, 3), (9, 1), (11, 1), (15, 1)],
  term ((12512 : Rat) / 32699) [(3, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 87) [(3, 3), (9, 1), (11, 1), (15, 3)],
  term ((5 : Rat) / 8) [(3, 3), (9, 1), (12, 1)],
  term ((20 : Rat) / 29) [(3, 3), (9, 1), (12, 1), (15, 2)],
  term ((-5 : Rat) / 12) [(3, 3), (9, 1), (13, 1), (15, 1)],
  term ((-40 : Rat) / 87) [(3, 3), (9, 1), (13, 1), (15, 3)],
  term ((-220 : Rat) / 87) [(3, 3), (9, 1), (15, 2)],
  term ((-1023177936 : Rat) / 6637897) [(3, 3), (10, 1), (11, 1), (15, 2)],
  term ((971520 : Rat) / 32699) [(3, 3), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(3, 3), (10, 1), (12, 1), (15, 1)],
  term ((1143720 : Rat) / 32699) [(3, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(3, 3), (10, 1), (13, 1), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(3, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((28437799835 : Rat) / 79654764) [(3, 3), (10, 1), (15, 1)],
  term ((-6794173 : Rat) / 98097) [(3, 3), (10, 1), (15, 1), (16, 1)],
  term ((-664418012 : Rat) / 33189485) [(3, 3), (10, 1), (15, 3)],
  term ((127080 : Rat) / 32699) [(3, 3), (10, 1), (15, 3), (16, 1)],
  term ((-1453377750 : Rat) / 6637897) [(3, 3), (11, 1), (12, 1), (15, 2)],
  term ((1380000 : Rat) / 32699) [(3, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((968918500 : Rat) / 6637897) [(3, 3), (11, 1), (13, 1), (15, 3)],
  term ((-920000 : Rat) / 32699) [(3, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((79179143641 : Rat) / 66378970) [(3, 3), (11, 1), (15, 2)],
  term ((-7542394 : Rat) / 32699) [(3, 3), (11, 1), (15, 2), (16, 1)],
  term ((3441598512 : Rat) / 33189485) [(3, 3), (11, 2), (12, 1), (15, 1)],
  term ((-653568 : Rat) / 32699) [(3, 3), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2294399008 : Rat) / 33189485) [(3, 3), (11, 2), (13, 1), (15, 2)],
  term ((435712 : Rat) / 32699) [(3, 3), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3271068856 : Rat) / 33189485) [(3, 3), (11, 2), (15, 1)],
  term ((621184 : Rat) / 32699) [(3, 3), (11, 2), (15, 1), (16, 1)],
  term ((682118624 : Rat) / 6637897) [(3, 3), (11, 2), (15, 3)],
  term ((-647680 : Rat) / 32699) [(3, 3), (11, 2), (15, 3), (16, 1)],
  term ((149334339227 : Rat) / 531031760) [(3, 3), (12, 1), (15, 1)],
  term ((-3537583 : Rat) / 65398) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 40) [(3, 3), (13, 1)],
  term ((24226615219 : Rat) / 113792520) [(3, 3), (13, 1), (15, 2)],
  term ((-4087217 : Rat) / 98097) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((-20385995443 : Rat) / 265515880) [(3, 3), (15, 1)],
  term ((475125 : Rat) / 32699) [(3, 3), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 14224065) [(3, 3), (15, 3)],
  term ((1186080 : Rat) / 32699) [(3, 3), (15, 3), (16, 1)],
  term ((69099473248 : Rat) / 33189485) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-13216320 : Rat) / 32699) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34549736624 : Rat) / 33189485) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((6608160 : Rat) / 32699) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-23552 : Rat) / 32699) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((992172544 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-188416 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((94208 : Rat) / 32699) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((6868986254 : Rat) / 33189485) [(5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-1219392 : Rat) / 32699) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3434493127 : Rat) / 33189485) [(5, 1), (8, 1), (15, 1)],
  term ((609696 : Rat) / 32699) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-17 : Rat) / 4) [(5, 1), (9, 1)],
  term ((-128 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((64 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (15, 2)],
  term ((-124021568 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((117760 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((682118624 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-129536 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-58880 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-263545832 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((50048 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term (11 : Rat) [(5, 1), (9, 1), (12, 1)],
  term (-10 : Rat) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-320 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((368 : Rat) / 29) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term (-5 : Rat) [(5, 1), (9, 1), (12, 2)],
  term ((-160 : Rat) / 29) [(5, 1), (9, 1), (12, 2), (15, 2)],
  term (5 : Rat) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((160 : Rat) / 29) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((-144 : Rat) / 29) [(5, 1), (9, 1), (15, 2)],
  term ((8185423488 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-7772160 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4092711744 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((3886080 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((127568258304 : Rat) / 33189485) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-24399360 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17673831048 : Rat) / 6637897) [(5, 1), (10, 1), (12, 1), (15, 1)],
  term ((16860072 : Rat) / 32699) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((-12199680 : Rat) / 32699) [(5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-63784129152 : Rat) / 33189485) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((12199680 : Rat) / 32699) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1486239228 : Rat) / 1746815) [(5, 1), (10, 1), (15, 1)],
  term ((-283164 : Rat) / 1721) [(5, 1), (10, 1), (15, 1), (16, 1)],
  term ((23254044000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-22080000 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-113523456812 : Rat) / 33189485) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((21454736 : Rat) / 32699) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((-11040000 : Rat) / 32699) [(5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((11040000 : Rat) / 32699) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((42227950906 : Rat) / 33189485) [(5, 1), (11, 1), (15, 2)],
  term ((-7967368 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2614272 : Rat) / 32699) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(5, 1), (11, 2), (12, 2), (15, 1)],
  term ((5228544 : Rat) / 32699) [(5, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-19 : Rat) / 5) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NYYYY_block_25_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_25_0000_0099
      rs_R009_ueqv_R009NYYYY_block_25_0000_0099 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
