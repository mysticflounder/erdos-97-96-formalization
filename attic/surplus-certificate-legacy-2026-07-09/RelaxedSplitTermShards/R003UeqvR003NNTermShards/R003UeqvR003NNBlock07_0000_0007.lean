/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 7:0-7

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_07_0000_0007 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NN_coefficient_07_0000 : Poly :=
[
  term ((-314497 : Rat) / 536148) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R003_ueqv_R003NN_partial_07_0000 : Poly :=
[
  term ((-314497 : Rat) / 268074) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((314497 : Rat) / 268074) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((314497 : Rat) / 536148) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((314497 : Rat) / 536148) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 536148) [(1, 1), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 268074) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R003_ueqv_R003NN_partial_07_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_07_0000
        rs_R003_ueqv_R003NN_generator_07_0000_0007 =
      rs_R003_ueqv_R003NN_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NN_coefficient_07_0001 : Poly :=
[
  term ((109403 : Rat) / 178716) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R003_ueqv_R003NN_partial_07_0001 : Poly :=
[
  term ((-109403 : Rat) / 89358) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((109403 : Rat) / 89358) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((109403 : Rat) / 89358) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-109403 : Rat) / 178716) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((109403 : Rat) / 178716) [(2, 1), (15, 2), (16, 1)],
  term ((-109403 : Rat) / 178716) [(2, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R003_ueqv_R003NN_partial_07_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_07_0001
        rs_R003_ueqv_R003NN_generator_07_0000_0007 =
      rs_R003_ueqv_R003NN_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NN_coefficient_07_0002 : Poly :=
[
  term ((-109403 : Rat) / 357432) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R003_ueqv_R003NN_partial_07_0002 : Poly :=
[
  term ((-109403 : Rat) / 178716) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((109403 : Rat) / 357432) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 357432) [(3, 1), (15, 1), (16, 1)],
  term ((109403 : Rat) / 357432) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R003_ueqv_R003NN_partial_07_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_07_0002
        rs_R003_ueqv_R003NN_generator_07_0000_0007 =
      rs_R003_ueqv_R003NN_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NN_coefficient_07_0003 : Poly :=
[
  term ((199667 : Rat) / 268074) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R003_ueqv_R003NN_partial_07_0003 : Poly :=
[
  term ((199667 : Rat) / 134037) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R003_ueqv_R003NN_partial_07_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_07_0003
        rs_R003_ueqv_R003NN_generator_07_0000_0007 =
      rs_R003_ueqv_R003NN_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NN_coefficient_07_0004 : Poly :=
[
  term ((55705 : Rat) / 178716) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R003_ueqv_R003NN_partial_07_0004 : Poly :=
[
  term ((55705 : Rat) / 89358) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 89358) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 89358) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 178716) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 178716) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 178716) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R003_ueqv_R003NN_partial_07_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_07_0004
        rs_R003_ueqv_R003NN_generator_07_0000_0007 =
      rs_R003_ueqv_R003NN_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NN_coefficient_07_0005 : Poly :=
[
  term ((-1714 : Rat) / 134037) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R003_ueqv_R003NN_partial_07_0005 : Poly :=
[
  term ((-3428 : Rat) / 134037) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 134037) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 134037) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 134037) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R003_ueqv_R003NN_partial_07_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_07_0005
        rs_R003_ueqv_R003NN_generator_07_0000_0007 =
      rs_R003_ueqv_R003NN_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NN_coefficient_07_0006 : Poly :=
[
  term ((-598925 : Rat) / 1072296) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R003_ueqv_R003NN_partial_07_0006 : Poly :=
[
  term ((-598925 : Rat) / 536148) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((598925 : Rat) / 536148) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-598925 : Rat) / 536148) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((598925 : Rat) / 1072296) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((598925 : Rat) / 1072296) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-598925 : Rat) / 1072296) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R003_ueqv_R003NN_partial_07_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_07_0006
        rs_R003_ueqv_R003NN_generator_07_0000_0007 =
      rs_R003_ueqv_R003NN_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R003_ueqv_R003NN_coefficient_07_0007 : Poly :=
[
  term ((-622985 : Rat) / 1072296) [(15, 2), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R003_ueqv_R003NN_partial_07_0007 : Poly :=
[
  term ((-622985 : Rat) / 536148) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((622985 : Rat) / 536148) [(0, 1), (15, 2), (16, 1)],
  term ((-622985 : Rat) / 536148) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((622985 : Rat) / 1072296) [(2, 2), (15, 2), (16, 1)],
  term ((622985 : Rat) / 1072296) [(3, 2), (15, 2), (16, 1)],
  term ((-622985 : Rat) / 1072296) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R003_ueqv_R003NN_partial_07_0007_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_07_0007
        rs_R003_ueqv_R003NN_generator_07_0000_0007 =
      rs_R003_ueqv_R003NN_partial_07_0007 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_07_0000_0007 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_07_0000,
  rs_R003_ueqv_R003NN_partial_07_0001,
  rs_R003_ueqv_R003NN_partial_07_0002,
  rs_R003_ueqv_R003NN_partial_07_0003,
  rs_R003_ueqv_R003NN_partial_07_0004,
  rs_R003_ueqv_R003NN_partial_07_0005,
  rs_R003_ueqv_R003NN_partial_07_0006,
  rs_R003_ueqv_R003NN_partial_07_0007
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_07_0000_0007 : Poly :=
[
  term ((-314497 : Rat) / 268074) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((314497 : Rat) / 268074) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 89358) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-598925 : Rat) / 536148) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1279403 : Rat) / 536148) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((109403 : Rat) / 89358) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((109403 : Rat) / 178716) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 134037) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 89358) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((3428 : Rat) / 134037) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((598925 : Rat) / 536148) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((622985 : Rat) / 536148) [(0, 1), (15, 2), (16, 1)],
  term ((109403 : Rat) / 89358) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((314497 : Rat) / 536148) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((199667 : Rat) / 134037) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 89358) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 134037) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-598925 : Rat) / 536148) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-622985 : Rat) / 536148) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 134037) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 536148) [(1, 1), (15, 1), (16, 1)],
  term ((-314497 : Rat) / 268074) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-109403 : Rat) / 178716) [(2, 1), (3, 2), (15, 2), (16, 1)],
  term ((109403 : Rat) / 178716) [(2, 1), (15, 2), (16, 1)],
  term ((109403 : Rat) / 357432) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 178716) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 134037) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((598925 : Rat) / 1072296) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((622985 : Rat) / 1072296) [(2, 2), (15, 2), (16, 1)],
  term ((-109403 : Rat) / 178716) [(2, 3), (15, 2), (16, 1)],
  term ((-109403 : Rat) / 357432) [(3, 1), (15, 1), (16, 1)],
  term ((-199667 : Rat) / 268074) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-55705 : Rat) / 178716) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1714 : Rat) / 134037) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((598925 : Rat) / 1072296) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((622985 : Rat) / 1072296) [(3, 2), (15, 2), (16, 1)],
  term ((109403 : Rat) / 357432) [(3, 3), (15, 1), (16, 1)],
  term ((199667 : Rat) / 268074) [(5, 1), (15, 1), (16, 1)],
  term ((55705 : Rat) / 178716) [(7, 1), (15, 1), (16, 1)],
  term ((-1714 : Rat) / 134037) [(11, 1), (15, 1), (16, 1)],
  term ((-598925 : Rat) / 1072296) [(13, 1), (15, 1), (16, 1)],
  term ((-622985 : Rat) / 1072296) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 7. -/
theorem rs_R003_ueqv_R003NN_block_07_0000_0007_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_07_0000_0007
      rs_R003_ueqv_R003NN_block_07_0000_0007 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
