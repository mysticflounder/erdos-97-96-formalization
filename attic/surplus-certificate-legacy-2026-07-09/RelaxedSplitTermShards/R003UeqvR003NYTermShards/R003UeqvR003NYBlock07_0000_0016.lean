/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 7:0-16

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_07_0000_0016 : Poly :=
[
  term (2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0000 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0000 : Poly :=
[
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0000_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0000
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0001 : Poly :=
[
  term ((-720 : Rat) / 299) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0001 : Poly :=
[
  term ((-1440 : Rat) / 299) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0001_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0001
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0002 : Poly :=
[
  term ((1320 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0002 : Poly :=
[
  term ((2640 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((2640 : Rat) / 299) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0002_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0002
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0003 : Poly :=
[
  term ((-240 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0003 : Poly :=
[
  term ((-480 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0003_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0003
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0004 : Poly :=
[
  term ((-1080 : Rat) / 299) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0004 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0004_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0004
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0005 : Poly :=
[
  term ((-1080 : Rat) / 299) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0005 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0005_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0005
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0006 : Poly :=
[
  term ((-1800 : Rat) / 299) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0006 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0006_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0006
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0007 : Poly :=
[
  term ((720 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0007 : Poly :=
[
  term ((1440 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1440 : Rat) / 299) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 1), (5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0007_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0007
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0008 : Poly :=
[
  term ((-1320 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0008 : Poly :=
[
  term ((-2640 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0008_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0008
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0009 : Poly :=
[
  term ((240 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0009 : Poly :=
[
  term ((480 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0009_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0009
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0010 : Poly :=
[
  term ((1080 : Rat) / 299) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0010 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0010_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0010
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0011 : Poly :=
[
  term ((1080 : Rat) / 299) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0011 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0011_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0011
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0012 : Poly :=
[
  term ((84 : Rat) / 13) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0012 : Poly :=
[
  term ((168 : Rat) / 13) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((168 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-84 : Rat) / 13) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-84 : Rat) / 13) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0012_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0012
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0013 : Poly :=
[
  term ((12 : Rat) / 13) [(3, 2), (16, 1)]
]

/-- Partial product 13 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0013 : Poly :=
[
  term ((24 : Rat) / 13) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(3, 2), (4, 2), (16, 1)],
  term ((-12 : Rat) / 13) [(3, 2), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0013_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0013
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0014 : Poly :=
[
  term ((36 : Rat) / 13) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0014 : Poly :=
[
  term ((72 : Rat) / 13) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0014_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0014
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0015 : Poly :=
[
  term ((28 : Rat) / 13) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0015 : Poly :=
[
  term ((56 : Rat) / 13) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 13) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0015_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0015
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NY_coefficient_07_0016 : Poly :=
[
  term ((-1256 : Rat) / 299) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 7. -/
def rs_R003_ueqv_R003NY_partial_07_0016 : Poly :=
[
  term ((-2512 : Rat) / 299) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 7. -/
theorem rs_R003_ueqv_R003NY_partial_07_0016_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_07_0016
        rs_R003_ueqv_R003NY_generator_07_0000_0016 =
      rs_R003_ueqv_R003NY_partial_07_0016 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_07_0000_0016 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_07_0000,
  rs_R003_ueqv_R003NY_partial_07_0001,
  rs_R003_ueqv_R003NY_partial_07_0002,
  rs_R003_ueqv_R003NY_partial_07_0003,
  rs_R003_ueqv_R003NY_partial_07_0004,
  rs_R003_ueqv_R003NY_partial_07_0005,
  rs_R003_ueqv_R003NY_partial_07_0006,
  rs_R003_ueqv_R003NY_partial_07_0007,
  rs_R003_ueqv_R003NY_partial_07_0008,
  rs_R003_ueqv_R003NY_partial_07_0009,
  rs_R003_ueqv_R003NY_partial_07_0010,
  rs_R003_ueqv_R003NY_partial_07_0011,
  rs_R003_ueqv_R003NY_partial_07_0012,
  rs_R003_ueqv_R003NY_partial_07_0013,
  rs_R003_ueqv_R003NY_partial_07_0014,
  rs_R003_ueqv_R003NY_partial_07_0015,
  rs_R003_ueqv_R003NY_partial_07_0016
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_07_0000_0016 : Poly :=
[
  term ((3600 : Rat) / 299) [(0, 1), (1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((2640 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1440 : Rat) / 299) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((1440 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((168 : Rat) / 13) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(0, 1), (3, 2), (4, 1), (16, 1)],
  term ((72 : Rat) / 13) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((56 : Rat) / 13) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((720 : Rat) / 299) [(0, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 299) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-1320 : Rat) / 299) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((240 : Rat) / 299) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((720 : Rat) / 299) [(0, 1), (5, 3), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-1440 : Rat) / 299) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((2640 : Rat) / 299) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-480 : Rat) / 299) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-3600 : Rat) / 299) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-2640 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((480 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((1440 : Rat) / 299) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((168 : Rat) / 13) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(1, 1), (3, 2), (5, 1), (16, 1)],
  term ((56 : Rat) / 13) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2512 : Rat) / 299) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 13) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((1320 : Rat) / 299) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((1320 : Rat) / 299) [(2, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-240 : Rat) / 299) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 1), (5, 3), (15, 1), (16, 1)],
  term ((-84 : Rat) / 13) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-84 : Rat) / 13) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(3, 2), (4, 2), (16, 1)],
  term ((-12 : Rat) / 13) [(3, 2), (5, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-28 : Rat) / 13) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1256 : Rat) / 299) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-36 : Rat) / 13) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 16. -/
theorem rs_R003_ueqv_R003NY_block_07_0000_0016_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_07_0000_0016
      rs_R003_ueqv_R003NY_block_07_0000_0016 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
