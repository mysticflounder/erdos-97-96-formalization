/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 10:0-10

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(2, 1)],
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0000 : Poly :=
[
  term ((-85468329 : Rat) / 42675962) []
]

/-- Partial product 0 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0000 : Poly :=
[
  term ((-85468329 : Rat) / 42675962) [],
  term ((85468329 : Rat) / 21337981) [(2, 1)],
  term ((-85468329 : Rat) / 21337981) [(2, 1), (4, 1)],
  term ((-85468329 : Rat) / 21337981) [(3, 1), (5, 1)],
  term ((85468329 : Rat) / 42675962) [(4, 2)],
  term ((85468329 : Rat) / 42675962) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0000_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0000
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0001 : Poly :=
[
  term ((-724319982 : Rat) / 21337981) [(1, 1), (3, 1)]
]

/-- Partial product 1 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0001 : Poly :=
[
  term ((1448639964 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)],
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((-724319982 : Rat) / 21337981) [(1, 1), (3, 1)],
  term ((724319982 : Rat) / 21337981) [(1, 1), (3, 1), (4, 2)],
  term ((724319982 : Rat) / 21337981) [(1, 1), (3, 1), (5, 2)],
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0001_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0001
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0002 : Poly :=
[
  term ((418830453 : Rat) / 21337981) [(1, 1), (15, 1)]
]

/-- Partial product 2 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0002 : Poly :=
[
  term ((837660906 : Rat) / 21337981) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (2, 1), (15, 1)],
  term ((837660906 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-418830453 : Rat) / 21337981) [(1, 1), (4, 2), (15, 1)],
  term ((-418830453 : Rat) / 21337981) [(1, 1), (5, 2), (15, 1)],
  term ((418830453 : Rat) / 21337981) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0002_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0002
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0003 : Poly :=
[
  term ((22747230 : Rat) / 21337981) [(2, 1)]
]

/-- Partial product 3 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0003 : Poly :=
[
  term ((22747230 : Rat) / 21337981) [(2, 1)],
  term ((45494460 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1)],
  term ((-22747230 : Rat) / 21337981) [(2, 1), (4, 2)],
  term ((-22747230 : Rat) / 21337981) [(2, 1), (5, 2)],
  term ((-45494460 : Rat) / 21337981) [(2, 2)],
  term ((45494460 : Rat) / 21337981) [(2, 2), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0003_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0003
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0004 : Poly :=
[
  term ((7582410 : Rat) / 21337981) [(3, 1), (13, 1)]
]

/-- Partial product 4 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0004 : Poly :=
[
  term ((15164820 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-15164820 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1)],
  term ((-7582410 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1)],
  term ((-7582410 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1)],
  term ((7582410 : Rat) / 21337981) [(3, 1), (13, 1)],
  term ((15164820 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0004_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0004
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0005 : Poly :=
[
  term ((-900045756 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 5 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0005 : Poly :=
[
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)],
  term ((-1800091512 : Rat) / 21337981) [(3, 2), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0005_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0005
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0006 : Poly :=
[
  term ((180951732 : Rat) / 3048283) [(3, 1), (15, 1)]
]

/-- Partial product 6 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0006 : Poly :=
[
  term ((361903464 : Rat) / 3048283) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-361903464 : Rat) / 3048283) [(2, 1), (3, 1), (15, 1)],
  term ((-180951732 : Rat) / 3048283) [(3, 1), (4, 2), (15, 1)],
  term ((-180951732 : Rat) / 3048283) [(3, 1), (5, 2), (15, 1)],
  term ((180951732 : Rat) / 3048283) [(3, 1), (15, 1)],
  term ((361903464 : Rat) / 3048283) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0006_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0006
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0007 : Poly :=
[
  term ((-15154884 : Rat) / 21337981) [(13, 1), (15, 1)]
]

/-- Partial product 7 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0007 : Poly :=
[
  term ((-30309768 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((30309768 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)],
  term ((-30309768 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((15154884 : Rat) / 21337981) [(4, 2), (13, 1), (15, 1)],
  term ((15154884 : Rat) / 21337981) [(5, 2), (13, 1), (15, 1)],
  term ((-15154884 : Rat) / 21337981) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0007_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0007
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0008 : Poly :=
[
  term ((128679246 : Rat) / 21337981) [(14, 1)]
]

/-- Partial product 8 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0008 : Poly :=
[
  term ((257358492 : Rat) / 21337981) [(2, 1), (4, 1), (14, 1)],
  term ((-257358492 : Rat) / 21337981) [(2, 1), (14, 1)],
  term ((257358492 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1)],
  term ((-128679246 : Rat) / 21337981) [(4, 2), (14, 1)],
  term ((-128679246 : Rat) / 21337981) [(5, 2), (14, 1)],
  term ((128679246 : Rat) / 21337981) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0008_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0008
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0009 : Poly :=
[
  term ((619652556 : Rat) / 21337981) [(14, 1), (15, 2)]
]

/-- Partial product 9 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0009 : Poly :=
[
  term ((1239305112 : Rat) / 21337981) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((1239305112 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-619652556 : Rat) / 21337981) [(4, 2), (14, 1), (15, 2)],
  term ((-619652556 : Rat) / 21337981) [(5, 2), (14, 1), (15, 2)],
  term ((619652556 : Rat) / 21337981) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0009_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0009
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YYYNN_coefficient_10_0010 : Poly :=
[
  term ((-838376568 : Rat) / 21337981) [(15, 2)]
]

/-- Partial product 10 for generator 10. -/
def rs_R009_ueqv_R009YYYNN_partial_10_0010 : Poly :=
[
  term ((-1676753136 : Rat) / 21337981) [(2, 1), (4, 1), (15, 2)],
  term ((1676753136 : Rat) / 21337981) [(2, 1), (15, 2)],
  term ((-1676753136 : Rat) / 21337981) [(3, 1), (5, 1), (15, 2)],
  term ((838376568 : Rat) / 21337981) [(4, 2), (15, 2)],
  term ((838376568 : Rat) / 21337981) [(5, 2), (15, 2)],
  term ((-838376568 : Rat) / 21337981) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 10. -/
theorem rs_R009_ueqv_R009YYYNN_partial_10_0010_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_10_0010
        rs_R009_ueqv_R009YYYNN_generator_10_0000_0010 =
      rs_R009_ueqv_R009YYYNN_partial_10_0010 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_10_0000_0010 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_10_0000,
  rs_R009_ueqv_R009YYYNN_partial_10_0001,
  rs_R009_ueqv_R009YYYNN_partial_10_0002,
  rs_R009_ueqv_R009YYYNN_partial_10_0003,
  rs_R009_ueqv_R009YYYNN_partial_10_0004,
  rs_R009_ueqv_R009YYYNN_partial_10_0005,
  rs_R009_ueqv_R009YYYNN_partial_10_0006,
  rs_R009_ueqv_R009YYYNN_partial_10_0007,
  rs_R009_ueqv_R009YYYNN_partial_10_0008,
  rs_R009_ueqv_R009YYYNN_partial_10_0009,
  rs_R009_ueqv_R009YYYNN_partial_10_0010
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_10_0000_0010 : Poly :=
[
  term ((-85468329 : Rat) / 42675962) [],
  term ((1448639964 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1)],
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((837660906 : Rat) / 21337981) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-837660906 : Rat) / 21337981) [(1, 1), (2, 1), (15, 1)],
  term ((-724319982 : Rat) / 21337981) [(1, 1), (3, 1)],
  term ((724319982 : Rat) / 21337981) [(1, 1), (3, 1), (4, 2)],
  term ((837660906 : Rat) / 21337981) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((724319982 : Rat) / 21337981) [(1, 1), (3, 1), (5, 2)],
  term ((-1448639964 : Rat) / 21337981) [(1, 1), (3, 2), (5, 1)],
  term ((-418830453 : Rat) / 21337981) [(1, 1), (4, 2), (15, 1)],
  term ((-418830453 : Rat) / 21337981) [(1, 1), (5, 2), (15, 1)],
  term ((418830453 : Rat) / 21337981) [(1, 1), (15, 1)],
  term ((108215559 : Rat) / 21337981) [(2, 1)],
  term ((15164820 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((-1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((361903464 : Rat) / 3048283) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((45494460 : Rat) / 21337981) [(2, 1), (3, 1), (5, 1)],
  term ((-15164820 : Rat) / 21337981) [(2, 1), (3, 1), (13, 1)],
  term ((1800091512 : Rat) / 21337981) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-361903464 : Rat) / 3048283) [(2, 1), (3, 1), (15, 1)],
  term ((-85468329 : Rat) / 21337981) [(2, 1), (4, 1)],
  term ((-30309768 : Rat) / 21337981) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((257358492 : Rat) / 21337981) [(2, 1), (4, 1), (14, 1)],
  term ((1239305112 : Rat) / 21337981) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-1676753136 : Rat) / 21337981) [(2, 1), (4, 1), (15, 2)],
  term ((-22747230 : Rat) / 21337981) [(2, 1), (4, 2)],
  term ((-22747230 : Rat) / 21337981) [(2, 1), (5, 2)],
  term ((30309768 : Rat) / 21337981) [(2, 1), (13, 1), (15, 1)],
  term ((-257358492 : Rat) / 21337981) [(2, 1), (14, 1)],
  term ((-1239305112 : Rat) / 21337981) [(2, 1), (14, 1), (15, 2)],
  term ((1676753136 : Rat) / 21337981) [(2, 1), (15, 2)],
  term ((-45494460 : Rat) / 21337981) [(2, 2)],
  term ((45494460 : Rat) / 21337981) [(2, 2), (4, 1)],
  term ((-7582410 : Rat) / 21337981) [(3, 1), (4, 2), (13, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (4, 2), (14, 1), (15, 1)],
  term ((-180951732 : Rat) / 3048283) [(3, 1), (4, 2), (15, 1)],
  term ((-85468329 : Rat) / 21337981) [(3, 1), (5, 1)],
  term ((-30309768 : Rat) / 21337981) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((257358492 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1)],
  term ((1239305112 : Rat) / 21337981) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-1676753136 : Rat) / 21337981) [(3, 1), (5, 1), (15, 2)],
  term ((-7582410 : Rat) / 21337981) [(3, 1), (5, 2), (13, 1)],
  term ((900045756 : Rat) / 21337981) [(3, 1), (5, 2), (14, 1), (15, 1)],
  term ((-180951732 : Rat) / 3048283) [(3, 1), (5, 2), (15, 1)],
  term ((7582410 : Rat) / 21337981) [(3, 1), (13, 1)],
  term ((-900045756 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)],
  term ((180951732 : Rat) / 3048283) [(3, 1), (15, 1)],
  term ((15164820 : Rat) / 21337981) [(3, 2), (5, 1), (13, 1)],
  term ((-1800091512 : Rat) / 21337981) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((361903464 : Rat) / 3048283) [(3, 2), (5, 1), (15, 1)],
  term ((85468329 : Rat) / 42675962) [(4, 2)],
  term ((15154884 : Rat) / 21337981) [(4, 2), (13, 1), (15, 1)],
  term ((-128679246 : Rat) / 21337981) [(4, 2), (14, 1)],
  term ((-619652556 : Rat) / 21337981) [(4, 2), (14, 1), (15, 2)],
  term ((838376568 : Rat) / 21337981) [(4, 2), (15, 2)],
  term ((85468329 : Rat) / 42675962) [(5, 2)],
  term ((15154884 : Rat) / 21337981) [(5, 2), (13, 1), (15, 1)],
  term ((-128679246 : Rat) / 21337981) [(5, 2), (14, 1)],
  term ((-619652556 : Rat) / 21337981) [(5, 2), (14, 1), (15, 2)],
  term ((838376568 : Rat) / 21337981) [(5, 2), (15, 2)],
  term ((-15154884 : Rat) / 21337981) [(13, 1), (15, 1)],
  term ((128679246 : Rat) / 21337981) [(14, 1)],
  term ((619652556 : Rat) / 21337981) [(14, 1), (15, 2)],
  term ((-838376568 : Rat) / 21337981) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 10. -/
theorem rs_R009_ueqv_R009YYYNN_block_10_0000_0010_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_10_0000_0010
      rs_R009_ueqv_R009YYYNN_block_10_0000_0010 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
