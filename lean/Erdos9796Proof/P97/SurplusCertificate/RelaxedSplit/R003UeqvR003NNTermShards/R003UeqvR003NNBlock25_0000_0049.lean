/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 25:0-49

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_25_0000_0049 : Poly :=
[
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0000 : Poly :=
[
  term ((-103 : Rat) / 2) []
]

/-- Partial product 0 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0000 : Poly :=
[
  term (-103 : Rat) [(6, 1), (12, 1)],
  term ((103 : Rat) / 2) [(6, 2)],
  term (-103 : Rat) [(7, 1), (13, 1)],
  term ((103 : Rat) / 2) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0000
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0001 : Poly :=
[
  term ((-180827 : Rat) / 268074) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0001 : Poly :=
[
  term ((-180827 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((180827 : Rat) / 268074) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-180827 : Rat) / 134037) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((180827 : Rat) / 268074) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0001
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0002 : Poly :=
[
  term ((-19709 : Rat) / 89358) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0002 : Poly :=
[
  term ((-19709 : Rat) / 44679) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0002
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0003 : Poly :=
[
  term ((41135 : Rat) / 89358) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0003 : Poly :=
[
  term ((41135 : Rat) / 44679) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 89358) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 44679) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 89358) [(0, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0003
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0004 : Poly :=
[
  term ((99701 : Rat) / 89358) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 4 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0004 : Poly :=
[
  term ((99701 : Rat) / 44679) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0004
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0005 : Poly :=
[
  term ((180827 : Rat) / 268074) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0005 : Poly :=
[
  term ((180827 : Rat) / 134037) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-180827 : Rat) / 268074) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((180827 : Rat) / 134037) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-180827 : Rat) / 268074) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0005
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0006 : Poly :=
[
  term ((19709 : Rat) / 89358) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0006 : Poly :=
[
  term ((19709 : Rat) / 44679) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0006
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0007 : Poly :=
[
  term ((-41135 : Rat) / 89358) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0007 : Poly :=
[
  term ((-41135 : Rat) / 44679) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 89358) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 44679) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 89358) [(1, 1), (6, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0007
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0008 : Poly :=
[
  term ((-155063 : Rat) / 536148) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0008 : Poly :=
[
  term ((-155063 : Rat) / 268074) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((155063 : Rat) / 536148) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-155063 : Rat) / 268074) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((155063 : Rat) / 536148) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0008_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0008
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0009 : Poly :=
[
  term ((-199667 : Rat) / 134037) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0009 : Poly :=
[
  term ((-399334 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-399334 : Rat) / 134037) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0009_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0009
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0010 : Poly :=
[
  term ((8138 : Rat) / 134037) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0010 : Poly :=
[
  term ((16276 : Rat) / 134037) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8138 : Rat) / 134037) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((16276 : Rat) / 134037) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8138 : Rat) / 134037) [(2, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0010_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0010
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0011 : Poly :=
[
  term ((184223 : Rat) / 268074) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0011 : Poly :=
[
  term ((184223 : Rat) / 134037) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-184223 : Rat) / 268074) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((184223 : Rat) / 134037) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-184223 : Rat) / 268074) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0011_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0011
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0012 : Poly :=
[
  term ((149965 : Rat) / 134037) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0012 : Poly :=
[
  term ((299930 : Rat) / 134037) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-149965 : Rat) / 134037) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((299930 : Rat) / 134037) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149965 : Rat) / 134037) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0012_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0012
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0013 : Poly :=
[
  term ((-99404 : Rat) / 134037) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0013 : Poly :=
[
  term ((-198808 : Rat) / 134037) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0013_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0013
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0014 : Poly :=
[
  term ((-8138 : Rat) / 134037) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0014 : Poly :=
[
  term ((-16276 : Rat) / 134037) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((8138 : Rat) / 134037) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-16276 : Rat) / 134037) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((8138 : Rat) / 134037) [(3, 1), (6, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0014_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0014
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0015 : Poly :=
[
  term ((-6856 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0015 : Poly :=
[
  term ((-13712 : Rat) / 44679) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0015_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0015
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0016 : Poly :=
[
  term ((-6856 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0016 : Poly :=
[
  term ((-13712 : Rat) / 134037) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0016_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0016
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0017 : Poly :=
[
  term ((13712 : Rat) / 134037) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0017 : Poly :=
[
  term ((27424 : Rat) / 134037) [(3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((27424 : Rat) / 134037) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0017_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0017
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0018 : Poly :=
[
  term ((830 : Rat) / 843) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 18 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0018 : Poly :=
[
  term ((1660 : Rat) / 843) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-830 : Rat) / 843) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((1660 : Rat) / 843) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-830 : Rat) / 843) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0018_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0018
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0019 : Poly :=
[
  term ((-47147 : Rat) / 536148) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0019 : Poly :=
[
  term ((-47147 : Rat) / 268074) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((47147 : Rat) / 536148) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-47147 : Rat) / 268074) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((47147 : Rat) / 536148) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0019_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0019
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0020 : Poly :=
[
  term ((11998 : Rat) / 134037) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 20 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0020 : Poly :=
[
  term ((23996 : Rat) / 134037) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-11998 : Rat) / 134037) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((23996 : Rat) / 134037) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-11998 : Rat) / 134037) [(3, 1), (7, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0020_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0020
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0021 : Poly :=
[
  term ((29993 : Rat) / 134037) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0021 : Poly :=
[
  term ((59986 : Rat) / 134037) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0021_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0021
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0022 : Poly :=
[
  term ((-29993 : Rat) / 89358) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0022 : Poly :=
[
  term ((-29993 : Rat) / 44679) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 89358) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 44679) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 89358) [(4, 1), (7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0022_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0022
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0023 : Poly :=
[
  term ((49702 : Rat) / 134037) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0023 : Poly :=
[
  term ((99404 : Rat) / 134037) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0023_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0023
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0024 : Poly :=
[
  term ((8855 : Rat) / 29786) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0024 : Poly :=
[
  term ((8855 : Rat) / 14893) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((8855 : Rat) / 14893) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(5, 1), (6, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0024_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0024
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0025 : Poly :=
[
  term ((-3428 : Rat) / 44679) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0025 : Poly :=
[
  term ((-6856 : Rat) / 44679) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0025_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0025
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0026 : Poly :=
[
  term ((49702 : Rat) / 134037) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 26 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0026 : Poly :=
[
  term ((99404 : Rat) / 134037) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0026_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0026
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0027 : Poly :=
[
  term ((17710 : Rat) / 14893) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0027 : Poly :=
[
  term ((35420 : Rat) / 14893) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((35420 : Rat) / 14893) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0027_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0027
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0028 : Poly :=
[
  term ((59986 : Rat) / 134037) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0028 : Poly :=
[
  term ((119972 : Rat) / 134037) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(5, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0028_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0028
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0029 : Poly :=
[
  term ((132845 : Rat) / 536148) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0029 : Poly :=
[
  term ((132845 : Rat) / 268074) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-132845 : Rat) / 536148) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((132845 : Rat) / 268074) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-132845 : Rat) / 536148) [(6, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0029_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0029
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0030 : Poly :=
[
  term ((-323099 : Rat) / 536148) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0030 : Poly :=
[
  term ((-323099 : Rat) / 268074) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((323099 : Rat) / 536148) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-323099 : Rat) / 268074) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term ((323099 : Rat) / 536148) [(6, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0030_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0030
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0031 : Poly :=
[
  term (12 : Rat) [(7, 1), (13, 1)]
]

/-- Partial product 31 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0031 : Poly :=
[
  term (24 : Rat) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term (-12 : Rat) [(6, 2), (7, 1), (13, 1)],
  term (24 : Rat) [(7, 2), (13, 2)],
  term (-12 : Rat) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0031_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0031
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0032 : Poly :=
[
  term ((3428 : Rat) / 44679) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 32 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0032 : Poly :=
[
  term ((6856 : Rat) / 44679) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0032_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0032
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0033 : Poly :=
[
  term (-12 : Rat) [(7, 1), (15, 1)]
]

/-- Partial product 33 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0033 : Poly :=
[
  term (-24 : Rat) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term (12 : Rat) [(6, 2), (7, 1), (15, 1)],
  term (-24 : Rat) [(7, 2), (13, 1), (15, 1)],
  term (12 : Rat) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0033_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0033
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0034 : Poly :=
[
  term ((-29993 : Rat) / 134037) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0034 : Poly :=
[
  term ((-59986 : Rat) / 134037) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((29993 : Rat) / 134037) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0034_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0034
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0035 : Poly :=
[
  term (24 : Rat) [(8, 1)]
]

/-- Partial product 35 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0035 : Poly :=
[
  term (48 : Rat) [(6, 1), (8, 1), (12, 1)],
  term (-24 : Rat) [(6, 2), (8, 1)],
  term (48 : Rat) [(7, 1), (8, 1), (13, 1)],
  term (-24 : Rat) [(7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0035_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0035
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0036 : Poly :=
[
  term ((-19003651 : Rat) / 3216888) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0036 : Poly :=
[
  term ((-19003651 : Rat) / 1608444) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((19003651 : Rat) / 3216888) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19003651 : Rat) / 1608444) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((19003651 : Rat) / 3216888) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0036_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0036
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0037 : Poly :=
[
  term ((4844911 : Rat) / 1608444) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0037 : Poly :=
[
  term ((4844911 : Rat) / 804222) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4844911 : Rat) / 1608444) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((4844911 : Rat) / 804222) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4844911 : Rat) / 1608444) [(7, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0037_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0037
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0038 : Poly :=
[
  term (16 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 38 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0038 : Poly :=
[
  term (32 : Rat) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term (-16 : Rat) [(6, 2), (9, 1), (13, 1)],
  term (32 : Rat) [(7, 1), (9, 1), (13, 2)],
  term (-16 : Rat) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0038_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0038
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0039 : Poly :=
[
  term ((-128807 : Rat) / 268074) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 39 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0039 : Poly :=
[
  term ((-128807 : Rat) / 134037) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 268074) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 134037) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((128807 : Rat) / 268074) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0039_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0039
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0040 : Poly :=
[
  term (-32 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 40 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0040 : Poly :=
[
  term (-64 : Rat) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term (32 : Rat) [(6, 2), (9, 1), (15, 1)],
  term (-64 : Rat) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term (32 : Rat) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0040_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0040
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0041 : Poly :=
[
  term ((5559037 : Rat) / 6433776) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0041 : Poly :=
[
  term ((5559037 : Rat) / 3216888) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5559037 : Rat) / 6433776) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((5559037 : Rat) / 3216888) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5559037 : Rat) / 6433776) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0041_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0041
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0042 : Poly :=
[
  term ((128807 : Rat) / 134037) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 42 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0042 : Poly :=
[
  term ((257614 : Rat) / 134037) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 134037) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((257614 : Rat) / 134037) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 134037) [(7, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0042_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0042
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0043 : Poly :=
[
  term (-352 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 43 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0043 : Poly :=
[
  term (-704 : Rat) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term (352 : Rat) [(6, 2), (13, 1), (15, 1)],
  term (-704 : Rat) [(7, 1), (13, 2), (15, 1)],
  term (352 : Rat) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0043_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0043
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0044 : Poly :=
[
  term ((71518589 : Rat) / 12867552) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0044 : Poly :=
[
  term ((71518589 : Rat) / 6433776) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-71518589 : Rat) / 12867552) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((71518589 : Rat) / 6433776) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-71518589 : Rat) / 12867552) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0044_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0044
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0045 : Poly :=
[
  term ((1569829 : Rat) / 1072296) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 45 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0045 : Poly :=
[
  term ((1569829 : Rat) / 536148) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1569829 : Rat) / 1072296) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((1569829 : Rat) / 536148) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1569829 : Rat) / 1072296) [(7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0045_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0045
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0046 : Poly :=
[
  term (108 : Rat) [(13, 2)]
]

/-- Partial product 46 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0046 : Poly :=
[
  term (216 : Rat) [(6, 1), (12, 1), (13, 2)],
  term (-108 : Rat) [(6, 2), (13, 2)],
  term (216 : Rat) [(7, 1), (13, 3)],
  term (-108 : Rat) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0046_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0046
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0047 : Poly :=
[
  term (86 : Rat) [(15, 2)]
]

/-- Partial product 47 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0047 : Poly :=
[
  term (172 : Rat) [(6, 1), (12, 1), (15, 2)],
  term (-86 : Rat) [(6, 2), (15, 2)],
  term (172 : Rat) [(7, 1), (13, 1), (15, 2)],
  term (-86 : Rat) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0047_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0047
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0048 : Poly :=
[
  term ((-579191 : Rat) / 1429728) [(15, 2), (16, 1)]
]

/-- Partial product 48 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0048 : Poly :=
[
  term ((-579191 : Rat) / 714864) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((579191 : Rat) / 1429728) [(6, 2), (15, 2), (16, 1)],
  term ((-579191 : Rat) / 714864) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((579191 : Rat) / 1429728) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0048_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0048
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 25. -/
def rs_R003_ueqv_R003NN_coefficient_25_0049 : Poly :=
[
  term ((901649 : Rat) / 1072296) [(15, 4), (16, 1)]
]

/-- Partial product 49 for generator 25. -/
def rs_R003_ueqv_R003NN_partial_25_0049 : Poly :=
[
  term ((901649 : Rat) / 536148) [(6, 1), (12, 1), (15, 4), (16, 1)],
  term ((-901649 : Rat) / 1072296) [(6, 2), (15, 4), (16, 1)],
  term ((901649 : Rat) / 536148) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-901649 : Rat) / 1072296) [(7, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 25. -/
theorem rs_R003_ueqv_R003NN_partial_25_0049_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_25_0049
        rs_R003_ueqv_R003NN_generator_25_0000_0049 =
      rs_R003_ueqv_R003NN_partial_25_0049 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_25_0000_0049 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_25_0000,
  rs_R003_ueqv_R003NN_partial_25_0001,
  rs_R003_ueqv_R003NN_partial_25_0002,
  rs_R003_ueqv_R003NN_partial_25_0003,
  rs_R003_ueqv_R003NN_partial_25_0004,
  rs_R003_ueqv_R003NN_partial_25_0005,
  rs_R003_ueqv_R003NN_partial_25_0006,
  rs_R003_ueqv_R003NN_partial_25_0007,
  rs_R003_ueqv_R003NN_partial_25_0008,
  rs_R003_ueqv_R003NN_partial_25_0009,
  rs_R003_ueqv_R003NN_partial_25_0010,
  rs_R003_ueqv_R003NN_partial_25_0011,
  rs_R003_ueqv_R003NN_partial_25_0012,
  rs_R003_ueqv_R003NN_partial_25_0013,
  rs_R003_ueqv_R003NN_partial_25_0014,
  rs_R003_ueqv_R003NN_partial_25_0015,
  rs_R003_ueqv_R003NN_partial_25_0016,
  rs_R003_ueqv_R003NN_partial_25_0017,
  rs_R003_ueqv_R003NN_partial_25_0018,
  rs_R003_ueqv_R003NN_partial_25_0019,
  rs_R003_ueqv_R003NN_partial_25_0020,
  rs_R003_ueqv_R003NN_partial_25_0021,
  rs_R003_ueqv_R003NN_partial_25_0022,
  rs_R003_ueqv_R003NN_partial_25_0023,
  rs_R003_ueqv_R003NN_partial_25_0024,
  rs_R003_ueqv_R003NN_partial_25_0025,
  rs_R003_ueqv_R003NN_partial_25_0026,
  rs_R003_ueqv_R003NN_partial_25_0027,
  rs_R003_ueqv_R003NN_partial_25_0028,
  rs_R003_ueqv_R003NN_partial_25_0029,
  rs_R003_ueqv_R003NN_partial_25_0030,
  rs_R003_ueqv_R003NN_partial_25_0031,
  rs_R003_ueqv_R003NN_partial_25_0032,
  rs_R003_ueqv_R003NN_partial_25_0033,
  rs_R003_ueqv_R003NN_partial_25_0034,
  rs_R003_ueqv_R003NN_partial_25_0035,
  rs_R003_ueqv_R003NN_partial_25_0036,
  rs_R003_ueqv_R003NN_partial_25_0037,
  rs_R003_ueqv_R003NN_partial_25_0038,
  rs_R003_ueqv_R003NN_partial_25_0039,
  rs_R003_ueqv_R003NN_partial_25_0040,
  rs_R003_ueqv_R003NN_partial_25_0041,
  rs_R003_ueqv_R003NN_partial_25_0042,
  rs_R003_ueqv_R003NN_partial_25_0043,
  rs_R003_ueqv_R003NN_partial_25_0044,
  rs_R003_ueqv_R003NN_partial_25_0045,
  rs_R003_ueqv_R003NN_partial_25_0046,
  rs_R003_ueqv_R003NN_partial_25_0047,
  rs_R003_ueqv_R003NN_partial_25_0048,
  rs_R003_ueqv_R003NN_partial_25_0049
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_25_0000_0049 : Poly :=
[
  term ((-180827 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((180827 : Rat) / 268074) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-180827 : Rat) / 134037) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((180827 : Rat) / 268074) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 44679) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((19709 : Rat) / 89358) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((41135 : Rat) / 44679) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-41135 : Rat) / 89358) [(0, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((99701 : Rat) / 44679) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((41135 : Rat) / 44679) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-99701 : Rat) / 89358) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-41135 : Rat) / 89358) [(0, 1), (7, 3), (15, 1), (16, 1)],
  term ((180827 : Rat) / 134037) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-180827 : Rat) / 268074) [(1, 1), (2, 1), (6, 2), (15, 1), (16, 1)],
  term ((180827 : Rat) / 134037) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-180827 : Rat) / 268074) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((19709 : Rat) / 44679) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19709 : Rat) / 89358) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 44679) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((41135 : Rat) / 89358) [(1, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-155063 : Rat) / 268074) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-41135 : Rat) / 44679) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((155063 : Rat) / 536148) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((41135 : Rat) / 89358) [(1, 1), (6, 3), (15, 1), (16, 1)],
  term ((-155063 : Rat) / 268074) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((155063 : Rat) / 536148) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-399334 : Rat) / 134037) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-399334 : Rat) / 134037) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(2, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((16276 : Rat) / 134037) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((184223 : Rat) / 134037) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8138 : Rat) / 134037) [(2, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-184223 : Rat) / 268074) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((184223 : Rat) / 134037) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((16276 : Rat) / 134037) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-184223 : Rat) / 268074) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-8138 : Rat) / 134037) [(2, 1), (7, 3), (15, 1), (16, 1)],
  term ((299930 : Rat) / 134037) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-149965 : Rat) / 134037) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((299930 : Rat) / 134037) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-149965 : Rat) / 134037) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16276 : Rat) / 134037) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((8138 : Rat) / 134037) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 1), (6, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 134037) [(3, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1660 : Rat) / 843) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-47147 : Rat) / 268074) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((23996 : Rat) / 134037) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-16276 : Rat) / 134037) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-830 : Rat) / 843) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((47147 : Rat) / 536148) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-11998 : Rat) / 134037) [(3, 1), (6, 2), (15, 3), (16, 1)],
  term ((8138 : Rat) / 134037) [(3, 1), (6, 3), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 44679) [(3, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 134037) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-47147 : Rat) / 268074) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((23996 : Rat) / 134037) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((1660 : Rat) / 843) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(3, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-830 : Rat) / 843) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((47147 : Rat) / 536148) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-11998 : Rat) / 134037) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 44679) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((29993 : Rat) / 89358) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(4, 1), (6, 2), (15, 2), (16, 1)],
  term ((99404 : Rat) / 134037) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-29993 : Rat) / 44679) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((29993 : Rat) / 89358) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 14893) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((35420 : Rat) / 14893) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((8855 : Rat) / 14893) [(5, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-17710 : Rat) / 14893) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-8855 : Rat) / 29786) [(5, 1), (6, 3), (15, 1), (16, 1)],
  term ((35420 : Rat) / 14893) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-49702 : Rat) / 134037) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-17710 : Rat) / 14893) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(5, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((6856 : Rat) / 44679) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-59986 : Rat) / 134037) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-323099 : Rat) / 268074) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((132845 : Rat) / 268074) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-132845 : Rat) / 536148) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((323099 : Rat) / 536148) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term (48 : Rat) [(6, 1), (8, 1), (12, 1)],
  term ((-19003651 : Rat) / 1608444) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4844911 : Rat) / 804222) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-128807 : Rat) / 134037) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (-64 : Rat) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((5559037 : Rat) / 3216888) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((257614 : Rat) / 134037) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term (-103 : Rat) [(6, 1), (12, 1)],
  term (-704 : Rat) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((71518589 : Rat) / 6433776) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1569829 : Rat) / 536148) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term (216 : Rat) [(6, 1), (12, 1), (13, 2)],
  term (172 : Rat) [(6, 1), (12, 1), (15, 2)],
  term ((-579191 : Rat) / 714864) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((901649 : Rat) / 536148) [(6, 1), (12, 1), (15, 4), (16, 1)],
  term ((103 : Rat) / 2) [(6, 2)],
  term (-12 : Rat) [(6, 2), (7, 1), (13, 1)],
  term ((-3428 : Rat) / 44679) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(6, 2), (7, 1), (15, 1)],
  term ((29993 : Rat) / 134037) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(6, 2), (8, 1)],
  term ((19003651 : Rat) / 3216888) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4844911 : Rat) / 1608444) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(6, 2), (9, 1), (13, 1)],
  term ((128807 : Rat) / 268074) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(6, 2), (9, 1), (15, 1)],
  term ((-5559037 : Rat) / 6433776) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 134037) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((132845 : Rat) / 268074) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-323099 : Rat) / 268074) [(6, 2), (12, 1), (15, 2), (16, 1)],
  term (352 : Rat) [(6, 2), (13, 1), (15, 1)],
  term ((-71518589 : Rat) / 12867552) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1569829 : Rat) / 1072296) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term (-108 : Rat) [(6, 2), (13, 2)],
  term (-86 : Rat) [(6, 2), (15, 2)],
  term ((579191 : Rat) / 1429728) [(6, 2), (15, 2), (16, 1)],
  term ((-901649 : Rat) / 1072296) [(6, 2), (15, 4), (16, 1)],
  term ((-132845 : Rat) / 536148) [(6, 3), (13, 1), (15, 1), (16, 1)],
  term ((323099 : Rat) / 536148) [(6, 3), (15, 2), (16, 1)],
  term (48 : Rat) [(7, 1), (8, 1), (13, 1)],
  term ((4844911 : Rat) / 804222) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19003651 : Rat) / 1608444) [(7, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term (-64 : Rat) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((5559037 : Rat) / 3216888) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((257614 : Rat) / 134037) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term (32 : Rat) [(7, 1), (9, 1), (13, 2)],
  term ((-128807 : Rat) / 134037) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term (-103 : Rat) [(7, 1), (13, 1)],
  term (172 : Rat) [(7, 1), (13, 1), (15, 2)],
  term ((-579191 : Rat) / 714864) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((901649 : Rat) / 536148) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term (-704 : Rat) [(7, 1), (13, 2), (15, 1)],
  term ((71518589 : Rat) / 6433776) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1569829 : Rat) / 536148) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term (216 : Rat) [(7, 1), (13, 3)],
  term ((103 : Rat) / 2) [(7, 2)],
  term (-24 : Rat) [(7, 2), (8, 1)],
  term ((19003651 : Rat) / 3216888) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4844911 : Rat) / 1608444) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(7, 2), (9, 1), (13, 1)],
  term ((128807 : Rat) / 268074) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(7, 2), (9, 1), (15, 1)],
  term ((-5559037 : Rat) / 6433776) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 134037) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term (328 : Rat) [(7, 2), (13, 1), (15, 1)],
  term ((-77277245 : Rat) / 12867552) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1569829 : Rat) / 1072296) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term (-84 : Rat) [(7, 2), (13, 2)],
  term ((6856 : Rat) / 44679) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term (-86 : Rat) [(7, 2), (15, 2)],
  term ((579191 : Rat) / 1429728) [(7, 2), (15, 2), (16, 1)],
  term ((-901649 : Rat) / 1072296) [(7, 2), (15, 4), (16, 1)],
  term (-12 : Rat) [(7, 3), (13, 1)],
  term ((-3428 : Rat) / 44679) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(7, 3), (15, 1)],
  term ((29993 : Rat) / 134037) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 0 through 49. -/
theorem rs_R003_ueqv_R003NN_block_25_0000_0049_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_25_0000_0049
      rs_R003_ueqv_R003NN_block_25_0000_0049 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
