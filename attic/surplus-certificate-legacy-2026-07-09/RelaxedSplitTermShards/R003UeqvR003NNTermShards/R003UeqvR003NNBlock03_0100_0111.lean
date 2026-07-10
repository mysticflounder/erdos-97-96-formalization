/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003NN, term block 3:100-111

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003NNTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R003:u=v:R003NN`. -/
def rs_R003_ueqv_R003NN_generator_03_0100_0111 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0100 : Poly :=
[
  term ((-66847 : Rat) / 134037) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0100 : Poly :=
[
  term ((133694 : Rat) / 134037) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66847 : Rat) / 134037) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-133694 : Rat) / 134037) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((66847 : Rat) / 134037) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((66847 : Rat) / 134037) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0100_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0100
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0101 : Poly :=
[
  term ((-517 : Rat) / 2) [(13, 1), (15, 1)]
]

/-- Partial product 101 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0101 : Poly :=
[
  term (517 : Rat) [(4, 1), (13, 1), (15, 1)],
  term ((-517 : Rat) / 2) [(4, 2), (13, 1), (15, 1)],
  term ((-517 : Rat) / 2) [(5, 2), (13, 1), (15, 1)],
  term (-517 : Rat) [(8, 1), (13, 1), (15, 1)],
  term ((517 : Rat) / 2) [(8, 2), (13, 1), (15, 1)],
  term ((517 : Rat) / 2) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0101_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0101
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0102 : Poly :=
[
  term ((-4053841 : Rat) / 8578368) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0102 : Poly :=
[
  term ((4053841 : Rat) / 4289184) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4053841 : Rat) / 8578368) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4053841 : Rat) / 8578368) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4053841 : Rat) / 4289184) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4053841 : Rat) / 8578368) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((4053841 : Rat) / 8578368) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0102_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0102
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0103 : Poly :=
[
  term (-48 : Rat) [(13, 1), (15, 3)]
]

/-- Partial product 103 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0103 : Poly :=
[
  term (96 : Rat) [(4, 1), (13, 1), (15, 3)],
  term (-48 : Rat) [(4, 2), (13, 1), (15, 3)],
  term (-48 : Rat) [(5, 2), (13, 1), (15, 3)],
  term (-96 : Rat) [(8, 1), (13, 1), (15, 3)],
  term (48 : Rat) [(8, 2), (13, 1), (15, 3)],
  term (48 : Rat) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0103_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0103
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0104 : Poly :=
[
  term ((2153905 : Rat) / 536148) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 104 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0104 : Poly :=
[
  term ((-2153905 : Rat) / 268074) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((2153905 : Rat) / 536148) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((2153905 : Rat) / 536148) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((2153905 : Rat) / 268074) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2153905 : Rat) / 536148) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2153905 : Rat) / 536148) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0104_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0104
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0105 : Poly :=
[
  term ((128807 : Rat) / 89358) [(13, 1), (15, 5), (16, 1)]
]

/-- Partial product 105 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0105 : Poly :=
[
  term ((-128807 : Rat) / 44679) [(4, 1), (13, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(4, 2), (13, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 89358) [(5, 2), (13, 1), (15, 5), (16, 1)],
  term ((128807 : Rat) / 44679) [(8, 1), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 89358) [(8, 2), (13, 1), (15, 5), (16, 1)],
  term ((-128807 : Rat) / 89358) [(9, 2), (13, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0105_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0105
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0106 : Poly :=
[
  term (87 : Rat) [(13, 2)]
]

/-- Partial product 106 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0106 : Poly :=
[
  term (-174 : Rat) [(4, 1), (13, 2)],
  term (87 : Rat) [(4, 2), (13, 2)],
  term (87 : Rat) [(5, 2), (13, 2)],
  term (174 : Rat) [(8, 1), (13, 2)],
  term (-87 : Rat) [(8, 2), (13, 2)],
  term (-87 : Rat) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0106_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0106
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0107 : Poly :=
[
  term ((277 : Rat) / 4) [(15, 2)]
]

/-- Partial product 107 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0107 : Poly :=
[
  term ((-277 : Rat) / 2) [(4, 1), (15, 2)],
  term ((277 : Rat) / 4) [(4, 2), (15, 2)],
  term ((277 : Rat) / 4) [(5, 2), (15, 2)],
  term ((277 : Rat) / 2) [(8, 1), (15, 2)],
  term ((-277 : Rat) / 4) [(8, 2), (15, 2)],
  term ((-277 : Rat) / 4) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0107_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0107
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0108 : Poly :=
[
  term ((-16853027 : Rat) / 4289184) [(15, 2), (16, 1)]
]

/-- Partial product 108 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0108 : Poly :=
[
  term ((16853027 : Rat) / 2144592) [(4, 1), (15, 2), (16, 1)],
  term ((-16853027 : Rat) / 4289184) [(4, 2), (15, 2), (16, 1)],
  term ((-16853027 : Rat) / 4289184) [(5, 2), (15, 2), (16, 1)],
  term ((-16853027 : Rat) / 2144592) [(8, 1), (15, 2), (16, 1)],
  term ((16853027 : Rat) / 4289184) [(8, 2), (15, 2), (16, 1)],
  term ((16853027 : Rat) / 4289184) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0108_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0108
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0109 : Poly :=
[
  term (168 : Rat) [(15, 4)]
]

/-- Partial product 109 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0109 : Poly :=
[
  term (-336 : Rat) [(4, 1), (15, 4)],
  term (168 : Rat) [(4, 2), (15, 4)],
  term (168 : Rat) [(5, 2), (15, 4)],
  term (336 : Rat) [(8, 1), (15, 4)],
  term (-168 : Rat) [(8, 2), (15, 4)],
  term (-168 : Rat) [(9, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0109_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0109
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0110 : Poly :=
[
  term ((-10460387 : Rat) / 1072296) [(15, 4), (16, 1)]
]

/-- Partial product 110 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0110 : Poly :=
[
  term ((10460387 : Rat) / 536148) [(4, 1), (15, 4), (16, 1)],
  term ((-10460387 : Rat) / 1072296) [(4, 2), (15, 4), (16, 1)],
  term ((-10460387 : Rat) / 1072296) [(5, 2), (15, 4), (16, 1)],
  term ((-10460387 : Rat) / 536148) [(8, 1), (15, 4), (16, 1)],
  term ((10460387 : Rat) / 1072296) [(8, 2), (15, 4), (16, 1)],
  term ((10460387 : Rat) / 1072296) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0110_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0110
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 3. -/
def rs_R003_ueqv_R003NN_coefficient_03_0111 : Poly :=
[
  term ((-901649 : Rat) / 178716) [(15, 6), (16, 1)]
]

/-- Partial product 111 for generator 3. -/
def rs_R003_ueqv_R003NN_partial_03_0111 : Poly :=
[
  term ((901649 : Rat) / 89358) [(4, 1), (15, 6), (16, 1)],
  term ((-901649 : Rat) / 178716) [(4, 2), (15, 6), (16, 1)],
  term ((-901649 : Rat) / 178716) [(5, 2), (15, 6), (16, 1)],
  term ((-901649 : Rat) / 89358) [(8, 1), (15, 6), (16, 1)],
  term ((901649 : Rat) / 178716) [(8, 2), (15, 6), (16, 1)],
  term ((901649 : Rat) / 178716) [(9, 2), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 3. -/
theorem rs_R003_ueqv_R003NN_partial_03_0111_valid :
    mulPoly rs_R003_ueqv_R003NN_coefficient_03_0111
        rs_R003_ueqv_R003NN_generator_03_0100_0111 =
      rs_R003_ueqv_R003NN_partial_03_0111 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003NN_partials_03_0100_0111 : List Poly :=
[
  rs_R003_ueqv_R003NN_partial_03_0100,
  rs_R003_ueqv_R003NN_partial_03_0101,
  rs_R003_ueqv_R003NN_partial_03_0102,
  rs_R003_ueqv_R003NN_partial_03_0103,
  rs_R003_ueqv_R003NN_partial_03_0104,
  rs_R003_ueqv_R003NN_partial_03_0105,
  rs_R003_ueqv_R003NN_partial_03_0106,
  rs_R003_ueqv_R003NN_partial_03_0107,
  rs_R003_ueqv_R003NN_partial_03_0108,
  rs_R003_ueqv_R003NN_partial_03_0109,
  rs_R003_ueqv_R003NN_partial_03_0110,
  rs_R003_ueqv_R003NN_partial_03_0111
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003NN_block_03_0100_0111 : Poly :=
[
  term ((133694 : Rat) / 134037) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (517 : Rat) [(4, 1), (13, 1), (15, 1)],
  term ((4053841 : Rat) / 4289184) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(4, 1), (13, 1), (15, 3)],
  term ((-2153905 : Rat) / 268074) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 44679) [(4, 1), (13, 1), (15, 5), (16, 1)],
  term (-174 : Rat) [(4, 1), (13, 2)],
  term ((-277 : Rat) / 2) [(4, 1), (15, 2)],
  term ((16853027 : Rat) / 2144592) [(4, 1), (15, 2), (16, 1)],
  term (-336 : Rat) [(4, 1), (15, 4)],
  term ((10460387 : Rat) / 536148) [(4, 1), (15, 4), (16, 1)],
  term ((901649 : Rat) / 89358) [(4, 1), (15, 6), (16, 1)],
  term ((-66847 : Rat) / 134037) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-517 : Rat) / 2) [(4, 2), (13, 1), (15, 1)],
  term ((-4053841 : Rat) / 8578368) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(4, 2), (13, 1), (15, 3)],
  term ((2153905 : Rat) / 536148) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(4, 2), (13, 1), (15, 5), (16, 1)],
  term (87 : Rat) [(4, 2), (13, 2)],
  term ((277 : Rat) / 4) [(4, 2), (15, 2)],
  term ((-16853027 : Rat) / 4289184) [(4, 2), (15, 2), (16, 1)],
  term (168 : Rat) [(4, 2), (15, 4)],
  term ((-10460387 : Rat) / 1072296) [(4, 2), (15, 4), (16, 1)],
  term ((-901649 : Rat) / 178716) [(4, 2), (15, 6), (16, 1)],
  term ((-66847 : Rat) / 134037) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-517 : Rat) / 2) [(5, 2), (13, 1), (15, 1)],
  term ((-4053841 : Rat) / 8578368) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(5, 2), (13, 1), (15, 3)],
  term ((2153905 : Rat) / 536148) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 89358) [(5, 2), (13, 1), (15, 5), (16, 1)],
  term (87 : Rat) [(5, 2), (13, 2)],
  term ((277 : Rat) / 4) [(5, 2), (15, 2)],
  term ((-16853027 : Rat) / 4289184) [(5, 2), (15, 2), (16, 1)],
  term (168 : Rat) [(5, 2), (15, 4)],
  term ((-10460387 : Rat) / 1072296) [(5, 2), (15, 4), (16, 1)],
  term ((-901649 : Rat) / 178716) [(5, 2), (15, 6), (16, 1)],
  term ((-133694 : Rat) / 134037) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-517 : Rat) [(8, 1), (13, 1), (15, 1)],
  term ((-4053841 : Rat) / 4289184) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term (-96 : Rat) [(8, 1), (13, 1), (15, 3)],
  term ((2153905 : Rat) / 268074) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((128807 : Rat) / 44679) [(8, 1), (13, 1), (15, 5), (16, 1)],
  term (174 : Rat) [(8, 1), (13, 2)],
  term ((277 : Rat) / 2) [(8, 1), (15, 2)],
  term ((-16853027 : Rat) / 2144592) [(8, 1), (15, 2), (16, 1)],
  term (336 : Rat) [(8, 1), (15, 4)],
  term ((-10460387 : Rat) / 536148) [(8, 1), (15, 4), (16, 1)],
  term ((-901649 : Rat) / 89358) [(8, 1), (15, 6), (16, 1)],
  term ((66847 : Rat) / 134037) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((517 : Rat) / 2) [(8, 2), (13, 1), (15, 1)],
  term ((4053841 : Rat) / 8578368) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(8, 2), (13, 1), (15, 3)],
  term ((-2153905 : Rat) / 536148) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(8, 2), (13, 1), (15, 5), (16, 1)],
  term (-87 : Rat) [(8, 2), (13, 2)],
  term ((-277 : Rat) / 4) [(8, 2), (15, 2)],
  term ((16853027 : Rat) / 4289184) [(8, 2), (15, 2), (16, 1)],
  term (-168 : Rat) [(8, 2), (15, 4)],
  term ((10460387 : Rat) / 1072296) [(8, 2), (15, 4), (16, 1)],
  term ((901649 : Rat) / 178716) [(8, 2), (15, 6), (16, 1)],
  term ((66847 : Rat) / 134037) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((517 : Rat) / 2) [(9, 2), (13, 1), (15, 1)],
  term ((4053841 : Rat) / 8578368) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(9, 2), (13, 1), (15, 3)],
  term ((-2153905 : Rat) / 536148) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-128807 : Rat) / 89358) [(9, 2), (13, 1), (15, 5), (16, 1)],
  term (-87 : Rat) [(9, 2), (13, 2)],
  term ((-277 : Rat) / 4) [(9, 2), (15, 2)],
  term ((16853027 : Rat) / 4289184) [(9, 2), (15, 2), (16, 1)],
  term (-168 : Rat) [(9, 2), (15, 4)],
  term ((10460387 : Rat) / 1072296) [(9, 2), (15, 4), (16, 1)],
  term ((901649 : Rat) / 178716) [(9, 2), (15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 100 through 111. -/
theorem rs_R003_ueqv_R003NN_block_03_0100_0111_valid :
    checkProductSumEq rs_R003_ueqv_R003NN_partials_03_0100_0111
      rs_R003_ueqv_R003NN_block_03_0100_0111 = true := by
  native_decide

end R003UeqvR003NNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
