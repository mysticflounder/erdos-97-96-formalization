/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 29:100-158

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_29_0100_0158 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (-1 : Rat) [(10, 2)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0100 : Poly :=
[
  term ((163364484 : Rat) / 8578069) [(4, 1), (15, 2)]
]

/-- Partial product 100 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0100 : Poly :=
[
  term ((326728968 : Rat) / 8578069) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-163364484 : Rat) / 8578069) [(4, 1), (10, 2), (15, 2)],
  term ((326728968 : Rat) / 8578069) [(4, 1), (11, 1), (15, 3)],
  term ((-163364484 : Rat) / 8578069) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0100_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0100
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0101 : Poly :=
[
  term ((-123208353600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 101 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0101 : Poly :=
[
  term ((-246416707200 : Rat) / 150171761) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((123208353600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 3)],
  term ((-246416707200 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((123208353600 : Rat) / 150171761) [(5, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0101_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0101
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0102 : Poly :=
[
  term ((-5934967832705630820 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 102 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0102 : Poly :=
[
  term ((-11869935665411261640 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 3), (15, 2)],
  term ((5934967832705630820 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 4), (15, 1)],
  term ((-11869935665411261640 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((5934967832705630820 : Rat) / 1288183727709509) [(5, 1), (10, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0102_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0102
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0103 : Poly :=
[
  term ((1037967856 : Rat) / 8578069) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 103 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0103 : Poly :=
[
  term ((2075935712 : Rat) / 8578069) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1037967856 : Rat) / 8578069) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((2075935712 : Rat) / 8578069) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-1037967856 : Rat) / 8578069) [(5, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0103_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0103
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0104 : Poly :=
[
  term ((268279199400 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 104 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0104 : Poly :=
[
  term ((536558398800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((-268279199400 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1)],
  term ((536558398800 : Rat) / 150171761) [(5, 1), (11, 2), (15, 1)],
  term ((-268279199400 : Rat) / 150171761) [(5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0104_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0104
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0105 : Poly :=
[
  term ((-21076676000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 105 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0105 : Poly :=
[
  term ((-42153352000 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((21076676000 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (12, 1)],
  term ((-42153352000 : Rat) / 150171761) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((21076676000 : Rat) / 150171761) [(5, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0105_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0105
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0106 : Poly :=
[
  term ((-1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 106 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0106 : Poly :=
[
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(5, 1), (11, 3), (12, 1), (15, 2)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (11, 4), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0106_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0106
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0107 : Poly :=
[
  term ((25846111438064371185 : Rat) / 2576367455419018) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 107 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0107 : Poly :=
[
  term ((25846111438064371185 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-25846111438064371185 : Rat) / 2576367455419018) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term ((25846111438064371185 : Rat) / 1288183727709509) [(5, 1), (11, 3), (15, 2)],
  term ((-25846111438064371185 : Rat) / 2576367455419018) [(5, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0107_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0107
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0108 : Poly :=
[
  term ((-1848197080 : Rat) / 25734207) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 108 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0108 : Poly :=
[
  term ((-3696394160 : Rat) / 25734207) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((1848197080 : Rat) / 25734207) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0108_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0108
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0109 : Poly :=
[
  term ((15504441826 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 109 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0109 : Poly :=
[
  term ((31008883652 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-15504441826 : Rat) / 8578069) [(5, 1), (10, 2), (15, 1)],
  term ((31008883652 : Rat) / 8578069) [(5, 1), (11, 1), (15, 2)],
  term ((-15504441826 : Rat) / 8578069) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0109_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0109
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0110 : Poly :=
[
  term (-16 : Rat) [(7, 1), (9, 1)]
]

/-- Partial product 110 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0110 : Poly :=
[
  term (-32 : Rat) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term (16 : Rat) [(7, 1), (9, 1), (10, 2)],
  term (-32 : Rat) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term (16 : Rat) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0110_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0110
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0111 : Poly :=
[
  term (192 : Rat) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 111 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0111 : Poly :=
[
  term (384 : Rat) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term (-192 : Rat) [(7, 1), (10, 1), (11, 3)],
  term (384 : Rat) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term (-192 : Rat) [(7, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0111_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0111
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0112 : Poly :=
[
  term ((-4677108545 : Rat) / 8578069) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 112 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0112 : Poly :=
[
  term ((-9354217090 : Rat) / 8578069) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((4677108545 : Rat) / 8578069) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((-9354217090 : Rat) / 8578069) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((4677108545 : Rat) / 8578069) [(7, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0112_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0112
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0113 : Poly :=
[
  term ((-10455649660 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 113 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0113 : Poly :=
[
  term ((-20911299320 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((10455649660 : Rat) / 150171761) [(7, 1), (10, 2), (11, 1)],
  term ((-20911299320 : Rat) / 150171761) [(7, 1), (11, 2), (15, 1)],
  term ((10455649660 : Rat) / 150171761) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0113_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0113
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0114 : Poly :=
[
  term ((-657843200 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 114 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0114 : Poly :=
[
  term ((-1315686400 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((657843200 : Rat) / 150171761) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-1315686400 : Rat) / 150171761) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((657843200 : Rat) / 150171761) [(7, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0114_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0114
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0115 : Poly :=
[
  term ((-31688421416939840 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 115 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0115 : Poly :=
[
  term ((-63376842833879680 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(7, 1), (11, 3), (12, 1), (15, 2)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (11, 4), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0115_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0115
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0116 : Poly :=
[
  term ((4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 116 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0116 : Poly :=
[
  term ((4929846010624472729 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (10, 2), (11, 2), (15, 1)],
  term ((4929846010624472729 : Rat) / 2576367455419018) [(7, 1), (11, 3), (15, 2)],
  term ((-4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0116_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0116
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0117 : Poly :=
[
  term ((-8128303744 : Rat) / 25734207) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 117 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0117 : Poly :=
[
  term ((-16256607488 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-16256607488 : Rat) / 25734207) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((8128303744 : Rat) / 25734207) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0117_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0117
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0118 : Poly :=
[
  term ((12503861191 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 118 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0118 : Poly :=
[
  term ((25007722382 : Rat) / 25734207) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-12503861191 : Rat) / 25734207) [(7, 1), (10, 2), (15, 1)],
  term ((25007722382 : Rat) / 25734207) [(7, 1), (11, 1), (15, 2)],
  term ((-12503861191 : Rat) / 25734207) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0118_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0118
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0119 : Poly :=
[
  term (2 : Rat) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0119 : Poly :=
[
  term (4 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0119_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0119
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0120 : Poly :=
[
  term (-32 : Rat) [(7, 2)]
]

/-- Partial product 120 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0120 : Poly :=
[
  term (-64 : Rat) [(7, 2), (10, 1), (14, 1)],
  term (32 : Rat) [(7, 2), (10, 2)],
  term (-64 : Rat) [(7, 2), (11, 1), (15, 1)],
  term (32 : Rat) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0120_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0120
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0121 : Poly :=
[
  term ((3853613921 : Rat) / 17156138) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 121 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0121 : Poly :=
[
  term ((3853613921 : Rat) / 8578069) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-3853613921 : Rat) / 17156138) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((3853613921 : Rat) / 8578069) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-3853613921 : Rat) / 17156138) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0121_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0121
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0122 : Poly :=
[
  term ((-4576295810 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 122 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0122 : Poly :=
[
  term ((-9152591620 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((4576295810 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)],
  term ((-9152591620 : Rat) / 150171761) [(9, 1), (11, 2), (15, 1)],
  term ((4576295810 : Rat) / 150171761) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0122_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0122
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0123 : Poly :=
[
  term ((-6897119600 : Rat) / 150171761) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 123 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0123 : Poly :=
[
  term ((-13794239200 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((6897119600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-13794239200 : Rat) / 150171761) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((6897119600 : Rat) / 150171761) [(9, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0123_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0123
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0124 : Poly :=
[
  term ((-332235451317024395 : Rat) / 1288183727709509) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 124 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0124 : Poly :=
[
  term ((-664470902634048790 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((332235451317024395 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-664470902634048790 : Rat) / 1288183727709509) [(9, 1), (11, 3), (12, 1), (15, 2)],
  term ((332235451317024395 : Rat) / 1288183727709509) [(9, 1), (11, 4), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0124_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0124
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0125 : Poly :=
[
  term ((-1763527724002997101 : Rat) / 10305469821676072) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 125 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0125 : Poly :=
[
  term ((-1763527724002997101 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((1763527724002997101 : Rat) / 10305469821676072) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((-1763527724002997101 : Rat) / 5152734910838036) [(9, 1), (11, 3), (15, 2)],
  term ((1763527724002997101 : Rat) / 10305469821676072) [(9, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0125_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0125
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0126 : Poly :=
[
  term ((-36873446692 : Rat) / 25734207) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 126 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0126 : Poly :=
[
  term ((-73746893384 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((36873446692 : Rat) / 25734207) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-73746893384 : Rat) / 25734207) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((36873446692 : Rat) / 25734207) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0126_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0126
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0127 : Poly :=
[
  term ((41445103529 : Rat) / 25734207) [(9, 1), (15, 1)]
]

/-- Partial product 127 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0127 : Poly :=
[
  term ((82890207058 : Rat) / 25734207) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-41445103529 : Rat) / 25734207) [(9, 1), (10, 2), (15, 1)],
  term ((82890207058 : Rat) / 25734207) [(9, 1), (11, 1), (15, 2)],
  term ((-41445103529 : Rat) / 25734207) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0127_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0127
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0128 : Poly :=
[
  term (2 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0128 : Poly :=
[
  term (4 : Rat) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0128_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0128
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0129 : Poly :=
[
  term (-80 : Rat) [(9, 2)]
]

/-- Partial product 129 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0129 : Poly :=
[
  term (-160 : Rat) [(9, 2), (10, 1), (14, 1)],
  term (80 : Rat) [(9, 2), (10, 2)],
  term (-160 : Rat) [(9, 2), (11, 1), (15, 1)],
  term (80 : Rat) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0129_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0129
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0130 : Poly :=
[
  term ((2424354301276403968 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 130 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0130 : Poly :=
[
  term ((4848708602552807936 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-2424354301276403968 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((4848708602552807936 : Rat) / 1288183727709509) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2424354301276403968 : Rat) / 1288183727709509) [(10, 3), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0130_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0130
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0131 : Poly :=
[
  term ((-4275980800 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 131 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0131 : Poly :=
[
  term ((-8551961600 : Rat) / 150171761) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((4275980800 : Rat) / 150171761) [(10, 1), (11, 3), (13, 1)],
  term ((-8551961600 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((4275980800 : Rat) / 150171761) [(10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0131_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0131
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0132 : Poly :=
[
  term ((2514218892352681177 : Rat) / 2576367455419018) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 132 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0132 : Poly :=
[
  term ((2514218892352681177 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)],
  term ((-2514218892352681177 : Rat) / 2576367455419018) [(10, 1), (11, 3), (15, 1)],
  term ((2514218892352681177 : Rat) / 1288183727709509) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2514218892352681177 : Rat) / 2576367455419018) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0132_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0132
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0133 : Poly :=
[
  term ((251357853120 : Rat) / 150171761) [(10, 1), (11, 2)]
]

/-- Partial product 133 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0133 : Poly :=
[
  term ((502715706240 : Rat) / 150171761) [(10, 1), (11, 3), (15, 1)],
  term ((-251357853120 : Rat) / 150171761) [(10, 1), (11, 4)],
  term ((502715706240 : Rat) / 150171761) [(10, 2), (11, 2), (14, 1)],
  term ((-251357853120 : Rat) / 150171761) [(10, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0133_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0133
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0134 : Poly :=
[
  term ((3947059200 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1)]
]

/-- Partial product 134 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0134 : Poly :=
[
  term ((7894118400 : Rat) / 150171761) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-3947059200 : Rat) / 150171761) [(10, 1), (11, 4), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1), (14, 1)],
  term ((-3947059200 : Rat) / 150171761) [(10, 3), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0134_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0134
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0135 : Poly :=
[
  term ((-95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 135 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0135 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 3)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 1), (11, 4), (12, 1), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 3), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0135_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0135
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0136 : Poly :=
[
  term ((-205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 136 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0136 : Poly :=
[
  term ((-411949478420217920 : Rat) / 1288183727709509) [(10, 1), (11, 3), (13, 1), (15, 2)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 4), (13, 1), (15, 1)],
  term ((-411949478420217920 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(10, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0136_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0136
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0137 : Poly :=
[
  term ((3327926958362041501 : Rat) / 2576367455419018) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 137 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0137 : Poly :=
[
  term ((3327926958362041501 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 3)],
  term ((-3327926958362041501 : Rat) / 2576367455419018) [(10, 1), (11, 4), (15, 2)],
  term ((3327926958362041501 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 1), (15, 2)],
  term ((-3327926958362041501 : Rat) / 2576367455419018) [(10, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0137_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0137
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0138 : Poly :=
[
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 138 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0138 : Poly :=
[
  term ((380261057003278080 : Rat) / 1288183727709509) [(10, 1), (11, 4), (12, 1), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 5), (12, 1), (15, 1)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 3), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0138_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0138
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0139 : Poly :=
[
  term ((12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 1)]
]

/-- Partial product 139 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0139 : Poly :=
[
  term ((24215903048397632088 : Rat) / 1288183727709509) [(10, 1), (11, 4), (15, 2)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 5), (15, 1)],
  term ((24215903048397632088 : Rat) / 1288183727709509) [(10, 2), (11, 3), (14, 1), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(10, 3), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0139_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0139
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0140 : Poly :=
[
  term ((-8128303744 : Rat) / 8578069) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 140 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0140 : Poly :=
[
  term ((-16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((8128303744 : Rat) / 8578069) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-16256607488 : Rat) / 8578069) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((8128303744 : Rat) / 8578069) [(10, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0140_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0140
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0141 : Poly :=
[
  term ((-52833974336 : Rat) / 25734207) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 141 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0141 : Poly :=
[
  term ((-105667948672 : Rat) / 25734207) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((52833974336 : Rat) / 25734207) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-105667948672 : Rat) / 25734207) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((52833974336 : Rat) / 25734207) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0141_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0141
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0142 : Poly :=
[
  term ((78787818253 : Rat) / 102936828) [(10, 1), (15, 2)]
]

/-- Partial product 142 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0142 : Poly :=
[
  term ((78787818253 : Rat) / 51468414) [(10, 1), (11, 1), (15, 3)],
  term ((-78787818253 : Rat) / 102936828) [(10, 1), (11, 2), (15, 2)],
  term ((78787818253 : Rat) / 51468414) [(10, 2), (14, 1), (15, 2)],
  term ((-78787818253 : Rat) / 102936828) [(10, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0142_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0142
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0143 : Poly :=
[
  term ((-1077601496537606368 : Rat) / 1288183727709509) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 143 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0143 : Poly :=
[
  term ((-2155202993075212736 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1077601496537606368 : Rat) / 1288183727709509) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2155202993075212736 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)],
  term ((1077601496537606368 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0143_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0143
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0144 : Poly :=
[
  term ((-286783591200 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 144 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0144 : Poly :=
[
  term ((-573567182400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((286783591200 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1)],
  term ((-573567182400 : Rat) / 150171761) [(11, 2), (13, 1), (15, 1)],
  term ((286783591200 : Rat) / 150171761) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0144_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0144
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0145 : Poly :=
[
  term ((146701653600 : Rat) / 150171761) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 145 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0145 : Poly :=
[
  term ((293403307200 : Rat) / 150171761) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((293403307200 : Rat) / 150171761) [(11, 2), (14, 1), (15, 2)],
  term ((-146701653600 : Rat) / 150171761) [(11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0145_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0145
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0146 : Poly :=
[
  term ((-34064573557248376393 : Rat) / 30916409465028216) [(11, 1), (15, 1)]
]

/-- Partial product 146 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0146 : Poly :=
[
  term ((-34064573557248376393 : Rat) / 15458204732514108) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((34064573557248376393 : Rat) / 30916409465028216) [(10, 2), (11, 1), (15, 1)],
  term ((-34064573557248376393 : Rat) / 15458204732514108) [(11, 2), (15, 2)],
  term ((34064573557248376393 : Rat) / 30916409465028216) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0146_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0146
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0147 : Poly :=
[
  term ((-897772100 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 147 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0147 : Poly :=
[
  term ((-1795544200 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1)],
  term ((897772100 : Rat) / 150171761) [(10, 2), (11, 2)],
  term ((-1795544200 : Rat) / 150171761) [(11, 3), (15, 1)],
  term ((897772100 : Rat) / 150171761) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0147_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0147
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0148 : Poly :=
[
  term ((-3947059200 : Rat) / 150171761) [(11, 2), (12, 1)]
]

/-- Partial product 148 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0148 : Poly :=
[
  term ((-7894118400 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((3947059200 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1)],
  term ((-7894118400 : Rat) / 150171761) [(11, 3), (12, 1), (15, 1)],
  term ((3947059200 : Rat) / 150171761) [(11, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0148_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0148
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0149 : Poly :=
[
  term ((7657759963499603250 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 149 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0149 : Poly :=
[
  term ((15315519926999206500 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-7657759963499603250 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)],
  term ((15315519926999206500 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 3)],
  term ((-7657759963499603250 : Rat) / 1288183727709509) [(11, 4), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0149_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0149
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0150 : Poly :=
[
  term ((-13814415492033663690 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 150 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0150 : Poly :=
[
  term ((-27628830984067327380 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((13814415492033663690 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((-27628830984067327380 : Rat) / 1288183727709509) [(11, 3), (13, 1), (15, 2)],
  term ((13814415492033663690 : Rat) / 1288183727709509) [(11, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0150_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0150
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0151 : Poly :=
[
  term ((7066644181833497070 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 151 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0151 : Poly :=
[
  term ((14133288363666994140 : Rat) / 1288183727709509) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(10, 2), (11, 2), (14, 1), (15, 2)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(11, 3), (14, 1), (15, 3)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(11, 4), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0151_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0151
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0152 : Poly :=
[
  term ((-127043964573807927531 : Rat) / 10305469821676072) [(11, 2), (15, 2)]
]

/-- Partial product 152 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0152 : Poly :=
[
  term ((-127043964573807927531 : Rat) / 5152734910838036) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((127043964573807927531 : Rat) / 10305469821676072) [(10, 2), (11, 2), (15, 2)],
  term ((-127043964573807927531 : Rat) / 5152734910838036) [(11, 3), (15, 3)],
  term ((127043964573807927531 : Rat) / 10305469821676072) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0152_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0152
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0153 : Poly :=
[
  term ((-190130528501639040 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)]
]

/-- Partial product 153 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0153 : Poly :=
[
  term ((-380261057003278080 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (15, 1)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(11, 4), (12, 1), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(11, 5), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0153_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0153
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0154 : Poly :=
[
  term ((-172983353122270205 : Rat) / 5152734910838036) [(11, 3), (15, 1)]
]

/-- Partial product 154 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0154 : Poly :=
[
  term ((-172983353122270205 : Rat) / 2576367455419018) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((172983353122270205 : Rat) / 5152734910838036) [(10, 2), (11, 3), (15, 1)],
  term ((-172983353122270205 : Rat) / 2576367455419018) [(11, 4), (15, 2)],
  term ((172983353122270205 : Rat) / 5152734910838036) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0154_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0154
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0155 : Poly :=
[
  term ((22317987720 : Rat) / 8578069) [(12, 1), (15, 2)]
]

/-- Partial product 155 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0155 : Poly :=
[
  term ((44635975440 : Rat) / 8578069) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-22317987720 : Rat) / 8578069) [(10, 2), (12, 1), (15, 2)],
  term ((44635975440 : Rat) / 8578069) [(11, 1), (12, 1), (15, 3)],
  term ((-22317987720 : Rat) / 8578069) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0155_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0155
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0156 : Poly :=
[
  term ((-40616257528 : Rat) / 8578069) [(13, 1), (15, 1)]
]

/-- Partial product 156 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0156 : Poly :=
[
  term ((-81232515056 : Rat) / 8578069) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((40616257528 : Rat) / 8578069) [(10, 2), (13, 1), (15, 1)],
  term ((-81232515056 : Rat) / 8578069) [(11, 1), (13, 1), (15, 2)],
  term ((40616257528 : Rat) / 8578069) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0156_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0156
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0157 : Poly :=
[
  term ((822900664 : Rat) / 8578069) [(14, 1), (15, 2)]
]

/-- Partial product 157 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0157 : Poly :=
[
  term ((1645801328 : Rat) / 8578069) [(10, 1), (14, 2), (15, 2)],
  term ((-822900664 : Rat) / 8578069) [(10, 2), (14, 1), (15, 2)],
  term ((1645801328 : Rat) / 8578069) [(11, 1), (14, 1), (15, 3)],
  term ((-822900664 : Rat) / 8578069) [(11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0157_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0157
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 29. -/
def rs_R013_ueqv_R013YNNN_coefficient_29_0158 : Poly :=
[
  term ((-22844743564 : Rat) / 8578069) [(15, 2)]
]

/-- Partial product 158 for generator 29. -/
def rs_R013_ueqv_R013YNNN_partial_29_0158 : Poly :=
[
  term ((-45689487128 : Rat) / 8578069) [(10, 1), (14, 1), (15, 2)],
  term ((22844743564 : Rat) / 8578069) [(10, 2), (15, 2)],
  term ((-45689487128 : Rat) / 8578069) [(11, 1), (15, 3)],
  term ((22844743564 : Rat) / 8578069) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 29. -/
theorem rs_R013_ueqv_R013YNNN_partial_29_0158_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_29_0158
        rs_R013_ueqv_R013YNNN_generator_29_0100_0158 =
      rs_R013_ueqv_R013YNNN_partial_29_0158 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_29_0100_0158 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_29_0100,
  rs_R013_ueqv_R013YNNN_partial_29_0101,
  rs_R013_ueqv_R013YNNN_partial_29_0102,
  rs_R013_ueqv_R013YNNN_partial_29_0103,
  rs_R013_ueqv_R013YNNN_partial_29_0104,
  rs_R013_ueqv_R013YNNN_partial_29_0105,
  rs_R013_ueqv_R013YNNN_partial_29_0106,
  rs_R013_ueqv_R013YNNN_partial_29_0107,
  rs_R013_ueqv_R013YNNN_partial_29_0108,
  rs_R013_ueqv_R013YNNN_partial_29_0109,
  rs_R013_ueqv_R013YNNN_partial_29_0110,
  rs_R013_ueqv_R013YNNN_partial_29_0111,
  rs_R013_ueqv_R013YNNN_partial_29_0112,
  rs_R013_ueqv_R013YNNN_partial_29_0113,
  rs_R013_ueqv_R013YNNN_partial_29_0114,
  rs_R013_ueqv_R013YNNN_partial_29_0115,
  rs_R013_ueqv_R013YNNN_partial_29_0116,
  rs_R013_ueqv_R013YNNN_partial_29_0117,
  rs_R013_ueqv_R013YNNN_partial_29_0118,
  rs_R013_ueqv_R013YNNN_partial_29_0119,
  rs_R013_ueqv_R013YNNN_partial_29_0120,
  rs_R013_ueqv_R013YNNN_partial_29_0121,
  rs_R013_ueqv_R013YNNN_partial_29_0122,
  rs_R013_ueqv_R013YNNN_partial_29_0123,
  rs_R013_ueqv_R013YNNN_partial_29_0124,
  rs_R013_ueqv_R013YNNN_partial_29_0125,
  rs_R013_ueqv_R013YNNN_partial_29_0126,
  rs_R013_ueqv_R013YNNN_partial_29_0127,
  rs_R013_ueqv_R013YNNN_partial_29_0128,
  rs_R013_ueqv_R013YNNN_partial_29_0129,
  rs_R013_ueqv_R013YNNN_partial_29_0130,
  rs_R013_ueqv_R013YNNN_partial_29_0131,
  rs_R013_ueqv_R013YNNN_partial_29_0132,
  rs_R013_ueqv_R013YNNN_partial_29_0133,
  rs_R013_ueqv_R013YNNN_partial_29_0134,
  rs_R013_ueqv_R013YNNN_partial_29_0135,
  rs_R013_ueqv_R013YNNN_partial_29_0136,
  rs_R013_ueqv_R013YNNN_partial_29_0137,
  rs_R013_ueqv_R013YNNN_partial_29_0138,
  rs_R013_ueqv_R013YNNN_partial_29_0139,
  rs_R013_ueqv_R013YNNN_partial_29_0140,
  rs_R013_ueqv_R013YNNN_partial_29_0141,
  rs_R013_ueqv_R013YNNN_partial_29_0142,
  rs_R013_ueqv_R013YNNN_partial_29_0143,
  rs_R013_ueqv_R013YNNN_partial_29_0144,
  rs_R013_ueqv_R013YNNN_partial_29_0145,
  rs_R013_ueqv_R013YNNN_partial_29_0146,
  rs_R013_ueqv_R013YNNN_partial_29_0147,
  rs_R013_ueqv_R013YNNN_partial_29_0148,
  rs_R013_ueqv_R013YNNN_partial_29_0149,
  rs_R013_ueqv_R013YNNN_partial_29_0150,
  rs_R013_ueqv_R013YNNN_partial_29_0151,
  rs_R013_ueqv_R013YNNN_partial_29_0152,
  rs_R013_ueqv_R013YNNN_partial_29_0153,
  rs_R013_ueqv_R013YNNN_partial_29_0154,
  rs_R013_ueqv_R013YNNN_partial_29_0155,
  rs_R013_ueqv_R013YNNN_partial_29_0156,
  rs_R013_ueqv_R013YNNN_partial_29_0157,
  rs_R013_ueqv_R013YNNN_partial_29_0158
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_29_0100_0158 : Poly :=
[
  term ((326728968 : Rat) / 8578069) [(4, 1), (10, 1), (14, 1), (15, 2)],
  term ((-163364484 : Rat) / 8578069) [(4, 1), (10, 2), (15, 2)],
  term ((326728968 : Rat) / 8578069) [(4, 1), (11, 1), (15, 3)],
  term ((-163364484 : Rat) / 8578069) [(4, 1), (11, 2), (15, 2)],
  term ((-42153352000 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((536558398800 : Rat) / 150171761) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((2075935712 : Rat) / 8578069) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((25846111438064371185 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2269652977911311216 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((123208353600 : Rat) / 150171761) [(5, 1), (10, 1), (11, 3)],
  term ((-11869935665411261640 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 3), (15, 2)],
  term ((5934967832705630820 : Rat) / 1288183727709509) [(5, 1), (10, 1), (11, 4), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((31008883652 : Rat) / 8578069) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-268279199400 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1)],
  term ((21076676000 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (12, 1)],
  term ((-246416707200 : Rat) / 150171761) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-11869935665411261640 : Rat) / 1288183727709509) [(5, 1), (10, 2), (11, 2), (14, 1), (15, 1)],
  term ((-25846111438064371185 : Rat) / 2576367455419018) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term ((1848197080 : Rat) / 25734207) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((2075935712 : Rat) / 8578069) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((-15504441826 : Rat) / 8578069) [(5, 1), (10, 2), (15, 1)],
  term ((123208353600 : Rat) / 150171761) [(5, 1), (10, 3), (11, 1)],
  term ((5934967832705630820 : Rat) / 1288183727709509) [(5, 1), (10, 3), (11, 2), (15, 1)],
  term ((-1037967856 : Rat) / 8578069) [(5, 1), (10, 3), (15, 1)],
  term ((-3696394160 : Rat) / 25734207) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((31008883652 : Rat) / 8578069) [(5, 1), (11, 1), (15, 2)],
  term ((-807236075933206120 : Rat) / 3864551183128527) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((2274305635103441614 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)],
  term ((-268279199400 : Rat) / 150171761) [(5, 1), (11, 3)],
  term ((21076676000 : Rat) / 150171761) [(5, 1), (11, 3), (12, 1)],
  term ((-2030534301050164900 : Rat) / 1288183727709509) [(5, 1), (11, 3), (12, 1), (15, 2)],
  term ((25846111438064371185 : Rat) / 1288183727709509) [(5, 1), (11, 3), (15, 2)],
  term ((1015267150525082450 : Rat) / 1288183727709509) [(5, 1), (11, 4), (12, 1), (15, 1)],
  term ((-25846111438064371185 : Rat) / 2576367455419018) [(5, 1), (11, 4), (15, 1)],
  term (-32 : Rat) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term (16 : Rat) [(7, 1), (9, 1), (10, 2)],
  term (-32 : Rat) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term (16 : Rat) [(7, 1), (9, 1), (11, 2)],
  term ((-1315686400 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-20911299320 : Rat) / 150171761) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-9354217090 : Rat) / 8578069) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(7, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((4929846010624472729 : Rat) / 2576367455419018) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((7971087041 : Rat) / 8578069) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term (-192 : Rat) [(7, 1), (10, 1), (11, 3)],
  term ((-16256607488 : Rat) / 25734207) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((25007722382 : Rat) / 25734207) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10455649660 : Rat) / 150171761) [(7, 1), (10, 2), (11, 1)],
  term ((657843200 : Rat) / 150171761) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term (384 : Rat) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((-4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (10, 2), (11, 2), (15, 1)],
  term ((8128303744 : Rat) / 25734207) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-9354217090 : Rat) / 8578069) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((-12503861191 : Rat) / 25734207) [(7, 1), (10, 2), (15, 1)],
  term (-2 : Rat) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term (-192 : Rat) [(7, 1), (10, 3), (11, 1)],
  term ((4677108545 : Rat) / 8578069) [(7, 1), (10, 3), (15, 1)],
  term ((-16256607488 : Rat) / 25734207) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((25007722382 : Rat) / 25734207) [(7, 1), (11, 1), (15, 2)],
  term (4 : Rat) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1186783541014688384 : Rat) / 3864551183128527) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-2415862559691866591 : Rat) / 3864551183128527) [(7, 1), (11, 2), (15, 1)],
  term (-2 : Rat) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((10455649660 : Rat) / 150171761) [(7, 1), (11, 3)],
  term ((657843200 : Rat) / 150171761) [(7, 1), (11, 3), (12, 1)],
  term ((-63376842833879680 : Rat) / 1288183727709509) [(7, 1), (11, 3), (12, 1), (15, 2)],
  term ((4929846010624472729 : Rat) / 2576367455419018) [(7, 1), (11, 3), (15, 2)],
  term ((31688421416939840 : Rat) / 1288183727709509) [(7, 1), (11, 4), (12, 1), (15, 1)],
  term ((-4929846010624472729 : Rat) / 5152734910838036) [(7, 1), (11, 4), (15, 1)],
  term (-64 : Rat) [(7, 2), (10, 1), (14, 1)],
  term (32 : Rat) [(7, 2), (10, 2)],
  term (-64 : Rat) [(7, 2), (11, 1), (15, 1)],
  term (32 : Rat) [(7, 2), (11, 2)],
  term ((-13794239200 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9152591620 : Rat) / 150171761) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((3853613921 : Rat) / 8578069) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-664470902634048790 : Rat) / 1288183727709509) [(9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1763527724002997101 : Rat) / 5152734910838036) [(9, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-3853613921 : Rat) / 17156138) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-73746893384 : Rat) / 25734207) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((82890207058 : Rat) / 25734207) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term (4 : Rat) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((4576295810 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1)],
  term ((6897119600 : Rat) / 150171761) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((332235451317024395 : Rat) / 1288183727709509) [(9, 1), (10, 2), (11, 2), (12, 1), (15, 1)],
  term ((1763527724002997101 : Rat) / 10305469821676072) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((36873446692 : Rat) / 25734207) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((3853613921 : Rat) / 8578069) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-41445103529 : Rat) / 25734207) [(9, 1), (10, 2), (15, 1)],
  term (-2 : Rat) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3853613921 : Rat) / 17156138) [(9, 1), (10, 3), (15, 1)],
  term ((-73746893384 : Rat) / 25734207) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((82890207058 : Rat) / 25734207) [(9, 1), (11, 1), (15, 2)],
  term (4 : Rat) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((5182366616896950212 : Rat) / 3864551183128527) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6459418869112789909 : Rat) / 3864551183128527) [(9, 1), (11, 2), (15, 1)],
  term (-2 : Rat) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((4576295810 : Rat) / 150171761) [(9, 1), (11, 3)],
  term ((6897119600 : Rat) / 150171761) [(9, 1), (11, 3), (12, 1)],
  term ((-664470902634048790 : Rat) / 1288183727709509) [(9, 1), (11, 3), (12, 1), (15, 2)],
  term ((-1763527724002997101 : Rat) / 5152734910838036) [(9, 1), (11, 3), (15, 2)],
  term ((332235451317024395 : Rat) / 1288183727709509) [(9, 1), (11, 4), (12, 1), (15, 1)],
  term ((1763527724002997101 : Rat) / 10305469821676072) [(9, 1), (11, 4), (15, 1)],
  term (-160 : Rat) [(9, 2), (10, 1), (14, 1)],
  term (80 : Rat) [(9, 2), (10, 2)],
  term (-160 : Rat) [(9, 2), (11, 1), (15, 1)],
  term (80 : Rat) [(9, 2), (11, 2)],
  term ((-2155202993075212736 : Rat) / 1288183727709509) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-573567182400 : Rat) / 150171761) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-105667948672 : Rat) / 25734207) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-34064573557248376393 : Rat) / 15458204732514108) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((293403307200 : Rat) / 150171761) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((78787818253 : Rat) / 51468414) [(10, 1), (11, 1), (15, 3)],
  term ((-7894118400 : Rat) / 150171761) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((15315519926999206500 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((6069350289732181120 : Rat) / 1288183727709509) [(10, 1), (11, 2), (12, 1), (15, 2)],
  term ((-27628830984067327380 : Rat) / 1288183727709509) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((7714093016595474496 : Rat) / 3864551183128527) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1795544200 : Rat) / 150171761) [(10, 1), (11, 2), (14, 1)],
  term ((-127043964573807927531 : Rat) / 5152734910838036) [(10, 1), (11, 2), (14, 1), (15, 2)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(10, 1), (11, 2), (14, 2), (15, 2)],
  term ((18338921295831220591 : Rat) / 15458204732514108) [(10, 1), (11, 2), (15, 2)],
  term ((-380261057003278080 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-2356638008947034368 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 3), (12, 1), (15, 3)],
  term ((4275980800 : Rat) / 150171761) [(10, 1), (11, 3), (13, 1)],
  term ((-411949478420217920 : Rat) / 1288183727709509) [(10, 1), (11, 3), (13, 1), (15, 2)],
  term ((-172983353122270205 : Rat) / 2576367455419018) [(10, 1), (11, 3), (14, 1), (15, 1)],
  term ((6110441138668219943 : Rat) / 2576367455419018) [(10, 1), (11, 3), (15, 1)],
  term ((3327926958362041501 : Rat) / 1288183727709509) [(10, 1), (11, 3), (15, 3)],
  term ((-251357853120 : Rat) / 150171761) [(10, 1), (11, 4)],
  term ((-3947059200 : Rat) / 150171761) [(10, 1), (11, 4), (12, 1)],
  term ((475326321254097600 : Rat) / 1288183727709509) [(10, 1), (11, 4), (12, 1), (15, 2)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(10, 1), (11, 4), (13, 1), (15, 1)],
  term ((45103879138433222675 : Rat) / 2576367455419018) [(10, 1), (11, 4), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 1), (11, 5), (12, 1), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(10, 1), (11, 5), (15, 1)],
  term ((44635975440 : Rat) / 8578069) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-81232515056 : Rat) / 8578069) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-45689487128 : Rat) / 8578069) [(10, 1), (14, 1), (15, 2)],
  term ((1645801328 : Rat) / 8578069) [(10, 1), (14, 2), (15, 2)],
  term ((4848708602552807936 : Rat) / 1288183727709509) [(10, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1077601496537606368 : Rat) / 1288183727709509) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((286783591200 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1)],
  term ((-8551961600 : Rat) / 150171761) [(10, 2), (11, 1), (13, 1), (14, 1)],
  term ((54600086319903599 : Rat) / 56007988161283) [(10, 2), (11, 1), (14, 1), (15, 1)],
  term ((34064573557248376393 : Rat) / 30916409465028216) [(10, 2), (11, 1), (15, 1)],
  term ((897772100 : Rat) / 150171761) [(10, 2), (11, 2)],
  term ((3947059200 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1)],
  term ((7894118400 : Rat) / 150171761) [(10, 2), (11, 2), (12, 1), (14, 1)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-7657759963499603250 : Rat) / 1288183727709509) [(10, 2), (11, 2), (12, 1), (15, 2)],
  term ((-411949478420217920 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((13814415492033663690 : Rat) / 1288183727709509) [(10, 2), (11, 2), (13, 1), (15, 1)],
  term ((502715706240 : Rat) / 150171761) [(10, 2), (11, 2), (14, 1)],
  term ((-162552922759628503 : Rat) / 56007988161283) [(10, 2), (11, 2), (14, 1), (15, 2)],
  term ((127043964573807927531 : Rat) / 10305469821676072) [(10, 2), (11, 2), (15, 2)],
  term ((380261057003278080 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (14, 1), (15, 1)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(10, 2), (11, 3), (12, 1), (15, 1)],
  term ((24215903048397632088 : Rat) / 1288183727709509) [(10, 2), (11, 3), (14, 1), (15, 1)],
  term ((172983353122270205 : Rat) / 5152734910838036) [(10, 2), (11, 3), (15, 1)],
  term ((-16256607488 : Rat) / 8578069) [(10, 2), (12, 1), (14, 1), (15, 2)],
  term ((-22317987720 : Rat) / 8578069) [(10, 2), (12, 1), (15, 2)],
  term ((-105667948672 : Rat) / 25734207) [(10, 2), (13, 1), (14, 1), (15, 1)],
  term ((40616257528 : Rat) / 8578069) [(10, 2), (13, 1), (15, 1)],
  term ((73850414269 : Rat) / 51468414) [(10, 2), (14, 1), (15, 2)],
  term ((22844743564 : Rat) / 8578069) [(10, 2), (15, 2)],
  term ((-2424354301276403968 : Rat) / 1288183727709509) [(10, 3), (11, 1), (12, 1), (15, 1)],
  term ((4275980800 : Rat) / 150171761) [(10, 3), (11, 1), (13, 1)],
  term ((-2514218892352681177 : Rat) / 2576367455419018) [(10, 3), (11, 1), (15, 1)],
  term ((-251357853120 : Rat) / 150171761) [(10, 3), (11, 2)],
  term ((-3947059200 : Rat) / 150171761) [(10, 3), (11, 2), (12, 1)],
  term ((95065264250819520 : Rat) / 1288183727709509) [(10, 3), (11, 2), (12, 1), (15, 2)],
  term ((205974739210108960 : Rat) / 1288183727709509) [(10, 3), (11, 2), (13, 1), (15, 1)],
  term ((-3327926958362041501 : Rat) / 2576367455419018) [(10, 3), (11, 2), (15, 2)],
  term ((-190130528501639040 : Rat) / 1288183727709509) [(10, 3), (11, 3), (12, 1), (15, 1)],
  term ((-12107951524198816044 : Rat) / 1288183727709509) [(10, 3), (11, 3), (15, 1)],
  term ((8128303744 : Rat) / 8578069) [(10, 3), (12, 1), (15, 2)],
  term ((52833974336 : Rat) / 25734207) [(10, 3), (13, 1), (15, 1)],
  term ((-78787818253 : Rat) / 102936828) [(10, 3), (15, 2)],
  term ((44635975440 : Rat) / 8578069) [(11, 1), (12, 1), (15, 3)],
  term ((-81232515056 : Rat) / 8578069) [(11, 1), (13, 1), (15, 2)],
  term ((1645801328 : Rat) / 8578069) [(11, 1), (14, 1), (15, 3)],
  term ((-45689487128 : Rat) / 8578069) [(11, 1), (15, 3)],
  term ((-5506734510963987656 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)],
  term ((1179316051446481208 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)],
  term ((2393257372148847496 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)],
  term ((7103050889943178055 : Rat) / 15458204732514108) [(11, 2), (15, 2)],
  term ((1009885204208236768 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 1)],
  term ((15315519926999206500 : Rat) / 1288183727709509) [(11, 3), (12, 1), (15, 3)],
  term ((286783591200 : Rat) / 150171761) [(11, 3), (13, 1)],
  term ((-27628830984067327380 : Rat) / 1288183727709509) [(11, 3), (13, 1), (15, 2)],
  term ((-146701653600 : Rat) / 150171761) [(11, 3), (14, 1), (15, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(11, 3), (14, 1), (15, 3)],
  term ((33694918308284781193 : Rat) / 30916409465028216) [(11, 3), (15, 1)],
  term ((-127043964573807927531 : Rat) / 5152734910838036) [(11, 3), (15, 3)],
  term ((897772100 : Rat) / 150171761) [(11, 4)],
  term ((3947059200 : Rat) / 150171761) [(11, 4), (12, 1)],
  term ((-8038021020502881330 : Rat) / 1288183727709509) [(11, 4), (12, 1), (15, 2)],
  term ((13814415492033663690 : Rat) / 1288183727709509) [(11, 4), (13, 1), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(11, 4), (14, 1), (15, 2)],
  term ((126352031161318846711 : Rat) / 10305469821676072) [(11, 4), (15, 2)],
  term ((190130528501639040 : Rat) / 1288183727709509) [(11, 5), (12, 1), (15, 1)],
  term ((172983353122270205 : Rat) / 5152734910838036) [(11, 5), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 100 through 158. -/
theorem rs_R013_ueqv_R013YNNN_block_29_0100_0158_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_29_0100_0158
      rs_R013_ueqv_R013YNNN_block_29_0100_0158 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
