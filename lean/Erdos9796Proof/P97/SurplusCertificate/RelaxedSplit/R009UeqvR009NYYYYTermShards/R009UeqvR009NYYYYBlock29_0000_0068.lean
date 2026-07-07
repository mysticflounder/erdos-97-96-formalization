/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 29:0-68

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0000 : Poly :=
[
  term ((64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 0 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0000 : Poly :=
[
  term ((128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0000_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0000
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0001 : Poly :=
[
  term ((-4092711744 : Rat) / 6637897) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 1 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0001 : Poly :=
[
  term ((-8185423488 : Rat) / 6637897) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((4092711744 : Rat) / 6637897) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((-8185423488 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((4092711744 : Rat) / 6637897) [(3, 1), (5, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0001_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0001
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0002 : Poly :=
[
  term ((3886080 : Rat) / 32699) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0002 : Poly :=
[
  term ((7772160 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3886080 : Rat) / 32699) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((7772160 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((-3886080 : Rat) / 32699) [(3, 1), (5, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0002_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0002
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0003 : Poly :=
[
  term ((2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 3 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0003 : Poly :=
[
  term ((5315344096 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (10, 2), (15, 1)],
  term ((5315344096 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0003_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0003
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0004 : Poly :=
[
  term ((-508320 : Rat) / 32699) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0004 : Poly :=
[
  term ((-1016640 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1016640 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0004_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0004
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0005 : Poly :=
[
  term ((-19511634062 : Rat) / 99568455) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 5 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0005 : Poly :=
[
  term ((-39023268124 : Rat) / 99568455) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((19511634062 : Rat) / 99568455) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((-39023268124 : Rat) / 99568455) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((19511634062 : Rat) / 99568455) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0005_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0005
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0006 : Poly :=
[
  term ((3752732 : Rat) / 98097) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0006 : Poly :=
[
  term ((7505464 : Rat) / 98097) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3752732 : Rat) / 98097) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((7505464 : Rat) / 98097) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3752732 : Rat) / 98097) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0006_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0006
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0007 : Poly :=
[
  term ((-40 : Rat) / 29) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 7 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0007 : Poly :=
[
  term ((-80 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((40 : Rat) / 29) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((-80 : Rat) / 29) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 29) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0007_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0007
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0008 : Poly :=
[
  term ((-4 : Rat) / 29) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 8 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0008 : Poly :=
[
  term ((-8 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((4 : Rat) / 29) [(3, 1), (9, 1), (10, 2), (15, 2)],
  term ((-8 : Rat) / 29) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((4 : Rat) / 29) [(3, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0008_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0008
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0009 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 9 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0009 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-248043136 : Rat) / 33189485) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0009_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0009
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0010 : Poly :=
[
  term ((23552 : Rat) / 32699) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0010 : Poly :=
[
  term ((47104 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-23552 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((47104 : Rat) / 32699) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-23552 : Rat) / 32699) [(3, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0010_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0010
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0011 : Poly :=
[
  term ((12464167584 : Rat) / 33189485) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 11 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0011 : Poly :=
[
  term ((24928335168 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-12464167584 : Rat) / 33189485) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((24928335168 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-12464167584 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0011_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0011
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0012 : Poly :=
[
  term ((-2366976 : Rat) / 32699) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0012 : Poly :=
[
  term ((-4733952 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2366976 : Rat) / 32699) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4733952 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((2366976 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0012_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0012
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0013 : Poly :=
[
  term ((1271221072 : Rat) / 33189485) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 13 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0013 : Poly :=
[
  term ((2542442144 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1271221072 : Rat) / 33189485) [(3, 1), (10, 2), (11, 1), (15, 2)],
  term ((2542442144 : Rat) / 33189485) [(3, 1), (11, 2), (15, 3)],
  term ((-1271221072 : Rat) / 33189485) [(3, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0013_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0013
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0014 : Poly :=
[
  term ((-241408 : Rat) / 32699) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0014 : Poly :=
[
  term ((-482816 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((241408 : Rat) / 32699) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-482816 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((241408 : Rat) / 32699) [(3, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0014_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0014
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0015 : Poly :=
[
  term ((46508088 : Rat) / 33189485) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 15 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0015 : Poly :=
[
  term ((93016176 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-46508088 : Rat) / 33189485) [(3, 1), (10, 2), (11, 2), (15, 1)],
  term ((93016176 : Rat) / 33189485) [(3, 1), (11, 3), (15, 2)],
  term ((-46508088 : Rat) / 33189485) [(3, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0015_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0015
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0016 : Poly :=
[
  term ((-8832 : Rat) / 32699) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0016 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((8832 : Rat) / 32699) [(3, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-17664 : Rat) / 32699) [(3, 1), (11, 3), (15, 2), (16, 1)],
  term ((8832 : Rat) / 32699) [(3, 1), (11, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0016_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0016
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0017 : Poly :=
[
  term ((234640793509 : Rat) / 1593095280) [(3, 1), (15, 1)]
]

/-- Partial product 17 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0017 : Poly :=
[
  term ((234640793509 : Rat) / 796547640) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-234640793509 : Rat) / 1593095280) [(3, 1), (10, 2), (15, 1)],
  term ((234640793509 : Rat) / 796547640) [(3, 1), (11, 1), (15, 2)],
  term ((-234640793509 : Rat) / 1593095280) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0017_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0017
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0018 : Poly :=
[
  term ((-5634599 : Rat) / 196194) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0018 : Poly :=
[
  term ((-5634599 : Rat) / 98097) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5634599 : Rat) / 196194) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5634599 : Rat) / 98097) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((5634599 : Rat) / 196194) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0018_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0018
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0019 : Poly :=
[
  term ((-48 : Rat) / 29) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 19 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0019 : Poly :=
[
  term ((-96 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((48 : Rat) / 29) [(5, 1), (9, 1), (10, 2), (15, 2)],
  term ((-96 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((48 : Rat) / 29) [(5, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0019_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0019
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0020 : Poly :=
[
  term ((3069533808 : Rat) / 6637897) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 20 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0020 : Poly :=
[
  term ((6139067616 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3069533808 : Rat) / 6637897) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((6139067616 : Rat) / 6637897) [(5, 1), (11, 2), (15, 3)],
  term ((-3069533808 : Rat) / 6637897) [(5, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0020_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0020
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0021 : Poly :=
[
  term ((-2914560 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0021 : Poly :=
[
  term ((-5829120 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2914560 : Rat) / 32699) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5829120 : Rat) / 32699) [(5, 1), (11, 2), (15, 3), (16, 1)],
  term ((2914560 : Rat) / 32699) [(5, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0021_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0021
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0022 : Poly :=
[
  term ((-30919430673 : Rat) / 132757940) [(5, 1), (15, 1)]
]

/-- Partial product 22 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0022 : Poly :=
[
  term ((-30919430673 : Rat) / 66378970) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((30919430673 : Rat) / 132757940) [(5, 1), (10, 2), (15, 1)],
  term ((-30919430673 : Rat) / 66378970) [(5, 1), (11, 1), (15, 2)],
  term ((30919430673 : Rat) / 132757940) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0022_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0022
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0023 : Poly :=
[
  term ((1461441 : Rat) / 32699) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0023 : Poly :=
[
  term ((2922882 : Rat) / 32699) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1461441 : Rat) / 32699) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((2922882 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1461441 : Rat) / 32699) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0023_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0023
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0024 : Poly :=
[
  term ((-1328836024 : Rat) / 33189485) [(6, 1), (15, 2)]
]

/-- Partial product 24 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0024 : Poly :=
[
  term ((-2657672048 : Rat) / 33189485) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((1328836024 : Rat) / 33189485) [(6, 1), (10, 2), (15, 2)],
  term ((-2657672048 : Rat) / 33189485) [(6, 1), (11, 1), (15, 3)],
  term ((1328836024 : Rat) / 33189485) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0024_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0024
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0025 : Poly :=
[
  term ((254160 : Rat) / 32699) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 25 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0025 : Poly :=
[
  term ((508320 : Rat) / 32699) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-254160 : Rat) / 32699) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((508320 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-254160 : Rat) / 32699) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0025_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0025
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0026 : Poly :=
[
  term ((5979762108 : Rat) / 33189485) [(7, 1), (15, 1)]
]

/-- Partial product 26 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0026 : Poly :=
[
  term ((11959524216 : Rat) / 33189485) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5979762108 : Rat) / 33189485) [(7, 1), (10, 2), (15, 1)],
  term ((11959524216 : Rat) / 33189485) [(7, 1), (11, 1), (15, 2)],
  term ((-5979762108 : Rat) / 33189485) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0026_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0026
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0027 : Poly :=
[
  term ((-1143720 : Rat) / 32699) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0027 : Poly :=
[
  term ((-2287440 : Rat) / 32699) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1143720 : Rat) / 32699) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2287440 : Rat) / 32699) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1143720 : Rat) / 32699) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0027_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0027
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0028 : Poly :=
[
  term ((8 : Rat) / 29) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 28 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0028 : Poly :=
[
  term ((16 : Rat) / 29) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8 : Rat) / 29) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((16 : Rat) / 29) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-8 : Rat) / 29) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0028_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0028
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0029 : Poly :=
[
  term ((-2185880136 : Rat) / 33189485) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 29 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0029 : Poly :=
[
  term ((-4371760272 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((2185880136 : Rat) / 33189485) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-4371760272 : Rat) / 33189485) [(8, 1), (11, 2), (15, 2)],
  term ((2185880136 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0029_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0029
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0030 : Poly :=
[
  term ((415104 : Rat) / 32699) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0030 : Poly :=
[
  term ((830208 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-415104 : Rat) / 32699) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((830208 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-415104 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0030_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0030
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0031 : Poly :=
[
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 31 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0031 : Poly :=
[
  term ((496086272 : Rat) / 33189485) [(8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-248043136 : Rat) / 33189485) [(8, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((496086272 : Rat) / 33189485) [(8, 1), (11, 3), (13, 1), (15, 2)],
  term ((-248043136 : Rat) / 33189485) [(8, 1), (11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0031_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0031
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0032 : Poly :=
[
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0032 : Poly :=
[
  term ((-94208 : Rat) / 32699) [(8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((47104 : Rat) / 32699) [(8, 1), (10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-94208 : Rat) / 32699) [(8, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((47104 : Rat) / 32699) [(8, 1), (11, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0032_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0032
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0033 : Poly :=
[
  term ((43981020997 : Rat) / 99568455) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 33 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0033 : Poly :=
[
  term ((87962041994 : Rat) / 99568455) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-43981020997 : Rat) / 99568455) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((87962041994 : Rat) / 99568455) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-43981020997 : Rat) / 99568455) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0033_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0033
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0034 : Poly :=
[
  term ((-8420008 : Rat) / 98097) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0034 : Poly :=
[
  term ((-16840016 : Rat) / 98097) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8420008 : Rat) / 98097) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16840016 : Rat) / 98097) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8420008 : Rat) / 98097) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0034_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0034
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0035 : Poly :=
[
  term ((9841651906 : Rat) / 99568455) [(8, 1), (15, 2)]
]

/-- Partial product 35 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0035 : Poly :=
[
  term ((19683303812 : Rat) / 99568455) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-9841651906 : Rat) / 99568455) [(8, 1), (10, 2), (15, 2)],
  term ((19683303812 : Rat) / 99568455) [(8, 1), (11, 1), (15, 3)],
  term ((-9841651906 : Rat) / 99568455) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0035_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0035
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0036 : Poly :=
[
  term ((-1876366 : Rat) / 98097) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0036 : Poly :=
[
  term ((-3752732 : Rat) / 98097) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1876366 : Rat) / 98097) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-3752732 : Rat) / 98097) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((1876366 : Rat) / 98097) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0036_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0036
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0037 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 37 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0037 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-124021568 : Rat) / 33189485) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0037_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0037
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0038 : Poly :=
[
  term ((11776 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0038 : Poly :=
[
  term ((23552 : Rat) / 32699) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((23552 : Rat) / 32699) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0038_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0038
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0039 : Poly :=
[
  term ((12 : Rat) / 29) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 39 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0039 : Poly :=
[
  term ((24 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12 : Rat) / 29) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((24 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-12 : Rat) / 29) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0039_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0039
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0040 : Poly :=
[
  term ((8 : Rat) / 29) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 40 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0040 : Poly :=
[
  term ((16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8 : Rat) / 29) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((16 : Rat) / 29) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-8 : Rat) / 29) [(9, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0040_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0040
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0041 : Poly :=
[
  term ((-25 : Rat) / 58) [(9, 1), (15, 1)]
]

/-- Partial product 41 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0041 : Poly :=
[
  term ((-25 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((25 : Rat) / 58) [(9, 1), (10, 2), (15, 1)],
  term ((-25 : Rat) / 29) [(9, 1), (11, 1), (15, 2)],
  term ((25 : Rat) / 58) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0041_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0041
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0042 : Poly :=
[
  term ((18 : Rat) / 29) [(9, 1), (15, 3)]
]

/-- Partial product 42 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0042 : Poly :=
[
  term ((36 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((-18 : Rat) / 29) [(9, 1), (10, 2), (15, 3)],
  term ((36 : Rat) / 29) [(9, 1), (11, 1), (15, 4)],
  term ((-18 : Rat) / 29) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0042_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0042
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0043 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 43 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0043 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 3), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0043_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0043
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0044 : Poly :=
[
  term ((5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0044 : Poly :=
[
  term ((11776 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0044_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0044
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0045 : Poly :=
[
  term ((-1488258816 : Rat) / 33189485) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 45 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0045 : Poly :=
[
  term ((-2976517632 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((1488258816 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2976517632 : Rat) / 33189485) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((1488258816 : Rat) / 33189485) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0045_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0045
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0046 : Poly :=
[
  term ((282624 : Rat) / 32699) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0046 : Poly :=
[
  term ((565248 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-282624 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((565248 : Rat) / 32699) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-282624 : Rat) / 32699) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0046_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0046
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0047 : Poly :=
[
  term ((806140192 : Rat) / 33189485) [(10, 1), (15, 2)]
]

/-- Partial product 47 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0047 : Poly :=
[
  term ((1612280384 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)],
  term ((-806140192 : Rat) / 33189485) [(10, 1), (11, 2), (15, 2)],
  term ((1612280384 : Rat) / 33189485) [(10, 2), (14, 1), (15, 2)],
  term ((-806140192 : Rat) / 33189485) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0047_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0047
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0048 : Poly :=
[
  term ((-153088 : Rat) / 32699) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 48 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0048 : Poly :=
[
  term ((-306176 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((153088 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-306176 : Rat) / 32699) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((153088 : Rat) / 32699) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0048_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0048
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0049 : Poly :=
[
  term ((-124021568 : Rat) / 1144465) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 49 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0049 : Poly :=
[
  term ((-248043136 : Rat) / 1144465) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((124021568 : Rat) / 1144465) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-248043136 : Rat) / 1144465) [(11, 2), (12, 1), (15, 2)],
  term ((124021568 : Rat) / 1144465) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0049_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0049
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0050 : Poly :=
[
  term ((683008 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0050 : Poly :=
[
  term ((1366016 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-683008 : Rat) / 32699) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1366016 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-683008 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0050_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0050
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0051 : Poly :=
[
  term ((-2418420576 : Rat) / 33189485) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 51 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0051 : Poly :=
[
  term ((-4836841152 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2418420576 : Rat) / 33189485) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-4836841152 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((2418420576 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0051_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0051
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0052 : Poly :=
[
  term ((459264 : Rat) / 32699) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 52 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0052 : Poly :=
[
  term ((918528 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-459264 : Rat) / 32699) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((918528 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-459264 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0052_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0052
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0053 : Poly :=
[
  term ((2600577254 : Rat) / 33189485) [(11, 1), (15, 1)]
]

/-- Partial product 53 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0053 : Poly :=
[
  term ((5201154508 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2600577254 : Rat) / 33189485) [(10, 2), (11, 1), (15, 1)],
  term ((5201154508 : Rat) / 33189485) [(11, 2), (15, 2)],
  term ((-2600577254 : Rat) / 33189485) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0053_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0053
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0054 : Poly :=
[
  term ((-493856 : Rat) / 32699) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0054 : Poly :=
[
  term ((-987712 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((493856 : Rat) / 32699) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-987712 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)],
  term ((493856 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0054_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0054
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0055 : Poly :=
[
  term ((-821642888 : Rat) / 4741355) [(11, 1), (15, 3)]
]

/-- Partial product 55 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0055 : Poly :=
[
  term ((-1643285776 : Rat) / 4741355) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((821642888 : Rat) / 4741355) [(10, 2), (11, 1), (15, 3)],
  term ((-1643285776 : Rat) / 4741355) [(11, 2), (15, 4)],
  term ((821642888 : Rat) / 4741355) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0055_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0055
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0056 : Poly :=
[
  term ((1092224 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 56 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0056 : Poly :=
[
  term ((2184448 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1092224 : Rat) / 32699) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((2184448 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)],
  term ((-1092224 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0056_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0056
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0057 : Poly :=
[
  term ((93016176 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 57 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0057 : Poly :=
[
  term ((186032352 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-93016176 : Rat) / 33189485) [(10, 2), (11, 2), (12, 1), (15, 2)],
  term ((186032352 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)],
  term ((-93016176 : Rat) / 33189485) [(11, 4), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0057_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0057
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0058 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 58 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0058 : Poly :=
[
  term ((-35328 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((17664 : Rat) / 32699) [(10, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-35328 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)],
  term ((17664 : Rat) / 32699) [(11, 4), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0058_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0058
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0059 : Poly :=
[
  term ((46508088 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 59 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0059 : Poly :=
[
  term ((93016176 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-46508088 : Rat) / 33189485) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((93016176 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)],
  term ((-46508088 : Rat) / 33189485) [(11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0059_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0059
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0060 : Poly :=
[
  term ((-8832 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0060 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8832 : Rat) / 32699) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17664 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((8832 : Rat) / 32699) [(11, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0060_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0060
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0061 : Poly :=
[
  term ((46508088 : Rat) / 33189485) [(11, 2), (15, 2)]
]

/-- Partial product 61 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0061 : Poly :=
[
  term ((93016176 : Rat) / 33189485) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-46508088 : Rat) / 33189485) [(10, 2), (11, 2), (15, 2)],
  term ((93016176 : Rat) / 33189485) [(11, 3), (15, 3)],
  term ((-46508088 : Rat) / 33189485) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0061_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0061
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0062 : Poly :=
[
  term ((-8832 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 62 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0062 : Poly :=
[
  term ((-17664 : Rat) / 32699) [(10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((8832 : Rat) / 32699) [(10, 2), (11, 2), (15, 2), (16, 1)],
  term ((-17664 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)],
  term ((8832 : Rat) / 32699) [(11, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0062_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0062
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0063 : Poly :=
[
  term ((44152690747 : Rat) / 265515880) [(12, 1), (15, 2)]
]

/-- Partial product 63 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0063 : Poly :=
[
  term ((44152690747 : Rat) / 132757940) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-44152690747 : Rat) / 265515880) [(10, 2), (12, 1), (15, 2)],
  term ((44152690747 : Rat) / 132757940) [(11, 1), (12, 1), (15, 3)],
  term ((-44152690747 : Rat) / 265515880) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0063_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0063
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0064 : Poly :=
[
  term ((-1052501 : Rat) / 32699) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 64 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0064 : Poly :=
[
  term ((-2105002 : Rat) / 32699) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1052501 : Rat) / 32699) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2105002 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1052501 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0064_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0064
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0065 : Poly :=
[
  term ((-79903313851 : Rat) / 318619056) [(13, 1), (15, 1)]
]

/-- Partial product 65 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0065 : Poly :=
[
  term ((-79903313851 : Rat) / 159309528) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((79903313851 : Rat) / 318619056) [(10, 2), (13, 1), (15, 1)],
  term ((-79903313851 : Rat) / 159309528) [(11, 1), (13, 1), (15, 2)],
  term ((79903313851 : Rat) / 318619056) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0065_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0065
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0066 : Poly :=
[
  term ((9614257 : Rat) / 196194) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0066 : Poly :=
[
  term ((9614257 : Rat) / 98097) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9614257 : Rat) / 196194) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((9614257 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9614257 : Rat) / 196194) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0066_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0066
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0067 : Poly :=
[
  term ((-18434702507 : Rat) / 1593095280) [(15, 2)]
]

/-- Partial product 67 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0067 : Poly :=
[
  term ((-18434702507 : Rat) / 796547640) [(10, 1), (14, 1), (15, 2)],
  term ((18434702507 : Rat) / 1593095280) [(10, 2), (15, 2)],
  term ((-18434702507 : Rat) / 796547640) [(11, 1), (15, 3)],
  term ((18434702507 : Rat) / 1593095280) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0067_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0067
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009NYYYY_coefficient_29_0068 : Poly :=
[
  term ((522241 : Rat) / 196194) [(15, 2), (16, 1)]
]

/-- Partial product 68 for generator 29. -/
def rs_R009_ueqv_R009NYYYY_partial_29_0068 : Poly :=
[
  term ((522241 : Rat) / 98097) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-522241 : Rat) / 196194) [(10, 2), (15, 2), (16, 1)],
  term ((522241 : Rat) / 98097) [(11, 1), (15, 3), (16, 1)],
  term ((-522241 : Rat) / 196194) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 29. -/
theorem rs_R009_ueqv_R009NYYYY_partial_29_0068_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_29_0068
        rs_R009_ueqv_R009NYYYY_generator_29_0000_0068 =
      rs_R009_ueqv_R009NYYYY_partial_29_0068 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_29_0000_0068 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_29_0000,
  rs_R009_ueqv_R009NYYYY_partial_29_0001,
  rs_R009_ueqv_R009NYYYY_partial_29_0002,
  rs_R009_ueqv_R009NYYYY_partial_29_0003,
  rs_R009_ueqv_R009NYYYY_partial_29_0004,
  rs_R009_ueqv_R009NYYYY_partial_29_0005,
  rs_R009_ueqv_R009NYYYY_partial_29_0006,
  rs_R009_ueqv_R009NYYYY_partial_29_0007,
  rs_R009_ueqv_R009NYYYY_partial_29_0008,
  rs_R009_ueqv_R009NYYYY_partial_29_0009,
  rs_R009_ueqv_R009NYYYY_partial_29_0010,
  rs_R009_ueqv_R009NYYYY_partial_29_0011,
  rs_R009_ueqv_R009NYYYY_partial_29_0012,
  rs_R009_ueqv_R009NYYYY_partial_29_0013,
  rs_R009_ueqv_R009NYYYY_partial_29_0014,
  rs_R009_ueqv_R009NYYYY_partial_29_0015,
  rs_R009_ueqv_R009NYYYY_partial_29_0016,
  rs_R009_ueqv_R009NYYYY_partial_29_0017,
  rs_R009_ueqv_R009NYYYY_partial_29_0018,
  rs_R009_ueqv_R009NYYYY_partial_29_0019,
  rs_R009_ueqv_R009NYYYY_partial_29_0020,
  rs_R009_ueqv_R009NYYYY_partial_29_0021,
  rs_R009_ueqv_R009NYYYY_partial_29_0022,
  rs_R009_ueqv_R009NYYYY_partial_29_0023,
  rs_R009_ueqv_R009NYYYY_partial_29_0024,
  rs_R009_ueqv_R009NYYYY_partial_29_0025,
  rs_R009_ueqv_R009NYYYY_partial_29_0026,
  rs_R009_ueqv_R009NYYYY_partial_29_0027,
  rs_R009_ueqv_R009NYYYY_partial_29_0028,
  rs_R009_ueqv_R009NYYYY_partial_29_0029,
  rs_R009_ueqv_R009NYYYY_partial_29_0030,
  rs_R009_ueqv_R009NYYYY_partial_29_0031,
  rs_R009_ueqv_R009NYYYY_partial_29_0032,
  rs_R009_ueqv_R009NYYYY_partial_29_0033,
  rs_R009_ueqv_R009NYYYY_partial_29_0034,
  rs_R009_ueqv_R009NYYYY_partial_29_0035,
  rs_R009_ueqv_R009NYYYY_partial_29_0036,
  rs_R009_ueqv_R009NYYYY_partial_29_0037,
  rs_R009_ueqv_R009NYYYY_partial_29_0038,
  rs_R009_ueqv_R009NYYYY_partial_29_0039,
  rs_R009_ueqv_R009NYYYY_partial_29_0040,
  rs_R009_ueqv_R009NYYYY_partial_29_0041,
  rs_R009_ueqv_R009NYYYY_partial_29_0042,
  rs_R009_ueqv_R009NYYYY_partial_29_0043,
  rs_R009_ueqv_R009NYYYY_partial_29_0044,
  rs_R009_ueqv_R009NYYYY_partial_29_0045,
  rs_R009_ueqv_R009NYYYY_partial_29_0046,
  rs_R009_ueqv_R009NYYYY_partial_29_0047,
  rs_R009_ueqv_R009NYYYY_partial_29_0048,
  rs_R009_ueqv_R009NYYYY_partial_29_0049,
  rs_R009_ueqv_R009NYYYY_partial_29_0050,
  rs_R009_ueqv_R009NYYYY_partial_29_0051,
  rs_R009_ueqv_R009NYYYY_partial_29_0052,
  rs_R009_ueqv_R009NYYYY_partial_29_0053,
  rs_R009_ueqv_R009NYYYY_partial_29_0054,
  rs_R009_ueqv_R009NYYYY_partial_29_0055,
  rs_R009_ueqv_R009NYYYY_partial_29_0056,
  rs_R009_ueqv_R009NYYYY_partial_29_0057,
  rs_R009_ueqv_R009NYYYY_partial_29_0058,
  rs_R009_ueqv_R009NYYYY_partial_29_0059,
  rs_R009_ueqv_R009NYYYY_partial_29_0060,
  rs_R009_ueqv_R009NYYYY_partial_29_0061,
  rs_R009_ueqv_R009NYYYY_partial_29_0062,
  rs_R009_ueqv_R009NYYYY_partial_29_0063,
  rs_R009_ueqv_R009NYYYY_partial_29_0064,
  rs_R009_ueqv_R009NYYYY_partial_29_0065,
  rs_R009_ueqv_R009NYYYY_partial_29_0066,
  rs_R009_ueqv_R009NYYYY_partial_29_0067,
  rs_R009_ueqv_R009NYYYY_partial_29_0068
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_29_0000_0068 : Poly :=
[
  term ((128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1)],
  term ((128 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((-64 : Rat) / 29) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((-8185423488 : Rat) / 6637897) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((7772160 : Rat) / 32699) [(3, 1), (5, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4092711744 : Rat) / 6637897) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((-3886080 : Rat) / 32699) [(3, 1), (5, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8185423488 : Rat) / 6637897) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((7772160 : Rat) / 32699) [(3, 1), (5, 1), (11, 2), (15, 2), (16, 1)],
  term ((4092711744 : Rat) / 6637897) [(3, 1), (5, 1), (11, 3), (15, 1)],
  term ((-3886080 : Rat) / 32699) [(3, 1), (5, 1), (11, 3), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1016640 : Rat) / 32699) [(3, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (10, 2), (15, 1)],
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((5315344096 : Rat) / 33189485) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-1016640 : Rat) / 32699) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((508320 : Rat) / 32699) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-39023268124 : Rat) / 99568455) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((7505464 : Rat) / 98097) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((19511634062 : Rat) / 99568455) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((-3752732 : Rat) / 98097) [(3, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-39023268124 : Rat) / 99568455) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((7505464 : Rat) / 98097) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((19511634062 : Rat) / 99568455) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((-3752732 : Rat) / 98097) [(3, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-80 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8 : Rat) / 29) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((40 : Rat) / 29) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 29) [(3, 1), (9, 1), (10, 2), (15, 2)],
  term ((-80 : Rat) / 29) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8 : Rat) / 29) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((40 : Rat) / 29) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((4 : Rat) / 29) [(3, 1), (9, 1), (11, 2), (15, 2)],
  term ((24928335168 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4733952 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2542442144 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-482816 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((47104 : Rat) / 32699) [(3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((93016176 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-17664 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-23552 : Rat) / 32699) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((234640793509 : Rat) / 796547640) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-5634599 : Rat) / 98097) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12464167584 : Rat) / 33189485) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((2366976 : Rat) / 32699) [(3, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1271221072 : Rat) / 33189485) [(3, 1), (10, 2), (11, 1), (15, 2)],
  term ((241408 : Rat) / 32699) [(3, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-46508088 : Rat) / 33189485) [(3, 1), (10, 2), (11, 2), (15, 1)],
  term ((8832 : Rat) / 32699) [(3, 1), (10, 2), (11, 2), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((47104 : Rat) / 32699) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-234640793509 : Rat) / 1593095280) [(3, 1), (10, 2), (15, 1)],
  term ((5634599 : Rat) / 196194) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(3, 1), (10, 3), (15, 1)],
  term ((-23552 : Rat) / 32699) [(3, 1), (10, 3), (15, 1), (16, 1)],
  term ((234640793509 : Rat) / 796547640) [(3, 1), (11, 1), (15, 2)],
  term ((-5634599 : Rat) / 98097) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((24928335168 : Rat) / 33189485) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-4733952 : Rat) / 32699) [(3, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-234640793509 : Rat) / 1593095280) [(3, 1), (11, 2), (15, 1)],
  term ((5634599 : Rat) / 196194) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((2542442144 : Rat) / 33189485) [(3, 1), (11, 2), (15, 3)],
  term ((-482816 : Rat) / 32699) [(3, 1), (11, 2), (15, 3), (16, 1)],
  term ((-12464167584 : Rat) / 33189485) [(3, 1), (11, 3), (13, 1), (15, 1)],
  term ((2366976 : Rat) / 32699) [(3, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 1746815) [(3, 1), (11, 3), (15, 2)],
  term ((11776 : Rat) / 1721) [(3, 1), (11, 3), (15, 2), (16, 1)],
  term ((-46508088 : Rat) / 33189485) [(3, 1), (11, 4), (15, 1)],
  term ((8832 : Rat) / 32699) [(3, 1), (11, 4), (15, 1), (16, 1)],
  term ((-96 : Rat) / 29) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((48 : Rat) / 29) [(5, 1), (9, 1), (10, 2), (15, 2)],
  term ((-96 : Rat) / 29) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((48 : Rat) / 29) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((6139067616 : Rat) / 6637897) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-5829120 : Rat) / 32699) [(5, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-30919430673 : Rat) / 66378970) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((2922882 : Rat) / 32699) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3069533808 : Rat) / 6637897) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((2914560 : Rat) / 32699) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((30919430673 : Rat) / 132757940) [(5, 1), (10, 2), (15, 1)],
  term ((-1461441 : Rat) / 32699) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-30919430673 : Rat) / 66378970) [(5, 1), (11, 1), (15, 2)],
  term ((2922882 : Rat) / 32699) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((30919430673 : Rat) / 132757940) [(5, 1), (11, 2), (15, 1)],
  term ((-1461441 : Rat) / 32699) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((6139067616 : Rat) / 6637897) [(5, 1), (11, 2), (15, 3)],
  term ((-5829120 : Rat) / 32699) [(5, 1), (11, 2), (15, 3), (16, 1)],
  term ((-3069533808 : Rat) / 6637897) [(5, 1), (11, 3), (15, 2)],
  term ((2914560 : Rat) / 32699) [(5, 1), (11, 3), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((508320 : Rat) / 32699) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1328836024 : Rat) / 33189485) [(6, 1), (10, 2), (15, 2)],
  term ((-254160 : Rat) / 32699) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-2657672048 : Rat) / 33189485) [(6, 1), (11, 1), (15, 3)],
  term ((508320 : Rat) / 32699) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((1328836024 : Rat) / 33189485) [(6, 1), (11, 2), (15, 2)],
  term ((-254160 : Rat) / 32699) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((11959524216 : Rat) / 33189485) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2287440 : Rat) / 32699) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(7, 1), (10, 2), (15, 1)],
  term ((1143720 : Rat) / 32699) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((11959524216 : Rat) / 33189485) [(7, 1), (11, 1), (15, 2)],
  term ((-2287440 : Rat) / 32699) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(7, 1), (11, 2), (15, 1)],
  term ((1143720 : Rat) / 32699) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 29) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8 : Rat) / 29) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((16 : Rat) / 29) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-8 : Rat) / 29) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4371760272 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((830208 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-94208 : Rat) / 32699) [(8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((87962041994 : Rat) / 99568455) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16840016 : Rat) / 98097) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((19683303812 : Rat) / 99568455) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3752732 : Rat) / 98097) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2185880136 : Rat) / 33189485) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-415104 : Rat) / 32699) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(8, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((47104 : Rat) / 32699) [(8, 1), (10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43981020997 : Rat) / 99568455) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((8420008 : Rat) / 98097) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9841651906 : Rat) / 99568455) [(8, 1), (10, 2), (15, 2)],
  term ((1876366 : Rat) / 98097) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((87962041994 : Rat) / 99568455) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-16840016 : Rat) / 98097) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((19683303812 : Rat) / 99568455) [(8, 1), (11, 1), (15, 3)],
  term ((-3752732 : Rat) / 98097) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-43981020997 : Rat) / 99568455) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((8420008 : Rat) / 98097) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-22956932722 : Rat) / 99568455) [(8, 1), (11, 2), (15, 2)],
  term ((4366990 : Rat) / 98097) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(8, 1), (11, 3), (13, 1), (15, 2)],
  term ((-94208 : Rat) / 32699) [(8, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((2185880136 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)],
  term ((-415104 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(8, 1), (11, 4), (13, 1), (15, 1)],
  term ((47104 : Rat) / 32699) [(8, 1), (11, 4), (13, 1), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((23552 : Rat) / 32699) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 29) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 29) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-25 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((36 : Rat) / 29) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 29) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-8 : Rat) / 29) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((25 : Rat) / 58) [(9, 1), (10, 2), (15, 1)],
  term ((-18 : Rat) / 29) [(9, 1), (10, 2), (15, 3)],
  term ((24 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((16 : Rat) / 29) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-25 : Rat) / 29) [(9, 1), (11, 1), (15, 2)],
  term ((36 : Rat) / 29) [(9, 1), (11, 1), (15, 4)],
  term ((-12 : Rat) / 29) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-133177288 : Rat) / 33189485) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((23552 : Rat) / 32699) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((25 : Rat) / 58) [(9, 1), (11, 2), (15, 1)],
  term ((-18 : Rat) / 29) [(9, 1), (11, 2), (15, 3)],
  term ((62010784 : Rat) / 33189485) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((-11776 : Rat) / 32699) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 1144465) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1366016 : Rat) / 32699) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4836841152 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((918528 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2976517632 : Rat) / 33189485) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((565248 : Rat) / 32699) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5201154508 : Rat) / 33189485) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-987712 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1643285776 : Rat) / 4741355) [(10, 1), (11, 1), (14, 1), (15, 3)],
  term ((2184448 : Rat) / 32699) [(10, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((1612280384 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)],
  term ((-306176 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((186032352 : Rat) / 33189485) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-35328 : Rat) / 32699) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((93016176 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-17664 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1488258816 : Rat) / 33189485) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-282624 : Rat) / 32699) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((93016176 : Rat) / 33189485) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-17664 : Rat) / 32699) [(10, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-124021568 : Rat) / 4741355) [(10, 1), (11, 2), (15, 2)],
  term ((164864 : Rat) / 32699) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 3), (15, 1)],
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((44152690747 : Rat) / 132757940) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2105002 : Rat) / 32699) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-79903313851 : Rat) / 159309528) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((9614257 : Rat) / 98097) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18434702507 : Rat) / 796547640) [(10, 1), (14, 1), (15, 2)],
  term ((522241 : Rat) / 98097) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((124021568 : Rat) / 1144465) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-683008 : Rat) / 32699) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2418420576 : Rat) / 33189485) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-459264 : Rat) / 32699) [(10, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((11776 : Rat) / 32699) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2600577254 : Rat) / 33189485) [(10, 2), (11, 1), (15, 1)],
  term ((493856 : Rat) / 32699) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((821642888 : Rat) / 4741355) [(10, 2), (11, 1), (15, 3)],
  term ((-1092224 : Rat) / 32699) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(10, 2), (11, 2), (12, 1), (15, 2)],
  term ((17664 : Rat) / 32699) [(10, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-46508088 : Rat) / 33189485) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((8832 : Rat) / 32699) [(10, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-46508088 : Rat) / 33189485) [(10, 2), (11, 2), (15, 2)],
  term ((8832 : Rat) / 32699) [(10, 2), (11, 2), (15, 2), (16, 1)],
  term ((-44152690747 : Rat) / 265515880) [(10, 2), (12, 1), (15, 2)],
  term ((1052501 : Rat) / 32699) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2976517632 : Rat) / 33189485) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((565248 : Rat) / 32699) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((79903313851 : Rat) / 318619056) [(10, 2), (13, 1), (15, 1)],
  term ((-9614257 : Rat) / 196194) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1612280384 : Rat) / 33189485) [(10, 2), (14, 1), (15, 2)],
  term ((-306176 : Rat) / 32699) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((18434702507 : Rat) / 1593095280) [(10, 2), (15, 2)],
  term ((-522241 : Rat) / 196194) [(10, 2), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(10, 3), (11, 1), (15, 1)],
  term ((-5888 : Rat) / 32699) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term ((1488258816 : Rat) / 33189485) [(10, 3), (13, 1), (15, 1)],
  term ((-282624 : Rat) / 32699) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((-806140192 : Rat) / 33189485) [(10, 3), (15, 2)],
  term ((153088 : Rat) / 32699) [(10, 3), (15, 2), (16, 1)],
  term ((44152690747 : Rat) / 132757940) [(11, 1), (12, 1), (15, 3)],
  term ((-2105002 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-79903313851 : Rat) / 159309528) [(11, 1), (13, 1), (15, 2)],
  term ((9614257 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18434702507 : Rat) / 796547640) [(11, 1), (15, 3)],
  term ((522241 : Rat) / 98097) [(11, 1), (15, 3), (16, 1)],
  term ((-101698698299 : Rat) / 265515880) [(11, 2), (12, 1), (15, 2)],
  term ((2418517 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((79903313851 : Rat) / 318619056) [(11, 2), (13, 1), (15, 1)],
  term ((-9614257 : Rat) / 196194) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4836841152 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)],
  term ((918528 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((38298588413 : Rat) / 227585040) [(11, 2), (15, 2)],
  term ((-6448513 : Rat) / 196194) [(11, 2), (15, 2), (16, 1)],
  term ((-1643285776 : Rat) / 4741355) [(11, 2), (15, 4)],
  term ((2184448 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)],
  term ((124021568 : Rat) / 1144465) [(11, 3), (12, 1), (15, 1)],
  term ((-683008 : Rat) / 32699) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((186032352 : Rat) / 33189485) [(11, 3), (12, 1), (15, 3)],
  term ((-35328 : Rat) / 32699) [(11, 3), (12, 1), (15, 3), (16, 1)],
  term ((2511436752 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)],
  term ((-476928 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2600577254 : Rat) / 33189485) [(11, 3), (15, 1)],
  term ((493856 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)],
  term ((201535048 : Rat) / 1144465) [(11, 3), (15, 3)],
  term ((-1109888 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(11, 4), (12, 1), (15, 2)],
  term ((17664 : Rat) / 32699) [(11, 4), (12, 1), (15, 2), (16, 1)],
  term ((-46508088 : Rat) / 33189485) [(11, 4), (13, 1), (15, 1)],
  term ((8832 : Rat) / 32699) [(11, 4), (13, 1), (15, 1), (16, 1)],
  term ((-46508088 : Rat) / 33189485) [(11, 4), (15, 2)],
  term ((8832 : Rat) / 32699) [(11, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 0 through 68. -/
theorem rs_R009_ueqv_R009NYYYY_block_29_0000_0068_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_29_0000_0068
      rs_R009_ueqv_R009NYYYY_block_29_0000_0068 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
