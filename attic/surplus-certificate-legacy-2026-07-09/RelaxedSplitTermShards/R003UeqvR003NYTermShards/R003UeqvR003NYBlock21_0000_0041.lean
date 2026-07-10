/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 21:0-41

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_21_0000_0041 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (12, 1)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0000 : Poly :=
[
  term ((-1800 : Rat) / 299) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0000 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 3), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0000_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0000
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0001 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0001 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0001_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0001
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0002 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0002 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0002_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0002
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0003 : Poly :=
[
  term ((-1920 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0003 : Poly :=
[
  term ((3840 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3840 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1920 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3840 : Rat) / 299) [(0, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((3840 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(0, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0003_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0003
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0004 : Poly :=
[
  term ((7200 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 4 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0004 : Poly :=
[
  term ((-14400 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(0, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 3), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0004_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0004
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0005 : Poly :=
[
  term ((-1800 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0005 : Poly :=
[
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (9, 2), (13, 2), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0005_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0005
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0006 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0006 : Poly :=
[
  term ((-8640 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 3), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0006_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0006
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0007 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0007 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0007_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0007
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0008 : Poly :=
[
  term ((360 : Rat) / 23) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0008 : Poly :=
[
  term ((-720 : Rat) / 23) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((360 : Rat) / 23) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((720 : Rat) / 23) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((720 : Rat) / 23) [(0, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-360 : Rat) / 23) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-360 : Rat) / 23) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-720 : Rat) / 23) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((360 : Rat) / 23) [(0, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0008_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0008
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0009 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0009 : Poly :=
[
  term ((-8640 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 3), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0009_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0009
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0010 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0010 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0010_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0010
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0011 : Poly :=
[
  term ((240 : Rat) / 299) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 11 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0011 : Poly :=
[
  term ((-480 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((480 : Rat) / 299) [(0, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((240 : Rat) / 299) [(0, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0011_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0011
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0012 : Poly :=
[
  term ((840 : Rat) / 299) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 12 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0012 : Poly :=
[
  term ((-1680 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0012_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0012
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0013 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 13 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0013 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0013_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0013
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0014 : Poly :=
[
  term ((-750 : Rat) / 299) [(0, 1), (16, 1)]
]

/-- Partial product 14 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0014 : Poly :=
[
  term ((1500 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((-750 : Rat) / 299) [(0, 1), (1, 2), (16, 1)],
  term ((-1500 : Rat) / 299) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1500 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((750 : Rat) / 299) [(0, 1), (12, 2), (16, 1)],
  term ((750 : Rat) / 299) [(0, 1), (13, 2), (16, 1)],
  term ((1500 : Rat) / 299) [(0, 2), (8, 1), (16, 1)],
  term ((-750 : Rat) / 299) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0014_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0014
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0015 : Poly :=
[
  term ((1800 : Rat) / 299) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0015 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0015_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0015
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0016 : Poly :=
[
  term ((-24 : Rat) / 13) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0016 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0016_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0016
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0017 : Poly :=
[
  term ((-1800 : Rat) / 299) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0017 : Poly :=
[
  term ((3600 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0017_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0017
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0018 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0018 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0018_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0018
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0019 : Poly :=
[
  term ((1920 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0019 : Poly :=
[
  term ((-3840 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3840 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (11, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((3840 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1920 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((3840 : Rat) / 299) [(2, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0019_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0019
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0020 : Poly :=
[
  term ((-7200 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 20 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0020 : Poly :=
[
  term ((14400 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(2, 1), (9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0020_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0020
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0021 : Poly :=
[
  term ((1800 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0021 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (13, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (9, 1), (13, 3), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0021_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0021
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0022 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0022 : Poly :=
[
  term ((8640 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0022_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0022
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0023 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0023 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0023_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0023
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0024 : Poly :=
[
  term ((-360 : Rat) / 23) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0024 : Poly :=
[
  term ((720 : Rat) / 23) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-360 : Rat) / 23) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((720 : Rat) / 23) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-360 : Rat) / 23) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-720 : Rat) / 23) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-720 : Rat) / 23) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((360 : Rat) / 23) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((360 : Rat) / 23) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0024_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0024
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0025 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0025 : Poly :=
[
  term ((8640 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0025_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0025
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0026 : Poly :=
[
  term ((-1800 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0026 : Poly :=
[
  term ((3600 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0026_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0026
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0027 : Poly :=
[
  term ((-240 : Rat) / 299) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 27 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0027 : Poly :=
[
  term ((480 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (2, 1), (11, 2), (16, 1)],
  term ((480 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 1), (11, 2), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (11, 2), (12, 2), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0027_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0027
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0028 : Poly :=
[
  term ((-840 : Rat) / 299) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 28 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0028 : Poly :=
[
  term ((1680 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((-840 : Rat) / 299) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((840 : Rat) / 299) [(2, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0028_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0028
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0029 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 29 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0029 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0029_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0029
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0030 : Poly :=
[
  term ((750 : Rat) / 299) [(2, 1), (16, 1)]
]

/-- Partial product 30 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0030 : Poly :=
[
  term ((-1500 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((750 : Rat) / 299) [(0, 2), (2, 1), (16, 1)],
  term ((-1500 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((750 : Rat) / 299) [(1, 2), (2, 1), (16, 1)],
  term ((1500 : Rat) / 299) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((1500 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-750 : Rat) / 299) [(2, 1), (12, 2), (16, 1)],
  term ((-750 : Rat) / 299) [(2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0030_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0030
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0031 : Poly :=
[
  term ((-72 : Rat) / 13) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 31 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0031 : Poly :=
[
  term ((144 : Rat) / 13) [(0, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((144 : Rat) / 13) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0031_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0031
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0032 : Poly :=
[
  term ((-72 : Rat) / 13) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0032 : Poly :=
[
  term ((144 : Rat) / 13) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((144 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0032_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0032
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0033 : Poly :=
[
  term ((24 : Rat) / 13) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0033 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0033_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0033
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0034 : Poly :=
[
  term ((-400 : Rat) / 299) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0034 : Poly :=
[
  term ((800 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-400 : Rat) / 299) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((800 : Rat) / 299) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-400 : Rat) / 299) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-800 : Rat) / 299) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((400 : Rat) / 299) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((400 : Rat) / 299) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-800 : Rat) / 299) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0034_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0034
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0035 : Poly :=
[
  term ((96 : Rat) / 13) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 35 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0035 : Poly :=
[
  term ((-192 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((192 : Rat) / 13) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0035_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0035
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0036 : Poly :=
[
  term ((-24 : Rat) / 13) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 36 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0036 : Poly :=
[
  term ((48 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 13) [(9, 1), (13, 3), (16, 1)],
  term ((-48 : Rat) / 13) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0036_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0036
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0037 : Poly :=
[
  term ((-60 : Rat) / 13) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0037 : Poly :=
[
  term ((120 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 13) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((60 : Rat) / 13) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0037_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0037
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0038 : Poly :=
[
  term ((48 : Rat) / 13) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0038 : Poly :=
[
  term ((-96 : Rat) / 13) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 13) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((96 : Rat) / 13) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0038_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0038
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0039 : Poly :=
[
  term ((-36 : Rat) / 13) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0039 : Poly :=
[
  term ((72 : Rat) / 13) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0039_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0039
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0040 : Poly :=
[
  term ((1256 : Rat) / 299) [(11, 2), (16, 1)]
]

/-- Partial product 40 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0040 : Poly :=
[
  term ((-2512 : Rat) / 299) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((1256 : Rat) / 299) [(0, 2), (11, 2), (16, 1)],
  term ((-2512 : Rat) / 299) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((1256 : Rat) / 299) [(1, 2), (11, 2), (16, 1)],
  term ((2512 : Rat) / 299) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(11, 2), (12, 2), (16, 1)],
  term ((-1256 : Rat) / 299) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0040_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0040
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 21. -/
def rs_R003_ueqv_R003NY_coefficient_21_0041 : Poly :=
[
  term ((-7 : Rat) / 13) [(16, 1)]
]

/-- Partial product 41 for generator 21. -/
def rs_R003_ueqv_R003NY_partial_21_0041 : Poly :=
[
  term ((14 : Rat) / 13) [(0, 1), (8, 1), (16, 1)],
  term ((-7 : Rat) / 13) [(0, 2), (16, 1)],
  term ((14 : Rat) / 13) [(1, 1), (9, 1), (16, 1)],
  term ((-7 : Rat) / 13) [(1, 2), (16, 1)],
  term ((-14 : Rat) / 13) [(8, 1), (12, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(9, 1), (13, 1), (16, 1)],
  term ((7 : Rat) / 13) [(12, 2), (16, 1)],
  term ((7 : Rat) / 13) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 21. -/
theorem rs_R003_ueqv_R003NY_partial_21_0041_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_21_0041
        rs_R003_ueqv_R003NY_generator_21_0000_0041 =
      rs_R003_ueqv_R003NY_partial_21_0041 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_21_0000_0041 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_21_0000,
  rs_R003_ueqv_R003NY_partial_21_0001,
  rs_R003_ueqv_R003NY_partial_21_0002,
  rs_R003_ueqv_R003NY_partial_21_0003,
  rs_R003_ueqv_R003NY_partial_21_0004,
  rs_R003_ueqv_R003NY_partial_21_0005,
  rs_R003_ueqv_R003NY_partial_21_0006,
  rs_R003_ueqv_R003NY_partial_21_0007,
  rs_R003_ueqv_R003NY_partial_21_0008,
  rs_R003_ueqv_R003NY_partial_21_0009,
  rs_R003_ueqv_R003NY_partial_21_0010,
  rs_R003_ueqv_R003NY_partial_21_0011,
  rs_R003_ueqv_R003NY_partial_21_0012,
  rs_R003_ueqv_R003NY_partial_21_0013,
  rs_R003_ueqv_R003NY_partial_21_0014,
  rs_R003_ueqv_R003NY_partial_21_0015,
  rs_R003_ueqv_R003NY_partial_21_0016,
  rs_R003_ueqv_R003NY_partial_21_0017,
  rs_R003_ueqv_R003NY_partial_21_0018,
  rs_R003_ueqv_R003NY_partial_21_0019,
  rs_R003_ueqv_R003NY_partial_21_0020,
  rs_R003_ueqv_R003NY_partial_21_0021,
  rs_R003_ueqv_R003NY_partial_21_0022,
  rs_R003_ueqv_R003NY_partial_21_0023,
  rs_R003_ueqv_R003NY_partial_21_0024,
  rs_R003_ueqv_R003NY_partial_21_0025,
  rs_R003_ueqv_R003NY_partial_21_0026,
  rs_R003_ueqv_R003NY_partial_21_0027,
  rs_R003_ueqv_R003NY_partial_21_0028,
  rs_R003_ueqv_R003NY_partial_21_0029,
  rs_R003_ueqv_R003NY_partial_21_0030,
  rs_R003_ueqv_R003NY_partial_21_0031,
  rs_R003_ueqv_R003NY_partial_21_0032,
  rs_R003_ueqv_R003NY_partial_21_0033,
  rs_R003_ueqv_R003NY_partial_21_0034,
  rs_R003_ueqv_R003NY_partial_21_0035,
  rs_R003_ueqv_R003NY_partial_21_0036,
  rs_R003_ueqv_R003NY_partial_21_0037,
  rs_R003_ueqv_R003NY_partial_21_0038,
  rs_R003_ueqv_R003NY_partial_21_0039,
  rs_R003_ueqv_R003NY_partial_21_0040,
  rs_R003_ueqv_R003NY_partial_21_0041
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_21_0000_0041 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 23) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (15, 2), (16, 1)],
  term ((1500 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (16, 1)],
  term ((3840 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (9, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1440 : Rat) / 299) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 23) [(0, 1), (1, 2), (11, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (1, 2), (11, 2), (16, 1)],
  term ((840 : Rat) / 299) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-750 : Rat) / 299) [(0, 1), (1, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (1, 3), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3840 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 23) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (11, 2), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1500 : Rat) / 299) [(0, 1), (2, 1), (8, 1), (16, 1)],
  term ((144 : Rat) / 13) [(0, 1), (3, 1), (8, 1), (9, 1), (16, 1)],
  term ((144 : Rat) / 13) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3840 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((800 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((120 : Rat) / 13) [(0, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 23) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(0, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(0, 1), (8, 1), (11, 2), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1500 : Rat) / 299) [(0, 1), (8, 1), (12, 1), (16, 1)],
  term ((14 : Rat) / 13) [(0, 1), (8, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11280 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((480 : Rat) / 299) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1500 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 1), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (9, 1), (13, 3), (16, 1)],
  term ((-3840 : Rat) / 299) [(0, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(0, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(0, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (9, 2), (13, 2), (16, 1)],
  term ((-360 : Rat) / 23) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-360 : Rat) / 23) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (11, 2), (12, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (11, 2), (13, 2), (16, 1)],
  term ((-840 : Rat) / 299) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((750 : Rat) / 299) [(0, 1), (12, 2), (16, 1)],
  term ((-840 : Rat) / 299) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((750 : Rat) / 299) [(0, 1), (13, 2), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 23) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (2, 1), (11, 2), (16, 1)],
  term ((-840 : Rat) / 299) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((750 : Rat) / 299) [(0, 2), (2, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((3840 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 23) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-1680 : Rat) / 299) [(0, 2), (8, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((1500 : Rat) / 299) [(0, 2), (8, 1), (16, 1)],
  term ((-400 : Rat) / 299) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(0, 2), (11, 2), (16, 1)],
  term ((-7 : Rat) / 13) [(0, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 3), (1, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(0, 3), (9, 1), (11, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(0, 3), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 3), (9, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 3), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 23) [(0, 3), (11, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 3), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 3), (11, 2), (16, 1)],
  term ((840 : Rat) / 299) [(0, 3), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 3), (15, 2), (16, 1)],
  term ((-750 : Rat) / 299) [(0, 3), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 23) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 2), (16, 1)],
  term ((3600 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1680 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1500 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (16, 1)],
  term ((-3840 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (11, 1), (16, 1)],
  term ((14400 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (13, 1), (16, 1)],
  term ((8640 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((144 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 13) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((14 : Rat) / 13) [(1, 1), (9, 1), (16, 1)],
  term ((800 : Rat) / 299) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-192 : Rat) / 13) [(1, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 1), (9, 2), (13, 1), (16, 1)],
  term ((120 : Rat) / 13) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((1920 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-7200 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(1, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 23) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 2), (2, 1), (11, 2), (16, 1)],
  term ((-840 : Rat) / 299) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((750 : Rat) / 299) [(1, 2), (2, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-400 : Rat) / 299) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((96 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 13) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(1, 2), (11, 2), (16, 1)],
  term ((-7 : Rat) / 13) [(1, 2), (16, 1)],
  term ((1800 : Rat) / 299) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(1, 3), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((3840 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 23) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((1500 : Rat) / 299) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((-1920 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11280 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-480 : Rat) / 299) [(2, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1680 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1500 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((7200 : Rat) / 299) [(2, 1), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (9, 1), (13, 3), (16, 1)],
  term ((3840 : Rat) / 299) [(2, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 299) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14400 : Rat) / 299) [(2, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 1), (9, 2), (13, 2), (16, 1)],
  term ((360 : Rat) / 23) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((360 : Rat) / 23) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (11, 2), (12, 2), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (11, 2), (13, 2), (16, 1)],
  term ((840 : Rat) / 299) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-750 : Rat) / 299) [(2, 1), (12, 2), (16, 1)],
  term ((840 : Rat) / 299) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-750 : Rat) / 299) [(2, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((48 : Rat) / 13) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((-144 : Rat) / 13) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-800 : Rat) / 299) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((192 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 13) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(8, 1), (12, 1), (16, 1)],
  term ((400 : Rat) / 299) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-72 : Rat) / 13) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2608 : Rat) / 299) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((2512 : Rat) / 299) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14 : Rat) / 13) [(9, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 13) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-96 : Rat) / 13) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(9, 1), (13, 3), (16, 1)],
  term ((-800 : Rat) / 299) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-120 : Rat) / 13) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 13) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(9, 2), (13, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((36 : Rat) / 13) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(11, 1), (13, 3), (16, 1)],
  term ((-1256 : Rat) / 299) [(11, 2), (12, 2), (16, 1)],
  term ((-1256 : Rat) / 299) [(11, 2), (13, 2), (16, 1)],
  term ((7 : Rat) / 13) [(12, 2), (16, 1)],
  term ((7 : Rat) / 13) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 0 through 41. -/
theorem rs_R003_ueqv_R003NY_block_21_0000_0041_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_21_0000_0041
      rs_R003_ueqv_R003NY_block_21_0000_0041 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
