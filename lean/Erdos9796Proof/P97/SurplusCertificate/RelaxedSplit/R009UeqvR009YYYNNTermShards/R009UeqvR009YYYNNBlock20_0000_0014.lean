/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 20:0-14

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0000 : Poly :=
[
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 0 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0000 : Poly :=
[
  term ((-682683336 : Rat) / 21337981) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-682683336 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0000_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0000
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0001 : Poly :=
[
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0001 : Poly :=
[
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0001_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0001
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0002 : Poly :=
[
  term ((212664591 : Rat) / 21337981) [(0, 1), (15, 2)]
]

/-- Partial product 2 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0002 : Poly :=
[
  term ((425329182 : Rat) / 21337981) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((425329182 : Rat) / 21337981) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (10, 2), (15, 2)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0002_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0002
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0003 : Poly :=
[
  term ((20818323 : Rat) / 21337981) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0003 : Poly :=
[
  term ((41636646 : Rat) / 21337981) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0003_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0003
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0004 : Poly :=
[
  term ((-67598721 : Rat) / 42675962) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0004 : Poly :=
[
  term ((-67598721 : Rat) / 21337981) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0004_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0004
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0005 : Poly :=
[
  term ((327566196 : Rat) / 21337981) [(2, 1), (15, 2)]
]

/-- Partial product 5 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0005 : Poly :=
[
  term ((655132392 : Rat) / 21337981) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((655132392 : Rat) / 21337981) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (10, 2), (15, 2)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0005_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0005
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0006 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 6 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0006 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0006_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0006
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0007 : Poly :=
[
  term ((-314293176 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 7 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0007 : Poly :=
[
  term ((-628586352 : Rat) / 21337981) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-628586352 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((314293176 : Rat) / 21337981) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((314293176 : Rat) / 21337981) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0007_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0007
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0008 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0008 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0008_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0008
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0009 : Poly :=
[
  term ((449727246 : Rat) / 21337981) [(3, 1), (15, 1)]
]

/-- Partial product 9 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0009 : Poly :=
[
  term ((899454492 : Rat) / 21337981) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((899454492 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-449727246 : Rat) / 21337981) [(3, 1), (10, 2), (15, 1)],
  term ((-449727246 : Rat) / 21337981) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0009_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0009
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0010 : Poly :=
[
  term ((-105281748 : Rat) / 21337981) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0010 : Poly :=
[
  term ((-210563496 : Rat) / 21337981) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0010_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0010
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0011 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0011 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0011_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0011
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0012 : Poly :=
[
  term ((17769393 : Rat) / 3048283) [(14, 1), (15, 2)]
]

/-- Partial product 12 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0012 : Poly :=
[
  term ((35538786 : Rat) / 3048283) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((35538786 : Rat) / 3048283) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-17769393 : Rat) / 3048283) [(10, 2), (14, 1), (15, 2)],
  term ((-17769393 : Rat) / 3048283) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0012_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0012
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0013 : Poly :=
[
  term ((-6244851 : Rat) / 435469) [(15, 2)]
]

/-- Partial product 13 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0013 : Poly :=
[
  term ((-12489702 : Rat) / 435469) [(8, 1), (10, 1), (15, 2)],
  term ((-12489702 : Rat) / 435469) [(9, 1), (11, 1), (15, 2)],
  term ((6244851 : Rat) / 435469) [(10, 2), (15, 2)],
  term ((6244851 : Rat) / 435469) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0013_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0013
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YYYNN_coefficient_20_0014 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(15, 2), (16, 1)]
]

/-- Partial product 14 for generator 20. -/
def rs_R009_ueqv_R009YYYNN_partial_20_0014 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(10, 2), (15, 2), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 20. -/
theorem rs_R009_ueqv_R009YYYNN_partial_20_0014_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_20_0014
        rs_R009_ueqv_R009YYYNN_generator_20_0000_0014 =
      rs_R009_ueqv_R009YYYNN_partial_20_0014 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_20_0000_0014 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_20_0000,
  rs_R009_ueqv_R009YYYNN_partial_20_0001,
  rs_R009_ueqv_R009YYYNN_partial_20_0002,
  rs_R009_ueqv_R009YYYNN_partial_20_0003,
  rs_R009_ueqv_R009YYYNN_partial_20_0004,
  rs_R009_ueqv_R009YYYNN_partial_20_0005,
  rs_R009_ueqv_R009YYYNN_partial_20_0006,
  rs_R009_ueqv_R009YYYNN_partial_20_0007,
  rs_R009_ueqv_R009YYYNN_partial_20_0008,
  rs_R009_ueqv_R009YYYNN_partial_20_0009,
  rs_R009_ueqv_R009YYYNN_partial_20_0010,
  rs_R009_ueqv_R009YYYNN_partial_20_0011,
  rs_R009_ueqv_R009YYYNN_partial_20_0012,
  rs_R009_ueqv_R009YYYNN_partial_20_0013,
  rs_R009_ueqv_R009YYYNN_partial_20_0014
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_20_0000_0014 : Poly :=
[
  term ((-682683336 : Rat) / 21337981) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-682683336 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (10, 2), (15, 2)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (11, 2), (15, 2)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((655132392 : Rat) / 21337981) [(2, 1), (8, 1), (10, 1), (15, 2)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((655132392 : Rat) / 21337981) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-163783098 : Rat) / 21337981) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (10, 2), (15, 2)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-327566196 : Rat) / 21337981) [(2, 1), (11, 2), (15, 2)],
  term ((81891549 : Rat) / 21337981) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-628586352 : Rat) / 21337981) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((899454492 : Rat) / 21337981) [(3, 1), (8, 1), (10, 1), (15, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-628586352 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((899454492 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-210563496 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((314293176 : Rat) / 21337981) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-449727246 : Rat) / 21337981) [(3, 1), (10, 2), (15, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((314293176 : Rat) / 21337981) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-449727246 : Rat) / 21337981) [(3, 1), (11, 2), (15, 1)],
  term ((105281748 : Rat) / 21337981) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((35538786 : Rat) / 3048283) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-12489702 : Rat) / 435469) [(8, 1), (10, 1), (15, 2)],
  term ((142964775 : Rat) / 21337981) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35538786 : Rat) / 3048283) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-12489702 : Rat) / 435469) [(9, 1), (11, 1), (15, 2)],
  term ((142964775 : Rat) / 21337981) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17769393 : Rat) / 3048283) [(10, 2), (14, 1), (15, 2)],
  term ((6244851 : Rat) / 435469) [(10, 2), (15, 2)],
  term ((-142964775 : Rat) / 42675962) [(10, 2), (15, 2), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-17769393 : Rat) / 3048283) [(11, 2), (14, 1), (15, 2)],
  term ((6244851 : Rat) / 435469) [(11, 2), (15, 2)],
  term ((-142964775 : Rat) / 42675962) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 14. -/
theorem rs_R009_ueqv_R009YYYNN_block_20_0000_0014_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_20_0000_0014
      rs_R009_ueqv_R009YYYNN_block_20_0000_0014 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
