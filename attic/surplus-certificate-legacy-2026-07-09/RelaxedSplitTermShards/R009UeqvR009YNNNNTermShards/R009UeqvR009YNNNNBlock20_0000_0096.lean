/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 20:0-96

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 : Poly :=
[
  term (2 : Rat) [(8, 1), (10, 1)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0000 : Poly :=
[
  term ((3689284037846 : Rat) / 44404151967) []
]

/-- Partial product 0 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0000 : Poly :=
[
  term ((7378568075692 : Rat) / 44404151967) [(8, 1), (10, 1)],
  term ((7378568075692 : Rat) / 44404151967) [(9, 1), (11, 1)],
  term ((-3689284037846 : Rat) / 44404151967) [(10, 2)],
  term ((-3689284037846 : Rat) / 44404151967) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0000
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0001 : Poly :=
[
  term ((-249803199295 : Rat) / 2997748656) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0001 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((249803199295 : Rat) / 2997748656) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((249803199295 : Rat) / 2997748656) [(0, 1), (9, 1), (11, 3)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0001
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0002 : Poly :=
[
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 2 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0002 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0002
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0003 : Poly :=
[
  term ((108242905555 : Rat) / 1498874328) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0003 : Poly :=
[
  term ((108242905555 : Rat) / 749437164) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-108242905555 : Rat) / 1498874328) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((-108242905555 : Rat) / 1498874328) [(0, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0003
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0004 : Poly :=
[
  term ((-115 : Rat) / 28) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0004 : Poly :=
[
  term ((-115 : Rat) / 14) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((115 : Rat) / 28) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((115 : Rat) / 28) [(0, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0004
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0005 : Poly :=
[
  term ((-5517018715 : Rat) / 187359291) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 5 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0005 : Poly :=
[
  term ((-11034037430 : Rat) / 187359291) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-11034037430 : Rat) / 187359291) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((5517018715 : Rat) / 187359291) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((5517018715 : Rat) / 187359291) [(0, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0005
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0006 : Poly :=
[
  term ((23 : Rat) / 7) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0006 : Poly :=
[
  term ((46 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-23 : Rat) / 7) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23 : Rat) / 7) [(0, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0006
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0007 : Poly :=
[
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 7 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0007 : Poly :=
[
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0007
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0008 : Poly :=
[
  term ((115 : Rat) / 14) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0008 : Poly :=
[
  term ((115 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((115 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0008
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0009 : Poly :=
[
  term ((11034037430 : Rat) / 187359291) [(0, 1), (15, 2)]
]

/-- Partial product 9 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0009 : Poly :=
[
  term ((22068074860 : Rat) / 187359291) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((22068074860 : Rat) / 187359291) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-11034037430 : Rat) / 187359291) [(0, 1), (10, 2), (15, 2)],
  term ((-11034037430 : Rat) / 187359291) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0009
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0010 : Poly :=
[
  term ((-46 : Rat) / 7) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0010 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0010
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0011 : Poly :=
[
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 11 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0011 : Poly :=
[
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (10, 2), (13, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0011
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0012 : Poly :=
[
  term ((249803199295 : Rat) / 2997748656) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 12 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0012 : Poly :=
[
  term ((249803199295 : Rat) / 1498874328) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((-249803199295 : Rat) / 2997748656) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-249803199295 : Rat) / 2997748656) [(1, 1), (9, 1), (10, 3)],
  term ((249803199295 : Rat) / 1498874328) [(1, 1), (9, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0012
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0013 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 13 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0013 : Poly :=
[
  term ((-249803199295 : Rat) / 749437164) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((249803199295 : Rat) / 1498874328) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((249803199295 : Rat) / 1498874328) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((-249803199295 : Rat) / 749437164) [(1, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0013
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0014 : Poly :=
[
  term ((-108242905555 : Rat) / 1498874328) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 14 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0014 : Poly :=
[
  term ((-108242905555 : Rat) / 749437164) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-108242905555 : Rat) / 749437164) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((108242905555 : Rat) / 1498874328) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((108242905555 : Rat) / 1498874328) [(1, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0014
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0015 : Poly :=
[
  term ((115 : Rat) / 28) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0015 : Poly :=
[
  term ((115 : Rat) / 14) [(1, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((115 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 28) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-115 : Rat) / 28) [(1, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0015
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0016 : Poly :=
[
  term ((5517018715 : Rat) / 187359291) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 16 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0016 : Poly :=
[
  term ((11034037430 : Rat) / 187359291) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((11034037430 : Rat) / 187359291) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5517018715 : Rat) / 187359291) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-5517018715 : Rat) / 187359291) [(1, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0016
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0017 : Poly :=
[
  term ((-23 : Rat) / 7) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0017 : Poly :=
[
  term ((-46 : Rat) / 7) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((23 : Rat) / 7) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((23 : Rat) / 7) [(1, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0017
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0018 : Poly :=
[
  term ((6648950989536007 : Rat) / 26109641356596) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 18 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0018 : Poly :=
[
  term ((6648950989536007 : Rat) / 13054820678298) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((6648950989536007 : Rat) / 13054820678298) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-6648950989536007 : Rat) / 26109641356596) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((-6648950989536007 : Rat) / 26109641356596) [(1, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0018
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0019 : Poly :=
[
  term ((-115 : Rat) / 14) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 19 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0019 : Poly :=
[
  term ((-115 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((115 : Rat) / 14) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((115 : Rat) / 14) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0019
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0020 : Poly :=
[
  term ((-11034037430 : Rat) / 187359291) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 20 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0020 : Poly :=
[
  term ((-22068074860 : Rat) / 187359291) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-22068074860 : Rat) / 187359291) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((11034037430 : Rat) / 187359291) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((11034037430 : Rat) / 187359291) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0020
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0021 : Poly :=
[
  term ((46 : Rat) / 7) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0021 : Poly :=
[
  term ((92 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0021
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0022 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 22 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0022 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (10, 2), (13, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0022
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0023 : Poly :=
[
  term ((-320 : Rat) / 21) [(3, 1), (13, 1)]
]

/-- Partial product 23 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0023 : Poly :=
[
  term ((-640 : Rat) / 21) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((320 : Rat) / 21) [(3, 1), (10, 2), (13, 1)],
  term ((320 : Rat) / 21) [(3, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0023
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0024 : Poly :=
[
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 24 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0024 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0024
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0025 : Poly :=
[
  term ((-3622892287117 : Rat) / 44404151967) [(6, 1)]
]

/-- Partial product 25 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0025 : Poly :=
[
  term ((-7245784574234 : Rat) / 44404151967) [(6, 1), (8, 1), (10, 1)],
  term ((-7245784574234 : Rat) / 44404151967) [(6, 1), (9, 1), (11, 1)],
  term ((3622892287117 : Rat) / 44404151967) [(6, 1), (10, 2)],
  term ((3622892287117 : Rat) / 44404151967) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0025
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0026 : Poly :=
[
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 26 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0026 : Poly :=
[
  term ((4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0026
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0027 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 27 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0027 : Poly :=
[
  term ((3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0027
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0028 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 28 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0028 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(6, 1), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0028
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0029 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 29 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0029 : Poly :=
[
  term ((-2172201733 : Rat) / 83270796) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0029
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0030 : Poly :=
[
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 30 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0030 : Poly :=
[
  term ((6891415608682258 : Rat) / 6527410339149) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((6891415608682258 : Rat) / 6527410339149) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (10, 2), (11, 1), (13, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0030
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0031 : Poly :=
[
  term ((44388 : Rat) / 79) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 31 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0031 : Poly :=
[
  term ((88776 : Rat) / 79) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((88776 : Rat) / 79) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-44388 : Rat) / 79) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-44388 : Rat) / 79) [(6, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0031
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0032 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 32 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0032 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0032
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0033 : Poly :=
[
  term ((-6070875812284601 : Rat) / 13054820678298) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 33 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0033 : Poly :=
[
  term ((-6070875812284601 : Rat) / 6527410339149) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-6070875812284601 : Rat) / 6527410339149) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6070875812284601 : Rat) / 13054820678298) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((6070875812284601 : Rat) / 13054820678298) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0033
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0034 : Poly :=
[
  term ((1727 : Rat) / 126) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0034 : Poly :=
[
  term ((1727 : Rat) / 63) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1727 : Rat) / 63) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1727 : Rat) / 126) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1727 : Rat) / 126) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0034
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0035 : Poly :=
[
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)]
]

/-- Partial product 35 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0035 : Poly :=
[
  term ((560763766053622 : Rat) / 399637367703) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((560763766053622 : Rat) / 399637367703) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (10, 2), (13, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0035
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0036 : Poly :=
[
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 36 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0036 : Poly :=
[
  term ((340 : Rat) / 63) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((340 : Rat) / 63) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0036
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0037 : Poly :=
[
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (15, 2)]
]

/-- Partial product 37 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0037 : Poly :=
[
  term ((-282061132319075 : Rat) / 1450535630922) [(6, 1), (8, 1), (10, 1), (15, 2)],
  term ((-282061132319075 : Rat) / 1450535630922) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((282061132319075 : Rat) / 2901071261844) [(6, 1), (10, 2), (15, 2)],
  term ((282061132319075 : Rat) / 2901071261844) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0037
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0038 : Poly :=
[
  term ((-314 : Rat) / 21) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 38 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0038 : Poly :=
[
  term ((-628 : Rat) / 21) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-628 : Rat) / 21) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((314 : Rat) / 21) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((314 : Rat) / 21) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0038
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0039 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 39 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0039 : Poly :=
[
  term ((2172201733 : Rat) / 83270796) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((2172201733 : Rat) / 83270796) [(7, 1), (9, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0039
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0040 : Poly :=
[
  term ((-44388 : Rat) / 79) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 40 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0040 : Poly :=
[
  term ((-88776 : Rat) / 79) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-88776 : Rat) / 79) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((44388 : Rat) / 79) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((44388 : Rat) / 79) [(7, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0040
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0041 : Poly :=
[
  term ((-1532199782809 : Rat) / 69073125282) [(7, 1), (13, 1)]
]

/-- Partial product 41 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0041 : Poly :=
[
  term ((-1532199782809 : Rat) / 34536562641) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 34536562641) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1532199782809 : Rat) / 69073125282) [(7, 1), (10, 2), (13, 1)],
  term ((1532199782809 : Rat) / 69073125282) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0041
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0042 : Poly :=
[
  term ((-10732472496839915 : Rat) / 26109641356596) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 42 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0042 : Poly :=
[
  term ((-10732472496839915 : Rat) / 13054820678298) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-10732472496839915 : Rat) / 13054820678298) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((10732472496839915 : Rat) / 26109641356596) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((10732472496839915 : Rat) / 26109641356596) [(7, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0042
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0043 : Poly :=
[
  term ((-725 : Rat) / 42) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 43 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0043 : Poly :=
[
  term ((-725 : Rat) / 21) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 21) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 42) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 42) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0043
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0044 : Poly :=
[
  term ((282061132319075 : Rat) / 2901071261844) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 44 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0044 : Poly :=
[
  term ((282061132319075 : Rat) / 1450535630922) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0044
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0045 : Poly :=
[
  term ((314 : Rat) / 21) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0045 : Poly :=
[
  term ((628 : Rat) / 21) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((628 : Rat) / 21) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0045
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0046 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(7, 2), (14, 1)]
]

/-- Partial product 46 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0046 : Poly :=
[
  term ((-3064399565618 : Rat) / 80585312829) [(7, 2), (8, 1), (10, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 2), (10, 2), (14, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0046
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0047 : Poly :=
[
  term ((-115126691849 : Rat) / 749437164) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 47 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0047 : Poly :=
[
  term ((-115126691849 : Rat) / 374718582) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((115126691849 : Rat) / 749437164) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((115126691849 : Rat) / 749437164) [(9, 1), (10, 3), (15, 1)],
  term ((-115126691849 : Rat) / 374718582) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0047
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0048 : Poly :=
[
  term ((12480 : Rat) / 553) [(9, 1), (11, 1)]
]

/-- Partial product 48 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0048 : Poly :=
[
  term ((24960 : Rat) / 553) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-12480 : Rat) / 553) [(9, 1), (10, 2), (11, 1)],
  term ((-12480 : Rat) / 553) [(9, 1), (11, 3)],
  term ((24960 : Rat) / 553) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0048
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0049 : Poly :=
[
  term ((-4266385353529 : Rat) / 59205535956) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 49 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0049 : Poly :=
[
  term ((-4266385353529 : Rat) / 29602767978) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((4266385353529 : Rat) / 59205535956) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((4266385353529 : Rat) / 59205535956) [(9, 1), (11, 3), (14, 1)],
  term ((-4266385353529 : Rat) / 29602767978) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0049
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0050 : Poly :=
[
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 50 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0050 : Poly :=
[
  term ((239616 : Rat) / 553) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(9, 1), (11, 3), (15, 2)],
  term ((239616 : Rat) / 553) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0050
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0051 : Poly :=
[
  term ((142028768838079 : Rat) / 1420932862944) [(9, 1), (13, 1)]
]

/-- Partial product 51 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0051 : Poly :=
[
  term ((142028768838079 : Rat) / 710466431472) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-142028768838079 : Rat) / 1420932862944) [(9, 1), (10, 2), (13, 1)],
  term ((-142028768838079 : Rat) / 1420932862944) [(9, 1), (11, 2), (13, 1)],
  term ((142028768838079 : Rat) / 710466431472) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0051
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0052 : Poly :=
[
  term ((9464306049553 : Rat) / 20234803428) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 52 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0052 : Poly :=
[
  term ((9464306049553 : Rat) / 10117401714) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-9464306049553 : Rat) / 20234803428) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-9464306049553 : Rat) / 20234803428) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((9464306049553 : Rat) / 10117401714) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0052
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0053 : Poly :=
[
  term ((-5 : Rat) / 8) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 53 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0053 : Poly :=
[
  term ((-5 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 8) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 8) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 4) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0053
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0054 : Poly :=
[
  term ((-12753863657789 : Rat) / 59205535956) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 54 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0054 : Poly :=
[
  term ((-12753863657789 : Rat) / 29602767978) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((12753863657789 : Rat) / 59205535956) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((12753863657789 : Rat) / 59205535956) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-12753863657789 : Rat) / 29602767978) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0054
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0055 : Poly :=
[
  term ((305 : Rat) / 28) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 55 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0055 : Poly :=
[
  term ((305 : Rat) / 14) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0055
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0056 : Poly :=
[
  term ((-85 : Rat) / 24) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 56 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0056 : Poly :=
[
  term ((-85 : Rat) / 12) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 24) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((85 : Rat) / 24) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-85 : Rat) / 12) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0056
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0057 : Poly :=
[
  term ((575901606549527 : Rat) / 1420932862944) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 57 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0057 : Poly :=
[
  term ((575901606549527 : Rat) / 710466431472) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-575901606549527 : Rat) / 1420932862944) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-575901606549527 : Rat) / 1420932862944) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((575901606549527 : Rat) / 710466431472) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0057
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0058 : Poly :=
[
  term ((15 : Rat) / 14) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0058 : Poly :=
[
  term ((15 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 14) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15 : Rat) / 14) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0058
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0059 : Poly :=
[
  term ((-401510278845617 : Rat) / 2841865725888) [(9, 1), (15, 1)]
]

/-- Partial product 59 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0059 : Poly :=
[
  term ((-401510278845617 : Rat) / 1420932862944) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((401510278845617 : Rat) / 2841865725888) [(9, 1), (10, 2), (15, 1)],
  term ((401510278845617 : Rat) / 2841865725888) [(9, 1), (11, 2), (15, 1)],
  term ((-401510278845617 : Rat) / 1420932862944) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0059
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0060 : Poly :=
[
  term ((121 : Rat) / 42) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0060 : Poly :=
[
  term ((121 : Rat) / 21) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-121 : Rat) / 42) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-121 : Rat) / 42) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((121 : Rat) / 21) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0060
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0061 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (15, 3)]
]

/-- Partial product 61 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0061 : Poly :=
[
  term ((3366906314273 : Rat) / 14801383989) [(8, 1), (9, 1), (10, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (10, 2), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (11, 2), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0061
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0062 : Poly :=
[
  term ((-65 : Rat) / 7) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 62 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0062 : Poly :=
[
  term ((-130 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0062
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0063 : Poly :=
[
  term ((-1692145150007 : Rat) / 17986491936) [(9, 2)]
]

/-- Partial product 63 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0063 : Poly :=
[
  term ((-1692145150007 : Rat) / 8993245968) [(8, 1), (9, 2), (10, 1)],
  term ((1692145150007 : Rat) / 17986491936) [(9, 2), (10, 2)],
  term ((1692145150007 : Rat) / 17986491936) [(9, 2), (11, 2)],
  term ((-1692145150007 : Rat) / 8993245968) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0063
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0064 : Poly :=
[
  term ((4012056600851 : Rat) / 17986491936) [(9, 2), (14, 1)]
]

/-- Partial product 64 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0064 : Poly :=
[
  term ((4012056600851 : Rat) / 8993245968) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((-4012056600851 : Rat) / 17986491936) [(9, 2), (10, 2), (14, 1)],
  term ((-4012056600851 : Rat) / 17986491936) [(9, 2), (11, 2), (14, 1)],
  term ((4012056600851 : Rat) / 8993245968) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0064
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0065 : Poly :=
[
  term ((210703568101 : Rat) / 2997748656) [(9, 2), (15, 2)]
]

/-- Partial product 65 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0065 : Poly :=
[
  term ((210703568101 : Rat) / 1498874328) [(8, 1), (9, 2), (10, 1), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (10, 2), (15, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (11, 2), (15, 2)],
  term ((210703568101 : Rat) / 1498874328) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0065
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0066 : Poly :=
[
  term ((-119808 : Rat) / 553) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 66 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0066 : Poly :=
[
  term ((-239616 : Rat) / 553) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-239616 : Rat) / 553) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 3), (15, 1)],
  term ((119808 : Rat) / 553) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0066
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0067 : Poly :=
[
  term ((4353333743611 : Rat) / 29602767978) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 67 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0067 : Poly :=
[
  term ((4353333743611 : Rat) / 14801383989) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((4353333743611 : Rat) / 14801383989) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4353333743611 : Rat) / 29602767978) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4353333743611 : Rat) / 29602767978) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0067
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0068 : Poly :=
[
  term (-15 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0068 : Poly :=
[
  term (-30 : Rat) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term (-30 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (15 : Rat) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term (15 : Rat) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0068
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0069 : Poly :=
[
  term ((-4238595271243 : Rat) / 29602767978) [(10, 1), (15, 2)]
]

/-- Partial product 69 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0069 : Poly :=
[
  term ((-4238595271243 : Rat) / 14801383989) [(8, 1), (10, 2), (15, 2)],
  term ((-4238595271243 : Rat) / 14801383989) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((4238595271243 : Rat) / 29602767978) [(10, 1), (11, 2), (15, 2)],
  term ((4238595271243 : Rat) / 29602767978) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0069
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0070 : Poly :=
[
  term ((88 : Rat) / 7) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 70 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0070 : Poly :=
[
  term ((176 : Rat) / 7) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((176 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-88 : Rat) / 7) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-88 : Rat) / 7) [(10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0070
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0071 : Poly :=
[
  term ((-57408 : Rat) / 553) [(11, 1), (13, 1)]
]

/-- Partial product 71 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0071 : Poly :=
[
  term ((-114816 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-114816 : Rat) / 553) [(9, 1), (11, 2), (13, 1)],
  term ((57408 : Rat) / 553) [(10, 2), (11, 1), (13, 1)],
  term ((57408 : Rat) / 553) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0071
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0072 : Poly :=
[
  term ((2737818736523147 : Rat) / 13054820678298) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 72 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0072 : Poly :=
[
  term ((2737818736523147 : Rat) / 6527410339149) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((2737818736523147 : Rat) / 6527410339149) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2737818736523147 : Rat) / 13054820678298) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-2737818736523147 : Rat) / 13054820678298) [(11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0072
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0073 : Poly :=
[
  term (15 : Rat) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 73 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0073 : Poly :=
[
  term (30 : Rat) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term (30 : Rat) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term (-15 : Rat) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term (-15 : Rat) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0073
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0074 : Poly :=
[
  term ((-239616 : Rat) / 553) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 74 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0074 : Poly :=
[
  term ((-479232 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-479232 : Rat) / 553) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0074
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0075 : Poly :=
[
  term ((1031860708939 : Rat) / 29602767978) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 75 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0075 : Poly :=
[
  term ((1031860708939 : Rat) / 14801383989) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1031860708939 : Rat) / 14801383989) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-1031860708939 : Rat) / 29602767978) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1031860708939 : Rat) / 29602767978) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0075
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0076 : Poly :=
[
  term ((-88 : Rat) / 7) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0076 : Poly :=
[
  term ((-176 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 7) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((88 : Rat) / 7) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((88 : Rat) / 7) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0076
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0077 : Poly :=
[
  term ((-47424 : Rat) / 553) [(11, 1), (15, 1)]
]

/-- Partial product 77 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0077 : Poly :=
[
  term ((-94848 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-94848 : Rat) / 553) [(9, 1), (11, 2), (15, 1)],
  term ((47424 : Rat) / 553) [(10, 2), (11, 1), (15, 1)],
  term ((47424 : Rat) / 553) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0077
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0078 : Poly :=
[
  term ((119808 : Rat) / 553) [(11, 2), (14, 1)]
]

/-- Partial product 78 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0078 : Poly :=
[
  term ((239616 : Rat) / 553) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((239616 : Rat) / 553) [(9, 1), (11, 3), (14, 1)],
  term ((-119808 : Rat) / 553) [(10, 2), (11, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0078
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0079 : Poly :=
[
  term ((50294700516790819 : Rat) / 104438565426384) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 79 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0079 : Poly :=
[
  term ((50294700516790819 : Rat) / 52219282713192) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((50294700516790819 : Rat) / 52219282713192) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-50294700516790819 : Rat) / 104438565426384) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-50294700516790819 : Rat) / 104438565426384) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0079
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0080 : Poly :=
[
  term ((-15425 : Rat) / 504) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0080 : Poly :=
[
  term ((-15425 : Rat) / 252) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15425 : Rat) / 252) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15425 : Rat) / 504) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15425 : Rat) / 504) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0080
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0081 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 81 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0081 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0081
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0082 : Poly :=
[
  term ((705056616945577 : Rat) / 29839590121824) [(13, 1), (15, 1)]
]

/-- Partial product 82 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0082 : Poly :=
[
  term ((705056616945577 : Rat) / 14919795060912) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((705056616945577 : Rat) / 14919795060912) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-705056616945577 : Rat) / 29839590121824) [(10, 2), (13, 1), (15, 1)],
  term ((-705056616945577 : Rat) / 29839590121824) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0082
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0083 : Poly :=
[
  term ((-395 : Rat) / 336) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0083 : Poly :=
[
  term ((-395 : Rat) / 168) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-395 : Rat) / 168) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((395 : Rat) / 336) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((395 : Rat) / 336) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0083
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0084 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(13, 1), (15, 3)]
]

/-- Partial product 84 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0084 : Poly :=
[
  term ((-6733812628546 : Rat) / 14801383989) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-6733812628546 : Rat) / 14801383989) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(10, 2), (13, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0084
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0085 : Poly :=
[
  term ((130 : Rat) / 7) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 85 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0085 : Poly :=
[
  term ((260 : Rat) / 7) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((260 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0085
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0086 : Poly :=
[
  term ((-17993585444659 : Rat) / 2131399294416) [(13, 2)]
]

/-- Partial product 86 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0086 : Poly :=
[
  term ((-17993585444659 : Rat) / 1065699647208) [(8, 1), (10, 1), (13, 2)],
  term ((-17993585444659 : Rat) / 1065699647208) [(9, 1), (11, 1), (13, 2)],
  term ((17993585444659 : Rat) / 2131399294416) [(10, 2), (13, 2)],
  term ((17993585444659 : Rat) / 2131399294416) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0086
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0087 : Poly :=
[
  term ((-2438286298446361 : Rat) / 3197098941624) [(13, 2), (14, 1)]
]

/-- Partial product 87 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0087 : Poly :=
[
  term ((-2438286298446361 : Rat) / 1598549470812) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-2438286298446361 : Rat) / 1598549470812) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((2438286298446361 : Rat) / 3197098941624) [(10, 2), (13, 2), (14, 1)],
  term ((2438286298446361 : Rat) / 3197098941624) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0087
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0088 : Poly :=
[
  term ((7645 : Rat) / 252) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 88 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0088 : Poly :=
[
  term ((7645 : Rat) / 126) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((7645 : Rat) / 126) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7645 : Rat) / 252) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-7645 : Rat) / 252) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0088
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0089 : Poly :=
[
  term ((2954048478533 : Rat) / 19735178652) [(13, 2), (15, 2)]
]

/-- Partial product 89 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0089 : Poly :=
[
  term ((2954048478533 : Rat) / 9867589326) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((2954048478533 : Rat) / 9867589326) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(10, 2), (13, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0089
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0090 : Poly :=
[
  term ((-305 : Rat) / 14) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 90 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0090 : Poly :=
[
  term ((-305 : Rat) / 7) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0090
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0091 : Poly :=
[
  term ((-425 : Rat) / 168) [(13, 2), (16, 1)]
]

/-- Partial product 91 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0091 : Poly :=
[
  term ((-425 : Rat) / 84) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-425 : Rat) / 84) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((425 : Rat) / 168) [(10, 2), (13, 2), (16, 1)],
  term ((425 : Rat) / 168) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0091
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0092 : Poly :=
[
  term ((-3261207296941 : Rat) / 133212455901) [(14, 1)]
]

/-- Partial product 92 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0092 : Poly :=
[
  term ((-6522414593882 : Rat) / 133212455901) [(8, 1), (10, 1), (14, 1)],
  term ((-6522414593882 : Rat) / 133212455901) [(9, 1), (11, 1), (14, 1)],
  term ((3261207296941 : Rat) / 133212455901) [(10, 2), (14, 1)],
  term ((3261207296941 : Rat) / 133212455901) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0092
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0093 : Poly :=
[
  term ((-3366906314273 : Rat) / 59205535956) [(14, 1), (15, 2)]
]

/-- Partial product 93 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0093 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 59205535956) [(10, 2), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 59205535956) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0093
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0094 : Poly :=
[
  term ((65 : Rat) / 14) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 94 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0094 : Poly :=
[
  term ((65 : Rat) / 7) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 7) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0094
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0095 : Poly :=
[
  term ((12540805668767 : Rat) / 118411071912) [(15, 2)]
]

/-- Partial product 95 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0095 : Poly :=
[
  term ((12540805668767 : Rat) / 59205535956) [(8, 1), (10, 1), (15, 2)],
  term ((12540805668767 : Rat) / 59205535956) [(9, 1), (11, 1), (15, 2)],
  term ((-12540805668767 : Rat) / 118411071912) [(10, 2), (15, 2)],
  term ((-12540805668767 : Rat) / 118411071912) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0095
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 20. -/
def rs_R009_ueqv_R009YNNNN_coefficient_20_0096 : Poly :=
[
  term ((85 : Rat) / 28) [(15, 2), (16, 1)]
]

/-- Partial product 96 for generator 20. -/
def rs_R009_ueqv_R009YNNNN_partial_20_0096 : Poly :=
[
  term ((85 : Rat) / 14) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((85 : Rat) / 14) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-85 : Rat) / 28) [(10, 2), (15, 2), (16, 1)],
  term ((-85 : Rat) / 28) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 20. -/
theorem rs_R009_ueqv_R009YNNNN_partial_20_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_20_0096
        rs_R009_ueqv_R009YNNNN_generator_20_0000_0096 =
      rs_R009_ueqv_R009YNNNN_partial_20_0096 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_20_0000_0096 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_20_0000,
  rs_R009_ueqv_R009YNNNN_partial_20_0001,
  rs_R009_ueqv_R009YNNNN_partial_20_0002,
  rs_R009_ueqv_R009YNNNN_partial_20_0003,
  rs_R009_ueqv_R009YNNNN_partial_20_0004,
  rs_R009_ueqv_R009YNNNN_partial_20_0005,
  rs_R009_ueqv_R009YNNNN_partial_20_0006,
  rs_R009_ueqv_R009YNNNN_partial_20_0007,
  rs_R009_ueqv_R009YNNNN_partial_20_0008,
  rs_R009_ueqv_R009YNNNN_partial_20_0009,
  rs_R009_ueqv_R009YNNNN_partial_20_0010,
  rs_R009_ueqv_R009YNNNN_partial_20_0011,
  rs_R009_ueqv_R009YNNNN_partial_20_0012,
  rs_R009_ueqv_R009YNNNN_partial_20_0013,
  rs_R009_ueqv_R009YNNNN_partial_20_0014,
  rs_R009_ueqv_R009YNNNN_partial_20_0015,
  rs_R009_ueqv_R009YNNNN_partial_20_0016,
  rs_R009_ueqv_R009YNNNN_partial_20_0017,
  rs_R009_ueqv_R009YNNNN_partial_20_0018,
  rs_R009_ueqv_R009YNNNN_partial_20_0019,
  rs_R009_ueqv_R009YNNNN_partial_20_0020,
  rs_R009_ueqv_R009YNNNN_partial_20_0021,
  rs_R009_ueqv_R009YNNNN_partial_20_0022,
  rs_R009_ueqv_R009YNNNN_partial_20_0023,
  rs_R009_ueqv_R009YNNNN_partial_20_0024,
  rs_R009_ueqv_R009YNNNN_partial_20_0025,
  rs_R009_ueqv_R009YNNNN_partial_20_0026,
  rs_R009_ueqv_R009YNNNN_partial_20_0027,
  rs_R009_ueqv_R009YNNNN_partial_20_0028,
  rs_R009_ueqv_R009YNNNN_partial_20_0029,
  rs_R009_ueqv_R009YNNNN_partial_20_0030,
  rs_R009_ueqv_R009YNNNN_partial_20_0031,
  rs_R009_ueqv_R009YNNNN_partial_20_0032,
  rs_R009_ueqv_R009YNNNN_partial_20_0033,
  rs_R009_ueqv_R009YNNNN_partial_20_0034,
  rs_R009_ueqv_R009YNNNN_partial_20_0035,
  rs_R009_ueqv_R009YNNNN_partial_20_0036,
  rs_R009_ueqv_R009YNNNN_partial_20_0037,
  rs_R009_ueqv_R009YNNNN_partial_20_0038,
  rs_R009_ueqv_R009YNNNN_partial_20_0039,
  rs_R009_ueqv_R009YNNNN_partial_20_0040,
  rs_R009_ueqv_R009YNNNN_partial_20_0041,
  rs_R009_ueqv_R009YNNNN_partial_20_0042,
  rs_R009_ueqv_R009YNNNN_partial_20_0043,
  rs_R009_ueqv_R009YNNNN_partial_20_0044,
  rs_R009_ueqv_R009YNNNN_partial_20_0045,
  rs_R009_ueqv_R009YNNNN_partial_20_0046,
  rs_R009_ueqv_R009YNNNN_partial_20_0047,
  rs_R009_ueqv_R009YNNNN_partial_20_0048,
  rs_R009_ueqv_R009YNNNN_partial_20_0049,
  rs_R009_ueqv_R009YNNNN_partial_20_0050,
  rs_R009_ueqv_R009YNNNN_partial_20_0051,
  rs_R009_ueqv_R009YNNNN_partial_20_0052,
  rs_R009_ueqv_R009YNNNN_partial_20_0053,
  rs_R009_ueqv_R009YNNNN_partial_20_0054,
  rs_R009_ueqv_R009YNNNN_partial_20_0055,
  rs_R009_ueqv_R009YNNNN_partial_20_0056,
  rs_R009_ueqv_R009YNNNN_partial_20_0057,
  rs_R009_ueqv_R009YNNNN_partial_20_0058,
  rs_R009_ueqv_R009YNNNN_partial_20_0059,
  rs_R009_ueqv_R009YNNNN_partial_20_0060,
  rs_R009_ueqv_R009YNNNN_partial_20_0061,
  rs_R009_ueqv_R009YNNNN_partial_20_0062,
  rs_R009_ueqv_R009YNNNN_partial_20_0063,
  rs_R009_ueqv_R009YNNNN_partial_20_0064,
  rs_R009_ueqv_R009YNNNN_partial_20_0065,
  rs_R009_ueqv_R009YNNNN_partial_20_0066,
  rs_R009_ueqv_R009YNNNN_partial_20_0067,
  rs_R009_ueqv_R009YNNNN_partial_20_0068,
  rs_R009_ueqv_R009YNNNN_partial_20_0069,
  rs_R009_ueqv_R009YNNNN_partial_20_0070,
  rs_R009_ueqv_R009YNNNN_partial_20_0071,
  rs_R009_ueqv_R009YNNNN_partial_20_0072,
  rs_R009_ueqv_R009YNNNN_partial_20_0073,
  rs_R009_ueqv_R009YNNNN_partial_20_0074,
  rs_R009_ueqv_R009YNNNN_partial_20_0075,
  rs_R009_ueqv_R009YNNNN_partial_20_0076,
  rs_R009_ueqv_R009YNNNN_partial_20_0077,
  rs_R009_ueqv_R009YNNNN_partial_20_0078,
  rs_R009_ueqv_R009YNNNN_partial_20_0079,
  rs_R009_ueqv_R009YNNNN_partial_20_0080,
  rs_R009_ueqv_R009YNNNN_partial_20_0081,
  rs_R009_ueqv_R009YNNNN_partial_20_0082,
  rs_R009_ueqv_R009YNNNN_partial_20_0083,
  rs_R009_ueqv_R009YNNNN_partial_20_0084,
  rs_R009_ueqv_R009YNNNN_partial_20_0085,
  rs_R009_ueqv_R009YNNNN_partial_20_0086,
  rs_R009_ueqv_R009YNNNN_partial_20_0087,
  rs_R009_ueqv_R009YNNNN_partial_20_0088,
  rs_R009_ueqv_R009YNNNN_partial_20_0089,
  rs_R009_ueqv_R009YNNNN_partial_20_0090,
  rs_R009_ueqv_R009YNNNN_partial_20_0091,
  rs_R009_ueqv_R009YNNNN_partial_20_0092,
  rs_R009_ueqv_R009YNNNN_partial_20_0093,
  rs_R009_ueqv_R009YNNNN_partial_20_0094,
  rs_R009_ueqv_R009YNNNN_partial_20_0095,
  rs_R009_ueqv_R009YNNNN_partial_20_0096
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_20_0000_0096 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-11034037430 : Rat) / 187359291) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((115 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((22068074860 : Rat) / 187359291) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-92 : Rat) / 7) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((249803199295 : Rat) / 2997748656) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((115 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((22068074860 : Rat) / 187359291) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-92 : Rat) / 7) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-338075498735 : Rat) / 1498874328) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((249803199295 : Rat) / 2997748656) [(0, 1), (9, 1), (11, 3)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (11, 1), (15, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (11, 2)],
  term ((-108242905555 : Rat) / 1498874328) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((115 : Rat) / 28) [(0, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((5517018715 : Rat) / 187359291) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-23 : Rat) / 7) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11034037430 : Rat) / 187359291) [(0, 1), (10, 2), (15, 2)],
  term ((46 : Rat) / 7) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11034037430 : Rat) / 187359291) [(0, 1), (11, 2), (15, 2)],
  term ((46 : Rat) / 7) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-108242905555 : Rat) / 1498874328) [(0, 1), (11, 3), (13, 1)],
  term ((115 : Rat) / 28) [(0, 1), (11, 3), (13, 1), (16, 1)],
  term ((5517018715 : Rat) / 187359291) [(0, 1), (11, 3), (15, 1)],
  term ((-23 : Rat) / 7) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (10, 2), (13, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((-249803199295 : Rat) / 749437164) [(1, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((249803199295 : Rat) / 1498874328) [(1, 1), (8, 1), (9, 1), (10, 2)],
  term ((6648950989536007 : Rat) / 13054820678298) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-115 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22068074860 : Rat) / 187359291) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((92 : Rat) / 7) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-108242905555 : Rat) / 749437164) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((115 : Rat) / 14) [(1, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((11034037430 : Rat) / 187359291) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-108242905555 : Rat) / 749437164) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((115 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((11034037430 : Rat) / 187359291) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-249803199295 : Rat) / 2997748656) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((249803199295 : Rat) / 1498874328) [(1, 1), (9, 1), (10, 2), (14, 1)],
  term ((-249803199295 : Rat) / 2997748656) [(1, 1), (9, 1), (10, 3)],
  term ((6648950989536007 : Rat) / 13054820678298) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-115 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-22068074860 : Rat) / 187359291) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((92 : Rat) / 7) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((249803199295 : Rat) / 1498874328) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((249803199295 : Rat) / 1498874328) [(1, 1), (9, 2), (10, 1), (11, 1)],
  term ((-249803199295 : Rat) / 749437164) [(1, 1), (9, 2), (11, 1), (14, 1)],
  term ((108242905555 : Rat) / 1498874328) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-115 : Rat) / 28) [(1, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-5517018715 : Rat) / 187359291) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((23 : Rat) / 7) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6648950989536007 : Rat) / 26109641356596) [(1, 1), (10, 2), (13, 1), (14, 1)],
  term ((115 : Rat) / 14) [(1, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((11034037430 : Rat) / 187359291) [(1, 1), (10, 2), (14, 1), (15, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((108242905555 : Rat) / 1498874328) [(1, 1), (10, 3), (13, 1)],
  term ((-115 : Rat) / 28) [(1, 1), (10, 3), (13, 1), (16, 1)],
  term ((-5517018715 : Rat) / 187359291) [(1, 1), (10, 3), (15, 1)],
  term ((23 : Rat) / 7) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((-6648950989536007 : Rat) / 26109641356596) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((115 : Rat) / 14) [(1, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((11034037430 : Rat) / 187359291) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-46 : Rat) / 7) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (10, 2), (13, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 2), (13, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (8, 1), (10, 1), (13, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((320 : Rat) / 21) [(3, 1), (10, 2), (13, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((320 : Rat) / 21) [(3, 1), (11, 2), (13, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (11, 2), (13, 1), (14, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (8, 1), (10, 1), (13, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((3064399565618 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 2), (13, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2172201733 : Rat) / 83270796) [(6, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-7245784574234 : Rat) / 44404151967) [(6, 1), (8, 1), (10, 1)],
  term ((6891415608682258 : Rat) / 6527410339149) [(6, 1), (8, 1), (10, 1), (11, 1), (13, 1)],
  term ((88776 : Rat) / 79) [(6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6070875812284601 : Rat) / 6527410339149) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((1727 : Rat) / 63) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((340 : Rat) / 63) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(6, 1), (8, 1), (10, 1), (15, 2)],
  term ((-628 : Rat) / 21) [(6, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-7245784574234 : Rat) / 44404151967) [(6, 1), (9, 1), (11, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6070875812284601 : Rat) / 6527410339149) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1727 : Rat) / 63) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((340 : Rat) / 63) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-282061132319075 : Rat) / 1450535630922) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-628 : Rat) / 21) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((67625346490977923 : Rat) / 39164462034894) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((14956500308299 : Rat) / 13156785768) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(6, 1), (9, 2), (11, 1), (13, 1)],
  term ((-2172201733 : Rat) / 83270796) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((3622892287117 : Rat) / 44404151967) [(6, 1), (10, 2)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (10, 2), (11, 1), (13, 1)],
  term ((-44388 : Rat) / 79) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((6070875812284601 : Rat) / 13054820678298) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1727 : Rat) / 126) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (10, 2), (13, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(6, 1), (10, 2), (15, 2)],
  term ((314 : Rat) / 21) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((3622892287117 : Rat) / 44404151967) [(6, 1), (11, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((6070875812284601 : Rat) / 13054820678298) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1727 : Rat) / 126) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (11, 2), (13, 2)],
  term ((-170 : Rat) / 63) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(6, 1), (11, 2), (15, 2)],
  term ((314 : Rat) / 21) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 3), (13, 1)],
  term ((-44388 : Rat) / 79) [(6, 1), (11, 3), (15, 1)],
  term ((2172201733 : Rat) / 83270796) [(7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((-88776 : Rat) / 79) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 34536562641) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-10732472496839915 : Rat) / 13054820678298) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 21) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((628 : Rat) / 21) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 166541592) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 34536562641) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-10732472496839915 : Rat) / 13054820678298) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 21) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((282061132319075 : Rat) / 1450535630922) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((628 : Rat) / 21) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14956500308299 : Rat) / 13156785768) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((2172201733 : Rat) / 83270796) [(7, 1), (9, 2), (11, 1), (14, 1)],
  term ((44388 : Rat) / 79) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((1532199782809 : Rat) / 69073125282) [(7, 1), (10, 2), (13, 1)],
  term ((10732472496839915 : Rat) / 26109641356596) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((725 : Rat) / 42) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 69073125282) [(7, 1), (11, 2), (13, 1)],
  term ((10732472496839915 : Rat) / 26109641356596) [(7, 1), (11, 2), (13, 1), (14, 1)],
  term ((725 : Rat) / 42) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((44388 : Rat) / 79) [(7, 1), (11, 3), (14, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(7, 2), (8, 1), (10, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 80585312829) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 2), (10, 2), (14, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(7, 2), (11, 2), (14, 1)],
  term ((24960 : Rat) / 553) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-4266385353529 : Rat) / 29602767978) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((239616 : Rat) / 553) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((142028768838079 : Rat) / 710466431472) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((9464306049553 : Rat) / 10117401714) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-5 : Rat) / 4) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12753863657789 : Rat) / 29602767978) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 14) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-85 : Rat) / 12) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((575901606549527 : Rat) / 710466431472) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((15 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-401510278845617 : Rat) / 1420932862944) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((121 : Rat) / 21) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(8, 1), (9, 1), (10, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(8, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-115126691849 : Rat) / 374718582) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1692145150007 : Rat) / 8993245968) [(8, 1), (9, 2), (10, 1)],
  term ((4012056600851 : Rat) / 8993245968) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((210703568101 : Rat) / 1498874328) [(8, 1), (9, 2), (10, 1), (15, 2)],
  term ((7378568075692 : Rat) / 44404151967) [(8, 1), (10, 1)],
  term ((-114816 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((2737818736523147 : Rat) / 6527410339149) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term (30 : Rat) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-479232 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((1031860708939 : Rat) / 14801383989) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-176 : Rat) / 7) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-94848 : Rat) / 553) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((50294700516790819 : Rat) / 52219282713192) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15425 : Rat) / 252) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((705056616945577 : Rat) / 14919795060912) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-395 : Rat) / 168) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6733812628546 : Rat) / 14801383989) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((260 : Rat) / 7) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-17993585444659 : Rat) / 1065699647208) [(8, 1), (10, 1), (13, 2)],
  term ((-2438286298446361 : Rat) / 1598549470812) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((7645 : Rat) / 126) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 9867589326) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-305 : Rat) / 7) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-425 : Rat) / 84) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-6522414593882 : Rat) / 133212455901) [(8, 1), (10, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((12540805668767 : Rat) / 59205535956) [(8, 1), (10, 1), (15, 2)],
  term ((85 : Rat) / 14) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-239616 : Rat) / 553) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((4353333743611 : Rat) / 14801383989) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term (-30 : Rat) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4238595271243 : Rat) / 14801383989) [(8, 1), (10, 2), (15, 2)],
  term ((176 : Rat) / 7) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((4353333743611 : Rat) / 14801383989) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term (-30 : Rat) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4238595271243 : Rat) / 14801383989) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((176 : Rat) / 7) [(9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-16558867842361 : Rat) / 59205535956) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-12480 : Rat) / 553) [(9, 1), (10, 2), (11, 1)],
  term ((4266385353529 : Rat) / 59205535956) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-142028768838079 : Rat) / 1420932862944) [(9, 1), (10, 2), (13, 1)],
  term ((-9464306049553 : Rat) / 20234803428) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((5 : Rat) / 8) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((12753863657789 : Rat) / 59205535956) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((85 : Rat) / 24) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-575901606549527 : Rat) / 1420932862944) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-15 : Rat) / 14) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((401510278845617 : Rat) / 2841865725888) [(9, 1), (10, 2), (15, 1)],
  term ((-121 : Rat) / 42) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (10, 2), (15, 3)],
  term ((65 : Rat) / 7) [(9, 1), (10, 2), (15, 3), (16, 1)],
  term ((115126691849 : Rat) / 749437164) [(9, 1), (10, 3), (15, 1)],
  term ((7378568075692 : Rat) / 44404151967) [(9, 1), (11, 1)],
  term ((50294700516790819 : Rat) / 52219282713192) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15425 : Rat) / 252) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((705056616945577 : Rat) / 14919795060912) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-395 : Rat) / 168) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6733812628546 : Rat) / 14801383989) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((260 : Rat) / 7) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-17993585444659 : Rat) / 1065699647208) [(9, 1), (11, 1), (13, 2)],
  term ((-2438286298446361 : Rat) / 1598549470812) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((7645 : Rat) / 126) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 9867589326) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-305 : Rat) / 7) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-425 : Rat) / 84) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6522414593882 : Rat) / 133212455901) [(9, 1), (11, 1), (14, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((65 : Rat) / 7) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((12540805668767 : Rat) / 59205535956) [(9, 1), (11, 1), (15, 2)],
  term ((85 : Rat) / 14) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-437048348570047 : Rat) / 1420932862944) [(9, 1), (11, 2), (13, 1)],
  term ((-3782503879541899 : Rat) / 78328924069788) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((245 : Rat) / 8) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-38553889339075 : Rat) / 59205535956) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((85 : Rat) / 24) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1390212765281 : Rat) / 4142661408) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-367 : Rat) / 14) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-85913374624591 : Rat) / 2841865725888) [(9, 1), (11, 2), (15, 1)],
  term ((-121 : Rat) / 42) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (11, 2), (15, 3)],
  term ((65 : Rat) / 7) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((-12480 : Rat) / 553) [(9, 1), (11, 3)],
  term ((29920261851961 : Rat) / 59205535956) [(9, 1), (11, 3), (14, 1)],
  term ((-119808 : Rat) / 553) [(9, 1), (11, 3), (15, 2)],
  term ((-115126691849 : Rat) / 374718582) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((1692145150007 : Rat) / 17986491936) [(9, 2), (10, 2)],
  term ((-4012056600851 : Rat) / 17986491936) [(9, 2), (10, 2), (14, 1)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 2), (10, 2), (15, 2)],
  term ((142028768838079 : Rat) / 710466431472) [(9, 2), (11, 1), (13, 1)],
  term ((9464306049553 : Rat) / 10117401714) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-5 : Rat) / 4) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-12753863657789 : Rat) / 29602767978) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 14) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-85 : Rat) / 12) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((575901606549527 : Rat) / 710466431472) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((15 : Rat) / 7) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-401510278845617 : Rat) / 1420932862944) [(9, 2), (11, 1), (15, 1)],
  term ((121 : Rat) / 21) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(9, 2), (11, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((197814158096633 : Rat) / 1420932862944) [(9, 2), (11, 2)],
  term ((-521738968436621 : Rat) / 1420932862944) [(9, 2), (11, 2), (14, 1)],
  term ((85969924113749 : Rat) / 236822143824) [(9, 2), (11, 2), (15, 2)],
  term ((-1692145150007 : Rat) / 8993245968) [(9, 3), (11, 1)],
  term ((4012056600851 : Rat) / 8993245968) [(9, 3), (11, 1), (14, 1)],
  term ((210703568101 : Rat) / 1498874328) [(9, 3), (11, 1), (15, 2)],
  term ((-4353333743611 : Rat) / 29602767978) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term (15 : Rat) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((4238595271243 : Rat) / 29602767978) [(10, 1), (11, 2), (15, 2)],
  term ((-88 : Rat) / 7) [(10, 1), (11, 2), (15, 2), (16, 1)],
  term ((119808 : Rat) / 553) [(10, 1), (11, 3), (15, 1)],
  term ((-3689284037846 : Rat) / 44404151967) [(10, 2)],
  term ((57408 : Rat) / 553) [(10, 2), (11, 1), (13, 1)],
  term ((-2737818736523147 : Rat) / 13054820678298) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term (-15 : Rat) [(10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-1031860708939 : Rat) / 29602767978) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((88 : Rat) / 7) [(10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((47424 : Rat) / 553) [(10, 2), (11, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(10, 2), (11, 2), (14, 1)],
  term ((-50294700516790819 : Rat) / 104438565426384) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((15425 : Rat) / 504) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(10, 2), (13, 1), (14, 2), (15, 1)],
  term ((-705056616945577 : Rat) / 29839590121824) [(10, 2), (13, 1), (15, 1)],
  term ((395 : Rat) / 336) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(10, 2), (13, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((17993585444659 : Rat) / 2131399294416) [(10, 2), (13, 2)],
  term ((2438286298446361 : Rat) / 3197098941624) [(10, 2), (13, 2), (14, 1)],
  term ((-7645 : Rat) / 252) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(10, 2), (13, 2), (15, 2)],
  term ((305 : Rat) / 14) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((425 : Rat) / 168) [(10, 2), (13, 2), (16, 1)],
  term ((3261207296941 : Rat) / 133212455901) [(10, 2), (14, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(10, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 14) [(10, 2), (14, 1), (15, 2), (16, 1)],
  term ((-12540805668767 : Rat) / 118411071912) [(10, 2), (15, 2)],
  term ((-85 : Rat) / 28) [(10, 2), (15, 2), (16, 1)],
  term ((119808 : Rat) / 553) [(10, 3), (11, 1), (15, 1)],
  term ((-4353333743611 : Rat) / 29602767978) [(10, 3), (13, 1), (15, 1)],
  term (15 : Rat) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((4238595271243 : Rat) / 29602767978) [(10, 3), (15, 2)],
  term ((-88 : Rat) / 7) [(10, 3), (15, 2), (16, 1)],
  term ((-3689284037846 : Rat) / 44404151967) [(11, 2)],
  term ((-50294700516790819 : Rat) / 104438565426384) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((15425 : Rat) / 504) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-705056616945577 : Rat) / 29839590121824) [(11, 2), (13, 1), (15, 1)],
  term ((395 : Rat) / 336) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(11, 2), (13, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((17993585444659 : Rat) / 2131399294416) [(11, 2), (13, 2)],
  term ((2438286298446361 : Rat) / 3197098941624) [(11, 2), (13, 2), (14, 1)],
  term ((-7645 : Rat) / 252) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(11, 2), (13, 2), (15, 2)],
  term ((305 : Rat) / 14) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((425 : Rat) / 168) [(11, 2), (13, 2), (16, 1)],
  term ((3261207296941 : Rat) / 133212455901) [(11, 2), (14, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(11, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 14) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-12540805668767 : Rat) / 118411071912) [(11, 2), (15, 2)],
  term ((-85 : Rat) / 28) [(11, 2), (15, 2), (16, 1)],
  term ((57408 : Rat) / 553) [(11, 3), (13, 1)],
  term ((-2737818736523147 : Rat) / 13054820678298) [(11, 3), (13, 1), (14, 1)],
  term (-15 : Rat) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(11, 3), (13, 1), (15, 2)],
  term ((-1031860708939 : Rat) / 29602767978) [(11, 3), (14, 1), (15, 1)],
  term ((88 : Rat) / 7) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((47424 : Rat) / 553) [(11, 3), (15, 1)],
  term ((-119808 : Rat) / 553) [(11, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 96. -/
theorem rs_R009_ueqv_R009YNNNN_block_20_0000_0096_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_20_0000_0096
      rs_R009_ueqv_R009YNNNN_block_20_0000_0096 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
