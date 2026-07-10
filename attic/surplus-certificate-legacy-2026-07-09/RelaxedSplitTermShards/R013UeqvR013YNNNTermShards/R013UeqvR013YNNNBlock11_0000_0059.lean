/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 11:0-59

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_11_0000_0059 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0000 : Poly :=
[
  term ((81498192800 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 0 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0000 : Poly :=
[
  term ((162996385600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((-81498192800 : Rat) / 150171761) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((-81498192800 : Rat) / 150171761) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((162996385600 : Rat) / 150171761) [(0, 1), (3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0000
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0001 : Poly :=
[
  term ((3925782128880274610 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0001 : Poly :=
[
  term ((7851564257760549220 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-3925782128880274610 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 2), (11, 2), (15, 1)],
  term ((-3925782128880274610 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 2), (11, 2), (15, 1)],
  term ((7851564257760549220 : Rat) / 1288183727709509) [(0, 1), (3, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0001
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0002 : Poly :=
[
  term ((-5224676744 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 2 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0002 : Poly :=
[
  term ((-10449353488 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((5224676744 : Rat) / 25734207) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((5224676744 : Rat) / 25734207) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((-10449353488 : Rat) / 25734207) [(0, 1), (3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0002
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0003 : Poly :=
[
  term ((6109752000 : Rat) / 8833633) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 3 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0003 : Poly :=
[
  term ((12219504000 : Rat) / 8833633) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 1)],
  term ((12219504000 : Rat) / 8833633) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-6109752000 : Rat) / 8833633) [(0, 1), (5, 1), (6, 2), (11, 1)],
  term ((-6109752000 : Rat) / 8833633) [(0, 1), (5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0003
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0004 : Poly :=
[
  term ((294307817013219900 : Rat) / 75775513394677) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 4 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0004 : Poly :=
[
  term ((588615634026439800 : Rat) / 75775513394677) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((588615634026439800 : Rat) / 75775513394677) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(0, 1), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(0, 1), (5, 1), (7, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0004
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0005 : Poly :=
[
  term ((1322644080 : Rat) / 8578069) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 5 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0005 : Poly :=
[
  term ((2645288160 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1)],
  term ((2645288160 : Rat) / 8578069) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(0, 1), (5, 1), (6, 2), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(0, 1), (5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0005
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0006 : Poly :=
[
  term ((102730620000 : Rat) / 150171761) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 6 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0006 : Poly :=
[
  term ((205461240000 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1)],
  term ((205461240000 : Rat) / 150171761) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-102730620000 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (11, 1)],
  term ((-102730620000 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0006
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0007 : Poly :=
[
  term ((4948551841812012750 : Rat) / 1288183727709509) [(0, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 7 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0007 : Poly :=
[
  term ((9897103683624025500 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((9897103683624025500 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0007
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0008 : Poly :=
[
  term ((646715000 : Rat) / 8578069) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 8 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0008 : Poly :=
[
  term ((1293430000 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((1293430000 : Rat) / 8578069) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0008
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0009 : Poly :=
[
  term ((-124976936000 : Rat) / 150171761) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 9 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0009 : Poly :=
[
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((124976936000 : Rat) / 150171761) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((124976936000 : Rat) / 150171761) [(0, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0009
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0010 : Poly :=
[
  term ((-6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 10 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0010 : Poly :=
[
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (11, 2), (15, 2)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 1), (11, 2), (15, 2)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (6, 2), (11, 2), (15, 2)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0010
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0011 : Poly :=
[
  term ((16761444560 : Rat) / 25734207) [(0, 1), (15, 2)]
]

/-- Partial product 11 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0011 : Poly :=
[
  term ((33522889120 : Rat) / 25734207) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((33522889120 : Rat) / 25734207) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((-16761444560 : Rat) / 25734207) [(0, 1), (6, 2), (15, 2)],
  term ((-16761444560 : Rat) / 25734207) [(0, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0011
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0012 : Poly :=
[
  term ((-81498192800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 12 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0012 : Poly :=
[
  term ((-162996385600 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((81498192800 : Rat) / 150171761) [(1, 1), (2, 1), (6, 2), (11, 1)],
  term ((81498192800 : Rat) / 150171761) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-162996385600 : Rat) / 150171761) [(1, 1), (2, 2), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0012
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0013 : Poly :=
[
  term ((-3925782128880274610 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 13 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0013 : Poly :=
[
  term ((-7851564257760549220 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((3925782128880274610 : Rat) / 1288183727709509) [(1, 1), (2, 1), (6, 2), (11, 2), (15, 1)],
  term ((3925782128880274610 : Rat) / 1288183727709509) [(1, 1), (2, 1), (7, 2), (11, 2), (15, 1)],
  term ((-7851564257760549220 : Rat) / 1288183727709509) [(1, 1), (2, 2), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0013
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0014 : Poly :=
[
  term ((5224676744 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 14 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0014 : Poly :=
[
  term ((10449353488 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((-5224676744 : Rat) / 25734207) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((-5224676744 : Rat) / 25734207) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((10449353488 : Rat) / 25734207) [(1, 1), (2, 2), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0014
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0015 : Poly :=
[
  term ((62488468000 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 15 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0015 : Poly :=
[
  term ((124976936000 : Rat) / 150171761) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((124976936000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((-62488468000 : Rat) / 150171761) [(1, 1), (6, 2), (11, 1)],
  term ((-62488468000 : Rat) / 150171761) [(1, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0015
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0016 : Poly :=
[
  term ((3010080377334537850 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 16 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0016 : Poly :=
[
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (2, 1), (6, 1), (11, 2), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3010080377334537850 : Rat) / 1288183727709509) [(1, 1), (6, 2), (11, 2), (15, 1)],
  term ((-3010080377334537850 : Rat) / 1288183727709509) [(1, 1), (7, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0016
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0017 : Poly :=
[
  term ((-8380722280 : Rat) / 25734207) [(1, 1), (15, 1)]
]

/-- Partial product 17 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0017 : Poly :=
[
  term ((-16761444560 : Rat) / 25734207) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-16761444560 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((8380722280 : Rat) / 25734207) [(1, 1), (6, 2), (15, 1)],
  term ((8380722280 : Rat) / 25734207) [(1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0017
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0018 : Poly :=
[
  term ((-119478328000 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 18 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0018 : Poly :=
[
  term ((-238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((119478328000 : Rat) / 150171761) [(2, 1), (5, 1), (6, 2), (11, 1)],
  term ((119478328000 : Rat) / 150171761) [(2, 1), (5, 1), (7, 2), (11, 1)],
  term ((-238956656000 : Rat) / 150171761) [(2, 2), (5, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0018
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0019 : Poly :=
[
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 19 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0019 : Poly :=
[
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(2, 2), (5, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0019
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0020 : Poly :=
[
  term ((-2540028560 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 20 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0020 : Poly :=
[
  term ((-5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 1), (5, 1), (6, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 1), (5, 1), (7, 2), (15, 1)],
  term ((-5080057120 : Rat) / 25734207) [(2, 2), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0020
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0021 : Poly :=
[
  term ((-4656059400 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 21 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0021 : Poly :=
[
  term ((-9312118800 : Rat) / 150171761) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((4656059400 : Rat) / 150171761) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((4656059400 : Rat) / 150171761) [(2, 1), (7, 2), (11, 1), (13, 1)],
  term ((-9312118800 : Rat) / 150171761) [(2, 2), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0021
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0022 : Poly :=
[
  term ((70323376800 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 22 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0022 : Poly :=
[
  term ((140646753600 : Rat) / 150171761) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-70323376800 : Rat) / 150171761) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-70323376800 : Rat) / 150171761) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((140646753600 : Rat) / 150171761) [(2, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0022
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0023 : Poly :=
[
  term ((-448566383021072685 : Rat) / 2576367455419018) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 23 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0023 : Poly :=
[
  term ((-448566383021072685 : Rat) / 1288183727709509) [(2, 1), (3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(2, 1), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(2, 1), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 1288183727709509) [(2, 2), (6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0023
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0024 : Poly :=
[
  term ((3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 24 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0024 : Poly :=
[
  term ((6774978595205210820 : Rat) / 1288183727709509) [(2, 1), (3, 1), (7, 1), (11, 2), (15, 2)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (6, 2), (11, 2), (15, 2)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (7, 2), (11, 2), (15, 2)],
  term ((6774978595205210820 : Rat) / 1288183727709509) [(2, 2), (6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0024
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0025 : Poly :=
[
  term ((-437091386 : Rat) / 8578069) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 25 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0025 : Poly :=
[
  term ((-874182772 : Rat) / 8578069) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((437091386 : Rat) / 8578069) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((437091386 : Rat) / 8578069) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-874182772 : Rat) / 8578069) [(2, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0025
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0026 : Poly :=
[
  term ((-4928338968 : Rat) / 8578069) [(2, 1), (15, 2)]
]

/-- Partial product 26 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0026 : Poly :=
[
  term ((-9856677936 : Rat) / 8578069) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((4928338968 : Rat) / 8578069) [(2, 1), (6, 2), (15, 2)],
  term ((4928338968 : Rat) / 8578069) [(2, 1), (7, 2), (15, 2)],
  term ((-9856677936 : Rat) / 8578069) [(2, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0026
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0027 : Poly :=
[
  term ((-35161688400 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 27 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0027 : Poly :=
[
  term ((-70323376800 : Rat) / 150171761) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term ((35161688400 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1)],
  term ((35161688400 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1)],
  term ((-70323376800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0027
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0028 : Poly :=
[
  term ((4656059400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 28 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0028 : Poly :=
[
  term ((9312118800 : Rat) / 150171761) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-4656059400 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((-4656059400 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (12, 1)],
  term ((9312118800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0028
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0029 : Poly :=
[
  term ((448566383021072685 : Rat) / 2576367455419018) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 29 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0029 : Poly :=
[
  term ((448566383021072685 : Rat) / 1288183727709509) [(2, 1), (3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(3, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(3, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0029
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0030 : Poly :=
[
  term ((-1693744648801302705 : Rat) / 1288183727709509) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 30 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0030 : Poly :=
[
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (3, 1), (6, 1), (11, 2), (15, 1)],
  term ((1693744648801302705 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (15, 1)],
  term ((1693744648801302705 : Rat) / 1288183727709509) [(3, 1), (7, 2), (11, 2), (15, 1)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0030
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0031 : Poly :=
[
  term ((437091386 : Rat) / 8578069) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 31 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0031 : Poly :=
[
  term ((874182772 : Rat) / 8578069) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((874182772 : Rat) / 8578069) [(3, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0031
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0032 : Poly :=
[
  term ((2464169484 : Rat) / 8578069) [(3, 1), (15, 1)]
]

/-- Partial product 32 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0032 : Poly :=
[
  term ((4928338968 : Rat) / 8578069) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-2464169484 : Rat) / 8578069) [(3, 1), (6, 2), (15, 1)],
  term ((-2464169484 : Rat) / 8578069) [(3, 1), (7, 2), (15, 1)],
  term ((4928338968 : Rat) / 8578069) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0032
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0033 : Poly :=
[
  term ((-13422316800 : Rat) / 150171761) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 33 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0033 : Poly :=
[
  term ((-26844633600 : Rat) / 150171761) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-26844633600 : Rat) / 150171761) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((13422316800 : Rat) / 150171761) [(4, 1), (6, 2), (11, 1), (15, 1)],
  term ((13422316800 : Rat) / 150171761) [(4, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0033
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0034 : Poly :=
[
  term ((-646555335906902160 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 34 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0034 : Poly :=
[
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 1), (6, 1), (11, 2), (15, 2)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(3, 1), (4, 1), (7, 1), (11, 2), (15, 2)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(4, 1), (6, 2), (11, 2), (15, 2)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(4, 1), (7, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0034
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0035 : Poly :=
[
  term ((541374848 : Rat) / 8578069) [(4, 1), (15, 2)]
]

/-- Partial product 35 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0035 : Poly :=
[
  term ((1082749696 : Rat) / 8578069) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((1082749696 : Rat) / 8578069) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((-541374848 : Rat) / 8578069) [(4, 1), (6, 2), (15, 2)],
  term ((-541374848 : Rat) / 8578069) [(4, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0035
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0036 : Poly :=
[
  term ((-4859363200 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 36 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0036 : Poly :=
[
  term ((-9718726400 : Rat) / 150171761) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term ((-9718726400 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((4859363200 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1)],
  term ((4859363200 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0036
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0037 : Poly :=
[
  term ((-234076370933938840 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 37 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0037 : Poly :=
[
  term ((-468152741867877680 : Rat) / 1288183727709509) [(2, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-468152741867877680 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((234076370933938840 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (15, 1)],
  term ((234076370933938840 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0037
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0038 : Poly :=
[
  term ((6802003456 : Rat) / 25734207) [(5, 1), (15, 1)]
]

/-- Partial product 38 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0038 : Poly :=
[
  term ((13604006912 : Rat) / 25734207) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((13604006912 : Rat) / 25734207) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-6802003456 : Rat) / 25734207) [(5, 1), (6, 2), (15, 1)],
  term ((-6802003456 : Rat) / 25734207) [(5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0038
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0039 : Poly :=
[
  term ((32981709300 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 39 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0039 : Poly :=
[
  term ((65963418600 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((65963418600 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1)],
  term ((-32981709300 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1)],
  term ((-32981709300 : Rat) / 150171761) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0039
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0040 : Poly :=
[
  term ((-20506430000 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 40 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0040 : Poly :=
[
  term ((-41012860000 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-41012860000 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (12, 1)],
  term ((20506430000 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1), (12, 1)],
  term ((20506430000 : Rat) / 150171761) [(7, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0040
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0041 : Poly :=
[
  term ((-987798301475150375 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 41 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0041 : Poly :=
[
  term ((-1975596602950300750 : Rat) / 1288183727709509) [(2, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1975596602950300750 : Rat) / 1288183727709509) [(3, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((987798301475150375 : Rat) / 1288183727709509) [(6, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((987798301475150375 : Rat) / 1288183727709509) [(7, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0041
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0042 : Poly :=
[
  term ((6354938704842758265 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 42 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0042 : Poly :=
[
  term ((6354938704842758265 : Rat) / 2576367455419018) [(2, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((6354938704842758265 : Rat) / 2576367455419018) [(3, 1), (7, 2), (11, 2), (15, 1)],
  term ((-6354938704842758265 : Rat) / 5152734910838036) [(6, 2), (7, 1), (11, 2), (15, 1)],
  term ((-6354938704842758265 : Rat) / 5152734910838036) [(7, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0042
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0043 : Poly :=
[
  term ((-11640778900 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 43 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0043 : Poly :=
[
  term ((-23281557800 : Rat) / 25734207) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-23281557800 : Rat) / 25734207) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((11640778900 : Rat) / 25734207) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((11640778900 : Rat) / 25734207) [(7, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0043
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0044 : Poly :=
[
  term ((1500593737 : Rat) / 8578069) [(7, 1), (15, 1)]
]

/-- Partial product 44 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0044 : Poly :=
[
  term ((3001187474 : Rat) / 8578069) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((3001187474 : Rat) / 8578069) [(3, 1), (7, 2), (15, 1)],
  term ((-1500593737 : Rat) / 8578069) [(6, 2), (7, 1), (15, 1)],
  term ((-1500593737 : Rat) / 8578069) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0044
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0045 : Poly :=
[
  term ((27092083200 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 45 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0045 : Poly :=
[
  term ((54184166400 : Rat) / 150171761) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((54184166400 : Rat) / 150171761) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-27092083200 : Rat) / 150171761) [(7, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0045
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0046 : Poly :=
[
  term ((1305030362105127840 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 46 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0046 : Poly :=
[
  term ((2610060724210255680 : Rat) / 1288183727709509) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2610060724210255680 : Rat) / 1288183727709509) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(7, 2), (9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0046
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0047 : Poly :=
[
  term ((-1721558592 : Rat) / 8578069) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 47 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0047 : Poly :=
[
  term ((-3443117184 : Rat) / 8578069) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-3443117184 : Rat) / 8578069) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(7, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0047
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0048 : Poly :=
[
  term ((-7028029100 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 48 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0048 : Poly :=
[
  term ((-14056058200 : Rat) / 150171761) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-14056058200 : Rat) / 150171761) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((7028029100 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1)],
  term ((7028029100 : Rat) / 150171761) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0048
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0049 : Poly :=
[
  term ((-1354165538847655055 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 49 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0049 : Poly :=
[
  term ((-1354165538847655055 : Rat) / 2576367455419018) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-1354165538847655055 : Rat) / 2576367455419018) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((1354165538847655055 : Rat) / 5152734910838036) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((1354165538847655055 : Rat) / 5152734910838036) [(7, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0049
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0050 : Poly :=
[
  term ((973302563 : Rat) / 25734207) [(9, 1), (15, 1)]
]

/-- Partial product 50 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0050 : Poly :=
[
  term ((1946605126 : Rat) / 25734207) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((1946605126 : Rat) / 25734207) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-973302563 : Rat) / 25734207) [(6, 2), (9, 1), (15, 1)],
  term ((-973302563 : Rat) / 25734207) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0050
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0051 : Poly :=
[
  term ((-25388341200 : Rat) / 150171761) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 51 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0051 : Poly :=
[
  term ((-50776682400 : Rat) / 150171761) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-50776682400 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((25388341200 : Rat) / 150171761) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((25388341200 : Rat) / 150171761) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0051
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0052 : Poly :=
[
  term ((-2215103800 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 52 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0052 : Poly :=
[
  term ((-4430207600 : Rat) / 150171761) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-4430207600 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((2215103800 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1)],
  term ((2215103800 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0052
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0053 : Poly :=
[
  term ((1143230800 : Rat) / 8833633) [(11, 1), (15, 1)]
]

/-- Partial product 53 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0053 : Poly :=
[
  term ((2286461600 : Rat) / 8833633) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((2286461600 : Rat) / 8833633) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1143230800 : Rat) / 8833633) [(6, 2), (11, 1), (15, 1)],
  term ((-1143230800 : Rat) / 8833633) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0053
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0054 : Poly :=
[
  term ((-1222960813492723065 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 54 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0054 : Poly :=
[
  term ((-2445921626985446130 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (12, 1), (15, 2)],
  term ((-2445921626985446130 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (12, 1), (15, 2)],
  term ((1222960813492723065 : Rat) / 1288183727709509) [(6, 2), (11, 2), (12, 1), (15, 2)],
  term ((1222960813492723065 : Rat) / 1288183727709509) [(7, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0054
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0055 : Poly :=
[
  term ((-213403871003499995 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 55 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0055 : Poly :=
[
  term ((-213403871003499995 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-213403871003499995 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((213403871003499995 : Rat) / 2576367455419018) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((213403871003499995 : Rat) / 2576367455419018) [(7, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0055
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0056 : Poly :=
[
  term ((55069626572449585 : Rat) / 75775513394677) [(11, 2), (15, 2)]
]

/-- Partial product 56 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0056 : Poly :=
[
  term ((110139253144899170 : Rat) / 75775513394677) [(2, 1), (6, 1), (11, 2), (15, 2)],
  term ((110139253144899170 : Rat) / 75775513394677) [(3, 1), (7, 1), (11, 2), (15, 2)],
  term ((-55069626572449585 : Rat) / 75775513394677) [(6, 2), (11, 2), (15, 2)],
  term ((-55069626572449585 : Rat) / 75775513394677) [(7, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0056
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0057 : Poly :=
[
  term ((-2623673188 : Rat) / 8578069) [(12, 1), (15, 2)]
]

/-- Partial product 57 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0057 : Poly :=
[
  term ((-5247346376 : Rat) / 8578069) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-5247346376 : Rat) / 8578069) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((2623673188 : Rat) / 8578069) [(6, 2), (12, 1), (15, 2)],
  term ((2623673188 : Rat) / 8578069) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0057
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0058 : Poly :=
[
  term ((-3196153826 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 58 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0058 : Poly :=
[
  term ((-6392307652 : Rat) / 25734207) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-6392307652 : Rat) / 25734207) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((3196153826 : Rat) / 25734207) [(6, 2), (13, 1), (15, 1)],
  term ((3196153826 : Rat) / 25734207) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0058
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 11. -/
def rs_R013_ueqv_R013YNNN_coefficient_11_0059 : Poly :=
[
  term ((-2773982228 : Rat) / 25734207) [(15, 2)]
]

/-- Partial product 59 for generator 11. -/
def rs_R013_ueqv_R013YNNN_partial_11_0059 : Poly :=
[
  term ((-5547964456 : Rat) / 25734207) [(2, 1), (6, 1), (15, 2)],
  term ((-5547964456 : Rat) / 25734207) [(3, 1), (7, 1), (15, 2)],
  term ((2773982228 : Rat) / 25734207) [(6, 2), (15, 2)],
  term ((2773982228 : Rat) / 25734207) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 11. -/
theorem rs_R013_ueqv_R013YNNN_partial_11_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_11_0059
        rs_R013_ueqv_R013YNNN_generator_11_0000_0059 =
      rs_R013_ueqv_R013YNNN_partial_11_0059 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_11_0000_0059 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_11_0000,
  rs_R013_ueqv_R013YNNN_partial_11_0001,
  rs_R013_ueqv_R013YNNN_partial_11_0002,
  rs_R013_ueqv_R013YNNN_partial_11_0003,
  rs_R013_ueqv_R013YNNN_partial_11_0004,
  rs_R013_ueqv_R013YNNN_partial_11_0005,
  rs_R013_ueqv_R013YNNN_partial_11_0006,
  rs_R013_ueqv_R013YNNN_partial_11_0007,
  rs_R013_ueqv_R013YNNN_partial_11_0008,
  rs_R013_ueqv_R013YNNN_partial_11_0009,
  rs_R013_ueqv_R013YNNN_partial_11_0010,
  rs_R013_ueqv_R013YNNN_partial_11_0011,
  rs_R013_ueqv_R013YNNN_partial_11_0012,
  rs_R013_ueqv_R013YNNN_partial_11_0013,
  rs_R013_ueqv_R013YNNN_partial_11_0014,
  rs_R013_ueqv_R013YNNN_partial_11_0015,
  rs_R013_ueqv_R013YNNN_partial_11_0016,
  rs_R013_ueqv_R013YNNN_partial_11_0017,
  rs_R013_ueqv_R013YNNN_partial_11_0018,
  rs_R013_ueqv_R013YNNN_partial_11_0019,
  rs_R013_ueqv_R013YNNN_partial_11_0020,
  rs_R013_ueqv_R013YNNN_partial_11_0021,
  rs_R013_ueqv_R013YNNN_partial_11_0022,
  rs_R013_ueqv_R013YNNN_partial_11_0023,
  rs_R013_ueqv_R013YNNN_partial_11_0024,
  rs_R013_ueqv_R013YNNN_partial_11_0025,
  rs_R013_ueqv_R013YNNN_partial_11_0026,
  rs_R013_ueqv_R013YNNN_partial_11_0027,
  rs_R013_ueqv_R013YNNN_partial_11_0028,
  rs_R013_ueqv_R013YNNN_partial_11_0029,
  rs_R013_ueqv_R013YNNN_partial_11_0030,
  rs_R013_ueqv_R013YNNN_partial_11_0031,
  rs_R013_ueqv_R013YNNN_partial_11_0032,
  rs_R013_ueqv_R013YNNN_partial_11_0033,
  rs_R013_ueqv_R013YNNN_partial_11_0034,
  rs_R013_ueqv_R013YNNN_partial_11_0035,
  rs_R013_ueqv_R013YNNN_partial_11_0036,
  rs_R013_ueqv_R013YNNN_partial_11_0037,
  rs_R013_ueqv_R013YNNN_partial_11_0038,
  rs_R013_ueqv_R013YNNN_partial_11_0039,
  rs_R013_ueqv_R013YNNN_partial_11_0040,
  rs_R013_ueqv_R013YNNN_partial_11_0041,
  rs_R013_ueqv_R013YNNN_partial_11_0042,
  rs_R013_ueqv_R013YNNN_partial_11_0043,
  rs_R013_ueqv_R013YNNN_partial_11_0044,
  rs_R013_ueqv_R013YNNN_partial_11_0045,
  rs_R013_ueqv_R013YNNN_partial_11_0046,
  rs_R013_ueqv_R013YNNN_partial_11_0047,
  rs_R013_ueqv_R013YNNN_partial_11_0048,
  rs_R013_ueqv_R013YNNN_partial_11_0049,
  rs_R013_ueqv_R013YNNN_partial_11_0050,
  rs_R013_ueqv_R013YNNN_partial_11_0051,
  rs_R013_ueqv_R013YNNN_partial_11_0052,
  rs_R013_ueqv_R013YNNN_partial_11_0053,
  rs_R013_ueqv_R013YNNN_partial_11_0054,
  rs_R013_ueqv_R013YNNN_partial_11_0055,
  rs_R013_ueqv_R013YNNN_partial_11_0056,
  rs_R013_ueqv_R013YNNN_partial_11_0057,
  rs_R013_ueqv_R013YNNN_partial_11_0058,
  rs_R013_ueqv_R013YNNN_partial_11_0059
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_11_0000_0059 : Poly :=
[
  term ((162996385600 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1)],
  term ((7851564257760549220 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 2), (15, 1)],
  term ((-10449353488 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1)],
  term ((12219504000 : Rat) / 8833633) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 1)],
  term ((588615634026439800 : Rat) / 75775513394677) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((2645288160 : Rat) / 8578069) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1)],
  term ((205461240000 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1)],
  term ((9897103683624025500 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((1293430000 : Rat) / 8578069) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (2, 1), (6, 1), (11, 2), (15, 2)],
  term ((33522889120 : Rat) / 25734207) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((12219504000 : Rat) / 8833633) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((588615634026439800 : Rat) / 75775513394677) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((2645288160 : Rat) / 8578069) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-81498192800 : Rat) / 150171761) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((-3925782128880274610 : Rat) / 1288183727709509) [(0, 1), (3, 1), (6, 2), (11, 2), (15, 1)],
  term ((5224676744 : Rat) / 25734207) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((205461240000 : Rat) / 150171761) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((9897103683624025500 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((1293430000 : Rat) / 8578069) [(0, 1), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-249953872000 : Rat) / 150171761) [(0, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-12040321509338151400 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 1), (11, 2), (15, 2)],
  term ((33522889120 : Rat) / 25734207) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((-81498192800 : Rat) / 150171761) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((-3925782128880274610 : Rat) / 1288183727709509) [(0, 1), (3, 1), (7, 2), (11, 2), (15, 1)],
  term ((5224676744 : Rat) / 25734207) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((162996385600 : Rat) / 150171761) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((7851564257760549220 : Rat) / 1288183727709509) [(0, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-10449353488 : Rat) / 25734207) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-6109752000 : Rat) / 8833633) [(0, 1), (5, 1), (6, 2), (11, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(0, 1), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(0, 1), (5, 1), (6, 2), (15, 1)],
  term ((-6109752000 : Rat) / 8833633) [(0, 1), (5, 1), (7, 2), (11, 1)],
  term ((-294307817013219900 : Rat) / 75775513394677) [(0, 1), (5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-1322644080 : Rat) / 8578069) [(0, 1), (5, 1), (7, 2), (15, 1)],
  term ((-102730620000 : Rat) / 150171761) [(0, 1), (6, 2), (9, 1), (11, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(0, 1), (6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((124976936000 : Rat) / 150171761) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (6, 2), (11, 2), (15, 2)],
  term ((-16761444560 : Rat) / 25734207) [(0, 1), (6, 2), (15, 2)],
  term ((-102730620000 : Rat) / 150171761) [(0, 1), (7, 2), (9, 1), (11, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(0, 1), (7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((124976936000 : Rat) / 150171761) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(0, 1), (7, 2), (11, 2), (15, 2)],
  term ((-16761444560 : Rat) / 25734207) [(0, 1), (7, 2), (15, 2)],
  term ((-162996385600 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1)],
  term ((-7851564257760549220 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((10449353488 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1)],
  term ((124976936000 : Rat) / 150171761) [(1, 1), (2, 1), (6, 1), (11, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (2, 1), (6, 1), (11, 2), (15, 1)],
  term ((-16761444560 : Rat) / 25734207) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((81498192800 : Rat) / 150171761) [(1, 1), (2, 1), (6, 2), (11, 1)],
  term ((3925782128880274610 : Rat) / 1288183727709509) [(1, 1), (2, 1), (6, 2), (11, 2), (15, 1)],
  term ((-5224676744 : Rat) / 25734207) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((81498192800 : Rat) / 150171761) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((3925782128880274610 : Rat) / 1288183727709509) [(1, 1), (2, 1), (7, 2), (11, 2), (15, 1)],
  term ((-5224676744 : Rat) / 25734207) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-162996385600 : Rat) / 150171761) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((-7851564257760549220 : Rat) / 1288183727709509) [(1, 1), (2, 2), (6, 1), (11, 2), (15, 1)],
  term ((10449353488 : Rat) / 25734207) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((124976936000 : Rat) / 150171761) [(1, 1), (3, 1), (7, 1), (11, 1)],
  term ((6020160754669075700 : Rat) / 1288183727709509) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-16761444560 : Rat) / 25734207) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-62488468000 : Rat) / 150171761) [(1, 1), (6, 2), (11, 1)],
  term ((-3010080377334537850 : Rat) / 1288183727709509) [(1, 1), (6, 2), (11, 2), (15, 1)],
  term ((8380722280 : Rat) / 25734207) [(1, 1), (6, 2), (15, 1)],
  term ((-62488468000 : Rat) / 150171761) [(1, 1), (7, 2), (11, 1)],
  term ((-3010080377334537850 : Rat) / 1288183727709509) [(1, 1), (7, 2), (11, 2), (15, 1)],
  term ((8380722280 : Rat) / 25734207) [(1, 1), (7, 2), (15, 1)],
  term ((-238956656000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-5080057120 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-70323376800 : Rat) / 150171761) [(2, 1), (3, 1), (6, 1), (11, 1)],
  term ((9312118800 : Rat) / 150171761) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((448566383021072685 : Rat) / 1288183727709509) [(2, 1), (3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (3, 1), (6, 1), (11, 2), (15, 1)],
  term ((874182772 : Rat) / 8578069) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((4928338968 : Rat) / 8578069) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-9312118800 : Rat) / 150171761) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((140646753600 : Rat) / 150171761) [(2, 1), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 1288183727709509) [(2, 1), (3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((6774978595205210820 : Rat) / 1288183727709509) [(2, 1), (3, 1), (7, 1), (11, 2), (15, 2)],
  term ((-874182772 : Rat) / 8578069) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-9856677936 : Rat) / 8578069) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-26844633600 : Rat) / 150171761) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 1), (6, 1), (11, 2), (15, 2)],
  term ((1082749696 : Rat) / 8578069) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-9718726400 : Rat) / 150171761) [(2, 1), (5, 1), (6, 1), (11, 1)],
  term ((-468152741867877680 : Rat) / 1288183727709509) [(2, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((13604006912 : Rat) / 25734207) [(2, 1), (5, 1), (6, 1), (15, 1)],
  term ((119478328000 : Rat) / 150171761) [(2, 1), (5, 1), (6, 2), (11, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (5, 1), (6, 2), (11, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 1), (5, 1), (6, 2), (15, 1)],
  term ((119478328000 : Rat) / 150171761) [(2, 1), (5, 1), (7, 2), (11, 1)],
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 1), (5, 1), (7, 2), (11, 2), (15, 1)],
  term ((2540028560 : Rat) / 25734207) [(2, 1), (5, 1), (7, 2), (15, 1)],
  term ((65963418600 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-41012860000 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-1975596602950300750 : Rat) / 1288183727709509) [(2, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((6354938704842758265 : Rat) / 2576367455419018) [(2, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-23281557800 : Rat) / 25734207) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((3001187474 : Rat) / 8578069) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((54184166400 : Rat) / 150171761) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((2610060724210255680 : Rat) / 1288183727709509) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3443117184 : Rat) / 8578069) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-14056058200 : Rat) / 150171761) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-1354165538847655055 : Rat) / 2576367455419018) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((1946605126 : Rat) / 25734207) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-50776682400 : Rat) / 150171761) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4430207600 : Rat) / 150171761) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((2286461600 : Rat) / 8833633) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2445921626985446130 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (12, 1), (15, 2)],
  term ((-213403871003499995 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((110139253144899170 : Rat) / 75775513394677) [(2, 1), (6, 1), (11, 2), (15, 2)],
  term ((-5247346376 : Rat) / 8578069) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-6392307652 : Rat) / 25734207) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-5547964456 : Rat) / 25734207) [(2, 1), (6, 1), (15, 2)],
  term ((4656059400 : Rat) / 150171761) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((-70323376800 : Rat) / 150171761) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(2, 1), (6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (6, 2), (11, 2), (15, 2)],
  term ((437091386 : Rat) / 8578069) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((4928338968 : Rat) / 8578069) [(2, 1), (6, 2), (15, 2)],
  term ((4656059400 : Rat) / 150171761) [(2, 1), (7, 2), (11, 1), (13, 1)],
  term ((-70323376800 : Rat) / 150171761) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(2, 1), (7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(2, 1), (7, 2), (11, 2), (15, 2)],
  term ((437091386 : Rat) / 8578069) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((4928338968 : Rat) / 8578069) [(2, 1), (7, 2), (15, 2)],
  term ((-238956656000 : Rat) / 150171761) [(2, 2), (5, 1), (6, 1), (11, 1)],
  term ((-11510583700965102200 : Rat) / 1288183727709509) [(2, 2), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-5080057120 : Rat) / 25734207) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((-9312118800 : Rat) / 150171761) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((140646753600 : Rat) / 150171761) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 1288183727709509) [(2, 2), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((6774978595205210820 : Rat) / 1288183727709509) [(2, 2), (6, 1), (11, 2), (15, 2)],
  term ((-874182772 : Rat) / 8578069) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-9856677936 : Rat) / 8578069) [(2, 2), (6, 1), (15, 2)],
  term ((-26844633600 : Rat) / 150171761) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(3, 1), (4, 1), (7, 1), (11, 2), (15, 2)],
  term ((1082749696 : Rat) / 8578069) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((-9718726400 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-468152741867877680 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((13604006912 : Rat) / 25734207) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((35161688400 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1)],
  term ((-4656059400 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(3, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((1693744648801302705 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((-2464169484 : Rat) / 8578069) [(3, 1), (6, 2), (15, 1)],
  term ((54184166400 : Rat) / 150171761) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((2610060724210255680 : Rat) / 1288183727709509) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3443117184 : Rat) / 8578069) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-14056058200 : Rat) / 150171761) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-1354165538847655055 : Rat) / 2576367455419018) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((1946605126 : Rat) / 25734207) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-50776682400 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4430207600 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((2286461600 : Rat) / 8833633) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2445921626985446130 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (12, 1), (15, 2)],
  term ((-213403871003499995 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((110139253144899170 : Rat) / 75775513394677) [(3, 1), (7, 1), (11, 2), (15, 2)],
  term ((-5247346376 : Rat) / 8578069) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-6392307652 : Rat) / 25734207) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-5547964456 : Rat) / 25734207) [(3, 1), (7, 1), (15, 2)],
  term ((101125107000 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1)],
  term ((-45668919400 : Rat) / 150171761) [(3, 1), (7, 2), (11, 1), (12, 1)],
  term ((-4399759588921674185 : Rat) / 2576367455419018) [(3, 1), (7, 2), (11, 2), (12, 1), (15, 1)],
  term ((9742428002445363675 : Rat) / 2576367455419018) [(3, 1), (7, 2), (11, 2), (15, 1)],
  term ((-24592831958 : Rat) / 25734207) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((537017990 : Rat) / 8578069) [(3, 1), (7, 2), (15, 1)],
  term ((-70323376800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((9312118800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((448566383021072685 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((874182772 : Rat) / 8578069) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((4928338968 : Rat) / 8578069) [(3, 2), (7, 1), (15, 1)],
  term ((13422316800 : Rat) / 150171761) [(4, 1), (6, 2), (11, 1), (15, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(4, 1), (6, 2), (11, 2), (15, 2)],
  term ((-541374848 : Rat) / 8578069) [(4, 1), (6, 2), (15, 2)],
  term ((13422316800 : Rat) / 150171761) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(4, 1), (7, 2), (11, 2), (15, 2)],
  term ((-541374848 : Rat) / 8578069) [(4, 1), (7, 2), (15, 2)],
  term ((4859363200 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1)],
  term ((234076370933938840 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-6802003456 : Rat) / 25734207) [(5, 1), (6, 2), (15, 1)],
  term ((4859363200 : Rat) / 150171761) [(5, 1), (7, 2), (11, 1)],
  term ((234076370933938840 : Rat) / 1288183727709509) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-6802003456 : Rat) / 25734207) [(5, 1), (7, 2), (15, 1)],
  term ((-32981709300 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1)],
  term ((20506430000 : Rat) / 150171761) [(6, 2), (7, 1), (11, 1), (12, 1)],
  term ((987798301475150375 : Rat) / 1288183727709509) [(6, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6354938704842758265 : Rat) / 5152734910838036) [(6, 2), (7, 1), (11, 2), (15, 1)],
  term ((11640778900 : Rat) / 25734207) [(6, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1500593737 : Rat) / 8578069) [(6, 2), (7, 1), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(6, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((7028029100 : Rat) / 150171761) [(6, 2), (9, 1), (11, 1)],
  term ((1354165538847655055 : Rat) / 5152734910838036) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-973302563 : Rat) / 25734207) [(6, 2), (9, 1), (15, 1)],
  term ((25388341200 : Rat) / 150171761) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((2215103800 : Rat) / 150171761) [(6, 2), (11, 1), (13, 1)],
  term ((-1143230800 : Rat) / 8833633) [(6, 2), (11, 1), (15, 1)],
  term ((1222960813492723065 : Rat) / 1288183727709509) [(6, 2), (11, 2), (12, 1), (15, 2)],
  term ((213403871003499995 : Rat) / 2576367455419018) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-55069626572449585 : Rat) / 75775513394677) [(6, 2), (11, 2), (15, 2)],
  term ((2623673188 : Rat) / 8578069) [(6, 2), (12, 1), (15, 2)],
  term ((3196153826 : Rat) / 25734207) [(6, 2), (13, 1), (15, 1)],
  term ((2773982228 : Rat) / 25734207) [(6, 2), (15, 2)],
  term ((-27092083200 : Rat) / 150171761) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(7, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((7028029100 : Rat) / 150171761) [(7, 2), (9, 1), (11, 1)],
  term ((1354165538847655055 : Rat) / 5152734910838036) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-973302563 : Rat) / 25734207) [(7, 2), (9, 1), (15, 1)],
  term ((25388341200 : Rat) / 150171761) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((2215103800 : Rat) / 150171761) [(7, 2), (11, 1), (13, 1)],
  term ((-1143230800 : Rat) / 8833633) [(7, 2), (11, 1), (15, 1)],
  term ((1222960813492723065 : Rat) / 1288183727709509) [(7, 2), (11, 2), (12, 1), (15, 2)],
  term ((213403871003499995 : Rat) / 2576367455419018) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-55069626572449585 : Rat) / 75775513394677) [(7, 2), (11, 2), (15, 2)],
  term ((2623673188 : Rat) / 8578069) [(7, 2), (12, 1), (15, 2)],
  term ((3196153826 : Rat) / 25734207) [(7, 2), (13, 1), (15, 1)],
  term ((2773982228 : Rat) / 25734207) [(7, 2), (15, 2)],
  term ((-32981709300 : Rat) / 150171761) [(7, 3), (11, 1)],
  term ((20506430000 : Rat) / 150171761) [(7, 3), (11, 1), (12, 1)],
  term ((987798301475150375 : Rat) / 1288183727709509) [(7, 3), (11, 2), (12, 1), (15, 1)],
  term ((-6354938704842758265 : Rat) / 5152734910838036) [(7, 3), (11, 2), (15, 1)],
  term ((11640778900 : Rat) / 25734207) [(7, 3), (12, 1), (15, 1)],
  term ((-1500593737 : Rat) / 8578069) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 0 through 59. -/
theorem rs_R013_ueqv_R013YNNN_block_11_0000_0059_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_11_0000_0059
      rs_R013_ueqv_R013YNNN_block_11_0000_0059 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
