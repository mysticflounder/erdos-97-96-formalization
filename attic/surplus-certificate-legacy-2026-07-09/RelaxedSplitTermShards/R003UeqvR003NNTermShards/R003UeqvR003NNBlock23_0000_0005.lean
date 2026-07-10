/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 23:0-5

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 23 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_23_0000_0005 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 23. -/
def rs_R003_ueqv_R003NN_coefficient_23_0000 : Poly :=
[
  term ((-99404 : Rat) / 134037) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 23. -/
def rs_R003_ueqv_R003NN_partial_23_0000 : Poly :=
[
  term ((198808 : Rat) / 134037) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(0, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 23. -/
theorem rs_R003_ueqv_R003NN_partial_23_0000_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_23_0000
        rs_R003_ueqv_R003NN_generator_23_0000_0005 =
      rs_R003_ueqv_R003NN_partial_23_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 23. -/
def rs_R003_ueqv_R003NN_coefficient_23_0001 : Poly :=
[
  term ((86551 : Rat) / 89358) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 23. -/
def rs_R003_ueqv_R003NN_partial_23_0001 : Poly :=
[
  term ((-86551 : Rat) / 44679) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((86551 : Rat) / 89358) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((86551 : Rat) / 44679) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-86551 : Rat) / 89358) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((86551 : Rat) / 44679) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86551 : Rat) / 89358) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-86551 : Rat) / 44679) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((86551 : Rat) / 89358) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 23. -/
theorem rs_R003_ueqv_R003NN_partial_23_0001_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_23_0001
        rs_R003_ueqv_R003NN_generator_23_0000_0005 =
      rs_R003_ueqv_R003NN_partial_23_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 23. -/
def rs_R003_ueqv_R003NN_coefficient_23_0002 : Poly :=
[
  term ((-28279 : Rat) / 29786) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 23. -/
def rs_R003_ueqv_R003NN_partial_23_0002 : Poly :=
[
  term ((28279 : Rat) / 14893) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 29786) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((28279 : Rat) / 14893) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 29786) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 14893) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((28279 : Rat) / 29786) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 14893) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((28279 : Rat) / 29786) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 23. -/
theorem rs_R003_ueqv_R003NN_partial_23_0002_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_23_0002
        rs_R003_ueqv_R003NN_generator_23_0000_0005 =
      rs_R003_ueqv_R003NN_partial_23_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 23. -/
def rs_R003_ueqv_R003NN_coefficient_23_0003 : Poly :=
[
  term ((24851 : Rat) / 268074) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 23. -/
def rs_R003_ueqv_R003NN_partial_23_0003 : Poly :=
[
  term ((-24851 : Rat) / 134037) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 268074) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 134037) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 268074) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 268074) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 268074) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 23. -/
theorem rs_R003_ueqv_R003NN_partial_23_0003_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_23_0003
        rs_R003_ueqv_R003NN_generator_23_0000_0005 =
      rs_R003_ueqv_R003NN_partial_23_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 23. -/
def rs_R003_ueqv_R003NN_coefficient_23_0004 : Poly :=
[
  term ((-293929 : Rat) / 134037) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 23. -/
def rs_R003_ueqv_R003NN_partial_23_0004 : Poly :=
[
  term ((587858 : Rat) / 134037) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-293929 : Rat) / 134037) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((587858 : Rat) / 134037) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-293929 : Rat) / 134037) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-587858 : Rat) / 134037) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((293929 : Rat) / 134037) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-587858 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((293929 : Rat) / 134037) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 23. -/
theorem rs_R003_ueqv_R003NN_partial_23_0004_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_23_0004
        rs_R003_ueqv_R003NN_generator_23_0000_0005 =
      rs_R003_ueqv_R003NN_partial_23_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 23. -/
def rs_R003_ueqv_R003NN_coefficient_23_0005 : Poly :=
[
  term ((-509881 : Rat) / 402111) [(15, 2), (16, 1)]
]

/-- Partial product 5 for generator 23. -/
def rs_R003_ueqv_R003NN_partial_23_0005 : Poly :=
[
  term ((1019762 : Rat) / 402111) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-509881 : Rat) / 402111) [(0, 2), (15, 2), (16, 1)],
  term ((1019762 : Rat) / 402111) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-509881 : Rat) / 402111) [(1, 2), (15, 2), (16, 1)],
  term ((-1019762 : Rat) / 402111) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((509881 : Rat) / 402111) [(4, 2), (15, 2), (16, 1)],
  term ((-1019762 : Rat) / 402111) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((509881 : Rat) / 402111) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 23. -/
theorem rs_R003_ueqv_R003NN_partial_23_0005_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_23_0005
        rs_R003_ueqv_R003NN_generator_23_0000_0005 =
      rs_R003_ueqv_R003NN_partial_23_0005 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_23_0000_0005 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_23_0000,
  rs_R003_ueqv_R003NN_partial_23_0001,
  rs_R003_ueqv_R003NN_partial_23_0002,
  rs_R003_ueqv_R003NN_partial_23_0003,
  rs_R003_ueqv_R003NN_partial_23_0004,
  rs_R003_ueqv_R003NN_partial_23_0005
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_23_0000_0005 : Poly :=
[
  term ((-86551 : Rat) / 44679) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-99404 : Rat) / 134037) [(0, 1), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((28279 : Rat) / 14893) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-198808 : Rat) / 134037) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((99404 : Rat) / 134037) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 134037) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((587858 : Rat) / 134037) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1019762 : Rat) / 402111) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((86551 : Rat) / 89358) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 29786) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 268074) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((198808 : Rat) / 134037) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-293929 : Rat) / 134037) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-509881 : Rat) / 402111) [(0, 2), (15, 2), (16, 1)],
  term ((-99404 : Rat) / 134037) [(0, 3), (13, 1), (15, 1), (16, 1)],
  term ((28279 : Rat) / 14893) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((86551 : Rat) / 44679) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-86551 : Rat) / 89358) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((86551 : Rat) / 44679) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-86551 : Rat) / 89358) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-24851 : Rat) / 134037) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((587858 : Rat) / 134037) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1019762 : Rat) / 402111) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-28279 : Rat) / 29786) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((24851 : Rat) / 268074) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-86551 : Rat) / 44679) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-293929 : Rat) / 134037) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-509881 : Rat) / 402111) [(1, 2), (15, 2), (16, 1)],
  term ((86551 : Rat) / 89358) [(1, 3), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 14893) [(3, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((28279 : Rat) / 29786) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-28279 : Rat) / 14893) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((28279 : Rat) / 29786) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((24851 : Rat) / 134037) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-587858 : Rat) / 134037) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1019762 : Rat) / 402111) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-24851 : Rat) / 268074) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((293929 : Rat) / 134037) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((509881 : Rat) / 402111) [(4, 2), (15, 2), (16, 1)],
  term ((24851 : Rat) / 134037) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-587858 : Rat) / 134037) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1019762 : Rat) / 402111) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-24851 : Rat) / 268074) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((293929 : Rat) / 134037) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((509881 : Rat) / 402111) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 0 through 5. -/
theorem rs_R003_ueqv_R003NN_block_23_0000_0005_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_23_0000_0005
      rs_R003_ueqv_R003NN_block_23_0000_0005 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
