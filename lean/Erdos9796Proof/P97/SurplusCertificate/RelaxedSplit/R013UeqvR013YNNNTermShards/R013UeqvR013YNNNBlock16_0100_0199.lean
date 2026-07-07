/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 16:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_16_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0100 : Poly :=
[
  term ((5999049914 : Rat) / 25734207) [(2, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 100 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0100 : Poly :=
[
  term ((-5999049914 : Rat) / 25734207) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((11998099828 : Rat) / 25734207) [(2, 1), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0100_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0100
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0101 : Poly :=
[
  term ((-4168012800 : Rat) / 150171761) [(2, 1), (7, 1), (10, 1), (11, 1)]
]

/-- Partial product 101 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0101 : Poly :=
[
  term ((-8336025600 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((4168012800 : Rat) / 150171761) [(2, 1), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0101_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0101
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0102 : Poly :=
[
  term ((-200773901862327360 : Rat) / 1288183727709509) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 102 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0102 : Poly :=
[
  term ((-401547803724654720 : Rat) / 1288183727709509) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0102_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0102
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0103 : Poly :=
[
  term ((264855168 : Rat) / 8578069) [(2, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 103 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0103 : Poly :=
[
  term ((529710336 : Rat) / 8578069) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(2, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0103_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0103
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0104 : Poly :=
[
  term ((-21741727400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 104 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0104 : Poly :=
[
  term ((-43483454800 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((21741727400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0104_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0104
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0105 : Poly :=
[
  term ((20506430000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 105 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0105 : Poly :=
[
  term ((41012860000 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-20506430000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0105_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0105
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0106 : Poly :=
[
  term ((987798301475150375 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 106 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0106 : Poly :=
[
  term ((1975596602950300750 : Rat) / 1288183727709509) [(2, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-987798301475150375 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0106_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0106
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0107 : Poly :=
[
  term ((-2094605584380678385 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 107 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0107 : Poly :=
[
  term ((-2094605584380678385 : Rat) / 1288183727709509) [(2, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((2094605584380678385 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0107_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0107
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0108 : Poly :=
[
  term ((11640778900 : Rat) / 25734207) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 108 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0108 : Poly :=
[
  term ((23281557800 : Rat) / 25734207) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-11640778900 : Rat) / 25734207) [(2, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0108_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0108
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0109 : Poly :=
[
  term ((-9209863078 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 109 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0109 : Poly :=
[
  term ((-18419726156 : Rat) / 25734207) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((9209863078 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0109_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0109
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0110 : Poly :=
[
  term ((-37512115200 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 110 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0110 : Poly :=
[
  term ((-75024230400 : Rat) / 150171761) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((37512115200 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0110_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0110
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0111 : Poly :=
[
  term ((-1806965116760946240 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 111 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0111 : Poly :=
[
  term ((-3613930233521892480 : Rat) / 1288183727709509) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1806965116760946240 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0111_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0111
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0112 : Poly :=
[
  term ((2383696512 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 112 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0112 : Poly :=
[
  term ((4767393024 : Rat) / 8578069) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2383696512 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0112_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0112
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0113 : Poly :=
[
  term ((43764134400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 113 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0113 : Poly :=
[
  term ((87528268800 : Rat) / 150171761) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-43764134400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0113_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0113
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0114 : Poly :=
[
  term ((2108125969554437280 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 114 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0114 : Poly :=
[
  term ((4216251939108874560 : Rat) / 1288183727709509) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-2108125969554437280 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0114_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0114
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0115 : Poly :=
[
  term ((-2780979264 : Rat) / 8578069) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 115 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0115 : Poly :=
[
  term ((-5561958528 : Rat) / 8578069) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((2780979264 : Rat) / 8578069) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0115_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0115
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0116 : Poly :=
[
  term ((1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 116 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0116 : Poly :=
[
  term ((3178262016 : Rat) / 8578069) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0116_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0116
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0117 : Poly :=
[
  term ((-25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2)]
]

/-- Partial product 117 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0117 : Poly :=
[
  term ((-50016153600 : Rat) / 150171761) [(2, 1), (6, 1), (10, 1), (11, 2)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0117_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0117
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0118 : Poly :=
[
  term ((-1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (15, 1)]
]

/-- Partial product 118 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0118 : Poly :=
[
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (6, 1), (10, 1), (11, 3), (15, 1)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0118_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0118
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0119 : Poly :=
[
  term ((25388341200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 119 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0119 : Poly :=
[
  term ((50776682400 : Rat) / 150171761) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-25388341200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0119_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0119
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0120 : Poly :=
[
  term ((-2440955600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 120 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0120 : Poly :=
[
  term ((-4881911200 : Rat) / 150171761) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((2440955600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0120_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0120
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0121 : Poly :=
[
  term ((386807454117232240 : Rat) / 1288183727709509) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 121 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0121 : Poly :=
[
  term ((773614908234464480 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-386807454117232240 : Rat) / 1288183727709509) [(2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0121_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0121
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0122 : Poly :=
[
  term ((5210016000 : Rat) / 150171761) [(2, 1), (11, 2)]
]

/-- Partial product 122 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0122 : Poly :=
[
  term ((10420032000 : Rat) / 150171761) [(2, 1), (6, 1), (11, 2)],
  term ((-5210016000 : Rat) / 150171761) [(2, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0122_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0122
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0123 : Poly :=
[
  term ((1222960813492723065 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 123 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0123 : Poly :=
[
  term ((2445921626985446130 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (12, 1), (15, 2)],
  term ((-1222960813492723065 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0123_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0123
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0124 : Poly :=
[
  term ((-117581256008786345 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 124 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0124 : Poly :=
[
  term ((-235162512017572690 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((117581256008786345 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0124_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0124
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0125 : Poly :=
[
  term ((2451305645870962465 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 125 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0125 : Poly :=
[
  term ((4902611291741924930 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (15, 2)],
  term ((-2451305645870962465 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0125_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0125
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0126 : Poly :=
[
  term ((250967377327909200 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 1)]
]

/-- Partial product 126 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0126 : Poly :=
[
  term ((501934754655818400 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 3), (15, 1)],
  term ((-250967377327909200 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0126_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0126
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0127 : Poly :=
[
  term ((2623673188 : Rat) / 8578069) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 127 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0127 : Poly :=
[
  term ((5247346376 : Rat) / 8578069) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-2623673188 : Rat) / 8578069) [(2, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0127_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0127
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0128 : Poly :=
[
  term ((1884879668 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 128 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0128 : Poly :=
[
  term ((3769759336 : Rat) / 25734207) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-1884879668 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0128_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0128
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0129 : Poly :=
[
  term ((-12011034676 : Rat) / 25734207) [(2, 1), (15, 2)]
]

/-- Partial product 129 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0129 : Poly :=
[
  term ((-24022069352 : Rat) / 25734207) [(2, 1), (6, 1), (15, 2)],
  term ((12011034676 : Rat) / 25734207) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0129_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0129
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0130 : Poly :=
[
  term ((119478328000 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)]
]

/-- Partial product 130 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0130 : Poly :=
[
  term ((238956656000 : Rat) / 150171761) [(2, 2), (5, 1), (6, 1), (11, 1)],
  term ((-119478328000 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0130_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0130
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0131 : Poly :=
[
  term ((5755291850482551100 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 131 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0131 : Poly :=
[
  term ((11510583700965102200 : Rat) / 1288183727709509) [(2, 2), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0131_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0131
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0132 : Poly :=
[
  term ((2540028560 : Rat) / 25734207) [(2, 2), (5, 1), (15, 1)]
]

/-- Partial product 132 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0132 : Poly :=
[
  term ((5080057120 : Rat) / 25734207) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0132_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0132
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0133 : Poly :=
[
  term ((4656059400 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)]
]

/-- Partial product 133 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0133 : Poly :=
[
  term ((9312118800 : Rat) / 150171761) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((-4656059400 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0133_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0133
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0134 : Poly :=
[
  term ((-70323376800 : Rat) / 150171761) [(2, 2), (11, 1), (15, 1)]
]

/-- Partial product 134 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0134 : Poly :=
[
  term ((-140646753600 : Rat) / 150171761) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((70323376800 : Rat) / 150171761) [(2, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0134_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0134
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0135 : Poly :=
[
  term ((448566383021072685 : Rat) / 2576367455419018) [(2, 2), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 135 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0135 : Poly :=
[
  term ((448566383021072685 : Rat) / 1288183727709509) [(2, 2), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(2, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0135_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0135
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0136 : Poly :=
[
  term ((-3387489297602605410 : Rat) / 1288183727709509) [(2, 2), (11, 2), (15, 2)]
]

/-- Partial product 136 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0136 : Poly :=
[
  term ((-6774978595205210820 : Rat) / 1288183727709509) [(2, 2), (6, 1), (11, 2), (15, 2)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(2, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0136_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0136
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0137 : Poly :=
[
  term ((437091386 : Rat) / 8578069) [(2, 2), (13, 1), (15, 1)]
]

/-- Partial product 137 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0137 : Poly :=
[
  term ((874182772 : Rat) / 8578069) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(2, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0137_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0137
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0138 : Poly :=
[
  term ((4928338968 : Rat) / 8578069) [(2, 2), (15, 2)]
]

/-- Partial product 138 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0138 : Poly :=
[
  term ((9856677936 : Rat) / 8578069) [(2, 2), (6, 1), (15, 2)],
  term ((-4928338968 : Rat) / 8578069) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0138_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0138
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0139 : Poly :=
[
  term ((-22745337600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 139 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0139 : Poly :=
[
  term ((-45490675200 : Rat) / 150171761) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((22745337600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0139_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0139
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0140 : Poly :=
[
  term ((-1095646870165059120 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 140 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0140 : Poly :=
[
  term ((-2191293740330118240 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((1095646870165059120 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0140_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0140
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0141 : Poly :=
[
  term ((-648758144 : Rat) / 8578069) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 141 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0141 : Poly :=
[
  term ((-1297516288 : Rat) / 8578069) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((648758144 : Rat) / 8578069) [(3, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0141_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0141
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0142 : Poly :=
[
  term ((5587408000 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)]
]

/-- Partial product 142 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0142 : Poly :=
[
  term ((11174816000 : Rat) / 150171761) [(3, 1), (4, 2), (6, 1), (11, 1)],
  term ((-5587408000 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0142_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0142
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0143 : Poly :=
[
  term ((269146415638834600 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)]
]

/-- Partial product 143 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0143 : Poly :=
[
  term ((538292831277669200 : Rat) / 1288183727709509) [(3, 1), (4, 2), (6, 1), (11, 2), (15, 1)],
  term ((-269146415638834600 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0143_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0143
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0144 : Poly :=
[
  term ((4780170080 : Rat) / 25734207) [(3, 1), (4, 2), (15, 1)]
]

/-- Partial product 144 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0144 : Poly :=
[
  term ((9560340160 : Rat) / 25734207) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term ((-4780170080 : Rat) / 25734207) [(3, 1), (4, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0144_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0144
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0145 : Poly :=
[
  term ((32981709300 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 145 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0145 : Poly :=
[
  term ((-32981709300 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1)],
  term ((65963418600 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0145_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0145
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0146 : Poly :=
[
  term ((-20506430000 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 146 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0146 : Poly :=
[
  term ((20506430000 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-41012860000 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0146_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0146
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0147 : Poly :=
[
  term ((-987798301475150375 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 147 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0147 : Poly :=
[
  term ((987798301475150375 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1975596602950300750 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0147_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0147
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0148 : Poly :=
[
  term ((6354938704842758265 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 148 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0148 : Poly :=
[
  term ((-6354938704842758265 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((6354938704842758265 : Rat) / 2576367455419018) [(3, 1), (6, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0148_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0148
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0149 : Poly :=
[
  term ((-11640778900 : Rat) / 25734207) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 149 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0149 : Poly :=
[
  term ((11640778900 : Rat) / 25734207) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-23281557800 : Rat) / 25734207) [(3, 1), (6, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0149_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0149
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0150 : Poly :=
[
  term ((1500593737 : Rat) / 8578069) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 150 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0150 : Poly :=
[
  term ((-1500593737 : Rat) / 8578069) [(3, 1), (6, 1), (15, 1)],
  term ((3001187474 : Rat) / 8578069) [(3, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0150_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0150
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0151 : Poly :=
[
  term ((-13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 151 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0151 : Poly :=
[
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0151_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0151
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0152 : Poly :=
[
  term ((-652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 152 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0152 : Poly :=
[
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0152_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0152
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0153 : Poly :=
[
  term ((860779296 : Rat) / 8578069) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 153 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0153 : Poly :=
[
  term ((1721558592 : Rat) / 8578069) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0153_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0153
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0154 : Poly :=
[
  term ((-29754927800 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 154 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0154 : Poly :=
[
  term ((-59509855600 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1)],
  term ((29754927800 : Rat) / 150171761) [(3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0154_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0154
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0155 : Poly :=
[
  term ((35415704400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 155 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0155 : Poly :=
[
  term ((70831408800 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-35415704400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0155_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0155
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0156 : Poly :=
[
  term ((1705980643723261905 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 156 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0156 : Poly :=
[
  term ((3411961287446523810 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1705980643723261905 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0156_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0156
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0157 : Poly :=
[
  term ((-2866600099710747595 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 157 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0157 : Poly :=
[
  term ((-2866600099710747595 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((2866600099710747595 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0157_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0157
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0158 : Poly :=
[
  term ((6257480836 : Rat) / 8578069) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 158 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0158 : Poly :=
[
  term ((12514961672 : Rat) / 8578069) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-6257480836 : Rat) / 8578069) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0158_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0158
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0159 : Poly :=
[
  term ((1123257854 : Rat) / 25734207) [(3, 1), (15, 1)]
]

/-- Partial product 159 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0159 : Poly :=
[
  term ((2246515708 : Rat) / 25734207) [(3, 1), (6, 1), (15, 1)],
  term ((-1123257854 : Rat) / 25734207) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0159_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0159
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0160 : Poly :=
[
  term ((-13422316800 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 160 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0160 : Poly :=
[
  term ((-26844633600 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((13422316800 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0160_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0160
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0161 : Poly :=
[
  term ((-646555335906902160 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 161 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0161 : Poly :=
[
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0161_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0161
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0162 : Poly :=
[
  term ((541374848 : Rat) / 8578069) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 162 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0162 : Poly :=
[
  term ((1082749696 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-541374848 : Rat) / 8578069) [(4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0162_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0162
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0163 : Poly :=
[
  term ((41092248000 : Rat) / 150171761) [(4, 1), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 163 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0163 : Poly :=
[
  term ((-41092248000 : Rat) / 150171761) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((82184496000 : Rat) / 150171761) [(4, 1), (6, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0163_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0163
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0164 : Poly :=
[
  term ((1979420736724805100 : Rat) / 1288183727709509) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 164 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0164 : Poly :=
[
  term ((-1979420736724805100 : Rat) / 1288183727709509) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((3958841473449610200 : Rat) / 1288183727709509) [(4, 1), (6, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0164_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0164
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0165 : Poly :=
[
  term ((258686000 : Rat) / 8578069) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 165 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0165 : Poly :=
[
  term ((-258686000 : Rat) / 8578069) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((517372000 : Rat) / 8578069) [(4, 1), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0165_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0165
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0166 : Poly :=
[
  term ((-2038930800 : Rat) / 6529207) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 166 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0166 : Poly :=
[
  term ((-4077861600 : Rat) / 6529207) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((2038930800 : Rat) / 6529207) [(4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0166_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0166
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0167 : Poly :=
[
  term ((16076222400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 167 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0167 : Poly :=
[
  term ((32152444800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-16076222400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0167_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0167
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0168 : Poly :=
[
  term ((774394430471650380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 168 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0168 : Poly :=
[
  term ((1548788860943300760 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0168_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0168
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0169 : Poly :=
[
  term ((-98215651435445835 : Rat) / 56007988161283) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 169 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0169 : Poly :=
[
  term ((-196431302870891670 : Rat) / 56007988161283) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((98215651435445835 : Rat) / 56007988161283) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0169_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0169
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0170 : Poly :=
[
  term ((1749490416 : Rat) / 8578069) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 170 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0170 : Poly :=
[
  term ((3498980832 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0170_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0170
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0171 : Poly :=
[
  term ((-1943504916 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 171 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0171 : Poly :=
[
  term ((-3887009832 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((1943504916 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0171_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0171
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0172 : Poly :=
[
  term ((-116276661600 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 172 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0172 : Poly :=
[
  term ((-232553323200 : Rat) / 150171761) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((116276661600 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0172_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0172
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0173 : Poly :=
[
  term ((-5601067022864576670 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 173 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0173 : Poly :=
[
  term ((-11202134045729153340 : Rat) / 1288183727709509) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((5601067022864576670 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0173_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0173
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0174 : Poly :=
[
  term ((214064296 : Rat) / 8578069) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 174 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0174 : Poly :=
[
  term ((428128592 : Rat) / 8578069) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-214064296 : Rat) / 8578069) [(4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0174_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0174
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0175 : Poly :=
[
  term ((-8038111200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 175 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0175 : Poly :=
[
  term ((-16076222400 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((8038111200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0175_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0175
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0176 : Poly :=
[
  term ((-550460923085037336 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 176 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0176 : Poly :=
[
  term ((-1100921846170074672 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((550460923085037336 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0176_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0176
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0177 : Poly :=
[
  term ((99715053600 : Rat) / 150171761) [(4, 1), (11, 2)]
]

/-- Partial product 177 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0177 : Poly :=
[
  term ((199430107200 : Rat) / 150171761) [(4, 1), (6, 1), (11, 2)],
  term ((-99715053600 : Rat) / 150171761) [(4, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0177_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0177
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0178 : Poly :=
[
  term ((-387197215235825190 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 178 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0178 : Poly :=
[
  term ((-774394430471650380 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((387197215235825190 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0178_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0178
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0179 : Poly :=
[
  term ((-646555335906902160 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 179 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0179 : Poly :=
[
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (15, 2)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0179_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0179
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0180 : Poly :=
[
  term ((4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)]
]

/-- Partial product 180 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0180 : Poly :=
[
  term ((9606582967155529140 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 3), (15, 1)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0180_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0180
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0181 : Poly :=
[
  term ((-874745208 : Rat) / 8578069) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 181 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0181 : Poly :=
[
  term ((-1749490416 : Rat) / 8578069) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((874745208 : Rat) / 8578069) [(4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0181_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0181
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0182 : Poly :=
[
  term ((541374848 : Rat) / 8578069) [(4, 1), (15, 2)]
]

/-- Partial product 182 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0182 : Poly :=
[
  term ((1082749696 : Rat) / 8578069) [(4, 1), (6, 1), (15, 2)],
  term ((-541374848 : Rat) / 8578069) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0182_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0182
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0183 : Poly :=
[
  term ((26349284400 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 183 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0183 : Poly :=
[
  term ((-26349284400 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1)],
  term ((52698568800 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0183_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0183
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0184 : Poly :=
[
  term ((-16076222400 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 184 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0184 : Poly :=
[
  term ((16076222400 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-32152444800 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0184_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0184
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0185 : Poly :=
[
  term ((-774394430471650380 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 185 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0185 : Poly :=
[
  term ((774394430471650380 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0185_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0185
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0186 : Poly :=
[
  term ((1269249614652851655 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 186 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0186 : Poly :=
[
  term ((-1269249614652851655 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((2538499229305703310 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0186_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0186
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0187 : Poly :=
[
  term ((-1749490416 : Rat) / 8578069) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 187 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0187 : Poly :=
[
  term ((1749490416 : Rat) / 8578069) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-3498980832 : Rat) / 8578069) [(5, 1), (6, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0187_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0187
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0188 : Poly :=
[
  term ((1814161916 : Rat) / 8578069) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 188 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0188 : Poly :=
[
  term ((-1814161916 : Rat) / 8578069) [(5, 1), (6, 1), (15, 1)],
  term ((3628323832 : Rat) / 8578069) [(5, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0188_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0188
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0189 : Poly :=
[
  term ((-63292924000 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 189 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0189 : Poly :=
[
  term ((-126585848000 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1)],
  term ((63292924000 : Rat) / 150171761) [(5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0189_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0189
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0190 : Poly :=
[
  term ((24114333600 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 190 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0190 : Poly :=
[
  term ((48228667200 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-24114333600 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0190_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0190
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0191 : Poly :=
[
  term ((1161591645707475570 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 191 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0191 : Poly :=
[
  term ((2323183291414951140 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1161591645707475570 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0191_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0191
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0192 : Poly :=
[
  term ((-3048831162839937550 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 192 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0192 : Poly :=
[
  term ((-6097662325679875100 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((3048831162839937550 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0192_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0192
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0193 : Poly :=
[
  term ((2624235624 : Rat) / 8578069) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 193 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0193 : Poly :=
[
  term ((5248471248 : Rat) / 8578069) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2624235624 : Rat) / 8578069) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0193_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0193
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0194 : Poly :=
[
  term ((-3137930360 : Rat) / 25734207) [(5, 1), (15, 1)]
]

/-- Partial product 194 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0194 : Poly :=
[
  term ((-6275860720 : Rat) / 25734207) [(5, 1), (6, 1), (15, 1)],
  term ((3137930360 : Rat) / 25734207) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0194_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0194
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0195 : Poly :=
[
  term (24 : Rat) [(6, 1)]
]

/-- Partial product 195 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0195 : Poly :=
[
  term (-24 : Rat) [(6, 1)],
  term (48 : Rat) [(6, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0195_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0195
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0196 : Poly :=
[
  term (224 : Rat) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 196 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0196 : Poly :=
[
  term (-224 : Rat) [(6, 1), (7, 1), (9, 1)],
  term (448 : Rat) [(6, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0196_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0196
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0197 : Poly :=
[
  term (-128 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)]
]

/-- Partial product 197 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0197 : Poly :=
[
  term (128 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term (-256 : Rat) [(6, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0197_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0197
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0198 : Poly :=
[
  term ((72328328720 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 198 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0198 : Poly :=
[
  term ((-72328328720 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((144656657440 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0198_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0198
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YNNN_coefficient_16_0199 : Poly :=
[
  term ((-1315686400 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 199 for generator 16. -/
def rs_R013_ueqv_R013YNNN_partial_16_0199 : Poly :=
[
  term ((1315686400 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-2631372800 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 16. -/
theorem rs_R013_ueqv_R013YNNN_partial_16_0199_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_16_0199
        rs_R013_ueqv_R013YNNN_generator_16_0100_0199 =
      rs_R013_ueqv_R013YNNN_partial_16_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_16_0100_0199 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_16_0100,
  rs_R013_ueqv_R013YNNN_partial_16_0101,
  rs_R013_ueqv_R013YNNN_partial_16_0102,
  rs_R013_ueqv_R013YNNN_partial_16_0103,
  rs_R013_ueqv_R013YNNN_partial_16_0104,
  rs_R013_ueqv_R013YNNN_partial_16_0105,
  rs_R013_ueqv_R013YNNN_partial_16_0106,
  rs_R013_ueqv_R013YNNN_partial_16_0107,
  rs_R013_ueqv_R013YNNN_partial_16_0108,
  rs_R013_ueqv_R013YNNN_partial_16_0109,
  rs_R013_ueqv_R013YNNN_partial_16_0110,
  rs_R013_ueqv_R013YNNN_partial_16_0111,
  rs_R013_ueqv_R013YNNN_partial_16_0112,
  rs_R013_ueqv_R013YNNN_partial_16_0113,
  rs_R013_ueqv_R013YNNN_partial_16_0114,
  rs_R013_ueqv_R013YNNN_partial_16_0115,
  rs_R013_ueqv_R013YNNN_partial_16_0116,
  rs_R013_ueqv_R013YNNN_partial_16_0117,
  rs_R013_ueqv_R013YNNN_partial_16_0118,
  rs_R013_ueqv_R013YNNN_partial_16_0119,
  rs_R013_ueqv_R013YNNN_partial_16_0120,
  rs_R013_ueqv_R013YNNN_partial_16_0121,
  rs_R013_ueqv_R013YNNN_partial_16_0122,
  rs_R013_ueqv_R013YNNN_partial_16_0123,
  rs_R013_ueqv_R013YNNN_partial_16_0124,
  rs_R013_ueqv_R013YNNN_partial_16_0125,
  rs_R013_ueqv_R013YNNN_partial_16_0126,
  rs_R013_ueqv_R013YNNN_partial_16_0127,
  rs_R013_ueqv_R013YNNN_partial_16_0128,
  rs_R013_ueqv_R013YNNN_partial_16_0129,
  rs_R013_ueqv_R013YNNN_partial_16_0130,
  rs_R013_ueqv_R013YNNN_partial_16_0131,
  rs_R013_ueqv_R013YNNN_partial_16_0132,
  rs_R013_ueqv_R013YNNN_partial_16_0133,
  rs_R013_ueqv_R013YNNN_partial_16_0134,
  rs_R013_ueqv_R013YNNN_partial_16_0135,
  rs_R013_ueqv_R013YNNN_partial_16_0136,
  rs_R013_ueqv_R013YNNN_partial_16_0137,
  rs_R013_ueqv_R013YNNN_partial_16_0138,
  rs_R013_ueqv_R013YNNN_partial_16_0139,
  rs_R013_ueqv_R013YNNN_partial_16_0140,
  rs_R013_ueqv_R013YNNN_partial_16_0141,
  rs_R013_ueqv_R013YNNN_partial_16_0142,
  rs_R013_ueqv_R013YNNN_partial_16_0143,
  rs_R013_ueqv_R013YNNN_partial_16_0144,
  rs_R013_ueqv_R013YNNN_partial_16_0145,
  rs_R013_ueqv_R013YNNN_partial_16_0146,
  rs_R013_ueqv_R013YNNN_partial_16_0147,
  rs_R013_ueqv_R013YNNN_partial_16_0148,
  rs_R013_ueqv_R013YNNN_partial_16_0149,
  rs_R013_ueqv_R013YNNN_partial_16_0150,
  rs_R013_ueqv_R013YNNN_partial_16_0151,
  rs_R013_ueqv_R013YNNN_partial_16_0152,
  rs_R013_ueqv_R013YNNN_partial_16_0153,
  rs_R013_ueqv_R013YNNN_partial_16_0154,
  rs_R013_ueqv_R013YNNN_partial_16_0155,
  rs_R013_ueqv_R013YNNN_partial_16_0156,
  rs_R013_ueqv_R013YNNN_partial_16_0157,
  rs_R013_ueqv_R013YNNN_partial_16_0158,
  rs_R013_ueqv_R013YNNN_partial_16_0159,
  rs_R013_ueqv_R013YNNN_partial_16_0160,
  rs_R013_ueqv_R013YNNN_partial_16_0161,
  rs_R013_ueqv_R013YNNN_partial_16_0162,
  rs_R013_ueqv_R013YNNN_partial_16_0163,
  rs_R013_ueqv_R013YNNN_partial_16_0164,
  rs_R013_ueqv_R013YNNN_partial_16_0165,
  rs_R013_ueqv_R013YNNN_partial_16_0166,
  rs_R013_ueqv_R013YNNN_partial_16_0167,
  rs_R013_ueqv_R013YNNN_partial_16_0168,
  rs_R013_ueqv_R013YNNN_partial_16_0169,
  rs_R013_ueqv_R013YNNN_partial_16_0170,
  rs_R013_ueqv_R013YNNN_partial_16_0171,
  rs_R013_ueqv_R013YNNN_partial_16_0172,
  rs_R013_ueqv_R013YNNN_partial_16_0173,
  rs_R013_ueqv_R013YNNN_partial_16_0174,
  rs_R013_ueqv_R013YNNN_partial_16_0175,
  rs_R013_ueqv_R013YNNN_partial_16_0176,
  rs_R013_ueqv_R013YNNN_partial_16_0177,
  rs_R013_ueqv_R013YNNN_partial_16_0178,
  rs_R013_ueqv_R013YNNN_partial_16_0179,
  rs_R013_ueqv_R013YNNN_partial_16_0180,
  rs_R013_ueqv_R013YNNN_partial_16_0181,
  rs_R013_ueqv_R013YNNN_partial_16_0182,
  rs_R013_ueqv_R013YNNN_partial_16_0183,
  rs_R013_ueqv_R013YNNN_partial_16_0184,
  rs_R013_ueqv_R013YNNN_partial_16_0185,
  rs_R013_ueqv_R013YNNN_partial_16_0186,
  rs_R013_ueqv_R013YNNN_partial_16_0187,
  rs_R013_ueqv_R013YNNN_partial_16_0188,
  rs_R013_ueqv_R013YNNN_partial_16_0189,
  rs_R013_ueqv_R013YNNN_partial_16_0190,
  rs_R013_ueqv_R013YNNN_partial_16_0191,
  rs_R013_ueqv_R013YNNN_partial_16_0192,
  rs_R013_ueqv_R013YNNN_partial_16_0193,
  rs_R013_ueqv_R013YNNN_partial_16_0194,
  rs_R013_ueqv_R013YNNN_partial_16_0195,
  rs_R013_ueqv_R013YNNN_partial_16_0196,
  rs_R013_ueqv_R013YNNN_partial_16_0197,
  rs_R013_ueqv_R013YNNN_partial_16_0198,
  rs_R013_ueqv_R013YNNN_partial_16_0199
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_16_0100_0199 : Poly :=
[
  term ((-8336025600 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((-401547803724654720 : Rat) / 1288183727709509) [(2, 1), (6, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((529710336 : Rat) / 8578069) [(2, 1), (6, 1), (7, 1), (10, 1), (15, 1)],
  term ((-43483454800 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((41012860000 : Rat) / 150171761) [(2, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((1975596602950300750 : Rat) / 1288183727709509) [(2, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2094605584380678385 : Rat) / 1288183727709509) [(2, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((23281557800 : Rat) / 25734207) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-18419726156 : Rat) / 25734207) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-75024230400 : Rat) / 150171761) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-3613930233521892480 : Rat) / 1288183727709509) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((4767393024 : Rat) / 8578069) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((87528268800 : Rat) / 150171761) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((4216251939108874560 : Rat) / 1288183727709509) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-22684925498 : Rat) / 25734207) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((3178262016 : Rat) / 8578069) [(2, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-50016153600 : Rat) / 150171761) [(2, 1), (6, 1), (10, 1), (11, 2)],
  term ((-2409286822347928320 : Rat) / 1288183727709509) [(2, 1), (6, 1), (10, 1), (11, 3), (15, 1)],
  term ((50776682400 : Rat) / 150171761) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-4881911200 : Rat) / 150171761) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((773614908234464480 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((10420032000 : Rat) / 150171761) [(2, 1), (6, 1), (11, 2)],
  term ((2445921626985446130 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (12, 1), (15, 2)],
  term ((-235162512017572690 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((4902611291741924930 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 2), (15, 2)],
  term ((501934754655818400 : Rat) / 1288183727709509) [(2, 1), (6, 1), (11, 3), (15, 1)],
  term ((5247346376 : Rat) / 8578069) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((3769759336 : Rat) / 25734207) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-24022069352 : Rat) / 25734207) [(2, 1), (6, 1), (15, 2)],
  term ((11998099828 : Rat) / 25734207) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((4168012800 : Rat) / 150171761) [(2, 1), (7, 1), (10, 1), (11, 1)],
  term ((200773901862327360 : Rat) / 1288183727709509) [(2, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-264855168 : Rat) / 8578069) [(2, 1), (7, 1), (10, 1), (15, 1)],
  term ((21741727400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)],
  term ((-20506430000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-987798301475150375 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((2094605584380678385 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-11640778900 : Rat) / 25734207) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((9209863078 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)],
  term ((37512115200 : Rat) / 150171761) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((1806965116760946240 : Rat) / 1288183727709509) [(2, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-2383696512 : Rat) / 8578069) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((-43764134400 : Rat) / 150171761) [(2, 1), (9, 1), (11, 1)],
  term ((-2108125969554437280 : Rat) / 1288183727709509) [(2, 1), (9, 1), (11, 2), (15, 1)],
  term ((2780979264 : Rat) / 8578069) [(2, 1), (9, 1), (15, 1)],
  term ((-1589131008 : Rat) / 8578069) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((25008076800 : Rat) / 150171761) [(2, 1), (10, 1), (11, 2)],
  term ((1204643411173964160 : Rat) / 1288183727709509) [(2, 1), (10, 1), (11, 3), (15, 1)],
  term ((-25388341200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((2440955600 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)],
  term ((-386807454117232240 : Rat) / 1288183727709509) [(2, 1), (11, 1), (15, 1)],
  term ((-5210016000 : Rat) / 150171761) [(2, 1), (11, 2)],
  term ((-1222960813492723065 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((117581256008786345 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2451305645870962465 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)],
  term ((-250967377327909200 : Rat) / 1288183727709509) [(2, 1), (11, 3), (15, 1)],
  term ((-2623673188 : Rat) / 8578069) [(2, 1), (12, 1), (15, 2)],
  term ((-1884879668 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)],
  term ((12011034676 : Rat) / 25734207) [(2, 1), (15, 2)],
  term ((238956656000 : Rat) / 150171761) [(2, 2), (5, 1), (6, 1), (11, 1)],
  term ((11510583700965102200 : Rat) / 1288183727709509) [(2, 2), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((5080057120 : Rat) / 25734207) [(2, 2), (5, 1), (6, 1), (15, 1)],
  term ((-119478328000 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((-5755291850482551100 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((-2540028560 : Rat) / 25734207) [(2, 2), (5, 1), (15, 1)],
  term ((9312118800 : Rat) / 150171761) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((-140646753600 : Rat) / 150171761) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 1288183727709509) [(2, 2), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-6774978595205210820 : Rat) / 1288183727709509) [(2, 2), (6, 1), (11, 2), (15, 2)],
  term ((874182772 : Rat) / 8578069) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((9856677936 : Rat) / 8578069) [(2, 2), (6, 1), (15, 2)],
  term ((-4656059400 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)],
  term ((70323376800 : Rat) / 150171761) [(2, 2), (11, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((3387489297602605410 : Rat) / 1288183727709509) [(2, 2), (11, 2), (15, 2)],
  term ((-437091386 : Rat) / 8578069) [(2, 2), (13, 1), (15, 1)],
  term ((-4928338968 : Rat) / 8578069) [(2, 2), (15, 2)],
  term ((-45490675200 : Rat) / 150171761) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-2191293740330118240 : Rat) / 1288183727709509) [(3, 1), (4, 1), (6, 1), (11, 2), (15, 1)],
  term ((-1297516288 : Rat) / 8578069) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((22745337600 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)],
  term ((1095646870165059120 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((648758144 : Rat) / 8578069) [(3, 1), (4, 1), (15, 1)],
  term ((11174816000 : Rat) / 150171761) [(3, 1), (4, 2), (6, 1), (11, 1)],
  term ((538292831277669200 : Rat) / 1288183727709509) [(3, 1), (4, 2), (6, 1), (11, 2), (15, 1)],
  term ((9560340160 : Rat) / 25734207) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term ((-5587408000 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((-269146415638834600 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-4780170080 : Rat) / 25734207) [(3, 1), (4, 2), (15, 1)],
  term ((-27092083200 : Rat) / 150171761) [(3, 1), (6, 1), (10, 1), (11, 1)],
  term ((-1305030362105127840 : Rat) / 1288183727709509) [(3, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((1721558592 : Rat) / 8578069) [(3, 1), (6, 1), (10, 1), (15, 1)],
  term ((-92491564900 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1)],
  term ((91337838800 : Rat) / 150171761) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((4399759588921674185 : Rat) / 1288183727709509) [(3, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-17821339103685748645 : Rat) / 5152734910838036) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((49185663916 : Rat) / 25734207) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2255265503 : Rat) / 25734207) [(3, 1), (6, 1), (15, 1)],
  term ((65963418600 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1)],
  term ((-41012860000 : Rat) / 150171761) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((-1975596602950300750 : Rat) / 1288183727709509) [(3, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((6354938704842758265 : Rat) / 2576367455419018) [(3, 1), (6, 2), (11, 2), (15, 1)],
  term ((-23281557800 : Rat) / 25734207) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((3001187474 : Rat) / 8578069) [(3, 1), (6, 2), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (10, 1), (11, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-860779296 : Rat) / 8578069) [(3, 1), (10, 1), (15, 1)],
  term ((29754927800 : Rat) / 150171761) [(3, 1), (11, 1)],
  term ((-35415704400 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)],
  term ((-1705980643723261905 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((2866600099710747595 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 1)],
  term ((-6257480836 : Rat) / 8578069) [(3, 1), (12, 1), (15, 1)],
  term ((-1123257854 : Rat) / 25734207) [(3, 1), (15, 1)],
  term ((-26844633600 : Rat) / 150171761) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(4, 1), (5, 1), (6, 1), (11, 2), (15, 1)],
  term ((1082749696 : Rat) / 8578069) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((13422316800 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-541374848 : Rat) / 8578069) [(4, 1), (5, 1), (15, 1)],
  term ((-4077861600 : Rat) / 6529207) [(4, 1), (6, 1), (7, 1), (11, 1)],
  term ((32152444800 : Rat) / 150171761) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((1548788860943300760 : Rat) / 1288183727709509) [(4, 1), (6, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-196431302870891670 : Rat) / 56007988161283) [(4, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((3498980832 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-3887009832 : Rat) / 8578069) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-273645571200 : Rat) / 150171761) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-13181554782453958440 : Rat) / 1288183727709509) [(4, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((169442592 : Rat) / 8578069) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-16076222400 : Rat) / 150171761) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-1100921846170074672 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((199430107200 : Rat) / 150171761) [(4, 1), (6, 1), (11, 2)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 2), (15, 2)],
  term ((9606582967155529140 : Rat) / 1288183727709509) [(4, 1), (6, 1), (11, 3), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((1082749696 : Rat) / 8578069) [(4, 1), (6, 1), (15, 2)],
  term ((82184496000 : Rat) / 150171761) [(4, 1), (6, 2), (9, 1), (11, 1)],
  term ((3958841473449610200 : Rat) / 1288183727709509) [(4, 1), (6, 2), (9, 1), (11, 2), (15, 1)],
  term ((517372000 : Rat) / 8578069) [(4, 1), (6, 2), (9, 1), (15, 1)],
  term ((2038930800 : Rat) / 6529207) [(4, 1), (7, 1), (11, 1)],
  term ((-16076222400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((98215651435445835 : Rat) / 56007988161283) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((1943504916 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)],
  term ((116276661600 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1)],
  term ((5601067022864576670 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-214064296 : Rat) / 8578069) [(4, 1), (9, 1), (15, 1)],
  term ((8038111200 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)],
  term ((550460923085037336 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)],
  term ((-99715053600 : Rat) / 150171761) [(4, 1), (11, 2)],
  term ((387197215235825190 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)],
  term ((-4803291483577764570 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)],
  term ((874745208 : Rat) / 8578069) [(4, 1), (13, 1), (15, 1)],
  term ((-541374848 : Rat) / 8578069) [(4, 1), (15, 2)],
  term ((-152935132400 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1)],
  term ((64304889600 : Rat) / 150171761) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((3097577721886601520 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7366911940332726755 : Rat) / 1288183727709509) [(5, 1), (6, 1), (11, 2), (15, 1)],
  term ((6997961664 : Rat) / 8578069) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-11718346468 : Rat) / 25734207) [(5, 1), (6, 1), (15, 1)],
  term ((52698568800 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1)],
  term ((-32152444800 : Rat) / 150171761) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (12, 1), (15, 1)],
  term ((2538499229305703310 : Rat) / 1288183727709509) [(5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-3498980832 : Rat) / 8578069) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((3628323832 : Rat) / 8578069) [(5, 1), (6, 2), (15, 1)],
  term ((63292924000 : Rat) / 150171761) [(5, 1), (11, 1)],
  term ((-24114333600 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)],
  term ((-1161591645707475570 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((3048831162839937550 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)],
  term ((-2624235624 : Rat) / 8578069) [(5, 1), (12, 1), (15, 1)],
  term ((3137930360 : Rat) / 25734207) [(5, 1), (15, 1)],
  term (-24 : Rat) [(6, 1)],
  term (-224 : Rat) [(6, 1), (7, 1), (9, 1)],
  term (128 : Rat) [(6, 1), (7, 1), (9, 1), (10, 1)],
  term ((-72328328720 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1)],
  term ((1315686400 : Rat) / 150171761) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term (48 : Rat) [(6, 2)],
  term (448 : Rat) [(6, 2), (7, 1), (9, 1)],
  term (-256 : Rat) [(6, 2), (7, 1), (9, 1), (10, 1)],
  term ((144656657440 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-2631372800 : Rat) / 150171761) [(6, 2), (9, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 100 through 199. -/
theorem rs_R013_ueqv_R013YNNN_block_16_0100_0199_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_16_0100_0199
      rs_R013_ueqv_R013YNNN_block_16_0100_0199 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
