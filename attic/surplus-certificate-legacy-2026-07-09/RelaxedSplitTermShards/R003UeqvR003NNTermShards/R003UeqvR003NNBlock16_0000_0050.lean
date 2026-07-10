/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 16:0-50

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_16_0000_0050 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0000 : Poly :=
[
  term ((111 : Rat) / 4) []
]

/-- Partial product 0 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0000 : Poly :=
[
  term ((-111 : Rat) / 4) [],
  term ((-111 : Rat) / 2) [(0, 1), (6, 1)],
  term ((111 : Rat) / 4) [(0, 2)],
  term ((-111 : Rat) / 2) [(1, 1), (7, 1)],
  term ((111 : Rat) / 4) [(1, 2)],
  term ((111 : Rat) / 2) [(6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0000
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0001 : Poly :=
[
  term (12 : Rat) [(0, 1)]
]

/-- Partial product 1 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0001 : Poly :=
[
  term (-12 : Rat) [(0, 1)],
  term (-24 : Rat) [(0, 1), (1, 1), (7, 1)],
  term (12 : Rat) [(0, 1), (1, 2)],
  term (24 : Rat) [(0, 1), (6, 1)],
  term (-24 : Rat) [(0, 2), (6, 1)],
  term (12 : Rat) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0001
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0002 : Poly :=
[
  term ((-3428 : Rat) / 134037) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0002 : Poly :=
[
  term ((6856 : Rat) / 134037) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 3), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0002
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0003 : Poly :=
[
  term ((65983 : Rat) / 268074) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0003 : Poly :=
[
  term ((-65983 : Rat) / 134037) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((65983 : Rat) / 268074) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((65983 : Rat) / 134037) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65983 : Rat) / 268074) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65983 : Rat) / 134037) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((65983 : Rat) / 268074) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0003
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0004 : Poly :=
[
  term ((-59705 : Rat) / 89358) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 4 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0004 : Poly :=
[
  term ((59705 : Rat) / 44679) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-59705 : Rat) / 89358) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-59705 : Rat) / 44679) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((59705 : Rat) / 89358) [(0, 1), (15, 2), (16, 1)],
  term ((59705 : Rat) / 44679) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-59705 : Rat) / 89358) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0004
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0005 : Poly :=
[
  term ((3428 : Rat) / 134037) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0005 : Poly :=
[
  term ((-6856 : Rat) / 134037) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0005
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0006 : Poly :=
[
  term ((41135 : Rat) / 44679) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0006 : Poly :=
[
  term ((-82270 : Rat) / 44679) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 44679) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((82270 : Rat) / 44679) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 44679) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-82270 : Rat) / 44679) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 44679) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0006
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0007 : Poly :=
[
  term ((-128837 : Rat) / 178716) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0007 : Poly :=
[
  term ((128837 : Rat) / 89358) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-128837 : Rat) / 178716) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-128837 : Rat) / 89358) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((128837 : Rat) / 178716) [(1, 1), (15, 1), (16, 1)],
  term ((128837 : Rat) / 89358) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-128837 : Rat) / 178716) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0007
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0008 : Poly :=
[
  term ((199667 : Rat) / 268074) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0008 : Poly :=
[
  term ((-199667 : Rat) / 134037) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0008_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0008
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0009 : Poly :=
[
  term ((-1714 : Rat) / 44679) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0009 : Poly :=
[
  term ((3428 : Rat) / 44679) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0009_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0009
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0010 : Poly :=
[
  term ((-285359 : Rat) / 268074) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0010 : Poly :=
[
  term ((285359 : Rat) / 134037) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-285359 : Rat) / 268074) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((285359 : Rat) / 134037) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-285359 : Rat) / 268074) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-285359 : Rat) / 134037) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((285359 : Rat) / 268074) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0010_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0010
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0011 : Poly :=
[
  term ((-10567 : Rat) / 59572) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0011 : Poly :=
[
  term ((10567 : Rat) / 29786) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-10567 : Rat) / 59572) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((10567 : Rat) / 29786) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-10567 : Rat) / 59572) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-10567 : Rat) / 29786) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((10567 : Rat) / 59572) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0011_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0011
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0012 : Poly :=
[
  term ((-33421 : Rat) / 89358) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0012 : Poly :=
[
  term ((33421 : Rat) / 44679) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 89358) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-33421 : Rat) / 44679) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0012_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0012
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0013 : Poly :=
[
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0013 : Poly :=
[
  term ((-198808 : Rat) / 134037) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0013_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0013
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0014 : Poly :=
[
  term ((1714 : Rat) / 44679) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0014 : Poly :=
[
  term ((-3428 : Rat) / 44679) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0014_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0014
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0015 : Poly :=
[
  term ((3428 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0015 : Poly :=
[
  term ((-6856 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0015_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0015
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0016 : Poly :=
[
  term ((-3428 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 16 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0016 : Poly :=
[
  term ((6856 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0016_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0016
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0017 : Poly :=
[
  term ((193675 : Rat) / 134037) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0017 : Poly :=
[
  term ((-387350 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((193675 : Rat) / 134037) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-387350 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((193675 : Rat) / 134037) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((387350 : Rat) / 134037) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-193675 : Rat) / 134037) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0017_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0017
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0018 : Poly :=
[
  term ((-99404 : Rat) / 134037) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 18 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0018 : Poly :=
[
  term ((198808 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-99404 : Rat) / 134037) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((198808 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-99404 : Rat) / 134037) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-198808 : Rat) / 134037) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0018_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0018
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0019 : Poly :=
[
  term ((-359107 : Rat) / 1072296) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0019 : Poly :=
[
  term ((359107 : Rat) / 536148) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-359107 : Rat) / 1072296) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((359107 : Rat) / 536148) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-359107 : Rat) / 1072296) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-359107 : Rat) / 536148) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((359107 : Rat) / 1072296) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0019_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0019
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0020 : Poly :=
[
  term ((1714 : Rat) / 44679) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 20 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0020 : Poly :=
[
  term ((-3428 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((1714 : Rat) / 44679) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((1714 : Rat) / 44679) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-1714 : Rat) / 44679) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0020_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0020
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0021 : Poly :=
[
  term ((-29993 : Rat) / 134037) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0021 : Poly :=
[
  term ((59986 : Rat) / 134037) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0021_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0021
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0022 : Poly :=
[
  term ((-19709 : Rat) / 134037) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0022 : Poly :=
[
  term ((39418 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 134037) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((39418 : Rat) / 134037) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 134037) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-39418 : Rat) / 134037) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 134037) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0022_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0022
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0023 : Poly :=
[
  term ((26565 : Rat) / 29786) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0023 : Poly :=
[
  term ((-26565 : Rat) / 14893) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((26565 : Rat) / 29786) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26565 : Rat) / 14893) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((26565 : Rat) / 29786) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((26565 : Rat) / 14893) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-26565 : Rat) / 29786) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0023_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0023
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0024 : Poly :=
[
  term ((-49702 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0024 : Poly :=
[
  term ((99404 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-99404 : Rat) / 134037) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((49702 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0024_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0024
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0025 : Poly :=
[
  term ((24851 : Rat) / 134037) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0025 : Poly :=
[
  term ((-49702 : Rat) / 134037) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 134037) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0025_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0025
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0026 : Poly :=
[
  term ((3428 : Rat) / 44679) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0026 : Poly :=
[
  term ((-6856 : Rat) / 44679) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0026_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0026
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0027 : Poly :=
[
  term ((-70270 : Rat) / 134037) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0027 : Poly :=
[
  term ((140540 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70270 : Rat) / 134037) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((140540 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70270 : Rat) / 134037) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-140540 : Rat) / 134037) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((70270 : Rat) / 134037) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0027_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0027
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0028 : Poly :=
[
  term ((-49702 : Rat) / 134037) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 28 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0028 : Poly :=
[
  term ((99404 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-99404 : Rat) / 134037) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0028_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0028
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0029 : Poly :=
[
  term ((-5427 : Rat) / 59572) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0029 : Poly :=
[
  term ((5427 : Rat) / 29786) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-5427 : Rat) / 59572) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((5427 : Rat) / 29786) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5427 : Rat) / 59572) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-5427 : Rat) / 29786) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((5427 : Rat) / 59572) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0029_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0029
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0030 : Poly :=
[
  term ((-59986 : Rat) / 134037) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0030 : Poly :=
[
  term ((119972 : Rat) / 134037) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(0, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(1, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-119972 : Rat) / 134037) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0030_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0030
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0031 : Poly :=
[
  term (6 : Rat) [(6, 1)]
]

/-- Partial product 31 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0031 : Poly :=
[
  term (-12 : Rat) [(0, 1), (6, 2)],
  term (6 : Rat) [(0, 2), (6, 1)],
  term (-12 : Rat) [(1, 1), (6, 1), (7, 1)],
  term (6 : Rat) [(1, 2), (6, 1)],
  term (-6 : Rat) [(6, 1)],
  term (12 : Rat) [(6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0031_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0031
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0032 : Poly :=
[
  term ((-35135 : Rat) / 134037) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0032 : Poly :=
[
  term ((70270 : Rat) / 134037) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35135 : Rat) / 134037) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((70270 : Rat) / 134037) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35135 : Rat) / 134037) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((35135 : Rat) / 134037) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70270 : Rat) / 134037) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0032_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0032
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0033 : Poly :=
[
  term ((59564 : Rat) / 134037) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 33 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0033 : Poly :=
[
  term ((-119128 : Rat) / 134037) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((59564 : Rat) / 134037) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-119128 : Rat) / 134037) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((59564 : Rat) / 134037) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-59564 : Rat) / 134037) [(6, 1), (15, 2), (16, 1)],
  term ((119128 : Rat) / 134037) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0033_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0033
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0034 : Poly :=
[
  term ((-41135 : Rat) / 89358) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0034 : Poly :=
[
  term ((41135 : Rat) / 44679) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 89358) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 44679) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 89358) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 44679) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 89358) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0034_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0034
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0035 : Poly :=
[
  term ((-3428 : Rat) / 44679) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 35 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0035 : Poly :=
[
  term ((6856 : Rat) / 44679) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0035_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0035
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0036 : Poly :=
[
  term (12 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 36 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0036 : Poly :=
[
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (15, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (15, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (15, 1)],
  term (24 : Rat) [(6, 1), (7, 1), (15, 1)],
  term (-12 : Rat) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0036_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0036
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0037 : Poly :=
[
  term ((21421 : Rat) / 178716) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0037 : Poly :=
[
  term ((-21421 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((21421 : Rat) / 178716) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-21421 : Rat) / 89358) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((21421 : Rat) / 178716) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((21421 : Rat) / 89358) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-21421 : Rat) / 178716) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0037_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0037
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0038 : Poly :=
[
  term (-24 : Rat) [(8, 1)]
]

/-- Partial product 38 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0038 : Poly :=
[
  term (48 : Rat) [(0, 1), (6, 1), (8, 1)],
  term (-24 : Rat) [(0, 2), (8, 1)],
  term (48 : Rat) [(1, 1), (7, 1), (8, 1)],
  term (-24 : Rat) [(1, 2), (8, 1)],
  term (-48 : Rat) [(6, 1), (8, 1)],
  term (24 : Rat) [(8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0038_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0038
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0039 : Poly :=
[
  term ((-9564491 : Rat) / 2144592) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0039 : Poly :=
[
  term ((9564491 : Rat) / 1072296) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-9564491 : Rat) / 2144592) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((9564491 : Rat) / 1072296) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-9564491 : Rat) / 2144592) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-9564491 : Rat) / 1072296) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((9564491 : Rat) / 2144592) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0039_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0039
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0040 : Poly :=
[
  term ((-8720803 : Rat) / 6433776) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0040 : Poly :=
[
  term ((8720803 : Rat) / 3216888) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8720803 : Rat) / 6433776) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((8720803 : Rat) / 3216888) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8720803 : Rat) / 6433776) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8720803 : Rat) / 3216888) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((8720803 : Rat) / 6433776) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0040_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0040
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0041 : Poly :=
[
  term (24 : Rat) [(11, 1), (15, 1)]
]

/-- Partial product 41 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0041 : Poly :=
[
  term (-48 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term (24 : Rat) [(0, 2), (11, 1), (15, 1)],
  term (-48 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (24 : Rat) [(1, 2), (11, 1), (15, 1)],
  term (48 : Rat) [(6, 1), (11, 1), (15, 1)],
  term (-24 : Rat) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0041_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0041
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0042 : Poly :=
[
  term ((-12186391 : Rat) / 25735104) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0042 : Poly :=
[
  term ((12186391 : Rat) / 12867552) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12186391 : Rat) / 25735104) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((12186391 : Rat) / 12867552) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12186391 : Rat) / 25735104) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12186391 : Rat) / 12867552) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12186391 : Rat) / 25735104) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0042_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0042
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0043 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 43 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0043 : Poly :=
[
  term ((128807 : Rat) / 89358) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0043_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0043
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0044 : Poly :=
[
  term ((-66847 : Rat) / 134037) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0044 : Poly :=
[
  term ((133694 : Rat) / 134037) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((133694 : Rat) / 134037) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-133694 : Rat) / 134037) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((66847 : Rat) / 134037) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0044_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0044
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0045 : Poly :=
[
  term (162 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 45 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0045 : Poly :=
[
  term (-324 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term (162 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (-324 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (162 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (324 : Rat) [(6, 1), (13, 1), (15, 1)],
  term (-162 : Rat) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0045_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0045
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0046 : Poly :=
[
  term ((14306095 : Rat) / 25735104) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0046 : Poly :=
[
  term ((-14306095 : Rat) / 12867552) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((14306095 : Rat) / 25735104) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14306095 : Rat) / 12867552) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((14306095 : Rat) / 25735104) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((14306095 : Rat) / 12867552) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14306095 : Rat) / 25735104) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0046_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0046
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0047 : Poly :=
[
  term ((109688 : Rat) / 134037) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 47 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0047 : Poly :=
[
  term ((-219376 : Rat) / 134037) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((109688 : Rat) / 134037) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-219376 : Rat) / 134037) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((109688 : Rat) / 134037) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((219376 : Rat) / 134037) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-109688 : Rat) / 134037) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0047_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0047
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0048 : Poly :=
[
  term (-99 : Rat) [(15, 2)]
]

/-- Partial product 48 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0048 : Poly :=
[
  term (198 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (-99 : Rat) [(0, 2), (15, 2)],
  term (198 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (-99 : Rat) [(1, 2), (15, 2)],
  term (-198 : Rat) [(6, 1), (15, 2)],
  term (99 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0048_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0048
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0049 : Poly :=
[
  term ((13956281 : Rat) / 3216888) [(15, 2), (16, 1)]
]

/-- Partial product 49 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0049 : Poly :=
[
  term ((-13956281 : Rat) / 1608444) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((13956281 : Rat) / 3216888) [(0, 2), (15, 2), (16, 1)],
  term ((-13956281 : Rat) / 1608444) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((13956281 : Rat) / 3216888) [(1, 2), (15, 2), (16, 1)],
  term ((13956281 : Rat) / 1608444) [(6, 1), (15, 2), (16, 1)],
  term ((-13956281 : Rat) / 3216888) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0049_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0049
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 16. -/
def rs_R003_ueqv_R003NN_coefficient_16_0050 : Poly :=
[
  term ((128807 : Rat) / 357432) [(15, 4), (16, 1)]
]

/-- Partial product 50 for generator 16. -/
def rs_R003_ueqv_R003NN_partial_16_0050 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 357432) [(0, 2), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 357432) [(1, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 178716) [(6, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 357432) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 16. -/
theorem rs_R003_ueqv_R003NN_partial_16_0050_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_16_0050
        rs_R003_ueqv_R003NN_generator_16_0000_0050 =
      rs_R003_ueqv_R003NN_partial_16_0050 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_16_0000_0050 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_16_0000,
  rs_R003_ueqv_R003NN_partial_16_0001,
  rs_R003_ueqv_R003NN_partial_16_0002,
  rs_R003_ueqv_R003NN_partial_16_0003,
  rs_R003_ueqv_R003NN_partial_16_0004,
  rs_R003_ueqv_R003NN_partial_16_0005,
  rs_R003_ueqv_R003NN_partial_16_0006,
  rs_R003_ueqv_R003NN_partial_16_0007,
  rs_R003_ueqv_R003NN_partial_16_0008,
  rs_R003_ueqv_R003NN_partial_16_0009,
  rs_R003_ueqv_R003NN_partial_16_0010,
  rs_R003_ueqv_R003NN_partial_16_0011,
  rs_R003_ueqv_R003NN_partial_16_0012,
  rs_R003_ueqv_R003NN_partial_16_0013,
  rs_R003_ueqv_R003NN_partial_16_0014,
  rs_R003_ueqv_R003NN_partial_16_0015,
  rs_R003_ueqv_R003NN_partial_16_0016,
  rs_R003_ueqv_R003NN_partial_16_0017,
  rs_R003_ueqv_R003NN_partial_16_0018,
  rs_R003_ueqv_R003NN_partial_16_0019,
  rs_R003_ueqv_R003NN_partial_16_0020,
  rs_R003_ueqv_R003NN_partial_16_0021,
  rs_R003_ueqv_R003NN_partial_16_0022,
  rs_R003_ueqv_R003NN_partial_16_0023,
  rs_R003_ueqv_R003NN_partial_16_0024,
  rs_R003_ueqv_R003NN_partial_16_0025,
  rs_R003_ueqv_R003NN_partial_16_0026,
  rs_R003_ueqv_R003NN_partial_16_0027,
  rs_R003_ueqv_R003NN_partial_16_0028,
  rs_R003_ueqv_R003NN_partial_16_0029,
  rs_R003_ueqv_R003NN_partial_16_0030,
  rs_R003_ueqv_R003NN_partial_16_0031,
  rs_R003_ueqv_R003NN_partial_16_0032,
  rs_R003_ueqv_R003NN_partial_16_0033,
  rs_R003_ueqv_R003NN_partial_16_0034,
  rs_R003_ueqv_R003NN_partial_16_0035,
  rs_R003_ueqv_R003NN_partial_16_0036,
  rs_R003_ueqv_R003NN_partial_16_0037,
  rs_R003_ueqv_R003NN_partial_16_0038,
  rs_R003_ueqv_R003NN_partial_16_0039,
  rs_R003_ueqv_R003NN_partial_16_0040,
  rs_R003_ueqv_R003NN_partial_16_0041,
  rs_R003_ueqv_R003NN_partial_16_0042,
  rs_R003_ueqv_R003NN_partial_16_0043,
  rs_R003_ueqv_R003NN_partial_16_0044,
  rs_R003_ueqv_R003NN_partial_16_0045,
  rs_R003_ueqv_R003NN_partial_16_0046,
  rs_R003_ueqv_R003NN_partial_16_0047,
  rs_R003_ueqv_R003NN_partial_16_0048,
  rs_R003_ueqv_R003NN_partial_16_0049,
  rs_R003_ueqv_R003NN_partial_16_0050
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_16_0000_0050 : Poly :=
[
  term ((-111 : Rat) / 4) [],
  term (-12 : Rat) [(0, 1)],
  term ((-6856 : Rat) / 134037) [(0, 1), (1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 1), (1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-82270 : Rat) / 44679) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((128837 : Rat) / 89358) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (1, 1), (7, 1)],
  term ((-65983 : Rat) / 134037) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((59705 : Rat) / 44679) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(0, 1), (1, 2)],
  term ((-3428 : Rat) / 134037) [(0, 1), (1, 2), (3, 1), (15, 1), (16, 1)],
  term ((65983 : Rat) / 268074) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-59705 : Rat) / 89358) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-199667 : Rat) / 134037) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 1), (2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((285359 : Rat) / 134037) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((10567 : Rat) / 29786) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((33421 : Rat) / 44679) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(0, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-387350 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((110561 : Rat) / 178716) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((39418 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-26565 : Rat) / 14893) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((140540 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((5427 : Rat) / 29786) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(0, 1), (5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 2) [(0, 1), (6, 1)],
  term ((41135 : Rat) / 44679) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(0, 1), (6, 1), (7, 1), (15, 1)],
  term ((-21421 : Rat) / 89358) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (6, 1), (8, 1)],
  term ((9564491 : Rat) / 1072296) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((8720803 : Rat) / 3216888) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((12186391 : Rat) / 12867552) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((133694 : Rat) / 134037) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-324 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-7971727 : Rat) / 12867552) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219376 : Rat) / 134037) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term (198 : Rat) [(0, 1), (6, 1), (15, 2)],
  term ((-16105661 : Rat) / 1608444) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term (-12 : Rat) [(0, 1), (6, 2)],
  term ((70270 : Rat) / 134037) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-119128 : Rat) / 134037) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-65983 : Rat) / 268074) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((59705 : Rat) / 89358) [(0, 1), (15, 2), (16, 1)],
  term ((111 : Rat) / 4) [(0, 2)],
  term ((3428 : Rat) / 134037) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 44679) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128837 : Rat) / 178716) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(0, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-285359 : Rat) / 268074) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10567 : Rat) / 59572) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-33421 : Rat) / 89358) [(0, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((11998 : Rat) / 134037) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((193675 : Rat) / 134037) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-359107 : Rat) / 1072296) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((-29993 : Rat) / 134037) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 134037) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((26565 : Rat) / 29786) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((24851 : Rat) / 134037) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70270 : Rat) / 134037) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5427 : Rat) / 59572) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(0, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(0, 2), (6, 1)],
  term ((-33706 : Rat) / 44679) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((238679 : Rat) / 134037) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-41135 : Rat) / 89358) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(0, 2), (7, 1), (15, 1)],
  term ((21421 : Rat) / 178716) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 2), (8, 1)],
  term ((-9564491 : Rat) / 2144592) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-8720803 : Rat) / 6433776) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (11, 1), (15, 1)],
  term ((-12186391 : Rat) / 25735104) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-66847 : Rat) / 134037) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (162 : Rat) [(0, 2), (13, 1), (15, 1)],
  term ((14306095 : Rat) / 25735104) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((109688 : Rat) / 134037) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term (-99 : Rat) [(0, 2), (15, 2)],
  term ((13956281 : Rat) / 3216888) [(0, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 357432) [(0, 2), (15, 4), (16, 1)],
  term (12 : Rat) [(0, 3)],
  term ((-3428 : Rat) / 134037) [(0, 3), (3, 1), (15, 1), (16, 1)],
  term ((65983 : Rat) / 268074) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-59705 : Rat) / 89358) [(0, 3), (15, 2), (16, 1)],
  term ((-199667 : Rat) / 134037) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((285359 : Rat) / 134037) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((10567 : Rat) / 29786) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 44679) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-387350 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((359107 : Rat) / 536148) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((59986 : Rat) / 134037) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-26565 : Rat) / 14893) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((39418 : Rat) / 134037) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((140540 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((5427 : Rat) / 29786) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(1, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(1, 1), (5, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (6, 1), (7, 1)],
  term ((70270 : Rat) / 134037) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-119128 : Rat) / 134037) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((82270 : Rat) / 44679) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128837 : Rat) / 89358) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-111 : Rat) / 2) [(1, 1), (7, 1)],
  term (48 : Rat) [(1, 1), (7, 1), (8, 1)],
  term ((9564491 : Rat) / 1072296) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((8720803 : Rat) / 3216888) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((12186391 : Rat) / 12867552) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((133694 : Rat) / 134037) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-324 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-14306095 : Rat) / 12867552) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-219376 : Rat) / 134037) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term (198 : Rat) [(1, 1), (7, 1), (15, 2)],
  term ((-13956281 : Rat) / 1608444) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((41135 : Rat) / 44679) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(1, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(1, 1), (7, 2), (15, 1)],
  term ((-21421 : Rat) / 89358) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 44679) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((128837 : Rat) / 178716) [(1, 1), (15, 1), (16, 1)],
  term ((111 : Rat) / 4) [(1, 2)],
  term ((199667 : Rat) / 268074) [(1, 2), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-11998 : Rat) / 134037) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-285359 : Rat) / 268074) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10567 : Rat) / 59572) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-33421 : Rat) / 89358) [(1, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((193675 : Rat) / 134037) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-359107 : Rat) / 1072296) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 44679) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((-29993 : Rat) / 134037) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 134037) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((26565 : Rat) / 29786) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((24851 : Rat) / 134037) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70270 : Rat) / 134037) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5427 : Rat) / 59572) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(1, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (6, 1)],
  term ((-35135 : Rat) / 134037) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((59564 : Rat) / 134037) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-205675 : Rat) / 89358) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(1, 2), (7, 1), (15, 1)],
  term ((279095 : Rat) / 178716) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 2), (8, 1)],
  term ((-9564491 : Rat) / 2144592) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-8720803 : Rat) / 6433776) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 2), (11, 1), (15, 1)],
  term ((-12186391 : Rat) / 25735104) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-66847 : Rat) / 134037) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (162 : Rat) [(1, 2), (13, 1), (15, 1)],
  term ((14306095 : Rat) / 25735104) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((109688 : Rat) / 134037) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term (-99 : Rat) [(1, 2), (15, 2)],
  term ((13956281 : Rat) / 3216888) [(1, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 357432) [(1, 2), (15, 4), (16, 1)],
  term ((3428 : Rat) / 134037) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 44679) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-128837 : Rat) / 178716) [(1, 3), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-285359 : Rat) / 134037) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10567 : Rat) / 29786) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((1714 : Rat) / 44679) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((285359 : Rat) / 268074) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((10567 : Rat) / 59572) [(2, 1), (15, 2), (16, 1)],
  term ((-33421 : Rat) / 44679) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((33421 : Rat) / 89358) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((387350 : Rat) / 134037) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-379675 : Rat) / 536148) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-193675 : Rat) / 134037) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((359107 : Rat) / 1072296) [(3, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 44679) [(3, 1), (15, 3), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-39418 : Rat) / 134037) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((26565 : Rat) / 14893) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((19709 : Rat) / 134037) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-26565 : Rat) / 29786) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-140540 : Rat) / 134037) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(5, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-98545 : Rat) / 268074) [(5, 1), (6, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((70270 : Rat) / 134037) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((49702 : Rat) / 134037) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((5427 : Rat) / 59572) [(5, 1), (15, 1), (16, 1)],
  term ((-119972 : Rat) / 134037) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 2) [(6, 1)],
  term ((-41135 : Rat) / 44679) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(6, 1), (7, 1), (15, 1)],
  term ((21421 : Rat) / 89358) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(6, 1), (8, 1)],
  term ((-9564491 : Rat) / 1072296) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-8720803 : Rat) / 3216888) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(6, 1), (11, 1), (15, 1)],
  term ((-12186391 : Rat) / 12867552) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-133694 : Rat) / 134037) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (324 : Rat) [(6, 1), (13, 1), (15, 1)],
  term ((17679055 : Rat) / 12867552) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((219376 : Rat) / 134037) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term (-198 : Rat) [(6, 1), (15, 2)],
  term ((13241513 : Rat) / 1608444) [(6, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 178716) [(6, 1), (15, 4), (16, 1)],
  term (12 : Rat) [(6, 2)],
  term ((-70270 : Rat) / 134037) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((119128 : Rat) / 134037) [(6, 2), (15, 2), (16, 1)],
  term ((41135 : Rat) / 89358) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(7, 1), (15, 1)],
  term ((-21421 : Rat) / 178716) [(7, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(8, 1)],
  term ((9564491 : Rat) / 2144592) [(8, 1), (15, 2), (16, 1)],
  term ((8720803 : Rat) / 6433776) [(9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(11, 1), (15, 1)],
  term ((12186391 : Rat) / 25735104) [(11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 178716) [(11, 1), (15, 3), (16, 1)],
  term ((66847 : Rat) / 134037) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (-162 : Rat) [(13, 1), (15, 1)],
  term ((-14306095 : Rat) / 25735104) [(13, 1), (15, 1), (16, 1)],
  term ((-109688 : Rat) / 134037) [(13, 1), (15, 3), (16, 1)],
  term (99 : Rat) [(15, 2)],
  term ((-13956281 : Rat) / 3216888) [(15, 2), (16, 1)],
  term ((-128807 : Rat) / 357432) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 50. -/
theorem rs_R003_ueqv_R003NN_block_16_0000_0050_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_16_0000_0050
      rs_R003_ueqv_R003NN_block_16_0000_0050 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
