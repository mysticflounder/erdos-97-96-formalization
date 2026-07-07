/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 12:0-72

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_12_0000_0072 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0000 : Poly :=
[
  term ((927 : Rat) / 1198) []
]

/-- Partial product 0 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0000 : Poly :=
[
  term ((-927 : Rat) / 599) [(0, 1), (2, 1)],
  term ((927 : Rat) / 1198) [(0, 2)],
  term ((-927 : Rat) / 599) [(1, 1), (3, 1)],
  term ((927 : Rat) / 1198) [(1, 2)],
  term ((927 : Rat) / 599) [(2, 1), (12, 1)],
  term ((927 : Rat) / 599) [(3, 1), (13, 1)],
  term ((-927 : Rat) / 1198) [(12, 2)],
  term ((-927 : Rat) / 1198) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0000_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0000
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0001 : Poly :=
[
  term ((870 : Rat) / 599) [(0, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0001 : Poly :=
[
  term ((-1740 : Rat) / 599) [(0, 1), (1, 1), (3, 1)],
  term ((870 : Rat) / 599) [(0, 1), (1, 2)],
  term ((1740 : Rat) / 599) [(0, 1), (2, 1), (12, 1)],
  term ((1740 : Rat) / 599) [(0, 1), (3, 1), (13, 1)],
  term ((-870 : Rat) / 599) [(0, 1), (12, 2)],
  term ((-870 : Rat) / 599) [(0, 1), (13, 2)],
  term ((-1740 : Rat) / 599) [(0, 2), (2, 1)],
  term ((870 : Rat) / 599) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0001_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0001
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0002 : Poly :=
[
  term ((-17856 : Rat) / 599) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0002 : Poly :=
[
  term ((35712 : Rat) / 599) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-17856 : Rat) / 599) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-35712 : Rat) / 599) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-35712 : Rat) / 599) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((17856 : Rat) / 599) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((17856 : Rat) / 599) [(0, 1), (13, 3), (15, 1)],
  term ((35712 : Rat) / 599) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-17856 : Rat) / 599) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0002_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0002
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0003 : Poly :=
[
  term (8 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0003 : Poly :=
[
  term (-16 : Rat) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0003_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0003
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0004 : Poly :=
[
  term ((35712 : Rat) / 599) [(0, 1), (15, 2)]
]

/-- Partial product 4 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0004 : Poly :=
[
  term ((-71424 : Rat) / 599) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term ((35712 : Rat) / 599) [(0, 1), (1, 2), (15, 2)],
  term ((71424 : Rat) / 599) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((71424 : Rat) / 599) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-35712 : Rat) / 599) [(0, 1), (12, 2), (15, 2)],
  term ((-35712 : Rat) / 599) [(0, 1), (13, 2), (15, 2)],
  term ((-71424 : Rat) / 599) [(0, 2), (2, 1), (15, 2)],
  term ((35712 : Rat) / 599) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0004_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0004
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0005 : Poly :=
[
  term (-16 : Rat) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0005 : Poly :=
[
  term (32 : Rat) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term (-32 : Rat) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term (-32 : Rat) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term (32 : Rat) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0005_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0005
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0006 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 6 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0006 : Poly :=
[
  term ((642816 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-321408 : Rat) / 2995) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((321408 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((642816 : Rat) / 2995) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-321408 : Rat) / 2995) [(1, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0006_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0006
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0007 : Poly :=
[
  term ((244224 : Rat) / 2995) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 7 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0007 : Poly :=
[
  term ((-488448 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((244224 : Rat) / 2995) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((488448 : Rat) / 2995) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((488448 : Rat) / 2995) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-244224 : Rat) / 2995) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-244224 : Rat) / 2995) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-488448 : Rat) / 2995) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((244224 : Rat) / 2995) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0007_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0007
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0008 : Poly :=
[
  term ((-72 : Rat) / 5) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0008 : Poly :=
[
  term ((144 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 5) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0008_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0008
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0009 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0009 : Poly :=
[
  term ((642816 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-321408 : Rat) / 2995) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((642816 : Rat) / 2995) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-321408 : Rat) / 2995) [(1, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0009_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0009
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0010 : Poly :=
[
  term ((-809856 : Rat) / 2995) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 10 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0010 : Poly :=
[
  term ((1619712 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-809856 : Rat) / 2995) [(0, 2), (1, 1), (11, 1), (15, 2)],
  term ((-1619712 : Rat) / 2995) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1619712 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((809856 : Rat) / 2995) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((809856 : Rat) / 2995) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((1619712 : Rat) / 2995) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((-809856 : Rat) / 2995) [(1, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0010_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0010
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0011 : Poly :=
[
  term ((264 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0011 : Poly :=
[
  term ((-528 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((264 : Rat) / 5) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((528 : Rat) / 5) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((528 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-264 : Rat) / 5) [(1, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-264 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-528 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((264 : Rat) / 5) [(1, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0011_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0011
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0012 : Poly :=
[
  term ((642816 : Rat) / 2995) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 12 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0012 : Poly :=
[
  term ((-1285632 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((642816 : Rat) / 2995) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((1285632 : Rat) / 2995) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((1285632 : Rat) / 2995) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term ((642816 : Rat) / 2995) [(1, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0012_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0012
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0013 : Poly :=
[
  term ((65664 : Rat) / 2995) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 13 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0013 : Poly :=
[
  term ((-131328 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2)],
  term ((65664 : Rat) / 2995) [(0, 2), (1, 1), (13, 1), (15, 2)],
  term ((131328 : Rat) / 2995) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((131328 : Rat) / 2995) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((-65664 : Rat) / 2995) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((-65664 : Rat) / 2995) [(1, 1), (13, 3), (15, 2)],
  term ((-131328 : Rat) / 2995) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((65664 : Rat) / 2995) [(1, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0013_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0013
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0014 : Poly :=
[
  term ((8 : Rat) / 5) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0014 : Poly :=
[
  term ((-16 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 5) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 5) [(1, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0014_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0014
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0015 : Poly :=
[
  term ((-25044 : Rat) / 599) [(1, 1), (15, 1)]
]

/-- Partial product 15 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0015 : Poly :=
[
  term ((50088 : Rat) / 599) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term ((-25044 : Rat) / 599) [(0, 2), (1, 1), (15, 1)],
  term ((-50088 : Rat) / 599) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-50088 : Rat) / 599) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((25044 : Rat) / 599) [(1, 1), (12, 2), (15, 1)],
  term ((25044 : Rat) / 599) [(1, 1), (13, 2), (15, 1)],
  term ((50088 : Rat) / 599) [(1, 2), (3, 1), (15, 1)],
  term ((-25044 : Rat) / 599) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0015_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0015
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0016 : Poly :=
[
  term (8 : Rat) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0016 : Poly :=
[
  term (-16 : Rat) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0016_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0016
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0017 : Poly :=
[
  term ((65664 : Rat) / 2995) [(1, 1), (15, 3)]
]

/-- Partial product 17 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0017 : Poly :=
[
  term ((-131328 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (15, 3)],
  term ((65664 : Rat) / 2995) [(0, 2), (1, 1), (15, 3)],
  term ((131328 : Rat) / 2995) [(1, 1), (2, 1), (12, 1), (15, 3)],
  term ((131328 : Rat) / 2995) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-65664 : Rat) / 2995) [(1, 1), (12, 2), (15, 3)],
  term ((-65664 : Rat) / 2995) [(1, 1), (13, 2), (15, 3)],
  term ((-131328 : Rat) / 2995) [(1, 2), (3, 1), (15, 3)],
  term ((65664 : Rat) / 2995) [(1, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0017_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0017
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0018 : Poly :=
[
  term ((8 : Rat) / 5) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 18 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0018 : Poly :=
[
  term ((-16 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (15, 3), (16, 1)],
  term ((8 : Rat) / 5) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 5) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((8 : Rat) / 5) [(1, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0018_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0018
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0019 : Poly :=
[
  term (-3 : Rat) [(2, 1)]
]

/-- Partial product 19 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0019 : Poly :=
[
  term (6 : Rat) [(0, 1), (2, 2)],
  term (-3 : Rat) [(0, 2), (2, 1)],
  term (6 : Rat) [(1, 1), (2, 1), (3, 1)],
  term (-3 : Rat) [(1, 2), (2, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (13, 1)],
  term (3 : Rat) [(2, 1), (12, 2)],
  term (3 : Rat) [(2, 1), (13, 2)],
  term (-6 : Rat) [(2, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0019_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0019
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0020 : Poly :=
[
  term (6 : Rat) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0020 : Poly :=
[
  term (-12 : Rat) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0020_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0020
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0021 : Poly :=
[
  term (-12 : Rat) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 21 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0021 : Poly :=
[
  term (24 : Rat) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term (-12 : Rat) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term (24 : Rat) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term (-12 : Rat) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term (-24 : Rat) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term (12 : Rat) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term (12 : Rat) [(2, 1), (13, 3), (15, 1)],
  term (-24 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0021_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0021
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0022 : Poly :=
[
  term (4 : Rat) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0022 : Poly :=
[
  term (-8 : Rat) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term (8 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0022_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0022
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0023 : Poly :=
[
  term (24 : Rat) [(2, 1), (15, 2)]
]

/-- Partial product 23 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0023 : Poly :=
[
  term (-48 : Rat) [(0, 1), (2, 2), (15, 2)],
  term (24 : Rat) [(0, 2), (2, 1), (15, 2)],
  term (-48 : Rat) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term (24 : Rat) [(1, 2), (2, 1), (15, 2)],
  term (48 : Rat) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term (-24 : Rat) [(2, 1), (12, 2), (15, 2)],
  term (-24 : Rat) [(2, 1), (13, 2), (15, 2)],
  term (48 : Rat) [(2, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0023_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0023
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0024 : Poly :=
[
  term (-8 : Rat) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0024 : Poly :=
[
  term (16 : Rat) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(2, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0024_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0024
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0025 : Poly :=
[
  term (-12 : Rat) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0025 : Poly :=
[
  term (24 : Rat) [(0, 1), (2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0025_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0025
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0026 : Poly :=
[
  term (24 : Rat) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0026 : Poly :=
[
  term (-48 : Rat) [(0, 1), (2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term (-48 : Rat) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term (48 : Rat) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (48 : Rat) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0026_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0026
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0027 : Poly :=
[
  term (6 : Rat) [(3, 1), (13, 1)]
]

/-- Partial product 27 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0027 : Poly :=
[
  term (-12 : Rat) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term (6 : Rat) [(0, 2), (3, 1), (13, 1)],
  term (-12 : Rat) [(1, 1), (3, 2), (13, 1)],
  term (6 : Rat) [(1, 2), (3, 1), (13, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term (-6 : Rat) [(3, 1), (12, 2), (13, 1)],
  term (-6 : Rat) [(3, 1), (13, 3)],
  term (12 : Rat) [(3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0027_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0027
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0028 : Poly :=
[
  term (-18 : Rat) [(3, 1), (15, 1)]
]

/-- Partial product 28 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0028 : Poly :=
[
  term (36 : Rat) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term (-18 : Rat) [(0, 2), (3, 1), (15, 1)],
  term (36 : Rat) [(1, 1), (3, 2), (15, 1)],
  term (-18 : Rat) [(1, 2), (3, 1), (15, 1)],
  term (-36 : Rat) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term (18 : Rat) [(3, 1), (12, 2), (15, 1)],
  term (18 : Rat) [(3, 1), (13, 2), (15, 1)],
  term (-36 : Rat) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0028_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0028
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0029 : Poly :=
[
  term (2 : Rat) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0029 : Poly :=
[
  term (-4 : Rat) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0029_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0029
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0030 : Poly :=
[
  term ((5142528 : Rat) / 2995) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 30 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0030 : Poly :=
[
  term ((-10285056 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1)],
  term ((5142528 : Rat) / 2995) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term ((-10285056 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term ((5142528 : Rat) / 2995) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((10285056 : Rat) / 2995) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((10285056 : Rat) / 2995) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-5142528 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((-5142528 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0030_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0030
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0031 : Poly :=
[
  term ((-5514624 : Rat) / 2995) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 31 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0031 : Poly :=
[
  term ((11029248 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-5514624 : Rat) / 2995) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((11029248 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((-5514624 : Rat) / 2995) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-11029248 : Rat) / 2995) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-11029248 : Rat) / 2995) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((5514624 : Rat) / 2995) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((5514624 : Rat) / 2995) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0031_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0031
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0032 : Poly :=
[
  term ((1272 : Rat) / 5) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0032 : Poly :=
[
  term ((-2544 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1272 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2544 : Rat) / 5) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1272 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((2544 : Rat) / 5) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2544 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0032_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0032
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0033 : Poly :=
[
  term ((-857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 33 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0033 : Poly :=
[
  term ((1714176 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1)],
  term ((-857088 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((1714176 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term ((-857088 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-1714176 : Rat) / 2995) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 2)],
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0033_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0033
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0034 : Poly :=
[
  term ((-857088 : Rat) / 2995) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 34 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0034 : Poly :=
[
  term ((1714176 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-857088 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((1714176 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-857088 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1714176 : Rat) / 2995) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0034_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0034
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0035 : Poly :=
[
  term ((919104 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 35 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0035 : Poly :=
[
  term ((-1838208 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1)],
  term ((919104 : Rat) / 2995) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-1838208 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((919104 : Rat) / 2995) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((1838208 : Rat) / 2995) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((1838208 : Rat) / 2995) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((-919104 : Rat) / 2995) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-919104 : Rat) / 2995) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0035_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0035
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0036 : Poly :=
[
  term ((-212 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0036 : Poly :=
[
  term ((424 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-212 : Rat) / 5) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((424 : Rat) / 5) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-212 : Rat) / 5) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-424 : Rat) / 5) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-424 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((212 : Rat) / 5) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((212 : Rat) / 5) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0036_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0036
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0037 : Poly :=
[
  term ((919104 : Rat) / 2995) [(8, 1), (15, 2)]
]

/-- Partial product 37 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0037 : Poly :=
[
  term ((-1838208 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (15, 2)],
  term ((919104 : Rat) / 2995) [(0, 2), (8, 1), (15, 2)],
  term ((-1838208 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((919104 : Rat) / 2995) [(1, 2), (8, 1), (15, 2)],
  term ((1838208 : Rat) / 2995) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((1838208 : Rat) / 2995) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-919104 : Rat) / 2995) [(8, 1), (12, 2), (15, 2)],
  term ((-919104 : Rat) / 2995) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0037_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0037
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0038 : Poly :=
[
  term ((-212 : Rat) / 5) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 38 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0038 : Poly :=
[
  term ((424 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-212 : Rat) / 5) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((424 : Rat) / 5) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-212 : Rat) / 5) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-424 : Rat) / 5) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-424 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((212 : Rat) / 5) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((212 : Rat) / 5) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0038_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0038
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0039 : Poly :=
[
  term ((-1285632 : Rat) / 2995) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 39 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0039 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1285632 : Rat) / 2995) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((1285632 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((1285632 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0039_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0039
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0040 : Poly :=
[
  term ((1378656 : Rat) / 2995) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 40 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0040 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((1378656 : Rat) / 2995) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((1378656 : Rat) / 2995) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1378656 : Rat) / 2995) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1378656 : Rat) / 2995) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0040_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0040
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0041 : Poly :=
[
  term ((-258 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0041 : Poly :=
[
  term ((516 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-258 : Rat) / 5) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((516 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-258 : Rat) / 5) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-516 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-516 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((258 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((258 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0041_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0041
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0042 : Poly :=
[
  term ((-1285632 : Rat) / 2995) [(9, 1), (11, 1)]
]

/-- Partial product 42 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0042 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((-1285632 : Rat) / 2995) [(0, 2), (9, 1), (11, 1)],
  term ((2571264 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 2), (9, 1), (11, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((1285632 : Rat) / 2995) [(9, 1), (11, 1), (12, 2)],
  term ((1285632 : Rat) / 2995) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0042_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0042
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0043 : Poly :=
[
  term ((-3055104 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 43 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0043 : Poly :=
[
  term ((6110208 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3055104 : Rat) / 2995) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6110208 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3055104 : Rat) / 2995) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6110208 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6110208 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((3055104 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((3055104 : Rat) / 2995) [(9, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0043_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0043
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0044 : Poly :=
[
  term ((948 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0044 : Poly :=
[
  term ((-1896 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0044_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0044
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0045 : Poly :=
[
  term ((-297792 : Rat) / 2995) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 45 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0045 : Poly :=
[
  term ((595584 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-297792 : Rat) / 2995) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((595584 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((-297792 : Rat) / 2995) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-595584 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-595584 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((297792 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((297792 : Rat) / 2995) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0045_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0045
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0046 : Poly :=
[
  term ((72 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 46 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0046 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0046_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0046
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0047 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 47 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0047 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 1)],
  term ((2892672 : Rat) / 2995) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((-5785344 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1)],
  term ((2892672 : Rat) / 2995) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((5785344 : Rat) / 2995) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((5785344 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 2)],
  term ((-2892672 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-2892672 : Rat) / 2995) [(9, 1), (11, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0047_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0047
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0048 : Poly :=
[
  term ((321408 : Rat) / 2995) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 48 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0048 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term ((321408 : Rat) / 2995) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((321408 : Rat) / 2995) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((642816 : Rat) / 2995) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((642816 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0048_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0048
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0049 : Poly :=
[
  term (-12 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 49 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0049 : Poly :=
[
  term (24 : Rat) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term (-12 : Rat) [(0, 2), (9, 1), (13, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term (-12 : Rat) [(1, 2), (9, 1), (13, 1)],
  term (-24 : Rat) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term (-24 : Rat) [(3, 1), (9, 1), (13, 2)],
  term (12 : Rat) [(9, 1), (12, 2), (13, 1)],
  term (12 : Rat) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0049_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0049
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0050 : Poly :=
[
  term ((65664 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 50 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0050 : Poly :=
[
  term ((-131328 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2)],
  term ((65664 : Rat) / 2995) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-131328 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((65664 : Rat) / 2995) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((131328 : Rat) / 2995) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((131328 : Rat) / 2995) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((-65664 : Rat) / 2995) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-65664 : Rat) / 2995) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0050_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0050
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0051 : Poly :=
[
  term ((8 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 51 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0051 : Poly :=
[
  term ((-16 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0051_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0051
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0052 : Poly :=
[
  term ((1342716 : Rat) / 2995) [(9, 1), (15, 1)]
]

/-- Partial product 52 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0052 : Poly :=
[
  term ((-2685432 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((1342716 : Rat) / 2995) [(0, 2), (9, 1), (15, 1)],
  term ((-2685432 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((1342716 : Rat) / 2995) [(1, 2), (9, 1), (15, 1)],
  term ((2685432 : Rat) / 2995) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((2685432 : Rat) / 2995) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1342716 : Rat) / 2995) [(9, 1), (12, 2), (15, 1)],
  term ((-1342716 : Rat) / 2995) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0052_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0052
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0053 : Poly :=
[
  term ((-318 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0053 : Poly :=
[
  term ((636 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-318 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-318 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((318 : Rat) / 5) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((318 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0053_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0053
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0054 : Poly :=
[
  term ((65664 : Rat) / 2995) [(9, 1), (15, 3)]
]

/-- Partial product 54 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0054 : Poly :=
[
  term ((-131328 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (15, 3)],
  term ((65664 : Rat) / 2995) [(0, 2), (9, 1), (15, 3)],
  term ((-131328 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((65664 : Rat) / 2995) [(1, 2), (9, 1), (15, 3)],
  term ((131328 : Rat) / 2995) [(2, 1), (9, 1), (12, 1), (15, 3)],
  term ((131328 : Rat) / 2995) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-65664 : Rat) / 2995) [(9, 1), (12, 2), (15, 3)],
  term ((-65664 : Rat) / 2995) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0054_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0054
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0055 : Poly :=
[
  term ((8 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 55 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0055 : Poly :=
[
  term ((-16 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((8 : Rat) / 5) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((8 : Rat) / 5) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-8 : Rat) / 5) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-8 : Rat) / 5) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0055_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0055
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0056 : Poly :=
[
  term ((321408 : Rat) / 599) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 56 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0056 : Poly :=
[
  term ((-642816 : Rat) / 599) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term ((321408 : Rat) / 599) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-642816 : Rat) / 599) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((321408 : Rat) / 599) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((642816 : Rat) / 599) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((642816 : Rat) / 599) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-321408 : Rat) / 599) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-321408 : Rat) / 599) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0056_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0056
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0057 : Poly :=
[
  term (-8 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0057 : Poly :=
[
  term (16 : Rat) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0057_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0057
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0058 : Poly :=
[
  term ((-324576 : Rat) / 599) [(10, 1), (15, 2)]
]

/-- Partial product 58 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0058 : Poly :=
[
  term ((649152 : Rat) / 599) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term ((-324576 : Rat) / 599) [(0, 2), (10, 1), (15, 2)],
  term ((649152 : Rat) / 599) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-324576 : Rat) / 599) [(1, 2), (10, 1), (15, 2)],
  term ((-649152 : Rat) / 599) [(2, 1), (10, 1), (12, 1), (15, 2)],
  term ((-649152 : Rat) / 599) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((324576 : Rat) / 599) [(10, 1), (12, 2), (15, 2)],
  term ((324576 : Rat) / 599) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0058_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0058
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0059 : Poly :=
[
  term (82 : Rat) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 59 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0059 : Poly :=
[
  term (-164 : Rat) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term (82 : Rat) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term (-164 : Rat) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term (82 : Rat) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term (164 : Rat) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term (164 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term (-82 : Rat) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term (-82 : Rat) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0059_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0059
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0060 : Poly :=
[
  term ((325872 : Rat) / 2995) [(11, 1), (13, 1)]
]

/-- Partial product 60 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0060 : Poly :=
[
  term ((-651744 : Rat) / 2995) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((325872 : Rat) / 2995) [(0, 2), (11, 1), (13, 1)],
  term ((-651744 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((325872 : Rat) / 2995) [(1, 2), (11, 1), (13, 1)],
  term ((651744 : Rat) / 2995) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((651744 : Rat) / 2995) [(3, 1), (11, 1), (13, 2)],
  term ((-325872 : Rat) / 2995) [(11, 1), (12, 2), (13, 1)],
  term ((-325872 : Rat) / 2995) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0060_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0060
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0061 : Poly :=
[
  term ((2582688 : Rat) / 2995) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 61 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0061 : Poly :=
[
  term ((-5165376 : Rat) / 2995) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((2582688 : Rat) / 2995) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-5165376 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((2582688 : Rat) / 2995) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((5165376 : Rat) / 2995) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5165376 : Rat) / 2995) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-2582688 : Rat) / 2995) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-2582688 : Rat) / 2995) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0061_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0061
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0062 : Poly :=
[
  term ((-804 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 62 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0062 : Poly :=
[
  term ((1608 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-804 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1608 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-804 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1608 : Rat) / 5) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1608 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((804 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((804 : Rat) / 5) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0062_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0062
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0063 : Poly :=
[
  term ((-191952 : Rat) / 599) [(11, 1), (15, 1)]
]

/-- Partial product 63 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0063 : Poly :=
[
  term ((383904 : Rat) / 599) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-191952 : Rat) / 599) [(0, 2), (11, 1), (15, 1)],
  term ((383904 : Rat) / 599) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-191952 : Rat) / 599) [(1, 2), (11, 1), (15, 1)],
  term ((-383904 : Rat) / 599) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-383904 : Rat) / 599) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((191952 : Rat) / 599) [(11, 1), (12, 2), (15, 1)],
  term ((191952 : Rat) / 599) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0063_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0063
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0064 : Poly :=
[
  term (-7 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0064 : Poly :=
[
  term (14 : Rat) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term (7 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0064_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0064
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0065 : Poly :=
[
  term ((313824 : Rat) / 2995) [(11, 1), (15, 3)]
]

/-- Partial product 65 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0065 : Poly :=
[
  term ((-627648 : Rat) / 2995) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((313824 : Rat) / 2995) [(0, 2), (11, 1), (15, 3)],
  term ((-627648 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((313824 : Rat) / 2995) [(1, 2), (11, 1), (15, 3)],
  term ((627648 : Rat) / 2995) [(2, 1), (11, 1), (12, 1), (15, 3)],
  term ((627648 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-313824 : Rat) / 2995) [(11, 1), (12, 2), (15, 3)],
  term ((-313824 : Rat) / 2995) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0065_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0065
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0066 : Poly :=
[
  term ((-252 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 66 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0066 : Poly :=
[
  term ((504 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-252 : Rat) / 5) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((504 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-252 : Rat) / 5) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-504 : Rat) / 5) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-504 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((252 : Rat) / 5) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((252 : Rat) / 5) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0066_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0066
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0067 : Poly :=
[
  term ((-2517696 : Rat) / 2995) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 67 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0067 : Poly :=
[
  term ((5035392 : Rat) / 2995) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2517696 : Rat) / 2995) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((5035392 : Rat) / 2995) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2517696 : Rat) / 2995) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5035392 : Rat) / 2995) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-5035392 : Rat) / 2995) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((2517696 : Rat) / 2995) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((2517696 : Rat) / 2995) [(11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0067_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0067
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0068 : Poly :=
[
  term ((-589248 : Rat) / 2995) [(11, 2), (15, 2)]
]

/-- Partial product 68 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0068 : Poly :=
[
  term ((1178496 : Rat) / 2995) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((-589248 : Rat) / 2995) [(0, 2), (11, 2), (15, 2)],
  term ((1178496 : Rat) / 2995) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((-589248 : Rat) / 2995) [(1, 2), (11, 2), (15, 2)],
  term ((-1178496 : Rat) / 2995) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((-1178496 : Rat) / 2995) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((589248 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)],
  term ((589248 : Rat) / 2995) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0068_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0068
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0069 : Poly :=
[
  term ((-398496 : Rat) / 2995) [(13, 1), (15, 1)]
]

/-- Partial product 69 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0069 : Poly :=
[
  term ((796992 : Rat) / 2995) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-398496 : Rat) / 2995) [(0, 2), (13, 1), (15, 1)],
  term ((796992 : Rat) / 2995) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-398496 : Rat) / 2995) [(1, 2), (13, 1), (15, 1)],
  term ((-796992 : Rat) / 2995) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-796992 : Rat) / 2995) [(3, 1), (13, 2), (15, 1)],
  term ((398496 : Rat) / 2995) [(12, 2), (13, 1), (15, 1)],
  term ((398496 : Rat) / 2995) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0069_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0069
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0070 : Poly :=
[
  term ((88 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0070 : Poly :=
[
  term ((-176 : Rat) / 5) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((88 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 5) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((88 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 5) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 5) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-88 : Rat) / 5) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-88 : Rat) / 5) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0070_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0070
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0071 : Poly :=
[
  term ((197886 : Rat) / 599) [(15, 2)]
]

/-- Partial product 71 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0071 : Poly :=
[
  term ((-395772 : Rat) / 599) [(0, 1), (2, 1), (15, 2)],
  term ((197886 : Rat) / 599) [(0, 2), (15, 2)],
  term ((-395772 : Rat) / 599) [(1, 1), (3, 1), (15, 2)],
  term ((197886 : Rat) / 599) [(1, 2), (15, 2)],
  term ((395772 : Rat) / 599) [(2, 1), (12, 1), (15, 2)],
  term ((395772 : Rat) / 599) [(3, 1), (13, 1), (15, 2)],
  term ((-197886 : Rat) / 599) [(12, 2), (15, 2)],
  term ((-197886 : Rat) / 599) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0071_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0071
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010NYN_coefficient_12_0072 : Poly :=
[
  term (-46 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 72 for generator 12. -/
def rs_R010_ueqv_R010NYN_partial_12_0072 : Poly :=
[
  term (92 : Rat) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term (-46 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (92 : Rat) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term (-46 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (-92 : Rat) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term (-92 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term (46 : Rat) [(12, 2), (15, 2), (16, 1)],
  term (46 : Rat) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 12. -/
theorem rs_R010_ueqv_R010NYN_partial_12_0072_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_12_0072
        rs_R010_ueqv_R010NYN_generator_12_0000_0072 =
      rs_R010_ueqv_R010NYN_partial_12_0072 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_12_0000_0072 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_12_0000,
  rs_R010_ueqv_R010NYN_partial_12_0001,
  rs_R010_ueqv_R010NYN_partial_12_0002,
  rs_R010_ueqv_R010NYN_partial_12_0003,
  rs_R010_ueqv_R010NYN_partial_12_0004,
  rs_R010_ueqv_R010NYN_partial_12_0005,
  rs_R010_ueqv_R010NYN_partial_12_0006,
  rs_R010_ueqv_R010NYN_partial_12_0007,
  rs_R010_ueqv_R010NYN_partial_12_0008,
  rs_R010_ueqv_R010NYN_partial_12_0009,
  rs_R010_ueqv_R010NYN_partial_12_0010,
  rs_R010_ueqv_R010NYN_partial_12_0011,
  rs_R010_ueqv_R010NYN_partial_12_0012,
  rs_R010_ueqv_R010NYN_partial_12_0013,
  rs_R010_ueqv_R010NYN_partial_12_0014,
  rs_R010_ueqv_R010NYN_partial_12_0015,
  rs_R010_ueqv_R010NYN_partial_12_0016,
  rs_R010_ueqv_R010NYN_partial_12_0017,
  rs_R010_ueqv_R010NYN_partial_12_0018,
  rs_R010_ueqv_R010NYN_partial_12_0019,
  rs_R010_ueqv_R010NYN_partial_12_0020,
  rs_R010_ueqv_R010NYN_partial_12_0021,
  rs_R010_ueqv_R010NYN_partial_12_0022,
  rs_R010_ueqv_R010NYN_partial_12_0023,
  rs_R010_ueqv_R010NYN_partial_12_0024,
  rs_R010_ueqv_R010NYN_partial_12_0025,
  rs_R010_ueqv_R010NYN_partial_12_0026,
  rs_R010_ueqv_R010NYN_partial_12_0027,
  rs_R010_ueqv_R010NYN_partial_12_0028,
  rs_R010_ueqv_R010NYN_partial_12_0029,
  rs_R010_ueqv_R010NYN_partial_12_0030,
  rs_R010_ueqv_R010NYN_partial_12_0031,
  rs_R010_ueqv_R010NYN_partial_12_0032,
  rs_R010_ueqv_R010NYN_partial_12_0033,
  rs_R010_ueqv_R010NYN_partial_12_0034,
  rs_R010_ueqv_R010NYN_partial_12_0035,
  rs_R010_ueqv_R010NYN_partial_12_0036,
  rs_R010_ueqv_R010NYN_partial_12_0037,
  rs_R010_ueqv_R010NYN_partial_12_0038,
  rs_R010_ueqv_R010NYN_partial_12_0039,
  rs_R010_ueqv_R010NYN_partial_12_0040,
  rs_R010_ueqv_R010NYN_partial_12_0041,
  rs_R010_ueqv_R010NYN_partial_12_0042,
  rs_R010_ueqv_R010NYN_partial_12_0043,
  rs_R010_ueqv_R010NYN_partial_12_0044,
  rs_R010_ueqv_R010NYN_partial_12_0045,
  rs_R010_ueqv_R010NYN_partial_12_0046,
  rs_R010_ueqv_R010NYN_partial_12_0047,
  rs_R010_ueqv_R010NYN_partial_12_0048,
  rs_R010_ueqv_R010NYN_partial_12_0049,
  rs_R010_ueqv_R010NYN_partial_12_0050,
  rs_R010_ueqv_R010NYN_partial_12_0051,
  rs_R010_ueqv_R010NYN_partial_12_0052,
  rs_R010_ueqv_R010NYN_partial_12_0053,
  rs_R010_ueqv_R010NYN_partial_12_0054,
  rs_R010_ueqv_R010NYN_partial_12_0055,
  rs_R010_ueqv_R010NYN_partial_12_0056,
  rs_R010_ueqv_R010NYN_partial_12_0057,
  rs_R010_ueqv_R010NYN_partial_12_0058,
  rs_R010_ueqv_R010NYN_partial_12_0059,
  rs_R010_ueqv_R010NYN_partial_12_0060,
  rs_R010_ueqv_R010NYN_partial_12_0061,
  rs_R010_ueqv_R010NYN_partial_12_0062,
  rs_R010_ueqv_R010NYN_partial_12_0063,
  rs_R010_ueqv_R010NYN_partial_12_0064,
  rs_R010_ueqv_R010NYN_partial_12_0065,
  rs_R010_ueqv_R010NYN_partial_12_0066,
  rs_R010_ueqv_R010NYN_partial_12_0067,
  rs_R010_ueqv_R010NYN_partial_12_0068,
  rs_R010_ueqv_R010NYN_partial_12_0069,
  rs_R010_ueqv_R010NYN_partial_12_0070,
  rs_R010_ueqv_R010NYN_partial_12_0071,
  rs_R010_ueqv_R010NYN_partial_12_0072
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_12_0000_0072 : Poly :=
[
  term ((642816 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (10, 1), (11, 1)],
  term ((-488448 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (10, 1), (15, 1), (16, 1)],
  term ((642816 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((1619712 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-528 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-131328 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((50088 : Rat) / 599) [(0, 1), (1, 1), (2, 1), (15, 1)],
  term (-16 : Rat) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-131328 : Rat) / 2995) [(0, 1), (1, 1), (2, 1), (15, 3)],
  term ((-16 : Rat) / 5) [(0, 1), (1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-1740 : Rat) / 599) [(0, 1), (1, 1), (3, 1)],
  term ((35712 : Rat) / 599) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term (-16 : Rat) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71424 : Rat) / 599) [(0, 1), (1, 1), (3, 1), (15, 2)],
  term (32 : Rat) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((870 : Rat) / 599) [(0, 1), (1, 2)],
  term ((-17856 : Rat) / 599) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term (8 : Rat) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((35712 : Rat) / 599) [(0, 1), (1, 2), (15, 2)],
  term (-16 : Rat) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-927 : Rat) / 599) [(0, 1), (2, 1)],
  term (24 : Rat) [(0, 1), (2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(0, 1), (2, 1), (3, 1), (13, 1)],
  term (36 : Rat) [(0, 1), (2, 1), (3, 1), (15, 1)],
  term (-4 : Rat) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-10285056 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (9, 1), (11, 1)],
  term ((11029248 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2544 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1714176 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (11, 1), (13, 1)],
  term ((1714176 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1838208 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1)],
  term ((424 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(0, 1), (2, 1), (8, 1), (15, 2)],
  term ((424 : Rat) / 5) [(0, 1), (2, 1), (8, 1), (15, 2), (16, 1)],
  term ((2571264 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1)],
  term ((516 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 1)],
  term ((6110208 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((595584 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 2), (13, 1)],
  term ((-642816 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (11, 2), (15, 1)],
  term (24 : Rat) [(0, 1), (2, 1), (9, 1), (13, 1)],
  term ((-131328 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2685432 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (15, 1)],
  term ((636 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-131328 : Rat) / 2995) [(0, 1), (2, 1), (9, 1), (15, 3)],
  term ((-16 : Rat) / 5) [(0, 1), (2, 1), (9, 1), (15, 3), (16, 1)],
  term ((-642816 : Rat) / 599) [(0, 1), (2, 1), (10, 1), (11, 1), (15, 1)],
  term (16 : Rat) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((649152 : Rat) / 599) [(0, 1), (2, 1), (10, 1), (15, 2)],
  term (-164 : Rat) [(0, 1), (2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-651744 : Rat) / 2995) [(0, 1), (2, 1), (11, 1), (13, 1)],
  term ((-5165376 : Rat) / 2995) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2)],
  term ((1608 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((383904 : Rat) / 599) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term (14 : Rat) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-627648 : Rat) / 2995) [(0, 1), (2, 1), (11, 1), (15, 3)],
  term ((504 : Rat) / 5) [(0, 1), (2, 1), (11, 1), (15, 3), (16, 1)],
  term ((5035392 : Rat) / 2995) [(0, 1), (2, 1), (11, 2), (13, 1), (15, 1)],
  term ((1178496 : Rat) / 2995) [(0, 1), (2, 1), (11, 2), (15, 2)],
  term ((1740 : Rat) / 599) [(0, 1), (2, 1), (12, 1)],
  term ((-35712 : Rat) / 599) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term (16 : Rat) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((71424 : Rat) / 599) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term (-32 : Rat) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((796992 : Rat) / 2995) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-176 : Rat) / 5) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-395772 : Rat) / 599) [(0, 1), (2, 1), (15, 2)],
  term (92 : Rat) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(0, 1), (2, 2)],
  term (-12 : Rat) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term (-8 : Rat) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (2, 2), (15, 2)],
  term (16 : Rat) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((1740 : Rat) / 599) [(0, 1), (3, 1), (13, 1)],
  term ((71424 : Rat) / 599) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term (-32 : Rat) [(0, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35712 : Rat) / 599) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term (16 : Rat) [(0, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-870 : Rat) / 599) [(0, 1), (12, 2)],
  term ((17856 : Rat) / 599) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term (-8 : Rat) [(0, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35712 : Rat) / 599) [(0, 1), (12, 2), (15, 2)],
  term (16 : Rat) [(0, 1), (12, 2), (15, 2), (16, 1)],
  term ((-870 : Rat) / 599) [(0, 1), (13, 2)],
  term ((-35712 : Rat) / 599) [(0, 1), (13, 2), (15, 2)],
  term (16 : Rat) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((17856 : Rat) / 599) [(0, 1), (13, 3), (15, 1)],
  term (-8 : Rat) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((927 : Rat) / 1198) [(0, 2)],
  term ((-321408 : Rat) / 2995) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((244224 : Rat) / 2995) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-321408 : Rat) / 2995) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-809856 : Rat) / 2995) [(0, 2), (1, 1), (11, 1), (15, 2)],
  term ((264 : Rat) / 5) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((642816 : Rat) / 2995) [(0, 2), (1, 1), (11, 2), (15, 1)],
  term ((65664 : Rat) / 2995) [(0, 2), (1, 1), (13, 1), (15, 2)],
  term ((8 : Rat) / 5) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25044 : Rat) / 599) [(0, 2), (1, 1), (15, 1)],
  term (8 : Rat) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((65664 : Rat) / 2995) [(0, 2), (1, 1), (15, 3)],
  term ((8 : Rat) / 5) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((-3537 : Rat) / 599) [(0, 2), (2, 1)],
  term (6 : Rat) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((28524 : Rat) / 599) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term (-12 : Rat) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57048 : Rat) / 599) [(0, 2), (2, 1), (15, 2)],
  term (24 : Rat) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term (6 : Rat) [(0, 2), (3, 1), (13, 1)],
  term (-18 : Rat) [(0, 2), (3, 1), (15, 1)],
  term (2 : Rat) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((5142528 : Rat) / 2995) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term ((-5514624 : Rat) / 2995) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((1272 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-857088 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-857088 : Rat) / 2995) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((919104 : Rat) / 2995) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-212 : Rat) / 5) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((919104 : Rat) / 2995) [(0, 2), (8, 1), (15, 2)],
  term ((-212 : Rat) / 5) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((1378656 : Rat) / 2995) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-258 : Rat) / 5) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(0, 2), (9, 1), (11, 1)],
  term ((-3055104 : Rat) / 2995) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((948 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-297792 : Rat) / 2995) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((72 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2892672 : Rat) / 2995) [(0, 2), (9, 1), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term (-12 : Rat) [(0, 2), (9, 1), (13, 1)],
  term ((65664 : Rat) / 2995) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((8 : Rat) / 5) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1342716 : Rat) / 2995) [(0, 2), (9, 1), (15, 1)],
  term ((-318 : Rat) / 5) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((65664 : Rat) / 2995) [(0, 2), (9, 1), (15, 3)],
  term ((8 : Rat) / 5) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((321408 : Rat) / 599) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term (-8 : Rat) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-324576 : Rat) / 599) [(0, 2), (10, 1), (15, 2)],
  term (82 : Rat) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((325872 : Rat) / 2995) [(0, 2), (11, 1), (13, 1)],
  term ((2582688 : Rat) / 2995) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-804 : Rat) / 5) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-191952 : Rat) / 599) [(0, 2), (11, 1), (15, 1)],
  term (-7 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((313824 : Rat) / 2995) [(0, 2), (11, 1), (15, 3)],
  term ((-252 : Rat) / 5) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-2517696 : Rat) / 2995) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((-589248 : Rat) / 2995) [(0, 2), (11, 2), (15, 2)],
  term ((-398496 : Rat) / 2995) [(0, 2), (13, 1), (15, 1)],
  term ((88 : Rat) / 5) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((197886 : Rat) / 599) [(0, 2), (15, 2)],
  term (-46 : Rat) [(0, 2), (15, 2), (16, 1)],
  term ((870 : Rat) / 599) [(0, 3)],
  term ((-17856 : Rat) / 599) [(0, 3), (13, 1), (15, 1)],
  term (8 : Rat) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((35712 : Rat) / 599) [(0, 3), (15, 2)],
  term (-16 : Rat) [(0, 3), (15, 2), (16, 1)],
  term (6 : Rat) [(1, 1), (2, 1), (3, 1)],
  term (-12 : Rat) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term (16 : Rat) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (2, 1), (10, 1), (11, 1), (12, 1)],
  term ((488448 : Rat) / 2995) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(1, 1), (2, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (2, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1619712 : Rat) / 2995) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2)],
  term ((528 : Rat) / 5) [(1, 1), (2, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1285632 : Rat) / 2995) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((131328 : Rat) / 2995) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 5) [(1, 1), (2, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50088 : Rat) / 599) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((131328 : Rat) / 2995) [(1, 1), (2, 1), (12, 1), (15, 3)],
  term ((16 : Rat) / 5) [(1, 1), (2, 1), (12, 1), (15, 3), (16, 1)],
  term ((-927 : Rat) / 599) [(1, 1), (3, 1)],
  term ((-10285056 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (9, 1), (11, 1)],
  term ((11029248 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1)],
  term ((-2544 : Rat) / 5) [(1, 1), (3, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1714176 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (11, 1), (13, 1)],
  term ((1714176 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1838208 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((424 : Rat) / 5) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((424 : Rat) / 5) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((2571264 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2757312 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((516 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((2571264 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 1)],
  term ((6110208 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((595584 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 2), (13, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((-131328 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2685432 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((636 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-131328 : Rat) / 2995) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((-16 : Rat) / 5) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((-642816 : Rat) / 599) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((488448 : Rat) / 2995) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-64 : Rat) / 5) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((649152 : Rat) / 599) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term (-164 : Rat) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-651744 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-6785088 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((2136 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((383904 : Rat) / 599) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term (14 : Rat) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-627648 : Rat) / 2995) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((504 : Rat) / 5) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((6321024 : Rat) / 2995) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((1178496 : Rat) / 2995) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((546552 : Rat) / 2995) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((131328 : Rat) / 2995) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((16 : Rat) / 5) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((131328 : Rat) / 2995) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((16 : Rat) / 5) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((-395772 : Rat) / 599) [(1, 1), (3, 1), (15, 2)],
  term (92 : Rat) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(1, 1), (3, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(1, 1), (3, 2), (13, 1)],
  term (36 : Rat) [(1, 1), (3, 2), (15, 1)],
  term (-4 : Rat) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((321408 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((-244224 : Rat) / 2995) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((72 : Rat) / 5) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-244224 : Rat) / 2995) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((72 : Rat) / 5) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((809856 : Rat) / 2995) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((-264 : Rat) / 5) [(1, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((809856 : Rat) / 2995) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-264 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((321408 : Rat) / 2995) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-65664 : Rat) / 2995) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((-8 : Rat) / 5) [(1, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((25044 : Rat) / 599) [(1, 1), (12, 2), (15, 1)],
  term (-8 : Rat) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-65664 : Rat) / 2995) [(1, 1), (12, 2), (15, 3)],
  term ((-8 : Rat) / 5) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((25044 : Rat) / 599) [(1, 1), (13, 2), (15, 1)],
  term (-8 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-65664 : Rat) / 2995) [(1, 1), (13, 2), (15, 3)],
  term ((-8 : Rat) / 5) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((-65664 : Rat) / 2995) [(1, 1), (13, 3), (15, 2)],
  term ((-8 : Rat) / 5) [(1, 1), (13, 3), (15, 2), (16, 1)],
  term ((927 : Rat) / 1198) [(1, 2)],
  term (-3 : Rat) [(1, 2), (2, 1)],
  term (6 : Rat) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 2), (2, 1), (15, 2)],
  term (-8 : Rat) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((642816 : Rat) / 2995) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-488448 : Rat) / 2995) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((144 : Rat) / 5) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((642816 : Rat) / 2995) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term (-12 : Rat) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1619712 : Rat) / 2995) [(1, 2), (3, 1), (11, 1), (15, 2)],
  term ((-408 : Rat) / 5) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 2), (3, 1), (11, 2), (15, 1)],
  term (6 : Rat) [(1, 2), (3, 1), (13, 1)],
  term ((-131328 : Rat) / 2995) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((39306 : Rat) / 599) [(1, 2), (3, 1), (15, 1)],
  term (-14 : Rat) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-131328 : Rat) / 2995) [(1, 2), (3, 1), (15, 3)],
  term ((-16 : Rat) / 5) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((5142528 : Rat) / 2995) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((-5514624 : Rat) / 2995) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((1272 : Rat) / 5) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-857088 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-857088 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((919104 : Rat) / 2995) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-212 : Rat) / 5) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((919104 : Rat) / 2995) [(1, 2), (8, 1), (15, 2)],
  term ((-212 : Rat) / 5) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((1378656 : Rat) / 2995) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-258 : Rat) / 5) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 2), (9, 1), (11, 1)],
  term ((-3055104 : Rat) / 2995) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((948 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-297792 : Rat) / 2995) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((72 : Rat) / 5) [(1, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2892672 : Rat) / 2995) [(1, 2), (9, 1), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term (-12 : Rat) [(1, 2), (9, 1), (13, 1)],
  term ((65664 : Rat) / 2995) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((8 : Rat) / 5) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1342716 : Rat) / 2995) [(1, 2), (9, 1), (15, 1)],
  term ((-318 : Rat) / 5) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((65664 : Rat) / 2995) [(1, 2), (9, 1), (15, 3)],
  term ((8 : Rat) / 5) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((321408 : Rat) / 599) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term (-8 : Rat) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-324576 : Rat) / 599) [(1, 2), (10, 1), (15, 2)],
  term (82 : Rat) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((325872 : Rat) / 2995) [(1, 2), (11, 1), (13, 1)],
  term ((2582688 : Rat) / 2995) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-804 : Rat) / 5) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-191952 : Rat) / 599) [(1, 2), (11, 1), (15, 1)],
  term (-7 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((313824 : Rat) / 2995) [(1, 2), (11, 1), (15, 3)],
  term ((-252 : Rat) / 5) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-2517696 : Rat) / 2995) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-589248 : Rat) / 2995) [(1, 2), (11, 2), (15, 2)],
  term ((-398496 : Rat) / 2995) [(1, 2), (13, 1), (15, 1)],
  term ((88 : Rat) / 5) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((197886 : Rat) / 599) [(1, 2), (15, 2)],
  term (-46 : Rat) [(1, 2), (15, 2), (16, 1)],
  term ((-321408 : Rat) / 2995) [(1, 3), (10, 1), (11, 1)],
  term ((244224 : Rat) / 2995) [(1, 3), (10, 1), (15, 1)],
  term ((-72 : Rat) / 5) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((-321408 : Rat) / 2995) [(1, 3), (11, 1), (13, 1), (15, 1)],
  term ((-809856 : Rat) / 2995) [(1, 3), (11, 1), (15, 2)],
  term ((264 : Rat) / 5) [(1, 3), (11, 1), (15, 2), (16, 1)],
  term ((642816 : Rat) / 2995) [(1, 3), (11, 2), (15, 1)],
  term ((65664 : Rat) / 2995) [(1, 3), (13, 1), (15, 2)],
  term ((8 : Rat) / 5) [(1, 3), (13, 1), (15, 2), (16, 1)],
  term ((-25044 : Rat) / 599) [(1, 3), (15, 1)],
  term (8 : Rat) [(1, 3), (15, 1), (16, 1)],
  term ((65664 : Rat) / 2995) [(1, 3), (15, 3)],
  term ((8 : Rat) / 5) [(1, 3), (15, 3), (16, 1)],
  term (-24 : Rat) [(2, 1), (3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(2, 1), (3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 1), (3, 1), (12, 1), (13, 1)],
  term (-36 : Rat) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term (4 : Rat) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (3, 1), (13, 1)],
  term (48 : Rat) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term (-16 : Rat) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term (8 : Rat) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((10285056 : Rat) / 2995) [(2, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-11029248 : Rat) / 2995) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((2544 : Rat) / 5) [(2, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1714176 : Rat) / 2995) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1714176 : Rat) / 2995) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((1838208 : Rat) / 2995) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-424 : Rat) / 5) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1838208 : Rat) / 2995) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-424 : Rat) / 5) [(2, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((2757312 : Rat) / 2995) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-516 : Rat) / 5) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-6110208 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-595584 : Rat) / 2995) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((144 : Rat) / 5) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5785344 : Rat) / 2995) [(2, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((642816 : Rat) / 2995) [(2, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term (-24 : Rat) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((131328 : Rat) / 2995) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2685432 : Rat) / 2995) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((131328 : Rat) / 2995) [(2, 1), (9, 1), (12, 1), (15, 3)],
  term ((16 : Rat) / 5) [(2, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((642816 : Rat) / 599) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term (-16 : Rat) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-649152 : Rat) / 599) [(2, 1), (10, 1), (12, 1), (15, 2)],
  term (164 : Rat) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((651744 : Rat) / 2995) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((5165376 : Rat) / 2995) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1608 : Rat) / 5) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-383904 : Rat) / 599) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term (-14 : Rat) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((627648 : Rat) / 2995) [(2, 1), (11, 1), (12, 1), (15, 3)],
  term ((-504 : Rat) / 5) [(2, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5035392 : Rat) / 2995) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1178496 : Rat) / 2995) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((927 : Rat) / 599) [(2, 1), (12, 1)],
  term ((-796992 : Rat) / 2995) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((176 : Rat) / 5) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((395772 : Rat) / 599) [(2, 1), (12, 1), (15, 2)],
  term (-92 : Rat) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(2, 1), (12, 2)],
  term (12 : Rat) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term (-4 : Rat) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(2, 1), (12, 2), (15, 2)],
  term (8 : Rat) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term (3 : Rat) [(2, 1), (13, 2)],
  term (-24 : Rat) [(2, 1), (13, 2), (15, 2)],
  term (8 : Rat) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term (12 : Rat) [(2, 1), (13, 3), (15, 1)],
  term (-4 : Rat) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term (12 : Rat) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (12, 1)],
  term (-24 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term (8 : Rat) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(2, 2), (12, 1), (15, 2)],
  term (-16 : Rat) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((10285056 : Rat) / 2995) [(3, 1), (8, 1), (9, 1), (11, 1), (13, 1)],
  term ((-11029248 : Rat) / 2995) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((2544 : Rat) / 5) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 2)],
  term ((1838208 : Rat) / 2995) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-424 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((1838208 : Rat) / 2995) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((-424 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-516 : Rat) / 5) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 1)],
  term ((-595584 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((144 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6110208 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((1896 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((642816 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((5785344 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 2)],
  term ((2685432 : Rat) / 2995) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((131328 : Rat) / 2995) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((16 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(3, 1), (9, 1), (13, 2)],
  term ((131328 : Rat) / 2995) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((16 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((642816 : Rat) / 599) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-649152 : Rat) / 599) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term (164 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-383904 : Rat) / 599) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term (-14 : Rat) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((627648 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-504 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((651744 : Rat) / 2995) [(3, 1), (11, 1), (13, 2)],
  term ((5165376 : Rat) / 2995) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1728 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1178496 : Rat) / 2995) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-5035392 : Rat) / 2995) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term (-6 : Rat) [(3, 1), (12, 2), (13, 1)],
  term (18 : Rat) [(3, 1), (12, 2), (15, 1)],
  term (-2 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((927 : Rat) / 599) [(3, 1), (13, 1)],
  term ((395772 : Rat) / 599) [(3, 1), (13, 1), (15, 2)],
  term (-92 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-743082 : Rat) / 2995) [(3, 1), (13, 2), (15, 1)],
  term ((166 : Rat) / 5) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (13, 3)],
  term (48 : Rat) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-36 : Rat) [(3, 2), (13, 1), (15, 1)],
  term (4 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2), (13, 2)],
  term ((-5142528 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((-5142528 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((5514624 : Rat) / 2995) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-1272 : Rat) / 5) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((5514624 : Rat) / 2995) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-1272 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 3)],
  term ((-919104 : Rat) / 2995) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((212 : Rat) / 5) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-919104 : Rat) / 2995) [(8, 1), (12, 2), (15, 2)],
  term ((212 : Rat) / 5) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-919104 : Rat) / 2995) [(8, 1), (13, 2), (15, 2)],
  term ((212 : Rat) / 5) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-919104 : Rat) / 2995) [(8, 1), (13, 3), (15, 1)],
  term ((212 : Rat) / 5) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((1285632 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((1285632 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-1378656 : Rat) / 2995) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((258 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1378656 : Rat) / 2995) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((258 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1285632 : Rat) / 2995) [(9, 1), (11, 1), (12, 2)],
  term ((3055104 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((297792 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-72 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((1285632 : Rat) / 2995) [(9, 1), (11, 1), (13, 2)],
  term ((297792 : Rat) / 2995) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-72 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((3055104 : Rat) / 2995) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((-948 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2892672 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(9, 1), (11, 2), (13, 3)],
  term (12 : Rat) [(9, 1), (12, 2), (13, 1)],
  term ((-65664 : Rat) / 2995) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-8 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1342716 : Rat) / 2995) [(9, 1), (12, 2), (15, 1)],
  term ((318 : Rat) / 5) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-65664 : Rat) / 2995) [(9, 1), (12, 2), (15, 3)],
  term ((-8 : Rat) / 5) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1342716 : Rat) / 2995) [(9, 1), (13, 2), (15, 1)],
  term ((318 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-65664 : Rat) / 2995) [(9, 1), (13, 2), (15, 3)],
  term ((-8 : Rat) / 5) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term (12 : Rat) [(9, 1), (13, 3)],
  term ((-65664 : Rat) / 2995) [(9, 1), (13, 3), (15, 2)],
  term ((-8 : Rat) / 5) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-321408 : Rat) / 599) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-321408 : Rat) / 599) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term (8 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((324576 : Rat) / 599) [(10, 1), (12, 2), (15, 2)],
  term (-82 : Rat) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((324576 : Rat) / 599) [(10, 1), (13, 2), (15, 2)],
  term (-82 : Rat) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-325872 : Rat) / 2995) [(11, 1), (12, 2), (13, 1)],
  term ((-2582688 : Rat) / 2995) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((804 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((191952 : Rat) / 599) [(11, 1), (12, 2), (15, 1)],
  term (7 : Rat) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-313824 : Rat) / 2995) [(11, 1), (12, 2), (15, 3)],
  term ((252 : Rat) / 5) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((191952 : Rat) / 599) [(11, 1), (13, 2), (15, 1)],
  term (7 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-313824 : Rat) / 2995) [(11, 1), (13, 2), (15, 3)],
  term ((252 : Rat) / 5) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-325872 : Rat) / 2995) [(11, 1), (13, 3)],
  term ((-2582688 : Rat) / 2995) [(11, 1), (13, 3), (15, 2)],
  term ((804 : Rat) / 5) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((2517696 : Rat) / 2995) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((589248 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)],
  term ((589248 : Rat) / 2995) [(11, 2), (13, 2), (15, 2)],
  term ((2517696 : Rat) / 2995) [(11, 2), (13, 3), (15, 1)],
  term ((-927 : Rat) / 1198) [(12, 2)],
  term ((398496 : Rat) / 2995) [(12, 2), (13, 1), (15, 1)],
  term ((-88 : Rat) / 5) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197886 : Rat) / 599) [(12, 2), (15, 2)],
  term (46 : Rat) [(12, 2), (15, 2), (16, 1)],
  term ((-927 : Rat) / 1198) [(13, 2)],
  term ((-197886 : Rat) / 599) [(13, 2), (15, 2)],
  term (46 : Rat) [(13, 2), (15, 2), (16, 1)],
  term ((398496 : Rat) / 2995) [(13, 3), (15, 1)],
  term ((-88 : Rat) / 5) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 72. -/
theorem rs_R010_ueqv_R010NYN_block_12_0000_0072_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_12_0000_0072
      rs_R010_ueqv_R010NYN_block_12_0000_0072 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
