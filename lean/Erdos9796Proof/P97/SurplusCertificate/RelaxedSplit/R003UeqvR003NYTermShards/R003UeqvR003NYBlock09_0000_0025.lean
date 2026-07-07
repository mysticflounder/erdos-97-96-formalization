/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 9:0-25

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_09_0000_0025 : Poly :=
[
  term (2 : Rat) [(0, 1), (10, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0000 : Poly :=
[
  term ((-1320 : Rat) / 299) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0000 : Poly :=
[
  term ((-2640 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((1320 : Rat) / 299) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((-2640 : Rat) / 299) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0000_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0000
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0001 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0001 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0001_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0001
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0002 : Poly :=
[
  term ((480 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0002 : Poly :=
[
  term ((960 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((960 : Rat) / 299) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0002_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0002
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0003 : Poly :=
[
  term ((1080 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0003 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0003_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0003
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0004 : Poly :=
[
  term ((720 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0004 : Poly :=
[
  term ((1440 : Rat) / 299) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((1440 : Rat) / 299) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0004_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0004
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0005 : Poly :=
[
  term ((240 : Rat) / 299) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0005 : Poly :=
[
  term ((480 : Rat) / 299) [(0, 1), (1, 1), (11, 3), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (10, 2), (11, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (11, 4), (16, 1)],
  term ((480 : Rat) / 299) [(0, 2), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0005_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0005
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0006 : Poly :=
[
  term ((-2880 : Rat) / 299) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0006 : Poly :=
[
  term ((-5760 : Rat) / 299) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2880 : Rat) / 299) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2880 : Rat) / 299) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5760 : Rat) / 299) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0006_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0006
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0007 : Poly :=
[
  term ((120 : Rat) / 299) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0007 : Poly :=
[
  term ((240 : Rat) / 299) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-120 : Rat) / 299) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((-120 : Rat) / 299) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0007_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0007
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0008 : Poly :=
[
  term ((-120 : Rat) / 299) [(0, 1), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0008 : Poly :=
[
  term ((-240 : Rat) / 299) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((120 : Rat) / 299) [(0, 1), (10, 2), (16, 1)],
  term ((120 : Rat) / 299) [(0, 1), (11, 2), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0008_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0008
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0009 : Poly :=
[
  term ((1320 : Rat) / 299) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0009 : Poly :=
[
  term ((2640 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2640 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 2), (16, 1)],
  term ((-1320 : Rat) / 299) [(2, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(2, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0009_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0009
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0010 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0010 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0010_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0010
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0011 : Poly :=
[
  term ((-480 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0011 : Poly :=
[
  term ((-960 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0011_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0011
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0012 : Poly :=
[
  term ((-1080 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0012 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0012_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0012
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0013 : Poly :=
[
  term ((-720 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0013 : Poly :=
[
  term ((-1440 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0013_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0013
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0014 : Poly :=
[
  term ((-240 : Rat) / 299) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0014 : Poly :=
[
  term ((-480 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (11, 2), (16, 1)],
  term ((-480 : Rat) / 299) [(1, 1), (2, 1), (11, 3), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (10, 2), (11, 2), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0014_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0014
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0015 : Poly :=
[
  term ((2880 : Rat) / 299) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0015 : Poly :=
[
  term ((5760 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5760 : Rat) / 299) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2880 : Rat) / 299) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2880 : Rat) / 299) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0015_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0015
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0016 : Poly :=
[
  term ((-120 : Rat) / 299) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0016 : Poly :=
[
  term ((-240 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((120 : Rat) / 299) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((120 : Rat) / 299) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0016_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0016
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0017 : Poly :=
[
  term ((120 : Rat) / 299) [(2, 1), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0017 : Poly :=
[
  term ((240 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((240 : Rat) / 299) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-120 : Rat) / 299) [(2, 1), (10, 2), (16, 1)],
  term ((-120 : Rat) / 299) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0017_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0017
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0018 : Poly :=
[
  term ((-72 : Rat) / 13) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0018 : Poly :=
[
  term ((-144 : Rat) / 13) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0018_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0018
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0019 : Poly :=
[
  term ((-28 : Rat) / 13) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0019 : Poly :=
[
  term ((-56 : Rat) / 13) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-56 : Rat) / 13) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((28 : Rat) / 13) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((28 : Rat) / 13) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0019_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0019
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0020 : Poly :=
[
  term ((-1304 : Rat) / 299) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0020 : Poly :=
[
  term ((-2608 : Rat) / 299) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2608 : Rat) / 299) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1304 : Rat) / 299) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1304 : Rat) / 299) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0020_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0020
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0021 : Poly :=
[
  term ((-36 : Rat) / 13) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0021 : Poly :=
[
  term ((-72 : Rat) / 13) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0021_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0021
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0022 : Poly :=
[
  term ((1256 : Rat) / 299) [(11, 2), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0022 : Poly :=
[
  term ((2512 : Rat) / 299) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (11, 3), (16, 1)],
  term ((-1256 : Rat) / 299) [(10, 2), (11, 2), (16, 1)],
  term ((-1256 : Rat) / 299) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0022_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0022
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0023 : Poly :=
[
  term ((-24 : Rat) / 13) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0023 : Poly :=
[
  term ((-48 : Rat) / 13) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0023_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0023
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0024 : Poly :=
[
  term ((628 : Rat) / 299) [(14, 1), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0024 : Poly :=
[
  term ((1256 : Rat) / 299) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-628 : Rat) / 299) [(10, 2), (14, 1), (16, 1)],
  term ((-628 : Rat) / 299) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0024_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0024
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def rs_R003_ueqv_R003NY_coefficient_09_0025 : Poly :=
[
  term ((-628 : Rat) / 299) [(16, 1)]
]

/-- Partial product 25 for generator 9. -/
def rs_R003_ueqv_R003NY_partial_09_0025 : Poly :=
[
  term ((-1256 : Rat) / 299) [(0, 1), (10, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 1), (11, 1), (16, 1)],
  term ((628 : Rat) / 299) [(10, 2), (16, 1)],
  term ((628 : Rat) / 299) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem rs_R003_ueqv_R003NY_partial_09_0025_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_09_0025
        rs_R003_ueqv_R003NY_generator_09_0000_0025 =
      rs_R003_ueqv_R003NY_partial_09_0025 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_09_0000_0025 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_09_0000,
  rs_R003_ueqv_R003NY_partial_09_0001,
  rs_R003_ueqv_R003NY_partial_09_0002,
  rs_R003_ueqv_R003NY_partial_09_0003,
  rs_R003_ueqv_R003NY_partial_09_0004,
  rs_R003_ueqv_R003NY_partial_09_0005,
  rs_R003_ueqv_R003NY_partial_09_0006,
  rs_R003_ueqv_R003NY_partial_09_0007,
  rs_R003_ueqv_R003NY_partial_09_0008,
  rs_R003_ueqv_R003NY_partial_09_0009,
  rs_R003_ueqv_R003NY_partial_09_0010,
  rs_R003_ueqv_R003NY_partial_09_0011,
  rs_R003_ueqv_R003NY_partial_09_0012,
  rs_R003_ueqv_R003NY_partial_09_0013,
  rs_R003_ueqv_R003NY_partial_09_0014,
  rs_R003_ueqv_R003NY_partial_09_0015,
  rs_R003_ueqv_R003NY_partial_09_0016,
  rs_R003_ueqv_R003NY_partial_09_0017,
  rs_R003_ueqv_R003NY_partial_09_0018,
  rs_R003_ueqv_R003NY_partial_09_0019,
  rs_R003_ueqv_R003NY_partial_09_0020,
  rs_R003_ueqv_R003NY_partial_09_0021,
  rs_R003_ueqv_R003NY_partial_09_0022,
  rs_R003_ueqv_R003NY_partial_09_0023,
  rs_R003_ueqv_R003NY_partial_09_0024,
  rs_R003_ueqv_R003NY_partial_09_0025
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_09_0000_0025 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 299) [(0, 1), (1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-5760 : Rat) / 299) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (1, 1), (11, 2), (13, 1), (16, 1)],
  term ((1440 : Rat) / 299) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 1), (1, 1), (11, 3), (16, 1)],
  term ((2640 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (11, 2), (16, 1)],
  term ((5760 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-144 : Rat) / 13) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-56 : Rat) / 13) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2608 : Rat) / 299) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(0, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(0, 1), (9, 1), (11, 3), (16, 1)],
  term ((-72 : Rat) / 13) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(0, 1), (10, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (10, 2), (11, 2), (16, 1)],
  term ((2880 : Rat) / 299) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 299) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((120 : Rat) / 299) [(0, 1), (10, 2), (16, 1)],
  term ((2880 : Rat) / 299) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 299) [(0, 1), (11, 2), (14, 1), (16, 1)],
  term ((120 : Rat) / 299) [(0, 1), (11, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 1), (11, 4), (16, 1)],
  term ((-2640 : Rat) / 299) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((960 : Rat) / 299) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1440 : Rat) / 299) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 2), (10, 1), (11, 2), (16, 1)],
  term ((-5760 : Rat) / 299) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(0, 2), (10, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-960 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2640 : Rat) / 299) [(1, 1), (2, 1), (9, 1), (11, 2), (16, 1)],
  term ((5760 : Rat) / 299) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((240 : Rat) / 299) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 1), (2, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(1, 1), (2, 1), (11, 2), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(1, 1), (2, 1), (11, 3), (16, 1)],
  term ((-144 : Rat) / 13) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-2608 : Rat) / 299) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-56 : Rat) / 13) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(1, 1), (11, 1), (16, 1)],
  term ((-72 : Rat) / 13) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((2512 : Rat) / 299) [(1, 1), (11, 3), (16, 1)],
  term ((-1320 : Rat) / 299) [(2, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(2, 1), (9, 1), (11, 3), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (10, 2), (11, 2), (16, 1)],
  term ((-2880 : Rat) / 299) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 299) [(2, 1), (10, 2), (14, 1), (16, 1)],
  term ((-120 : Rat) / 299) [(2, 1), (10, 2), (16, 1)],
  term ((-2880 : Rat) / 299) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((120 : Rat) / 299) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-120 : Rat) / 299) [(2, 1), (11, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (11, 3), (13, 1), (16, 1)],
  term ((720 : Rat) / 299) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(2, 1), (11, 4), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (10, 2), (11, 1), (16, 1)],
  term ((72 : Rat) / 13) [(3, 1), (11, 3), (16, 1)],
  term ((28 : Rat) / 13) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((1304 : Rat) / 299) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1304 : Rat) / 299) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((28 : Rat) / 13) [(9, 1), (11, 3), (16, 1)],
  term ((36 : Rat) / 13) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(10, 2), (11, 2), (16, 1)],
  term ((24 : Rat) / 13) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-628 : Rat) / 299) [(10, 2), (14, 1), (16, 1)],
  term ((628 : Rat) / 299) [(10, 2), (16, 1)],
  term ((24 : Rat) / 13) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-628 : Rat) / 299) [(11, 2), (14, 1), (16, 1)],
  term ((628 : Rat) / 299) [(11, 2), (16, 1)],
  term ((36 : Rat) / 13) [(11, 3), (15, 1), (16, 1)],
  term ((-1256 : Rat) / 299) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 25. -/
theorem rs_R003_ueqv_R003NY_block_09_0000_0025_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_09_0000_0025
      rs_R003_ueqv_R003NY_block_09_0000_0025 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
