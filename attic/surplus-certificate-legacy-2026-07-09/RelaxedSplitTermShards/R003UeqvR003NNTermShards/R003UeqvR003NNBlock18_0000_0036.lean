/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 18:0-36

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_18_0000_0036 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0000 : Poly :=
[
  term ((143 : Rat) / 4) []
]

/-- Partial product 0 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0000 : Poly :=
[
  term ((-143 : Rat) / 2) [(0, 1), (6, 1)],
  term ((143 : Rat) / 4) [(0, 2)],
  term ((-143 : Rat) / 2) [(1, 1), (7, 1)],
  term ((143 : Rat) / 4) [(1, 2)],
  term ((143 : Rat) / 2) [(6, 1), (14, 1)],
  term ((143 : Rat) / 2) [(7, 1), (15, 1)],
  term ((-143 : Rat) / 4) [(14, 2)],
  term ((-143 : Rat) / 4) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0000
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0001 : Poly :=
[
  term (-12 : Rat) [(0, 1)]
]

/-- Partial product 1 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0001 : Poly :=
[
  term (24 : Rat) [(0, 1), (1, 1), (7, 1)],
  term (-12 : Rat) [(0, 1), (1, 2)],
  term (-24 : Rat) [(0, 1), (6, 1), (14, 1)],
  term (-24 : Rat) [(0, 1), (7, 1), (15, 1)],
  term (12 : Rat) [(0, 1), (14, 2)],
  term (12 : Rat) [(0, 1), (15, 2)],
  term (24 : Rat) [(0, 2), (6, 1)],
  term (-12 : Rat) [(0, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0001
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0002 : Poly :=
[
  term ((-3428 : Rat) / 44679) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0002 : Poly :=
[
  term ((6856 : Rat) / 44679) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((6856 : Rat) / 44679) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0002
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0003 : Poly :=
[
  term ((-6666 : Rat) / 14893) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 3 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0003 : Poly :=
[
  term ((13332 : Rat) / 14893) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6666 : Rat) / 14893) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-13332 : Rat) / 14893) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13332 : Rat) / 14893) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((6666 : Rat) / 14893) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((6666 : Rat) / 14893) [(0, 1), (15, 4), (16, 1)],
  term ((13332 : Rat) / 14893) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-6666 : Rat) / 14893) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0003
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0004 : Poly :=
[
  term ((12563 : Rat) / 89358) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0004 : Poly :=
[
  term ((-12563 : Rat) / 44679) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((12563 : Rat) / 89358) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((12563 : Rat) / 44679) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((12563 : Rat) / 44679) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-12563 : Rat) / 89358) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12563 : Rat) / 89358) [(1, 1), (15, 3), (16, 1)],
  term ((-12563 : Rat) / 44679) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((12563 : Rat) / 89358) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0004
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0005 : Poly :=
[
  term ((-273343 : Rat) / 536148) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 5 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0005 : Poly :=
[
  term ((273343 : Rat) / 268074) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 536148) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((273343 : Rat) / 268074) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 536148) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 268074) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 268074) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((273343 : Rat) / 536148) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((273343 : Rat) / 536148) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0005
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0006 : Poly :=
[
  term ((3428 : Rat) / 44679) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0006 : Poly :=
[
  term ((-6856 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0006
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0007 : Poly :=
[
  term ((6856 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0007 : Poly :=
[
  term ((-13712 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(1, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0007
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0008 : Poly :=
[
  term ((-13712 : Rat) / 134037) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0008 : Poly :=
[
  term ((27424 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 134037) [(0, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((27424 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-13712 : Rat) / 134037) [(1, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0008_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0008
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0009 : Poly :=
[
  term ((3428 : Rat) / 44679) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 9 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0009 : Poly :=
[
  term ((-6856 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0009_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0009
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0010 : Poly :=
[
  term ((-32566 : Rat) / 134037) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 10 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0010 : Poly :=
[
  term ((65132 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32566 : Rat) / 134037) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((65132 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32566 : Rat) / 134037) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65132 : Rat) / 134037) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65132 : Rat) / 134037) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((32566 : Rat) / 134037) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((32566 : Rat) / 134037) [(3, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0010_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0010
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0011 : Poly :=
[
  term ((-160171 : Rat) / 1072296) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0011 : Poly :=
[
  term ((160171 : Rat) / 536148) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-160171 : Rat) / 1072296) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((160171 : Rat) / 536148) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-160171 : Rat) / 1072296) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-160171 : Rat) / 536148) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-160171 : Rat) / 536148) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((160171 : Rat) / 1072296) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((160171 : Rat) / 1072296) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0011_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0011
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0012 : Poly :=
[
  term ((-17140 : Rat) / 134037) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 12 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0012 : Poly :=
[
  term ((34280 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-17140 : Rat) / 134037) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((34280 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-17140 : Rat) / 134037) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((-34280 : Rat) / 134037) [(3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((-34280 : Rat) / 134037) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((17140 : Rat) / 134037) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((17140 : Rat) / 134037) [(3, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0012_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0012
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0013 : Poly :=
[
  term ((59986 : Rat) / 134037) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0013 : Poly :=
[
  term ((-119972 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-119972 : Rat) / 134037) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0013_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0013
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0014 : Poly :=
[
  term ((-24851 : Rat) / 268074) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0014 : Poly :=
[
  term ((24851 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 268074) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 268074) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 134037) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 134037) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((24851 : Rat) / 268074) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((24851 : Rat) / 268074) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0014_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0014
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0015 : Poly :=
[
  term (-6 : Rat) [(6, 1)]
]

/-- Partial product 15 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0015 : Poly :=
[
  term (12 : Rat) [(0, 1), (6, 2)],
  term (-6 : Rat) [(0, 2), (6, 1)],
  term (12 : Rat) [(1, 1), (6, 1), (7, 1)],
  term (-6 : Rat) [(1, 2), (6, 1)],
  term (-12 : Rat) [(6, 1), (7, 1), (15, 1)],
  term (6 : Rat) [(6, 1), (14, 2)],
  term (6 : Rat) [(6, 1), (15, 2)],
  term (-12 : Rat) [(6, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0015_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0015
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0016 : Poly :=
[
  term ((-112277 : Rat) / 536148) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0016 : Poly :=
[
  term ((112277 : Rat) / 268074) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-112277 : Rat) / 536148) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((112277 : Rat) / 268074) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-112277 : Rat) / 536148) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-112277 : Rat) / 268074) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((112277 : Rat) / 536148) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((112277 : Rat) / 536148) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-112277 : Rat) / 268074) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0016_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0016
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0017 : Poly :=
[
  term ((9427 : Rat) / 59572) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0017 : Poly :=
[
  term ((-9427 : Rat) / 29786) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((9427 : Rat) / 59572) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-9427 : Rat) / 29786) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((9427 : Rat) / 59572) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((9427 : Rat) / 29786) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-9427 : Rat) / 59572) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9427 : Rat) / 59572) [(6, 1), (15, 4), (16, 1)],
  term ((9427 : Rat) / 29786) [(6, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0017_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0017
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0018 : Poly :=
[
  term (-12 : Rat) [(7, 1), (13, 1)]
]

/-- Partial product 18 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0018 : Poly :=
[
  term (24 : Rat) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term (-12 : Rat) [(0, 2), (7, 1), (13, 1)],
  term (24 : Rat) [(1, 1), (7, 2), (13, 1)],
  term (-12 : Rat) [(1, 2), (7, 1), (13, 1)],
  term (-24 : Rat) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term (12 : Rat) [(7, 1), (13, 1), (14, 2)],
  term (12 : Rat) [(7, 1), (13, 1), (15, 2)],
  term (-24 : Rat) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0018_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0018
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0019 : Poly :=
[
  term ((29782 : Rat) / 134037) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0019 : Poly :=
[
  term ((-59564 : Rat) / 134037) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((29782 : Rat) / 134037) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-59564 : Rat) / 134037) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((29782 : Rat) / 134037) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((59564 : Rat) / 134037) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29782 : Rat) / 134037) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-29782 : Rat) / 134037) [(7, 1), (15, 3), (16, 1)],
  term ((59564 : Rat) / 134037) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0019_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0019
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0020 : Poly :=
[
  term ((68507 : Rat) / 11448) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0020 : Poly :=
[
  term ((-68507 : Rat) / 5724) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((68507 : Rat) / 11448) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68507 : Rat) / 5724) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((68507 : Rat) / 11448) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((68507 : Rat) / 5724) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((68507 : Rat) / 5724) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68507 : Rat) / 11448) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-68507 : Rat) / 11448) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0020_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0020
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0021 : Poly :=
[
  term ((9313829 : Rat) / 6433776) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0021 : Poly :=
[
  term ((-9313829 : Rat) / 3216888) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((9313829 : Rat) / 6433776) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-9313829 : Rat) / 3216888) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((9313829 : Rat) / 6433776) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((9313829 : Rat) / 3216888) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((9313829 : Rat) / 3216888) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-9313829 : Rat) / 6433776) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9313829 : Rat) / 6433776) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0021_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0021
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0022 : Poly :=
[
  term (-16 : Rat) [(9, 1), (13, 1)]
]

/-- Partial product 22 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0022 : Poly :=
[
  term (32 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term (-16 : Rat) [(0, 2), (9, 1), (13, 1)],
  term (32 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term (-16 : Rat) [(1, 2), (9, 1), (13, 1)],
  term (-32 : Rat) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term (-32 : Rat) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term (16 : Rat) [(9, 1), (13, 1), (14, 2)],
  term (16 : Rat) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0022_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0022
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0023 : Poly :=
[
  term ((128807 : Rat) / 268074) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0023 : Poly :=
[
  term ((-128807 : Rat) / 134037) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 268074) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 134037) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 268074) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 134037) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 134037) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 268074) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-128807 : Rat) / 268074) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0023_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0023
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0024 : Poly :=
[
  term (32 : Rat) [(9, 1), (15, 1)]
]

/-- Partial product 24 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0024 : Poly :=
[
  term (-64 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term (32 : Rat) [(0, 2), (9, 1), (15, 1)],
  term (-64 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term (32 : Rat) [(1, 2), (9, 1), (15, 1)],
  term (64 : Rat) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term (64 : Rat) [(7, 1), (9, 1), (15, 2)],
  term (-32 : Rat) [(9, 1), (14, 2), (15, 1)],
  term (-32 : Rat) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0024_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0024
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0025 : Poly :=
[
  term ((287017 : Rat) / 1072296) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0025 : Poly :=
[
  term ((-287017 : Rat) / 536148) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((287017 : Rat) / 1072296) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-287017 : Rat) / 536148) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((287017 : Rat) / 1072296) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((287017 : Rat) / 536148) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((287017 : Rat) / 536148) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-287017 : Rat) / 1072296) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-287017 : Rat) / 1072296) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0025_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0025
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0026 : Poly :=
[
  term ((-128807 : Rat) / 134037) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 26 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0026 : Poly :=
[
  term ((257614 : Rat) / 134037) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 134037) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((257614 : Rat) / 134037) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 134037) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 134037) [(6, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-257614 : Rat) / 134037) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 134037) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term ((128807 : Rat) / 134037) [(9, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0026_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0026
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0027 : Poly :=
[
  term (-24 : Rat) [(11, 1), (15, 1)]
]

/-- Partial product 27 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0027 : Poly :=
[
  term (48 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term (-24 : Rat) [(0, 2), (11, 1), (15, 1)],
  term (48 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (-24 : Rat) [(1, 2), (11, 1), (15, 1)],
  term (-48 : Rat) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term (-48 : Rat) [(7, 1), (11, 1), (15, 2)],
  term (24 : Rat) [(11, 1), (14, 2), (15, 1)],
  term (24 : Rat) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0027_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0027
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0028 : Poly :=
[
  term ((12680023 : Rat) / 25735104) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0028 : Poly :=
[
  term ((-12680023 : Rat) / 12867552) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12680023 : Rat) / 25735104) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-12680023 : Rat) / 12867552) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((12680023 : Rat) / 25735104) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((12680023 : Rat) / 12867552) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((12680023 : Rat) / 12867552) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12680023 : Rat) / 25735104) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12680023 : Rat) / 25735104) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0028_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0028
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0029 : Poly :=
[
  term ((128807 : Rat) / 178716) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 29 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0029 : Poly :=
[
  term ((-128807 : Rat) / 89358) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 178716) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(11, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0029_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0029
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0030 : Poly :=
[
  term (190 : Rat) [(13, 1), (15, 1)]
]

/-- Partial product 30 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0030 : Poly :=
[
  term (-380 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term (190 : Rat) [(0, 2), (13, 1), (15, 1)],
  term (-380 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term (190 : Rat) [(1, 2), (13, 1), (15, 1)],
  term (380 : Rat) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term (380 : Rat) [(7, 1), (13, 1), (15, 2)],
  term (-190 : Rat) [(13, 1), (14, 2), (15, 1)],
  term (-190 : Rat) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0030_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0030
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0031 : Poly :=
[
  term ((-176715929 : Rat) / 25735104) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0031 : Poly :=
[
  term ((176715929 : Rat) / 12867552) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176715929 : Rat) / 25735104) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((176715929 : Rat) / 12867552) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176715929 : Rat) / 25735104) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-176715929 : Rat) / 12867552) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176715929 : Rat) / 12867552) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((176715929 : Rat) / 25735104) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((176715929 : Rat) / 25735104) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0031_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0031
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0032 : Poly :=
[
  term ((-2447333 : Rat) / 1072296) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 32 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0032 : Poly :=
[
  term ((2447333 : Rat) / 536148) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2447333 : Rat) / 1072296) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((2447333 : Rat) / 536148) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2447333 : Rat) / 1072296) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2447333 : Rat) / 536148) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2447333 : Rat) / 536148) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((2447333 : Rat) / 1072296) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term ((2447333 : Rat) / 1072296) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0032_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0032
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0033 : Poly :=
[
  term (-108 : Rat) [(13, 2)]
]

/-- Partial product 33 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0033 : Poly :=
[
  term (216 : Rat) [(0, 1), (6, 1), (13, 2)],
  term (-108 : Rat) [(0, 2), (13, 2)],
  term (216 : Rat) [(1, 1), (7, 1), (13, 2)],
  term (-108 : Rat) [(1, 2), (13, 2)],
  term (-216 : Rat) [(6, 1), (13, 2), (14, 1)],
  term (-216 : Rat) [(7, 1), (13, 2), (15, 1)],
  term (108 : Rat) [(13, 2), (14, 2)],
  term (108 : Rat) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0033_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0033
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0034 : Poly :=
[
  term (13 : Rat) [(15, 2)]
]

/-- Partial product 34 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0034 : Poly :=
[
  term (-26 : Rat) [(0, 1), (6, 1), (15, 2)],
  term (13 : Rat) [(0, 2), (15, 2)],
  term (-26 : Rat) [(1, 1), (7, 1), (15, 2)],
  term (13 : Rat) [(1, 2), (15, 2)],
  term (26 : Rat) [(6, 1), (14, 1), (15, 2)],
  term (26 : Rat) [(7, 1), (15, 3)],
  term (-13 : Rat) [(14, 2), (15, 2)],
  term (-13 : Rat) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0034_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0034
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0035 : Poly :=
[
  term ((-47506541 : Rat) / 12867552) [(15, 2), (16, 1)]
]

/-- Partial product 35 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0035 : Poly :=
[
  term ((47506541 : Rat) / 6433776) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-47506541 : Rat) / 12867552) [(0, 2), (15, 2), (16, 1)],
  term ((47506541 : Rat) / 6433776) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-47506541 : Rat) / 12867552) [(1, 2), (15, 2), (16, 1)],
  term ((-47506541 : Rat) / 6433776) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-47506541 : Rat) / 6433776) [(7, 1), (15, 3), (16, 1)],
  term ((47506541 : Rat) / 12867552) [(14, 2), (15, 2), (16, 1)],
  term ((47506541 : Rat) / 12867552) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0035_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0035
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003NN_coefficient_18_0036 : Poly :=
[
  term ((-644035 : Rat) / 536148) [(15, 4), (16, 1)]
]

/-- Partial product 36 for generator 18. -/
def rs_R003_ueqv_R003NN_partial_18_0036 : Poly :=
[
  term ((644035 : Rat) / 268074) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term ((-644035 : Rat) / 536148) [(0, 2), (15, 4), (16, 1)],
  term ((644035 : Rat) / 268074) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term ((-644035 : Rat) / 536148) [(1, 2), (15, 4), (16, 1)],
  term ((-644035 : Rat) / 268074) [(6, 1), (14, 1), (15, 4), (16, 1)],
  term ((-644035 : Rat) / 268074) [(7, 1), (15, 5), (16, 1)],
  term ((644035 : Rat) / 536148) [(14, 2), (15, 4), (16, 1)],
  term ((644035 : Rat) / 536148) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 18. -/
theorem rs_R003_ueqv_R003NN_partial_18_0036_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_18_0036
        rs_R003_ueqv_R003NN_generator_18_0000_0036 =
      rs_R003_ueqv_R003NN_partial_18_0036 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_18_0000_0036 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_18_0000,
  rs_R003_ueqv_R003NN_partial_18_0001,
  rs_R003_ueqv_R003NN_partial_18_0002,
  rs_R003_ueqv_R003NN_partial_18_0003,
  rs_R003_ueqv_R003NN_partial_18_0004,
  rs_R003_ueqv_R003NN_partial_18_0005,
  rs_R003_ueqv_R003NN_partial_18_0006,
  rs_R003_ueqv_R003NN_partial_18_0007,
  rs_R003_ueqv_R003NN_partial_18_0008,
  rs_R003_ueqv_R003NN_partial_18_0009,
  rs_R003_ueqv_R003NN_partial_18_0010,
  rs_R003_ueqv_R003NN_partial_18_0011,
  rs_R003_ueqv_R003NN_partial_18_0012,
  rs_R003_ueqv_R003NN_partial_18_0013,
  rs_R003_ueqv_R003NN_partial_18_0014,
  rs_R003_ueqv_R003NN_partial_18_0015,
  rs_R003_ueqv_R003NN_partial_18_0016,
  rs_R003_ueqv_R003NN_partial_18_0017,
  rs_R003_ueqv_R003NN_partial_18_0018,
  rs_R003_ueqv_R003NN_partial_18_0019,
  rs_R003_ueqv_R003NN_partial_18_0020,
  rs_R003_ueqv_R003NN_partial_18_0021,
  rs_R003_ueqv_R003NN_partial_18_0022,
  rs_R003_ueqv_R003NN_partial_18_0023,
  rs_R003_ueqv_R003NN_partial_18_0024,
  rs_R003_ueqv_R003NN_partial_18_0025,
  rs_R003_ueqv_R003NN_partial_18_0026,
  rs_R003_ueqv_R003NN_partial_18_0027,
  rs_R003_ueqv_R003NN_partial_18_0028,
  rs_R003_ueqv_R003NN_partial_18_0029,
  rs_R003_ueqv_R003NN_partial_18_0030,
  rs_R003_ueqv_R003NN_partial_18_0031,
  rs_R003_ueqv_R003NN_partial_18_0032,
  rs_R003_ueqv_R003NN_partial_18_0033,
  rs_R003_ueqv_R003NN_partial_18_0034,
  rs_R003_ueqv_R003NN_partial_18_0035,
  rs_R003_ueqv_R003NN_partial_18_0036
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_18_0000_0036 : Poly :=
[
  term ((-12563 : Rat) / 44679) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (1, 1), (7, 1)],
  term ((6856 : Rat) / 44679) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((13332 : Rat) / 14893) [(0, 1), (1, 1), (7, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(0, 1), (1, 2)],
  term ((-3428 : Rat) / 44679) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6666 : Rat) / 14893) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((273343 : Rat) / 268074) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((65132 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((160171 : Rat) / 536148) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((34280 : Rat) / 134037) [(0, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-119972 : Rat) / 134037) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-143 : Rat) / 2) [(0, 1), (6, 1)],
  term (24 : Rat) [(0, 1), (6, 1), (7, 1), (13, 1)],
  term ((-59564 : Rat) / 134037) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-68507 : Rat) / 5724) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9313829 : Rat) / 3216888) [(0, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-128807 : Rat) / 134037) [(0, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (-64 : Rat) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-287017 : Rat) / 536148) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((257614 : Rat) / 134037) [(0, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-12680023 : Rat) / 12867552) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-380 : Rat) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((176715929 : Rat) / 12867552) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2447333 : Rat) / 536148) [(0, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term (216 : Rat) [(0, 1), (6, 1), (13, 2)],
  term (-24 : Rat) [(0, 1), (6, 1), (14, 1)],
  term ((-13332 : Rat) / 14893) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term (-26 : Rat) [(0, 1), (6, 1), (15, 2)],
  term ((47506541 : Rat) / 6433776) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((644035 : Rat) / 268074) [(0, 1), (6, 1), (15, 4), (16, 1)],
  term (12 : Rat) [(0, 1), (6, 2)],
  term ((112277 : Rat) / 268074) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9427 : Rat) / 29786) [(0, 1), (6, 2), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(0, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(0, 1), (7, 1), (15, 1)],
  term ((-13332 : Rat) / 14893) [(0, 1), (7, 1), (15, 3), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term (12 : Rat) [(0, 1), (14, 2)],
  term ((6666 : Rat) / 14893) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term (12 : Rat) [(0, 1), (15, 2)],
  term ((6666 : Rat) / 14893) [(0, 1), (15, 4), (16, 1)],
  term ((143 : Rat) / 4) [(0, 2)],
  term ((12563 : Rat) / 89358) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-273343 : Rat) / 536148) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(0, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-32566 : Rat) / 134037) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-160171 : Rat) / 1072296) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-17140 : Rat) / 134037) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((59986 : Rat) / 134037) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 268074) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 2), (6, 1)],
  term ((-30005 : Rat) / 536148) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((62755 : Rat) / 59572) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(0, 2), (7, 1), (13, 1)],
  term ((29782 : Rat) / 134037) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((68507 : Rat) / 11448) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((9313829 : Rat) / 6433776) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(0, 2), (9, 1), (13, 1)],
  term ((128807 : Rat) / 268074) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(0, 2), (9, 1), (15, 1)],
  term ((287017 : Rat) / 1072296) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 134037) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(0, 2), (11, 1), (15, 1)],
  term ((12680023 : Rat) / 25735104) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 178716) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term (190 : Rat) [(0, 2), (13, 1), (15, 1)],
  term ((-176715929 : Rat) / 25735104) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2447333 : Rat) / 1072296) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term (-108 : Rat) [(0, 2), (13, 2)],
  term (13 : Rat) [(0, 2), (15, 2)],
  term ((-47506541 : Rat) / 12867552) [(0, 2), (15, 2), (16, 1)],
  term ((-644035 : Rat) / 536148) [(0, 2), (15, 4), (16, 1)],
  term (-12 : Rat) [(0, 3)],
  term ((-3428 : Rat) / 44679) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((-6666 : Rat) / 14893) [(0, 3), (15, 2), (16, 1)],
  term ((273343 : Rat) / 268074) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((27424 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-6856 : Rat) / 44679) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((65132 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((160171 : Rat) / 536148) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((34280 : Rat) / 134037) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-119972 : Rat) / 134037) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (6, 1), (7, 1)],
  term ((112277 : Rat) / 268074) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9427 : Rat) / 29786) [(1, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((12563 : Rat) / 44679) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-143 : Rat) / 2) [(1, 1), (7, 1)],
  term ((-68507 : Rat) / 5724) [(1, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9313829 : Rat) / 3216888) [(1, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-128807 : Rat) / 134037) [(1, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (-64 : Rat) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-287017 : Rat) / 536148) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((257614 : Rat) / 134037) [(1, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term (48 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-12680023 : Rat) / 12867552) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 89358) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term (-380 : Rat) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((176715929 : Rat) / 12867552) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2447333 : Rat) / 536148) [(1, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term (216 : Rat) [(1, 1), (7, 1), (13, 2)],
  term (-26 : Rat) [(1, 1), (7, 1), (15, 2)],
  term ((49315613 : Rat) / 6433776) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((644035 : Rat) / 268074) [(1, 1), (7, 1), (15, 4), (16, 1)],
  term (24 : Rat) [(1, 1), (7, 2), (13, 1)],
  term ((-59564 : Rat) / 134037) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-12563 : Rat) / 89358) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12563 : Rat) / 89358) [(1, 1), (15, 3), (16, 1)],
  term ((143 : Rat) / 4) [(1, 2)],
  term ((-273343 : Rat) / 536148) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 134037) [(1, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13712 : Rat) / 134037) [(1, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((3428 : Rat) / 44679) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-32566 : Rat) / 134037) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-160171 : Rat) / 1072296) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-17140 : Rat) / 134037) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((59986 : Rat) / 134037) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 268074) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (6, 1)],
  term ((-112277 : Rat) / 536148) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((9427 : Rat) / 59572) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term (-12 : Rat) [(1, 2), (7, 1), (13, 1)],
  term ((-7907 : Rat) / 134037) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((68507 : Rat) / 11448) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((9313829 : Rat) / 6433776) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(1, 2), (9, 1), (13, 1)],
  term ((128807 : Rat) / 268074) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(1, 2), (9, 1), (15, 1)],
  term ((287017 : Rat) / 1072296) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 134037) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(1, 2), (11, 1), (15, 1)],
  term ((12680023 : Rat) / 25735104) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 178716) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term (190 : Rat) [(1, 2), (13, 1), (15, 1)],
  term ((-176715929 : Rat) / 25735104) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2447333 : Rat) / 1072296) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term (-108 : Rat) [(1, 2), (13, 2)],
  term (13 : Rat) [(1, 2), (15, 2)],
  term ((-47506541 : Rat) / 12867552) [(1, 2), (15, 2), (16, 1)],
  term ((-644035 : Rat) / 536148) [(1, 2), (15, 4), (16, 1)],
  term ((12563 : Rat) / 89358) [(1, 3), (15, 1), (16, 1)],
  term ((-273343 : Rat) / 268074) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-273343 : Rat) / 268074) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((273343 : Rat) / 536148) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((273343 : Rat) / 536148) [(2, 1), (15, 4), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65132 : Rat) / 134037) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-160171 : Rat) / 536148) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34280 : Rat) / 134037) [(3, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27424 : Rat) / 134037) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((6856 : Rat) / 44679) [(3, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-65132 : Rat) / 134037) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-160171 : Rat) / 536148) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-34280 : Rat) / 134037) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-6856 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6856 : Rat) / 134037) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((13712 : Rat) / 134037) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(3, 1), (11, 1), (15, 4), (16, 1)],
  term ((32566 : Rat) / 134037) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((32566 : Rat) / 134037) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((160171 : Rat) / 1072296) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((17140 : Rat) / 134037) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((160171 : Rat) / 1072296) [(3, 1), (15, 3), (16, 1)],
  term ((17140 : Rat) / 134037) [(3, 1), (15, 5), (16, 1)],
  term ((119972 : Rat) / 134037) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((119972 : Rat) / 134037) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-59986 : Rat) / 134037) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-24851 : Rat) / 134037) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 134037) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((24851 : Rat) / 268074) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((24851 : Rat) / 268074) [(5, 1), (15, 3), (16, 1)],
  term (-24 : Rat) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-112277 : Rat) / 268074) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((59564 : Rat) / 134037) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(6, 1), (7, 1), (15, 1)],
  term ((9427 : Rat) / 29786) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((68507 : Rat) / 5724) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9313829 : Rat) / 3216888) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term (-32 : Rat) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((128807 : Rat) / 134037) [(6, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (64 : Rat) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((287017 : Rat) / 536148) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-257614 : Rat) / 134037) [(6, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term (-48 : Rat) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((12680023 : Rat) / 12867552) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((128807 : Rat) / 89358) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term (380 : Rat) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-176715929 : Rat) / 12867552) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2447333 : Rat) / 536148) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((112277 : Rat) / 536148) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((112277 : Rat) / 536148) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term (-216 : Rat) [(6, 1), (13, 2), (14, 1)],
  term ((143 : Rat) / 2) [(6, 1), (14, 1)],
  term (26 : Rat) [(6, 1), (14, 1), (15, 2)],
  term ((-47506541 : Rat) / 6433776) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-644035 : Rat) / 268074) [(6, 1), (14, 1), (15, 4), (16, 1)],
  term (6 : Rat) [(6, 1), (14, 2)],
  term ((-9427 : Rat) / 59572) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(6, 1), (15, 2)],
  term ((-9427 : Rat) / 59572) [(6, 1), (15, 4), (16, 1)],
  term ((-112277 : Rat) / 268074) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(6, 2), (14, 1)],
  term ((9427 : Rat) / 29786) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((68507 : Rat) / 5724) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((9313829 : Rat) / 3216888) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term (-32 : Rat) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((128807 : Rat) / 134037) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term (64 : Rat) [(7, 1), (9, 1), (15, 2)],
  term ((287017 : Rat) / 536148) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-257614 : Rat) / 134037) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term (-48 : Rat) [(7, 1), (11, 1), (15, 2)],
  term ((12680023 : Rat) / 12867552) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((128807 : Rat) / 89358) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term (12 : Rat) [(7, 1), (13, 1), (14, 2)],
  term (392 : Rat) [(7, 1), (13, 1), (15, 2)],
  term ((-176715929 : Rat) / 12867552) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2447333 : Rat) / 536148) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term (-216 : Rat) [(7, 1), (13, 2), (15, 1)],
  term ((-29782 : Rat) / 134037) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((143 : Rat) / 2) [(7, 1), (15, 1)],
  term (26 : Rat) [(7, 1), (15, 3)],
  term ((-48936077 : Rat) / 6433776) [(7, 1), (15, 3), (16, 1)],
  term ((-644035 : Rat) / 268074) [(7, 1), (15, 5), (16, 1)],
  term (-24 : Rat) [(7, 2), (13, 1), (15, 1)],
  term ((59564 : Rat) / 134037) [(7, 2), (15, 2), (16, 1)],
  term ((-68507 : Rat) / 11448) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-68507 : Rat) / 11448) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-9313829 : Rat) / 6433776) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-9313829 : Rat) / 6433776) [(8, 1), (15, 4), (16, 1)],
  term (16 : Rat) [(9, 1), (13, 1), (14, 2)],
  term ((-128807 : Rat) / 268074) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(9, 1), (13, 1), (15, 2)],
  term ((-128807 : Rat) / 268074) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term (-32 : Rat) [(9, 1), (14, 2), (15, 1)],
  term ((-287017 : Rat) / 1072296) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((128807 : Rat) / 134037) [(9, 1), (14, 2), (15, 3), (16, 1)],
  term (-32 : Rat) [(9, 1), (15, 3)],
  term ((-287017 : Rat) / 1072296) [(9, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 134037) [(9, 1), (15, 5), (16, 1)],
  term (24 : Rat) [(11, 1), (14, 2), (15, 1)],
  term ((-12680023 : Rat) / 25735104) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-128807 : Rat) / 178716) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term (24 : Rat) [(11, 1), (15, 3)],
  term ((-12680023 : Rat) / 25735104) [(11, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(11, 1), (15, 5), (16, 1)],
  term (-190 : Rat) [(13, 1), (14, 2), (15, 1)],
  term ((176715929 : Rat) / 25735104) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2447333 : Rat) / 1072296) [(13, 1), (14, 2), (15, 3), (16, 1)],
  term (-190 : Rat) [(13, 1), (15, 3)],
  term ((176715929 : Rat) / 25735104) [(13, 1), (15, 3), (16, 1)],
  term ((2447333 : Rat) / 1072296) [(13, 1), (15, 5), (16, 1)],
  term (108 : Rat) [(13, 2), (14, 2)],
  term (108 : Rat) [(13, 2), (15, 2)],
  term ((-143 : Rat) / 4) [(14, 2)],
  term (-13 : Rat) [(14, 2), (15, 2)],
  term ((47506541 : Rat) / 12867552) [(14, 2), (15, 2), (16, 1)],
  term ((644035 : Rat) / 536148) [(14, 2), (15, 4), (16, 1)],
  term ((-143 : Rat) / 4) [(15, 2)],
  term (-13 : Rat) [(15, 4)],
  term ((47506541 : Rat) / 12867552) [(15, 4), (16, 1)],
  term ((644035 : Rat) / 536148) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 0 through 36. -/
theorem rs_R003_ueqv_R003NN_block_18_0000_0036_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_18_0000_0036
      rs_R003_ueqv_R003NN_block_18_0000_0036 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
