/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 27:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0100 : Poly :=
[
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 100 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0100 : Poly :=
[
  term ((831117266131 : Rat) / 1498874328) [(0, 1), (1, 1), (13, 3), (14, 1)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (1, 2), (13, 2), (14, 1)],
  term ((-831117266131 : Rat) / 1498874328) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 3)],
  term ((-831117266131 : Rat) / 1498874328) [(0, 1), (13, 3), (14, 1), (15, 1)],
  term ((831117266131 : Rat) / 1498874328) [(0, 2), (12, 1), (13, 2), (14, 1)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 3), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0100
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0101 : Poly :=
[
  term ((1635 : Rat) / 56) [(0, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 101 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0101 : Poly :=
[
  term ((-1635 : Rat) / 28) [(0, 1), (1, 1), (13, 3), (14, 1), (16, 1)],
  term ((1635 : Rat) / 56) [(0, 1), (1, 2), (13, 2), (14, 1), (16, 1)],
  term ((1635 : Rat) / 28) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1635 : Rat) / 56) [(0, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1635 : Rat) / 56) [(0, 1), (13, 2), (14, 3), (16, 1)],
  term ((1635 : Rat) / 28) [(0, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1635 : Rat) / 28) [(0, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1635 : Rat) / 56) [(0, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0101
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0102 : Poly :=
[
  term ((-135 : Rat) / 14) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 102 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0102 : Poly :=
[
  term ((135 : Rat) / 7) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((-135 : Rat) / 14) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((-135 : Rat) / 7) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((135 : Rat) / 14) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((135 : Rat) / 14) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-135 : Rat) / 7) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((135 : Rat) / 7) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((-135 : Rat) / 14) [(0, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0102
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0103 : Poly :=
[
  term ((18113759730071641 : Rat) / 34812855142128) [(0, 1), (14, 1)]
]

/-- Partial product 103 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0103 : Poly :=
[
  term ((-18113759730071641 : Rat) / 17406427571064) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((18113759730071641 : Rat) / 34812855142128) [(0, 1), (1, 2), (14, 1)],
  term ((18113759730071641 : Rat) / 17406427571064) [(0, 1), (12, 1), (14, 2)],
  term ((18113759730071641 : Rat) / 17406427571064) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18113759730071641 : Rat) / 34812855142128) [(0, 1), (14, 1), (15, 2)],
  term ((-18113759730071641 : Rat) / 34812855142128) [(0, 1), (14, 3)],
  term ((-18113759730071641 : Rat) / 17406427571064) [(0, 2), (12, 1), (14, 1)],
  term ((18113759730071641 : Rat) / 34812855142128) [(0, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0103
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0104 : Poly :=
[
  term ((-261808116069670 : Rat) / 725267815461) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 104 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0104 : Poly :=
[
  term ((523616232139340 : Rat) / 725267815461) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-261808116069670 : Rat) / 725267815461) [(0, 1), (1, 2), (14, 1), (15, 2)],
  term ((-523616232139340 : Rat) / 725267815461) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-523616232139340 : Rat) / 725267815461) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((261808116069670 : Rat) / 725267815461) [(0, 1), (14, 1), (15, 4)],
  term ((261808116069670 : Rat) / 725267815461) [(0, 1), (14, 3), (15, 2)],
  term ((523616232139340 : Rat) / 725267815461) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-261808116069670 : Rat) / 725267815461) [(0, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0104
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0105 : Poly :=
[
  term ((101 : Rat) / 7) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0105 : Poly :=
[
  term ((-202 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((101 : Rat) / 7) [(0, 1), (1, 2), (14, 1), (15, 2), (16, 1)],
  term ((202 : Rat) / 7) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((202 : Rat) / 7) [(0, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-101 : Rat) / 7) [(0, 1), (14, 1), (15, 4), (16, 1)],
  term ((-101 : Rat) / 7) [(0, 1), (14, 3), (15, 2), (16, 1)],
  term ((-202 : Rat) / 7) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((101 : Rat) / 7) [(0, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0105
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0106 : Poly :=
[
  term ((-22884100576406143 : Rat) / 34812855142128) [(0, 1), (14, 2)]
]

/-- Partial product 106 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0106 : Poly :=
[
  term ((22884100576406143 : Rat) / 17406427571064) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((-22884100576406143 : Rat) / 34812855142128) [(0, 1), (1, 2), (14, 2)],
  term ((-22884100576406143 : Rat) / 17406427571064) [(0, 1), (12, 1), (14, 3)],
  term ((-22884100576406143 : Rat) / 17406427571064) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((22884100576406143 : Rat) / 34812855142128) [(0, 1), (14, 2), (15, 2)],
  term ((22884100576406143 : Rat) / 34812855142128) [(0, 1), (14, 4)],
  term ((22884100576406143 : Rat) / 17406427571064) [(0, 2), (12, 1), (14, 2)],
  term ((-22884100576406143 : Rat) / 34812855142128) [(0, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0106
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0107 : Poly :=
[
  term ((12101327290075825 : Rat) / 2901071261844) [(0, 1), (15, 2)]
]

/-- Partial product 107 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0107 : Poly :=
[
  term ((-12101327290075825 : Rat) / 1450535630922) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((12101327290075825 : Rat) / 2901071261844) [(0, 1), (1, 2), (15, 2)],
  term ((12101327290075825 : Rat) / 1450535630922) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((12101327290075825 : Rat) / 1450535630922) [(0, 1), (13, 1), (15, 3)],
  term ((-12101327290075825 : Rat) / 2901071261844) [(0, 1), (14, 2), (15, 2)],
  term ((-12101327290075825 : Rat) / 2901071261844) [(0, 1), (15, 4)],
  term ((-12101327290075825 : Rat) / 1450535630922) [(0, 2), (12, 1), (15, 2)],
  term ((12101327290075825 : Rat) / 2901071261844) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0107
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0108 : Poly :=
[
  term ((-628 : Rat) / 21) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0108 : Poly :=
[
  term ((1256 : Rat) / 21) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-628 : Rat) / 21) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((-1256 : Rat) / 21) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1256 : Rat) / 21) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((628 : Rat) / 21) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((628 : Rat) / 21) [(0, 1), (15, 4), (16, 1)],
  term ((1256 : Rat) / 21) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-628 : Rat) / 21) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0108
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0109 : Poly :=
[
  term ((2496 : Rat) / 553) [(0, 2)]
]

/-- Partial product 109 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0109 : Poly :=
[
  term ((-4992 : Rat) / 553) [(0, 2), (1, 1), (13, 1)],
  term ((2496 : Rat) / 553) [(0, 2), (1, 2)],
  term ((4992 : Rat) / 553) [(0, 2), (12, 1), (14, 1)],
  term ((4992 : Rat) / 553) [(0, 2), (13, 1), (15, 1)],
  term ((-2496 : Rat) / 553) [(0, 2), (14, 2)],
  term ((-2496 : Rat) / 553) [(0, 2), (15, 2)],
  term ((-4992 : Rat) / 553) [(0, 3), (12, 1)],
  term ((2496 : Rat) / 553) [(0, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0109
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0110 : Poly :=
[
  term ((-10861008665 : Rat) / 749437164) [(0, 2), (9, 1), (13, 1)]
]

/-- Partial product 110 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0110 : Poly :=
[
  term ((10861008665 : Rat) / 374718582) [(0, 2), (1, 1), (9, 1), (13, 2)],
  term ((-10861008665 : Rat) / 749437164) [(0, 2), (1, 2), (9, 1), (13, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((10861008665 : Rat) / 749437164) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (13, 2), (15, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 3), (9, 1), (12, 1), (13, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 4), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0110
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0111 : Poly :=
[
  term ((10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (15, 1)]
]

/-- Partial product 111 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0111 : Poly :=
[
  term ((-10861008665 : Rat) / 187359291) [(0, 2), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 2), (1, 2), (9, 1), (15, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (15, 3)],
  term ((-10861008665 : Rat) / 187359291) [(0, 3), (9, 1), (12, 1), (15, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 4), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0111
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0112 : Poly :=
[
  term ((-4274902495 : Rat) / 26765613) [(0, 2), (13, 1), (15, 1)]
]

/-- Partial product 112 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0112 : Poly :=
[
  term ((8549804990 : Rat) / 26765613) [(0, 2), (1, 1), (13, 2), (15, 1)],
  term ((-4274902495 : Rat) / 26765613) [(0, 2), (1, 2), (13, 1), (15, 1)],
  term ((-8549804990 : Rat) / 26765613) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4274902495 : Rat) / 26765613) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((4274902495 : Rat) / 26765613) [(0, 2), (13, 1), (15, 3)],
  term ((-8549804990 : Rat) / 26765613) [(0, 2), (13, 2), (15, 2)],
  term ((8549804990 : Rat) / 26765613) [(0, 3), (12, 1), (13, 1), (15, 1)],
  term ((-4274902495 : Rat) / 26765613) [(0, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0112
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0113 : Poly :=
[
  term (2 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0113 : Poly :=
[
  term (-4 : Rat) [(0, 2), (1, 1), (13, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 2), (1, 2), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term (4 : Rat) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(0, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(0, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0113
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0114 : Poly :=
[
  term ((4706213285 : Rat) / 374718582) [(0, 2), (13, 2)]
]

/-- Partial product 114 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0114 : Poly :=
[
  term ((-4706213285 : Rat) / 187359291) [(0, 2), (1, 1), (13, 3)],
  term ((4706213285 : Rat) / 374718582) [(0, 2), (1, 2), (13, 2)],
  term ((4706213285 : Rat) / 187359291) [(0, 2), (12, 1), (13, 2), (14, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 2), (13, 2), (14, 2)],
  term ((-4706213285 : Rat) / 374718582) [(0, 2), (13, 2), (15, 2)],
  term ((4706213285 : Rat) / 187359291) [(0, 2), (13, 3), (15, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 3), (12, 1), (13, 2)],
  term ((4706213285 : Rat) / 374718582) [(0, 4), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0114
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0115 : Poly :=
[
  term ((-5 : Rat) / 7) [(0, 2), (13, 2), (16, 1)]
]

/-- Partial product 115 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0115 : Poly :=
[
  term ((10 : Rat) / 7) [(0, 2), (1, 1), (13, 3), (16, 1)],
  term ((-5 : Rat) / 7) [(0, 2), (1, 2), (13, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((5 : Rat) / 7) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((5 : Rat) / 7) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-10 : Rat) / 7) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((10 : Rat) / 7) [(0, 3), (12, 1), (13, 2), (16, 1)],
  term ((-5 : Rat) / 7) [(0, 4), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0115
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0116 : Poly :=
[
  term ((50436208360 : Rat) / 187359291) [(0, 2), (15, 2)]
]

/-- Partial product 116 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0116 : Poly :=
[
  term ((-100872416720 : Rat) / 187359291) [(0, 2), (1, 1), (13, 1), (15, 2)],
  term ((50436208360 : Rat) / 187359291) [(0, 2), (1, 2), (15, 2)],
  term ((100872416720 : Rat) / 187359291) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((100872416720 : Rat) / 187359291) [(0, 2), (13, 1), (15, 3)],
  term ((-50436208360 : Rat) / 187359291) [(0, 2), (14, 2), (15, 2)],
  term ((-50436208360 : Rat) / 187359291) [(0, 2), (15, 4)],
  term ((-100872416720 : Rat) / 187359291) [(0, 3), (12, 1), (15, 2)],
  term ((50436208360 : Rat) / 187359291) [(0, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0116
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0117 : Poly :=
[
  term ((-8 : Rat) / 7) [(0, 2), (15, 2), (16, 1)]
]

/-- Partial product 117 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0117 : Poly :=
[
  term ((16 : Rat) / 7) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((8 : Rat) / 7) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 7) [(0, 2), (15, 4), (16, 1)],
  term ((16 : Rat) / 7) [(0, 3), (12, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(0, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0117
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0118 : Poly :=
[
  term ((-17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 118 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0118 : Poly :=
[
  term ((17863087094824457 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1)],
  term ((-17863087094824457 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((-17863087094824457 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1)],
  term ((-17863087094824457 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((17863087094824457 : Rat) / 26109641356596) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-17863087094824457 : Rat) / 52219282713192) [(1, 3), (2, 1), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0118
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0119 : Poly :=
[
  term ((-2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 119 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0119 : Poly :=
[
  term ((2034064852007831 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term ((-2034064852007831 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-2034064852007831 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1)],
  term ((-2034064852007831 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((2034064852007831 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-2034064852007831 : Rat) / 52219282713192) [(1, 3), (2, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0119
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0120 : Poly :=
[
  term ((-29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1)]
]

/-- Partial product 120 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0120 : Poly :=
[
  term ((29804779978493 : Rat) / 53959475808) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1)],
  term ((-29804779978493 : Rat) / 107918951616) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term ((-29804779978493 : Rat) / 53959475808) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1)],
  term ((-29804779978493 : Rat) / 53959475808) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((29804779978493 : Rat) / 53959475808) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((-29804779978493 : Rat) / 107918951616) [(1, 3), (2, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0120
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0121 : Poly :=
[
  term ((1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 121 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0121 : Poly :=
[
  term ((-1546237556623301 : Rat) / 3729948765228) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((1546237556623301 : Rat) / 7459897530456) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((1546237556623301 : Rat) / 3729948765228) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((1546237556623301 : Rat) / 3729948765228) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-1546237556623301 : Rat) / 3729948765228) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((1546237556623301 : Rat) / 7459897530456) [(1, 3), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0121
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0122 : Poly :=
[
  term ((1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 122 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0122 : Poly :=
[
  term ((-1255706151605783 : Rat) / 2131399294416) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((1255706151605783 : Rat) / 4262798588832) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((1255706151605783 : Rat) / 2131399294416) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((1255706151605783 : Rat) / 2131399294416) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-1255706151605783 : Rat) / 2131399294416) [(1, 2), (2, 1), (13, 2)],
  term ((1255706151605783 : Rat) / 4262798588832) [(1, 3), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0122
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0123 : Poly :=
[
  term ((-4835 : Rat) / 336) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0123 : Poly :=
[
  term ((4835 : Rat) / 168) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4835 : Rat) / 336) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-4835 : Rat) / 168) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4835 : Rat) / 336) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((4835 : Rat) / 336) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4835 : Rat) / 168) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((4835 : Rat) / 168) [(1, 2), (2, 1), (13, 2), (16, 1)],
  term ((-4835 : Rat) / 336) [(1, 3), (2, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0123
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0124 : Poly :=
[
  term ((20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 124 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0124 : Poly :=
[
  term ((-20197029797692999 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((20197029797692999 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((20197029797692999 : Rat) / 26109641356596) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((20197029797692999 : Rat) / 26109641356596) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (15, 3)],
  term ((-20197029797692999 : Rat) / 26109641356596) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((20197029797692999 : Rat) / 52219282713192) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0124
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0125 : Poly :=
[
  term ((995 : Rat) / 84) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0125 : Poly :=
[
  term ((-995 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((995 : Rat) / 84) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((995 : Rat) / 42) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((995 : Rat) / 42) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-995 : Rat) / 84) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-995 : Rat) / 84) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-995 : Rat) / 42) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((995 : Rat) / 84) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0125
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0126 : Poly :=
[
  term ((-26346365247500261 : Rat) / 52219282713192) [(1, 1), (3, 1)]
]

/-- Partial product 126 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0126 : Poly :=
[
  term ((26346365247500261 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((-26346365247500261 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1)],
  term ((-26346365247500261 : Rat) / 26109641356596) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-26346365247500261 : Rat) / 26109641356596) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((26346365247500261 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 2)],
  term ((26346365247500261 : Rat) / 52219282713192) [(1, 1), (3, 1), (15, 2)],
  term ((26346365247500261 : Rat) / 26109641356596) [(1, 2), (3, 1), (13, 1)],
  term ((-26346365247500261 : Rat) / 52219282713192) [(1, 3), (3, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0126
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0127 : Poly :=
[
  term ((-5761020481920101 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 127 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0127 : Poly :=
[
  term ((5761020481920101 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1)],
  term ((-5761020481920101 : Rat) / 39164462034894) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((-5761020481920101 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1)],
  term ((-5761020481920101 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((5761020481920101 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((5761020481920101 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((5761020481920101 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-5761020481920101 : Rat) / 39164462034894) [(1, 3), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0127
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0128 : Poly :=
[
  term ((317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1)]
]

/-- Partial product 128 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0128 : Poly :=
[
  term ((-317737054294735 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1)],
  term ((317737054294735 : Rat) / 8703213785532) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((317737054294735 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1)],
  term ((317737054294735 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (14, 2)],
  term ((-317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-317737054294735 : Rat) / 4351606892766) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((317737054294735 : Rat) / 8703213785532) [(1, 3), (3, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0128
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0129 : Poly :=
[
  term ((30297784755589265 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 129 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0129 : Poly :=
[
  term ((-30297784755589265 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((30297784755589265 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((30297784755589265 : Rat) / 26109641356596) [(1, 1), (3, 1), (12, 1), (14, 2)],
  term ((30297784755589265 : Rat) / 26109641356596) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-30297784755589265 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-30297784755589265 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 3)],
  term ((-30297784755589265 : Rat) / 26109641356596) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((30297784755589265 : Rat) / 52219282713192) [(1, 3), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0129
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0130 : Poly :=
[
  term ((6126789965758093 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 130 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0130 : Poly :=
[
  term ((-12253579931516186 : Rat) / 2175803446383) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((6126789965758093 : Rat) / 2175803446383) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((12253579931516186 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((12253579931516186 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-6126789965758093 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (14, 2)],
  term ((-6126789965758093 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((-12253579931516186 : Rat) / 2175803446383) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((6126789965758093 : Rat) / 2175803446383) [(1, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0130
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0131 : Poly :=
[
  term ((-6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 131 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0131 : Poly :=
[
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 3), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0131
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0132 : Poly :=
[
  term ((-1802567920466143 : Rat) / 725267815461) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 132 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0132 : Poly :=
[
  term ((3605135840932286 : Rat) / 725267815461) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-1802567920466143 : Rat) / 725267815461) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((-3605135840932286 : Rat) / 725267815461) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3605135840932286 : Rat) / 725267815461) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((1802567920466143 : Rat) / 725267815461) [(1, 1), (6, 1), (11, 1), (14, 2)],
  term ((1802567920466143 : Rat) / 725267815461) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((3605135840932286 : Rat) / 725267815461) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-1802567920466143 : Rat) / 725267815461) [(1, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0132
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0133 : Poly :=
[
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 133 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0133 : Poly :=
[
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(0, 2), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 3), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0133
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0134 : Poly :=
[
  term ((31794239140985521 : Rat) / 39164462034894) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 134 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0134 : Poly :=
[
  term ((-31794239140985521 : Rat) / 19582231017447) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((31794239140985521 : Rat) / 39164462034894) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((31794239140985521 : Rat) / 19582231017447) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-31794239140985521 : Rat) / 39164462034894) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-31794239140985521 : Rat) / 39164462034894) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((31794239140985521 : Rat) / 19582231017447) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-31794239140985521 : Rat) / 19582231017447) [(1, 2), (6, 1), (13, 2)],
  term ((31794239140985521 : Rat) / 39164462034894) [(1, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0134
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0135 : Poly :=
[
  term ((170 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 135 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0135 : Poly :=
[
  term ((-340 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(1, 3), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0135
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0136 : Poly :=
[
  term ((7660998914045 : Rat) / 53723541886) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 136 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0136 : Poly :=
[
  term ((-7660998914045 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((7660998914045 : Rat) / 53723541886) [(0, 2), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((7660998914045 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((7660998914045 : Rat) / 26861770943) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7660998914045 : Rat) / 53723541886) [(1, 1), (6, 1), (14, 1), (15, 3)],
  term ((-7660998914045 : Rat) / 53723541886) [(1, 1), (6, 1), (14, 3), (15, 1)],
  term ((-7660998914045 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((7660998914045 : Rat) / 53723541886) [(1, 3), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0136
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0137 : Poly :=
[
  term ((46099368547243013 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 137 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0137 : Poly :=
[
  term ((-46099368547243013 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((46099368547243013 : Rat) / 26109641356596) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((46099368547243013 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((46099368547243013 : Rat) / 13054820678298) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-46099368547243013 : Rat) / 26109641356596) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((-46099368547243013 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 3)],
  term ((-46099368547243013 : Rat) / 13054820678298) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((46099368547243013 : Rat) / 26109641356596) [(1, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0137
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0138 : Poly :=
[
  term ((-32 : Rat) / 9) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0138 : Poly :=
[
  term ((64 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 9) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0138_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0138
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0139 : Poly :=
[
  term ((3977495663134691 : Rat) / 13054820678298) [(1, 1), (7, 1)]
]

/-- Partial product 139 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0139 : Poly :=
[
  term ((-3977495663134691 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((3977495663134691 : Rat) / 13054820678298) [(0, 2), (1, 1), (7, 1)],
  term ((3977495663134691 : Rat) / 6527410339149) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term ((3977495663134691 : Rat) / 6527410339149) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3977495663134691 : Rat) / 13054820678298) [(1, 1), (7, 1), (14, 2)],
  term ((-3977495663134691 : Rat) / 13054820678298) [(1, 1), (7, 1), (15, 2)],
  term ((-3977495663134691 : Rat) / 6527410339149) [(1, 2), (7, 1), (13, 1)],
  term ((3977495663134691 : Rat) / 13054820678298) [(1, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0139_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0139
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0140 : Poly :=
[
  term ((-9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 140 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0140 : Poly :=
[
  term ((9026606790637963 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-9026606790637963 : Rat) / 26109641356596) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((-9026606790637963 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-9026606790637963 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (14, 2)],
  term ((9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((9026606790637963 : Rat) / 13054820678298) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-9026606790637963 : Rat) / 26109641356596) [(1, 3), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0140_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0140
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0141 : Poly :=
[
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 141 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0141 : Poly :=
[
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 2), (14, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(0, 2), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (7, 1), (12, 1), (14, 3)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (7, 1), (12, 2), (14, 2)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 3), (7, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0141_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0141
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0142 : Poly :=
[
  term ((-12975389539029301 : Rat) / 17406427571064) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 142 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0142 : Poly :=
[
  term ((12975389539029301 : Rat) / 8703213785532) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-12975389539029301 : Rat) / 17406427571064) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((-12975389539029301 : Rat) / 8703213785532) [(1, 1), (7, 1), (12, 1), (14, 2)],
  term ((-12975389539029301 : Rat) / 8703213785532) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((12975389539029301 : Rat) / 17406427571064) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((12975389539029301 : Rat) / 17406427571064) [(1, 1), (7, 1), (14, 3)],
  term ((12975389539029301 : Rat) / 8703213785532) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-12975389539029301 : Rat) / 17406427571064) [(1, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0142_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0142
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0143 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 2)]
]

/-- Partial product 143 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0143 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (1, 1), (7, 1), (14, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (12, 1), (14, 3)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 4)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 3), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0143_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0143
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0144 : Poly :=
[
  term ((5667274321397 : Rat) / 7708496544) [(1, 1), (9, 1)]
]

/-- Partial product 144 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0144 : Poly :=
[
  term ((-5667274321397 : Rat) / 3854248272) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((5667274321397 : Rat) / 7708496544) [(0, 2), (1, 1), (9, 1)],
  term ((5667274321397 : Rat) / 3854248272) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((5667274321397 : Rat) / 3854248272) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5667274321397 : Rat) / 7708496544) [(1, 1), (9, 1), (14, 2)],
  term ((-5667274321397 : Rat) / 7708496544) [(1, 1), (9, 1), (15, 2)],
  term ((-5667274321397 : Rat) / 3854248272) [(1, 2), (9, 1), (13, 1)],
  term ((5667274321397 : Rat) / 7708496544) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0144_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0144
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0145 : Poly :=
[
  term ((7570123039505 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 145 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0145 : Poly :=
[
  term ((-7570123039505 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((7570123039505 : Rat) / 17986491936) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((7570123039505 : Rat) / 8993245968) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((7570123039505 : Rat) / 8993245968) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-7570123039505 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (14, 2)],
  term ((-7570123039505 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-7570123039505 : Rat) / 8993245968) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((7570123039505 : Rat) / 17986491936) [(1, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0145_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0145
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0146 : Poly :=
[
  term ((10861008665 : Rat) / 214124904) [(1, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 146 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0146 : Poly :=
[
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 2)],
  term ((10861008665 : Rat) / 214124904) [(0, 2), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10861008665 : Rat) / 214124904) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2)],
  term ((-10861008665 : Rat) / 214124904) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((-10861008665 : Rat) / 107062452) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((10861008665 : Rat) / 214124904) [(1, 3), (9, 1), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0146_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0146
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0147 : Poly :=
[
  term ((-10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 147 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0147 : Poly :=
[
  term ((10861008665 : Rat) / 53531226) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 2), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((-10861008665 : Rat) / 53531226) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2)],
  term ((-10861008665 : Rat) / 53531226) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (14, 3)],
  term ((10861008665 : Rat) / 53531226) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-10861008665 : Rat) / 107062452) [(1, 3), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0147_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0147
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0148 : Poly :=
[
  term ((1157783523689 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 148 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0148 : Poly :=
[
  term ((-1157783523689 : Rat) / 4496622984) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((1157783523689 : Rat) / 8993245968) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((1157783523689 : Rat) / 4496622984) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1157783523689 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((-1157783523689 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((1157783523689 : Rat) / 4496622984) [(1, 1), (9, 1), (12, 2), (14, 1)],
  term ((-1157783523689 : Rat) / 4496622984) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((1157783523689 : Rat) / 8993245968) [(1, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0148_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0148
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0149 : Poly :=
[
  term ((-831953263739 : Rat) / 5995497312) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 149 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0149 : Poly :=
[
  term ((831953263739 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (12, 2), (14, 1)],
  term ((-831953263739 : Rat) / 5995497312) [(0, 2), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-831953263739 : Rat) / 2997748656) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((831953263739 : Rat) / 5995497312) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((831953263739 : Rat) / 5995497312) [(1, 1), (9, 1), (12, 1), (14, 3)],
  term ((-831953263739 : Rat) / 2997748656) [(1, 1), (9, 1), (12, 2), (14, 2)],
  term ((831953263739 : Rat) / 2997748656) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-831953263739 : Rat) / 5995497312) [(1, 3), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0149_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0149
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0150 : Poly :=
[
  term ((-115126691849 : Rat) / 80296839) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 150 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0150 : Poly :=
[
  term ((230253383698 : Rat) / 80296839) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-115126691849 : Rat) / 80296839) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((-230253383698 : Rat) / 80296839) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((-230253383698 : Rat) / 80296839) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((115126691849 : Rat) / 80296839) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((115126691849 : Rat) / 80296839) [(1, 1), (9, 1), (14, 3)],
  term ((230253383698 : Rat) / 80296839) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-115126691849 : Rat) / 80296839) [(1, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0150_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0150
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0151 : Poly :=
[
  term ((601699880041 : Rat) / 2997748656) [(1, 1), (9, 1), (14, 2)]
]

/-- Partial product 151 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0151 : Poly :=
[
  term ((-601699880041 : Rat) / 1498874328) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 2)],
  term ((601699880041 : Rat) / 2997748656) [(0, 2), (1, 1), (9, 1), (14, 2)],
  term ((601699880041 : Rat) / 1498874328) [(1, 1), (9, 1), (12, 1), (14, 3)],
  term ((601699880041 : Rat) / 1498874328) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-601699880041 : Rat) / 2997748656) [(1, 1), (9, 1), (14, 2), (15, 2)],
  term ((-601699880041 : Rat) / 2997748656) [(1, 1), (9, 1), (14, 4)],
  term ((-601699880041 : Rat) / 1498874328) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((601699880041 : Rat) / 2997748656) [(1, 3), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0151_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0151
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0152 : Poly :=
[
  term ((-59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 152 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0152 : Poly :=
[
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-59904 : Rat) / 553) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-59904 : Rat) / 553) [(1, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0152_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0152
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0153 : Poly :=
[
  term ((-4706213285 : Rat) / 107062452) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 153 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0153 : Poly :=
[
  term ((4706213285 : Rat) / 53531226) [(0, 1), (1, 1), (10, 1), (12, 2), (13, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 2), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((4706213285 : Rat) / 107062452) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((4706213285 : Rat) / 107062452) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4706213285 : Rat) / 53531226) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4706213285 : Rat) / 53531226) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((4706213285 : Rat) / 53531226) [(1, 2), (10, 1), (12, 1), (13, 2)],
  term ((-4706213285 : Rat) / 107062452) [(1, 3), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0153_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0153
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0154 : Poly :=
[
  term ((5 : Rat) / 2) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 154 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0154 : Poly :=
[
  term (-5 : Rat) [(0, 1), (1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((5 : Rat) / 2) [(0, 2), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (5 : Rat) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (5 : Rat) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term (-5 : Rat) [(1, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 2) [(1, 3), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0154_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0154
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0155 : Poly :=
[
  term ((-96490250 : Rat) / 3823659) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 155 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0155 : Poly :=
[
  term ((192980500 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-96490250 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-192980500 : Rat) / 3823659) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((96490250 : Rat) / 3823659) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((96490250 : Rat) / 3823659) [(1, 1), (10, 1), (12, 1), (15, 3)],
  term ((-192980500 : Rat) / 3823659) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((192980500 : Rat) / 3823659) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-96490250 : Rat) / 3823659) [(1, 3), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0155_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0155
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0156 : Poly :=
[
  term (-2 : Rat) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0156 : Poly :=
[
  term (4 : Rat) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 3), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0156_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0156
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0157 : Poly :=
[
  term ((-305066708021459 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 157 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0157 : Poly :=
[
  term ((305066708021459 : Rat) / 355233215736) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-305066708021459 : Rat) / 710466431472) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((-305066708021459 : Rat) / 355233215736) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((305066708021459 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((305066708021459 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-305066708021459 : Rat) / 355233215736) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((305066708021459 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 2)],
  term ((-305066708021459 : Rat) / 710466431472) [(1, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0157_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0157
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0158 : Poly :=
[
  term ((4706213285 : Rat) / 53531226) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 158 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0158 : Poly :=
[
  term ((-4706213285 : Rat) / 26765613) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((4706213285 : Rat) / 53531226) [(0, 2), (1, 1), (10, 1), (13, 1), (14, 1)],
  term ((4706213285 : Rat) / 26765613) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-4706213285 : Rat) / 53531226) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4706213285 : Rat) / 53531226) [(1, 1), (10, 1), (13, 1), (14, 3)],
  term ((4706213285 : Rat) / 26765613) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4706213285 : Rat) / 26765613) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term ((4706213285 : Rat) / 53531226) [(1, 3), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0158_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0158
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0159 : Poly :=
[
  term (-5 : Rat) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 159 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0159 : Poly :=
[
  term (10 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-5 : Rat) [(0, 2), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term (5 : Rat) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (5 : Rat) [(1, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term (-10 : Rat) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term (-5 : Rat) [(1, 3), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0159_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0159
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0160 : Poly :=
[
  term ((655 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 160 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0160 : Poly :=
[
  term ((-655 : Rat) / 28) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((655 : Rat) / 56) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((655 : Rat) / 28) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-655 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-655 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((655 : Rat) / 28) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-655 : Rat) / 28) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((655 : Rat) / 56) [(1, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0160_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0160
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0161 : Poly :=
[
  term ((192980500 : Rat) / 3823659) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 161 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0161 : Poly :=
[
  term ((-385961000 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((192980500 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (14, 1), (15, 1)],
  term ((385961000 : Rat) / 3823659) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((385961000 : Rat) / 3823659) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-192980500 : Rat) / 3823659) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((-192980500 : Rat) / 3823659) [(1, 1), (10, 1), (14, 3), (15, 1)],
  term ((-385961000 : Rat) / 3823659) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((192980500 : Rat) / 3823659) [(1, 3), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0161_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0161
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0162 : Poly :=
[
  term (4 : Rat) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0162 : Poly :=
[
  term (-8 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 2), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(1, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 3), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0162_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0162
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0163 : Poly :=
[
  term ((19000961721258263 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 163 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0163 : Poly :=
[
  term ((-19000961721258263 : Rat) / 13054820678298) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((19000961721258263 : Rat) / 26109641356596) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((19000961721258263 : Rat) / 13054820678298) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((19000961721258263 : Rat) / 13054820678298) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-19000961721258263 : Rat) / 26109641356596) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((-19000961721258263 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 3)],
  term ((-19000961721258263 : Rat) / 13054820678298) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((19000961721258263 : Rat) / 26109641356596) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0163_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0163
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0164 : Poly :=
[
  term ((-127 : Rat) / 14) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0164 : Poly :=
[
  term ((127 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-127 : Rat) / 14) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-127 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127 : Rat) / 7) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((127 : Rat) / 14) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((127 : Rat) / 14) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((127 : Rat) / 7) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-127 : Rat) / 14) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0164_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0164
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0165 : Poly :=
[
  term ((-584642562593892197 : Rat) / 208877130852768) [(1, 1), (11, 1)]
]

/-- Partial product 165 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0165 : Poly :=
[
  term ((584642562593892197 : Rat) / 104438565426384) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-584642562593892197 : Rat) / 208877130852768) [(0, 2), (1, 1), (11, 1)],
  term ((-584642562593892197 : Rat) / 104438565426384) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-584642562593892197 : Rat) / 104438565426384) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((584642562593892197 : Rat) / 208877130852768) [(1, 1), (11, 1), (14, 2)],
  term ((584642562593892197 : Rat) / 208877130852768) [(1, 1), (11, 1), (15, 2)],
  term ((584642562593892197 : Rat) / 104438565426384) [(1, 2), (11, 1), (13, 1)],
  term ((-584642562593892197 : Rat) / 208877130852768) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0165_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0165
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0166 : Poly :=
[
  term ((-179712 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 166 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0166 : Poly :=
[
  term ((359424 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-179712 : Rat) / 553) [(0, 2), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-359424 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((179712 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((179712 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 3)],
  term ((-359424 : Rat) / 553) [(1, 1), (11, 1), (12, 2), (14, 2)],
  term ((359424 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-179712 : Rat) / 553) [(1, 3), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0166_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0166
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0167 : Poly :=
[
  term ((114417635149931321 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 167 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0167 : Poly :=
[
  term ((-114417635149931321 : Rat) / 26109641356596) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((114417635149931321 : Rat) / 52219282713192) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((114417635149931321 : Rat) / 26109641356596) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((114417635149931321 : Rat) / 26109641356596) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-114417635149931321 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-114417635149931321 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 3)],
  term ((-114417635149931321 : Rat) / 26109641356596) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((114417635149931321 : Rat) / 52219282713192) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0167_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0167
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0168 : Poly :=
[
  term ((119808 : Rat) / 553) [(1, 1), (11, 1), (14, 2)]
]

/-- Partial product 168 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0168 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(0, 2), (1, 1), (11, 1), (14, 2)],
  term ((239616 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 3)],
  term ((239616 : Rat) / 553) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (14, 4)],
  term ((-239616 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(1, 3), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0168_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0168
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0169 : Poly :=
[
  term ((-4706213285 : Rat) / 55513864) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 169 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0169 : Poly :=
[
  term ((4706213285 : Rat) / 27756932) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-4706213285 : Rat) / 55513864) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((4706213285 : Rat) / 55513864) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((4706213285 : Rat) / 55513864) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4706213285 : Rat) / 27756932) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4706213285 : Rat) / 27756932) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((4706213285 : Rat) / 27756932) [(1, 2), (12, 1), (13, 2)],
  term ((-4706213285 : Rat) / 55513864) [(1, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0169_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0169
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0170 : Poly :=
[
  term ((360495937631 : Rat) / 2997748656) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 170 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0170 : Poly :=
[
  term ((-360495937631 : Rat) / 1498874328) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1)],
  term ((360495937631 : Rat) / 2997748656) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-360495937631 : Rat) / 2997748656) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-360495937631 : Rat) / 2997748656) [(1, 1), (12, 1), (13, 1), (14, 3)],
  term ((360495937631 : Rat) / 1498874328) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((360495937631 : Rat) / 1498874328) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((-360495937631 : Rat) / 1498874328) [(1, 2), (12, 1), (13, 2), (14, 1)],
  term ((360495937631 : Rat) / 2997748656) [(1, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0170_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0170
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0171 : Poly :=
[
  term ((-1135 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 171 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0171 : Poly :=
[
  term ((1135 : Rat) / 28) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1135 : Rat) / 56) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1135 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1135 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1135 : Rat) / 28) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1135 : Rat) / 28) [(1, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((1135 : Rat) / 28) [(1, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1135 : Rat) / 56) [(1, 3), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0171_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0171
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0172 : Poly :=
[
  term ((135 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 172 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0172 : Poly :=
[
  term ((-135 : Rat) / 14) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((135 : Rat) / 28) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-135 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-135 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((135 : Rat) / 14) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((135 : Rat) / 14) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-135 : Rat) / 14) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((135 : Rat) / 28) [(1, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0172_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0172
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0173 : Poly :=
[
  term ((-4854827766745 : Rat) / 59205535956) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 173 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0173 : Poly :=
[
  term ((4854827766745 : Rat) / 29602767978) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-4854827766745 : Rat) / 59205535956) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4854827766745 : Rat) / 29602767978) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((4854827766745 : Rat) / 59205535956) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((4854827766745 : Rat) / 59205535956) [(1, 1), (12, 1), (14, 3), (15, 1)],
  term ((-4854827766745 : Rat) / 29602767978) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((4854827766745 : Rat) / 29602767978) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4854827766745 : Rat) / 59205535956) [(1, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0173_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0173
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0174 : Poly :=
[
  term ((239 : Rat) / 14) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0174 : Poly :=
[
  term ((-239 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((239 : Rat) / 14) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((239 : Rat) / 7) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-239 : Rat) / 14) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-239 : Rat) / 14) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((239 : Rat) / 7) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-239 : Rat) / 7) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((239 : Rat) / 14) [(1, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0174_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0174
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0175 : Poly :=
[
  term ((14876033252587 : Rat) / 88808303934) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 175 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0175 : Poly :=
[
  term ((-14876033252587 : Rat) / 44404151967) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((14876033252587 : Rat) / 88808303934) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((14876033252587 : Rat) / 44404151967) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-14876033252587 : Rat) / 88808303934) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-14876033252587 : Rat) / 88808303934) [(1, 1), (12, 1), (15, 3)],
  term ((14876033252587 : Rat) / 44404151967) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-14876033252587 : Rat) / 44404151967) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((14876033252587 : Rat) / 88808303934) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0175_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0175
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0176 : Poly :=
[
  term ((-27 : Rat) / 7) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0176 : Poly :=
[
  term ((54 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-27 : Rat) / 7) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-54 : Rat) / 7) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((27 : Rat) / 7) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((27 : Rat) / 7) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-54 : Rat) / 7) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((54 : Rat) / 7) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 7) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0176_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0176
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0177 : Poly :=
[
  term ((-17490217058418431 : Rat) / 69625710284256) [(1, 1), (13, 1)]
]

/-- Partial product 177 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0177 : Poly :=
[
  term ((17490217058418431 : Rat) / 34812855142128) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-17490217058418431 : Rat) / 69625710284256) [(0, 2), (1, 1), (13, 1)],
  term ((-17490217058418431 : Rat) / 34812855142128) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((17490217058418431 : Rat) / 69625710284256) [(1, 1), (13, 1), (14, 2)],
  term ((17490217058418431 : Rat) / 69625710284256) [(1, 1), (13, 1), (15, 2)],
  term ((-17490217058418431 : Rat) / 34812855142128) [(1, 1), (13, 2), (15, 1)],
  term ((17490217058418431 : Rat) / 34812855142128) [(1, 2), (13, 2)],
  term ((-17490217058418431 : Rat) / 69625710284256) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0177_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0177
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0178 : Poly :=
[
  term ((7544422561586 : Rat) / 4933794663) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 178 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0178 : Poly :=
[
  term ((-15088845123172 : Rat) / 4933794663) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((7544422561586 : Rat) / 4933794663) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((15088845123172 : Rat) / 4933794663) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-7544422561586 : Rat) / 4933794663) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7544422561586 : Rat) / 4933794663) [(1, 1), (13, 1), (14, 3)],
  term ((15088845123172 : Rat) / 4933794663) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-15088845123172 : Rat) / 4933794663) [(1, 2), (13, 2), (14, 1)],
  term ((7544422561586 : Rat) / 4933794663) [(1, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0178_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0178
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0179 : Poly :=
[
  term ((60 : Rat) / 7) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 179 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0179 : Poly :=
[
  term ((-120 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((60 : Rat) / 7) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((120 : Rat) / 7) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-60 : Rat) / 7) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-60 : Rat) / 7) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((120 : Rat) / 7) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-120 : Rat) / 7) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((60 : Rat) / 7) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0179_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0179
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0180 : Poly :=
[
  term ((-7415538672713 : Rat) / 39470357304) [(1, 1), (13, 1), (14, 2)]
]

/-- Partial product 180 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0180 : Poly :=
[
  term ((7415538672713 : Rat) / 19735178652) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-7415538672713 : Rat) / 39470357304) [(0, 2), (1, 1), (13, 1), (14, 2)],
  term ((-7415538672713 : Rat) / 19735178652) [(1, 1), (12, 1), (13, 1), (14, 3)],
  term ((7415538672713 : Rat) / 39470357304) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((7415538672713 : Rat) / 39470357304) [(1, 1), (13, 1), (14, 4)],
  term ((-7415538672713 : Rat) / 19735178652) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((7415538672713 : Rat) / 19735178652) [(1, 2), (13, 2), (14, 2)],
  term ((-7415538672713 : Rat) / 39470357304) [(1, 3), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0180_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0180
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0181 : Poly :=
[
  term ((485 : Rat) / 28) [(1, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 181 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0181 : Poly :=
[
  term ((-485 : Rat) / 14) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((485 : Rat) / 28) [(0, 2), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((485 : Rat) / 14) [(1, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-485 : Rat) / 28) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-485 : Rat) / 28) [(1, 1), (13, 1), (14, 4), (16, 1)],
  term ((485 : Rat) / 14) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-485 : Rat) / 14) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((485 : Rat) / 28) [(1, 3), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0181_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0181
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0182 : Poly :=
[
  term ((-565 : Rat) / 24) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 182 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0182 : Poly :=
[
  term ((565 : Rat) / 12) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-565 : Rat) / 24) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-565 : Rat) / 12) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((565 : Rat) / 24) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((565 : Rat) / 24) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-565 : Rat) / 12) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((565 : Rat) / 12) [(1, 2), (13, 2), (16, 1)],
  term ((-565 : Rat) / 24) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0182_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0182
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0183 : Poly :=
[
  term ((-404017876337909641 : Rat) / 104438565426384) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 183 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0183 : Poly :=
[
  term ((404017876337909641 : Rat) / 52219282713192) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-404017876337909641 : Rat) / 104438565426384) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-404017876337909641 : Rat) / 52219282713192) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-404017876337909641 : Rat) / 52219282713192) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((404017876337909641 : Rat) / 104438565426384) [(1, 1), (14, 1), (15, 3)],
  term ((404017876337909641 : Rat) / 104438565426384) [(1, 1), (14, 3), (15, 1)],
  term ((404017876337909641 : Rat) / 52219282713192) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-404017876337909641 : Rat) / 104438565426384) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0183_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0183
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0184 : Poly :=
[
  term ((-72 : Rat) / 7) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 184 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0184 : Poly :=
[
  term ((144 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((72 : Rat) / 7) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((144 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0184_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0184
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0185 : Poly :=
[
  term ((261808116069670 : Rat) / 725267815461) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 185 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0185 : Poly :=
[
  term ((-523616232139340 : Rat) / 725267815461) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((261808116069670 : Rat) / 725267815461) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((523616232139340 : Rat) / 725267815461) [(1, 1), (12, 1), (14, 3), (15, 1)],
  term ((523616232139340 : Rat) / 725267815461) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-261808116069670 : Rat) / 725267815461) [(1, 1), (14, 2), (15, 3)],
  term ((-261808116069670 : Rat) / 725267815461) [(1, 1), (14, 4), (15, 1)],
  term ((-523616232139340 : Rat) / 725267815461) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((261808116069670 : Rat) / 725267815461) [(1, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0185_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0185
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0186 : Poly :=
[
  term ((-101 : Rat) / 7) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0186 : Poly :=
[
  term ((202 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-101 : Rat) / 7) [(0, 2), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-202 : Rat) / 7) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-202 : Rat) / 7) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((101 : Rat) / 7) [(1, 1), (14, 2), (15, 3), (16, 1)],
  term ((101 : Rat) / 7) [(1, 1), (14, 4), (15, 1), (16, 1)],
  term ((202 : Rat) / 7) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-101 : Rat) / 7) [(1, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0186_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0186
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0187 : Poly :=
[
  term ((243917127443347633 : Rat) / 104438565426384) [(1, 1), (15, 1)]
]

/-- Partial product 187 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0187 : Poly :=
[
  term ((-243917127443347633 : Rat) / 52219282713192) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((243917127443347633 : Rat) / 104438565426384) [(0, 2), (1, 1), (15, 1)],
  term ((243917127443347633 : Rat) / 52219282713192) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((243917127443347633 : Rat) / 52219282713192) [(1, 1), (13, 1), (15, 2)],
  term ((-243917127443347633 : Rat) / 104438565426384) [(1, 1), (14, 2), (15, 1)],
  term ((-243917127443347633 : Rat) / 104438565426384) [(1, 1), (15, 3)],
  term ((-243917127443347633 : Rat) / 52219282713192) [(1, 2), (13, 1), (15, 1)],
  term ((243917127443347633 : Rat) / 104438565426384) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0187_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0187
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0188 : Poly :=
[
  term ((907 : Rat) / 42) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0188 : Poly :=
[
  term ((-907 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((907 : Rat) / 42) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((907 : Rat) / 21) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((907 : Rat) / 21) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-907 : Rat) / 42) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-907 : Rat) / 42) [(1, 1), (15, 3), (16, 1)],
  term ((-907 : Rat) / 21) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((907 : Rat) / 42) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0188_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0188
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0189 : Poly :=
[
  term ((1460822197993979 : Rat) / 8703213785532) [(1, 2)]
]

/-- Partial product 189 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0189 : Poly :=
[
  term ((-1460822197993979 : Rat) / 4351606892766) [(0, 1), (1, 2), (12, 1)],
  term ((1460822197993979 : Rat) / 8703213785532) [(0, 2), (1, 2)],
  term ((1460822197993979 : Rat) / 4351606892766) [(1, 2), (12, 1), (14, 1)],
  term ((1460822197993979 : Rat) / 4351606892766) [(1, 2), (13, 1), (15, 1)],
  term ((-1460822197993979 : Rat) / 8703213785532) [(1, 2), (14, 2)],
  term ((-1460822197993979 : Rat) / 8703213785532) [(1, 2), (15, 2)],
  term ((-1460822197993979 : Rat) / 4351606892766) [(1, 3), (13, 1)],
  term ((1460822197993979 : Rat) / 8703213785532) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0189_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0189
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0190 : Poly :=
[
  term ((45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1)]
]

/-- Partial product 190 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0190 : Poly :=
[
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 1), (12, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(0, 2), (1, 2), (2, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (12, 1), (14, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1), (14, 2)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1), (15, 2)],
  term ((-45864690786755 : Rat) / 8703213785532) [(1, 3), (2, 1), (13, 1)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 4), (2, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0190_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0190
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0191 : Poly :=
[
  term ((45864690786755 : Rat) / 6527410339149) [(1, 2), (6, 1)]
]

/-- Partial product 191 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0191 : Poly :=
[
  term ((-91729381573510 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (12, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(0, 2), (1, 2), (6, 1)],
  term ((91729381573510 : Rat) / 6527410339149) [(1, 2), (6, 1), (12, 1), (14, 1)],
  term ((91729381573510 : Rat) / 6527410339149) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 2), (6, 1), (14, 2)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 2), (6, 1), (15, 2)],
  term ((-91729381573510 : Rat) / 6527410339149) [(1, 3), (6, 1), (13, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 4), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0191_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0191
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0192 : Poly :=
[
  term ((4992 : Rat) / 553) [(1, 2), (12, 1)]
]

/-- Partial product 192 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0192 : Poly :=
[
  term ((-9984 : Rat) / 553) [(0, 1), (1, 2), (12, 2)],
  term ((4992 : Rat) / 553) [(0, 2), (1, 2), (12, 1)],
  term ((9984 : Rat) / 553) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4992 : Rat) / 553) [(1, 2), (12, 1), (14, 2)],
  term ((-4992 : Rat) / 553) [(1, 2), (12, 1), (15, 2)],
  term ((9984 : Rat) / 553) [(1, 2), (12, 2), (14, 1)],
  term ((-9984 : Rat) / 553) [(1, 3), (12, 1), (13, 1)],
  term ((4992 : Rat) / 553) [(1, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0192_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0192
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0193 : Poly :=
[
  term ((-1419482045382901 : Rat) / 5802142523688) [(1, 2), (14, 1)]
]

/-- Partial product 193 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0193 : Poly :=
[
  term ((1419482045382901 : Rat) / 2901071261844) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((-1419482045382901 : Rat) / 5802142523688) [(0, 2), (1, 2), (14, 1)],
  term ((-1419482045382901 : Rat) / 2901071261844) [(1, 2), (12, 1), (14, 2)],
  term ((-1419482045382901 : Rat) / 2901071261844) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((1419482045382901 : Rat) / 5802142523688) [(1, 2), (14, 1), (15, 2)],
  term ((1419482045382901 : Rat) / 5802142523688) [(1, 2), (14, 3)],
  term ((1419482045382901 : Rat) / 2901071261844) [(1, 3), (13, 1), (14, 1)],
  term ((-1419482045382901 : Rat) / 5802142523688) [(1, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0193_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0193
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0194 : Poly :=
[
  term ((-302561760447571 : Rat) / 1065699647208) [(2, 1)]
]

/-- Partial product 194 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0194 : Poly :=
[
  term ((302561760447571 : Rat) / 532849823604) [(0, 1), (2, 1), (12, 1)],
  term ((-302561760447571 : Rat) / 1065699647208) [(0, 2), (2, 1)],
  term ((302561760447571 : Rat) / 532849823604) [(1, 1), (2, 1), (13, 1)],
  term ((-302561760447571 : Rat) / 1065699647208) [(1, 2), (2, 1)],
  term ((-302561760447571 : Rat) / 532849823604) [(2, 1), (12, 1), (14, 1)],
  term ((-302561760447571 : Rat) / 532849823604) [(2, 1), (13, 1), (15, 1)],
  term ((302561760447571 : Rat) / 1065699647208) [(2, 1), (14, 2)],
  term ((302561760447571 : Rat) / 1065699647208) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0194_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0194
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0195 : Poly :=
[
  term ((-35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1)]
]

/-- Partial product 195 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0195 : Poly :=
[
  term ((70690683689524370 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1)],
  term ((-35345341844762185 : Rat) / 19582231017447) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((70690683689524370 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((-35345341844762185 : Rat) / 19582231017447) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-70690683689524370 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-70690683689524370 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0195_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0195
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0196 : Poly :=
[
  term ((-4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1)]
]

/-- Partial product 196 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0196 : Poly :=
[
  term ((4598551068761 : Rat) / 40469606856) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-4598551068761 : Rat) / 80939213712) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((4598551068761 : Rat) / 40469606856) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)],
  term ((-4598551068761 : Rat) / 80939213712) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((-4598551068761 : Rat) / 40469606856) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-4598551068761 : Rat) / 40469606856) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0196_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0196
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0197 : Poly :=
[
  term ((36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1)]
]

/-- Partial product 197 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0197 : Poly :=
[
  term ((-36306455678017967 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((36306455678017967 : Rat) / 39164462034894) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((-36306455678017967 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((36306455678017967 : Rat) / 39164462034894) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((36306455678017967 : Rat) / 19582231017447) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((36306455678017967 : Rat) / 19582231017447) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0197_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0197
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0198 : Poly :=
[
  term ((95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (13, 1)]
]

/-- Partial product 198 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0198 : Poly :=
[
  term ((-95140102894763 : Rat) / 1598549470812) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((95140102894763 : Rat) / 3197098941624) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((-95140102894763 : Rat) / 1598549470812) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((95140102894763 : Rat) / 3197098941624) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((95140102894763 : Rat) / 1598549470812) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((95140102894763 : Rat) / 1598549470812) [(2, 1), (3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0198_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0198
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0199 : Poly :=
[
  term ((-9095 : Rat) / 252) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 199 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0199 : Poly :=
[
  term ((9095 : Rat) / 126) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9095 : Rat) / 252) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((9095 : Rat) / 126) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((-9095 : Rat) / 252) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-9095 : Rat) / 126) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((9095 : Rat) / 252) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((9095 : Rat) / 252) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9095 : Rat) / 126) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0199_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0199
        rs_R009_ueqv_R009YNNNN_generator_27_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_27_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_27_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_27_0100,
  rs_R009_ueqv_R009YNNNN_partial_27_0101,
  rs_R009_ueqv_R009YNNNN_partial_27_0102,
  rs_R009_ueqv_R009YNNNN_partial_27_0103,
  rs_R009_ueqv_R009YNNNN_partial_27_0104,
  rs_R009_ueqv_R009YNNNN_partial_27_0105,
  rs_R009_ueqv_R009YNNNN_partial_27_0106,
  rs_R009_ueqv_R009YNNNN_partial_27_0107,
  rs_R009_ueqv_R009YNNNN_partial_27_0108,
  rs_R009_ueqv_R009YNNNN_partial_27_0109,
  rs_R009_ueqv_R009YNNNN_partial_27_0110,
  rs_R009_ueqv_R009YNNNN_partial_27_0111,
  rs_R009_ueqv_R009YNNNN_partial_27_0112,
  rs_R009_ueqv_R009YNNNN_partial_27_0113,
  rs_R009_ueqv_R009YNNNN_partial_27_0114,
  rs_R009_ueqv_R009YNNNN_partial_27_0115,
  rs_R009_ueqv_R009YNNNN_partial_27_0116,
  rs_R009_ueqv_R009YNNNN_partial_27_0117,
  rs_R009_ueqv_R009YNNNN_partial_27_0118,
  rs_R009_ueqv_R009YNNNN_partial_27_0119,
  rs_R009_ueqv_R009YNNNN_partial_27_0120,
  rs_R009_ueqv_R009YNNNN_partial_27_0121,
  rs_R009_ueqv_R009YNNNN_partial_27_0122,
  rs_R009_ueqv_R009YNNNN_partial_27_0123,
  rs_R009_ueqv_R009YNNNN_partial_27_0124,
  rs_R009_ueqv_R009YNNNN_partial_27_0125,
  rs_R009_ueqv_R009YNNNN_partial_27_0126,
  rs_R009_ueqv_R009YNNNN_partial_27_0127,
  rs_R009_ueqv_R009YNNNN_partial_27_0128,
  rs_R009_ueqv_R009YNNNN_partial_27_0129,
  rs_R009_ueqv_R009YNNNN_partial_27_0130,
  rs_R009_ueqv_R009YNNNN_partial_27_0131,
  rs_R009_ueqv_R009YNNNN_partial_27_0132,
  rs_R009_ueqv_R009YNNNN_partial_27_0133,
  rs_R009_ueqv_R009YNNNN_partial_27_0134,
  rs_R009_ueqv_R009YNNNN_partial_27_0135,
  rs_R009_ueqv_R009YNNNN_partial_27_0136,
  rs_R009_ueqv_R009YNNNN_partial_27_0137,
  rs_R009_ueqv_R009YNNNN_partial_27_0138,
  rs_R009_ueqv_R009YNNNN_partial_27_0139,
  rs_R009_ueqv_R009YNNNN_partial_27_0140,
  rs_R009_ueqv_R009YNNNN_partial_27_0141,
  rs_R009_ueqv_R009YNNNN_partial_27_0142,
  rs_R009_ueqv_R009YNNNN_partial_27_0143,
  rs_R009_ueqv_R009YNNNN_partial_27_0144,
  rs_R009_ueqv_R009YNNNN_partial_27_0145,
  rs_R009_ueqv_R009YNNNN_partial_27_0146,
  rs_R009_ueqv_R009YNNNN_partial_27_0147,
  rs_R009_ueqv_R009YNNNN_partial_27_0148,
  rs_R009_ueqv_R009YNNNN_partial_27_0149,
  rs_R009_ueqv_R009YNNNN_partial_27_0150,
  rs_R009_ueqv_R009YNNNN_partial_27_0151,
  rs_R009_ueqv_R009YNNNN_partial_27_0152,
  rs_R009_ueqv_R009YNNNN_partial_27_0153,
  rs_R009_ueqv_R009YNNNN_partial_27_0154,
  rs_R009_ueqv_R009YNNNN_partial_27_0155,
  rs_R009_ueqv_R009YNNNN_partial_27_0156,
  rs_R009_ueqv_R009YNNNN_partial_27_0157,
  rs_R009_ueqv_R009YNNNN_partial_27_0158,
  rs_R009_ueqv_R009YNNNN_partial_27_0159,
  rs_R009_ueqv_R009YNNNN_partial_27_0160,
  rs_R009_ueqv_R009YNNNN_partial_27_0161,
  rs_R009_ueqv_R009YNNNN_partial_27_0162,
  rs_R009_ueqv_R009YNNNN_partial_27_0163,
  rs_R009_ueqv_R009YNNNN_partial_27_0164,
  rs_R009_ueqv_R009YNNNN_partial_27_0165,
  rs_R009_ueqv_R009YNNNN_partial_27_0166,
  rs_R009_ueqv_R009YNNNN_partial_27_0167,
  rs_R009_ueqv_R009YNNNN_partial_27_0168,
  rs_R009_ueqv_R009YNNNN_partial_27_0169,
  rs_R009_ueqv_R009YNNNN_partial_27_0170,
  rs_R009_ueqv_R009YNNNN_partial_27_0171,
  rs_R009_ueqv_R009YNNNN_partial_27_0172,
  rs_R009_ueqv_R009YNNNN_partial_27_0173,
  rs_R009_ueqv_R009YNNNN_partial_27_0174,
  rs_R009_ueqv_R009YNNNN_partial_27_0175,
  rs_R009_ueqv_R009YNNNN_partial_27_0176,
  rs_R009_ueqv_R009YNNNN_partial_27_0177,
  rs_R009_ueqv_R009YNNNN_partial_27_0178,
  rs_R009_ueqv_R009YNNNN_partial_27_0179,
  rs_R009_ueqv_R009YNNNN_partial_27_0180,
  rs_R009_ueqv_R009YNNNN_partial_27_0181,
  rs_R009_ueqv_R009YNNNN_partial_27_0182,
  rs_R009_ueqv_R009YNNNN_partial_27_0183,
  rs_R009_ueqv_R009YNNNN_partial_27_0184,
  rs_R009_ueqv_R009YNNNN_partial_27_0185,
  rs_R009_ueqv_R009YNNNN_partial_27_0186,
  rs_R009_ueqv_R009YNNNN_partial_27_0187,
  rs_R009_ueqv_R009YNNNN_partial_27_0188,
  rs_R009_ueqv_R009YNNNN_partial_27_0189,
  rs_R009_ueqv_R009YNNNN_partial_27_0190,
  rs_R009_ueqv_R009YNNNN_partial_27_0191,
  rs_R009_ueqv_R009YNNNN_partial_27_0192,
  rs_R009_ueqv_R009YNNNN_partial_27_0193,
  rs_R009_ueqv_R009YNNNN_partial_27_0194,
  rs_R009_ueqv_R009YNNNN_partial_27_0195,
  rs_R009_ueqv_R009YNNNN_partial_27_0196,
  rs_R009_ueqv_R009YNNNN_partial_27_0197,
  rs_R009_ueqv_R009YNNNN_partial_27_0198,
  rs_R009_ueqv_R009YNNNN_partial_27_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_27_0100_0199 : Poly :=
[
  term ((17863087094824457 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1)],
  term ((2034064852007831 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1)],
  term ((29804779978493 : Rat) / 53959475808) [(0, 1), (1, 1), (2, 1), (9, 1), (12, 1)],
  term ((-1546237556623301 : Rat) / 3729948765228) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-1255706151605783 : Rat) / 2131399294416) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((4835 : Rat) / 168) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((-20197029797692999 : Rat) / 26109641356596) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-995 : Rat) / 42) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((5761020481920101 : Rat) / 19582231017447) [(0, 1), (1, 1), (3, 1), (6, 1), (12, 1)],
  term ((-317737054294735 : Rat) / 4351606892766) [(0, 1), (1, 1), (3, 1), (10, 1), (12, 1)],
  term ((26346365247500261 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (12, 1)],
  term ((-30297784755589265 : Rat) / 26109641356596) [(0, 1), (1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-12253579931516186 : Rat) / 2175803446383) [(0, 1), (1, 1), (6, 1), (7, 1), (12, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(0, 1), (1, 1), (6, 1), (9, 1), (12, 1)],
  term ((3605135840932286 : Rat) / 725267815461) [(0, 1), (1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-31794239140985521 : Rat) / 19582231017447) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-340 : Rat) / 63) [(0, 1), (1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7660998914045 : Rat) / 26861770943) [(0, 1), (1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-46099368547243013 : Rat) / 13054820678298) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((64 : Rat) / 9) [(0, 1), (1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (6, 1), (12, 2), (15, 1)],
  term ((9026606790637963 : Rat) / 13054820678298) [(0, 1), (1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-3977495663134691 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 1)],
  term ((12975389539029301 : Rat) / 8703213785532) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (1, 1), (7, 1), (12, 1), (14, 2)],
  term ((1438938201452681 : Rat) / 6527410339149) [(0, 1), (1, 1), (7, 1), (12, 2), (14, 1)],
  term ((-7570123039505 : Rat) / 8993245968) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((10861008665 : Rat) / 53531226) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 1), (1, 1), (9, 1), (10, 1), (12, 2)],
  term ((-5667274321397 : Rat) / 3854248272) [(0, 1), (1, 1), (9, 1), (12, 1)],
  term ((230253383698 : Rat) / 80296839) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-601699880041 : Rat) / 1498874328) [(0, 1), (1, 1), (9, 1), (12, 1), (14, 2)],
  term ((-1157783523689 : Rat) / 4496622984) [(0, 1), (1, 1), (9, 1), (12, 2)],
  term ((831953263739 : Rat) / 2997748656) [(0, 1), (1, 1), (9, 1), (12, 2), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 1), (1, 1), (10, 1), (11, 1), (12, 1)],
  term ((305066708021459 : Rat) / 355233215736) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-4706213285 : Rat) / 26765613) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term (10 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-655 : Rat) / 28) [(0, 1), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-385961000 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(0, 1), (1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19000961721258263 : Rat) / 13054820678298) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1)],
  term ((127 : Rat) / 7) [(0, 1), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 53531226) [(0, 1), (1, 1), (10, 1), (12, 2), (13, 1)],
  term (-5 : Rat) [(0, 1), (1, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((192980500 : Rat) / 3823659) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1)],
  term (4 : Rat) [(0, 1), (1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((584642562593892197 : Rat) / 104438565426384) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-114417635149931321 : Rat) / 26109641356596) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-239616 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 2)],
  term ((359424 : Rat) / 553) [(0, 1), (1, 1), (11, 1), (12, 2), (14, 1)],
  term ((17490217058418431 : Rat) / 34812855142128) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-15088845123172 : Rat) / 4933794663) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-120 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7415538672713 : Rat) / 19735178652) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-485 : Rat) / 14) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((565 : Rat) / 12) [(0, 1), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((404017876337909641 : Rat) / 52219282713192) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((144 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-523616232139340 : Rat) / 725267815461) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1)],
  term ((202 : Rat) / 7) [(0, 1), (1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-243917127443347633 : Rat) / 52219282713192) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-907 : Rat) / 21) [(0, 1), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 27756932) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-360495937631 : Rat) / 1498874328) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1)],
  term ((1135 : Rat) / 28) [(0, 1), (1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-135 : Rat) / 14) [(0, 1), (1, 1), (12, 2), (13, 1), (16, 1)],
  term ((4854827766745 : Rat) / 29602767978) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-239 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14876033252587 : Rat) / 44404151967) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((54 : Rat) / 7) [(0, 1), (1, 1), (12, 2), (15, 1), (16, 1)],
  term ((-18113759730071641 : Rat) / 17406427571064) [(0, 1), (1, 1), (13, 1), (14, 1)],
  term ((523616232139340 : Rat) / 725267815461) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-202 : Rat) / 7) [(0, 1), (1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((22884100576406143 : Rat) / 17406427571064) [(0, 1), (1, 1), (13, 1), (14, 2)],
  term ((-12101327290075825 : Rat) / 1450535630922) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((1256 : Rat) / 21) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((831117266131 : Rat) / 1498874328) [(0, 1), (1, 1), (13, 3), (14, 1)],
  term ((-1635 : Rat) / 28) [(0, 1), (1, 1), (13, 3), (14, 1), (16, 1)],
  term ((135 : Rat) / 7) [(0, 1), (1, 1), (13, 3), (16, 1)],
  term ((-45864690786755 : Rat) / 8703213785532) [(0, 1), (1, 2), (2, 1), (12, 1)],
  term ((-91729381573510 : Rat) / 6527410339149) [(0, 1), (1, 2), (6, 1), (12, 1)],
  term ((-1460822197993979 : Rat) / 4351606892766) [(0, 1), (1, 2), (12, 1)],
  term ((1419482045382901 : Rat) / 2901071261844) [(0, 1), (1, 2), (12, 1), (14, 1)],
  term ((-9984 : Rat) / 553) [(0, 1), (1, 2), (12, 2)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 1), (1, 2), (13, 2), (14, 1)],
  term ((1635 : Rat) / 56) [(0, 1), (1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-135 : Rat) / 14) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((18113759730071641 : Rat) / 34812855142128) [(0, 1), (1, 2), (14, 1)],
  term ((-261808116069670 : Rat) / 725267815461) [(0, 1), (1, 2), (14, 1), (15, 2)],
  term ((101 : Rat) / 7) [(0, 1), (1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-22884100576406143 : Rat) / 34812855142128) [(0, 1), (1, 2), (14, 2)],
  term ((12101327290075825 : Rat) / 2901071261844) [(0, 1), (1, 2), (15, 2)],
  term ((-628 : Rat) / 21) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((70690683689524370 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1)],
  term ((4598551068761 : Rat) / 40469606856) [(0, 1), (2, 1), (3, 1), (9, 1), (12, 1)],
  term ((-36306455678017967 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((-95140102894763 : Rat) / 1598549470812) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1)],
  term ((9095 : Rat) / 126) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((302561760447571 : Rat) / 532849823604) [(0, 1), (2, 1), (12, 1)],
  term ((-135 : Rat) / 7) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-831117266131 : Rat) / 1498874328) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((1635 : Rat) / 28) [(0, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((12101327290075825 : Rat) / 1450535630922) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1256 : Rat) / 21) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((18113759730071641 : Rat) / 17406427571064) [(0, 1), (12, 1), (14, 2)],
  term ((-523616232139340 : Rat) / 725267815461) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((202 : Rat) / 7) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-22884100576406143 : Rat) / 17406427571064) [(0, 1), (12, 1), (14, 3)],
  term ((18113759730071641 : Rat) / 17406427571064) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-523616232139340 : Rat) / 725267815461) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((202 : Rat) / 7) [(0, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-22884100576406143 : Rat) / 17406427571064) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((12101327290075825 : Rat) / 1450535630922) [(0, 1), (13, 1), (15, 3)],
  term ((-1256 : Rat) / 21) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((-1635 : Rat) / 56) [(0, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((135 : Rat) / 14) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((831117266131 : Rat) / 2997748656) [(0, 1), (13, 2), (14, 3)],
  term ((-1635 : Rat) / 56) [(0, 1), (13, 2), (14, 3), (16, 1)],
  term ((135 : Rat) / 14) [(0, 1), (13, 2), (15, 2), (16, 1)],
  term ((-831117266131 : Rat) / 1498874328) [(0, 1), (13, 3), (14, 1), (15, 1)],
  term ((1635 : Rat) / 28) [(0, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-135 : Rat) / 7) [(0, 1), (13, 3), (15, 1), (16, 1)],
  term ((-18113759730071641 : Rat) / 34812855142128) [(0, 1), (14, 1), (15, 2)],
  term ((261808116069670 : Rat) / 725267815461) [(0, 1), (14, 1), (15, 4)],
  term ((-101 : Rat) / 7) [(0, 1), (14, 1), (15, 4), (16, 1)],
  term ((-122331826904503757 : Rat) / 34812855142128) [(0, 1), (14, 2), (15, 2)],
  term ((628 : Rat) / 21) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-18113759730071641 : Rat) / 34812855142128) [(0, 1), (14, 3)],
  term ((261808116069670 : Rat) / 725267815461) [(0, 1), (14, 3), (15, 2)],
  term ((-101 : Rat) / 7) [(0, 1), (14, 3), (15, 2), (16, 1)],
  term ((22884100576406143 : Rat) / 34812855142128) [(0, 1), (14, 4)],
  term ((-12101327290075825 : Rat) / 2901071261844) [(0, 1), (15, 4)],
  term ((628 : Rat) / 21) [(0, 1), (15, 4), (16, 1)],
  term ((-17863087094824457 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (3, 1)],
  term ((-2034064852007831 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (7, 1)],
  term ((-29804779978493 : Rat) / 107918951616) [(0, 2), (1, 1), (2, 1), (9, 1)],
  term ((1546237556623301 : Rat) / 7459897530456) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((1255706151605783 : Rat) / 4262798588832) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((-4835 : Rat) / 336) [(0, 2), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((20197029797692999 : Rat) / 52219282713192) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((995 : Rat) / 84) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-26346365247500261 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1)],
  term ((-5761020481920101 : Rat) / 39164462034894) [(0, 2), (1, 1), (3, 1), (6, 1)],
  term ((317737054294735 : Rat) / 8703213785532) [(0, 2), (1, 1), (3, 1), (10, 1)],
  term ((30297784755589265 : Rat) / 52219282713192) [(0, 2), (1, 1), (3, 1), (14, 1)],
  term ((6126789965758093 : Rat) / 2175803446383) [(0, 2), (1, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(0, 2), (1, 1), (6, 1), (9, 1)],
  term ((-1802567920466143 : Rat) / 725267815461) [(0, 2), (1, 1), (6, 1), (11, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(0, 2), (1, 1), (6, 1), (12, 1), (15, 1)],
  term ((31794239140985521 : Rat) / 39164462034894) [(0, 2), (1, 1), (6, 1), (13, 1)],
  term ((170 : Rat) / 63) [(0, 2), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((7660998914045 : Rat) / 53723541886) [(0, 2), (1, 1), (6, 1), (14, 1), (15, 1)],
  term ((46099368547243013 : Rat) / 26109641356596) [(0, 2), (1, 1), (6, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(0, 2), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((3977495663134691 : Rat) / 13054820678298) [(0, 2), (1, 1), (7, 1)],
  term ((-9026606790637963 : Rat) / 26109641356596) [(0, 2), (1, 1), (7, 1), (10, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(0, 2), (1, 1), (7, 1), (12, 1), (14, 1)],
  term ((-12975389539029301 : Rat) / 17406427571064) [(0, 2), (1, 1), (7, 1), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (1, 1), (7, 1), (14, 2)],
  term ((5667274321397 : Rat) / 7708496544) [(0, 2), (1, 1), (9, 1)],
  term ((7570123039505 : Rat) / 17986491936) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((10861008665 : Rat) / 214124904) [(0, 2), (1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-10861008665 : Rat) / 107062452) [(0, 2), (1, 1), (9, 1), (10, 1), (14, 1)],
  term ((1157783523689 : Rat) / 8993245968) [(0, 2), (1, 1), (9, 1), (12, 1)],
  term ((-831953263739 : Rat) / 5995497312) [(0, 2), (1, 1), (9, 1), (12, 1), (14, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 2), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 2), (1, 1), (9, 1), (13, 2)],
  term ((-115126691849 : Rat) / 80296839) [(0, 2), (1, 1), (9, 1), (14, 1)],
  term ((601699880041 : Rat) / 2997748656) [(0, 2), (1, 1), (9, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(0, 2), (1, 1), (10, 1), (11, 1)],
  term ((-4706213285 : Rat) / 107062452) [(0, 2), (1, 1), (10, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 2) [(0, 2), (1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-96490250 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1)],
  term (-2 : Rat) [(0, 2), (1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-305066708021459 : Rat) / 710466431472) [(0, 2), (1, 1), (10, 1), (13, 1)],
  term ((4706213285 : Rat) / 53531226) [(0, 2), (1, 1), (10, 1), (13, 1), (14, 1)],
  term (-5 : Rat) [(0, 2), (1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((655 : Rat) / 56) [(0, 2), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((192980500 : Rat) / 3823659) [(0, 2), (1, 1), (10, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(0, 2), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((19000961721258263 : Rat) / 26109641356596) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((-127 : Rat) / 14) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-584642562593892197 : Rat) / 208877130852768) [(0, 2), (1, 1), (11, 1)],
  term ((-179712 : Rat) / 553) [(0, 2), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((114417635149931321 : Rat) / 52219282713192) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(0, 2), (1, 1), (11, 1), (14, 2)],
  term ((-4706213285 : Rat) / 55513864) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((360495937631 : Rat) / 2997748656) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1135 : Rat) / 56) [(0, 2), (1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((135 : Rat) / 28) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4854827766745 : Rat) / 59205535956) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((239 : Rat) / 14) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((14876033252587 : Rat) / 88808303934) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-27 : Rat) / 7) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18118737032630015 : Rat) / 69625710284256) [(0, 2), (1, 1), (13, 1)],
  term ((7544422561586 : Rat) / 4933794663) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((60 : Rat) / 7) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7415538672713 : Rat) / 39470357304) [(0, 2), (1, 1), (13, 1), (14, 2)],
  term ((485 : Rat) / 28) [(0, 2), (1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-100872416720 : Rat) / 187359291) [(0, 2), (1, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 7) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-565 : Rat) / 24) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((8549804990 : Rat) / 26765613) [(0, 2), (1, 1), (13, 2), (15, 1)],
  term (-4 : Rat) [(0, 2), (1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 2), (1, 1), (13, 3)],
  term ((10 : Rat) / 7) [(0, 2), (1, 1), (13, 3), (16, 1)],
  term ((-404017876337909641 : Rat) / 104438565426384) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-72 : Rat) / 7) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((261808116069670 : Rat) / 725267815461) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((-101 : Rat) / 7) [(0, 2), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((243917127443347633 : Rat) / 104438565426384) [(0, 2), (1, 1), (15, 1)],
  term ((907 : Rat) / 42) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((1500104696382203 : Rat) / 8703213785532) [(0, 2), (1, 2)],
  term ((45864690786755 : Rat) / 17406427571064) [(0, 2), (1, 2), (2, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(0, 2), (1, 2), (6, 1)],
  term ((-10861008665 : Rat) / 749437164) [(0, 2), (1, 2), (9, 1), (13, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 2), (1, 2), (9, 1), (15, 1)],
  term ((4992 : Rat) / 553) [(0, 2), (1, 2), (12, 1)],
  term ((-4274902495 : Rat) / 26765613) [(0, 2), (1, 2), (13, 1), (15, 1)],
  term (2 : Rat) [(0, 2), (1, 2), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 2), (1, 2), (13, 2)],
  term ((-5 : Rat) / 7) [(0, 2), (1, 2), (13, 2), (16, 1)],
  term ((-1419482045382901 : Rat) / 5802142523688) [(0, 2), (1, 2), (14, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 2), (1, 2), (15, 2)],
  term ((-8 : Rat) / 7) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((-302561760447571 : Rat) / 1065699647208) [(0, 2), (2, 1)],
  term ((-35345341844762185 : Rat) / 19582231017447) [(0, 2), (2, 1), (3, 1), (7, 1)],
  term ((-4598551068761 : Rat) / 80939213712) [(0, 2), (2, 1), (3, 1), (9, 1)],
  term ((36306455678017967 : Rat) / 39164462034894) [(0, 2), (2, 1), (3, 1), (11, 1)],
  term ((95140102894763 : Rat) / 3197098941624) [(0, 2), (2, 1), (3, 1), (13, 1)],
  term ((-9095 : Rat) / 252) [(0, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((10861008665 : Rat) / 187359291) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((10861008665 : Rat) / 749437164) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((54305043325 : Rat) / 749437164) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (13, 2), (15, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((-10861008665 : Rat) / 374718582) [(0, 2), (9, 1), (15, 3)],
  term ((-8549804990 : Rat) / 26765613) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(0, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((868766972411 : Rat) / 1498874328) [(0, 2), (12, 1), (13, 2), (14, 1)],
  term ((-1675 : Rat) / 28) [(0, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((135 : Rat) / 7) [(0, 2), (12, 1), (13, 2), (16, 1)],
  term ((-17956629736518745 : Rat) / 17406427571064) [(0, 2), (12, 1), (14, 1)],
  term ((914093357262460 : Rat) / 725267815461) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-218 : Rat) / 7) [(0, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((22884100576406143 : Rat) / 17406427571064) [(0, 2), (12, 1), (14, 2)],
  term ((-12101327290075825 : Rat) / 1450535630922) [(0, 2), (12, 1), (15, 2)],
  term ((1256 : Rat) / 21) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((4274902495 : Rat) / 26765613) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term (-2 : Rat) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4992 : Rat) / 553) [(0, 2), (13, 1), (15, 1)],
  term ((14532970465 : Rat) / 20817699) [(0, 2), (13, 1), (15, 3)],
  term ((-30 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4706213285 : Rat) / 374718582) [(0, 2), (13, 2), (14, 2)],
  term ((5 : Rat) / 7) [(0, 2), (13, 2), (14, 2), (16, 1)],
  term ((-41467827715 : Rat) / 124906194) [(0, 2), (13, 2), (15, 2)],
  term ((33 : Rat) / 7) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((4706213285 : Rat) / 187359291) [(0, 2), (13, 3), (15, 1)],
  term ((-10 : Rat) / 7) [(0, 2), (13, 3), (15, 1), (16, 1)],
  term ((-2496 : Rat) / 553) [(0, 2), (14, 2)],
  term ((-50436208360 : Rat) / 187359291) [(0, 2), (14, 2), (15, 2)],
  term ((8 : Rat) / 7) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2496 : Rat) / 553) [(0, 2), (15, 2)],
  term ((-50436208360 : Rat) / 187359291) [(0, 2), (15, 4)],
  term ((8 : Rat) / 7) [(0, 2), (15, 4), (16, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 3), (9, 1), (12, 1), (13, 1)],
  term ((-10861008665 : Rat) / 187359291) [(0, 3), (9, 1), (12, 1), (15, 1)],
  term ((-4992 : Rat) / 553) [(0, 3), (12, 1)],
  term ((8549804990 : Rat) / 26765613) [(0, 3), (12, 1), (13, 1), (15, 1)],
  term (-4 : Rat) [(0, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 187359291) [(0, 3), (12, 1), (13, 2)],
  term ((10 : Rat) / 7) [(0, 3), (12, 1), (13, 2), (16, 1)],
  term ((-100872416720 : Rat) / 187359291) [(0, 3), (12, 1), (15, 2)],
  term ((16 : Rat) / 7) [(0, 3), (12, 1), (15, 2), (16, 1)],
  term ((-831117266131 : Rat) / 2997748656) [(0, 3), (13, 2), (14, 1)],
  term ((1635 : Rat) / 56) [(0, 3), (13, 2), (14, 1), (16, 1)],
  term ((-135 : Rat) / 14) [(0, 3), (13, 2), (16, 1)],
  term ((18113759730071641 : Rat) / 34812855142128) [(0, 3), (14, 1)],
  term ((-261808116069670 : Rat) / 725267815461) [(0, 3), (14, 1), (15, 2)],
  term ((101 : Rat) / 7) [(0, 3), (14, 1), (15, 2), (16, 1)],
  term ((-22884100576406143 : Rat) / 34812855142128) [(0, 3), (14, 2)],
  term ((12101327290075825 : Rat) / 2901071261844) [(0, 3), (15, 2)],
  term ((-628 : Rat) / 21) [(0, 3), (15, 2), (16, 1)],
  term ((2496 : Rat) / 553) [(0, 4)],
  term ((-10861008665 : Rat) / 749437164) [(0, 4), (9, 1), (13, 1)],
  term ((10861008665 : Rat) / 374718582) [(0, 4), (9, 1), (15, 1)],
  term ((-4274902495 : Rat) / 26765613) [(0, 4), (13, 1), (15, 1)],
  term (2 : Rat) [(0, 4), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 374718582) [(0, 4), (13, 2)],
  term ((-5 : Rat) / 7) [(0, 4), (13, 2), (16, 1)],
  term ((50436208360 : Rat) / 187359291) [(0, 4), (15, 2)],
  term ((-8 : Rat) / 7) [(0, 4), (15, 2), (16, 1)],
  term ((70690683689524370 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1)],
  term ((4598551068761 : Rat) / 40469606856) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)],
  term ((-36306455678017967 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-17863087094824457 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1)],
  term ((-17863087094824457 : Rat) / 26109641356596) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-95140102894763 : Rat) / 1598549470812) [(1, 1), (2, 1), (3, 1), (13, 2)],
  term ((9095 : Rat) / 126) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1), (14, 2)],
  term ((17863087094824457 : Rat) / 52219282713192) [(1, 1), (2, 1), (3, 1), (15, 2)],
  term ((-2034064852007831 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1)],
  term ((-2034064852007831 : Rat) / 26109641356596) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((2034064852007831 : Rat) / 52219282713192) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-29804779978493 : Rat) / 53959475808) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1)],
  term ((-29804779978493 : Rat) / 53959475808) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((29804779978493 : Rat) / 107918951616) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((1546237556623301 : Rat) / 3729948765228) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((1546237556623301 : Rat) / 3729948765228) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-1546237556623301 : Rat) / 7459897530456) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((1255706151605783 : Rat) / 2131399294416) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4835 : Rat) / 168) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((20197029797692999 : Rat) / 26109641356596) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((995 : Rat) / 42) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((302561760447571 : Rat) / 532849823604) [(1, 1), (2, 1), (13, 1)],
  term ((-1255706151605783 : Rat) / 4262798588832) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((4835 : Rat) / 336) [(1, 1), (2, 1), (13, 1), (14, 2), (16, 1)],
  term ((33348878984286875 : Rat) / 69625710284256) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((4265 : Rat) / 112) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((1255706151605783 : Rat) / 2131399294416) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-4835 : Rat) / 168) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-995 : Rat) / 84) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20197029797692999 : Rat) / 52219282713192) [(1, 1), (2, 1), (15, 3)],
  term ((-995 : Rat) / 84) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-5761020481920101 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 1)],
  term ((-5761020481920101 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((5761020481920101 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((5761020481920101 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((317737054294735 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1), (12, 1), (14, 1)],
  term ((317737054294735 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (14, 2)],
  term ((-317737054294735 : Rat) / 8703213785532) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((-26346365247500261 : Rat) / 26109641356596) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((30297784755589265 : Rat) / 26109641356596) [(1, 1), (3, 1), (12, 1), (14, 2)],
  term ((30297784755589265 : Rat) / 26109641356596) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-26346365247500261 : Rat) / 26109641356596) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-30297784755589265 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((26346365247500261 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 2)],
  term ((-30297784755589265 : Rat) / 52219282713192) [(1, 1), (3, 1), (14, 3)],
  term ((26346365247500261 : Rat) / 52219282713192) [(1, 1), (3, 1), (15, 2)],
  term ((12253579931516186 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((12253579931516186 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-6126789965758093 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (14, 2)],
  term ((-6126789965758093 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((-3605135840932286 : Rat) / 725267815461) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3605135840932286 : Rat) / 725267815461) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((1802567920466143 : Rat) / 725267815461) [(1, 1), (6, 1), (11, 1), (14, 2)],
  term ((1802567920466143 : Rat) / 725267815461) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((31794239140985521 : Rat) / 19582231017447) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((46099368547243013 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2284307270773189 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((7660998914045 : Rat) / 26861770943) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-31794239140985521 : Rat) / 39164462034894) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-170 : Rat) / 63) [(1, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((53251933250371759 : Rat) / 19582231017447) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-206 : Rat) / 21) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((31794239140985521 : Rat) / 19582231017447) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7660998914045 : Rat) / 53723541886) [(1, 1), (6, 1), (14, 1), (15, 3)],
  term ((-46099368547243013 : Rat) / 26109641356596) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7660998914045 : Rat) / 53723541886) [(1, 1), (6, 1), (14, 3), (15, 1)],
  term ((-46099368547243013 : Rat) / 26109641356596) [(1, 1), (6, 1), (15, 3)],
  term ((32 : Rat) / 9) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-9026606790637963 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-9026606790637963 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (14, 2)],
  term ((9026606790637963 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3977495663134691 : Rat) / 6527410339149) [(1, 1), (7, 1), (12, 1), (14, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-12975389539029301 : Rat) / 8703213785532) [(1, 1), (7, 1), (12, 1), (14, 2)],
  term ((2928236390343029 : Rat) / 13054820678298) [(1, 1), (7, 1), (12, 1), (14, 3)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 1), (7, 1), (12, 2), (14, 2)],
  term ((-12975389539029301 : Rat) / 8703213785532) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((3977495663134691 : Rat) / 6527410339149) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((12975389539029301 : Rat) / 17406427571064) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-3977495663134691 : Rat) / 13054820678298) [(1, 1), (7, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((12975389539029301 : Rat) / 17406427571064) [(1, 1), (7, 1), (14, 3)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 4)],
  term ((-3977495663134691 : Rat) / 13054820678298) [(1, 1), (7, 1), (15, 2)],
  term ((10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((7570123039505 : Rat) / 8993245968) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-54305043325 : Rat) / 214124904) [(1, 1), (9, 1), (10, 1), (12, 1), (14, 2)],
  term ((-10861008665 : Rat) / 214124904) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((-10861008665 : Rat) / 53531226) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((7570123039505 : Rat) / 8993245968) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-7570123039505 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (14, 2)],
  term ((10861008665 : Rat) / 107062452) [(1, 1), (9, 1), (10, 1), (14, 3)],
  term ((-7570123039505 : Rat) / 17986491936) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-831953263739 : Rat) / 2997748656) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1157783523689 : Rat) / 4496622984) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((5667274321397 : Rat) / 3854248272) [(1, 1), (9, 1), (12, 1), (14, 1)],
  term ((831953263739 : Rat) / 5995497312) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8982054165955 : Rat) / 2997748656) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((154226323043 : Rat) / 285499872) [(1, 1), (9, 1), (12, 1), (14, 3)],
  term ((-1157783523689 : Rat) / 8993245968) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((1157783523689 : Rat) / 4496622984) [(1, 1), (9, 1), (12, 2), (14, 1)],
  term ((-831953263739 : Rat) / 2997748656) [(1, 1), (9, 1), (12, 2), (14, 2)],
  term ((-230253383698 : Rat) / 80296839) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((601699880041 : Rat) / 1498874328) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((5667274321397 : Rat) / 3854248272) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((115126691849 : Rat) / 80296839) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-5667274321397 : Rat) / 7708496544) [(1, 1), (9, 1), (14, 2)],
  term ((-601699880041 : Rat) / 2997748656) [(1, 1), (9, 1), (14, 2), (15, 2)],
  term ((115126691849 : Rat) / 80296839) [(1, 1), (9, 1), (14, 3)],
  term ((-601699880041 : Rat) / 2997748656) [(1, 1), (9, 1), (14, 4)],
  term ((-5667274321397 : Rat) / 7708496544) [(1, 1), (9, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-305066708021459 : Rat) / 355233215736) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((655 : Rat) / 28) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((23531066425 : Rat) / 107062452) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-25 : Rat) / 2) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-697240715 : Rat) / 107062452) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13 : Rat) / 2) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4706213285 : Rat) / 53531226) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term (5 : Rat) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((19000961721258263 : Rat) / 13054820678298) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-127 : Rat) / 7) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((482451250 : Rat) / 3823659) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term (10 : Rat) [(1, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((96490250 : Rat) / 3823659) [(1, 1), (10, 1), (12, 1), (15, 3)],
  term (2 : Rat) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4706213285 : Rat) / 53531226) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term (5 : Rat) [(1, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-192980500 : Rat) / 3823659) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term (-4 : Rat) [(1, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((697240715 : Rat) / 53531226) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term (13 : Rat) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((305066708021459 : Rat) / 710466431472) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((-655 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4706213285 : Rat) / 53531226) [(1, 1), (10, 1), (13, 1), (14, 3)],
  term (5 : Rat) [(1, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((196852499849220577 : Rat) / 104438565426384) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1671 : Rat) / 56) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((4706213285 : Rat) / 26765613) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term (-10 : Rat) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-305066708021459 : Rat) / 355233215736) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((655 : Rat) / 28) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-192980500 : Rat) / 3823659) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term (-4 : Rat) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-19000961721258263 : Rat) / 26109641356596) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((127 : Rat) / 14) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-192980500 : Rat) / 3823659) [(1, 1), (10, 1), (14, 3), (15, 1)],
  term (-4 : Rat) [(1, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-19000961721258263 : Rat) / 26109641356596) [(1, 1), (10, 1), (15, 3)],
  term ((127 : Rat) / 14) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-359424 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-584642562593892197 : Rat) / 104438565426384) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((179712 : Rat) / 553) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((114417635149931321 : Rat) / 26109641356596) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((59904 : Rat) / 79) [(1, 1), (11, 1), (12, 1), (14, 3)],
  term ((-359424 : Rat) / 553) [(1, 1), (11, 1), (12, 2), (14, 2)],
  term ((114417635149931321 : Rat) / 26109641356596) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-584642562593892197 : Rat) / 104438565426384) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-114417635149931321 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((584642562593892197 : Rat) / 208877130852768) [(1, 1), (11, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((-114417635149931321 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 3)],
  term ((-119808 : Rat) / 553) [(1, 1), (11, 1), (14, 4)],
  term ((584642562593892197 : Rat) / 208877130852768) [(1, 1), (11, 1), (15, 2)],
  term ((-17490217058418431 : Rat) / 34812855142128) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-67317801206809 : Rat) / 236822143824) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((3047 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-565 : Rat) / 12) [(1, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((124056878631011 : Rat) / 39470357304) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((345 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-117465643145405 : Rat) / 236822143824) [(1, 1), (12, 1), (13, 1), (14, 3)],
  term ((3075 : Rat) / 56) [(1, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((21303332118773 : Rat) / 50747602248) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-351 : Rat) / 28) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((360495937631 : Rat) / 1498874328) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1135 : Rat) / 28) [(1, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4706213285 : Rat) / 27756932) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((135 : Rat) / 14) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((243917127443347633 : Rat) / 52219282713192) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((907 : Rat) / 21) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4854827766745 : Rat) / 59205535956) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((-239 : Rat) / 14) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-412764983890430797 : Rat) / 52219282713192) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-117 : Rat) / 7) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((777450496375955 : Rat) / 967023753948) [(1, 1), (12, 1), (14, 3), (15, 1)],
  term ((-643 : Rat) / 14) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-14876033252587 : Rat) / 88808303934) [(1, 1), (12, 1), (15, 3)],
  term ((27 : Rat) / 7) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4706213285 : Rat) / 27756932) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((135 : Rat) / 14) [(1, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((360495937631 : Rat) / 1498874328) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((-1135 : Rat) / 28) [(1, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((14876033252587 : Rat) / 44404151967) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-54 : Rat) / 7) [(1, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4854827766745 : Rat) / 29602767978) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((239 : Rat) / 7) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-483868044729735865 : Rat) / 52219282713192) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-204 : Rat) / 7) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((17490217058418431 : Rat) / 69625710284256) [(1, 1), (13, 1), (14, 2)],
  term ((5279014042003531 : Rat) / 5802142523688) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1293 : Rat) / 28) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((565 : Rat) / 24) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7544422561586 : Rat) / 4933794663) [(1, 1), (13, 1), (14, 3)],
  term ((-60 : Rat) / 7) [(1, 1), (13, 1), (14, 3), (16, 1)],
  term ((7415538672713 : Rat) / 39470357304) [(1, 1), (13, 1), (14, 4)],
  term ((-485 : Rat) / 28) [(1, 1), (13, 1), (14, 4), (16, 1)],
  term ((1028139160948645825 : Rat) / 208877130852768) [(1, 1), (13, 1), (15, 2)],
  term ((3737 : Rat) / 56) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((15088845123172 : Rat) / 4933794663) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((120 : Rat) / 7) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7415538672713 : Rat) / 19735178652) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((485 : Rat) / 14) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-17490217058418431 : Rat) / 34812855142128) [(1, 1), (13, 2), (15, 1)],
  term ((-565 : Rat) / 12) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((404017876337909641 : Rat) / 104438565426384) [(1, 1), (14, 1), (15, 3)],
  term ((72 : Rat) / 7) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-243917127443347633 : Rat) / 104438565426384) [(1, 1), (14, 2), (15, 1)],
  term ((-907 : Rat) / 42) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-261808116069670 : Rat) / 725267815461) [(1, 1), (14, 2), (15, 3)],
  term ((101 : Rat) / 7) [(1, 1), (14, 2), (15, 3), (16, 1)],
  term ((404017876337909641 : Rat) / 104438565426384) [(1, 1), (14, 3), (15, 1)],
  term ((72 : Rat) / 7) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-261808116069670 : Rat) / 725267815461) [(1, 1), (14, 4), (15, 1)],
  term ((101 : Rat) / 7) [(1, 1), (14, 4), (15, 1), (16, 1)],
  term ((-243917127443347633 : Rat) / 104438565426384) [(1, 1), (15, 3)],
  term ((-907 : Rat) / 42) [(1, 1), (15, 3), (16, 1)],
  term ((-302561760447571 : Rat) / 1065699647208) [(1, 2), (2, 1)],
  term ((-35345341844762185 : Rat) / 19582231017447) [(1, 2), (2, 1), (3, 1), (7, 1)],
  term ((-4598551068761 : Rat) / 80939213712) [(1, 2), (2, 1), (3, 1), (9, 1)],
  term ((36306455678017967 : Rat) / 39164462034894) [(1, 2), (2, 1), (3, 1), (11, 1)],
  term ((111840387610790129 : Rat) / 156657848139576) [(1, 2), (2, 1), (3, 1), (13, 1)],
  term ((-9095 : Rat) / 252) [(1, 2), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((2034064852007831 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((29804779978493 : Rat) / 53959475808) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((-1546237556623301 : Rat) / 3729948765228) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((45864690786755 : Rat) / 8703213785532) [(1, 2), (2, 1), (12, 1), (14, 1)],
  term ((-10029717862666367 : Rat) / 13054820678298) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-995 : Rat) / 42) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1255706151605783 : Rat) / 2131399294416) [(1, 2), (2, 1), (13, 2)],
  term ((4835 : Rat) / 168) [(1, 2), (2, 1), (13, 2), (16, 1)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1), (14, 2)],
  term ((-45864690786755 : Rat) / 17406427571064) [(1, 2), (2, 1), (15, 2)],
  term ((5761020481920101 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-317737054294735 : Rat) / 4351606892766) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((26346365247500261 : Rat) / 26109641356596) [(1, 2), (3, 1), (13, 1)],
  term ((-30297784755589265 : Rat) / 26109641356596) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-12253579931516186 : Rat) / 2175803446383) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((3605135840932286 : Rat) / 725267815461) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-1438938201452681 : Rat) / 6527410339149) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((91729381573510 : Rat) / 6527410339149) [(1, 2), (6, 1), (12, 1), (14, 1)],
  term ((-7660998914045 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15305303261365331 : Rat) / 4351606892766) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((64 : Rat) / 9) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31794239140985521 : Rat) / 19582231017447) [(1, 2), (6, 1), (13, 2)],
  term ((-340 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 2), (6, 1), (14, 2)],
  term ((-45864690786755 : Rat) / 6527410339149) [(1, 2), (6, 1), (15, 2)],
  term ((9026606790637963 : Rat) / 13054820678298) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((1438938201452681 : Rat) / 6527410339149) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3977495663134691 : Rat) / 6527410339149) [(1, 2), (7, 1), (13, 1)],
  term ((12975389539029301 : Rat) / 8703213785532) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((-10861008665 : Rat) / 107062452) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-7570123039505 : Rat) / 8993245968) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((10861008665 : Rat) / 53531226) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1157783523689 : Rat) / 4496622984) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((831953263739 : Rat) / 2997748656) [(1, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5667274321397 : Rat) / 3854248272) [(1, 2), (9, 1), (13, 1)],
  term ((230253383698 : Rat) / 80296839) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-601699880041 : Rat) / 1498874328) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((192980500 : Rat) / 3823659) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (4 : Rat) [(1, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 53531226) [(1, 2), (10, 1), (12, 1), (13, 2)],
  term (-5 : Rat) [(1, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-385961000 : Rat) / 3823659) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term (-8 : Rat) [(1, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19000961721258263 : Rat) / 13054820678298) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((127 : Rat) / 7) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((305066708021459 : Rat) / 355233215736) [(1, 2), (10, 1), (13, 2)],
  term ((-4706213285 : Rat) / 26765613) [(1, 2), (10, 1), (13, 2), (14, 1)],
  term (10 : Rat) [(1, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-655 : Rat) / 28) [(1, 2), (10, 1), (13, 2), (16, 1)],
  term ((359424 : Rat) / 553) [(1, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((584642562593892197 : Rat) / 104438565426384) [(1, 2), (11, 1), (13, 1)],
  term ((-114417635149931321 : Rat) / 26109641356596) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-239616 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (14, 2)],
  term ((4854827766745 : Rat) / 29602767978) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-239 : Rat) / 7) [(1, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14074349612011 : Rat) / 44404151967) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((54 : Rat) / 7) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4706213285 : Rat) / 27756932) [(1, 2), (12, 1), (13, 2)],
  term ((-360495937631 : Rat) / 1498874328) [(1, 2), (12, 1), (13, 2), (14, 1)],
  term ((1135 : Rat) / 28) [(1, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-135 : Rat) / 14) [(1, 2), (12, 1), (13, 2), (16, 1)],
  term ((1460822197993979 : Rat) / 4351606892766) [(1, 2), (12, 1), (14, 1)],
  term ((-1445670377641717 : Rat) / 2901071261844) [(1, 2), (12, 1), (14, 2)],
  term ((-4992 : Rat) / 553) [(1, 2), (12, 1), (15, 2)],
  term ((9984 : Rat) / 553) [(1, 2), (12, 2), (14, 1)],
  term ((378467199521017423 : Rat) / 52219282713192) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((144 : Rat) / 7) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-523616232139340 : Rat) / 725267815461) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((202 : Rat) / 7) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-226387261067419885 : Rat) / 52219282713192) [(1, 2), (13, 1), (15, 1)],
  term ((-907 : Rat) / 21) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((17490217058418431 : Rat) / 34812855142128) [(1, 2), (13, 2)],
  term ((-15088845123172 : Rat) / 4933794663) [(1, 2), (13, 2), (14, 1)],
  term ((-120 : Rat) / 7) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((7415538672713 : Rat) / 19735178652) [(1, 2), (13, 2), (14, 2)],
  term ((-485 : Rat) / 14) [(1, 2), (13, 2), (14, 2), (16, 1)],
  term ((565 : Rat) / 12) [(1, 2), (13, 2), (16, 1)],
  term ((1419482045382901 : Rat) / 5802142523688) [(1, 2), (14, 1), (15, 2)],
  term ((-1460822197993979 : Rat) / 8703213785532) [(1, 2), (14, 2)],
  term ((1419482045382901 : Rat) / 5802142523688) [(1, 2), (14, 3)],
  term ((-1460822197993979 : Rat) / 8703213785532) [(1, 2), (15, 2)],
  term ((-17863087094824457 : Rat) / 52219282713192) [(1, 3), (2, 1), (3, 1)],
  term ((-2034064852007831 : Rat) / 52219282713192) [(1, 3), (2, 1), (7, 1)],
  term ((-29804779978493 : Rat) / 107918951616) [(1, 3), (2, 1), (9, 1)],
  term ((1546237556623301 : Rat) / 7459897530456) [(1, 3), (2, 1), (11, 1)],
  term ((60428848849801247 : Rat) / 208877130852768) [(1, 3), (2, 1), (13, 1)],
  term ((-4835 : Rat) / 336) [(1, 3), (2, 1), (13, 1), (16, 1)],
  term ((20197029797692999 : Rat) / 52219282713192) [(1, 3), (2, 1), (15, 1)],
  term ((995 : Rat) / 84) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((-26346365247500261 : Rat) / 52219282713192) [(1, 3), (3, 1)],
  term ((-5761020481920101 : Rat) / 39164462034894) [(1, 3), (3, 1), (6, 1)],
  term ((317737054294735 : Rat) / 8703213785532) [(1, 3), (3, 1), (10, 1)],
  term ((30297784755589265 : Rat) / 52219282713192) [(1, 3), (3, 1), (14, 1)],
  term ((6126789965758093 : Rat) / 2175803446383) [(1, 3), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(1, 3), (6, 1), (9, 1)],
  term ((-1802567920466143 : Rat) / 725267815461) [(1, 3), (6, 1), (11, 1)],
  term ((1438938201452681 : Rat) / 13054820678298) [(1, 3), (6, 1), (12, 1), (15, 1)],
  term ((31243862851544461 : Rat) / 39164462034894) [(1, 3), (6, 1), (13, 1)],
  term ((170 : Rat) / 63) [(1, 3), (6, 1), (13, 1), (16, 1)],
  term ((7660998914045 : Rat) / 53723541886) [(1, 3), (6, 1), (14, 1), (15, 1)],
  term ((46099368547243013 : Rat) / 26109641356596) [(1, 3), (6, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(1, 3), (6, 1), (15, 1), (16, 1)],
  term ((3977495663134691 : Rat) / 13054820678298) [(1, 3), (7, 1)],
  term ((-9026606790637963 : Rat) / 26109641356596) [(1, 3), (7, 1), (10, 1)],
  term ((-1438938201452681 : Rat) / 13054820678298) [(1, 3), (7, 1), (12, 1), (14, 1)],
  term ((-12975389539029301 : Rat) / 17406427571064) [(1, 3), (7, 1), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 3), (7, 1), (14, 2)],
  term ((5667274321397 : Rat) / 7708496544) [(1, 3), (9, 1)],
  term ((7570123039505 : Rat) / 17986491936) [(1, 3), (9, 1), (10, 1)],
  term ((10861008665 : Rat) / 214124904) [(1, 3), (9, 1), (10, 1), (12, 1)],
  term ((-10861008665 : Rat) / 107062452) [(1, 3), (9, 1), (10, 1), (14, 1)],
  term ((1157783523689 : Rat) / 8993245968) [(1, 3), (9, 1), (12, 1)],
  term ((-831953263739 : Rat) / 5995497312) [(1, 3), (9, 1), (12, 1), (14, 1)],
  term ((-115126691849 : Rat) / 80296839) [(1, 3), (9, 1), (14, 1)],
  term ((601699880041 : Rat) / 2997748656) [(1, 3), (9, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(1, 3), (10, 1), (11, 1)],
  term ((-4706213285 : Rat) / 107062452) [(1, 3), (10, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 2) [(1, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-96490250 : Rat) / 3823659) [(1, 3), (10, 1), (12, 1), (15, 1)],
  term (-2 : Rat) [(1, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-305066708021459 : Rat) / 710466431472) [(1, 3), (10, 1), (13, 1)],
  term ((4706213285 : Rat) / 53531226) [(1, 3), (10, 1), (13, 1), (14, 1)],
  term (-5 : Rat) [(1, 3), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((655 : Rat) / 56) [(1, 3), (10, 1), (13, 1), (16, 1)],
  term ((192980500 : Rat) / 3823659) [(1, 3), (10, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(1, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((19000961721258263 : Rat) / 26109641356596) [(1, 3), (10, 1), (15, 1)],
  term ((-127 : Rat) / 14) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((-584642562593892197 : Rat) / 208877130852768) [(1, 3), (11, 1)],
  term ((-179712 : Rat) / 553) [(1, 3), (11, 1), (12, 1), (14, 1)],
  term ((114417635149931321 : Rat) / 52219282713192) [(1, 3), (11, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(1, 3), (11, 1), (14, 2)],
  term ((-450969480683 : Rat) / 4385595256) [(1, 3), (12, 1), (13, 1)],
  term ((360495937631 : Rat) / 2997748656) [(1, 3), (12, 1), (13, 1), (14, 1)],
  term ((-1135 : Rat) / 56) [(1, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((135 : Rat) / 28) [(1, 3), (12, 1), (13, 1), (16, 1)],
  term ((-4854827766745 : Rat) / 59205535956) [(1, 3), (12, 1), (14, 1), (15, 1)],
  term ((239 : Rat) / 14) [(1, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((14876033252587 : Rat) / 88808303934) [(1, 3), (12, 1), (15, 1)],
  term ((-27 : Rat) / 7) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((-40863372226322095 : Rat) / 69625710284256) [(1, 3), (13, 1)],
  term ((5855602511595469 : Rat) / 2901071261844) [(1, 3), (13, 1), (14, 1)],
  term ((60 : Rat) / 7) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((-7415538672713 : Rat) / 39470357304) [(1, 3), (13, 1), (14, 2)],
  term ((485 : Rat) / 28) [(1, 3), (13, 1), (14, 2), (16, 1)],
  term ((-565 : Rat) / 24) [(1, 3), (13, 1), (16, 1)],
  term ((-404017876337909641 : Rat) / 104438565426384) [(1, 3), (14, 1), (15, 1)],
  term ((-72 : Rat) / 7) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((261808116069670 : Rat) / 725267815461) [(1, 3), (14, 2), (15, 1)],
  term ((-101 : Rat) / 7) [(1, 3), (14, 2), (15, 1), (16, 1)],
  term ((243917127443347633 : Rat) / 104438565426384) [(1, 3), (15, 1)],
  term ((907 : Rat) / 42) [(1, 3), (15, 1), (16, 1)],
  term ((1460822197993979 : Rat) / 8703213785532) [(1, 4)],
  term ((45864690786755 : Rat) / 17406427571064) [(1, 4), (2, 1)],
  term ((45864690786755 : Rat) / 6527410339149) [(1, 4), (6, 1)],
  term ((4992 : Rat) / 553) [(1, 4), (12, 1)],
  term ((-1419482045382901 : Rat) / 5802142523688) [(1, 4), (14, 1)],
  term ((-70690683689524370 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-70690683689524370 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((35345341844762185 : Rat) / 19582231017447) [(2, 1), (3, 1), (7, 1), (15, 2)],
  term ((-4598551068761 : Rat) / 40469606856) [(2, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-4598551068761 : Rat) / 40469606856) [(2, 1), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (14, 2)],
  term ((4598551068761 : Rat) / 80939213712) [(2, 1), (3, 1), (9, 1), (15, 2)],
  term ((36306455678017967 : Rat) / 19582231017447) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((36306455678017967 : Rat) / 19582231017447) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-36306455678017967 : Rat) / 39164462034894) [(2, 1), (3, 1), (11, 1), (15, 2)],
  term ((95140102894763 : Rat) / 1598549470812) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9095 : Rat) / 126) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((9095 : Rat) / 252) [(2, 1), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-95140102894763 : Rat) / 3197098941624) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((9095 : Rat) / 252) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((95140102894763 : Rat) / 1598549470812) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((-9095 : Rat) / 126) [(2, 1), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-302561760447571 : Rat) / 532849823604) [(2, 1), (12, 1), (14, 1)],
  term ((-302561760447571 : Rat) / 532849823604) [(2, 1), (13, 1), (15, 1)],
  term ((302561760447571 : Rat) / 1065699647208) [(2, 1), (14, 2)],
  term ((302561760447571 : Rat) / 1065699647208) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 100 through 199. -/
theorem rs_R009_ueqv_R009YNNNN_block_27_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_27_0100_0199
      rs_R009_ueqv_R009YNNNN_block_27_0100_0199 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
