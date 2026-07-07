/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 5:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0000 : Poly :=
[
  term ((-78606252562729595 : Rat) / 208877130852768) []
]

/-- Partial product 0 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0000 : Poly :=
[
  term ((78606252562729595 : Rat) / 104438565426384) [(4, 1)],
  term ((-78606252562729595 : Rat) / 208877130852768) [(4, 2)],
  term ((-78606252562729595 : Rat) / 208877130852768) [(5, 2)],
  term ((-78606252562729595 : Rat) / 104438565426384) [(14, 1)],
  term ((78606252562729595 : Rat) / 208877130852768) [(14, 2)],
  term ((78606252562729595 : Rat) / 208877130852768) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0000
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0001 : Poly :=
[
  term ((2614751792570 : Rat) / 44404151967) [(0, 1)]
]

/-- Partial product 1 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0001 : Poly :=
[
  term ((-5229503585140 : Rat) / 44404151967) [(0, 1), (4, 1)],
  term ((2614751792570 : Rat) / 44404151967) [(0, 1), (4, 2)],
  term ((2614751792570 : Rat) / 44404151967) [(0, 1), (5, 2)],
  term ((5229503585140 : Rat) / 44404151967) [(0, 1), (14, 1)],
  term ((-2614751792570 : Rat) / 44404151967) [(0, 1), (14, 2)],
  term ((-2614751792570 : Rat) / 44404151967) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0001
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0002 : Poly :=
[
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 2 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0002 : Poly :=
[
  term ((-45864690786755 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (4, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (4, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (5, 2)],
  term ((45864690786755 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (14, 2)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0002
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0003 : Poly :=
[
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (15, 1)]
]

/-- Partial product 3 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0003 : Poly :=
[
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (4, 1), (6, 1), (15, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (4, 2), (6, 1), (15, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (5, 2), (6, 1), (15, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (14, 2), (15, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0003
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0004 : Poly :=
[
  term ((804607491369755 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 4 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0004 : Poly :=
[
  term ((-804607491369755 : Rat) / 2175803446383) [(0, 1), (1, 1), (4, 1), (7, 1)],
  term ((804607491369755 : Rat) / 4351606892766) [(0, 1), (1, 1), (4, 2), (7, 1)],
  term ((804607491369755 : Rat) / 4351606892766) [(0, 1), (1, 1), (5, 2), (7, 1)],
  term ((804607491369755 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (14, 1)],
  term ((-804607491369755 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term ((-804607491369755 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0004
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0005 : Poly :=
[
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (14, 1)]
]

/-- Partial product 5 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0005 : Poly :=
[
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (4, 1), (7, 1), (14, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (4, 2), (7, 1), (14, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (5, 2), (7, 1), (14, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0005
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0006 : Poly :=
[
  term ((1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 6 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0006 : Poly :=
[
  term ((-1096961875165 : Rat) / 1498874328) [(0, 1), (1, 1), (4, 1), (9, 1)],
  term ((1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (4, 2), (9, 1)],
  term ((1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (5, 2), (9, 1)],
  term ((1096961875165 : Rat) / 1498874328) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term ((-1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0006
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0007 : Poly :=
[
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1)]
]

/-- Partial product 7 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0007 : Poly :=
[
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (4, 2), (9, 1), (12, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (5, 2), (9, 1), (12, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 2)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0007
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0008 : Poly :=
[
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (14, 1)]
]

/-- Partial product 8 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0008 : Poly :=
[
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (4, 2), (9, 1), (14, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (5, 2), (9, 1), (14, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (14, 1), (15, 2)],
  term ((10861008665 : Rat) / 187359291) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0008
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0009 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 9 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0009 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (1, 1), (4, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (4, 2), (11, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (5, 2), (11, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0009
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0010 : Poly :=
[
  term ((4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 1), (13, 1)]
]

/-- Partial product 10 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0010 : Poly :=
[
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (4, 2), (12, 1), (13, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (5, 2), (12, 1), (13, 1)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0010
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0011 : Poly :=
[
  term ((-5 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 11 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0011 : Poly :=
[
  term ((10 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((5 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0011
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0012 : Poly :=
[
  term ((-25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (15, 1)]
]

/-- Partial product 12 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0012 : Poly :=
[
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (4, 2), (12, 1), (15, 1)],
  term ((-25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (5, 2), (12, 1), (15, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0012
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0013 : Poly :=
[
  term ((4 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0013 : Poly :=
[
  term ((-8 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0013
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0014 : Poly :=
[
  term ((-14359858700093 : Rat) / 39470357304) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 14 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0014 : Poly :=
[
  term ((14359858700093 : Rat) / 19735178652) [(0, 1), (1, 1), (4, 1), (13, 1)],
  term ((-14359858700093 : Rat) / 39470357304) [(0, 1), (1, 1), (4, 2), (13, 1)],
  term ((-14359858700093 : Rat) / 39470357304) [(0, 1), (1, 1), (5, 2), (13, 1)],
  term ((-14359858700093 : Rat) / 19735178652) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((14359858700093 : Rat) / 39470357304) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((14359858700093 : Rat) / 39470357304) [(0, 1), (1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0014
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0015 : Poly :=
[
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (13, 1), (14, 1)]
]

/-- Partial product 15 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0015 : Poly :=
[
  term ((9412426570 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (13, 1), (14, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (4, 2), (13, 1), (14, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (5, 2), (13, 1), (14, 1)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-9412426570 : Rat) / 187359291) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0015
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0016 : Poly :=
[
  term ((10 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0016 : Poly :=
[
  term ((-20 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((10 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((10 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((20 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0016
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0017 : Poly :=
[
  term ((585 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0017 : Poly :=
[
  term ((-585 : Rat) / 14) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((585 : Rat) / 28) [(0, 1), (1, 1), (4, 2), (13, 1), (16, 1)],
  term ((585 : Rat) / 28) [(0, 1), (1, 1), (5, 2), (13, 1), (16, 1)],
  term ((585 : Rat) / 14) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-585 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-585 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0017
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0018 : Poly :=
[
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (14, 1), (15, 1)]
]

/-- Partial product 18 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0018 : Poly :=
[
  term ((-100872416720 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (4, 2), (14, 1), (15, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (5, 2), (14, 1), (15, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (14, 1), (15, 3)],
  term ((100872416720 : Rat) / 187359291) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0018
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0019 : Poly :=
[
  term ((-8 : Rat) / 7) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0019 : Poly :=
[
  term ((16 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0019
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0020 : Poly :=
[
  term ((2021028534215771 : Rat) / 4351606892766) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 20 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0020 : Poly :=
[
  term ((-2021028534215771 : Rat) / 2175803446383) [(0, 1), (1, 1), (4, 1), (15, 1)],
  term ((2021028534215771 : Rat) / 4351606892766) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term ((2021028534215771 : Rat) / 4351606892766) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term ((2021028534215771 : Rat) / 2175803446383) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((-2021028534215771 : Rat) / 4351606892766) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term ((-2021028534215771 : Rat) / 4351606892766) [(0, 1), (1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0020_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0020
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0021 : Poly :=
[
  term ((-121 : Rat) / 7) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0021 : Poly :=
[
  term ((242 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-121 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-121 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-242 : Rat) / 7) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((121 : Rat) / 7) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((121 : Rat) / 7) [(0, 1), (1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0021_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0021
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0022 : Poly :=
[
  term ((320 : Rat) / 63) [(0, 1), (2, 1)]
]

/-- Partial product 22 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0022 : Poly :=
[
  term ((-640 : Rat) / 63) [(0, 1), (2, 1), (4, 1)],
  term ((320 : Rat) / 63) [(0, 1), (2, 1), (4, 2)],
  term ((320 : Rat) / 63) [(0, 1), (2, 1), (5, 2)],
  term ((640 : Rat) / 63) [(0, 1), (2, 1), (14, 1)],
  term ((-320 : Rat) / 63) [(0, 1), (2, 1), (14, 2)],
  term ((-320 : Rat) / 63) [(0, 1), (2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0022_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0022
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0023 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (15, 1)]
]

/-- Partial product 23 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0023 : Poly :=
[
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (4, 2), (6, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (5, 2), (6, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0023_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0023
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0024 : Poly :=
[
  term ((-8864256956409752 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1)]
]

/-- Partial product 24 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0024 : Poly :=
[
  term ((17728513912819504 : Rat) / 6527410339149) [(0, 1), (3, 1), (4, 1), (7, 1)],
  term ((-8864256956409752 : Rat) / 6527410339149) [(0, 1), (3, 1), (4, 2), (7, 1)],
  term ((-8864256956409752 : Rat) / 6527410339149) [(0, 1), (3, 1), (5, 2), (7, 1)],
  term ((-17728513912819504 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term ((8864256956409752 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((8864256956409752 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0024_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0024
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0025 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (14, 1)]
]

/-- Partial product 25 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0025 : Poly :=
[
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (4, 1), (7, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (4, 2), (7, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (5, 2), (7, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0025_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0025
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0026 : Poly :=
[
  term ((-8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (9, 1)]
]

/-- Partial product 26 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0026 : Poly :=
[
  term ((8121862279687 : Rat) / 6744934476) [(0, 1), (3, 1), (4, 1), (9, 1)],
  term ((-8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (4, 2), (9, 1)],
  term ((-8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (5, 2), (9, 1)],
  term ((-8121862279687 : Rat) / 6744934476) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0026_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0026
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0027 : Poly :=
[
  term ((1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 27 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0027 : Poly :=
[
  term ((-1068637148240579 : Rat) / 2175803446383) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((1068637148240579 : Rat) / 2175803446383) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((-1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0027_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0027
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0028 : Poly :=
[
  term ((333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 28 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0028 : Poly :=
[
  term ((-333576329821813 : Rat) / 266424911802) [(0, 1), (3, 1), (4, 1), (13, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (4, 2), (13, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((333576329821813 : Rat) / 266424911802) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((-333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0028_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0028
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0029 : Poly :=
[
  term ((-505 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0029 : Poly :=
[
  term ((505 : Rat) / 21) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-505 : Rat) / 42) [(0, 1), (3, 1), (4, 2), (13, 1), (16, 1)],
  term ((-505 : Rat) / 42) [(0, 1), (3, 1), (5, 2), (13, 1), (16, 1)],
  term ((-505 : Rat) / 21) [(0, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((505 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((505 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0029_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0029
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0030 : Poly :=
[
  term ((758774871752011 : Rat) / 6527410339149) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 30 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0030 : Poly :=
[
  term ((-1517549743504022 : Rat) / 6527410339149) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((758774871752011 : Rat) / 6527410339149) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((758774871752011 : Rat) / 6527410339149) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((1517549743504022 : Rat) / 6527410339149) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((-758774871752011 : Rat) / 6527410339149) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-758774871752011 : Rat) / 6527410339149) [(0, 1), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0030_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0030
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0031 : Poly :=
[
  term ((194 : Rat) / 21) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0031 : Poly :=
[
  term ((-388 : Rat) / 21) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((194 : Rat) / 21) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((194 : Rat) / 21) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((388 : Rat) / 21) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-194 : Rat) / 21) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-194 : Rat) / 21) [(0, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0031_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0031
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0032 : Poly :=
[
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2)]
]

/-- Partial product 32 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0032 : Poly :=
[
  term ((-1107240197953805 : Rat) / 6527410339149) [(0, 1), (3, 2), (4, 1)],
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2), (4, 2)],
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2), (5, 2)],
  term ((1107240197953805 : Rat) / 6527410339149) [(0, 1), (3, 2), (14, 1)],
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2), (14, 2)],
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0032_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0032
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0033 : Poly :=
[
  term ((-7660998914045 : Rat) / 241755938487) [(0, 1), (6, 1)]
]

/-- Partial product 33 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0033 : Poly :=
[
  term ((15321997828090 : Rat) / 241755938487) [(0, 1), (4, 1), (6, 1)],
  term ((-7660998914045 : Rat) / 241755938487) [(0, 1), (4, 2), (6, 1)],
  term ((-7660998914045 : Rat) / 241755938487) [(0, 1), (5, 2), (6, 1)],
  term ((-15321997828090 : Rat) / 241755938487) [(0, 1), (6, 1), (14, 1)],
  term ((7660998914045 : Rat) / 241755938487) [(0, 1), (6, 1), (14, 2)],
  term ((7660998914045 : Rat) / 241755938487) [(0, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0033_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0033
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0034 : Poly :=
[
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 34 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0034 : Poly :=
[
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (4, 2), (6, 1), (7, 1), (15, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (5, 2), (6, 1), (7, 1), (15, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0034_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0034
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0035 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 35 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0035 : Poly :=
[
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (4, 2), (6, 1), (9, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0035_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0035
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0036 : Poly :=
[
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 36 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0036 : Poly :=
[
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0036_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0036
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0037 : Poly :=
[
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 37 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0037 : Poly :=
[
  term ((1121527532107244 : Rat) / 399637367703) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0037_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0037
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0038 : Poly :=
[
  term ((-340 : Rat) / 63) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0038 : Poly :=
[
  term ((680 : Rat) / 63) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-680 : Rat) / 63) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0038_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0038
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0039 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 1), (15, 2)]
]

/-- Partial product 39 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0039 : Poly :=
[
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (4, 2), (6, 1), (14, 1), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (5, 2), (6, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 1), (15, 4)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0039_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0039
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0040 : Poly :=
[
  term ((4282250622413135 : Rat) / 3729948765228) [(0, 1), (6, 1), (15, 2)]
]

/-- Partial product 40 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0040 : Poly :=
[
  term ((-4282250622413135 : Rat) / 1864974382614) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((4282250622413135 : Rat) / 3729948765228) [(0, 1), (4, 2), (6, 1), (15, 2)],
  term ((4282250622413135 : Rat) / 3729948765228) [(0, 1), (5, 2), (6, 1), (15, 2)],
  term ((4282250622413135 : Rat) / 1864974382614) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-4282250622413135 : Rat) / 3729948765228) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((-4282250622413135 : Rat) / 3729948765228) [(0, 1), (6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0040_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0040
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0041 : Poly :=
[
  term ((64 : Rat) / 9) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0041 : Poly :=
[
  term ((-128 : Rat) / 9) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 9) [(0, 1), (4, 2), (6, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 9) [(0, 1), (5, 2), (6, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 9) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0041_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0041
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0042 : Poly :=
[
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (7, 1), (9, 1)]
]

/-- Partial product 42 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0042 : Poly :=
[
  term ((-6788130415625 : Rat) / 1686233619) [(0, 1), (4, 1), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (4, 2), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (5, 2), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 1686233619) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((-6788130415625 : Rat) / 3372467238) [(0, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0042_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0042
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0043 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 43 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0043 : Poly :=
[
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (4, 1), (7, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (5, 2), (7, 1), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0043_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0043
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0044 : Poly :=
[
  term ((-24951705893235785 : Rat) / 8703213785532) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 44 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0044 : Poly :=
[
  term ((24951705893235785 : Rat) / 4351606892766) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((-24951705893235785 : Rat) / 8703213785532) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((-24951705893235785 : Rat) / 8703213785532) [(0, 1), (5, 2), (7, 1), (11, 1)],
  term ((-24951705893235785 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((24951705893235785 : Rat) / 8703213785532) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((24951705893235785 : Rat) / 8703213785532) [(0, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0044_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0044
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0045 : Poly :=
[
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 45 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0045 : Poly :=
[
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (4, 2), (7, 1), (11, 1), (14, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0045_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0045
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0046 : Poly :=
[
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 46 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0046 : Poly :=
[
  term ((560763766053622 : Rat) / 133212455901) [(0, 1), (4, 1), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (4, 2), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (5, 2), (7, 1), (13, 1)],
  term ((-560763766053622 : Rat) / 133212455901) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((280381883026811 : Rat) / 133212455901) [(0, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0046_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0046
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0047 : Poly :=
[
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 47 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0047 : Poly :=
[
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (4, 2), (7, 1), (13, 1), (14, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((1121527532107244 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0047_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0047
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0048 : Poly :=
[
  term ((340 : Rat) / 63) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 48 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0048 : Poly :=
[
  term ((-680 : Rat) / 63) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((340 : Rat) / 63) [(0, 1), (4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((340 : Rat) / 63) [(0, 1), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((680 : Rat) / 63) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0048_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0048
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0049 : Poly :=
[
  term ((-170 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 49 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0049 : Poly :=
[
  term ((340 : Rat) / 21) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((170 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((170 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0049_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0049
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0050 : Poly :=
[
  term ((-30720403451337119 : Rat) / 26109641356596) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 50 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0050 : Poly :=
[
  term ((30720403451337119 : Rat) / 13054820678298) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-30720403451337119 : Rat) / 26109641356596) [(0, 1), (4, 2), (7, 1), (14, 1), (15, 1)],
  term ((-30720403451337119 : Rat) / 26109641356596) [(0, 1), (5, 2), (7, 1), (14, 1), (15, 1)],
  term ((30720403451337119 : Rat) / 26109641356596) [(0, 1), (7, 1), (14, 1), (15, 3)],
  term ((-30720403451337119 : Rat) / 13054820678298) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((30720403451337119 : Rat) / 26109641356596) [(0, 1), (7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0050_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0050
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0051 : Poly :=
[
  term ((-64 : Rat) / 9) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0051 : Poly :=
[
  term ((128 : Rat) / 9) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(0, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-128 : Rat) / 9) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(0, 1), (7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0051_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0051
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0052 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (14, 2), (15, 1)]
]

/-- Partial product 52 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0052 : Poly :=
[
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (4, 2), (7, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (5, 2), (7, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (14, 2), (15, 3)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (7, 1), (14, 3), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0052_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0052
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0053 : Poly :=
[
  term ((6500686689053663 : Rat) / 2175803446383) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 53 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0053 : Poly :=
[
  term ((-13001373378107326 : Rat) / 2175803446383) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((6500686689053663 : Rat) / 2175803446383) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((6500686689053663 : Rat) / 2175803446383) [(0, 1), (5, 2), (7, 1), (15, 1)],
  term ((13001373378107326 : Rat) / 2175803446383) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-6500686689053663 : Rat) / 2175803446383) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-6500686689053663 : Rat) / 2175803446383) [(0, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0053_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0053
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0054 : Poly :=
[
  term ((32 : Rat) / 3) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0054 : Poly :=
[
  term ((-64 : Rat) / 3) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 3) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(0, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0054_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0054
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0055 : Poly :=
[
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (7, 2)]
]

/-- Partial product 55 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0055 : Poly :=
[
  term ((-4958198497169924 : Rat) / 2175803446383) [(0, 1), (4, 1), (7, 2)],
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (4, 2), (7, 2)],
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (5, 2), (7, 2)],
  term ((4958198497169924 : Rat) / 2175803446383) [(0, 1), (7, 2), (14, 1)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(0, 1), (7, 2), (14, 2)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(0, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0055_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0055
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0056 : Poly :=
[
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 1)]
]

/-- Partial product 56 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0056 : Poly :=
[
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (4, 1), (7, 2), (14, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (4, 2), (7, 2), (14, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (5, 2), (7, 2), (14, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 1), (15, 2)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 2)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0056_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0056
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0057 : Poly :=
[
  term ((10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 57 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0057 : Poly :=
[
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 1), (4, 2), (9, 1), (10, 1), (13, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0057_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0057
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0058 : Poly :=
[
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 58 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0058 : Poly :=
[
  term ((10861008665 : Rat) / 53531226) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-10861008665 : Rat) / 53531226) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0058_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0058
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0059 : Poly :=
[
  term ((-2608814281333 : Rat) / 17986491936) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 59 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0059 : Poly :=
[
  term ((2608814281333 : Rat) / 8993245968) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((-2608814281333 : Rat) / 17986491936) [(0, 1), (4, 2), (9, 1), (11, 1)],
  term ((-2608814281333 : Rat) / 17986491936) [(0, 1), (5, 2), (9, 1), (11, 1)],
  term ((-2608814281333 : Rat) / 8993245968) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((2608814281333 : Rat) / 17986491936) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((2608814281333 : Rat) / 17986491936) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0059_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0059
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0060 : Poly :=
[
  term ((108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 60 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0060 : Poly :=
[
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0060_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0060
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0061 : Poly :=
[
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0061 : Poly :=
[
  term ((115 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0061_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0061
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0062 : Poly :=
[
  term ((183252917185 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 62 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0062 : Poly :=
[
  term ((-183252917185 : Rat) / 749437164) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((183252917185 : Rat) / 1498874328) [(0, 1), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((183252917185 : Rat) / 1498874328) [(0, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((183252917185 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-183252917185 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-183252917185 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0062_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0062
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0063 : Poly :=
[
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0063 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0063_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0063
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0064 : Poly :=
[
  term ((509733045065 : Rat) / 1498874328) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 64 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0064 : Poly :=
[
  term ((-509733045065 : Rat) / 749437164) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((509733045065 : Rat) / 1498874328) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((509733045065 : Rat) / 1498874328) [(0, 1), (5, 2), (9, 1), (13, 1)],
  term ((509733045065 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-509733045065 : Rat) / 1498874328) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-509733045065 : Rat) / 1498874328) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0064_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0064
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0065 : Poly :=
[
  term ((-3649940619119 : Rat) / 5995497312) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 65 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0065 : Poly :=
[
  term ((3649940619119 : Rat) / 2997748656) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-3649940619119 : Rat) / 5995497312) [(0, 1), (4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3649940619119 : Rat) / 5995497312) [(0, 1), (5, 2), (9, 1), (13, 1), (14, 1)],
  term ((3649940619119 : Rat) / 5995497312) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3649940619119 : Rat) / 2997748656) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((3649940619119 : Rat) / 5995497312) [(0, 1), (9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0065_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0065
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0066 : Poly :=
[
  term ((115 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 66 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0066 : Poly :=
[
  term ((-230 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((115 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((115 : Rat) / 7) [(0, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((230 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0066_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0066
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0067 : Poly :=
[
  term ((-115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0067 : Poly :=
[
  term ((115 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0067_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0067
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0068 : Poly :=
[
  term ((954789077801 : Rat) / 2997748656) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 68 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0068 : Poly :=
[
  term ((-954789077801 : Rat) / 1498874328) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((954789077801 : Rat) / 2997748656) [(0, 1), (4, 2), (9, 1), (14, 1), (15, 1)],
  term ((954789077801 : Rat) / 2997748656) [(0, 1), (5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-954789077801 : Rat) / 2997748656) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((954789077801 : Rat) / 1498874328) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-954789077801 : Rat) / 2997748656) [(0, 1), (9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0068_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0068
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0069 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0069 : Poly :=
[
  term ((184 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-184 : Rat) / 7) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0069_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0069
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0070 : Poly :=
[
  term ((-50982596596607 : Rat) / 26979737904) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 70 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0070 : Poly :=
[
  term ((50982596596607 : Rat) / 13489868952) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-50982596596607 : Rat) / 26979737904) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((-50982596596607 : Rat) / 26979737904) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((-50982596596607 : Rat) / 13489868952) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((50982596596607 : Rat) / 26979737904) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((50982596596607 : Rat) / 26979737904) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0070_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0070
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0071 : Poly :=
[
  term ((46 : Rat) / 7) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0071 : Poly :=
[
  term ((-92 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((46 : Rat) / 7) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0071_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0071
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0072 : Poly :=
[
  term ((-1027451419709 : Rat) / 4496622984) [(0, 1), (9, 2)]
]

/-- Partial product 72 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0072 : Poly :=
[
  term ((1027451419709 : Rat) / 2248311492) [(0, 1), (4, 1), (9, 2)],
  term ((-1027451419709 : Rat) / 4496622984) [(0, 1), (4, 2), (9, 2)],
  term ((-1027451419709 : Rat) / 4496622984) [(0, 1), (5, 2), (9, 2)],
  term ((-1027451419709 : Rat) / 2248311492) [(0, 1), (9, 2), (14, 1)],
  term ((1027451419709 : Rat) / 4496622984) [(0, 1), (9, 2), (14, 2)],
  term ((1027451419709 : Rat) / 4496622984) [(0, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0072_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0072
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0073 : Poly :=
[
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 1)]
]

/-- Partial product 73 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0073 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (4, 1), (9, 2), (12, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (4, 2), (9, 2), (12, 1)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (5, 2), (9, 2), (12, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 1), (14, 2)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0073_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0073
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0074 : Poly :=
[
  term ((249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (14, 1)]
]

/-- Partial product 74 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0074 : Poly :=
[
  term ((-249803199295 : Rat) / 374718582) [(0, 1), (4, 1), (9, 2), (14, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (4, 2), (9, 2), (14, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (5, 2), (9, 2), (14, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (14, 1), (15, 2)],
  term ((249803199295 : Rat) / 374718582) [(0, 1), (9, 2), (14, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0074_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0074
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0075 : Poly :=
[
  term ((76823005517426867 : Rat) / 69625710284256) [(0, 1), (10, 1)]
]

/-- Partial product 75 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0075 : Poly :=
[
  term ((-76823005517426867 : Rat) / 34812855142128) [(0, 1), (4, 1), (10, 1)],
  term ((76823005517426867 : Rat) / 69625710284256) [(0, 1), (4, 2), (10, 1)],
  term ((76823005517426867 : Rat) / 69625710284256) [(0, 1), (5, 2), (10, 1)],
  term ((76823005517426867 : Rat) / 34812855142128) [(0, 1), (10, 1), (14, 1)],
  term ((-76823005517426867 : Rat) / 69625710284256) [(0, 1), (10, 1), (14, 2)],
  term ((-76823005517426867 : Rat) / 69625710284256) [(0, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0075_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0075
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0076 : Poly :=
[
  term ((3355349785 : Rat) / 53531226) [(0, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 76 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0076 : Poly :=
[
  term ((-3355349785 : Rat) / 26765613) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((3355349785 : Rat) / 53531226) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1)],
  term ((3355349785 : Rat) / 53531226) [(0, 1), (5, 2), (10, 1), (13, 1), (15, 1)],
  term ((3355349785 : Rat) / 26765613) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3355349785 : Rat) / 53531226) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3355349785 : Rat) / 53531226) [(0, 1), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0076_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0076
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0077 : Poly :=
[
  term (-7 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0077 : Poly :=
[
  term (14 : Rat) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(0, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (7 : Rat) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0077_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0077
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0078 : Poly :=
[
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (13, 2)]
]

/-- Partial product 78 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0078 : Poly :=
[
  term ((4706213285 : Rat) / 53531226) [(0, 1), (4, 1), (10, 1), (13, 2)],
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (4, 2), (10, 1), (13, 2)],
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (5, 2), (10, 1), (13, 2)],
  term ((-4706213285 : Rat) / 53531226) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0078_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0078
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0079 : Poly :=
[
  term ((5 : Rat) / 2) [(0, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 79 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0079 : Poly :=
[
  term (-5 : Rat) [(0, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 2) [(0, 1), (4, 2), (10, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 2) [(0, 1), (5, 2), (10, 1), (13, 2), (16, 1)],
  term (5 : Rat) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0079_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0079
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0080 : Poly :=
[
  term ((192980500 : Rat) / 3823659) [(0, 1), (10, 1), (15, 2)]
]

/-- Partial product 80 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0080 : Poly :=
[
  term ((-385961000 : Rat) / 3823659) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term ((192980500 : Rat) / 3823659) [(0, 1), (4, 2), (10, 1), (15, 2)],
  term ((192980500 : Rat) / 3823659) [(0, 1), (5, 2), (10, 1), (15, 2)],
  term ((385961000 : Rat) / 3823659) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-192980500 : Rat) / 3823659) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((-192980500 : Rat) / 3823659) [(0, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0080_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0080
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0081 : Poly :=
[
  term (4 : Rat) [(0, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 81 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0081 : Poly :=
[
  term (-8 : Rat) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (4, 2), (10, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (5, 2), (10, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(0, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0081_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0081
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0082 : Poly :=
[
  term ((14679168932041 : Rat) / 101495204496) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 82 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0082 : Poly :=
[
  term ((-14679168932041 : Rat) / 50747602248) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((14679168932041 : Rat) / 101495204496) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((14679168932041 : Rat) / 101495204496) [(0, 1), (5, 2), (11, 1), (13, 1)],
  term ((14679168932041 : Rat) / 50747602248) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-14679168932041 : Rat) / 101495204496) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-14679168932041 : Rat) / 101495204496) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0082_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0082
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0083 : Poly :=
[
  term ((-179712 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 83 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0083 : Poly :=
[
  term ((359424 : Rat) / 553) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-179712 : Rat) / 553) [(0, 1), (4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-179712 : Rat) / 553) [(0, 1), (5, 2), (11, 1), (13, 1), (14, 1)],
  term ((179712 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-359424 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((179712 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0083_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0083
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0084 : Poly :=
[
  term ((-395 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 84 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0084 : Poly :=
[
  term ((395 : Rat) / 28) [(0, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-395 : Rat) / 56) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-395 : Rat) / 56) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-395 : Rat) / 28) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((395 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((395 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0084_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0084
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0085 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 85 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0085 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (4, 2), (11, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((239616 : Rat) / 553) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0085_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0085
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0086 : Poly :=
[
  term ((1330922972276420 : Rat) / 725267815461) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 86 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0086 : Poly :=
[
  term ((-2661845944552840 : Rat) / 725267815461) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((1330922972276420 : Rat) / 725267815461) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((1330922972276420 : Rat) / 725267815461) [(0, 1), (5, 2), (11, 1), (15, 1)],
  term ((2661845944552840 : Rat) / 725267815461) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1330922972276420 : Rat) / 725267815461) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1330922972276420 : Rat) / 725267815461) [(0, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0086_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0086
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0087 : Poly :=
[
  term ((83 : Rat) / 14) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0087 : Poly :=
[
  term ((-83 : Rat) / 7) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((83 : Rat) / 14) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((83 : Rat) / 14) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((83 : Rat) / 7) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-83 : Rat) / 14) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-83 : Rat) / 14) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0087_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0087
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0088 : Poly :=
[
  term ((-59904 : Rat) / 553) [(0, 1), (11, 2)]
]

/-- Partial product 88 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0088 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (4, 1), (11, 2)],
  term ((-59904 : Rat) / 553) [(0, 1), (4, 2), (11, 2)],
  term ((-59904 : Rat) / 553) [(0, 1), (5, 2), (11, 2)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 2), (14, 1)],
  term ((59904 : Rat) / 553) [(0, 1), (11, 2), (14, 2)],
  term ((59904 : Rat) / 553) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0088_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0088
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0089 : Poly :=
[
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 1)]
]

/-- Partial product 89 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0089 : Poly :=
[
  term ((1729028084357939 : Rat) / 1657755006768) [(0, 1), (4, 1), (12, 1)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 1), (4, 2), (12, 1)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 1), (5, 2), (12, 1)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(0, 1), (12, 1), (14, 1)],
  term ((1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 1), (14, 2)],
  term ((1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0089_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0089
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0090 : Poly :=
[
  term ((-117655332125 : Rat) / 749437164) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 90 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0090 : Poly :=
[
  term ((117655332125 : Rat) / 374718582) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-117655332125 : Rat) / 749437164) [(0, 1), (4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-117655332125 : Rat) / 749437164) [(0, 1), (5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-117655332125 : Rat) / 374718582) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((117655332125 : Rat) / 749437164) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((117655332125 : Rat) / 749437164) [(0, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0090_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0090
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0091 : Poly :=
[
  term ((125 : Rat) / 14) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0091 : Poly :=
[
  term ((-125 : Rat) / 7) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((125 : Rat) / 14) [(0, 1), (4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((125 : Rat) / 14) [(0, 1), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((125 : Rat) / 7) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125 : Rat) / 14) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-125 : Rat) / 14) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0091_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0091
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0092 : Poly :=
[
  term ((36252141610 : Rat) / 187359291) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 92 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0092 : Poly :=
[
  term ((-72504283220 : Rat) / 187359291) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((36252141610 : Rat) / 187359291) [(0, 1), (4, 2), (12, 1), (15, 2)],
  term ((36252141610 : Rat) / 187359291) [(0, 1), (5, 2), (12, 1), (15, 2)],
  term ((72504283220 : Rat) / 187359291) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-36252141610 : Rat) / 187359291) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-36252141610 : Rat) / 187359291) [(0, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0092_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0092
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0093 : Poly :=
[
  term ((-50 : Rat) / 7) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 93 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0093 : Poly :=
[
  term ((100 : Rat) / 7) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-50 : Rat) / 7) [(0, 1), (4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-50 : Rat) / 7) [(0, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-100 : Rat) / 7) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((50 : Rat) / 7) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((50 : Rat) / 7) [(0, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0093_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0093
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0094 : Poly :=
[
  term ((-54867625049149 : Rat) / 118411071912) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 94 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0094 : Poly :=
[
  term ((54867625049149 : Rat) / 59205535956) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-54867625049149 : Rat) / 118411071912) [(0, 1), (4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-54867625049149 : Rat) / 118411071912) [(0, 1), (5, 2), (13, 1), (14, 1), (15, 1)],
  term ((54867625049149 : Rat) / 118411071912) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((-54867625049149 : Rat) / 59205535956) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((54867625049149 : Rat) / 118411071912) [(0, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0094_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0094
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0095 : Poly :=
[
  term ((1163 : Rat) / 28) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0095 : Poly :=
[
  term ((-1163 : Rat) / 14) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1163 : Rat) / 28) [(0, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1163 : Rat) / 28) [(0, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1163 : Rat) / 28) [(0, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1163 : Rat) / 14) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1163 : Rat) / 28) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0095_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0095
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0096 : Poly :=
[
  term ((2386620085736393 : Rat) / 1065699647208) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 96 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0096 : Poly :=
[
  term ((-2386620085736393 : Rat) / 532849823604) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((2386620085736393 : Rat) / 1065699647208) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((2386620085736393 : Rat) / 1065699647208) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((2386620085736393 : Rat) / 532849823604) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2386620085736393 : Rat) / 1065699647208) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2386620085736393 : Rat) / 1065699647208) [(0, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0096_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0096
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0097 : Poly :=
[
  term ((-1193 : Rat) / 84) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0097 : Poly :=
[
  term ((1193 : Rat) / 42) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1193 : Rat) / 84) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1193 : Rat) / 84) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1193 : Rat) / 42) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1193 : Rat) / 84) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1193 : Rat) / 84) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0097_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0097
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0098 : Poly :=
[
  term ((-4706213285 : Rat) / 27756932) [(0, 1), (13, 2)]
]

/-- Partial product 98 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0098 : Poly :=
[
  term ((4706213285 : Rat) / 13878466) [(0, 1), (4, 1), (13, 2)],
  term ((-4706213285 : Rat) / 27756932) [(0, 1), (4, 2), (13, 2)],
  term ((-4706213285 : Rat) / 27756932) [(0, 1), (5, 2), (13, 2)],
  term ((-4706213285 : Rat) / 13878466) [(0, 1), (13, 2), (14, 1)],
  term ((4706213285 : Rat) / 27756932) [(0, 1), (13, 2), (14, 2)],
  term ((4706213285 : Rat) / 27756932) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0098_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0098
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YNNNN_coefficient_05_0099 : Poly :=
[
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 99 for generator 5. -/
def rs_R009_ueqv_R009YNNNN_partial_05_0099 : Poly :=
[
  term ((-831117266131 : Rat) / 1498874328) [(0, 1), (4, 1), (13, 2), (14, 1)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (4, 2), (13, 2), (14, 1)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (5, 2), (13, 2), (14, 1)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((831117266131 : Rat) / 1498874328) [(0, 1), (13, 2), (14, 2)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 5. -/
theorem rs_R009_ueqv_R009YNNNN_partial_05_0099_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_05_0099
        rs_R009_ueqv_R009YNNNN_generator_05_0000_0099 =
      rs_R009_ueqv_R009YNNNN_partial_05_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_05_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_05_0000,
  rs_R009_ueqv_R009YNNNN_partial_05_0001,
  rs_R009_ueqv_R009YNNNN_partial_05_0002,
  rs_R009_ueqv_R009YNNNN_partial_05_0003,
  rs_R009_ueqv_R009YNNNN_partial_05_0004,
  rs_R009_ueqv_R009YNNNN_partial_05_0005,
  rs_R009_ueqv_R009YNNNN_partial_05_0006,
  rs_R009_ueqv_R009YNNNN_partial_05_0007,
  rs_R009_ueqv_R009YNNNN_partial_05_0008,
  rs_R009_ueqv_R009YNNNN_partial_05_0009,
  rs_R009_ueqv_R009YNNNN_partial_05_0010,
  rs_R009_ueqv_R009YNNNN_partial_05_0011,
  rs_R009_ueqv_R009YNNNN_partial_05_0012,
  rs_R009_ueqv_R009YNNNN_partial_05_0013,
  rs_R009_ueqv_R009YNNNN_partial_05_0014,
  rs_R009_ueqv_R009YNNNN_partial_05_0015,
  rs_R009_ueqv_R009YNNNN_partial_05_0016,
  rs_R009_ueqv_R009YNNNN_partial_05_0017,
  rs_R009_ueqv_R009YNNNN_partial_05_0018,
  rs_R009_ueqv_R009YNNNN_partial_05_0019,
  rs_R009_ueqv_R009YNNNN_partial_05_0020,
  rs_R009_ueqv_R009YNNNN_partial_05_0021,
  rs_R009_ueqv_R009YNNNN_partial_05_0022,
  rs_R009_ueqv_R009YNNNN_partial_05_0023,
  rs_R009_ueqv_R009YNNNN_partial_05_0024,
  rs_R009_ueqv_R009YNNNN_partial_05_0025,
  rs_R009_ueqv_R009YNNNN_partial_05_0026,
  rs_R009_ueqv_R009YNNNN_partial_05_0027,
  rs_R009_ueqv_R009YNNNN_partial_05_0028,
  rs_R009_ueqv_R009YNNNN_partial_05_0029,
  rs_R009_ueqv_R009YNNNN_partial_05_0030,
  rs_R009_ueqv_R009YNNNN_partial_05_0031,
  rs_R009_ueqv_R009YNNNN_partial_05_0032,
  rs_R009_ueqv_R009YNNNN_partial_05_0033,
  rs_R009_ueqv_R009YNNNN_partial_05_0034,
  rs_R009_ueqv_R009YNNNN_partial_05_0035,
  rs_R009_ueqv_R009YNNNN_partial_05_0036,
  rs_R009_ueqv_R009YNNNN_partial_05_0037,
  rs_R009_ueqv_R009YNNNN_partial_05_0038,
  rs_R009_ueqv_R009YNNNN_partial_05_0039,
  rs_R009_ueqv_R009YNNNN_partial_05_0040,
  rs_R009_ueqv_R009YNNNN_partial_05_0041,
  rs_R009_ueqv_R009YNNNN_partial_05_0042,
  rs_R009_ueqv_R009YNNNN_partial_05_0043,
  rs_R009_ueqv_R009YNNNN_partial_05_0044,
  rs_R009_ueqv_R009YNNNN_partial_05_0045,
  rs_R009_ueqv_R009YNNNN_partial_05_0046,
  rs_R009_ueqv_R009YNNNN_partial_05_0047,
  rs_R009_ueqv_R009YNNNN_partial_05_0048,
  rs_R009_ueqv_R009YNNNN_partial_05_0049,
  rs_R009_ueqv_R009YNNNN_partial_05_0050,
  rs_R009_ueqv_R009YNNNN_partial_05_0051,
  rs_R009_ueqv_R009YNNNN_partial_05_0052,
  rs_R009_ueqv_R009YNNNN_partial_05_0053,
  rs_R009_ueqv_R009YNNNN_partial_05_0054,
  rs_R009_ueqv_R009YNNNN_partial_05_0055,
  rs_R009_ueqv_R009YNNNN_partial_05_0056,
  rs_R009_ueqv_R009YNNNN_partial_05_0057,
  rs_R009_ueqv_R009YNNNN_partial_05_0058,
  rs_R009_ueqv_R009YNNNN_partial_05_0059,
  rs_R009_ueqv_R009YNNNN_partial_05_0060,
  rs_R009_ueqv_R009YNNNN_partial_05_0061,
  rs_R009_ueqv_R009YNNNN_partial_05_0062,
  rs_R009_ueqv_R009YNNNN_partial_05_0063,
  rs_R009_ueqv_R009YNNNN_partial_05_0064,
  rs_R009_ueqv_R009YNNNN_partial_05_0065,
  rs_R009_ueqv_R009YNNNN_partial_05_0066,
  rs_R009_ueqv_R009YNNNN_partial_05_0067,
  rs_R009_ueqv_R009YNNNN_partial_05_0068,
  rs_R009_ueqv_R009YNNNN_partial_05_0069,
  rs_R009_ueqv_R009YNNNN_partial_05_0070,
  rs_R009_ueqv_R009YNNNN_partial_05_0071,
  rs_R009_ueqv_R009YNNNN_partial_05_0072,
  rs_R009_ueqv_R009YNNNN_partial_05_0073,
  rs_R009_ueqv_R009YNNNN_partial_05_0074,
  rs_R009_ueqv_R009YNNNN_partial_05_0075,
  rs_R009_ueqv_R009YNNNN_partial_05_0076,
  rs_R009_ueqv_R009YNNNN_partial_05_0077,
  rs_R009_ueqv_R009YNNNN_partial_05_0078,
  rs_R009_ueqv_R009YNNNN_partial_05_0079,
  rs_R009_ueqv_R009YNNNN_partial_05_0080,
  rs_R009_ueqv_R009YNNNN_partial_05_0081,
  rs_R009_ueqv_R009YNNNN_partial_05_0082,
  rs_R009_ueqv_R009YNNNN_partial_05_0083,
  rs_R009_ueqv_R009YNNNN_partial_05_0084,
  rs_R009_ueqv_R009YNNNN_partial_05_0085,
  rs_R009_ueqv_R009YNNNN_partial_05_0086,
  rs_R009_ueqv_R009YNNNN_partial_05_0087,
  rs_R009_ueqv_R009YNNNN_partial_05_0088,
  rs_R009_ueqv_R009YNNNN_partial_05_0089,
  rs_R009_ueqv_R009YNNNN_partial_05_0090,
  rs_R009_ueqv_R009YNNNN_partial_05_0091,
  rs_R009_ueqv_R009YNNNN_partial_05_0092,
  rs_R009_ueqv_R009YNNNN_partial_05_0093,
  rs_R009_ueqv_R009YNNNN_partial_05_0094,
  rs_R009_ueqv_R009YNNNN_partial_05_0095,
  rs_R009_ueqv_R009YNNNN_partial_05_0096,
  rs_R009_ueqv_R009YNNNN_partial_05_0097,
  rs_R009_ueqv_R009YNNNN_partial_05_0098,
  rs_R009_ueqv_R009YNNNN_partial_05_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_05_0000_0099 : Poly :=
[
  term ((-45864690786755 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (4, 1)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (4, 2)],
  term ((45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (5, 2)],
  term ((45864690786755 : Rat) / 2175803446383) [(0, 1), (1, 1), (3, 1), (14, 1)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (14, 2)],
  term ((-45864690786755 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((-2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (4, 1), (6, 1), (15, 1)],
  term ((-804607491369755 : Rat) / 2175803446383) [(0, 1), (1, 1), (4, 1), (7, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (4, 1), (7, 1), (14, 1)],
  term ((-1096961875165 : Rat) / 1498874328) [(0, 1), (1, 1), (4, 1), (9, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (4, 1), (9, 1), (12, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (9, 1), (14, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (1, 1), (4, 1), (11, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1)],
  term ((10 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((14359858700093 : Rat) / 19735178652) [(0, 1), (1, 1), (4, 1), (13, 1)],
  term ((9412426570 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (13, 1), (14, 1)],
  term ((-20 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-585 : Rat) / 14) [(0, 1), (1, 1), (4, 1), (13, 1), (16, 1)],
  term ((-100872416720 : Rat) / 187359291) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1)],
  term ((16 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2021028534215771 : Rat) / 2175803446383) [(0, 1), (1, 1), (4, 1), (15, 1)],
  term ((242 : Rat) / 7) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (4, 2), (6, 1), (15, 1)],
  term ((804607491369755 : Rat) / 4351606892766) [(0, 1), (1, 1), (4, 2), (7, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (4, 2), (7, 1), (14, 1)],
  term ((1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (4, 2), (9, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (4, 2), (9, 1), (12, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (4, 2), (9, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (4, 2), (11, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (4, 2), (12, 1), (13, 1)],
  term ((-5 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((-25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (4, 2), (12, 1), (15, 1)],
  term ((4 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-14359858700093 : Rat) / 39470357304) [(0, 1), (1, 1), (4, 2), (13, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (4, 2), (13, 1), (14, 1)],
  term ((10 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (13, 1), (14, 1), (16, 1)],
  term ((585 : Rat) / 28) [(0, 1), (1, 1), (4, 2), (13, 1), (16, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (4, 2), (14, 1), (15, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((2021028534215771 : Rat) / 4351606892766) [(0, 1), (1, 1), (4, 2), (15, 1)],
  term ((-121 : Rat) / 7) [(0, 1), (1, 1), (4, 2), (15, 1), (16, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (5, 2), (6, 1), (15, 1)],
  term ((804607491369755 : Rat) / 4351606892766) [(0, 1), (1, 1), (5, 2), (7, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (5, 2), (7, 1), (14, 1)],
  term ((1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (5, 2), (9, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (5, 2), (9, 1), (12, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (5, 2), (9, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (5, 2), (11, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (5, 2), (12, 1), (13, 1)],
  term ((-5 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (5, 2), (12, 1), (15, 1)],
  term ((4 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-14359858700093 : Rat) / 39470357304) [(0, 1), (1, 1), (5, 2), (13, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (5, 2), (13, 1), (14, 1)],
  term ((10 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (13, 1), (14, 1), (16, 1)],
  term ((585 : Rat) / 28) [(0, 1), (1, 1), (5, 2), (13, 1), (16, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (5, 2), (14, 1), (15, 1)],
  term ((-8 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((2021028534215771 : Rat) / 4351606892766) [(0, 1), (1, 1), (5, 2), (15, 1)],
  term ((-121 : Rat) / 7) [(0, 1), (1, 1), (5, 2), (15, 1), (16, 1)],
  term ((2877876402905362 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (14, 2), (15, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (15, 3)],
  term ((804607491369755 : Rat) / 2175803446383) [(0, 1), (1, 1), (7, 1), (14, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-8169575279919989 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (14, 2)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (14, 3)],
  term ((-804607491369755 : Rat) / 4351606892766) [(0, 1), (1, 1), (7, 1), (15, 2)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 2)],
  term ((10861008665 : Rat) / 749437164) [(0, 1), (1, 1), (9, 1), (12, 1), (15, 2)],
  term ((1096961875165 : Rat) / 1498874328) [(0, 1), (1, 1), (9, 1), (14, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-923185736525 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (14, 2)],
  term ((-10861008665 : Rat) / 374718582) [(0, 1), (1, 1), (9, 1), (14, 3)],
  term ((-1096961875165 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (15, 2)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2)],
  term ((5 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2)],
  term ((5 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((25218104180 : Rat) / 187359291) [(0, 1), (1, 1), (12, 1), (15, 3)],
  term ((-4 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-14359858700093 : Rat) / 19735178652) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((585 : Rat) / 14) [(0, 1), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((37130922508039 : Rat) / 118411071912) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((-505 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((4706213285 : Rat) / 187359291) [(0, 1), (1, 1), (13, 1), (14, 3)],
  term ((-10 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 3), (16, 1)],
  term ((14359858700093 : Rat) / 39470357304) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-585 : Rat) / 28) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((2021028534215771 : Rat) / 2175803446383) [(0, 1), (1, 1), (14, 1), (15, 1)],
  term ((-242 : Rat) / 7) [(0, 1), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (14, 1), (15, 3)],
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (14, 1), (15, 3), (16, 1)],
  term ((321834216522949 : Rat) / 4351606892766) [(0, 1), (1, 1), (14, 2), (15, 1)],
  term (15 : Rat) [(0, 1), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-50436208360 : Rat) / 187359291) [(0, 1), (1, 1), (14, 3), (15, 1)],
  term ((8 : Rat) / 7) [(0, 1), (1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2021028534215771 : Rat) / 4351606892766) [(0, 1), (1, 1), (15, 3)],
  term ((121 : Rat) / 7) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-640 : Rat) / 63) [(0, 1), (2, 1), (4, 1)],
  term ((320 : Rat) / 63) [(0, 1), (2, 1), (4, 2)],
  term ((320 : Rat) / 63) [(0, 1), (2, 1), (5, 2)],
  term ((640 : Rat) / 63) [(0, 1), (2, 1), (14, 1)],
  term ((-320 : Rat) / 63) [(0, 1), (2, 1), (14, 2)],
  term ((-320 : Rat) / 63) [(0, 1), (2, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((17728513912819504 : Rat) / 6527410339149) [(0, 1), (3, 1), (4, 1), (7, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (4, 1), (7, 1), (14, 1)],
  term ((8121862279687 : Rat) / 6744934476) [(0, 1), (3, 1), (4, 1), (9, 1)],
  term ((-1068637148240579 : Rat) / 2175803446383) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((-333576329821813 : Rat) / 266424911802) [(0, 1), (3, 1), (4, 1), (13, 1)],
  term ((505 : Rat) / 21) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-1517549743504022 : Rat) / 6527410339149) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((-388 : Rat) / 21) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (4, 2), (6, 1), (15, 1)],
  term ((-8864256956409752 : Rat) / 6527410339149) [(0, 1), (3, 1), (4, 2), (7, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (4, 2), (7, 1), (14, 1)],
  term ((-8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (4, 2), (9, 1)],
  term ((1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (4, 2), (11, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (4, 2), (13, 1)],
  term ((-505 : Rat) / 42) [(0, 1), (3, 1), (4, 2), (13, 1), (16, 1)],
  term ((758774871752011 : Rat) / 6527410339149) [(0, 1), (3, 1), (4, 2), (15, 1)],
  term ((194 : Rat) / 21) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (5, 2), (6, 1), (15, 1)],
  term ((-8864256956409752 : Rat) / 6527410339149) [(0, 1), (3, 1), (5, 2), (7, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (5, 2), (7, 1), (14, 1)],
  term ((-8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (5, 2), (9, 1)],
  term ((1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (5, 2), (13, 1)],
  term ((-505 : Rat) / 42) [(0, 1), (3, 1), (5, 2), (13, 1), (16, 1)],
  term ((758774871752011 : Rat) / 6527410339149) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((194 : Rat) / 21) [(0, 1), (3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-33944746640006525 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (15, 3)],
  term ((-17728513912819504 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((8648216787033683 : Rat) / 2797461573921) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (14, 3)],
  term ((8864256956409752 : Rat) / 6527410339149) [(0, 1), (3, 1), (7, 1), (15, 2)],
  term ((-8121862279687 : Rat) / 6744934476) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((8121862279687 : Rat) / 13489868952) [(0, 1), (3, 1), (9, 1), (15, 2)],
  term ((1068637148240579 : Rat) / 2175803446383) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((-1068637148240579 : Rat) / 4351606892766) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((333576329821813 : Rat) / 266424911802) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-505 : Rat) / 21) [(0, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((505 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-333576329821813 : Rat) / 532849823604) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((505 : Rat) / 42) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1517549743504022 : Rat) / 6527410339149) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((388 : Rat) / 21) [(0, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-758774871752011 : Rat) / 6527410339149) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-194 : Rat) / 21) [(0, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-758774871752011 : Rat) / 6527410339149) [(0, 1), (3, 1), (15, 3)],
  term ((-194 : Rat) / 21) [(0, 1), (3, 1), (15, 3), (16, 1)],
  term ((-1107240197953805 : Rat) / 6527410339149) [(0, 1), (3, 2), (4, 1)],
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2), (4, 2)],
  term ((1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2), (5, 2)],
  term ((1107240197953805 : Rat) / 6527410339149) [(0, 1), (3, 2), (14, 1)],
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2), (14, 2)],
  term ((-1107240197953805 : Rat) / 13054820678298) [(0, 1), (3, 2), (15, 2)],
  term ((-5229503585140 : Rat) / 44404151967) [(0, 1), (4, 1)],
  term ((15321997828090 : Rat) / 241755938487) [(0, 1), (4, 1), (6, 1)],
  term ((8948046731604560 : Rat) / 6527410339149) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-13576260831250 : Rat) / 5058700857) [(0, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((8747400384306716 : Rat) / 6527410339149) [(0, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((1121527532107244 : Rat) / 399637367703) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((680 : Rat) / 63) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 26861770943) [(0, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-4282250622413135 : Rat) / 1864974382614) [(0, 1), (4, 1), (6, 1), (15, 2)],
  term ((-128 : Rat) / 9) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-6788130415625 : Rat) / 1686233619) [(0, 1), (4, 1), (7, 1), (9, 1)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (4, 1), (7, 1), (9, 1), (14, 1)],
  term ((24951705893235785 : Rat) / 4351606892766) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((560763766053622 : Rat) / 133212455901) [(0, 1), (4, 1), (7, 1), (13, 1)],
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-680 : Rat) / 63) [(0, 1), (4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((340 : Rat) / 21) [(0, 1), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((30720403451337119 : Rat) / 13054820678298) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((128 : Rat) / 9) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6128799131236 : Rat) / 26861770943) [(0, 1), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-13001373378107326 : Rat) / 2175803446383) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((-64 : Rat) / 3) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4958198497169924 : Rat) / 2175803446383) [(0, 1), (4, 1), (7, 2)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (4, 1), (7, 2), (14, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (4, 1), (9, 1), (10, 1), (13, 1)],
  term ((10861008665 : Rat) / 53531226) [(0, 1), (4, 1), (9, 1), (10, 1), (15, 1)],
  term ((2608814281333 : Rat) / 8993245968) [(0, 1), (4, 1), (9, 1), (11, 1)],
  term ((-108242905555 : Rat) / 374718582) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((115 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-183252917185 : Rat) / 749437164) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-509733045065 : Rat) / 749437164) [(0, 1), (4, 1), (9, 1), (13, 1)],
  term ((3649940619119 : Rat) / 2997748656) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-230 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((115 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-954789077801 : Rat) / 1498874328) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((184 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((50982596596607 : Rat) / 13489868952) [(0, 1), (4, 1), (9, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1027451419709 : Rat) / 2248311492) [(0, 1), (4, 1), (9, 2)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (4, 1), (9, 2), (12, 1)],
  term ((-249803199295 : Rat) / 374718582) [(0, 1), (4, 1), (9, 2), (14, 1)],
  term ((-76823005517426867 : Rat) / 34812855142128) [(0, 1), (4, 1), (10, 1)],
  term ((-3355349785 : Rat) / 26765613) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term (14 : Rat) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 53531226) [(0, 1), (4, 1), (10, 1), (13, 2)],
  term (-5 : Rat) [(0, 1), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-385961000 : Rat) / 3823659) [(0, 1), (4, 1), (10, 1), (15, 2)],
  term (-8 : Rat) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14679168932041 : Rat) / 50747602248) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((359424 : Rat) / 553) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((395 : Rat) / 28) [(0, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2661845944552840 : Rat) / 725267815461) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-83 : Rat) / 7) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (4, 1), (11, 2)],
  term ((1729028084357939 : Rat) / 1657755006768) [(0, 1), (4, 1), (12, 1)],
  term ((117655332125 : Rat) / 374718582) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-125 : Rat) / 7) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72504283220 : Rat) / 187359291) [(0, 1), (4, 1), (12, 1), (15, 2)],
  term ((100 : Rat) / 7) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((54867625049149 : Rat) / 59205535956) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1163 : Rat) / 14) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2386620085736393 : Rat) / 532849823604) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((1193 : Rat) / 42) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 13878466) [(0, 1), (4, 1), (13, 2)],
  term ((-831117266131 : Rat) / 1498874328) [(0, 1), (4, 1), (13, 2), (14, 1)],
  term ((2614751792570 : Rat) / 44404151967) [(0, 1), (4, 2)],
  term ((-7660998914045 : Rat) / 241755938487) [(0, 1), (4, 2), (6, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (4, 2), (6, 1), (7, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (4, 2), (6, 1), (9, 1), (15, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (4, 2), (6, 1), (14, 1), (15, 2)],
  term ((4282250622413135 : Rat) / 3729948765228) [(0, 1), (4, 2), (6, 1), (15, 2)],
  term ((64 : Rat) / 9) [(0, 1), (4, 2), (6, 1), (15, 2), (16, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (4, 2), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-24951705893235785 : Rat) / 8703213785532) [(0, 1), (4, 2), (7, 1), (11, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (4, 2), (7, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (4, 2), (7, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (4, 2), (7, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(0, 1), (4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-30720403451337119 : Rat) / 26109641356596) [(0, 1), (4, 2), (7, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (4, 2), (7, 1), (14, 2), (15, 1)],
  term ((6500686689053663 : Rat) / 2175803446383) [(0, 1), (4, 2), (7, 1), (15, 1)],
  term ((32 : Rat) / 3) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (4, 2), (7, 2)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (4, 2), (7, 2), (14, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 1), (4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2608814281333 : Rat) / 17986491936) [(0, 1), (4, 2), (9, 1), (11, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((183252917185 : Rat) / 1498874328) [(0, 1), (4, 2), (9, 1), (12, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((509733045065 : Rat) / 1498874328) [(0, 1), (4, 2), (9, 1), (13, 1)],
  term ((-3649940619119 : Rat) / 5995497312) [(0, 1), (4, 2), (9, 1), (13, 1), (14, 1)],
  term ((115 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (4, 2), (9, 1), (13, 1), (16, 1)],
  term ((954789077801 : Rat) / 2997748656) [(0, 1), (4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50982596596607 : Rat) / 26979737904) [(0, 1), (4, 2), (9, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1027451419709 : Rat) / 4496622984) [(0, 1), (4, 2), (9, 2)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (4, 2), (9, 2), (12, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (4, 2), (9, 2), (14, 1)],
  term ((76823005517426867 : Rat) / 69625710284256) [(0, 1), (4, 2), (10, 1)],
  term ((3355349785 : Rat) / 53531226) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1)],
  term (-7 : Rat) [(0, 1), (4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (4, 2), (10, 1), (13, 2)],
  term ((5 : Rat) / 2) [(0, 1), (4, 2), (10, 1), (13, 2), (16, 1)],
  term ((192980500 : Rat) / 3823659) [(0, 1), (4, 2), (10, 1), (15, 2)],
  term (4 : Rat) [(0, 1), (4, 2), (10, 1), (15, 2), (16, 1)],
  term ((14679168932041 : Rat) / 101495204496) [(0, 1), (4, 2), (11, 1), (13, 1)],
  term ((-179712 : Rat) / 553) [(0, 1), (4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-395 : Rat) / 56) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (4, 2), (11, 1), (14, 1), (15, 1)],
  term ((1330922972276420 : Rat) / 725267815461) [(0, 1), (4, 2), (11, 1), (15, 1)],
  term ((83 : Rat) / 14) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(0, 1), (4, 2), (11, 2)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 1), (4, 2), (12, 1)],
  term ((-117655332125 : Rat) / 749437164) [(0, 1), (4, 2), (12, 1), (13, 1), (15, 1)],
  term ((125 : Rat) / 14) [(0, 1), (4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((36252141610 : Rat) / 187359291) [(0, 1), (4, 2), (12, 1), (15, 2)],
  term ((-50 : Rat) / 7) [(0, 1), (4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-54867625049149 : Rat) / 118411071912) [(0, 1), (4, 2), (13, 1), (14, 1), (15, 1)],
  term ((1163 : Rat) / 28) [(0, 1), (4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2386620085736393 : Rat) / 1065699647208) [(0, 1), (4, 2), (13, 1), (15, 1)],
  term ((-1193 : Rat) / 84) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 27756932) [(0, 1), (4, 2), (13, 2)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (4, 2), (13, 2), (14, 1)],
  term ((2614751792570 : Rat) / 44404151967) [(0, 1), (5, 2)],
  term ((-7660998914045 : Rat) / 241755938487) [(0, 1), (5, 2), (6, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (5, 2), (6, 1), (7, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (5, 2), (6, 1), (14, 1), (15, 2)],
  term ((4282250622413135 : Rat) / 3729948765228) [(0, 1), (5, 2), (6, 1), (15, 2)],
  term ((64 : Rat) / 9) [(0, 1), (5, 2), (6, 1), (15, 2), (16, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (5, 2), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-24951705893235785 : Rat) / 8703213785532) [(0, 1), (5, 2), (7, 1), (11, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (5, 2), (7, 1), (13, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (5, 2), (7, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(0, 1), (5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-30720403451337119 : Rat) / 26109641356596) [(0, 1), (5, 2), (7, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (5, 2), (7, 1), (14, 2), (15, 1)],
  term ((6500686689053663 : Rat) / 2175803446383) [(0, 1), (5, 2), (7, 1), (15, 1)],
  term ((32 : Rat) / 3) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((2479099248584962 : Rat) / 2175803446383) [(0, 1), (5, 2), (7, 2)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (5, 2), (7, 2), (14, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 1), (5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2608814281333 : Rat) / 17986491936) [(0, 1), (5, 2), (9, 1), (11, 1)],
  term ((108242905555 : Rat) / 749437164) [(0, 1), (5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((183252917185 : Rat) / 1498874328) [(0, 1), (5, 2), (9, 1), (12, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((509733045065 : Rat) / 1498874328) [(0, 1), (5, 2), (9, 1), (13, 1)],
  term ((-3649940619119 : Rat) / 5995497312) [(0, 1), (5, 2), (9, 1), (13, 1), (14, 1)],
  term ((115 : Rat) / 7) [(0, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-115 : Rat) / 14) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((954789077801 : Rat) / 2997748656) [(0, 1), (5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50982596596607 : Rat) / 26979737904) [(0, 1), (5, 2), (9, 1), (15, 1)],
  term ((46 : Rat) / 7) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1027451419709 : Rat) / 4496622984) [(0, 1), (5, 2), (9, 2)],
  term ((-249803199295 : Rat) / 1498874328) [(0, 1), (5, 2), (9, 2), (12, 1)],
  term ((249803199295 : Rat) / 749437164) [(0, 1), (5, 2), (9, 2), (14, 1)],
  term ((76823005517426867 : Rat) / 69625710284256) [(0, 1), (5, 2), (10, 1)],
  term ((3355349785 : Rat) / 53531226) [(0, 1), (5, 2), (10, 1), (13, 1), (15, 1)],
  term (-7 : Rat) [(0, 1), (5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 1), (5, 2), (10, 1), (13, 2)],
  term ((5 : Rat) / 2) [(0, 1), (5, 2), (10, 1), (13, 2), (16, 1)],
  term ((192980500 : Rat) / 3823659) [(0, 1), (5, 2), (10, 1), (15, 2)],
  term (4 : Rat) [(0, 1), (5, 2), (10, 1), (15, 2), (16, 1)],
  term ((14679168932041 : Rat) / 101495204496) [(0, 1), (5, 2), (11, 1), (13, 1)],
  term ((-179712 : Rat) / 553) [(0, 1), (5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-395 : Rat) / 56) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (5, 2), (11, 1), (14, 1), (15, 1)],
  term ((1330922972276420 : Rat) / 725267815461) [(0, 1), (5, 2), (11, 1), (15, 1)],
  term ((83 : Rat) / 14) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-59904 : Rat) / 553) [(0, 1), (5, 2), (11, 2)],
  term ((-1729028084357939 : Rat) / 3315510013536) [(0, 1), (5, 2), (12, 1)],
  term ((-117655332125 : Rat) / 749437164) [(0, 1), (5, 2), (12, 1), (13, 1), (15, 1)],
  term ((125 : Rat) / 14) [(0, 1), (5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((36252141610 : Rat) / 187359291) [(0, 1), (5, 2), (12, 1), (15, 2)],
  term ((-50 : Rat) / 7) [(0, 1), (5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-54867625049149 : Rat) / 118411071912) [(0, 1), (5, 2), (13, 1), (14, 1), (15, 1)],
  term ((1163 : Rat) / 28) [(0, 1), (5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2386620085736393 : Rat) / 1065699647208) [(0, 1), (5, 2), (13, 1), (15, 1)],
  term ((-1193 : Rat) / 84) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 27756932) [(0, 1), (5, 2), (13, 2)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (5, 2), (13, 2), (14, 1)],
  term ((-8948046731604560 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (14, 2), (15, 1)],
  term ((4474023365802280 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (15, 3)],
  term ((13576260831250 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (6, 1), (9, 1), (15, 3)],
  term ((-8747400384306716 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((4373700192153358 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (15, 3)],
  term ((-1121527532107244 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-680 : Rat) / 63) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (13, 1), (15, 3)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-15321997828090 : Rat) / 241755938487) [(0, 1), (6, 1), (14, 1)],
  term ((4282250622413135 : Rat) / 1864974382614) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((128 : Rat) / 9) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 1), (15, 4)],
  term ((7660998914045 : Rat) / 241755938487) [(0, 1), (6, 1), (14, 2)],
  term ((-35932947112453337 : Rat) / 26109641356596) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 3), (15, 2)],
  term ((7660998914045 : Rat) / 241755938487) [(0, 1), (6, 1), (15, 2)],
  term ((-4282250622413135 : Rat) / 3729948765228) [(0, 1), (6, 1), (15, 4)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term ((6788130415625 : Rat) / 1686233619) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-6788130415625 : Rat) / 1445343102) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (7, 1), (9, 1), (14, 3)],
  term ((-6788130415625 : Rat) / 3372467238) [(0, 1), (7, 1), (9, 1), (15, 2)],
  term ((-24951705893235785 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((198634211965523 : Rat) / 47214541332) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-4373700192153358 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (14, 3)],
  term ((24951705893235785 : Rat) / 8703213785532) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((-560763766053622 : Rat) / 133212455901) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-340 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((280381883026811 : Rat) / 57091052529) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((170 : Rat) / 9) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(0, 1), (7, 1), (13, 1), (14, 3)],
  term ((-340 : Rat) / 63) [(0, 1), (7, 1), (13, 1), (14, 3), (16, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((170 : Rat) / 21) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((13001373378107326 : Rat) / 2175803446383) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 3) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((30720403451337119 : Rat) / 26109641356596) [(0, 1), (7, 1), (14, 1), (15, 3)],
  term ((64 : Rat) / 9) [(0, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-69724523585659097 : Rat) / 13054820678298) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-224 : Rat) / 9) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (14, 2), (15, 3)],
  term ((36677596206898511 : Rat) / 26109641356596) [(0, 1), (7, 1), (14, 3), (15, 1)],
  term ((64 : Rat) / 9) [(0, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (14, 4), (15, 1)],
  term ((-6500686689053663 : Rat) / 2175803446383) [(0, 1), (7, 1), (15, 3)],
  term ((-32 : Rat) / 3) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((4958198497169924 : Rat) / 2175803446383) [(0, 1), (7, 2), (14, 1)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 1), (15, 2)],
  term ((1510748985849674 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 2)],
  term ((-4474023365802280 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 3)],
  term ((-2479099248584962 : Rat) / 2175803446383) [(0, 1), (7, 2), (15, 2)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-10861008665 : Rat) / 214124904) [(0, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-10861008665 : Rat) / 53531226) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((10861008665 : Rat) / 107062452) [(0, 1), (9, 1), (10, 1), (15, 3)],
  term ((-2608814281333 : Rat) / 8993245968) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((2608814281333 : Rat) / 17986491936) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((2608814281333 : Rat) / 17986491936) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((108242905555 : Rat) / 374718582) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-108242905555 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((183252917185 : Rat) / 749437164) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-183252917185 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-183252917185 : Rat) / 1498874328) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((509733045065 : Rat) / 749437164) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((3649940619119 : Rat) / 5995497312) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1556468903083 : Rat) / 999249552) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((575 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((3649940619119 : Rat) / 5995497312) [(0, 1), (9, 1), (13, 1), (14, 3)],
  term ((-115 : Rat) / 7) [(0, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-509733045065 : Rat) / 1498874328) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((115 : Rat) / 14) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50982596596607 : Rat) / 13489868952) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-954789077801 : Rat) / 2997748656) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((9738399999575 : Rat) / 3854248272) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-230 : Rat) / 7) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-954789077801 : Rat) / 2997748656) [(0, 1), (9, 1), (14, 3), (15, 1)],
  term ((92 : Rat) / 7) [(0, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((50982596596607 : Rat) / 26979737904) [(0, 1), (9, 1), (15, 3)],
  term ((-46 : Rat) / 7) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (12, 1), (14, 1)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 1), (14, 2)],
  term ((249803199295 : Rat) / 1498874328) [(0, 1), (9, 2), (12, 1), (15, 2)],
  term ((-1027451419709 : Rat) / 2248311492) [(0, 1), (9, 2), (14, 1)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (14, 1), (15, 2)],
  term ((4025089811249 : Rat) / 4496622984) [(0, 1), (9, 2), (14, 2)],
  term ((-249803199295 : Rat) / 749437164) [(0, 1), (9, 2), (14, 3)],
  term ((1027451419709 : Rat) / 4496622984) [(0, 1), (9, 2), (15, 2)],
  term ((3355349785 : Rat) / 26765613) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (-14 : Rat) [(0, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3355349785 : Rat) / 53531226) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term (7 : Rat) [(0, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3355349785 : Rat) / 53531226) [(0, 1), (10, 1), (13, 1), (15, 3)],
  term (7 : Rat) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4706213285 : Rat) / 53531226) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term (5 : Rat) [(0, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (13, 2), (14, 2)],
  term ((-5 : Rat) / 2) [(0, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((4706213285 : Rat) / 107062452) [(0, 1), (10, 1), (13, 2), (15, 2)],
  term ((-5 : Rat) / 2) [(0, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((76823005517426867 : Rat) / 34812855142128) [(0, 1), (10, 1), (14, 1)],
  term ((385961000 : Rat) / 3823659) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term (8 : Rat) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-76823005517426867 : Rat) / 69625710284256) [(0, 1), (10, 1), (14, 2)],
  term ((-192980500 : Rat) / 3823659) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term (-4 : Rat) [(0, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-76823005517426867 : Rat) / 69625710284256) [(0, 1), (10, 1), (15, 2)],
  term ((-192980500 : Rat) / 3823659) [(0, 1), (10, 1), (15, 4)],
  term (-4 : Rat) [(0, 1), (10, 1), (15, 4), (16, 1)],
  term ((14679168932041 : Rat) / 50747602248) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((179712 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-395 : Rat) / 28) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-80646279928009 : Rat) / 101495204496) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((395 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((179712 : Rat) / 553) [(0, 1), (11, 1), (13, 1), (14, 3)],
  term ((-14679168932041 : Rat) / 101495204496) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((395 : Rat) / 56) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2661845944552840 : Rat) / 725267815461) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((83 : Rat) / 7) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((-1016662985170628 : Rat) / 725267815461) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-83 : Rat) / 14) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((-1330922972276420 : Rat) / 725267815461) [(0, 1), (11, 1), (15, 3)],
  term ((-83 : Rat) / 14) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (11, 2), (14, 1)],
  term ((59904 : Rat) / 553) [(0, 1), (11, 2), (14, 2)],
  term ((59904 : Rat) / 553) [(0, 1), (11, 2), (15, 2)],
  term ((-117655332125 : Rat) / 374718582) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((125 : Rat) / 7) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((117655332125 : Rat) / 749437164) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-125 : Rat) / 14) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((117655332125 : Rat) / 749437164) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((-125 : Rat) / 14) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1729028084357939 : Rat) / 1657755006768) [(0, 1), (12, 1), (14, 1)],
  term ((72504283220 : Rat) / 187359291) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-100 : Rat) / 7) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 1), (14, 2)],
  term ((-36252141610 : Rat) / 187359291) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((50 : Rat) / 7) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1729028084357939 : Rat) / 3315510013536) [(0, 1), (12, 1), (15, 2)],
  term ((-36252141610 : Rat) / 187359291) [(0, 1), (12, 1), (15, 4)],
  term ((50 : Rat) / 7) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((2386620085736393 : Rat) / 532849823604) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1193 : Rat) / 42) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((54867625049149 : Rat) / 118411071912) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1163 : Rat) / 28) [(0, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3374237336621075 : Rat) / 1065699647208) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((8171 : Rat) / 84) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((54867625049149 : Rat) / 118411071912) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((-1163 : Rat) / 28) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-2386620085736393 : Rat) / 1065699647208) [(0, 1), (13, 1), (15, 3)],
  term ((1193 : Rat) / 84) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4706213285 : Rat) / 13878466) [(0, 1), (13, 2), (14, 1)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((1085252783521 : Rat) / 1498874328) [(0, 1), (13, 2), (14, 2)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 3)],
  term ((4706213285 : Rat) / 27756932) [(0, 1), (13, 2), (15, 2)],
  term ((5229503585140 : Rat) / 44404151967) [(0, 1), (14, 1)],
  term ((-2614751792570 : Rat) / 44404151967) [(0, 1), (14, 2)],
  term ((-2614751792570 : Rat) / 44404151967) [(0, 1), (15, 2)],
  term ((78606252562729595 : Rat) / 104438565426384) [(4, 1)],
  term ((-78606252562729595 : Rat) / 208877130852768) [(4, 2)],
  term ((-78606252562729595 : Rat) / 208877130852768) [(5, 2)],
  term ((-78606252562729595 : Rat) / 104438565426384) [(14, 1)],
  term ((78606252562729595 : Rat) / 208877130852768) [(14, 2)],
  term ((78606252562729595 : Rat) / 208877130852768) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 0 through 99. -/
theorem rs_R009_ueqv_R009YNNNN_block_05_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_05_0000_0099
      rs_R009_ueqv_R009YNNNN_block_05_0000_0099 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
