/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 22:100-112

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_22_0100_0112 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0100 : Poly :=
[
  term ((-1180595 : Rat) / 6433776) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 100 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0100 : Poly :=
[
  term ((1180595 : Rat) / 3216888) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 6433776) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 3216888) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 6433776) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 3216888) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((1180595 : Rat) / 6433776) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0100_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0100
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0101 : Poly :=
[
  term ((-66847 : Rat) / 134037) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0101 : Poly :=
[
  term ((133694 : Rat) / 134037) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((133694 : Rat) / 134037) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-133694 : Rat) / 134037) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((66847 : Rat) / 134037) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0101_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0101
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0102 : Poly :=
[
  term ((191 : Rat) / 4) [(13, 1), (15, 1)]
]

/-- Partial product 102 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0102 : Poly :=
[
  term ((-191 : Rat) / 2) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((191 : Rat) / 4) [(0, 2), (13, 1), (15, 1)],
  term ((-191 : Rat) / 2) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((191 : Rat) / 4) [(1, 2), (13, 1), (15, 1)],
  term ((191 : Rat) / 2) [(10, 1), (13, 1), (15, 1)],
  term ((-191 : Rat) / 4) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0102_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0102
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0103 : Poly :=
[
  term ((-84214997 : Rat) / 51470208) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0103 : Poly :=
[
  term ((84214997 : Rat) / 25735104) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84214997 : Rat) / 51470208) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((84214997 : Rat) / 25735104) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-84214997 : Rat) / 51470208) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-84214997 : Rat) / 25735104) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((84214997 : Rat) / 51470208) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0103_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0103
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0104 : Poly :=
[
  term (24 : Rat) [(13, 1), (15, 3)]
]

/-- Partial product 104 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0104 : Poly :=
[
  term (-48 : Rat) [(0, 1), (10, 1), (13, 1), (15, 3)],
  term (24 : Rat) [(0, 2), (13, 1), (15, 3)],
  term (-48 : Rat) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term (24 : Rat) [(1, 2), (13, 1), (15, 3)],
  term (48 : Rat) [(10, 1), (13, 1), (15, 3)],
  term (-24 : Rat) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0104_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0104
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0105 : Poly :=
[
  term ((-5597635 : Rat) / 2144592) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 105 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0105 : Poly :=
[
  term ((5597635 : Rat) / 1072296) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5597635 : Rat) / 2144592) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((5597635 : Rat) / 1072296) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5597635 : Rat) / 2144592) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5597635 : Rat) / 1072296) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((5597635 : Rat) / 2144592) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0105_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0105
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0106 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(13, 1), (15, 5), (16, 1)]
]

/-- Partial product 106 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0106 : Poly :=
[
  term ((128807 : Rat) / 89358) [(0, 1), (10, 1), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 2), (13, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(1, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 2), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 89358) [(10, 1), (13, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 178716) [(13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0106_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0106
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0107 : Poly :=
[
  term ((-21 : Rat) / 2) [(13, 2)]
]

/-- Partial product 107 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0107 : Poly :=
[
  term (21 : Rat) [(0, 1), (10, 1), (13, 2)],
  term ((-21 : Rat) / 2) [(0, 2), (13, 2)],
  term (21 : Rat) [(1, 1), (11, 1), (13, 2)],
  term ((-21 : Rat) / 2) [(1, 2), (13, 2)],
  term (-21 : Rat) [(10, 1), (13, 2)],
  term ((21 : Rat) / 2) [(13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0107_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0107
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0108 : Poly :=
[
  term ((-65 : Rat) / 8) [(15, 2)]
]

/-- Partial product 108 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0108 : Poly :=
[
  term ((65 : Rat) / 4) [(0, 1), (10, 1), (15, 2)],
  term ((-65 : Rat) / 8) [(0, 2), (15, 2)],
  term ((65 : Rat) / 4) [(1, 1), (11, 1), (15, 2)],
  term ((-65 : Rat) / 8) [(1, 2), (15, 2)],
  term ((-65 : Rat) / 4) [(10, 1), (15, 2)],
  term ((65 : Rat) / 8) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0108_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0108
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0109 : Poly :=
[
  term ((-20909477 : Rat) / 12867552) [(15, 2), (16, 1)]
]

/-- Partial product 109 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0109 : Poly :=
[
  term ((20909477 : Rat) / 6433776) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-20909477 : Rat) / 12867552) [(0, 2), (15, 2), (16, 1)],
  term ((20909477 : Rat) / 6433776) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20909477 : Rat) / 12867552) [(1, 2), (15, 2), (16, 1)],
  term ((-20909477 : Rat) / 6433776) [(10, 1), (15, 2), (16, 1)],
  term ((20909477 : Rat) / 12867552) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0109_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0109
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0110 : Poly :=
[
  term (-12 : Rat) [(15, 4)]
]

/-- Partial product 110 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0110 : Poly :=
[
  term (24 : Rat) [(0, 1), (10, 1), (15, 4)],
  term (-12 : Rat) [(0, 2), (15, 4)],
  term (24 : Rat) [(1, 1), (11, 1), (15, 4)],
  term (-12 : Rat) [(1, 2), (15, 4)],
  term (-24 : Rat) [(10, 1), (15, 4)],
  term (12 : Rat) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0110_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0110
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0111 : Poly :=
[
  term ((230495 : Rat) / 268074) [(15, 4), (16, 1)]
]

/-- Partial product 111 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0111 : Poly :=
[
  term ((-230495 : Rat) / 134037) [(0, 1), (10, 1), (15, 4), (16, 1)],
  term ((230495 : Rat) / 268074) [(0, 2), (15, 4), (16, 1)],
  term ((-230495 : Rat) / 134037) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((230495 : Rat) / 268074) [(1, 2), (15, 4), (16, 1)],
  term ((230495 : Rat) / 134037) [(10, 1), (15, 4), (16, 1)],
  term ((-230495 : Rat) / 268074) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0111_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0111
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 22. -/
def rs_R003_ueqv_R003NN_coefficient_22_0112 : Poly :=
[
  term ((128807 : Rat) / 357432) [(15, 6), (16, 1)]
]

/-- Partial product 112 for generator 22. -/
def rs_R003_ueqv_R003NN_partial_22_0112 : Poly :=
[
  term ((-128807 : Rat) / 178716) [(0, 1), (10, 1), (15, 6), (16, 1)],
  term ((128807 : Rat) / 357432) [(0, 2), (15, 6), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 1), (11, 1), (15, 6), (16, 1)],
  term ((128807 : Rat) / 357432) [(1, 2), (15, 6), (16, 1)],
  term ((128807 : Rat) / 178716) [(10, 1), (15, 6), (16, 1)],
  term ((-128807 : Rat) / 357432) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 22. -/
theorem rs_R003_ueqv_R003NN_partial_22_0112_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_22_0112
        rs_R003_ueqv_R003NN_generator_22_0100_0112 =
      rs_R003_ueqv_R003NN_partial_22_0112 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_22_0100_0112 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_22_0100,
  rs_R003_ueqv_R003NN_partial_22_0101,
  rs_R003_ueqv_R003NN_partial_22_0102,
  rs_R003_ueqv_R003NN_partial_22_0103,
  rs_R003_ueqv_R003NN_partial_22_0104,
  rs_R003_ueqv_R003NN_partial_22_0105,
  rs_R003_ueqv_R003NN_partial_22_0106,
  rs_R003_ueqv_R003NN_partial_22_0107,
  rs_R003_ueqv_R003NN_partial_22_0108,
  rs_R003_ueqv_R003NN_partial_22_0109,
  rs_R003_ueqv_R003NN_partial_22_0110,
  rs_R003_ueqv_R003NN_partial_22_0111,
  rs_R003_ueqv_R003NN_partial_22_0112
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_22_0100_0112 : Poly :=
[
  term ((1180595 : Rat) / 3216888) [(0, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((133694 : Rat) / 134037) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-191 : Rat) / 2) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((84214997 : Rat) / 25735104) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 1), (10, 1), (13, 1), (15, 3)],
  term ((5597635 : Rat) / 1072296) [(0, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(0, 1), (10, 1), (13, 1), (15, 5), (16, 1)],
  term (21 : Rat) [(0, 1), (10, 1), (13, 2)],
  term ((65 : Rat) / 4) [(0, 1), (10, 1), (15, 2)],
  term ((20909477 : Rat) / 6433776) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(0, 1), (10, 1), (15, 4)],
  term ((-230495 : Rat) / 134037) [(0, 1), (10, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 1), (10, 1), (15, 6), (16, 1)],
  term ((-1180595 : Rat) / 6433776) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-66847 : Rat) / 134037) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((191 : Rat) / 4) [(0, 2), (13, 1), (15, 1)],
  term ((-84214997 : Rat) / 51470208) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (13, 1), (15, 3)],
  term ((-5597635 : Rat) / 2144592) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(0, 2), (13, 1), (15, 5), (16, 1)],
  term ((-21 : Rat) / 2) [(0, 2), (13, 2)],
  term ((-65 : Rat) / 8) [(0, 2), (15, 2)],
  term ((-20909477 : Rat) / 12867552) [(0, 2), (15, 2), (16, 1)],
  term (-12 : Rat) [(0, 2), (15, 4)],
  term ((230495 : Rat) / 268074) [(0, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 357432) [(0, 2), (15, 6), (16, 1)],
  term ((133694 : Rat) / 134037) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-191 : Rat) / 2) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((84214997 : Rat) / 25735104) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((5597635 : Rat) / 1072296) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(1, 1), (11, 1), (13, 1), (15, 5), (16, 1)],
  term (21 : Rat) [(1, 1), (11, 1), (13, 2)],
  term ((65 : Rat) / 4) [(1, 1), (11, 1), (15, 2)],
  term ((20909477 : Rat) / 6433776) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(1, 1), (11, 1), (15, 4)],
  term ((-230495 : Rat) / 134037) [(1, 1), (11, 1), (15, 4), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 1), (11, 1), (15, 6), (16, 1)],
  term ((1180595 : Rat) / 3216888) [(1, 1), (11, 2), (15, 3), (16, 1)],
  term ((-1180595 : Rat) / 6433776) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((-66847 : Rat) / 134037) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((191 : Rat) / 4) [(1, 2), (13, 1), (15, 1)],
  term ((-84214997 : Rat) / 51470208) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 2), (13, 1), (15, 3)],
  term ((-5597635 : Rat) / 2144592) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 178716) [(1, 2), (13, 1), (15, 5), (16, 1)],
  term ((-21 : Rat) / 2) [(1, 2), (13, 2)],
  term ((-65 : Rat) / 8) [(1, 2), (15, 2)],
  term ((-20909477 : Rat) / 12867552) [(1, 2), (15, 2), (16, 1)],
  term (-12 : Rat) [(1, 2), (15, 4)],
  term ((230495 : Rat) / 268074) [(1, 2), (15, 4), (16, 1)],
  term ((128807 : Rat) / 357432) [(1, 2), (15, 6), (16, 1)],
  term ((-1180595 : Rat) / 3216888) [(10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-133694 : Rat) / 134037) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((191 : Rat) / 2) [(10, 1), (13, 1), (15, 1)],
  term ((-84214997 : Rat) / 25735104) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(10, 1), (13, 1), (15, 3)],
  term ((-5597635 : Rat) / 1072296) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(10, 1), (13, 1), (15, 5), (16, 1)],
  term (-21 : Rat) [(10, 1), (13, 2)],
  term ((-65 : Rat) / 4) [(10, 1), (15, 2)],
  term ((-20909477 : Rat) / 6433776) [(10, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(10, 1), (15, 4)],
  term ((230495 : Rat) / 134037) [(10, 1), (15, 4), (16, 1)],
  term ((128807 : Rat) / 178716) [(10, 1), (15, 6), (16, 1)],
  term ((1180595 : Rat) / 6433776) [(11, 1), (15, 3), (16, 1)],
  term ((66847 : Rat) / 134037) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-191 : Rat) / 4) [(13, 1), (15, 1)],
  term ((84214997 : Rat) / 51470208) [(13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(13, 1), (15, 3)],
  term ((5597635 : Rat) / 2144592) [(13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 178716) [(13, 1), (15, 5), (16, 1)],
  term ((21 : Rat) / 2) [(13, 2)],
  term ((65 : Rat) / 8) [(15, 2)],
  term ((20909477 : Rat) / 12867552) [(15, 2), (16, 1)],
  term (12 : Rat) [(15, 4)],
  term ((-230495 : Rat) / 268074) [(15, 4), (16, 1)],
  term ((-128807 : Rat) / 357432) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 100 through 112. -/
theorem rs_R003_ueqv_R003NN_block_22_0100_0112_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_22_0100_0112
      rs_R003_ueqv_R003NN_block_22_0100_0112 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
