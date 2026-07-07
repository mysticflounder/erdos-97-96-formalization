/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 24:0-26

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0000 : Poly :=
[
  term ((341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 0 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0000 : Poly :=
[
  term ((-682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((-682683336 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((341341668 : Rat) / 21337981) [(0, 3), (3, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0000_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0000
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0001 : Poly :=
[
  term ((-954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0001 : Poly :=
[
  term ((1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((1909404 : Rat) / 435469) [(0, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((-954702 : Rat) / 435469) [(0, 3), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0001_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0001
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0002 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0002 : Poly :=
[
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((2654642808 : Rat) / 21337981) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0002_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0002
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0003 : Poly :=
[
  term ((663660702 : Rat) / 21337981) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0003 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((663660702 : Rat) / 21337981) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-663660702 : Rat) / 21337981) [(0, 1), (3, 1), (15, 3)],
  term ((-1327321404 : Rat) / 21337981) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((663660702 : Rat) / 21337981) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0003_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0003
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0004 : Poly :=
[
  term ((-212664591 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 4 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0004 : Poly :=
[
  term ((425329182 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (9, 1), (15, 3)],
  term ((425329182 : Rat) / 21337981) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0004_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0004
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0005 : Poly :=
[
  term ((-20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0005 : Poly :=
[
  term ((41636646 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0005_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0005
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0006 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0006 : Poly :=
[
  term ((-197559972 : Rat) / 3048283) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((197559972 : Rat) / 3048283) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (13, 1), (15, 3)],
  term ((-197559972 : Rat) / 3048283) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0006_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0006
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0007 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(0, 1), (15, 2)]
]

/-- Partial product 7 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0007 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(0, 1), (1, 2), (15, 2)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(0, 1), (14, 2), (15, 2)],
  term ((49389993 : Rat) / 3048283) [(0, 1), (15, 4)],
  term ((98779986 : Rat) / 3048283) [(0, 2), (10, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0007_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0007
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0008 : Poly :=
[
  term ((663660702 : Rat) / 21337981) [(1, 1), (3, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0008 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((663660702 : Rat) / 21337981) [(0, 2), (1, 1), (3, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-663660702 : Rat) / 21337981) [(1, 1), (3, 1), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(1, 1), (3, 1), (15, 2)],
  term ((-1327321404 : Rat) / 21337981) [(1, 2), (3, 1), (11, 1)],
  term ((663660702 : Rat) / 21337981) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0008_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0008
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0009 : Poly :=
[
  term ((-663660702 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0009 : Poly :=
[
  term ((1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-663660702 : Rat) / 21337981) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (10, 1), (14, 2)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((663660702 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((663660702 : Rat) / 21337981) [(1, 1), (3, 1), (14, 3)],
  term ((1327321404 : Rat) / 21337981) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-663660702 : Rat) / 21337981) [(1, 3), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0009_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0009
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0010 : Poly :=
[
  term ((67598721 : Rat) / 42675962) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0010 : Poly :=
[
  term ((-67598721 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0010_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0010
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0011 : Poly :=
[
  term ((49389993 : Rat) / 3048283) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 11 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0011 : Poly :=
[
  term ((-98779986 : Rat) / 3048283) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(1, 1), (14, 1), (15, 3)],
  term ((-49389993 : Rat) / 3048283) [(1, 1), (14, 3), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0011_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0011
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0012 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(1, 1), (15, 1)]
]

/-- Partial product 12 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0012 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(0, 2), (1, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (11, 1), (15, 2)],
  term ((49389993 : Rat) / 3048283) [(1, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 1), (15, 3)],
  term ((98779986 : Rat) / 3048283) [(1, 2), (11, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0012_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0012
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0013 : Poly :=
[
  term ((-327566196 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0013 : Poly :=
[
  term ((655132392 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((655132392 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0013_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0013
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0014 : Poly :=
[
  term ((81891549 : Rat) / 21337981) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0014 : Poly :=
[
  term ((-163783098 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0014_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0014
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0015 : Poly :=
[
  term ((-449727246 : Rat) / 21337981) [(3, 1), (9, 1)]
]

/-- Partial product 15 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0015 : Poly :=
[
  term ((899454492 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((-449727246 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1)],
  term ((899454492 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-449727246 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1)],
  term ((-899454492 : Rat) / 21337981) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-899454492 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((449727246 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2)],
  term ((449727246 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0015_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0015
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0016 : Poly :=
[
  term ((314293176 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0016 : Poly :=
[
  term ((-628586352 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((314293176 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-628586352 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((314293176 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0016_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0016
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0017 : Poly :=
[
  term ((-81891549 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 17 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0017 : Poly :=
[
  term ((163783098 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((163783098 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-81891549 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0017_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0017
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0018 : Poly :=
[
  term ((105281748 : Rat) / 21337981) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0018 : Poly :=
[
  term ((-210563496 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0018_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0018
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0019 : Poly :=
[
  term ((663660702 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 19 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0019 : Poly :=
[
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((663660702 : Rat) / 21337981) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((663660702 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0019_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0019
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0020 : Poly :=
[
  term ((-331830351 : Rat) / 21337981) [(3, 1), (15, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0020 : Poly :=
[
  term ((663660702 : Rat) / 21337981) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-331830351 : Rat) / 21337981) [(0, 2), (3, 1), (15, 1)],
  term ((663660702 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-331830351 : Rat) / 21337981) [(1, 2), (3, 1), (15, 1)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (15, 2)],
  term ((331830351 : Rat) / 21337981) [(3, 1), (14, 2), (15, 1)],
  term ((331830351 : Rat) / 21337981) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0020_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0020
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0021 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0021 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0021_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0021
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0022 : Poly :=
[
  term ((-17769393 : Rat) / 3048283) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0022 : Poly :=
[
  term ((35538786 : Rat) / 3048283) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17769393 : Rat) / 3048283) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((35538786 : Rat) / 3048283) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-17769393 : Rat) / 3048283) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-35538786 : Rat) / 3048283) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-35538786 : Rat) / 3048283) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((17769393 : Rat) / 3048283) [(9, 1), (14, 1), (15, 3)],
  term ((17769393 : Rat) / 3048283) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0022_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0022
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0023 : Poly :=
[
  term ((6244851 : Rat) / 435469) [(9, 1), (15, 1)]
]

/-- Partial product 23 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0023 : Poly :=
[
  term ((-12489702 : Rat) / 435469) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((6244851 : Rat) / 435469) [(0, 2), (9, 1), (15, 1)],
  term ((-12489702 : Rat) / 435469) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((6244851 : Rat) / 435469) [(1, 2), (9, 1), (15, 1)],
  term ((12489702 : Rat) / 435469) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((12489702 : Rat) / 435469) [(9, 1), (11, 1), (15, 2)],
  term ((-6244851 : Rat) / 435469) [(9, 1), (14, 2), (15, 1)],
  term ((-6244851 : Rat) / 435469) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0023_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0023
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0024 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0024 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0024_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0024
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0025 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 25 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0025 : Poly :=
[
  term ((98779986 : Rat) / 3048283) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((49389993 : Rat) / 3048283) [(13, 1), (14, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0025_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0025
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YYYNN_coefficient_24_0026 : Poly :=
[
  term ((49389993 : Rat) / 6096566) [(15, 2)]
]

/-- Partial product 26 for generator 24. -/
def rs_R009_ueqv_R009YYYNN_partial_24_0026 : Poly :=
[
  term ((-49389993 : Rat) / 3048283) [(0, 1), (10, 1), (15, 2)],
  term ((49389993 : Rat) / 6096566) [(0, 2), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(1, 1), (11, 1), (15, 2)],
  term ((49389993 : Rat) / 6096566) [(1, 2), (15, 2)],
  term ((49389993 : Rat) / 3048283) [(10, 1), (14, 1), (15, 2)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (15, 3)],
  term ((-49389993 : Rat) / 6096566) [(14, 2), (15, 2)],
  term ((-49389993 : Rat) / 6096566) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 24. -/
theorem rs_R009_ueqv_R009YYYNN_partial_24_0026_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_24_0026
        rs_R009_ueqv_R009YYYNN_generator_24_0000_0026 =
      rs_R009_ueqv_R009YYYNN_partial_24_0026 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_24_0000_0026 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_24_0000,
  rs_R009_ueqv_R009YYYNN_partial_24_0001,
  rs_R009_ueqv_R009YYYNN_partial_24_0002,
  rs_R009_ueqv_R009YYYNN_partial_24_0003,
  rs_R009_ueqv_R009YYYNN_partial_24_0004,
  rs_R009_ueqv_R009YYYNN_partial_24_0005,
  rs_R009_ueqv_R009YYYNN_partial_24_0006,
  rs_R009_ueqv_R009YYYNN_partial_24_0007,
  rs_R009_ueqv_R009YYYNN_partial_24_0008,
  rs_R009_ueqv_R009YYYNN_partial_24_0009,
  rs_R009_ueqv_R009YYYNN_partial_24_0010,
  rs_R009_ueqv_R009YYYNN_partial_24_0011,
  rs_R009_ueqv_R009YYYNN_partial_24_0012,
  rs_R009_ueqv_R009YYYNN_partial_24_0013,
  rs_R009_ueqv_R009YYYNN_partial_24_0014,
  rs_R009_ueqv_R009YYYNN_partial_24_0015,
  rs_R009_ueqv_R009YYYNN_partial_24_0016,
  rs_R009_ueqv_R009YYYNN_partial_24_0017,
  rs_R009_ueqv_R009YYYNN_partial_24_0018,
  rs_R009_ueqv_R009YYYNN_partial_24_0019,
  rs_R009_ueqv_R009YYYNN_partial_24_0020,
  rs_R009_ueqv_R009YYYNN_partial_24_0021,
  rs_R009_ueqv_R009YYYNN_partial_24_0022,
  rs_R009_ueqv_R009YYYNN_partial_24_0023,
  rs_R009_ueqv_R009YYYNN_partial_24_0024,
  rs_R009_ueqv_R009YYYNN_partial_24_0025,
  rs_R009_ueqv_R009YYYNN_partial_24_0026
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_24_0000_0026 : Poly :=
[
  term ((-682683336 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1)],
  term ((1909404 : Rat) / 435469) [(0, 1), (1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (10, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (10, 1), (14, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-67598721 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (1, 1), (10, 1), (15, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((341341668 : Rat) / 21337981) [(0, 1), (1, 2), (3, 1), (9, 1)],
  term ((-954702 : Rat) / 435469) [(0, 1), (1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((663660702 : Rat) / 21337981) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(0, 1), (1, 2), (15, 2)],
  term ((655132392 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((899454492 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (10, 1)],
  term ((54096984 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((70222302 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((682683336 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1909404 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-341341668 : Rat) / 21337981) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((954702 : Rat) / 435469) [(0, 1), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3981964212 : Rat) / 21337981) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((663660702 : Rat) / 21337981) [(0, 1), (3, 1), (10, 1), (15, 1)],
  term ((-2654642808 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((1327321404 : Rat) / 21337981) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-663660702 : Rat) / 21337981) [(0, 1), (3, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-176557680 : Rat) / 21337981) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12489702 : Rat) / 435469) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-425329182 : Rat) / 21337981) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-41636646 : Rat) / 21337981) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((212664591 : Rat) / 21337981) [(0, 1), (9, 1), (15, 3)],
  term ((20818323 : Rat) / 21337981) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((296339958 : Rat) / 3048283) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(0, 1), (10, 1), (15, 2)],
  term ((197559972 : Rat) / 3048283) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (11, 1), (15, 3)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-98779986 : Rat) / 3048283) [(0, 1), (13, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(0, 1), (14, 2), (15, 2)],
  term ((49389993 : Rat) / 3048283) [(0, 1), (15, 4)],
  term ((663660702 : Rat) / 21337981) [(0, 2), (1, 1), (3, 1)],
  term ((-663660702 : Rat) / 21337981) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((67598721 : Rat) / 42675962) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((49389993 : Rat) / 3048283) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(0, 2), (1, 1), (15, 1)],
  term ((-327566196 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-449727246 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1)],
  term ((-682683336 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((1909404 : Rat) / 435469) [(0, 2), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((314293176 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((2654642808 : Rat) / 21337981) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((663660702 : Rat) / 21337981) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-331830351 : Rat) / 21337981) [(0, 2), (3, 1), (15, 1)],
  term ((425329182 : Rat) / 21337981) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((41636646 : Rat) / 21337981) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-17769393 : Rat) / 3048283) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((6244851 : Rat) / 435469) [(0, 2), (9, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-197559972 : Rat) / 3048283) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 2), (10, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 6096566) [(0, 2), (15, 2)],
  term ((341341668 : Rat) / 21337981) [(0, 3), (3, 1), (9, 1)],
  term ((-954702 : Rat) / 435469) [(0, 3), (3, 1), (9, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(0, 3), (3, 1), (13, 1)],
  term ((663660702 : Rat) / 21337981) [(0, 3), (3, 1), (15, 1)],
  term ((-212664591 : Rat) / 21337981) [(0, 3), (9, 1), (15, 1)],
  term ((-20818323 : Rat) / 21337981) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((98779986 : Rat) / 3048283) [(0, 3), (13, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(0, 3), (15, 2)],
  term ((655132392 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((899454492 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-628586352 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1)],
  term ((163783098 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-210563496 : Rat) / 21337981) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (10, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (10, 1), (14, 2)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((1990982106 : Rat) / 21337981) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((663660702 : Rat) / 21337981) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(1, 1), (3, 1), (14, 2)],
  term ((663660702 : Rat) / 21337981) [(1, 1), (3, 1), (14, 3)],
  term ((-663660702 : Rat) / 21337981) [(1, 1), (3, 1), (15, 2)],
  term ((67598721 : Rat) / 21337981) [(1, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((35538786 : Rat) / 3048283) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-12489702 : Rat) / 435469) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((210563496 : Rat) / 21337981) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1), (14, 2), (16, 1)],
  term ((-67598721 : Rat) / 42675962) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-148169979 : Rat) / 3048283) [(1, 1), (11, 1), (15, 2)],
  term ((-49389993 : Rat) / 3048283) [(1, 1), (14, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(1, 1), (14, 2), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 1), (14, 3), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 1), (15, 3)],
  term ((-327566196 : Rat) / 21337981) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((81891549 : Rat) / 21337981) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-449727246 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1)],
  term ((314293176 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-81891549 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((105281748 : Rat) / 21337981) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-1327321404 : Rat) / 21337981) [(1, 2), (3, 1), (11, 1)],
  term ((1327321404 : Rat) / 21337981) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((663660702 : Rat) / 21337981) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-331830351 : Rat) / 21337981) [(1, 2), (3, 1), (15, 1)],
  term ((-67598721 : Rat) / 21337981) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-17769393 : Rat) / 3048283) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((6244851 : Rat) / 435469) [(1, 2), (9, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-98779986 : Rat) / 3048283) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((98779986 : Rat) / 3048283) [(1, 2), (11, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((49389993 : Rat) / 6096566) [(1, 2), (15, 2)],
  term ((663660702 : Rat) / 21337981) [(1, 3), (3, 1)],
  term ((-663660702 : Rat) / 21337981) [(1, 3), (3, 1), (14, 1)],
  term ((67598721 : Rat) / 42675962) [(1, 3), (9, 1), (16, 1)],
  term ((49389993 : Rat) / 3048283) [(1, 3), (14, 1), (15, 1)],
  term ((-49389993 : Rat) / 3048283) [(1, 3), (15, 1)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-655132392 : Rat) / 21337981) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((163783098 : Rat) / 21337981) [(2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((327566196 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3)],
  term ((-81891549 : Rat) / 21337981) [(2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-899454492 : Rat) / 21337981) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((628586352 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-163783098 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-899454492 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((210563496 : Rat) / 21337981) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((449727246 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-314293176 : Rat) / 21337981) [(3, 1), (9, 1), (14, 3)],
  term ((81891549 : Rat) / 21337981) [(3, 1), (9, 1), (14, 3), (16, 1)],
  term ((449727246 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2)],
  term ((-105281748 : Rat) / 21337981) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((1327321404 : Rat) / 21337981) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (11, 1), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-663660702 : Rat) / 21337981) [(3, 1), (13, 1), (14, 3)],
  term ((331830351 : Rat) / 21337981) [(3, 1), (14, 2), (15, 1)],
  term ((331830351 : Rat) / 21337981) [(3, 1), (15, 3)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((12489702 : Rat) / 435469) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35538786 : Rat) / 3048283) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((17753203 : Rat) / 21337981) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35538786 : Rat) / 3048283) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((12489702 : Rat) / 435469) [(9, 1), (11, 1), (15, 2)],
  term ((-142964775 : Rat) / 21337981) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((17769393 : Rat) / 3048283) [(9, 1), (14, 1), (15, 3)],
  term ((-6244851 : Rat) / 435469) [(9, 1), (14, 2), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((17769393 : Rat) / 3048283) [(9, 1), (14, 3), (15, 1)],
  term ((-6244851 : Rat) / 435469) [(9, 1), (15, 3)],
  term ((142964775 : Rat) / 42675962) [(9, 1), (15, 3), (16, 1)],
  term ((-98779986 : Rat) / 3048283) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((49389993 : Rat) / 3048283) [(10, 1), (14, 1), (15, 2)],
  term ((-98779986 : Rat) / 3048283) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((49389993 : Rat) / 3048283) [(11, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(13, 1), (14, 1), (15, 3)],
  term ((49389993 : Rat) / 3048283) [(13, 1), (14, 3), (15, 1)],
  term ((-49389993 : Rat) / 6096566) [(14, 2), (15, 2)],
  term ((-49389993 : Rat) / 6096566) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 26. -/
theorem rs_R009_ueqv_R009YYYNN_block_24_0000_0026_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_24_0000_0026
      rs_R009_ueqv_R009YYYNN_block_24_0000_0026 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
