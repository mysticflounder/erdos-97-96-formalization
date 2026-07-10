/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 22:0-28

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0000 : Poly :=
[
  term ((104 : Rat) / 31) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 0 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0000 : Poly :=
[
  term ((-208 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0000
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0001 : Poly :=
[
  term ((-415 : Rat) / 124) [(0, 1), (16, 1)]
]

/-- Partial product 1 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0001 : Poly :=
[
  term ((415 : Rat) / 62) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((-415 : Rat) / 124) [(0, 1), (1, 2), (16, 1)],
  term ((415 : Rat) / 62) [(0, 2), (10, 1), (16, 1)],
  term ((-415 : Rat) / 124) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0001
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0002 : Poly :=
[
  term ((-158 : Rat) / 93) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 2 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0002 : Poly :=
[
  term ((316 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((316 : Rat) / 93) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-158 : Rat) / 93) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0002
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0003 : Poly :=
[
  term ((76 : Rat) / 93) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0003 : Poly :=
[
  term ((-152 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((76 : Rat) / 93) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-152 : Rat) / 93) [(1, 2), (11, 2), (16, 1)],
  term ((76 : Rat) / 93) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0003
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0004 : Poly :=
[
  term ((104 : Rat) / 31) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0004 : Poly :=
[
  term ((-208 : Rat) / 31) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((104 : Rat) / 31) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0004
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0005 : Poly :=
[
  term ((431 : Rat) / 186) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0005 : Poly :=
[
  term ((-431 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((431 : Rat) / 186) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-431 : Rat) / 93) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((431 : Rat) / 186) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0005
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0006 : Poly :=
[
  term ((-104 : Rat) / 31) [(1, 2), (16, 1)]
]

/-- Partial product 6 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0006 : Poly :=
[
  term ((208 : Rat) / 31) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(0, 2), (1, 2), (16, 1)],
  term ((208 : Rat) / 31) [(1, 3), (11, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0006
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0007 : Poly :=
[
  term ((-170 : Rat) / 93) [(2, 1), (16, 1)]
]

/-- Partial product 7 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0007 : Poly :=
[
  term ((340 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-170 : Rat) / 93) [(0, 2), (2, 1), (16, 1)],
  term ((340 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-170 : Rat) / 93) [(1, 2), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0007
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0008 : Poly :=
[
  term ((442 : Rat) / 93) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 8 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0008 : Poly :=
[
  term ((-884 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0008
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0009 : Poly :=
[
  term ((221 : Rat) / 186) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 9 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0009 : Poly :=
[
  term ((-221 : Rat) / 93) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((221 : Rat) / 186) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((221 : Rat) / 186) [(1, 2), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0009
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0010 : Poly :=
[
  term ((-443 : Rat) / 186) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0010 : Poly :=
[
  term ((443 : Rat) / 93) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 186) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((443 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-443 : Rat) / 186) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0010
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0011 : Poly :=
[
  term ((-442 : Rat) / 93) [(3, 2), (16, 1)]
]

/-- Partial product 11 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0011 : Poly :=
[
  term ((884 : Rat) / 93) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (3, 2), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0011
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0012 : Poly :=
[
  term ((-256 : Rat) / 93) [(4, 1), (16, 1)]
]

/-- Partial product 12 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0012 : Poly :=
[
  term ((512 : Rat) / 93) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-256 : Rat) / 93) [(0, 2), (4, 1), (16, 1)],
  term ((512 : Rat) / 93) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-256 : Rat) / 93) [(1, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0012
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0013 : Poly :=
[
  term ((4 : Rat) / 93) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 13 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0013 : Poly :=
[
  term ((-8 : Rat) / 93) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((4 : Rat) / 93) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((4 : Rat) / 93) [(1, 2), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0013
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0014 : Poly :=
[
  term ((182 : Rat) / 93) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 14 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0014 : Poly :=
[
  term ((-364 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0014
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0015 : Poly :=
[
  term ((-2 : Rat) / 3) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0015 : Poly :=
[
  term ((4 : Rat) / 3) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0015
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0016 : Poly :=
[
  term ((-1211 : Rat) / 93) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0016 : Poly :=
[
  term ((2422 : Rat) / 93) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1211 : Rat) / 93) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((2422 : Rat) / 93) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1211 : Rat) / 93) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0016
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0017 : Poly :=
[
  term ((-361 : Rat) / 186) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0017 : Poly :=
[
  term ((361 : Rat) / 93) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-361 : Rat) / 186) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((361 : Rat) / 93) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-361 : Rat) / 186) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0017
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0018 : Poly :=
[
  term ((-437 : Rat) / 186) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0018 : Poly :=
[
  term ((437 : Rat) / 93) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((437 : Rat) / 93) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0018
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0019 : Poly :=
[
  term ((1723 : Rat) / 186) [(8, 1), (16, 1)]
]

/-- Partial product 19 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0019 : Poly :=
[
  term ((-1723 : Rat) / 93) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((1723 : Rat) / 186) [(0, 2), (8, 1), (16, 1)],
  term ((-1723 : Rat) / 93) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((1723 : Rat) / 186) [(1, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0019
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0020 : Poly :=
[
  term ((116 : Rat) / 93) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 20 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0020 : Poly :=
[
  term ((-232 : Rat) / 93) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((116 : Rat) / 93) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((116 : Rat) / 93) [(1, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0020
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0021 : Poly :=
[
  term ((-44 : Rat) / 93) [(10, 1), (16, 1)]
]

/-- Partial product 21 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0021 : Poly :=
[
  term ((88 : Rat) / 93) [(0, 1), (10, 2), (16, 1)],
  term ((-44 : Rat) / 93) [(0, 2), (10, 1), (16, 1)],
  term ((88 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-44 : Rat) / 93) [(1, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0021
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0022 : Poly :=
[
  term ((-91 : Rat) / 93) [(10, 2), (16, 1)]
]

/-- Partial product 22 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0022 : Poly :=
[
  term ((182 : Rat) / 93) [(0, 1), (10, 3), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 2), (10, 2), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(1, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0022
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0023 : Poly :=
[
  term ((85 : Rat) / 62) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0023 : Poly :=
[
  term ((-85 : Rat) / 31) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 62) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 31) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((85 : Rat) / 62) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0023
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0024 : Poly :=
[
  term ((-91 : Rat) / 93) [(11, 2), (16, 1)]
]

/-- Partial product 24 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0024 : Poly :=
[
  term ((182 : Rat) / 93) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 2), (11, 2), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (11, 3), (16, 1)],
  term ((-91 : Rat) / 93) [(1, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0024
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0025 : Poly :=
[
  term ((-1119 : Rat) / 124) [(12, 1), (16, 1)]
]

/-- Partial product 25 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0025 : Poly :=
[
  term ((1119 : Rat) / 62) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1119 : Rat) / 124) [(0, 2), (12, 1), (16, 1)],
  term ((1119 : Rat) / 62) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1119 : Rat) / 124) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0025
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0026 : Poly :=
[
  term ((1273 : Rat) / 93) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0026 : Poly :=
[
  term ((-2546 : Rat) / 93) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1273 : Rat) / 93) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2546 : Rat) / 93) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1273 : Rat) / 93) [(1, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0026
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0027 : Poly :=
[
  term ((99 : Rat) / 31) [(15, 2), (16, 1)]
]

/-- Partial product 27 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0027 : Poly :=
[
  term ((-198 : Rat) / 31) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((99 : Rat) / 31) [(0, 2), (15, 2), (16, 1)],
  term ((-198 : Rat) / 31) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((99 : Rat) / 31) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0027
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 22. -/
def rs_R009_ueqv_R009NNNNY_coefficient_22_0028 : Poly :=
[
  term ((296 : Rat) / 93) [(16, 1)]
]

/-- Partial product 28 for generator 22. -/
def rs_R009_ueqv_R009NNNNY_partial_22_0028 : Poly :=
[
  term ((-592 : Rat) / 93) [(0, 1), (10, 1), (16, 1)],
  term ((296 : Rat) / 93) [(0, 2), (16, 1)],
  term ((-592 : Rat) / 93) [(1, 1), (11, 1), (16, 1)],
  term ((296 : Rat) / 93) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 22. -/
theorem rs_R009_ueqv_R009NNNNY_partial_22_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_22_0028
        rs_R009_ueqv_R009NNNNY_generator_22_0000_0028 =
      rs_R009_ueqv_R009NNNNY_partial_22_0028 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_22_0000_0028 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_22_0000,
  rs_R009_ueqv_R009NNNNY_partial_22_0001,
  rs_R009_ueqv_R009NNNNY_partial_22_0002,
  rs_R009_ueqv_R009NNNNY_partial_22_0003,
  rs_R009_ueqv_R009NNNNY_partial_22_0004,
  rs_R009_ueqv_R009NNNNY_partial_22_0005,
  rs_R009_ueqv_R009NNNNY_partial_22_0006,
  rs_R009_ueqv_R009NNNNY_partial_22_0007,
  rs_R009_ueqv_R009NNNNY_partial_22_0008,
  rs_R009_ueqv_R009NNNNY_partial_22_0009,
  rs_R009_ueqv_R009NNNNY_partial_22_0010,
  rs_R009_ueqv_R009NNNNY_partial_22_0011,
  rs_R009_ueqv_R009NNNNY_partial_22_0012,
  rs_R009_ueqv_R009NNNNY_partial_22_0013,
  rs_R009_ueqv_R009NNNNY_partial_22_0014,
  rs_R009_ueqv_R009NNNNY_partial_22_0015,
  rs_R009_ueqv_R009NNNNY_partial_22_0016,
  rs_R009_ueqv_R009NNNNY_partial_22_0017,
  rs_R009_ueqv_R009NNNNY_partial_22_0018,
  rs_R009_ueqv_R009NNNNY_partial_22_0019,
  rs_R009_ueqv_R009NNNNY_partial_22_0020,
  rs_R009_ueqv_R009NNNNY_partial_22_0021,
  rs_R009_ueqv_R009NNNNY_partial_22_0022,
  rs_R009_ueqv_R009NNNNY_partial_22_0023,
  rs_R009_ueqv_R009NNNNY_partial_22_0024,
  rs_R009_ueqv_R009NNNNY_partial_22_0025,
  rs_R009_ueqv_R009NNNNY_partial_22_0026,
  rs_R009_ueqv_R009NNNNY_partial_22_0027,
  rs_R009_ueqv_R009NNNNY_partial_22_0028
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_22_0000_0028 : Poly :=
[
  term ((316 : Rat) / 93) [(0, 1), (1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-152 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-431 : Rat) / 93) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 1), (1, 1), (11, 1), (12, 1), (16, 1)],
  term ((415 : Rat) / 62) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((208 : Rat) / 31) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-415 : Rat) / 124) [(0, 1), (1, 2), (16, 1)],
  term ((340 : Rat) / 93) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(0, 1), (3, 1), (7, 1), (10, 1), (16, 1)],
  term ((443 : Rat) / 93) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((884 : Rat) / 93) [(0, 1), (3, 2), (10, 1), (16, 1)],
  term ((512 : Rat) / 93) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(0, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((4 : Rat) / 3) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((2422 : Rat) / 93) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 93) [(0, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((437 : Rat) / 93) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1723 : Rat) / 93) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-85 : Rat) / 31) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((1119 : Rat) / 62) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2546 : Rat) / 93) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198 : Rat) / 31) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-592 : Rat) / 93) [(0, 1), (10, 1), (16, 1)],
  term ((88 : Rat) / 93) [(0, 1), (10, 2), (16, 1)],
  term ((182 : Rat) / 93) [(0, 1), (10, 3), (16, 1)],
  term ((-158 : Rat) / 93) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((76 : Rat) / 93) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((104 : Rat) / 31) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((431 : Rat) / 186) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(0, 2), (1, 2), (16, 1)],
  term ((-170 : Rat) / 93) [(0, 2), (2, 1), (16, 1)],
  term ((442 : Rat) / 93) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((221 : Rat) / 186) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-443 : Rat) / 186) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(0, 2), (3, 2), (16, 1)],
  term ((-256 : Rat) / 93) [(0, 2), (4, 1), (16, 1)],
  term ((4 : Rat) / 93) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((182 : Rat) / 93) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1211 : Rat) / 93) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 186) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((1723 : Rat) / 186) [(0, 2), (8, 1), (16, 1)],
  term ((116 : Rat) / 93) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-208 : Rat) / 31) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((1157 : Rat) / 186) [(0, 2), (10, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 2), (10, 2), (16, 1)],
  term ((85 : Rat) / 62) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(0, 2), (11, 2), (16, 1)],
  term ((-1119 : Rat) / 124) [(0, 2), (12, 1), (16, 1)],
  term ((1273 : Rat) / 93) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 31) [(0, 2), (15, 2), (16, 1)],
  term ((296 : Rat) / 93) [(0, 2), (16, 1)],
  term ((104 : Rat) / 31) [(0, 3), (12, 1), (16, 1)],
  term ((-415 : Rat) / 124) [(0, 3), (16, 1)],
  term ((340 : Rat) / 93) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-884 : Rat) / 93) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-221 : Rat) / 93) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((443 : Rat) / 93) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((884 : Rat) / 93) [(1, 1), (3, 2), (11, 1), (16, 1)],
  term ((512 : Rat) / 93) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-8 : Rat) / 93) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-364 : Rat) / 93) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((2422 : Rat) / 93) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((437 : Rat) / 93) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((361 : Rat) / 93) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-1723 : Rat) / 93) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-232 : Rat) / 93) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((88 : Rat) / 93) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((1119 : Rat) / 62) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2546 : Rat) / 93) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198 : Rat) / 31) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-592 : Rat) / 93) [(1, 1), (11, 1), (16, 1)],
  term ((-85 : Rat) / 31) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 1), (11, 3), (16, 1)],
  term ((-170 : Rat) / 93) [(1, 2), (2, 1), (16, 1)],
  term ((442 : Rat) / 93) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((221 : Rat) / 186) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((316 : Rat) / 93) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-443 : Rat) / 186) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-442 : Rat) / 93) [(1, 2), (3, 2), (16, 1)],
  term ((-256 : Rat) / 93) [(1, 2), (4, 1), (16, 1)],
  term ((4 : Rat) / 93) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((182 : Rat) / 93) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1211 : Rat) / 93) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 186) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-437 : Rat) / 186) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((1723 : Rat) / 186) [(1, 2), (8, 1), (16, 1)],
  term ((116 : Rat) / 93) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-44 : Rat) / 93) [(1, 2), (10, 1), (16, 1)],
  term ((-91 : Rat) / 93) [(1, 2), (10, 2), (16, 1)],
  term ((-208 : Rat) / 31) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-607 : Rat) / 186) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-81 : Rat) / 31) [(1, 2), (11, 2), (16, 1)],
  term ((-1119 : Rat) / 124) [(1, 2), (12, 1), (16, 1)],
  term ((1273 : Rat) / 93) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 31) [(1, 2), (15, 2), (16, 1)],
  term ((296 : Rat) / 93) [(1, 2), (16, 1)],
  term ((-158 : Rat) / 93) [(1, 3), (3, 1), (16, 1)],
  term ((700 : Rat) / 93) [(1, 3), (11, 1), (16, 1)],
  term ((104 : Rat) / 31) [(1, 3), (13, 1), (16, 1)],
  term ((431 : Rat) / 186) [(1, 3), (15, 1), (16, 1)],
  term ((-104 : Rat) / 31) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 28. -/
theorem rs_R009_ueqv_R009NNNNY_block_22_0000_0028_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_22_0000_0028
      rs_R009_ueqv_R009NNNNY_block_22_0000_0028 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
