/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 20:0-6

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_20_0000_0006 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R003_ueqv_R003NN_coefficient_20_0000 : Poly :=
[
  term ((28279 : Rat) / 29786) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 20. -/
def rs_R003_ueqv_R003NN_partial_20_0000 : Poly :=
[
  term ((28279 : Rat) / 14893) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 29786) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((28279 : Rat) / 14893) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 29786) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R003_ueqv_R003NN_partial_20_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_20_0000
        rs_R003_ueqv_R003NN_generator_20_0000_0006 =
      rs_R003_ueqv_R003NN_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R003_ueqv_R003NN_coefficient_20_0001 : Poly :=
[
  term ((-59986 : Rat) / 134037) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R003_ueqv_R003NN_partial_20_0001 : Poly :=
[
  term ((-119972 : Rat) / 134037) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-119972 : Rat) / 134037) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R003_ueqv_R003NN_partial_20_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_20_0001
        rs_R003_ueqv_R003NN_generator_20_0000_0006 =
      rs_R003_ueqv_R003NN_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R003_ueqv_R003NN_coefficient_20_0002 : Poly :=
[
  term ((29993 : Rat) / 134037) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 20. -/
def rs_R003_ueqv_R003NN_partial_20_0002 : Poly :=
[
  term ((59986 : Rat) / 134037) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-29993 : Rat) / 134037) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R003_ueqv_R003NN_partial_20_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_20_0002
        rs_R003_ueqv_R003NN_generator_20_0000_0006 =
      rs_R003_ueqv_R003NN_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R003_ueqv_R003NN_coefficient_20_0003 : Poly :=
[
  term ((3428 : Rat) / 44679) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R003_ueqv_R003NN_partial_20_0003 : Poly :=
[
  term ((6856 : Rat) / 44679) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R003_ueqv_R003NN_partial_20_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_20_0003
        rs_R003_ueqv_R003NN_generator_20_0000_0006 =
      rs_R003_ueqv_R003NN_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R003_ueqv_R003NN_coefficient_20_0004 : Poly :=
[
  term ((-35135 : Rat) / 268074) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R003_ueqv_R003NN_partial_20_0004 : Poly :=
[
  term ((-35135 : Rat) / 134037) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((35135 : Rat) / 268074) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-35135 : Rat) / 134037) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((35135 : Rat) / 268074) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R003_ueqv_R003NN_partial_20_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_20_0004
        rs_R003_ueqv_R003NN_generator_20_0000_0006 =
      rs_R003_ueqv_R003NN_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R003_ueqv_R003NN_coefficient_20_0005 : Poly :=
[
  term ((3877651 : Rat) / 804222) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 20. -/
def rs_R003_ueqv_R003NN_partial_20_0005 : Poly :=
[
  term ((3877651 : Rat) / 402111) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3877651 : Rat) / 804222) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((3877651 : Rat) / 402111) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3877651 : Rat) / 804222) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R003_ueqv_R003NN_partial_20_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_20_0005
        rs_R003_ueqv_R003NN_generator_20_0000_0006 =
      rs_R003_ueqv_R003NN_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R003_ueqv_R003NN_coefficient_20_0006 : Poly :=
[
  term ((-509881 : Rat) / 402111) [(15, 2), (16, 1)]
]

/-- Partial product 6 for generator 20. -/
def rs_R003_ueqv_R003NN_partial_20_0006 : Poly :=
[
  term ((-1019762 : Rat) / 402111) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((509881 : Rat) / 402111) [(4, 2), (15, 2), (16, 1)],
  term ((-1019762 : Rat) / 402111) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((509881 : Rat) / 402111) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R003_ueqv_R003NN_partial_20_0006_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_20_0006
        rs_R003_ueqv_R003NN_generator_20_0000_0006 =
      rs_R003_ueqv_R003NN_partial_20_0006 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_20_0000_0006 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_20_0000,
  rs_R003_ueqv_R003NN_partial_20_0001,
  rs_R003_ueqv_R003NN_partial_20_0002,
  rs_R003_ueqv_R003NN_partial_20_0003,
  rs_R003_ueqv_R003NN_partial_20_0004,
  rs_R003_ueqv_R003NN_partial_20_0005,
  rs_R003_ueqv_R003NN_partial_20_0006
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_20_0000_0006 : Poly :=
[
  term ((28279 : Rat) / 14893) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 29786) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((28279 : Rat) / 14893) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 29786) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-119972 : Rat) / 134037) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35135 : Rat) / 134037) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((3877651 : Rat) / 402111) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1019762 : Rat) / 402111) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-29993 : Rat) / 134037) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-3428 : Rat) / 44679) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((35135 : Rat) / 268074) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-119972 : Rat) / 134037) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3877651 : Rat) / 804222) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((509881 : Rat) / 402111) [(4, 2), (15, 2), (16, 1)],
  term ((59986 : Rat) / 134037) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((6856 : Rat) / 44679) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35135 : Rat) / 134037) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((3877651 : Rat) / 402111) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1019762 : Rat) / 402111) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3428 : Rat) / 44679) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((35135 : Rat) / 268074) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((59986 : Rat) / 134037) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3877651 : Rat) / 804222) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((509881 : Rat) / 402111) [(5, 2), (15, 2), (16, 1)],
  term ((-29993 : Rat) / 134037) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 6. -/
theorem rs_R003_ueqv_R003NN_block_20_0000_0006_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_20_0000_0006
      rs_R003_ueqv_R003NN_block_20_0000_0006 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
