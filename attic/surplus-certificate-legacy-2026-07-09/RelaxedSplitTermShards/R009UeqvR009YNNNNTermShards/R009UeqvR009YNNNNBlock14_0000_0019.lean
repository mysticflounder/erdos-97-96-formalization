/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 14:0-19

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0000 : Poly :=
[
  term ((-160 : Rat) / 21) []
]

/-- Partial product 0 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0000 : Poly :=
[
  term ((-320 : Rat) / 21) [(4, 1), (6, 1)],
  term ((-320 : Rat) / 21) [(5, 1), (7, 1)],
  term ((160 : Rat) / 21) [(6, 2)],
  term ((160 : Rat) / 21) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0000
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0001 : Poly :=
[
  term ((160 : Rat) / 21) [(2, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0001 : Poly :=
[
  term ((320 : Rat) / 21) [(2, 1), (4, 1), (6, 1)],
  term ((320 : Rat) / 21) [(2, 1), (5, 1), (7, 1)],
  term ((-160 : Rat) / 21) [(2, 1), (6, 2)],
  term ((-160 : Rat) / 21) [(2, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0001
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0002 : Poly :=
[
  term ((-80 : Rat) / 7) [(2, 1), (14, 1)]
]

/-- Partial product 2 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0002 : Poly :=
[
  term ((-160 : Rat) / 7) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((-160 : Rat) / 7) [(2, 1), (5, 1), (7, 1), (14, 1)],
  term ((80 : Rat) / 7) [(2, 1), (6, 2), (14, 1)],
  term ((80 : Rat) / 7) [(2, 1), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0002
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0003 : Poly :=
[
  term ((-24320 : Rat) / 343) [(2, 1), (15, 2)]
]

/-- Partial product 3 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0003 : Poly :=
[
  term ((-48640 : Rat) / 343) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((24320 : Rat) / 343) [(2, 1), (6, 2), (15, 2)],
  term ((24320 : Rat) / 343) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0003
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0004 : Poly :=
[
  term ((-320 : Rat) / 21) [(3, 1), (9, 1)]
]

/-- Partial product 4 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0004 : Poly :=
[
  term ((-640 : Rat) / 21) [(3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((320 : Rat) / 21) [(3, 1), (6, 2), (9, 1)],
  term ((320 : Rat) / 21) [(3, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0004
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0005 : Poly :=
[
  term ((160 : Rat) / 7) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 5 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0005 : Poly :=
[
  term ((320 : Rat) / 7) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (7, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0005_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0005
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0006 : Poly :=
[
  term ((48640 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 6 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0006 : Poly :=
[
  term ((97280 : Rat) / 343) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(3, 1), (6, 2), (9, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(3, 1), (7, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0006_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0006
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0007 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 1), (13, 1)]
]

/-- Partial product 7 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0007 : Poly :=
[
  term ((1280 : Rat) / 21) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((1280 : Rat) / 21) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (6, 2), (13, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0007_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0007
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0008 : Poly :=
[
  term ((-320 : Rat) / 7) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 8 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0008 : Poly :=
[
  term ((-640 : Rat) / 7) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((320 : Rat) / 7) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((320 : Rat) / 7) [(3, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0008_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0008
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0009 : Poly :=
[
  term ((-97280 : Rat) / 343) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 9 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0009 : Poly :=
[
  term ((-194560 : Rat) / 343) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0009_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0009
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0010 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1)]
]

/-- Partial product 10 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0010 : Poly :=
[
  term ((-1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 2)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(5, 1), (6, 1), (7, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1), (7, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0010_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0010
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0011 : Poly :=
[
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1), (10, 1)]
]

/-- Partial product 11 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0011 : Poly :=
[
  term ((1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 2), (10, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(5, 1), (6, 1), (7, 1), (10, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (7, 2), (10, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0011_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0011
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0012 : Poly :=
[
  term ((1994038900525423 : Rat) / 17406427571064) [(7, 1), (11, 1)]
]

/-- Partial product 12 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0012 : Poly :=
[
  term ((1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(5, 1), (7, 2), (11, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 2), (7, 1), (11, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0012_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0012
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0013 : Poly :=
[
  term ((4 : Rat) / 3) [(9, 1), (15, 1)]
]

/-- Partial product 13 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0013 : Poly :=
[
  term ((8 : Rat) / 3) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((8 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(6, 2), (9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0013_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0013
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0014 : Poly :=
[
  term ((-2 : Rat) / 3) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0014 : Poly :=
[
  term ((-4 : Rat) / 3) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0014_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0014
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0015 : Poly :=
[
  term ((-8 : Rat) / 3) [(13, 1), (15, 1)]
]

/-- Partial product 15 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0015 : Poly :=
[
  term ((-16 : Rat) / 3) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(6, 2), (13, 1), (15, 1)],
  term ((8 : Rat) / 3) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0015_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0015
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0016 : Poly :=
[
  term ((2 : Rat) / 3) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0016 : Poly :=
[
  term ((4 : Rat) / 3) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0016_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0016
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0017 : Poly :=
[
  term ((2192969501337583 : Rat) / 17406427571064) [(14, 1)]
]

/-- Partial product 17 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0017 : Poly :=
[
  term ((2192969501337583 : Rat) / 8703213785532) [(4, 1), (6, 1), (14, 1)],
  term ((2192969501337583 : Rat) / 8703213785532) [(5, 1), (7, 1), (14, 1)],
  term ((-2192969501337583 : Rat) / 17406427571064) [(6, 2), (14, 1)],
  term ((-2192969501337583 : Rat) / 17406427571064) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0017_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0017
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0018 : Poly :=
[
  term ((-1994038900525423 : Rat) / 34812855142128) [(14, 2)]
]

/-- Partial product 18 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0018 : Poly :=
[
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1), (6, 1), (14, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(5, 1), (7, 1), (14, 2)],
  term ((1994038900525423 : Rat) / 34812855142128) [(6, 2), (14, 2)],
  term ((1994038900525423 : Rat) / 34812855142128) [(7, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0018_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0018
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009YNNNN_coefficient_14_0019 : Poly :=
[
  term ((474324472817297 : Rat) / 34812855142128) [(15, 2)]
]

/-- Partial product 19 for generator 14. -/
def rs_R009_ueqv_R009YNNNN_partial_14_0019 : Poly :=
[
  term ((474324472817297 : Rat) / 17406427571064) [(4, 1), (6, 1), (15, 2)],
  term ((474324472817297 : Rat) / 17406427571064) [(5, 1), (7, 1), (15, 2)],
  term ((-474324472817297 : Rat) / 34812855142128) [(6, 2), (15, 2)],
  term ((-474324472817297 : Rat) / 34812855142128) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 14. -/
theorem rs_R009_ueqv_R009YNNNN_partial_14_0019_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_14_0019
        rs_R009_ueqv_R009YNNNN_generator_14_0000_0019 =
      rs_R009_ueqv_R009YNNNN_partial_14_0019 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_14_0000_0019 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_14_0000,
  rs_R009_ueqv_R009YNNNN_partial_14_0001,
  rs_R009_ueqv_R009YNNNN_partial_14_0002,
  rs_R009_ueqv_R009YNNNN_partial_14_0003,
  rs_R009_ueqv_R009YNNNN_partial_14_0004,
  rs_R009_ueqv_R009YNNNN_partial_14_0005,
  rs_R009_ueqv_R009YNNNN_partial_14_0006,
  rs_R009_ueqv_R009YNNNN_partial_14_0007,
  rs_R009_ueqv_R009YNNNN_partial_14_0008,
  rs_R009_ueqv_R009YNNNN_partial_14_0009,
  rs_R009_ueqv_R009YNNNN_partial_14_0010,
  rs_R009_ueqv_R009YNNNN_partial_14_0011,
  rs_R009_ueqv_R009YNNNN_partial_14_0012,
  rs_R009_ueqv_R009YNNNN_partial_14_0013,
  rs_R009_ueqv_R009YNNNN_partial_14_0014,
  rs_R009_ueqv_R009YNNNN_partial_14_0015,
  rs_R009_ueqv_R009YNNNN_partial_14_0016,
  rs_R009_ueqv_R009YNNNN_partial_14_0017,
  rs_R009_ueqv_R009YNNNN_partial_14_0018,
  rs_R009_ueqv_R009YNNNN_partial_14_0019
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_14_0000_0019 : Poly :=
[
  term ((320 : Rat) / 21) [(2, 1), (4, 1), (6, 1)],
  term ((-160 : Rat) / 7) [(2, 1), (4, 1), (6, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((320 : Rat) / 21) [(2, 1), (5, 1), (7, 1)],
  term ((-160 : Rat) / 7) [(2, 1), (5, 1), (7, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((-160 : Rat) / 21) [(2, 1), (6, 2)],
  term ((80 : Rat) / 7) [(2, 1), (6, 2), (14, 1)],
  term ((24320 : Rat) / 343) [(2, 1), (6, 2), (15, 2)],
  term ((-160 : Rat) / 21) [(2, 1), (7, 2)],
  term ((80 : Rat) / 7) [(2, 1), (7, 2), (14, 1)],
  term ((24320 : Rat) / 343) [(2, 1), (7, 2), (15, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (4, 1), (6, 1), (9, 1)],
  term ((320 : Rat) / 7) [(3, 1), (4, 1), (6, 1), (9, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2)],
  term ((1280 : Rat) / 21) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (4, 1), (6, 1), (13, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((1280 : Rat) / 21) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((320 : Rat) / 21) [(3, 1), (6, 2), (9, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (6, 2), (9, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(3, 1), (6, 2), (9, 1), (15, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (6, 2), (13, 1)],
  term ((320 : Rat) / 7) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(3, 1), (6, 2), (13, 1), (15, 2)],
  term ((320 : Rat) / 21) [(3, 1), (7, 2), (9, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (7, 2), (9, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(3, 1), (7, 2), (9, 1), (15, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (7, 2), (13, 1)],
  term ((320 : Rat) / 7) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((-320 : Rat) / 21) [(4, 1), (6, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((8 : Rat) / 3) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2192969501337583 : Rat) / 8703213785532) [(4, 1), (6, 1), (14, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1), (6, 1), (14, 2)],
  term ((474324472817297 : Rat) / 17406427571064) [(4, 1), (6, 1), (15, 2)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 2)],
  term ((1994038900525423 : Rat) / 8703213785532) [(4, 1), (6, 2), (10, 1)],
  term ((-1994038900525423 : Rat) / 8703213785532) [(5, 1), (6, 1), (7, 1)],
  term ((1994038900525423 : Rat) / 8703213785532) [(5, 1), (6, 1), (7, 1), (10, 1)],
  term ((-320 : Rat) / 21) [(5, 1), (7, 1)],
  term ((8 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((4 : Rat) / 3) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2192969501337583 : Rat) / 8703213785532) [(5, 1), (7, 1), (14, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(5, 1), (7, 1), (14, 2)],
  term ((474324472817297 : Rat) / 17406427571064) [(5, 1), (7, 1), (15, 2)],
  term ((1994038900525423 : Rat) / 8703213785532) [(5, 1), (7, 2), (11, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 1), (7, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 1), (7, 2), (10, 1)],
  term ((160 : Rat) / 21) [(6, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 2), (7, 1), (11, 1)],
  term ((-4 : Rat) / 3) [(6, 2), (9, 1), (15, 1)],
  term ((2 : Rat) / 3) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(6, 2), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2192969501337583 : Rat) / 17406427571064) [(6, 2), (14, 1)],
  term ((1994038900525423 : Rat) / 34812855142128) [(6, 2), (14, 2)],
  term ((-474324472817297 : Rat) / 34812855142128) [(6, 2), (15, 2)],
  term ((1994038900525423 : Rat) / 17406427571064) [(6, 3)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(6, 3), (10, 1)],
  term ((160 : Rat) / 21) [(7, 2)],
  term ((-4 : Rat) / 3) [(7, 2), (9, 1), (15, 1)],
  term ((2 : Rat) / 3) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(7, 2), (13, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2192969501337583 : Rat) / 17406427571064) [(7, 2), (14, 1)],
  term ((1994038900525423 : Rat) / 34812855142128) [(7, 2), (14, 2)],
  term ((-474324472817297 : Rat) / 34812855142128) [(7, 2), (15, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 19. -/
theorem rs_R009_ueqv_R009YNNNN_block_14_0000_0019_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_14_0000_0019
      rs_R009_ueqv_R009YNNNN_block_14_0000_0019 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
