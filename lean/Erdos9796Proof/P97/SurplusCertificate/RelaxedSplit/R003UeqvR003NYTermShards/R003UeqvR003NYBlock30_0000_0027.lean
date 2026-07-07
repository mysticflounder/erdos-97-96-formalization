/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NY, term block 30:0-27

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NYTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R003:u=v:R003NY`. -/
def rs_R003_ueqv_R003NY_generator_30_0000_0027 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0000 : Poly :=
[
  term ((-1080 : Rat) / 299) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0000 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0000_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0000
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0001 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0001 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0001_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0001
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0002 : Poly :=
[
  term ((-360 : Rat) / 299) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 2 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0002 : Poly :=
[
  term ((-720 : Rat) / 299) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((720 : Rat) / 299) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 1), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0002_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0002
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0003 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0003 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0003_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0003
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0004 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0004 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0004_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0004
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0005 : Poly :=
[
  term ((-1800 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 5 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0005 : Poly :=
[
  term ((-3600 : Rat) / 299) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0005_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0005
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0006 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0006 : Poly :=
[
  term ((4320 : Rat) / 299) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0006_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0006
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0007 : Poly :=
[
  term ((1080 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0007 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0007_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0007
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0008 : Poly :=
[
  term ((900 : Rat) / 299) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 8 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0008 : Poly :=
[
  term ((1800 : Rat) / 299) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-900 : Rat) / 299) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((900 : Rat) / 299) [(0, 1), (12, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-900 : Rat) / 299) [(0, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0008_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0008
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0009 : Poly :=
[
  term ((1080 : Rat) / 299) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 9 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0009 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0009_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0009
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0010 : Poly :=
[
  term ((1080 : Rat) / 299) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0010 : Poly :=
[
  term ((2160 : Rat) / 299) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0010_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0010
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0011 : Poly :=
[
  term ((-30 : Rat) / 13) [(0, 1), (16, 1)]
]

/-- Partial product 11 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0011 : Poly :=
[
  term ((-60 : Rat) / 13) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((30 : Rat) / 13) [(0, 1), (12, 2), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((30 : Rat) / 13) [(0, 1), (13, 2), (16, 1)],
  term ((60 : Rat) / 13) [(0, 1), (14, 1), (16, 1)],
  term ((-30 : Rat) / 13) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0011_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0011
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0012 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0012 : Poly :=
[
  term ((-4320 : Rat) / 299) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0012_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0012
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0013 : Poly :=
[
  term ((-540 : Rat) / 299) [(0, 2), (16, 1)]
]

/-- Partial product 13 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0013 : Poly :=
[
  term ((-1080 : Rat) / 299) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((540 : Rat) / 299) [(0, 2), (12, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((540 : Rat) / 299) [(0, 2), (13, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 2), (14, 1), (16, 1)],
  term ((-540 : Rat) / 299) [(0, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0013_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0013
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0014 : Poly :=
[
  term ((1080 : Rat) / 299) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0014 : Poly :=
[
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0014_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0014
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0015 : Poly :=
[
  term ((2160 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0015 : Poly :=
[
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0015_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0015
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0016 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0016 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0016_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0016
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0017 : Poly :=
[
  term ((1800 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0017 : Poly :=
[
  term ((3600 : Rat) / 299) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0017_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0017
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0018 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0018 : Poly :=
[
  term ((-4320 : Rat) / 299) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0018_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0018
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0019 : Poly :=
[
  term ((-1080 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0019 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0019_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0019
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0020 : Poly :=
[
  term ((-900 : Rat) / 299) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 20 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0020 : Poly :=
[
  term ((-1800 : Rat) / 299) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((900 : Rat) / 299) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-900 : Rat) / 299) [(2, 1), (12, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((900 : Rat) / 299) [(2, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0020_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0020
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0021 : Poly :=
[
  term ((-1080 : Rat) / 299) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0021 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0021_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0021
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0022 : Poly :=
[
  term ((-1080 : Rat) / 299) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0022 : Poly :=
[
  term ((-2160 : Rat) / 299) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0022_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0022
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0023 : Poly :=
[
  term ((18 : Rat) / 13) [(2, 1), (16, 1)]
]

/-- Partial product 23 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0023 : Poly :=
[
  term ((36 : Rat) / 13) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-18 : Rat) / 13) [(2, 1), (12, 2), (16, 1)],
  term ((36 : Rat) / 13) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18 : Rat) / 13) [(2, 1), (13, 2), (16, 1)],
  term ((-36 : Rat) / 13) [(2, 1), (14, 1), (16, 1)],
  term ((18 : Rat) / 13) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0023_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0023
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0024 : Poly :=
[
  term ((900 : Rat) / 299) [(2, 2), (16, 1)]
]

/-- Partial product 24 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0024 : Poly :=
[
  term ((1800 : Rat) / 299) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-900 : Rat) / 299) [(2, 2), (12, 2), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-900 : Rat) / 299) [(2, 2), (13, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (14, 1), (16, 1)],
  term ((900 : Rat) / 299) [(2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0024_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0024
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0025 : Poly :=
[
  term ((-24 : Rat) / 13) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0025 : Poly :=
[
  term ((-48 : Rat) / 13) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0025_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0025
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0026 : Poly :=
[
  term ((12 : Rat) / 13) [(12, 1), (16, 1)]
]

/-- Partial product 26 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0026 : Poly :=
[
  term ((24 : Rat) / 13) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(12, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 13) [(12, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(12, 1), (16, 1)],
  term ((24 : Rat) / 13) [(12, 2), (14, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0026_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0026
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 30. -/
def rs_R003_ueqv_R003NY_coefficient_30_0027 : Poly :=
[
  term ((-3 : Rat) / 13) [(16, 1)]
]

/-- Partial product 27 for generator 30. -/
def rs_R003_ueqv_R003NY_partial_30_0027 : Poly :=
[
  term ((-6 : Rat) / 13) [(12, 1), (14, 1), (16, 1)],
  term ((3 : Rat) / 13) [(12, 2), (16, 1)],
  term ((-6 : Rat) / 13) [(13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 13) [(13, 2), (16, 1)],
  term ((6 : Rat) / 13) [(14, 1), (16, 1)],
  term ((-3 : Rat) / 13) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 30. -/
theorem rs_R003_ueqv_R003NY_partial_30_0027_valid :
    mulPoly rs_R003_ueqv_R003NY_coefficient_30_0027
        rs_R003_ueqv_R003NY_generator_30_0000_0027 =
      rs_R003_ueqv_R003NY_partial_30_0027 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NY_partials_30_0000_0027 : List Poly :=
[
  rs_R003_ueqv_R003NY_partial_30_0000,
  rs_R003_ueqv_R003NY_partial_30_0001,
  rs_R003_ueqv_R003NY_partial_30_0002,
  rs_R003_ueqv_R003NY_partial_30_0003,
  rs_R003_ueqv_R003NY_partial_30_0004,
  rs_R003_ueqv_R003NY_partial_30_0005,
  rs_R003_ueqv_R003NY_partial_30_0006,
  rs_R003_ueqv_R003NY_partial_30_0007,
  rs_R003_ueqv_R003NY_partial_30_0008,
  rs_R003_ueqv_R003NY_partial_30_0009,
  rs_R003_ueqv_R003NY_partial_30_0010,
  rs_R003_ueqv_R003NY_partial_30_0011,
  rs_R003_ueqv_R003NY_partial_30_0012,
  rs_R003_ueqv_R003NY_partial_30_0013,
  rs_R003_ueqv_R003NY_partial_30_0014,
  rs_R003_ueqv_R003NY_partial_30_0015,
  rs_R003_ueqv_R003NY_partial_30_0016,
  rs_R003_ueqv_R003NY_partial_30_0017,
  rs_R003_ueqv_R003NY_partial_30_0018,
  rs_R003_ueqv_R003NY_partial_30_0019,
  rs_R003_ueqv_R003NY_partial_30_0020,
  rs_R003_ueqv_R003NY_partial_30_0021,
  rs_R003_ueqv_R003NY_partial_30_0022,
  rs_R003_ueqv_R003NY_partial_30_0023,
  rs_R003_ueqv_R003NY_partial_30_0024,
  rs_R003_ueqv_R003NY_partial_30_0025,
  rs_R003_ueqv_R003NY_partial_30_0026,
  rs_R003_ueqv_R003NY_partial_30_0027
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NY_block_30_0000_0027 : Poly :=
[
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 1), (2, 1), (12, 1), (14, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((-720 : Rat) / 299) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 299) [(0, 1), (2, 1), (13, 2), (16, 1)],
  term ((720 : Rat) / 299) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term ((-360 : Rat) / 299) [(0, 1), (2, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3600 : Rat) / 299) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3600 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-360 : Rat) / 23) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (11, 1), (13, 3), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-900 : Rat) / 299) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3180 : Rat) / 299) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((900 : Rat) / 299) [(0, 1), (12, 1), (16, 1)],
  term ((720 : Rat) / 299) [(0, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((30 : Rat) / 13) [(0, 1), (12, 2), (16, 1)],
  term ((-900 : Rat) / 299) [(0, 1), (12, 3), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 13) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((30 : Rat) / 13) [(0, 1), (13, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((2460 : Rat) / 299) [(0, 1), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 1), (14, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 1), (15, 2), (16, 1)],
  term ((-30 : Rat) / 13) [(0, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(0, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((540 : Rat) / 299) [(0, 2), (12, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((540 : Rat) / 299) [(0, 2), (13, 2), (16, 1)],
  term ((1080 : Rat) / 299) [(0, 2), (14, 1), (16, 1)],
  term ((-540 : Rat) / 299) [(0, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(1, 1), (2, 1), (12, 2), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((3600 : Rat) / 299) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3600 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((360 : Rat) / 23) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((4320 : Rat) / 299) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((900 : Rat) / 299) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2628 : Rat) / 299) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (12, 1), (14, 2), (16, 1)],
  term ((-900 : Rat) / 299) [(2, 1), (12, 1), (16, 1)],
  term ((-720 : Rat) / 299) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-18 : Rat) / 13) [(2, 1), (12, 2), (16, 1)],
  term ((900 : Rat) / 299) [(2, 1), (12, 3), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 13) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 299) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((1080 : Rat) / 299) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-18 : Rat) / 13) [(2, 1), (13, 2), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1908 : Rat) / 299) [(2, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 299) [(2, 1), (14, 2), (16, 1)],
  term ((-1080 : Rat) / 299) [(2, 1), (15, 2), (16, 1)],
  term ((18 : Rat) / 13) [(2, 1), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-900 : Rat) / 299) [(2, 2), (12, 2), (16, 1)],
  term ((1800 : Rat) / 299) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-900 : Rat) / 299) [(2, 2), (13, 2), (16, 1)],
  term ((-1800 : Rat) / 299) [(2, 2), (14, 1), (16, 1)],
  term ((900 : Rat) / 299) [(2, 2), (16, 1)],
  term ((-48 : Rat) / 13) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((24 : Rat) / 13) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((48 : Rat) / 13) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-24 : Rat) / 13) [(11, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 13) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((24 : Rat) / 13) [(11, 1), (13, 3), (16, 1)],
  term ((24 : Rat) / 13) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 13) [(12, 1), (13, 2), (16, 1)],
  term ((-30 : Rat) / 13) [(12, 1), (14, 1), (16, 1)],
  term ((12 : Rat) / 13) [(12, 1), (16, 1)],
  term ((24 : Rat) / 13) [(12, 2), (14, 1), (16, 1)],
  term ((3 : Rat) / 13) [(12, 2), (16, 1)],
  term ((-12 : Rat) / 13) [(12, 3), (16, 1)],
  term ((-6 : Rat) / 13) [(13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 13) [(13, 2), (16, 1)],
  term ((6 : Rat) / 13) [(14, 1), (16, 1)],
  term ((-3 : Rat) / 13) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 0 through 27. -/
theorem rs_R003_ueqv_R003NY_block_30_0000_0027_valid :
    checkProductSumEq rs_R003_ueqv_R003NY_partials_30_0000_0027
      rs_R003_ueqv_R003NY_block_30_0000_0027 = true := by
  native_decide

end R003UeqvR003NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
