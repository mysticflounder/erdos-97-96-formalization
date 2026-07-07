/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 1:0-59

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 1 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_01_0000_0059 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0000 : Poly :=
[
  term ((9319 : Rat) / 1198) []
]

/-- Partial product 0 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0000 : Poly :=
[
  term ((9319 : Rat) / 1198) [(0, 2)],
  term ((9319 : Rat) / 1198) [(1, 2)],
  term ((-9319 : Rat) / 1198) [(8, 2)],
  term ((-9319 : Rat) / 1198) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0000_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0000
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0001 : Poly :=
[
  term ((-19710 : Rat) / 599) [(0, 1)]
]

/-- Partial product 1 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0001 : Poly :=
[
  term ((-19710 : Rat) / 599) [(0, 1), (1, 2)],
  term ((19710 : Rat) / 599) [(0, 1), (8, 2)],
  term ((19710 : Rat) / 599) [(0, 1), (9, 2)],
  term ((-19710 : Rat) / 599) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0001_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0001
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0002 : Poly :=
[
  term ((-107136 : Rat) / 2995) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 2 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0002 : Poly :=
[
  term ((-107136 : Rat) / 2995) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((107136 : Rat) / 2995) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((107136 : Rat) / 2995) [(0, 1), (9, 3), (11, 1)],
  term ((-107136 : Rat) / 2995) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0002_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0002
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0003 : Poly :=
[
  term ((170688 : Rat) / 2995) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 3 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0003 : Poly :=
[
  term ((170688 : Rat) / 2995) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (9, 3), (15, 1)],
  term ((170688 : Rat) / 2995) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0003_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0003
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0004 : Poly :=
[
  term ((-64 : Rat) / 5) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0004 : Poly :=
[
  term ((-64 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((-64 : Rat) / 5) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0004_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0004
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0005 : Poly :=
[
  term ((-137088 : Rat) / 2995) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 5 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0005 : Poly :=
[
  term ((-137088 : Rat) / 2995) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((137088 : Rat) / 2995) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((137088 : Rat) / 2995) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((-137088 : Rat) / 2995) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0005_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0005
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0006 : Poly :=
[
  term ((132 : Rat) / 5) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0006 : Poly :=
[
  term ((132 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 5) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-132 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 5) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0006_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0006
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0007 : Poly :=
[
  term ((321408 : Rat) / 2995) [(0, 1), (11, 2)]
]

/-- Partial product 7 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0007 : Poly :=
[
  term ((321408 : Rat) / 2995) [(0, 1), (1, 2), (11, 2)],
  term ((-321408 : Rat) / 2995) [(0, 1), (8, 2), (11, 2)],
  term ((-321408 : Rat) / 2995) [(0, 1), (9, 2), (11, 2)],
  term ((321408 : Rat) / 2995) [(0, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0007_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0007
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0008 : Poly :=
[
  term ((-170688 : Rat) / 2995) [(0, 1), (15, 2)]
]

/-- Partial product 8 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0008 : Poly :=
[
  term ((-170688 : Rat) / 2995) [(0, 1), (1, 2), (15, 2)],
  term ((170688 : Rat) / 2995) [(0, 1), (8, 2), (15, 2)],
  term ((170688 : Rat) / 2995) [(0, 1), (9, 2), (15, 2)],
  term ((-170688 : Rat) / 2995) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0008_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0008
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0009 : Poly :=
[
  term ((64 : Rat) / 5) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 9 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0009 : Poly :=
[
  term ((64 : Rat) / 5) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((-64 : Rat) / 5) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((64 : Rat) / 5) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0009_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0009
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0010 : Poly :=
[
  term ((254448 : Rat) / 2995) [(1, 1), (11, 1)]
]

/-- Partial product 10 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0010 : Poly :=
[
  term ((254448 : Rat) / 2995) [(0, 2), (1, 1), (11, 1)],
  term ((-254448 : Rat) / 2995) [(1, 1), (8, 2), (11, 1)],
  term ((-254448 : Rat) / 2995) [(1, 1), (9, 2), (11, 1)],
  term ((254448 : Rat) / 2995) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0010_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0010
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0011 : Poly :=
[
  term ((194112 : Rat) / 599) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 11 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0011 : Poly :=
[
  term ((194112 : Rat) / 599) [(0, 2), (1, 1), (11, 1), (15, 2)],
  term ((-194112 : Rat) / 599) [(1, 1), (8, 2), (11, 1), (15, 2)],
  term ((-194112 : Rat) / 599) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((194112 : Rat) / 599) [(1, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0011_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0011
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0012 : Poly :=
[
  term ((-264 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 12 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0012 : Poly :=
[
  term ((-264 : Rat) / 5) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((264 : Rat) / 5) [(1, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((264 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-264 : Rat) / 5) [(1, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0012_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0012
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0013 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 13 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0013 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((642816 : Rat) / 2995) [(1, 1), (8, 2), (11, 2), (15, 1)],
  term ((642816 : Rat) / 2995) [(1, 1), (9, 2), (11, 2), (15, 1)],
  term ((-642816 : Rat) / 2995) [(1, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0013_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0013
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0014 : Poly :=
[
  term ((-112764 : Rat) / 2995) [(1, 1), (15, 1)]
]

/-- Partial product 14 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0014 : Poly :=
[
  term ((-112764 : Rat) / 2995) [(0, 2), (1, 1), (15, 1)],
  term ((112764 : Rat) / 2995) [(1, 1), (8, 2), (15, 1)],
  term ((112764 : Rat) / 2995) [(1, 1), (9, 2), (15, 1)],
  term ((-112764 : Rat) / 2995) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0014_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0014
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0015 : Poly :=
[
  term ((37 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0015 : Poly :=
[
  term ((37 : Rat) / 5) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-37 : Rat) / 5) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-37 : Rat) / 5) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((37 : Rat) / 5) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0015_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0015
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0016 : Poly :=
[
  term ((-98496 : Rat) / 2995) [(1, 1), (15, 3)]
]

/-- Partial product 16 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0016 : Poly :=
[
  term ((-98496 : Rat) / 2995) [(0, 2), (1, 1), (15, 3)],
  term ((98496 : Rat) / 2995) [(1, 1), (8, 2), (15, 3)],
  term ((98496 : Rat) / 2995) [(1, 1), (9, 2), (15, 3)],
  term ((-98496 : Rat) / 2995) [(1, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0016_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0016
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0017 : Poly :=
[
  term ((-12 : Rat) / 5) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 17 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0017 : Poly :=
[
  term ((-12 : Rat) / 5) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 5) [(1, 1), (8, 2), (15, 3), (16, 1)],
  term ((12 : Rat) / 5) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((-12 : Rat) / 5) [(1, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0017_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0017
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0018 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 18 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0018 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (8, 2), (9, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0018_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0018
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0019 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 19 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0019 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(2, 1), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0019_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0019
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0020 : Poly :=
[
  term ((636 : Rat) / 5) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0020 : Poly :=
[
  term ((636 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(2, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(2, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0020_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0020
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0021 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 21 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0021 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-2571264 : Rat) / 2995) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(2, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0021_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0021
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0022 : Poly :=
[
  term (-12 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0022 : Poly :=
[
  term (-12 : Rat) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0022_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0022
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0023 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(2, 1), (15, 2)]
]

/-- Partial product 23 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0023 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(0, 2), (2, 1), (15, 2)],
  term ((2757312 : Rat) / 2995) [(1, 2), (2, 1), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(2, 1), (8, 2), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(2, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0023_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0023
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0024 : Poly :=
[
  term ((-636 : Rat) / 5) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0024 : Poly :=
[
  term ((-636 : Rat) / 5) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-636 : Rat) / 5) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(2, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0024_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0024
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0025 : Poly :=
[
  term ((160704 : Rat) / 2995) [(3, 1), (11, 1)]
]

/-- Partial product 25 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0025 : Poly :=
[
  term ((160704 : Rat) / 2995) [(0, 2), (3, 1), (11, 1)],
  term ((160704 : Rat) / 2995) [(1, 2), (3, 1), (11, 1)],
  term ((-160704 : Rat) / 2995) [(3, 1), (8, 2), (11, 1)],
  term ((-160704 : Rat) / 2995) [(3, 1), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0025_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0025
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0026 : Poly :=
[
  term ((-122112 : Rat) / 2995) [(3, 1), (15, 1)]
]

/-- Partial product 26 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0026 : Poly :=
[
  term ((-122112 : Rat) / 2995) [(0, 2), (3, 1), (15, 1)],
  term ((-122112 : Rat) / 2995) [(1, 2), (3, 1), (15, 1)],
  term ((122112 : Rat) / 2995) [(3, 1), (8, 2), (15, 1)],
  term ((122112 : Rat) / 2995) [(3, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0026_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0026
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0027 : Poly :=
[
  term ((36 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0027 : Poly :=
[
  term ((36 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0027_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0027
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0028 : Poly :=
[
  term ((19710 : Rat) / 599) [(8, 1)]
]

/-- Partial product 28 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0028 : Poly :=
[
  term ((19710 : Rat) / 599) [(0, 2), (8, 1)],
  term ((19710 : Rat) / 599) [(1, 2), (8, 1)],
  term ((-19710 : Rat) / 599) [(8, 1), (9, 2)],
  term ((-19710 : Rat) / 599) [(8, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0028_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0028
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0029 : Poly :=
[
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 29 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0029 : Poly :=
[
  term ((857088 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((857088 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-857088 : Rat) / 2995) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-857088 : Rat) / 2995) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0029_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0029
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0030 : Poly :=
[
  term ((903312 : Rat) / 2995) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 30 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0030 : Poly :=
[
  term ((903312 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((903312 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-903312 : Rat) / 2995) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-903312 : Rat) / 2995) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0030_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0030
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0031 : Poly :=
[
  term ((-864 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0031 : Poly :=
[
  term ((-864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 5) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0031_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0031
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0032 : Poly :=
[
  term ((-2651616 : Rat) / 2995) [(8, 1), (11, 2)]
]

/-- Partial product 32 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0032 : Poly :=
[
  term ((-2651616 : Rat) / 2995) [(0, 2), (8, 1), (11, 2)],
  term ((-2651616 : Rat) / 2995) [(1, 2), (8, 1), (11, 2)],
  term ((2651616 : Rat) / 2995) [(8, 1), (9, 2), (11, 2)],
  term ((2651616 : Rat) / 2995) [(8, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0032_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0032
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0033 : Poly :=
[
  term ((-919104 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 33 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0033 : Poly :=
[
  term ((-919104 : Rat) / 2995) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-919104 : Rat) / 2995) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((919104 : Rat) / 2995) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((919104 : Rat) / 2995) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0033_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0033
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0034 : Poly :=
[
  term ((212 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0034 : Poly :=
[
  term ((212 : Rat) / 5) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((212 : Rat) / 5) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-212 : Rat) / 5) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-212 : Rat) / 5) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0034_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0034
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0035 : Poly :=
[
  term ((1838208 : Rat) / 2995) [(8, 1), (15, 2)]
]

/-- Partial product 35 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0035 : Poly :=
[
  term ((1838208 : Rat) / 2995) [(0, 2), (8, 1), (15, 2)],
  term ((1838208 : Rat) / 2995) [(1, 2), (8, 1), (15, 2)],
  term ((-1838208 : Rat) / 2995) [(8, 1), (9, 2), (15, 2)],
  term ((-1838208 : Rat) / 2995) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0035_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0035
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0036 : Poly :=
[
  term ((-424 : Rat) / 5) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 36 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0036 : Poly :=
[
  term ((-424 : Rat) / 5) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-424 : Rat) / 5) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((424 : Rat) / 5) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((424 : Rat) / 5) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0036_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0036
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0037 : Poly :=
[
  term ((-2531088 : Rat) / 2995) [(9, 1), (11, 1)]
]

/-- Partial product 37 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0037 : Poly :=
[
  term ((-2531088 : Rat) / 2995) [(0, 2), (9, 1), (11, 1)],
  term ((-2531088 : Rat) / 2995) [(1, 2), (9, 1), (11, 1)],
  term ((2531088 : Rat) / 2995) [(8, 2), (9, 1), (11, 1)],
  term ((2531088 : Rat) / 2995) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0037_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0037
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0038 : Poly :=
[
  term ((256032 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 38 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0038 : Poly :=
[
  term ((256032 : Rat) / 2995) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((256032 : Rat) / 2995) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-256032 : Rat) / 2995) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-256032 : Rat) / 2995) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0038_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0038
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0039 : Poly :=
[
  term ((-96 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0039 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0039_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0039
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0040 : Poly :=
[
  term ((458496 : Rat) / 2995) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 40 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0040 : Poly :=
[
  term ((458496 : Rat) / 2995) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((458496 : Rat) / 2995) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-458496 : Rat) / 2995) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-458496 : Rat) / 2995) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0040_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0040
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0041 : Poly :=
[
  term ((-72 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0041 : Poly :=
[
  term ((-72 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0041_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0041
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0042 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 42 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0042 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((-160704 : Rat) / 2995) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((160704 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((160704 : Rat) / 2995) [(9, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0042_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0042
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0043 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 43 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0043 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-321408 : Rat) / 2995) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((321408 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((321408 : Rat) / 2995) [(9, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0043_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0043
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0044 : Poly :=
[
  term ((2740404 : Rat) / 2995) [(9, 1), (15, 1)]
]

/-- Partial product 44 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0044 : Poly :=
[
  term ((2740404 : Rat) / 2995) [(0, 2), (9, 1), (15, 1)],
  term ((2740404 : Rat) / 2995) [(1, 2), (9, 1), (15, 1)],
  term ((-2740404 : Rat) / 2995) [(8, 2), (9, 1), (15, 1)],
  term ((-2740404 : Rat) / 2995) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0044_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0044
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0045 : Poly :=
[
  term ((-612 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0045 : Poly :=
[
  term ((-612 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-612 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((612 : Rat) / 5) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((612 : Rat) / 5) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0045_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0045
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0046 : Poly :=
[
  term ((-98496 : Rat) / 2995) [(9, 1), (15, 3)]
]

/-- Partial product 46 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0046 : Poly :=
[
  term ((-98496 : Rat) / 2995) [(0, 2), (9, 1), (15, 3)],
  term ((-98496 : Rat) / 2995) [(1, 2), (9, 1), (15, 3)],
  term ((98496 : Rat) / 2995) [(8, 2), (9, 1), (15, 3)],
  term ((98496 : Rat) / 2995) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0046_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0046
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0047 : Poly :=
[
  term ((-12 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 47 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0047 : Poly :=
[
  term ((-12 : Rat) / 5) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-12 : Rat) / 5) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 5) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 5) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0047_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0047
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0048 : Poly :=
[
  term (6 : Rat) [(10, 1)]
]

/-- Partial product 48 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0048 : Poly :=
[
  term (6 : Rat) [(0, 2), (10, 1)],
  term (6 : Rat) [(1, 2), (10, 1)],
  term (-6 : Rat) [(8, 2), (10, 1)],
  term (-6 : Rat) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0048_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0048
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0049 : Poly :=
[
  term ((-620496 : Rat) / 2995) [(11, 1), (13, 1)]
]

/-- Partial product 49 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0049 : Poly :=
[
  term ((-620496 : Rat) / 2995) [(0, 2), (11, 1), (13, 1)],
  term ((-620496 : Rat) / 2995) [(1, 2), (11, 1), (13, 1)],
  term ((620496 : Rat) / 2995) [(8, 2), (11, 1), (13, 1)],
  term ((620496 : Rat) / 2995) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0049_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0049
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0050 : Poly :=
[
  term ((2691252 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 50 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0050 : Poly :=
[
  term ((2691252 : Rat) / 2995) [(0, 2), (11, 1), (15, 1)],
  term ((2691252 : Rat) / 2995) [(1, 2), (11, 1), (15, 1)],
  term ((-2691252 : Rat) / 2995) [(8, 2), (11, 1), (15, 1)],
  term ((-2691252 : Rat) / 2995) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0050_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0050
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0051 : Poly :=
[
  term ((119 : Rat) / 2) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0051 : Poly :=
[
  term ((119 : Rat) / 2) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((119 : Rat) / 2) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-119 : Rat) / 2) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-119 : Rat) / 2) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0051_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0051
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0052 : Poly :=
[
  term ((-366336 : Rat) / 2995) [(11, 1), (15, 3)]
]

/-- Partial product 52 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0052 : Poly :=
[
  term ((-366336 : Rat) / 2995) [(0, 2), (11, 1), (15, 3)],
  term ((-366336 : Rat) / 2995) [(1, 2), (11, 1), (15, 3)],
  term ((366336 : Rat) / 2995) [(8, 2), (11, 1), (15, 3)],
  term ((366336 : Rat) / 2995) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0052_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0052
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0053 : Poly :=
[
  term ((198 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 53 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0053 : Poly :=
[
  term ((198 : Rat) / 5) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((198 : Rat) / 5) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-198 : Rat) / 5) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-198 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0053_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0053
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0054 : Poly :=
[
  term ((174096 : Rat) / 599) [(11, 2)]
]

/-- Partial product 54 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0054 : Poly :=
[
  term ((174096 : Rat) / 599) [(0, 2), (11, 2)],
  term ((174096 : Rat) / 599) [(1, 2), (11, 2)],
  term ((-174096 : Rat) / 599) [(8, 2), (11, 2)],
  term ((-174096 : Rat) / 599) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0054_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0054
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0055 : Poly :=
[
  term ((482112 : Rat) / 2995) [(11, 2), (15, 2)]
]

/-- Partial product 55 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0055 : Poly :=
[
  term ((482112 : Rat) / 2995) [(0, 2), (11, 2), (15, 2)],
  term ((482112 : Rat) / 2995) [(1, 2), (11, 2), (15, 2)],
  term ((-482112 : Rat) / 2995) [(8, 2), (11, 2), (15, 2)],
  term ((-482112 : Rat) / 2995) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0055_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0055
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0056 : Poly :=
[
  term ((607868 : Rat) / 2995) [(13, 1), (15, 1)]
]

/-- Partial product 56 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0056 : Poly :=
[
  term ((607868 : Rat) / 2995) [(0, 2), (13, 1), (15, 1)],
  term ((607868 : Rat) / 2995) [(1, 2), (13, 1), (15, 1)],
  term ((-607868 : Rat) / 2995) [(8, 2), (13, 1), (15, 1)],
  term ((-607868 : Rat) / 2995) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0056_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0056
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0057 : Poly :=
[
  term ((-134 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0057 : Poly :=
[
  term ((-134 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-134 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((134 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((134 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0057_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0057
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0058 : Poly :=
[
  term ((-3742366 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 58 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0058 : Poly :=
[
  term ((-3742366 : Rat) / 2995) [(0, 2), (15, 2)],
  term ((-3742366 : Rat) / 2995) [(1, 2), (15, 2)],
  term ((3742366 : Rat) / 2995) [(8, 2), (15, 2)],
  term ((3742366 : Rat) / 2995) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0058_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0058
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010NYN_coefficient_01_0059 : Poly :=
[
  term ((793 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 59 for generator 1. -/
def rs_R010_ueqv_R010NYN_partial_01_0059 : Poly :=
[
  term ((793 : Rat) / 5) [(0, 2), (15, 2), (16, 1)],
  term ((793 : Rat) / 5) [(1, 2), (15, 2), (16, 1)],
  term ((-793 : Rat) / 5) [(8, 2), (15, 2), (16, 1)],
  term ((-793 : Rat) / 5) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 1. -/
theorem rs_R010_ueqv_R010NYN_partial_01_0059_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_01_0059
        rs_R010_ueqv_R010NYN_generator_01_0000_0059 =
      rs_R010_ueqv_R010NYN_partial_01_0059 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_01_0000_0059 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_01_0000,
  rs_R010_ueqv_R010NYN_partial_01_0001,
  rs_R010_ueqv_R010NYN_partial_01_0002,
  rs_R010_ueqv_R010NYN_partial_01_0003,
  rs_R010_ueqv_R010NYN_partial_01_0004,
  rs_R010_ueqv_R010NYN_partial_01_0005,
  rs_R010_ueqv_R010NYN_partial_01_0006,
  rs_R010_ueqv_R010NYN_partial_01_0007,
  rs_R010_ueqv_R010NYN_partial_01_0008,
  rs_R010_ueqv_R010NYN_partial_01_0009,
  rs_R010_ueqv_R010NYN_partial_01_0010,
  rs_R010_ueqv_R010NYN_partial_01_0011,
  rs_R010_ueqv_R010NYN_partial_01_0012,
  rs_R010_ueqv_R010NYN_partial_01_0013,
  rs_R010_ueqv_R010NYN_partial_01_0014,
  rs_R010_ueqv_R010NYN_partial_01_0015,
  rs_R010_ueqv_R010NYN_partial_01_0016,
  rs_R010_ueqv_R010NYN_partial_01_0017,
  rs_R010_ueqv_R010NYN_partial_01_0018,
  rs_R010_ueqv_R010NYN_partial_01_0019,
  rs_R010_ueqv_R010NYN_partial_01_0020,
  rs_R010_ueqv_R010NYN_partial_01_0021,
  rs_R010_ueqv_R010NYN_partial_01_0022,
  rs_R010_ueqv_R010NYN_partial_01_0023,
  rs_R010_ueqv_R010NYN_partial_01_0024,
  rs_R010_ueqv_R010NYN_partial_01_0025,
  rs_R010_ueqv_R010NYN_partial_01_0026,
  rs_R010_ueqv_R010NYN_partial_01_0027,
  rs_R010_ueqv_R010NYN_partial_01_0028,
  rs_R010_ueqv_R010NYN_partial_01_0029,
  rs_R010_ueqv_R010NYN_partial_01_0030,
  rs_R010_ueqv_R010NYN_partial_01_0031,
  rs_R010_ueqv_R010NYN_partial_01_0032,
  rs_R010_ueqv_R010NYN_partial_01_0033,
  rs_R010_ueqv_R010NYN_partial_01_0034,
  rs_R010_ueqv_R010NYN_partial_01_0035,
  rs_R010_ueqv_R010NYN_partial_01_0036,
  rs_R010_ueqv_R010NYN_partial_01_0037,
  rs_R010_ueqv_R010NYN_partial_01_0038,
  rs_R010_ueqv_R010NYN_partial_01_0039,
  rs_R010_ueqv_R010NYN_partial_01_0040,
  rs_R010_ueqv_R010NYN_partial_01_0041,
  rs_R010_ueqv_R010NYN_partial_01_0042,
  rs_R010_ueqv_R010NYN_partial_01_0043,
  rs_R010_ueqv_R010NYN_partial_01_0044,
  rs_R010_ueqv_R010NYN_partial_01_0045,
  rs_R010_ueqv_R010NYN_partial_01_0046,
  rs_R010_ueqv_R010NYN_partial_01_0047,
  rs_R010_ueqv_R010NYN_partial_01_0048,
  rs_R010_ueqv_R010NYN_partial_01_0049,
  rs_R010_ueqv_R010NYN_partial_01_0050,
  rs_R010_ueqv_R010NYN_partial_01_0051,
  rs_R010_ueqv_R010NYN_partial_01_0052,
  rs_R010_ueqv_R010NYN_partial_01_0053,
  rs_R010_ueqv_R010NYN_partial_01_0054,
  rs_R010_ueqv_R010NYN_partial_01_0055,
  rs_R010_ueqv_R010NYN_partial_01_0056,
  rs_R010_ueqv_R010NYN_partial_01_0057,
  rs_R010_ueqv_R010NYN_partial_01_0058,
  rs_R010_ueqv_R010NYN_partial_01_0059
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_01_0000_0059 : Poly :=
[
  term ((-19710 : Rat) / 599) [(0, 1), (1, 2)],
  term ((-107136 : Rat) / 2995) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((170688 : Rat) / 2995) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-64 : Rat) / 5) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-137088 : Rat) / 2995) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((132 : Rat) / 5) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(0, 1), (1, 2), (11, 2)],
  term ((-170688 : Rat) / 2995) [(0, 1), (1, 2), (15, 2)],
  term ((64 : Rat) / 5) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((19710 : Rat) / 599) [(0, 1), (8, 2)],
  term ((107136 : Rat) / 2995) [(0, 1), (8, 2), (9, 1), (11, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (8, 2), (9, 1), (15, 1)],
  term ((64 : Rat) / 5) [(0, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((137088 : Rat) / 2995) [(0, 1), (8, 2), (11, 1), (15, 1)],
  term ((-132 : Rat) / 5) [(0, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-321408 : Rat) / 2995) [(0, 1), (8, 2), (11, 2)],
  term ((170688 : Rat) / 2995) [(0, 1), (8, 2), (15, 2)],
  term ((-64 : Rat) / 5) [(0, 1), (8, 2), (15, 2), (16, 1)],
  term ((19710 : Rat) / 599) [(0, 1), (9, 2)],
  term ((137088 : Rat) / 2995) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((-132 : Rat) / 5) [(0, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-321408 : Rat) / 2995) [(0, 1), (9, 2), (11, 2)],
  term ((170688 : Rat) / 2995) [(0, 1), (9, 2), (15, 2)],
  term ((-64 : Rat) / 5) [(0, 1), (9, 2), (15, 2), (16, 1)],
  term ((107136 : Rat) / 2995) [(0, 1), (9, 3), (11, 1)],
  term ((-170688 : Rat) / 2995) [(0, 1), (9, 3), (15, 1)],
  term ((64 : Rat) / 5) [(0, 1), (9, 3), (15, 1), (16, 1)],
  term ((9319 : Rat) / 1198) [(0, 2)],
  term ((254448 : Rat) / 2995) [(0, 2), (1, 1), (11, 1)],
  term ((194112 : Rat) / 599) [(0, 2), (1, 1), (11, 1), (15, 2)],
  term ((-264 : Rat) / 5) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-642816 : Rat) / 2995) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((-112764 : Rat) / 2995) [(0, 2), (1, 1), (15, 1)],
  term ((37 : Rat) / 5) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-98496 : Rat) / 2995) [(0, 2), (1, 1), (15, 3)],
  term ((-12 : Rat) / 5) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((2571264 : Rat) / 2995) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((636 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term (-12 : Rat) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((2757312 : Rat) / 2995) [(0, 2), (2, 1), (15, 2)],
  term ((-636 : Rat) / 5) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(0, 2), (3, 1), (11, 1)],
  term ((-122112 : Rat) / 2995) [(0, 2), (3, 1), (15, 1)],
  term ((36 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((19710 : Rat) / 599) [(0, 2), (8, 1)],
  term ((857088 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((903312 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2651616 : Rat) / 2995) [(0, 2), (8, 1), (11, 2)],
  term ((-919104 : Rat) / 2995) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((212 : Rat) / 5) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1838208 : Rat) / 2995) [(0, 2), (8, 1), (15, 2)],
  term ((-424 : Rat) / 5) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2531088 : Rat) / 2995) [(0, 2), (9, 1), (11, 1)],
  term ((256032 : Rat) / 2995) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((458496 : Rat) / 2995) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-72 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-160704 : Rat) / 2995) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((-321408 : Rat) / 2995) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((2740404 : Rat) / 2995) [(0, 2), (9, 1), (15, 1)],
  term ((-612 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-98496 : Rat) / 2995) [(0, 2), (9, 1), (15, 3)],
  term ((-12 : Rat) / 5) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(0, 2), (10, 1)],
  term ((-620496 : Rat) / 2995) [(0, 2), (11, 1), (13, 1)],
  term ((2691252 : Rat) / 2995) [(0, 2), (11, 1), (15, 1)],
  term ((119 : Rat) / 2) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-366336 : Rat) / 2995) [(0, 2), (11, 1), (15, 3)],
  term ((198 : Rat) / 5) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((174096 : Rat) / 599) [(0, 2), (11, 2)],
  term ((482112 : Rat) / 2995) [(0, 2), (11, 2), (15, 2)],
  term ((607868 : Rat) / 2995) [(0, 2), (13, 1), (15, 1)],
  term ((-134 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3742366 : Rat) / 2995) [(0, 2), (15, 2)],
  term ((793 : Rat) / 5) [(0, 2), (15, 2), (16, 1)],
  term ((-19710 : Rat) / 599) [(0, 3)],
  term ((-107136 : Rat) / 2995) [(0, 3), (9, 1), (11, 1)],
  term ((170688 : Rat) / 2995) [(0, 3), (9, 1), (15, 1)],
  term ((-64 : Rat) / 5) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((-137088 : Rat) / 2995) [(0, 3), (11, 1), (15, 1)],
  term ((132 : Rat) / 5) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(0, 3), (11, 2)],
  term ((-170688 : Rat) / 2995) [(0, 3), (15, 2)],
  term ((64 : Rat) / 5) [(0, 3), (15, 2), (16, 1)],
  term ((-254448 : Rat) / 2995) [(1, 1), (8, 2), (11, 1)],
  term ((-194112 : Rat) / 599) [(1, 1), (8, 2), (11, 1), (15, 2)],
  term ((264 : Rat) / 5) [(1, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((642816 : Rat) / 2995) [(1, 1), (8, 2), (11, 2), (15, 1)],
  term ((112764 : Rat) / 2995) [(1, 1), (8, 2), (15, 1)],
  term ((-37 : Rat) / 5) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((98496 : Rat) / 2995) [(1, 1), (8, 2), (15, 3)],
  term ((12 : Rat) / 5) [(1, 1), (8, 2), (15, 3), (16, 1)],
  term ((-254448 : Rat) / 2995) [(1, 1), (9, 2), (11, 1)],
  term ((-194112 : Rat) / 599) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((264 : Rat) / 5) [(1, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((642816 : Rat) / 2995) [(1, 1), (9, 2), (11, 2), (15, 1)],
  term ((112764 : Rat) / 2995) [(1, 1), (9, 2), (15, 1)],
  term ((-37 : Rat) / 5) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((98496 : Rat) / 2995) [(1, 1), (9, 2), (15, 3)],
  term ((12 : Rat) / 5) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((9319 : Rat) / 1198) [(1, 2)],
  term ((2571264 : Rat) / 2995) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((636 : Rat) / 5) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term (-12 : Rat) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((2757312 : Rat) / 2995) [(1, 2), (2, 1), (15, 2)],
  term ((-636 : Rat) / 5) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(1, 2), (3, 1), (11, 1)],
  term ((-122112 : Rat) / 2995) [(1, 2), (3, 1), (15, 1)],
  term ((36 : Rat) / 5) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((19710 : Rat) / 599) [(1, 2), (8, 1)],
  term ((857088 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((903312 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2651616 : Rat) / 2995) [(1, 2), (8, 1), (11, 2)],
  term ((-919104 : Rat) / 2995) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((212 : Rat) / 5) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1838208 : Rat) / 2995) [(1, 2), (8, 1), (15, 2)],
  term ((-424 : Rat) / 5) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2531088 : Rat) / 2995) [(1, 2), (9, 1), (11, 1)],
  term ((256032 : Rat) / 2995) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((458496 : Rat) / 2995) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-72 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-160704 : Rat) / 2995) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((-321408 : Rat) / 2995) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((2740404 : Rat) / 2995) [(1, 2), (9, 1), (15, 1)],
  term ((-612 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-98496 : Rat) / 2995) [(1, 2), (9, 1), (15, 3)],
  term ((-12 : Rat) / 5) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(1, 2), (10, 1)],
  term ((-620496 : Rat) / 2995) [(1, 2), (11, 1), (13, 1)],
  term ((2691252 : Rat) / 2995) [(1, 2), (11, 1), (15, 1)],
  term ((119 : Rat) / 2) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-366336 : Rat) / 2995) [(1, 2), (11, 1), (15, 3)],
  term ((198 : Rat) / 5) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((174096 : Rat) / 599) [(1, 2), (11, 2)],
  term ((482112 : Rat) / 2995) [(1, 2), (11, 2), (15, 2)],
  term ((607868 : Rat) / 2995) [(1, 2), (13, 1), (15, 1)],
  term ((-134 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3742366 : Rat) / 2995) [(1, 2), (15, 2)],
  term ((793 : Rat) / 5) [(1, 2), (15, 2), (16, 1)],
  term ((254448 : Rat) / 2995) [(1, 3), (11, 1)],
  term ((194112 : Rat) / 599) [(1, 3), (11, 1), (15, 2)],
  term ((-264 : Rat) / 5) [(1, 3), (11, 1), (15, 2), (16, 1)],
  term ((-642816 : Rat) / 2995) [(1, 3), (11, 2), (15, 1)],
  term ((-112764 : Rat) / 2995) [(1, 3), (15, 1)],
  term ((37 : Rat) / 5) [(1, 3), (15, 1), (16, 1)],
  term ((-98496 : Rat) / 2995) [(1, 3), (15, 3)],
  term ((-12 : Rat) / 5) [(1, 3), (15, 3), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (8, 2), (9, 1), (11, 1)],
  term ((2757312 : Rat) / 2995) [(2, 1), (8, 2), (9, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(2, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term (12 : Rat) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(2, 1), (8, 2), (15, 2)],
  term ((636 : Rat) / 5) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((2571264 : Rat) / 2995) [(2, 1), (9, 2), (11, 1), (15, 1)],
  term (12 : Rat) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(2, 1), (9, 2), (15, 2)],
  term ((636 : Rat) / 5) [(2, 1), (9, 2), (15, 2), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (9, 3), (11, 1)],
  term ((2757312 : Rat) / 2995) [(2, 1), (9, 3), (15, 1)],
  term ((-636 : Rat) / 5) [(2, 1), (9, 3), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 2995) [(3, 1), (8, 2), (11, 1)],
  term ((122112 : Rat) / 2995) [(3, 1), (8, 2), (15, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 2995) [(3, 1), (9, 2), (11, 1)],
  term ((122112 : Rat) / 2995) [(3, 1), (9, 2), (15, 1)],
  term ((-36 : Rat) / 5) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-19710 : Rat) / 599) [(8, 1), (9, 2)],
  term ((-857088 : Rat) / 2995) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-903312 : Rat) / 2995) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((864 : Rat) / 5) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((2651616 : Rat) / 2995) [(8, 1), (9, 2), (11, 2)],
  term ((919104 : Rat) / 2995) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-212 : Rat) / 5) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(8, 1), (9, 2), (15, 2)],
  term ((424 : Rat) / 5) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-9319 : Rat) / 1198) [(8, 2)],
  term ((2531088 : Rat) / 2995) [(8, 2), (9, 1), (11, 1)],
  term ((-256032 : Rat) / 2995) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((96 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-458496 : Rat) / 2995) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((72 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2740404 : Rat) / 2995) [(8, 2), (9, 1), (15, 1)],
  term ((612 : Rat) / 5) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((98496 : Rat) / 2995) [(8, 2), (9, 1), (15, 3)],
  term ((12 : Rat) / 5) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(8, 2), (10, 1)],
  term ((620496 : Rat) / 2995) [(8, 2), (11, 1), (13, 1)],
  term ((-2691252 : Rat) / 2995) [(8, 2), (11, 1), (15, 1)],
  term ((-119 : Rat) / 2) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((366336 : Rat) / 2995) [(8, 2), (11, 1), (15, 3)],
  term ((-198 : Rat) / 5) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-174096 : Rat) / 599) [(8, 2), (11, 2)],
  term ((-482112 : Rat) / 2995) [(8, 2), (11, 2), (15, 2)],
  term ((-607868 : Rat) / 2995) [(8, 2), (13, 1), (15, 1)],
  term ((134 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((3742366 : Rat) / 2995) [(8, 2), (15, 2)],
  term ((-793 : Rat) / 5) [(8, 2), (15, 2), (16, 1)],
  term ((-19710 : Rat) / 599) [(8, 3)],
  term ((-857088 : Rat) / 2995) [(8, 3), (11, 1), (13, 1)],
  term ((-903312 : Rat) / 2995) [(8, 3), (11, 1), (15, 1)],
  term ((864 : Rat) / 5) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((2651616 : Rat) / 2995) [(8, 3), (11, 2)],
  term ((919104 : Rat) / 2995) [(8, 3), (13, 1), (15, 1)],
  term ((-212 : Rat) / 5) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(8, 3), (15, 2)],
  term ((424 : Rat) / 5) [(8, 3), (15, 2), (16, 1)],
  term ((-9319 : Rat) / 1198) [(9, 2)],
  term (-6 : Rat) [(9, 2), (10, 1)],
  term ((620496 : Rat) / 2995) [(9, 2), (11, 1), (13, 1)],
  term ((-2691252 : Rat) / 2995) [(9, 2), (11, 1), (15, 1)],
  term ((-119 : Rat) / 2) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((366336 : Rat) / 2995) [(9, 2), (11, 1), (15, 3)],
  term ((-198 : Rat) / 5) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-174096 : Rat) / 599) [(9, 2), (11, 2)],
  term ((-482112 : Rat) / 2995) [(9, 2), (11, 2), (15, 2)],
  term ((-607868 : Rat) / 2995) [(9, 2), (13, 1), (15, 1)],
  term ((134 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3742366 : Rat) / 2995) [(9, 2), (15, 2)],
  term ((-793 : Rat) / 5) [(9, 2), (15, 2), (16, 1)],
  term ((2531088 : Rat) / 2995) [(9, 3), (11, 1)],
  term ((-256032 : Rat) / 2995) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((96 : Rat) / 5) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-458496 : Rat) / 2995) [(9, 3), (11, 1), (15, 2)],
  term ((72 : Rat) / 5) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(9, 3), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(9, 3), (11, 2), (15, 1)],
  term ((-2740404 : Rat) / 2995) [(9, 3), (15, 1)],
  term ((612 : Rat) / 5) [(9, 3), (15, 1), (16, 1)],
  term ((98496 : Rat) / 2995) [(9, 3), (15, 3)],
  term ((12 : Rat) / 5) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 0 through 59. -/
theorem rs_R010_ueqv_R010NYN_block_01_0000_0059_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_01_0000_0059
      rs_R010_ueqv_R010NYN_block_01_0000_0059 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
