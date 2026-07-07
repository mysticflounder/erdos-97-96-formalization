/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 24:0-29

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 : Poly :=
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
def rs_R009_ueqv_R009NNNNY_coefficient_24_0000 : Poly :=
[
  term ((985 : Rat) / 372) [(0, 1), (16, 1)]
]

/-- Partial product 0 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0000 : Poly :=
[
  term ((-985 : Rat) / 186) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((985 : Rat) / 372) [(0, 1), (1, 2), (16, 1)],
  term ((985 : Rat) / 186) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((985 : Rat) / 186) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-985 : Rat) / 372) [(0, 1), (14, 2), (16, 1)],
  term ((-985 : Rat) / 372) [(0, 1), (15, 2), (16, 1)],
  term ((-985 : Rat) / 186) [(0, 2), (10, 1), (16, 1)],
  term ((985 : Rat) / 372) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0000
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0001 : Poly :=
[
  term ((158 : Rat) / 93) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0001 : Poly :=
[
  term ((-316 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((158 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((316 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((316 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-158 : Rat) / 93) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-316 : Rat) / 93) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((158 : Rat) / 93) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0001
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0002 : Poly :=
[
  term ((-76 : Rat) / 93) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0002 : Poly :=
[
  term ((152 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-76 : Rat) / 93) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-152 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((76 : Rat) / 93) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((76 : Rat) / 93) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-152 : Rat) / 93) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((152 : Rat) / 93) [(1, 2), (11, 2), (16, 1)],
  term ((-76 : Rat) / 93) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0002
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0003 : Poly :=
[
  term ((-431 : Rat) / 186) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0003 : Poly :=
[
  term ((431 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-431 : Rat) / 186) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-431 : Rat) / 93) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-431 : Rat) / 93) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((431 : Rat) / 186) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((431 : Rat) / 186) [(1, 1), (15, 3), (16, 1)],
  term ((431 : Rat) / 93) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-431 : Rat) / 186) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0003
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0004 : Poly :=
[
  term ((104 : Rat) / 31) [(1, 2), (16, 1)]
]

/-- Partial product 4 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0004 : Poly :=
[
  term ((-208 : Rat) / 31) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 2), (1, 2), (16, 1)],
  term ((208 : Rat) / 31) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((208 : Rat) / 31) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(1, 2), (14, 2), (16, 1)],
  term ((-104 : Rat) / 31) [(1, 2), (15, 2), (16, 1)],
  term ((-208 : Rat) / 31) [(1, 3), (11, 1), (16, 1)],
  term ((104 : Rat) / 31) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0004
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0005 : Poly :=
[
  term ((92 : Rat) / 93) [(2, 1), (16, 1)]
]

/-- Partial product 5 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0005 : Poly :=
[
  term ((-184 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((92 : Rat) / 93) [(0, 2), (2, 1), (16, 1)],
  term ((-184 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((92 : Rat) / 93) [(1, 2), (2, 1), (16, 1)],
  term ((184 : Rat) / 93) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((184 : Rat) / 93) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92 : Rat) / 93) [(2, 1), (14, 2), (16, 1)],
  term ((-92 : Rat) / 93) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0005
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0006 : Poly :=
[
  term ((-442 : Rat) / 93) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0006 : Poly :=
[
  term ((884 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0006
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0007 : Poly :=
[
  term ((-221 : Rat) / 186) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 7 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0007 : Poly :=
[
  term ((221 : Rat) / 93) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((221 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0007
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0008 : Poly :=
[
  term ((182 : Rat) / 93) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0008 : Poly :=
[
  term ((-364 : Rat) / 93) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0008
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0009 : Poly :=
[
  term (9 : Rat) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0009 : Poly :=
[
  term (-18 : Rat) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term (9 : Rat) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term (9 : Rat) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term (-9 : Rat) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0009
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0010 : Poly :=
[
  term ((-1139 : Rat) / 93) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0010 : Poly :=
[
  term ((2278 : Rat) / 93) [(0, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((1139 : Rat) / 93) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0010
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0011 : Poly :=
[
  term ((443 : Rat) / 186) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0011 : Poly :=
[
  term ((-443 : Rat) / 93) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 186) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 186) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 93) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 93) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-443 : Rat) / 186) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-443 : Rat) / 186) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0011
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0012 : Poly :=
[
  term ((442 : Rat) / 93) [(3, 2), (16, 1)]
]

/-- Partial product 12 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0012 : Poly :=
[
  term ((-884 : Rat) / 93) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (3, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (3, 2), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (14, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0012
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0013 : Poly :=
[
  term ((-4 : Rat) / 93) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0013 : Poly :=
[
  term ((8 : Rat) / 93) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-4 : Rat) / 93) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0013
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0014 : Poly :=
[
  term ((-182 : Rat) / 93) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0014 : Poly :=
[
  term ((364 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0014
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0015 : Poly :=
[
  term ((178 : Rat) / 93) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0015 : Poly :=
[
  term ((-356 : Rat) / 93) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((178 : Rat) / 93) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-356 : Rat) / 93) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((178 : Rat) / 93) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((356 : Rat) / 93) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-178 : Rat) / 93) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-178 : Rat) / 93) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((356 : Rat) / 93) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0015
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0016 : Poly :=
[
  term ((472 : Rat) / 31) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0016 : Poly :=
[
  term ((-944 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((472 : Rat) / 31) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-944 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((472 : Rat) / 31) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((944 : Rat) / 31) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((944 : Rat) / 31) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-472 : Rat) / 31) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-472 : Rat) / 31) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0016
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0017 : Poly :=
[
  term ((361 : Rat) / 186) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0017 : Poly :=
[
  term ((-361 : Rat) / 93) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((361 : Rat) / 186) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-361 : Rat) / 93) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((361 : Rat) / 186) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((361 : Rat) / 93) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-361 : Rat) / 186) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-361 : Rat) / 186) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((361 : Rat) / 93) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0017
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0018 : Poly :=
[
  term ((437 : Rat) / 186) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0018 : Poly :=
[
  term ((-437 : Rat) / 93) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((437 : Rat) / 186) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-437 : Rat) / 93) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((437 : Rat) / 186) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((437 : Rat) / 93) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((437 : Rat) / 93) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-437 : Rat) / 186) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0018
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0019 : Poly :=
[
  term ((-703 : Rat) / 62) [(8, 1), (16, 1)]
]

/-- Partial product 19 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0019 : Poly :=
[
  term ((703 : Rat) / 31) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-703 : Rat) / 62) [(0, 2), (8, 1), (16, 1)],
  term ((703 : Rat) / 31) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-703 : Rat) / 62) [(1, 2), (8, 1), (16, 1)],
  term ((-703 : Rat) / 31) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-703 : Rat) / 31) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((703 : Rat) / 62) [(8, 1), (14, 2), (16, 1)],
  term ((703 : Rat) / 62) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0019
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0020 : Poly :=
[
  term ((-116 : Rat) / 93) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0020 : Poly :=
[
  term ((232 : Rat) / 93) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((232 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-116 : Rat) / 93) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((116 : Rat) / 93) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((116 : Rat) / 93) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0020
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0021 : Poly :=
[
  term ((-452 : Rat) / 93) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0021 : Poly :=
[
  term ((904 : Rat) / 93) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((-452 : Rat) / 93) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((904 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-452 : Rat) / 93) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((-904 : Rat) / 93) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((452 : Rat) / 93) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((452 : Rat) / 93) [(10, 1), (14, 3), (16, 1)],
  term ((-904 : Rat) / 93) [(10, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0021
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0022 : Poly :=
[
  term ((146 : Rat) / 31) [(10, 1), (16, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0022 : Poly :=
[
  term ((-292 : Rat) / 31) [(0, 1), (10, 2), (16, 1)],
  term ((146 : Rat) / 31) [(0, 2), (10, 1), (16, 1)],
  term ((-292 : Rat) / 31) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((146 : Rat) / 31) [(1, 2), (10, 1), (16, 1)],
  term ((292 : Rat) / 31) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-146 : Rat) / 31) [(10, 1), (14, 2), (16, 1)],
  term ((-146 : Rat) / 31) [(10, 1), (15, 2), (16, 1)],
  term ((292 : Rat) / 31) [(10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0022
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0023 : Poly :=
[
  term ((-487 : Rat) / 186) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0023 : Poly :=
[
  term ((487 : Rat) / 93) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-487 : Rat) / 186) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((487 : Rat) / 93) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-487 : Rat) / 186) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-487 : Rat) / 93) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((487 : Rat) / 186) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((487 : Rat) / 186) [(11, 1), (15, 3), (16, 1)],
  term ((-487 : Rat) / 93) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0023
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0024 : Poly :=
[
  term ((-208 : Rat) / 31) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 24 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0024 : Poly :=
[
  term ((416 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 31) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 31) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-416 : Rat) / 31) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 31) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((208 : Rat) / 31) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0024
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0025 : Poly :=
[
  term ((3325 : Rat) / 372) [(12, 1), (16, 1)]
]

/-- Partial product 25 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0025 : Poly :=
[
  term ((-3325 : Rat) / 186) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((3325 : Rat) / 372) [(0, 2), (12, 1), (16, 1)],
  term ((-3325 : Rat) / 186) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((3325 : Rat) / 372) [(1, 2), (12, 1), (16, 1)],
  term ((3325 : Rat) / 186) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3325 : Rat) / 186) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3325 : Rat) / 372) [(12, 1), (14, 2), (16, 1)],
  term ((-3325 : Rat) / 372) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0025
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0026 : Poly :=
[
  term ((-419 : Rat) / 31) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0026 : Poly :=
[
  term ((838 : Rat) / 31) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-419 : Rat) / 31) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((838 : Rat) / 31) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-419 : Rat) / 31) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-838 : Rat) / 31) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-838 : Rat) / 31) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((419 : Rat) / 31) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((419 : Rat) / 31) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0026
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0027 : Poly :=
[
  term ((287 : Rat) / 31) [(14, 1), (16, 1)]
]

/-- Partial product 27 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0027 : Poly :=
[
  term ((-574 : Rat) / 31) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((287 : Rat) / 31) [(0, 2), (14, 1), (16, 1)],
  term ((-574 : Rat) / 31) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((287 : Rat) / 31) [(1, 2), (14, 1), (16, 1)],
  term ((574 : Rat) / 31) [(10, 1), (14, 2), (16, 1)],
  term ((574 : Rat) / 31) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-287 : Rat) / 31) [(14, 1), (15, 2), (16, 1)],
  term ((-287 : Rat) / 31) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0027
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0028 : Poly :=
[
  term ((-370 : Rat) / 93) [(15, 2), (16, 1)]
]

/-- Partial product 28 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0028 : Poly :=
[
  term ((740 : Rat) / 93) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-370 : Rat) / 93) [(0, 2), (15, 2), (16, 1)],
  term ((740 : Rat) / 93) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-370 : Rat) / 93) [(1, 2), (15, 2), (16, 1)],
  term ((-740 : Rat) / 93) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-740 : Rat) / 93) [(11, 1), (15, 3), (16, 1)],
  term ((370 : Rat) / 93) [(14, 2), (15, 2), (16, 1)],
  term ((370 : Rat) / 93) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0028
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009NNNNY_coefficient_24_0029 : Poly :=
[
  term ((-1529 : Rat) / 372) [(16, 1)]
]

/-- Partial product 29 for generator 24. -/
def rs_R009_ueqv_R009NNNNY_partial_24_0029 : Poly :=
[
  term ((1529 : Rat) / 186) [(0, 1), (10, 1), (16, 1)],
  term ((-1529 : Rat) / 372) [(0, 2), (16, 1)],
  term ((1529 : Rat) / 186) [(1, 1), (11, 1), (16, 1)],
  term ((-1529 : Rat) / 372) [(1, 2), (16, 1)],
  term ((-1529 : Rat) / 186) [(10, 1), (14, 1), (16, 1)],
  term ((-1529 : Rat) / 186) [(11, 1), (15, 1), (16, 1)],
  term ((1529 : Rat) / 372) [(14, 2), (16, 1)],
  term ((1529 : Rat) / 372) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 24. -/
theorem rs_R009_ueqv_R009NNNNY_partial_24_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_24_0029
        rs_R009_ueqv_R009NNNNY_generator_24_0000_0029 =
      rs_R009_ueqv_R009NNNNY_partial_24_0029 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_24_0000_0029 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_24_0000,
  rs_R009_ueqv_R009NNNNY_partial_24_0001,
  rs_R009_ueqv_R009NNNNY_partial_24_0002,
  rs_R009_ueqv_R009NNNNY_partial_24_0003,
  rs_R009_ueqv_R009NNNNY_partial_24_0004,
  rs_R009_ueqv_R009NNNNY_partial_24_0005,
  rs_R009_ueqv_R009NNNNY_partial_24_0006,
  rs_R009_ueqv_R009NNNNY_partial_24_0007,
  rs_R009_ueqv_R009NNNNY_partial_24_0008,
  rs_R009_ueqv_R009NNNNY_partial_24_0009,
  rs_R009_ueqv_R009NNNNY_partial_24_0010,
  rs_R009_ueqv_R009NNNNY_partial_24_0011,
  rs_R009_ueqv_R009NNNNY_partial_24_0012,
  rs_R009_ueqv_R009NNNNY_partial_24_0013,
  rs_R009_ueqv_R009NNNNY_partial_24_0014,
  rs_R009_ueqv_R009NNNNY_partial_24_0015,
  rs_R009_ueqv_R009NNNNY_partial_24_0016,
  rs_R009_ueqv_R009NNNNY_partial_24_0017,
  rs_R009_ueqv_R009NNNNY_partial_24_0018,
  rs_R009_ueqv_R009NNNNY_partial_24_0019,
  rs_R009_ueqv_R009NNNNY_partial_24_0020,
  rs_R009_ueqv_R009NNNNY_partial_24_0021,
  rs_R009_ueqv_R009NNNNY_partial_24_0022,
  rs_R009_ueqv_R009NNNNY_partial_24_0023,
  rs_R009_ueqv_R009NNNNY_partial_24_0024,
  rs_R009_ueqv_R009NNNNY_partial_24_0025,
  rs_R009_ueqv_R009NNNNY_partial_24_0026,
  rs_R009_ueqv_R009NNNNY_partial_24_0027,
  rs_R009_ueqv_R009NNNNY_partial_24_0028,
  rs_R009_ueqv_R009NNNNY_partial_24_0029
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_24_0000_0029 : Poly :=
[
  term ((-316 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((152 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((431 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-985 : Rat) / 186) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((985 : Rat) / 372) [(0, 1), (1, 2), (16, 1)],
  term ((-184 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((884 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((221 : Rat) / 93) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (3, 1), (9, 1), (10, 1), (16, 1)],
  term (-18 : Rat) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(0, 1), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-443 : Rat) / 93) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((8 : Rat) / 93) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((364 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-356 : Rat) / 93) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-944 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 93) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-437 : Rat) / 93) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((703 : Rat) / 31) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((232 : Rat) / 93) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((487 : Rat) / 93) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((416 : Rat) / 31) [(0, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3325 : Rat) / 186) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((838 : Rat) / 31) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2459 : Rat) / 186) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((740 : Rat) / 93) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((1529 : Rat) / 186) [(0, 1), (10, 1), (16, 1)],
  term ((904 : Rat) / 93) [(0, 1), (10, 2), (14, 1), (16, 1)],
  term ((-292 : Rat) / 31) [(0, 1), (10, 2), (16, 1)],
  term ((985 : Rat) / 186) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-985 : Rat) / 372) [(0, 1), (14, 2), (16, 1)],
  term ((-985 : Rat) / 372) [(0, 1), (15, 2), (16, 1)],
  term ((158 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-76 : Rat) / 93) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-431 : Rat) / 186) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 2), (1, 2), (16, 1)],
  term ((92 : Rat) / 93) [(0, 2), (2, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term (9 : Rat) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((443 : Rat) / 186) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (3, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((178 : Rat) / 93) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((472 : Rat) / 31) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 186) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((437 : Rat) / 186) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-703 : Rat) / 62) [(0, 2), (8, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-452 : Rat) / 93) [(0, 2), (10, 1), (14, 1), (16, 1)],
  term ((-109 : Rat) / 186) [(0, 2), (10, 1), (16, 1)],
  term ((-487 : Rat) / 186) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 2), (12, 1), (14, 1), (16, 1)],
  term ((3325 : Rat) / 372) [(0, 2), (12, 1), (16, 1)],
  term ((-419 : Rat) / 31) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((287 : Rat) / 31) [(0, 2), (14, 1), (16, 1)],
  term ((-370 : Rat) / 93) [(0, 2), (15, 2), (16, 1)],
  term ((-1529 : Rat) / 372) [(0, 2), (16, 1)],
  term ((985 : Rat) / 372) [(0, 3), (16, 1)],
  term ((-184 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((221 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term ((316 : Rat) / 93) [(1, 1), (3, 1), (10, 1), (14, 1), (16, 1)],
  term ((2278 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-127 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-158 : Rat) / 93) [(1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-158 : Rat) / 93) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((8 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((364 : Rat) / 93) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-944 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-356 : Rat) / 93) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-437 : Rat) / 93) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-361 : Rat) / 93) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((703 : Rat) / 31) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((232 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((752 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-292 : Rat) / 31) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-431 : Rat) / 93) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((416 : Rat) / 31) [(1, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3325 : Rat) / 186) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((838 : Rat) / 31) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-574 : Rat) / 31) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((76 : Rat) / 93) [(1, 1), (11, 1), (14, 2), (16, 1)],
  term ((385 : Rat) / 93) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((1529 : Rat) / 186) [(1, 1), (11, 1), (16, 1)],
  term ((335 : Rat) / 93) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((431 : Rat) / 186) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((431 : Rat) / 186) [(1, 1), (15, 3), (16, 1)],
  term ((92 : Rat) / 93) [(1, 2), (2, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-221 : Rat) / 186) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((521 : Rat) / 93) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-1139 : Rat) / 93) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((443 : Rat) / 186) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (3, 2), (16, 1)],
  term ((-4 : Rat) / 93) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((178 : Rat) / 93) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((472 : Rat) / 31) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 186) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((437 : Rat) / 186) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-703 : Rat) / 62) [(1, 2), (8, 1), (16, 1)],
  term ((-116 : Rat) / 93) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((172 : Rat) / 93) [(1, 2), (10, 1), (14, 1), (16, 1)],
  term ((146 : Rat) / 31) [(1, 2), (10, 1), (16, 1)],
  term ((541 : Rat) / 62) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 93) [(1, 2), (11, 2), (16, 1)],
  term ((-208 : Rat) / 31) [(1, 2), (12, 1), (14, 1), (16, 1)],
  term ((3325 : Rat) / 372) [(1, 2), (12, 1), (16, 1)],
  term ((-419 : Rat) / 31) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((287 : Rat) / 31) [(1, 2), (14, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(1, 2), (14, 2), (16, 1)],
  term ((-22 : Rat) / 3) [(1, 2), (15, 2), (16, 1)],
  term ((-1529 : Rat) / 372) [(1, 2), (16, 1)],
  term ((158 : Rat) / 93) [(1, 3), (3, 1), (16, 1)],
  term ((-700 : Rat) / 93) [(1, 3), (11, 1), (16, 1)],
  term ((-431 : Rat) / 186) [(1, 3), (15, 1), (16, 1)],
  term ((104 : Rat) / 31) [(1, 4), (16, 1)],
  term ((184 : Rat) / 93) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((184 : Rat) / 93) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92 : Rat) / 93) [(2, 1), (14, 2), (16, 1)],
  term ((-92 : Rat) / 93) [(2, 1), (15, 2), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((442 : Rat) / 93) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((364 : Rat) / 93) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-182 : Rat) / 93) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((443 : Rat) / 93) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2278 : Rat) / 93) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-394 : Rat) / 93) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term (18 : Rat) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((1139 : Rat) / 93) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((1139 : Rat) / 93) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-443 : Rat) / 186) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-443 : Rat) / 186) [(3, 1), (15, 3), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (10, 1), (14, 1), (16, 1)],
  term ((884 : Rat) / 93) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (14, 2), (16, 1)],
  term ((-442 : Rat) / 93) [(3, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((356 : Rat) / 93) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((944 : Rat) / 31) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178 : Rat) / 93) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((2654 : Rat) / 93) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((356 : Rat) / 93) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-472 : Rat) / 31) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-472 : Rat) / 31) [(5, 1), (15, 3), (16, 1)],
  term ((361 : Rat) / 93) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((437 : Rat) / 93) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((437 : Rat) / 93) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 186) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-361 : Rat) / 186) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((361 : Rat) / 93) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-437 : Rat) / 186) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-703 : Rat) / 31) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-703 : Rat) / 31) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((703 : Rat) / 62) [(8, 1), (14, 2), (16, 1)],
  term ((703 : Rat) / 62) [(8, 1), (15, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((116 : Rat) / 93) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((116 : Rat) / 93) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-232 : Rat) / 93) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1391 : Rat) / 93) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((292 : Rat) / 31) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3325 : Rat) / 186) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-416 : Rat) / 31) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-838 : Rat) / 31) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 31) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1529 : Rat) / 186) [(10, 1), (14, 1), (16, 1)],
  term ((428 : Rat) / 31) [(10, 1), (14, 2), (16, 1)],
  term ((452 : Rat) / 93) [(10, 1), (14, 3), (16, 1)],
  term ((-146 : Rat) / 31) [(10, 1), (15, 2), (16, 1)],
  term ((292 : Rat) / 31) [(10, 2), (14, 1), (16, 1)],
  term ((-904 : Rat) / 93) [(10, 2), (14, 2), (16, 1)],
  term ((-416 : Rat) / 31) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3325 : Rat) / 186) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-838 : Rat) / 31) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((574 : Rat) / 31) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((487 : Rat) / 186) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1529 : Rat) / 186) [(11, 1), (15, 1), (16, 1)],
  term ((-331 : Rat) / 62) [(11, 1), (15, 3), (16, 1)],
  term ((-487 : Rat) / 93) [(11, 2), (15, 2), (16, 1)],
  term ((208 : Rat) / 31) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3325 : Rat) / 372) [(12, 1), (14, 2), (16, 1)],
  term ((208 : Rat) / 31) [(12, 1), (14, 3), (16, 1)],
  term ((-3325 : Rat) / 372) [(12, 1), (15, 2), (16, 1)],
  term ((419 : Rat) / 31) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((419 : Rat) / 31) [(13, 1), (15, 3), (16, 1)],
  term ((-287 : Rat) / 31) [(14, 1), (15, 2), (16, 1)],
  term ((370 : Rat) / 93) [(14, 2), (15, 2), (16, 1)],
  term ((1529 : Rat) / 372) [(14, 2), (16, 1)],
  term ((-287 : Rat) / 31) [(14, 3), (16, 1)],
  term ((1529 : Rat) / 372) [(15, 2), (16, 1)],
  term ((370 : Rat) / 93) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 29. -/
theorem rs_R009_ueqv_R009NNNNY_block_24_0000_0029_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_24_0000_0029
      rs_R009_ueqv_R009NNNNY_block_24_0000_0029 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
