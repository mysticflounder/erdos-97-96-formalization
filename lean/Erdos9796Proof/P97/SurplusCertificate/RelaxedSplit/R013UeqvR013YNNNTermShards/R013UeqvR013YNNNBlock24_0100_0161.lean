/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 24:100-161

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_24_0100_0161 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0100 : Poly :=
[
  term ((196559180400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 100 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0100 : Poly :=
[
  term ((-393118360800 : Rat) / 150171761) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((196559180400 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((-393118360800 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 2)],
  term ((196559180400 : Rat) / 150171761) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((-196559180400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((-196559180400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((393118360800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((393118360800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0100_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0100
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0101 : Poly :=
[
  term ((9468289923622379355 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 101 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0101 : Poly :=
[
  term ((-18936579847244758710 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((9468289923622379355 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-18936579847244758710 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 3), (15, 1)],
  term ((9468289923622379355 : Rat) / 1288183727709509) [(1, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-9468289923622379355 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-9468289923622379355 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 3)],
  term ((18936579847244758710 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 3), (15, 2)],
  term ((18936579847244758710 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0101_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0101
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0102 : Poly :=
[
  term ((-626517524 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 102 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0102 : Poly :=
[
  term ((1253035048 : Rat) / 8578069) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((-626517524 : Rat) / 8578069) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((1253035048 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-626517524 : Rat) / 8578069) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-1253035048 : Rat) / 8578069) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((626517524 : Rat) / 8578069) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((626517524 : Rat) / 8578069) [(5, 1), (10, 1), (15, 3)],
  term ((-1253035048 : Rat) / 8578069) [(5, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0102_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0102
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0103 : Poly :=
[
  term ((-279860982900 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 103 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0103 : Poly :=
[
  term ((559721965800 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((-279860982900 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1)],
  term ((559721965800 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2)],
  term ((-279860982900 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1)],
  term ((-559721965800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((279860982900 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)],
  term ((279860982900 : Rat) / 150171761) [(5, 1), (11, 1), (15, 2)],
  term ((-559721965800 : Rat) / 150171761) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0103_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0103
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0104 : Poly :=
[
  term ((21076676000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 104 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0104 : Poly :=
[
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((21076676000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-42153352000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (12, 1)],
  term ((21076676000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((42153352000 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-21076676000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-21076676000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((42153352000 : Rat) / 150171761) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0104_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0104
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0105 : Poly :=
[
  term ((1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 105 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0105 : Poly :=
[
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (12, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 3)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(5, 1), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0105_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0105
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0106 : Poly :=
[
  term ((-53923808982409147545 : Rat) / 5152734910838036) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 106 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0106 : Poly :=
[
  term ((53923808982409147545 : Rat) / 2576367455419018) [(0, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-53923808982409147545 : Rat) / 5152734910838036) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((53923808982409147545 : Rat) / 2576367455419018) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((-53923808982409147545 : Rat) / 5152734910838036) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((-53923808982409147545 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((53923808982409147545 : Rat) / 5152734910838036) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((53923808982409147545 : Rat) / 5152734910838036) [(5, 1), (11, 2), (15, 3)],
  term ((-53923808982409147545 : Rat) / 2576367455419018) [(5, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0106_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0106
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0107 : Poly :=
[
  term ((1848197080 : Rat) / 25734207) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 107 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0107 : Poly :=
[
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((3696394160 : Rat) / 25734207) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1848197080 : Rat) / 25734207) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0107_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0107
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0108 : Poly :=
[
  term ((-16491200521 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 108 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0108 : Poly :=
[
  term ((32982401042 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-16491200521 : Rat) / 8578069) [(0, 2), (5, 1), (15, 1)],
  term ((32982401042 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((-16491200521 : Rat) / 8578069) [(1, 2), (5, 1), (15, 1)],
  term ((-32982401042 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-32982401042 : Rat) / 8578069) [(5, 1), (11, 1), (15, 2)],
  term ((16491200521 : Rat) / 8578069) [(5, 1), (14, 2), (15, 1)],
  term ((16491200521 : Rat) / 8578069) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0108_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0108
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0109 : Poly :=
[
  term (160 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 109 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0109 : Poly :=
[
  term (-320 : Rat) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term (160 : Rat) [(0, 2), (7, 1), (9, 1)],
  term (-320 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term (160 : Rat) [(1, 2), (7, 1), (9, 1)],
  term (320 : Rat) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term (320 : Rat) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term (-160 : Rat) [(7, 1), (9, 1), (14, 2)],
  term (-160 : Rat) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0109_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0109
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0110 : Poly :=
[
  term (-192 : Rat) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 110 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0110 : Poly :=
[
  term (384 : Rat) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term (-192 : Rat) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term (-192 : Rat) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term (-384 : Rat) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term (192 : Rat) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term (192 : Rat) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term (-384 : Rat) [(7, 1), (9, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0110_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0110
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0111 : Poly :=
[
  term (-192 : Rat) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 111 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0111 : Poly :=
[
  term (384 : Rat) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term (-192 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term (-192 : Rat) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term (-384 : Rat) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term (-384 : Rat) [(7, 1), (10, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0111_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0111
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0112 : Poly :=
[
  term ((3853613921 : Rat) / 8578069) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 112 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0112 : Poly :=
[
  term ((-7707227842 : Rat) / 8578069) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((3853613921 : Rat) / 8578069) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-7707227842 : Rat) / 8578069) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((3853613921 : Rat) / 8578069) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((7707227842 : Rat) / 8578069) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3853613921 : Rat) / 8578069) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-3853613921 : Rat) / 8578069) [(7, 1), (10, 1), (15, 3)],
  term ((7707227842 : Rat) / 8578069) [(7, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0112_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0112
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0113 : Poly :=
[
  term ((17663894188 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 113 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0113 : Poly :=
[
  term ((-35327788376 : Rat) / 150171761) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((17663894188 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1)],
  term ((-35327788376 : Rat) / 150171761) [(1, 1), (7, 1), (11, 2)],
  term ((17663894188 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1)],
  term ((35327788376 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-17663894188 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2)],
  term ((-17663894188 : Rat) / 150171761) [(7, 1), (11, 1), (15, 2)],
  term ((35327788376 : Rat) / 150171761) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0113_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0113
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0114 : Poly :=
[
  term ((657843200 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 114 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0114 : Poly :=
[
  term ((-1315686400 : Rat) / 150171761) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((657843200 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-1315686400 : Rat) / 150171761) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((657843200 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((1315686400 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-657843200 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-657843200 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((1315686400 : Rat) / 150171761) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0114_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0114
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0115 : Poly :=
[
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 115 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0115 : Poly :=
[
  term ((-63376842833879680 : Rat) / 1288183727709509) [(0, 1), (7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(0, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 3), (12, 1), (15, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(1, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((63376842833879680 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((63376842833879680 : Rat) / 1288183727709509) [(7, 1), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0115_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0115
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0116 : Poly :=
[
  term ((-4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 116 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0116 : Poly :=
[
  term ((4929846010624472729 : Rat) / 2576367455419018) [(0, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4929846010624472729 : Rat) / 5152734910838036) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((4929846010624472729 : Rat) / 2576367455419018) [(1, 1), (7, 1), (11, 3), (15, 1)],
  term ((-4929846010624472729 : Rat) / 5152734910838036) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((-4929846010624472729 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 3)],
  term ((-4929846010624472729 : Rat) / 2576367455419018) [(7, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0116_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0116
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0117 : Poly :=
[
  term ((8128303744 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 117 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0117 : Poly :=
[
  term ((-16256607488 : Rat) / 25734207) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 25734207) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((16256607488 : Rat) / 25734207) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0117_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0117
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0118 : Poly :=
[
  term ((-8798135383 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 118 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0118 : Poly :=
[
  term ((17596270766 : Rat) / 25734207) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-8798135383 : Rat) / 25734207) [(0, 2), (7, 1), (15, 1)],
  term ((17596270766 : Rat) / 25734207) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-8798135383 : Rat) / 25734207) [(1, 2), (7, 1), (15, 1)],
  term ((-17596270766 : Rat) / 25734207) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-17596270766 : Rat) / 25734207) [(7, 1), (11, 1), (15, 2)],
  term ((8798135383 : Rat) / 25734207) [(7, 1), (14, 2), (15, 1)],
  term ((8798135383 : Rat) / 25734207) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0118_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0118
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0119 : Poly :=
[
  term (-2 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0119 : Poly :=
[
  term (4 : Rat) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0119_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0119
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0120 : Poly :=
[
  term (32 : Rat) [(7, 2)]
]

/-- Partial product 120 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0120 : Poly :=
[
  term (-64 : Rat) [(0, 1), (7, 2), (10, 1)],
  term (32 : Rat) [(0, 2), (7, 2)],
  term (-64 : Rat) [(1, 1), (7, 2), (11, 1)],
  term (32 : Rat) [(1, 2), (7, 2)],
  term (64 : Rat) [(7, 2), (10, 1), (14, 1)],
  term (64 : Rat) [(7, 2), (11, 1), (15, 1)],
  term (-32 : Rat) [(7, 2), (14, 2)],
  term (-32 : Rat) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0120_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0120
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0121 : Poly :=
[
  term ((81400409880 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 121 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0121 : Poly :=
[
  term ((-162800819760 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((81400409880 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-162800819760 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((81400409880 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-81400409880 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-81400409880 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((162800819760 : Rat) / 150171761) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((162800819760 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0121_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0121
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0122 : Poly :=
[
  term ((-1973529600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 122 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0122 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((1973529600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((1973529600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3947059200 : Rat) / 150171761) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-3947059200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0122_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0122
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0123 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 123 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0123 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 3)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 3), (12, 1), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0123_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0123
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0124 : Poly :=
[
  term ((7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 124 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0124 : Poly :=
[
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(0, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(1, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 1), (11, 2), (15, 3)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 3), (15, 2)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0124_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0124
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0125 : Poly :=
[
  term ((-8128303744 : Rat) / 8578069) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 125 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0125 : Poly :=
[
  term ((16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-16256607488 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0125_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0125
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0126 : Poly :=
[
  term ((11121090721 : Rat) / 8578069) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 126 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0126 : Poly :=
[
  term ((-22242181442 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((11121090721 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-22242181442 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((11121090721 : Rat) / 8578069) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((22242181442 : Rat) / 8578069) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-11121090721 : Rat) / 8578069) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-11121090721 : Rat) / 8578069) [(9, 1), (10, 1), (15, 3)],
  term ((22242181442 : Rat) / 8578069) [(9, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0126_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0126
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0127 : Poly :=
[
  term ((13617336900 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 127 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0127 : Poly :=
[
  term ((-27234673800 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((13617336900 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1)],
  term ((-27234673800 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2)],
  term ((13617336900 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1)],
  term ((27234673800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-13617336900 : Rat) / 150171761) [(9, 1), (11, 1), (14, 2)],
  term ((-13617336900 : Rat) / 150171761) [(9, 1), (11, 1), (15, 2)],
  term ((27234673800 : Rat) / 150171761) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0127_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0127
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0128 : Poly :=
[
  term ((6732658800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 128 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0128 : Poly :=
[
  term ((-13465317600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((6732658800 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-13465317600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((6732658800 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((13465317600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-6732658800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-6732658800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((13465317600 : Rat) / 150171761) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0128_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0128
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0129 : Poly :=
[
  term ((324313345962789435 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 129 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0129 : Poly :=
[
  term ((-648626691925578870 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((324313345962789435 : Rat) / 1288183727709509) [(0, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-648626691925578870 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((324313345962789435 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((648626691925578870 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-324313345962789435 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-324313345962789435 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 3)],
  term ((648626691925578870 : Rat) / 1288183727709509) [(9, 1), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0129_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0129
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0130 : Poly :=
[
  term ((2623797952239349245 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 130 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0130 : Poly :=
[
  term ((-2623797952239349245 : Rat) / 2576367455419018) [(0, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2623797952239349245 : Rat) / 5152734910838036) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2623797952239349245 : Rat) / 2576367455419018) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term ((2623797952239349245 : Rat) / 5152734910838036) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((2623797952239349245 : Rat) / 2576367455419018) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2623797952239349245 : Rat) / 5152734910838036) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-2623797952239349245 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 3)],
  term ((2623797952239349245 : Rat) / 2576367455419018) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0130_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0130
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0131 : Poly :=
[
  term ((11613790252 : Rat) / 8578069) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 131 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0131 : Poly :=
[
  term ((-23227580504 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((11613790252 : Rat) / 8578069) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-23227580504 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((11613790252 : Rat) / 8578069) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((23227580504 : Rat) / 8578069) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((23227580504 : Rat) / 8578069) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-11613790252 : Rat) / 8578069) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11613790252 : Rat) / 8578069) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0131_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0131
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0132 : Poly :=
[
  term ((-13352874659 : Rat) / 8578069) [(9, 1), (15, 1)]
]

/-- Partial product 132 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0132 : Poly :=
[
  term ((26705749318 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term ((-13352874659 : Rat) / 8578069) [(0, 2), (9, 1), (15, 1)],
  term ((26705749318 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-13352874659 : Rat) / 8578069) [(1, 2), (9, 1), (15, 1)],
  term ((-26705749318 : Rat) / 8578069) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-26705749318 : Rat) / 8578069) [(9, 1), (11, 1), (15, 2)],
  term ((13352874659 : Rat) / 8578069) [(9, 1), (14, 2), (15, 1)],
  term ((13352874659 : Rat) / 8578069) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0132_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0132
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0133 : Poly :=
[
  term (-2 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0133 : Poly :=
[
  term (4 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0133_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0133
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0134 : Poly :=
[
  term (80 : Rat) [(9, 2)]
]

/-- Partial product 134 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0134 : Poly :=
[
  term (-160 : Rat) [(0, 1), (9, 2), (10, 1)],
  term (80 : Rat) [(0, 2), (9, 2)],
  term (-160 : Rat) [(1, 1), (9, 2), (11, 1)],
  term (80 : Rat) [(1, 2), (9, 2)],
  term (160 : Rat) [(9, 2), (10, 1), (14, 1)],
  term (160 : Rat) [(9, 2), (11, 1), (15, 1)],
  term (-80 : Rat) [(9, 2), (14, 2)],
  term (-80 : Rat) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0134_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0134
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0135 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 135 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0135 : Poly :=
[
  term ((32513214976 : Rat) / 8578069) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((32513214976 : Rat) / 8578069) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-32513214976 : Rat) / 8578069) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-32513214976 : Rat) / 8578069) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0135_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0135
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0136 : Poly :=
[
  term ((4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 136 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0136 : Poly :=
[
  term ((-8551961600 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((4275980800 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-8551961600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((4275980800 : Rat) / 150171761) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((8551961600 : Rat) / 150171761) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((8551961600 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0136_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0136
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0137 : Poly :=
[
  term ((-4670383900107906457 : Rat) / 2576367455419018) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 137 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0137 : Poly :=
[
  term ((4670383900107906457 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-4670383900107906457 : Rat) / 2576367455419018) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((4670383900107906457 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-4670383900107906457 : Rat) / 2576367455419018) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((4670383900107906457 : Rat) / 2576367455419018) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((4670383900107906457 : Rat) / 2576367455419018) [(10, 1), (11, 1), (15, 3)],
  term ((-4670383900107906457 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)],
  term ((-4670383900107906457 : Rat) / 1288183727709509) [(10, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0137_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0137
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0138 : Poly :=
[
  term ((-251357853120 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 138 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0138 : Poly :=
[
  term ((502715706240 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2)],
  term ((-251357853120 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((502715706240 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3)],
  term ((-251357853120 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)],
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 2), (14, 2)],
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 2), (15, 2)],
  term ((-502715706240 : Rat) / 150171761) [(10, 1), (11, 3), (15, 1)],
  term ((-502715706240 : Rat) / 150171761) [(10, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0138_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0138
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0139 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 139 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0139 : Poly :=
[
  term ((7894118400 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3), (12, 1)],
  term ((-3947059200 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-7894118400 : Rat) / 150171761) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-7894118400 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0139_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0139
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0140 : Poly :=
[
  term ((205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 140 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0140 : Poly :=
[
  term ((-411949478420217920 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-411949478420217920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (15, 3)],
  term ((411949478420217920 : Rat) / 1288183727709509) [(10, 1), (11, 3), (13, 1), (15, 2)],
  term ((411949478420217920 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0140_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0140
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0141 : Poly :=
[
  term ((-15435878482560857545 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 141 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0141 : Poly :=
[
  term ((15435878482560857545 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((-15435878482560857545 : Rat) / 2576367455419018) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((15435878482560857545 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((-15435878482560857545 : Rat) / 2576367455419018) [(1, 2), (10, 1), (11, 2), (15, 2)],
  term ((15435878482560857545 : Rat) / 2576367455419018) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((15435878482560857545 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 4)],
  term ((-15435878482560857545 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 3)],
  term ((-15435878482560857545 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0141_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0141
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0142 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 142 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0142 : Poly :=
[
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 3)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(10, 1), (11, 4), (12, 1), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0142_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0142
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0143 : Poly :=
[
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 143 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0143 : Poly :=
[
  term ((24215903048397632088 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((24215903048397632088 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 2), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 3)],
  term ((-24215903048397632088 : Rat) / 1288183727709509) [(10, 1), (11, 4), (15, 2)],
  term ((-24215903048397632088 : Rat) / 1288183727709509) [(10, 2), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0143_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0143
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0144 : Poly :=
[
  term ((52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 144 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0144 : Poly :=
[
  term ((-105667948672 : Rat) / 25734207) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-105667948672 : Rat) / 25734207) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((105667948672 : Rat) / 25734207) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (15, 3)],
  term ((105667948672 : Rat) / 25734207) [(10, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0144_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0144
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0145 : Poly :=
[
  term ((-29293899766 : Rat) / 25734207) [(10, 1), (15, 2)]
]

/-- Partial product 145 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0145 : Poly :=
[
  term ((58587799532 : Rat) / 25734207) [(0, 1), (10, 2), (15, 2)],
  term ((-29293899766 : Rat) / 25734207) [(0, 2), (10, 1), (15, 2)],
  term ((58587799532 : Rat) / 25734207) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((-29293899766 : Rat) / 25734207) [(1, 2), (10, 1), (15, 2)],
  term ((-58587799532 : Rat) / 25734207) [(10, 1), (11, 1), (15, 3)],
  term ((29293899766 : Rat) / 25734207) [(10, 1), (14, 2), (15, 2)],
  term ((29293899766 : Rat) / 25734207) [(10, 1), (15, 4)],
  term ((-58587799532 : Rat) / 25734207) [(10, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0145_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0145
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0146 : Poly :=
[
  term ((1094530569619948768 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 146 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0146 : Poly :=
[
  term ((-2189061139239897536 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1094530569619948768 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2189061139239897536 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((1094530569619948768 : Rat) / 1288183727709509) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((2189061139239897536 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1094530569619948768 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1094530569619948768 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 3)],
  term ((2189061139239897536 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0146_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0146
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0147 : Poly :=
[
  term ((287852586400 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 147 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0147 : Poly :=
[
  term ((-575705172800 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((287852586400 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((-575705172800 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1)],
  term ((287852586400 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((575705172800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-287852586400 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)],
  term ((-287852586400 : Rat) / 150171761) [(11, 1), (13, 1), (15, 2)],
  term ((575705172800 : Rat) / 150171761) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0147_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0147
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0148 : Poly :=
[
  term ((-146701653600 : Rat) / 150171761) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 148 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0148 : Poly :=
[
  term ((293403307200 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-293403307200 : Rat) / 150171761) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(11, 1), (14, 1), (15, 3)],
  term ((146701653600 : Rat) / 150171761) [(11, 1), (14, 3), (15, 1)],
  term ((-293403307200 : Rat) / 150171761) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0148_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0148
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0149 : Poly :=
[
  term ((129556747144926383 : Rat) / 3864551183128527) [(11, 1), (15, 1)]
]

/-- Partial product 149 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0149 : Poly :=
[
  term ((-259113494289852766 : Rat) / 3864551183128527) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((129556747144926383 : Rat) / 3864551183128527) [(0, 2), (11, 1), (15, 1)],
  term ((-259113494289852766 : Rat) / 3864551183128527) [(1, 1), (11, 2), (15, 1)],
  term ((129556747144926383 : Rat) / 3864551183128527) [(1, 2), (11, 1), (15, 1)],
  term ((259113494289852766 : Rat) / 3864551183128527) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-129556747144926383 : Rat) / 3864551183128527) [(11, 1), (14, 2), (15, 1)],
  term ((-129556747144926383 : Rat) / 3864551183128527) [(11, 1), (15, 3)],
  term ((259113494289852766 : Rat) / 3864551183128527) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0149_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0149
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0150 : Poly :=
[
  term ((-102641896120 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 150 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0150 : Poly :=
[
  term ((205283792240 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2)],
  term ((-102641896120 : Rat) / 150171761) [(0, 2), (11, 2)],
  term ((205283792240 : Rat) / 150171761) [(1, 1), (11, 3)],
  term ((-102641896120 : Rat) / 150171761) [(1, 2), (11, 2)],
  term ((-205283792240 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1)],
  term ((102641896120 : Rat) / 150171761) [(11, 2), (14, 2)],
  term ((102641896120 : Rat) / 150171761) [(11, 2), (15, 2)],
  term ((-205283792240 : Rat) / 150171761) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0150_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0150
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0151 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 151 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0151 : Poly :=
[
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (11, 3), (12, 1)],
  term ((3947059200 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-3947059200 : Rat) / 150171761) [(11, 2), (12, 1), (14, 2)],
  term ((-3947059200 : Rat) / 150171761) [(11, 2), (12, 1), (15, 2)],
  term ((7894118400 : Rat) / 150171761) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0151_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0151
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0152 : Poly :=
[
  term ((-7562694699248783730 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 152 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0152 : Poly :=
[
  term ((15125389398497567460 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-7562694699248783730 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((15125389398497567460 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (15, 2)],
  term ((-7562694699248783730 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (15, 2)],
  term ((-15125389398497567460 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((7562694699248783730 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((7562694699248783730 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 4)],
  term ((-15125389398497567460 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0152_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0152
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0153 : Poly :=
[
  term ((13865909176836190930 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 153 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0153 : Poly :=
[
  term ((-27731818353672381860 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((13865909176836190930 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((-27731818353672381860 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((13865909176836190930 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((27731818353672381860 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-13865909176836190930 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-13865909176836190930 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 3)],
  term ((27731818353672381860 : Rat) / 1288183727709509) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0153_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0153
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0154 : Poly :=
[
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 154 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0154 : Poly :=
[
  term ((14133288363666994140 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(0, 2), (11, 2), (14, 1), (15, 2)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (11, 3), (14, 1), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 2), (11, 2), (14, 1), (15, 2)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 4)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(11, 2), (14, 3), (15, 2)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(11, 3), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0154_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0154
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0155 : Poly :=
[
  term ((21652713163633291075 : Rat) / 2576367455419018) [(11, 2), (15, 2)]
]

/-- Partial product 155 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0155 : Poly :=
[
  term ((-21652713163633291075 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((21652713163633291075 : Rat) / 2576367455419018) [(0, 2), (11, 2), (15, 2)],
  term ((-21652713163633291075 : Rat) / 1288183727709509) [(1, 1), (11, 3), (15, 2)],
  term ((21652713163633291075 : Rat) / 2576367455419018) [(1, 2), (11, 2), (15, 2)],
  term ((21652713163633291075 : Rat) / 1288183727709509) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-21652713163633291075 : Rat) / 2576367455419018) [(11, 2), (14, 2), (15, 2)],
  term ((-21652713163633291075 : Rat) / 2576367455419018) [(11, 2), (15, 4)],
  term ((21652713163633291075 : Rat) / 1288183727709509) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0155_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0155
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0156 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 156 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0156 : Poly :=
[
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (11, 4), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 3)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(11, 4), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0156_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0156
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0157 : Poly :=
[
  term ((-9888555994146697163 : Rat) / 2576367455419018) [(11, 3), (15, 1)]
]

/-- Partial product 157 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0157 : Poly :=
[
  term ((9888555994146697163 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (15, 1)],
  term ((-9888555994146697163 : Rat) / 2576367455419018) [(0, 2), (11, 3), (15, 1)],
  term ((9888555994146697163 : Rat) / 1288183727709509) [(1, 1), (11, 4), (15, 1)],
  term ((-9888555994146697163 : Rat) / 2576367455419018) [(1, 2), (11, 3), (15, 1)],
  term ((-9888555994146697163 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((9888555994146697163 : Rat) / 2576367455419018) [(11, 3), (14, 2), (15, 1)],
  term ((9888555994146697163 : Rat) / 2576367455419018) [(11, 3), (15, 3)],
  term ((-9888555994146697163 : Rat) / 1288183727709509) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0157_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0157
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0158 : Poly :=
[
  term ((-14189683976 : Rat) / 8578069) [(12, 1), (15, 2)]
]

/-- Partial product 158 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0158 : Poly :=
[
  term ((28379367952 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-14189683976 : Rat) / 8578069) [(0, 2), (12, 1), (15, 2)],
  term ((28379367952 : Rat) / 8578069) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-14189683976 : Rat) / 8578069) [(1, 2), (12, 1), (15, 2)],
  term ((-28379367952 : Rat) / 8578069) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-28379367952 : Rat) / 8578069) [(11, 1), (12, 1), (15, 3)],
  term ((14189683976 : Rat) / 8578069) [(12, 1), (14, 2), (15, 2)],
  term ((14189683976 : Rat) / 8578069) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0158_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0158
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0159 : Poly :=
[
  term ((135057266168 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 159 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0159 : Poly :=
[
  term ((-270114532336 : Rat) / 25734207) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((135057266168 : Rat) / 25734207) [(0, 2), (13, 1), (15, 1)],
  term ((-270114532336 : Rat) / 25734207) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((135057266168 : Rat) / 25734207) [(1, 2), (13, 1), (15, 1)],
  term ((270114532336 : Rat) / 25734207) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((270114532336 : Rat) / 25734207) [(11, 1), (13, 1), (15, 2)],
  term ((-135057266168 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)],
  term ((-135057266168 : Rat) / 25734207) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0159_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0159
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0160 : Poly :=
[
  term ((-822900664 : Rat) / 8578069) [(14, 1), (15, 2)]
]

/-- Partial product 160 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0160 : Poly :=
[
  term ((1645801328 : Rat) / 8578069) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-822900664 : Rat) / 8578069) [(0, 2), (14, 1), (15, 2)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-822900664 : Rat) / 8578069) [(1, 2), (14, 1), (15, 2)],
  term ((-1645801328 : Rat) / 8578069) [(10, 1), (14, 2), (15, 2)],
  term ((-1645801328 : Rat) / 8578069) [(11, 1), (14, 1), (15, 3)],
  term ((822900664 : Rat) / 8578069) [(14, 1), (15, 4)],
  term ((822900664 : Rat) / 8578069) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0160_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0160
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 24. -/
def rs_R013_ueqv_R013YNNN_coefficient_24_0161 : Poly :=
[
  term ((44967100690 : Rat) / 25734207) [(15, 2)]
]

/-- Partial product 161 for generator 24. -/
def rs_R013_ueqv_R013YNNN_partial_24_0161 : Poly :=
[
  term ((-89934201380 : Rat) / 25734207) [(0, 1), (10, 1), (15, 2)],
  term ((44967100690 : Rat) / 25734207) [(0, 2), (15, 2)],
  term ((-89934201380 : Rat) / 25734207) [(1, 1), (11, 1), (15, 2)],
  term ((44967100690 : Rat) / 25734207) [(1, 2), (15, 2)],
  term ((89934201380 : Rat) / 25734207) [(10, 1), (14, 1), (15, 2)],
  term ((89934201380 : Rat) / 25734207) [(11, 1), (15, 3)],
  term ((-44967100690 : Rat) / 25734207) [(14, 2), (15, 2)],
  term ((-44967100690 : Rat) / 25734207) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 24. -/
theorem rs_R013_ueqv_R013YNNN_partial_24_0161_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_24_0161
        rs_R013_ueqv_R013YNNN_generator_24_0100_0161 =
      rs_R013_ueqv_R013YNNN_partial_24_0161 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_24_0100_0161 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_24_0100,
  rs_R013_ueqv_R013YNNN_partial_24_0101,
  rs_R013_ueqv_R013YNNN_partial_24_0102,
  rs_R013_ueqv_R013YNNN_partial_24_0103,
  rs_R013_ueqv_R013YNNN_partial_24_0104,
  rs_R013_ueqv_R013YNNN_partial_24_0105,
  rs_R013_ueqv_R013YNNN_partial_24_0106,
  rs_R013_ueqv_R013YNNN_partial_24_0107,
  rs_R013_ueqv_R013YNNN_partial_24_0108,
  rs_R013_ueqv_R013YNNN_partial_24_0109,
  rs_R013_ueqv_R013YNNN_partial_24_0110,
  rs_R013_ueqv_R013YNNN_partial_24_0111,
  rs_R013_ueqv_R013YNNN_partial_24_0112,
  rs_R013_ueqv_R013YNNN_partial_24_0113,
  rs_R013_ueqv_R013YNNN_partial_24_0114,
  rs_R013_ueqv_R013YNNN_partial_24_0115,
  rs_R013_ueqv_R013YNNN_partial_24_0116,
  rs_R013_ueqv_R013YNNN_partial_24_0117,
  rs_R013_ueqv_R013YNNN_partial_24_0118,
  rs_R013_ueqv_R013YNNN_partial_24_0119,
  rs_R013_ueqv_R013YNNN_partial_24_0120,
  rs_R013_ueqv_R013YNNN_partial_24_0121,
  rs_R013_ueqv_R013YNNN_partial_24_0122,
  rs_R013_ueqv_R013YNNN_partial_24_0123,
  rs_R013_ueqv_R013YNNN_partial_24_0124,
  rs_R013_ueqv_R013YNNN_partial_24_0125,
  rs_R013_ueqv_R013YNNN_partial_24_0126,
  rs_R013_ueqv_R013YNNN_partial_24_0127,
  rs_R013_ueqv_R013YNNN_partial_24_0128,
  rs_R013_ueqv_R013YNNN_partial_24_0129,
  rs_R013_ueqv_R013YNNN_partial_24_0130,
  rs_R013_ueqv_R013YNNN_partial_24_0131,
  rs_R013_ueqv_R013YNNN_partial_24_0132,
  rs_R013_ueqv_R013YNNN_partial_24_0133,
  rs_R013_ueqv_R013YNNN_partial_24_0134,
  rs_R013_ueqv_R013YNNN_partial_24_0135,
  rs_R013_ueqv_R013YNNN_partial_24_0136,
  rs_R013_ueqv_R013YNNN_partial_24_0137,
  rs_R013_ueqv_R013YNNN_partial_24_0138,
  rs_R013_ueqv_R013YNNN_partial_24_0139,
  rs_R013_ueqv_R013YNNN_partial_24_0140,
  rs_R013_ueqv_R013YNNN_partial_24_0141,
  rs_R013_ueqv_R013YNNN_partial_24_0142,
  rs_R013_ueqv_R013YNNN_partial_24_0143,
  rs_R013_ueqv_R013YNNN_partial_24_0144,
  rs_R013_ueqv_R013YNNN_partial_24_0145,
  rs_R013_ueqv_R013YNNN_partial_24_0146,
  rs_R013_ueqv_R013YNNN_partial_24_0147,
  rs_R013_ueqv_R013YNNN_partial_24_0148,
  rs_R013_ueqv_R013YNNN_partial_24_0149,
  rs_R013_ueqv_R013YNNN_partial_24_0150,
  rs_R013_ueqv_R013YNNN_partial_24_0151,
  rs_R013_ueqv_R013YNNN_partial_24_0152,
  rs_R013_ueqv_R013YNNN_partial_24_0153,
  rs_R013_ueqv_R013YNNN_partial_24_0154,
  rs_R013_ueqv_R013YNNN_partial_24_0155,
  rs_R013_ueqv_R013YNNN_partial_24_0156,
  rs_R013_ueqv_R013YNNN_partial_24_0157,
  rs_R013_ueqv_R013YNNN_partial_24_0158,
  rs_R013_ueqv_R013YNNN_partial_24_0159,
  rs_R013_ueqv_R013YNNN_partial_24_0160,
  rs_R013_ueqv_R013YNNN_partial_24_0161
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_24_0100_0161 : Poly :=
[
  term ((559721965800 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1)],
  term ((-42153352000 : Rat) / 150171761) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((53923808982409147545 : Rat) / 2576367455419018) [(0, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((32982401042 : Rat) / 8578069) [(0, 1), (5, 1), (10, 1), (15, 1)],
  term ((-393118360800 : Rat) / 150171761) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((-18936579847244758710 : Rat) / 1288183727709509) [(0, 1), (5, 1), (10, 2), (11, 2), (15, 1)],
  term ((1253035048 : Rat) / 8578069) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term (-320 : Rat) [(0, 1), (7, 1), (9, 1), (10, 1)],
  term (384 : Rat) [(0, 1), (7, 1), (9, 1), (10, 2)],
  term ((-35327788376 : Rat) / 150171761) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-1315686400 : Rat) / 150171761) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(0, 1), (7, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((4929846010624472729 : Rat) / 2576367455419018) [(0, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-16256607488 : Rat) / 25734207) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((17596270766 : Rat) / 25734207) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term (4 : Rat) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term (384 : Rat) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((-7707227842 : Rat) / 8578069) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term (-64 : Rat) [(0, 1), (7, 2), (10, 1)],
  term ((-27234673800 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1)],
  term ((-13465317600 : Rat) / 150171761) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-648626691925578870 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2623797952239349245 : Rat) / 2576367455419018) [(0, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-23227580504 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((26705749318 : Rat) / 8578069) [(0, 1), (9, 1), (10, 1), (15, 1)],
  term (4 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-162800819760 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((3947059200 : Rat) / 150171761) [(0, 1), (9, 1), (10, 2), (11, 1), (12, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(0, 1), (9, 1), (10, 2), (11, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-22242181442 : Rat) / 8578069) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term (-160 : Rat) [(0, 1), (9, 2), (10, 1)],
  term ((-2189061139239897536 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-575705172800 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((293403307200 : Rat) / 150171761) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-259113494289852766 : Rat) / 3864551183128527) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((205283792240 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2)],
  term ((-7894118400 : Rat) / 150171761) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((15125389398497567460 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-27731818353672381860 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((-21652713163633291075 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 2), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((9888555994146697163 : Rat) / 1288183727709509) [(0, 1), (10, 1), (11, 3), (15, 1)],
  term ((28379367952 : Rat) / 8578069) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-270114532336 : Rat) / 25734207) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((-89934201380 : Rat) / 25734207) [(0, 1), (10, 1), (15, 2)],
  term ((32513214976 : Rat) / 8578069) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8551961600 : Rat) / 150171761) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((4670383900107906457 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((502715706240 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2)],
  term ((7894118400 : Rat) / 150171761) [(0, 1), (10, 2), (11, 2), (12, 1)],
  term ((-411949478420217920 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (13, 1), (15, 1)],
  term ((15435878482560857545 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 2), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (12, 1), (15, 1)],
  term ((24215903048397632088 : Rat) / 1288183727709509) [(0, 1), (10, 2), (11, 3), (15, 1)],
  term ((-105667948672 : Rat) / 25734207) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((58587799532 : Rat) / 25734207) [(0, 1), (10, 2), (15, 2)],
  term ((196559180400 : Rat) / 150171761) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((9468289923622379355 : Rat) / 1288183727709509) [(0, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-626517524 : Rat) / 8578069) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-279860982900 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1)],
  term ((21076676000 : Rat) / 150171761) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(0, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-53923808982409147545 : Rat) / 5152734910838036) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-16491200521 : Rat) / 8578069) [(0, 2), (5, 1), (15, 1)],
  term (160 : Rat) [(0, 2), (7, 1), (9, 1)],
  term (-192 : Rat) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term (-192 : Rat) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((3853613921 : Rat) / 8578069) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((17663894188 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1)],
  term ((657843200 : Rat) / 150171761) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(0, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4929846010624472729 : Rat) / 5152734910838036) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-8798135383 : Rat) / 25734207) [(0, 2), (7, 1), (15, 1)],
  term (-2 : Rat) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(0, 2), (7, 2)],
  term ((81400409880 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-1973529600 : Rat) / 150171761) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(0, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(0, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((11121090721 : Rat) / 8578069) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((13617336900 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1)],
  term ((6732658800 : Rat) / 150171761) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((324313345962789435 : Rat) / 1288183727709509) [(0, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((2623797952239349245 : Rat) / 5152734910838036) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((11613790252 : Rat) / 8578069) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-13352874659 : Rat) / 8578069) [(0, 2), (9, 1), (15, 1)],
  term (-2 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (80 : Rat) [(0, 2), (9, 2)],
  term ((-16256607488 : Rat) / 8578069) [(0, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4275980800 : Rat) / 150171761) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4670383900107906457 : Rat) / 2576367455419018) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-251357853120 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(0, 2), (10, 1), (11, 2), (12, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-15435878482560857545 : Rat) / 2576367455419018) [(0, 2), (10, 1), (11, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(0, 2), (10, 1), (11, 3), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((-29293899766 : Rat) / 25734207) [(0, 2), (10, 1), (15, 2)],
  term ((1094530569619948768 : Rat) / 1288183727709509) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((287852586400 : Rat) / 150171761) [(0, 2), (11, 1), (13, 1)],
  term ((-146701653600 : Rat) / 150171761) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((129556747144926383 : Rat) / 3864551183128527) [(0, 2), (11, 1), (15, 1)],
  term ((-102641896120 : Rat) / 150171761) [(0, 2), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(0, 2), (11, 2), (12, 1)],
  term ((-7562694699248783730 : Rat) / 1288183727709509) [(0, 2), (11, 2), (12, 1), (15, 2)],
  term ((13865909176836190930 : Rat) / 1288183727709509) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(0, 2), (11, 2), (14, 1), (15, 2)],
  term ((21652713163633291075 : Rat) / 2576367455419018) [(0, 2), (11, 2), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(0, 2), (11, 3), (12, 1), (15, 1)],
  term ((-9888555994146697163 : Rat) / 2576367455419018) [(0, 2), (11, 3), (15, 1)],
  term ((-14189683976 : Rat) / 8578069) [(0, 2), (12, 1), (15, 2)],
  term ((135057266168 : Rat) / 25734207) [(0, 2), (13, 1), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(0, 2), (14, 1), (15, 2)],
  term ((44967100690 : Rat) / 25734207) [(0, 2), (15, 2)],
  term ((1253035048 : Rat) / 8578069) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-393118360800 : Rat) / 150171761) [(1, 1), (5, 1), (10, 1), (11, 2)],
  term ((-18936579847244758710 : Rat) / 1288183727709509) [(1, 1), (5, 1), (10, 1), (11, 3), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((32982401042 : Rat) / 8578069) [(1, 1), (5, 1), (11, 1), (15, 1)],
  term ((559721965800 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2)],
  term ((-42153352000 : Rat) / 150171761) [(1, 1), (5, 1), (11, 2), (12, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(1, 1), (5, 1), (11, 3), (12, 1), (15, 1)],
  term ((53923808982409147545 : Rat) / 2576367455419018) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term (-320 : Rat) [(1, 1), (7, 1), (9, 1), (11, 1)],
  term ((-7707227842 : Rat) / 8578069) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term (384 : Rat) [(1, 1), (7, 1), (10, 1), (11, 2)],
  term ((-16256607488 : Rat) / 25734207) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((17596270766 : Rat) / 25734207) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term (4 : Rat) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-35327788376 : Rat) / 150171761) [(1, 1), (7, 1), (11, 2)],
  term ((-1315686400 : Rat) / 150171761) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(1, 1), (7, 1), (11, 3), (12, 1), (15, 1)],
  term ((4929846010624472729 : Rat) / 2576367455419018) [(1, 1), (7, 1), (11, 3), (15, 1)],
  term (-64 : Rat) [(1, 1), (7, 2), (11, 1)],
  term ((16256607488 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22242181442 : Rat) / 8578069) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-162800819760 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(1, 1), (9, 1), (10, 1), (11, 2), (12, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 1288183727709509) [(1, 1), (9, 1), (10, 1), (11, 3), (15, 1)],
  term ((-23227580504 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((26705749318 : Rat) / 8578069) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term (4 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-27234673800 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2)],
  term ((-13465317600 : Rat) / 150171761) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-648626691925578870 : Rat) / 1288183727709509) [(1, 1), (9, 1), (11, 3), (12, 1), (15, 1)],
  term ((-2623797952239349245 : Rat) / 2576367455419018) [(1, 1), (9, 1), (11, 3), (15, 1)],
  term (-160 : Rat) [(1, 1), (9, 2), (11, 1)],
  term ((-105667948672 : Rat) / 25734207) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((58587799532 : Rat) / 25734207) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((32513214976 : Rat) / 8578069) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-8551961600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((4670383900107906457 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((502715706240 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3)],
  term ((7894118400 : Rat) / 150171761) [(1, 1), (10, 1), (11, 3), (12, 1)],
  term ((-411949478420217920 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (13, 1), (15, 1)],
  term ((15435878482560857545 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 3), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (12, 1), (15, 1)],
  term ((24215903048397632088 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 4), (15, 1)],
  term ((28379367952 : Rat) / 8578069) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-270114532336 : Rat) / 25734207) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-89934201380 : Rat) / 25734207) [(1, 1), (11, 1), (15, 2)],
  term ((-2189061139239897536 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-575705172800 : Rat) / 150171761) [(1, 1), (11, 2), (13, 1)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-259113494289852766 : Rat) / 3864551183128527) [(1, 1), (11, 2), (15, 1)],
  term ((205283792240 : Rat) / 150171761) [(1, 1), (11, 3)],
  term ((-7894118400 : Rat) / 150171761) [(1, 1), (11, 3), (12, 1)],
  term ((15125389398497567460 : Rat) / 1288183727709509) [(1, 1), (11, 3), (12, 1), (15, 2)],
  term ((-27731818353672381860 : Rat) / 1288183727709509) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (11, 3), (14, 1), (15, 2)],
  term ((-21652713163633291075 : Rat) / 1288183727709509) [(1, 1), (11, 3), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(1, 1), (11, 4), (12, 1), (15, 1)],
  term ((9888555994146697163 : Rat) / 1288183727709509) [(1, 1), (11, 4), (15, 1)],
  term ((196559180400 : Rat) / 150171761) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((9468289923622379355 : Rat) / 1288183727709509) [(1, 2), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-626517524 : Rat) / 8578069) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-279860982900 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1)],
  term ((21076676000 : Rat) / 150171761) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(1, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-53923808982409147545 : Rat) / 5152734910838036) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((-16491200521 : Rat) / 8578069) [(1, 2), (5, 1), (15, 1)],
  term (160 : Rat) [(1, 2), (7, 1), (9, 1)],
  term (-192 : Rat) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term (-192 : Rat) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((3853613921 : Rat) / 8578069) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((17663894188 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1)],
  term ((657843200 : Rat) / 150171761) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(1, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-4929846010624472729 : Rat) / 5152734910838036) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-8798135383 : Rat) / 25734207) [(1, 2), (7, 1), (15, 1)],
  term (-2 : Rat) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(1, 2), (7, 2)],
  term ((81400409880 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-1973529600 : Rat) / 150171761) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-95065264250819520 : Rat) / 1288183727709509) [(1, 2), (9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 2576367455419018) [(1, 2), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-8128303744 : Rat) / 8578069) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((11121090721 : Rat) / 8578069) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((13617336900 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1)],
  term ((6732658800 : Rat) / 150171761) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((324313345962789435 : Rat) / 1288183727709509) [(1, 2), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((2623797952239349245 : Rat) / 5152734910838036) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((11613790252 : Rat) / 8578069) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-13352874659 : Rat) / 8578069) [(1, 2), (9, 1), (15, 1)],
  term (-2 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (80 : Rat) [(1, 2), (9, 2)],
  term ((-16256607488 : Rat) / 8578069) [(1, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4275980800 : Rat) / 150171761) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4670383900107906457 : Rat) / 2576367455419018) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-251357853120 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(1, 2), (10, 1), (11, 2), (12, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-15435878482560857545 : Rat) / 2576367455419018) [(1, 2), (10, 1), (11, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(1, 2), (10, 1), (11, 3), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-29293899766 : Rat) / 25734207) [(1, 2), (10, 1), (15, 2)],
  term ((1094530569619948768 : Rat) / 1288183727709509) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((287852586400 : Rat) / 150171761) [(1, 2), (11, 1), (13, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((129556747144926383 : Rat) / 3864551183128527) [(1, 2), (11, 1), (15, 1)],
  term ((-102641896120 : Rat) / 150171761) [(1, 2), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(1, 2), (11, 2), (12, 1)],
  term ((-7562694699248783730 : Rat) / 1288183727709509) [(1, 2), (11, 2), (12, 1), (15, 2)],
  term ((13865909176836190930 : Rat) / 1288183727709509) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 2), (11, 2), (14, 1), (15, 2)],
  term ((21652713163633291075 : Rat) / 2576367455419018) [(1, 2), (11, 2), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(1, 2), (11, 3), (12, 1), (15, 1)],
  term ((-9888555994146697163 : Rat) / 2576367455419018) [(1, 2), (11, 3), (15, 1)],
  term ((-14189683976 : Rat) / 8578069) [(1, 2), (12, 1), (15, 2)],
  term ((135057266168 : Rat) / 25734207) [(1, 2), (13, 1), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 2), (14, 1), (15, 2)],
  term ((44967100690 : Rat) / 25734207) [(1, 2), (15, 2)],
  term ((42153352000 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-559721965800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-196559180400 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((-1874268691807527128 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-53923808982409147545 : Rat) / 2576367455419018) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-9468289923622379355 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((393118360800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-9468289923622379355 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 3)],
  term ((18936579847244758710 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 3), (15, 2)],
  term ((3696394160 : Rat) / 25734207) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-32982401042 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((626517524 : Rat) / 8578069) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((626517524 : Rat) / 8578069) [(5, 1), (10, 1), (15, 3)],
  term ((393118360800 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((18936579847244758710 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((-1253035048 : Rat) / 8578069) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-21076676000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((12702477301383760 : Rat) / 3864551183128527) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((279860982900 : Rat) / 150171761) [(5, 1), (11, 1), (14, 2)],
  term ((-2552358424761354862 : Rat) / 1288183727709509) [(5, 1), (11, 1), (15, 2)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((42153352000 : Rat) / 150171761) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 3)],
  term ((53923808982409147545 : Rat) / 5152734910838036) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((-559721965800 : Rat) / 150171761) [(5, 1), (11, 2), (15, 1)],
  term ((53923808982409147545 : Rat) / 5152734910838036) [(5, 1), (11, 2), (15, 3)],
  term ((2030534301050164900 : Rat) / 1288183727709509) [(5, 1), (11, 3), (12, 1), (15, 2)],
  term ((-53923808982409147545 : Rat) / 2576367455419018) [(5, 1), (11, 3), (15, 2)],
  term ((-1848197080 : Rat) / 25734207) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1848197080 : Rat) / 25734207) [(5, 1), (12, 1), (15, 3)],
  term ((16491200521 : Rat) / 8578069) [(5, 1), (14, 2), (15, 1)],
  term ((16491200521 : Rat) / 8578069) [(5, 1), (15, 3)],
  term (-384 : Rat) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term (320 : Rat) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term (192 : Rat) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term (192 : Rat) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term (-384 : Rat) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term (320 : Rat) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term (-160 : Rat) [(7, 1), (9, 1), (14, 2)],
  term (-160 : Rat) [(7, 1), (9, 1), (15, 2)],
  term ((1315686400 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((35327788376 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term (192 : Rat) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((9354217090 : Rat) / 8578069) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((63376842833879680 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4929846010624472729 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term (-384 : Rat) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((16256607488 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17596270766 : Rat) / 25734207) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3853613921 : Rat) / 8578069) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-3853613921 : Rat) / 8578069) [(7, 1), (10, 1), (15, 3)],
  term (-384 : Rat) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((7707227842 : Rat) / 8578069) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-657843200 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((2424354301276403968 : Rat) / 3864551183128527) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-17663894188 : Rat) / 150171761) [(7, 1), (11, 1), (14, 2)],
  term ((-3097029277423127842 : Rat) / 3864551183128527) [(7, 1), (11, 1), (15, 2)],
  term (-4 : Rat) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((1315686400 : Rat) / 150171761) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 3)],
  term ((4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((35327788376 : Rat) / 150171761) [(7, 1), (11, 2), (15, 1)],
  term ((4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 3)],
  term ((63376842833879680 : Rat) / 1288183727709509) [(7, 1), (11, 3), (12, 1), (15, 2)],
  term ((-4929846010624472729 : Rat) / 2576367455419018) [(7, 1), (11, 3), (15, 2)],
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (12, 1), (15, 3)],
  term ((8798135383 : Rat) / 25734207) [(7, 1), (14, 2), (15, 1)],
  term (2 : Rat) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((8798135383 : Rat) / 25734207) [(7, 1), (15, 3)],
  term (2 : Rat) [(7, 1), (15, 3), (16, 1)],
  term (64 : Rat) [(7, 2), (10, 1), (14, 1)],
  term (64 : Rat) [(7, 2), (11, 1), (15, 1)],
  term (-32 : Rat) [(7, 2), (14, 2)],
  term (-32 : Rat) [(7, 2), (15, 2)],
  term ((13465317600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((1973529600 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-2424354301276403968 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((27234673800 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-81400409880 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((2641889223047737642 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((648626691925578870 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-3947059200 : Rat) / 150171761) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (15, 3)],
  term ((2623797952239349245 : Rat) / 2576367455419018) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((162800819760 : Rat) / 150171761) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-7842143817216848487 : Rat) / 2576367455419018) [(9, 1), (10, 1), (11, 2), (15, 3)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 3), (12, 1), (15, 2)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 3), (15, 2)],
  term ((23227580504 : Rat) / 8578069) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((-26705749318 : Rat) / 8578069) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11121090721 : Rat) / 8578069) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-11121090721 : Rat) / 8578069) [(9, 1), (10, 1), (15, 3)],
  term ((-3947059200 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((162800819760 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((7842143817216848487 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((22242181442 : Rat) / 8578069) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-6732658800 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((3430373456315090344 : Rat) / 1288183727709509) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-13617336900 : Rat) / 150171761) [(9, 1), (11, 1), (14, 2)],
  term ((-4127259859433055098 : Rat) / 1288183727709509) [(9, 1), (11, 1), (15, 2)],
  term (-4 : Rat) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-324313345962789435 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((13465317600 : Rat) / 150171761) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-324313345962789435 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 3)],
  term ((-2623797952239349245 : Rat) / 5152734910838036) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((27234673800 : Rat) / 150171761) [(9, 1), (11, 2), (15, 1)],
  term ((-2623797952239349245 : Rat) / 5152734910838036) [(9, 1), (11, 2), (15, 3)],
  term ((648626691925578870 : Rat) / 1288183727709509) [(9, 1), (11, 3), (12, 1), (15, 2)],
  term ((2623797952239349245 : Rat) / 2576367455419018) [(9, 1), (11, 3), (15, 2)],
  term ((-11613790252 : Rat) / 8578069) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11613790252 : Rat) / 8578069) [(9, 1), (12, 1), (15, 3)],
  term ((13352874659 : Rat) / 8578069) [(9, 1), (14, 2), (15, 1)],
  term (2 : Rat) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((13352874659 : Rat) / 8578069) [(9, 1), (15, 3)],
  term (2 : Rat) [(9, 1), (15, 3), (16, 1)],
  term (160 : Rat) [(9, 2), (10, 1), (14, 1)],
  term (160 : Rat) [(9, 2), (11, 1), (15, 1)],
  term (-80 : Rat) [(9, 2), (14, 2)],
  term (-80 : Rat) [(9, 2), (15, 2)],
  term ((2189061139239897536 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((575705172800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((15758302958296625792 : Rat) / 3864551183128527) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((259113494289852766 : Rat) / 3864551183128527) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-363283727871687143 : Rat) / 2576367455419018) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3585314357347112333 : Rat) / 7729102366257054) [(10, 1), (11, 1), (15, 3)],
  term ((7894118400 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-15125389398497567460 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((-4848708602552807936 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((27731818353672381860 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((8551961600 : Rat) / 150171761) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (15, 3)],
  term ((-205283792240 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1)],
  term ((21652713163633291075 : Rat) / 1288183727709509) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 2), (14, 2)],
  term ((-12830698244773130735 : Rat) / 2576367455419018) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((-2514218892352681177 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)],
  term ((15435878482560857545 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 4)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 2), (15, 1)],
  term ((-7894118400 : Rat) / 150171761) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 3)],
  term ((411949478420217920 : Rat) / 1288183727709509) [(10, 1), (11, 3), (13, 1), (15, 2)],
  term ((-9888555994146697163 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (14, 2), (15, 1)],
  term ((-502715706240 : Rat) / 150171761) [(10, 1), (11, 3), (15, 1)],
  term ((-3327926958362041501 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 3)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(10, 1), (11, 4), (12, 1), (15, 2)],
  term ((-24215903048397632088 : Rat) / 1288183727709509) [(10, 1), (11, 4), (15, 2)],
  term ((-28379367952 : Rat) / 8578069) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((270114532336 : Rat) / 25734207) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (15, 3)],
  term ((89934201380 : Rat) / 25734207) [(10, 1), (14, 1), (15, 2)],
  term ((24356495782 : Rat) / 25734207) [(10, 1), (14, 2), (15, 2)],
  term ((29293899766 : Rat) / 25734207) [(10, 1), (15, 4)],
  term ((-32513214976 : Rat) / 8578069) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8551961600 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((-4670383900107906457 : Rat) / 1288183727709509) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-7894118400 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1), (14, 1)],
  term ((411949478420217920 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-502715706240 : Rat) / 150171761) [(10, 2), (11, 2), (14, 1)],
  term ((-15435878482560857545 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 1), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-24215903048397632088 : Rat) / 1288183727709509) [(10, 2), (11, 3), (14, 1), (15, 1)],
  term ((105667948672 : Rat) / 25734207) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-58587799532 : Rat) / 25734207) [(10, 2), (14, 1), (15, 2)],
  term ((-1094530569619948768 : Rat) / 1288183727709509) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-5356310231038752240 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 3)],
  term ((-287852586400 : Rat) / 150171761) [(11, 1), (13, 1), (14, 2)],
  term ((33155916948685578896 : Rat) / 3864551183128527) [(11, 1), (13, 1), (15, 2)],
  term ((1011264023312999792 : Rat) / 1288183727709509) [(11, 1), (14, 1), (15, 3)],
  term ((-129556747144926383 : Rat) / 3864551183128527) [(11, 1), (14, 2), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(11, 1), (14, 3), (15, 1)],
  term ((13376020648218303797 : Rat) / 3864551183128527) [(11, 1), (15, 3)],
  term ((-3947059200 : Rat) / 150171761) [(11, 2), (12, 1), (14, 2)],
  term ((7562694699248783730 : Rat) / 1288183727709509) [(11, 2), (12, 1), (14, 2), (15, 2)],
  term ((2155202993075212736 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)],
  term ((7562694699248783730 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 4)],
  term ((-13865909176836190930 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((575705172800 : Rat) / 150171761) [(11, 2), (13, 1), (15, 1)],
  term ((-13865909176836190930 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 3)],
  term ((-293403307200 : Rat) / 150171761) [(11, 2), (14, 1), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 4)],
  term ((102641896120 : Rat) / 150171761) [(11, 2), (14, 2)],
  term ((-21652713163633291075 : Rat) / 2576367455419018) [(11, 2), (14, 2), (15, 2)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(11, 2), (14, 3), (15, 2)],
  term ((2900521295914429606 : Rat) / 3864551183128527) [(11, 2), (15, 2)],
  term ((-21652713163633291075 : Rat) / 2576367455419018) [(11, 2), (15, 4)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 1), (14, 2), (15, 1)],
  term ((7894118400 : Rat) / 150171761) [(11, 3), (12, 1), (15, 1)],
  term ((-15315519926999206500 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 3)],
  term ((27731818353672381860 : Rat) / 1288183727709509) [(11, 3), (13, 1), (15, 2)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(11, 3), (14, 1), (15, 3)],
  term ((9888555994146697163 : Rat) / 2576367455419018) [(11, 3), (14, 2), (15, 1)],
  term ((-205283792240 : Rat) / 150171761) [(11, 3), (15, 1)],
  term ((53193982321413279313 : Rat) / 2576367455419018) [(11, 3), (15, 3)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(11, 4), (12, 1), (15, 2)],
  term ((-9888555994146697163 : Rat) / 1288183727709509) [(11, 4), (15, 2)],
  term ((14189683976 : Rat) / 8578069) [(12, 1), (14, 2), (15, 2)],
  term ((14189683976 : Rat) / 8578069) [(12, 1), (15, 4)],
  term ((-135057266168 : Rat) / 25734207) [(13, 1), (14, 2), (15, 1)],
  term ((-135057266168 : Rat) / 25734207) [(13, 1), (15, 3)],
  term ((822900664 : Rat) / 8578069) [(14, 1), (15, 4)],
  term ((-44967100690 : Rat) / 25734207) [(14, 2), (15, 2)],
  term ((822900664 : Rat) / 8578069) [(14, 3), (15, 2)],
  term ((-44967100690 : Rat) / 25734207) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 100 through 161. -/
theorem rs_R013_ueqv_R013YNNN_block_24_0100_0161_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_24_0100_0161
      rs_R013_ueqv_R013YNNN_block_24_0100_0161 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
