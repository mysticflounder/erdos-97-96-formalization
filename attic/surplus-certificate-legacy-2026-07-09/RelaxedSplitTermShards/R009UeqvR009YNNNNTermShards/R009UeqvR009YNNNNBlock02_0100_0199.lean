/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 2:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0100 : Poly :=
[
  term ((6163114192678721 : Rat) / 17406427571064) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 100 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0100 : Poly :=
[
  term ((6163114192678721 : Rat) / 17406427571064) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((6163114192678721 : Rat) / 17406427571064) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-6163114192678721 : Rat) / 17406427571064) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-6163114192678721 : Rat) / 17406427571064) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0100
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0101 : Poly :=
[
  term ((437 : Rat) / 28) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0101 : Poly :=
[
  term ((437 : Rat) / 28) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((437 : Rat) / 28) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-437 : Rat) / 28) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-437 : Rat) / 28) [(2, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0101
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0102 : Poly :=
[
  term ((89856 : Rat) / 553) [(2, 1), (11, 2)]
]

/-- Partial product 102 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0102 : Poly :=
[
  term ((89856 : Rat) / 553) [(0, 2), (2, 1), (11, 2)],
  term ((89856 : Rat) / 553) [(1, 2), (2, 1), (11, 2)],
  term ((-89856 : Rat) / 553) [(2, 1), (10, 2), (11, 2)],
  term ((-89856 : Rat) / 553) [(2, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0102
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0103 : Poly :=
[
  term ((-42643465442869 : Rat) / 43497944784) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 103 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0103 : Poly :=
[
  term ((-42643465442869 : Rat) / 43497944784) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-42643465442869 : Rat) / 43497944784) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((42643465442869 : Rat) / 43497944784) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((42643465442869 : Rat) / 43497944784) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0103
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0104 : Poly :=
[
  term ((8425 : Rat) / 168) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0104 : Poly :=
[
  term ((8425 : Rat) / 168) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((8425 : Rat) / 168) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8425 : Rat) / 168) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8425 : Rat) / 168) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0104
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0105 : Poly :=
[
  term ((7050139276131881 : Rat) / 17406427571064) [(2, 1), (14, 1)]
]

/-- Partial product 105 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0105 : Poly :=
[
  term ((7050139276131881 : Rat) / 17406427571064) [(0, 2), (2, 1), (14, 1)],
  term ((7050139276131881 : Rat) / 17406427571064) [(1, 2), (2, 1), (14, 1)],
  term ((-7050139276131881 : Rat) / 17406427571064) [(2, 1), (10, 2), (14, 1)],
  term ((-7050139276131881 : Rat) / 17406427571064) [(2, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0105
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0106 : Poly :=
[
  term ((25638893142626375 : Rat) / 26109641356596) [(2, 1), (15, 2)]
]

/-- Partial product 106 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0106 : Poly :=
[
  term ((25638893142626375 : Rat) / 26109641356596) [(0, 2), (2, 1), (15, 2)],
  term ((25638893142626375 : Rat) / 26109641356596) [(1, 2), (2, 1), (15, 2)],
  term ((-25638893142626375 : Rat) / 26109641356596) [(2, 1), (10, 2), (15, 2)],
  term ((-25638893142626375 : Rat) / 26109641356596) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0106
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0107 : Poly :=
[
  term ((-247 : Rat) / 6) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0107 : Poly :=
[
  term ((-247 : Rat) / 6) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 6) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 6) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((247 : Rat) / 6) [(2, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0107
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0108 : Poly :=
[
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2)]
]

/-- Partial product 108 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0108 : Poly :=
[
  term ((1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 2)],
  term ((1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 2)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2), (10, 2)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0108
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0109 : Poly :=
[
  term ((-1239549624292481 : Rat) / 2175803446383) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 109 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0109 : Poly :=
[
  term ((-1239549624292481 : Rat) / 2175803446383) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 1), (6, 1), (7, 1), (10, 2)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 1), (6, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0109
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0110 : Poly :=
[
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 110 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0110 : Poly :=
[
  term ((-6788130415625 : Rat) / 6744934476) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (10, 2)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0110_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0110
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0111 : Poly :=
[
  term ((113897227093955111 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 111 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0111 : Poly :=
[
  term ((113897227093955111 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((113897227093955111 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-113897227093955111 : Rat) / 78328924069788) [(3, 1), (6, 1), (10, 2), (11, 1)],
  term ((-113897227093955111 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0111_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0111
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0112 : Poly :=
[
  term ((48487526969875909 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 112 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0112 : Poly :=
[
  term ((48487526969875909 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((48487526969875909 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-48487526969875909 : Rat) / 78328924069788) [(3, 1), (6, 1), (10, 2), (13, 1)],
  term ((-48487526969875909 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0112_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0112
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0113 : Poly :=
[
  term ((85 : Rat) / 21) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 113 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0113 : Poly :=
[
  term ((85 : Rat) / 21) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 21) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (6, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0113_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0113
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0114 : Poly :=
[
  term ((-4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 114 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0114 : Poly :=
[
  term ((-4315988293470491 : Rat) / 2175803446383) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-4315988293470491 : Rat) / 2175803446383) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (10, 2), (15, 1)],
  term ((4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0114_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0114
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0115 : Poly :=
[
  term ((-16 : Rat) / 3) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0115 : Poly :=
[
  term ((-16 : Rat) / 3) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0115_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0115
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0116 : Poly :=
[
  term ((-59755791529551 : Rat) / 107447083772) [(3, 1), (7, 1)]
]

/-- Partial product 116 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0116 : Poly :=
[
  term ((-59755791529551 : Rat) / 107447083772) [(0, 2), (3, 1), (7, 1)],
  term ((-59755791529551 : Rat) / 107447083772) [(1, 2), (3, 1), (7, 1)],
  term ((59755791529551 : Rat) / 107447083772) [(3, 1), (7, 1), (10, 2)],
  term ((59755791529551 : Rat) / 107447083772) [(3, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0116_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0116
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0117 : Poly :=
[
  term ((60472291253842177 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 117 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0117 : Poly :=
[
  term ((60472291253842177 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((60472291253842177 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-60472291253842177 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((-60472291253842177 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0117_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0117
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0118 : Poly :=
[
  term ((254345163946294 : Rat) / 2175803446383) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 118 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0118 : Poly :=
[
  term ((254345163946294 : Rat) / 2175803446383) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((254345163946294 : Rat) / 2175803446383) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-254345163946294 : Rat) / 2175803446383) [(3, 1), (7, 1), (10, 2), (14, 1)],
  term ((-254345163946294 : Rat) / 2175803446383) [(3, 1), (7, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0118_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0118
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0119 : Poly :=
[
  term ((3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 119 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0119 : Poly :=
[
  term ((3282196818563 : Rat) / 3996998208) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((3282196818563 : Rat) / 3996998208) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((-3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0119_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0119
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0120 : Poly :=
[
  term ((-1031795823175 : Rat) / 1101213792) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 120 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0120 : Poly :=
[
  term ((-1031795823175 : Rat) / 1101213792) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-1031795823175 : Rat) / 1101213792) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((1031795823175 : Rat) / 1101213792) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term ((1031795823175 : Rat) / 1101213792) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0120_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0120
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0121 : Poly :=
[
  term ((-89856 : Rat) / 553) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 121 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0121 : Poly :=
[
  term ((-89856 : Rat) / 553) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-89856 : Rat) / 553) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((89856 : Rat) / 553) [(3, 1), (10, 1), (11, 3)],
  term ((89856 : Rat) / 553) [(3, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0121_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0121
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0122 : Poly :=
[
  term ((-135756748565609 : Rat) / 157881429216) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 122 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0122 : Poly :=
[
  term ((-135756748565609 : Rat) / 157881429216) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-135756748565609 : Rat) / 157881429216) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((135756748565609 : Rat) / 157881429216) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term ((135756748565609 : Rat) / 157881429216) [(3, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0122_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0122
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0123 : Poly :=
[
  term ((2245 : Rat) / 112) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0123 : Poly :=
[
  term ((2245 : Rat) / 112) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((2245 : Rat) / 112) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2245 : Rat) / 112) [(3, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2245 : Rat) / 112) [(3, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0123_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0123
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0124 : Poly :=
[
  term ((106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 124 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0124 : Poly :=
[
  term ((106920059393860357 : Rat) / 156657848139576) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((106920059393860357 : Rat) / 156657848139576) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0124_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0124
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0125 : Poly :=
[
  term ((-437 : Rat) / 28) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0125 : Poly :=
[
  term ((-437 : Rat) / 28) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-437 : Rat) / 28) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((437 : Rat) / 28) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((437 : Rat) / 28) [(3, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0125_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0125
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0126 : Poly :=
[
  term ((395910373848515 : Rat) / 4351606892766) [(3, 1), (11, 1)]
]

/-- Partial product 126 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0126 : Poly :=
[
  term ((395910373848515 : Rat) / 4351606892766) [(0, 2), (3, 1), (11, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(1, 2), (3, 1), (11, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(3, 1), (10, 2), (11, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(3, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0126_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0126
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0127 : Poly :=
[
  term ((-81194043563984423 : Rat) / 78328924069788) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 127 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0127 : Poly :=
[
  term ((-81194043563984423 : Rat) / 78328924069788) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-81194043563984423 : Rat) / 78328924069788) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((81194043563984423 : Rat) / 78328924069788) [(3, 1), (10, 2), (11, 1), (14, 1)],
  term ((81194043563984423 : Rat) / 78328924069788) [(3, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0127_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0127
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0128 : Poly :=
[
  term ((442939868145011507 : Rat) / 313315696279152) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 128 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0128 : Poly :=
[
  term ((442939868145011507 : Rat) / 313315696279152) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((442939868145011507 : Rat) / 313315696279152) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-442939868145011507 : Rat) / 313315696279152) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((-442939868145011507 : Rat) / 313315696279152) [(3, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0128_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0128
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0129 : Poly :=
[
  term ((-8425 : Rat) / 168) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 129 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0129 : Poly :=
[
  term ((-8425 : Rat) / 168) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8425 : Rat) / 168) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((8425 : Rat) / 168) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((8425 : Rat) / 168) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0129_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0129
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0130 : Poly :=
[
  term ((-25638893142626375 : Rat) / 26109641356596) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 130 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0130 : Poly :=
[
  term ((-25638893142626375 : Rat) / 26109641356596) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-25638893142626375 : Rat) / 26109641356596) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((25638893142626375 : Rat) / 26109641356596) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((25638893142626375 : Rat) / 26109641356596) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0130_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0130
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0131 : Poly :=
[
  term ((247 : Rat) / 6) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0131 : Poly :=
[
  term ((247 : Rat) / 6) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 6) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 6) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 6) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0131_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0131
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0132 : Poly :=
[
  term ((3344287120854959 : Rat) / 8703213785532) [(3, 1), (15, 1)]
]

/-- Partial product 132 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0132 : Poly :=
[
  term ((3344287120854959 : Rat) / 8703213785532) [(0, 2), (3, 1), (15, 1)],
  term ((3344287120854959 : Rat) / 8703213785532) [(1, 2), (3, 1), (15, 1)],
  term ((-3344287120854959 : Rat) / 8703213785532) [(3, 1), (10, 2), (15, 1)],
  term ((-3344287120854959 : Rat) / 8703213785532) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0132_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0132
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0133 : Poly :=
[
  term ((1328274198856205 : Rat) / 13054820678298) [(3, 2)]
]

/-- Partial product 133 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0133 : Poly :=
[
  term ((1328274198856205 : Rat) / 13054820678298) [(0, 2), (3, 2)],
  term ((1328274198856205 : Rat) / 13054820678298) [(1, 2), (3, 2)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(3, 2), (10, 2)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0133_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0133
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0134 : Poly :=
[
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1)]
]

/-- Partial product 134 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0134 : Poly :=
[
  term ((5406607540071400 : Rat) / 6527410339149) [(0, 2), (3, 2), (6, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(1, 2), (3, 2), (6, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (10, 2)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0134_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0134
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0135 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 2), (10, 1)]
]

/-- Partial product 135 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0135 : Poly :=
[
  term ((640 : Rat) / 21) [(0, 2), (3, 2), (10, 1)],
  term ((640 : Rat) / 21) [(1, 2), (3, 2), (10, 1)],
  term ((-640 : Rat) / 21) [(3, 2), (10, 1), (11, 2)],
  term ((-640 : Rat) / 21) [(3, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0135_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0135
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0136 : Poly :=
[
  term ((-5859727241921320 : Rat) / 6527410339149) [(3, 2), (14, 1)]
]

/-- Partial product 136 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0136 : Poly :=
[
  term ((-5859727241921320 : Rat) / 6527410339149) [(0, 2), (3, 2), (14, 1)],
  term ((-5859727241921320 : Rat) / 6527410339149) [(1, 2), (3, 2), (14, 1)],
  term ((5859727241921320 : Rat) / 6527410339149) [(3, 2), (10, 2), (14, 1)],
  term ((5859727241921320 : Rat) / 6527410339149) [(3, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0136_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0136
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0137 : Poly :=
[
  term ((1994038900525423 : Rat) / 17406427571064) [(4, 1)]
]

/-- Partial product 137 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0137 : Poly :=
[
  term ((1994038900525423 : Rat) / 17406427571064) [(0, 2), (4, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(1, 2), (4, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1), (10, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0137_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0137
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0138 : Poly :=
[
  term ((415226141141239 : Rat) / 5802142523688) [(6, 1)]
]

/-- Partial product 138 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0138 : Poly :=
[
  term ((415226141141239 : Rat) / 5802142523688) [(0, 2), (6, 1)],
  term ((415226141141239 : Rat) / 5802142523688) [(1, 2), (6, 1)],
  term ((-415226141141239 : Rat) / 5802142523688) [(6, 1), (10, 2)],
  term ((-415226141141239 : Rat) / 5802142523688) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0138_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0138
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0139 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 139 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0139 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0139_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0139
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0140 : Poly :=
[
  term ((691022102046859 : Rat) / 1864974382614) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 140 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0140 : Poly :=
[
  term ((691022102046859 : Rat) / 1864974382614) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(6, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0140_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0140
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0141 : Poly :=
[
  term ((-2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 141 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0141 : Poly :=
[
  term ((-2237011682901140 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0141_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0141
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0142 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 142 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0142 : Poly :=
[
  term ((-1532199782809 : Rat) / 80585312829) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0142_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0142
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0143 : Poly :=
[
  term ((1434444757396439 : Rat) / 1598549470812) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 143 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0143 : Poly :=
[
  term ((1434444757396439 : Rat) / 1598549470812) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((1434444757396439 : Rat) / 1598549470812) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-1434444757396439 : Rat) / 1598549470812) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-1434444757396439 : Rat) / 1598549470812) [(6, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0143_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0143
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0144 : Poly :=
[
  term ((13804982796901 : Rat) / 20234803428) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 144 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0144 : Poly :=
[
  term ((13804982796901 : Rat) / 20234803428) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((13804982796901 : Rat) / 20234803428) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-13804982796901 : Rat) / 20234803428) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((-13804982796901 : Rat) / 20234803428) [(6, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0144_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0144
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0145 : Poly :=
[
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 145 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0145 : Poly :=
[
  term ((725 : Rat) / 42) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0145_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0145
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0146 : Poly :=
[
  term ((-488444928462163 : Rat) / 5802142523688) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 146 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0146 : Poly :=
[
  term ((-488444928462163 : Rat) / 5802142523688) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-488444928462163 : Rat) / 5802142523688) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((488444928462163 : Rat) / 5802142523688) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((488444928462163 : Rat) / 5802142523688) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0146_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0146
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0147 : Poly :=
[
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0147 : Poly :=
[
  term ((-314 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0147_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0147
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0148 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(6, 1), (9, 2)]
]

/-- Partial product 148 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0148 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(0, 2), (6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 166541592) [(1, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (10, 2)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0148_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0148
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0149 : Poly :=
[
  term ((2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 1)]
]

/-- Partial product 149 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0149 : Poly :=
[
  term ((2149676295281027 : Rat) / 5802142523688) [(0, 2), (6, 1), (10, 1)],
  term ((2149676295281027 : Rat) / 5802142523688) [(1, 2), (6, 1), (10, 1)],
  term ((-2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 1), (11, 2)],
  term ((-2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0149_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0149
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0150 : Poly :=
[
  term ((-34412959094360513 : Rat) / 39164462034894) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 150 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0150 : Poly :=
[
  term ((-34412959094360513 : Rat) / 39164462034894) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-34412959094360513 : Rat) / 39164462034894) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((34412959094360513 : Rat) / 39164462034894) [(6, 1), (10, 2), (11, 1), (13, 1)],
  term ((34412959094360513 : Rat) / 39164462034894) [(6, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0150_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0150
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0151 : Poly :=
[
  term ((-85 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 151 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0151 : Poly :=
[
  term ((-85 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(6, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0151_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0151
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0152 : Poly :=
[
  term ((5613605521284791 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 152 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0152 : Poly :=
[
  term ((5613605521284791 : Rat) / 26109641356596) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((5613605521284791 : Rat) / 26109641356596) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((-5613605521284791 : Rat) / 26109641356596) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-5613605521284791 : Rat) / 26109641356596) [(6, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0152_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0152
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0153 : Poly :=
[
  term ((16 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0153 : Poly :=
[
  term ((16 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0153_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0153
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0154 : Poly :=
[
  term ((-948134543867143 : Rat) / 932487191307) [(6, 1), (11, 2)]
]

/-- Partial product 154 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0154 : Poly :=
[
  term ((-948134543867143 : Rat) / 932487191307) [(0, 2), (6, 1), (11, 2)],
  term ((-948134543867143 : Rat) / 932487191307) [(1, 2), (6, 1), (11, 2)],
  term ((948134543867143 : Rat) / 932487191307) [(6, 1), (10, 2), (11, 2)],
  term ((948134543867143 : Rat) / 932487191307) [(6, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0154_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0154
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0155 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 155 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0155 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0155_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0155
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0156 : Poly :=
[
  term ((6070875812284601 : Rat) / 13054820678298) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 156 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0156 : Poly :=
[
  term ((6070875812284601 : Rat) / 13054820678298) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((6070875812284601 : Rat) / 13054820678298) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-6070875812284601 : Rat) / 13054820678298) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((-6070875812284601 : Rat) / 13054820678298) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0156_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0156
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0157 : Poly :=
[
  term ((-1727 : Rat) / 126) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0157 : Poly :=
[
  term ((-1727 : Rat) / 126) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1727 : Rat) / 126) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1727 : Rat) / 126) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((1727 : Rat) / 126) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0157_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0157
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0158 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)]
]

/-- Partial product 158 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0158 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (13, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (10, 2), (13, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0158_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0158
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0159 : Poly :=
[
  term ((-170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 159 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0159 : Poly :=
[
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0159_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0159
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0160 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(6, 1), (14, 1)]
]

/-- Partial product 160 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0160 : Poly :=
[
  term ((1532199782809 : Rat) / 53723541886) [(0, 2), (6, 1), (14, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(1, 2), (6, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (10, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0160_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0160
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0161 : Poly :=
[
  term ((282061132319075 : Rat) / 2901071261844) [(6, 1), (15, 2)]
]

/-- Partial product 161 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0161 : Poly :=
[
  term ((282061132319075 : Rat) / 2901071261844) [(0, 2), (6, 1), (15, 2)],
  term ((282061132319075 : Rat) / 2901071261844) [(1, 2), (6, 1), (15, 2)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (10, 2), (15, 2)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0161_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0161
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0162 : Poly :=
[
  term ((314 : Rat) / 21) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 162 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0162 : Poly :=
[
  term ((314 : Rat) / 21) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((314 : Rat) / 21) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0162_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0162
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0163 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(7, 1), (9, 1)]
]

/-- Partial product 163 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0163 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(0, 2), (7, 1), (9, 1)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (7, 1), (9, 1)],
  term ((-2172201733 : Rat) / 333083184) [(7, 1), (9, 1), (10, 2)],
  term ((-2172201733 : Rat) / 333083184) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0163_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0163
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0164 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 164 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0164 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0164_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0164
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0165 : Poly :=
[
  term ((-6888730390305 : Rat) / 214894167544) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 165 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0165 : Poly :=
[
  term ((-6888730390305 : Rat) / 214894167544) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((-6888730390305 : Rat) / 214894167544) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((6888730390305 : Rat) / 214894167544) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((6888730390305 : Rat) / 214894167544) [(7, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0165_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0165
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0166 : Poly :=
[
  term ((948134543867143 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 166 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0166 : Poly :=
[
  term ((948134543867143 : Rat) / 932487191307) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((948134543867143 : Rat) / 932487191307) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 3)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0166_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0166
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0167 : Poly :=
[
  term ((280381883026811 : Rat) / 799274735406) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 167 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0167 : Poly :=
[
  term ((280381883026811 : Rat) / 799274735406) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(7, 1), (10, 1), (11, 2), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(7, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0167_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0167
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0168 : Poly :=
[
  term ((85 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 168 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0168 : Poly :=
[
  term ((85 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0168_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0168
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0169 : Poly :=
[
  term ((-107821311390131 : Rat) / 177616607868) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 169 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0169 : Poly :=
[
  term ((-107821311390131 : Rat) / 177616607868) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-107821311390131 : Rat) / 177616607868) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((107821311390131 : Rat) / 177616607868) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((107821311390131 : Rat) / 177616607868) [(7, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0169_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0169
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0170 : Poly :=
[
  term ((-16 : Rat) / 9) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0170 : Poly :=
[
  term ((-16 : Rat) / 9) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0170_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0170
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0171 : Poly :=
[
  term ((-9321684538499 : Rat) / 29602767978) [(7, 1), (11, 1)]
]

/-- Partial product 171 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0171 : Poly :=
[
  term ((-9321684538499 : Rat) / 29602767978) [(0, 2), (7, 1), (11, 1)],
  term ((-9321684538499 : Rat) / 29602767978) [(1, 2), (7, 1), (11, 1)],
  term ((9321684538499 : Rat) / 29602767978) [(7, 1), (10, 2), (11, 1)],
  term ((9321684538499 : Rat) / 29602767978) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0171_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0171
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0172 : Poly :=
[
  term ((5118063626532233 : Rat) / 13054820678298) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 172 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0172 : Poly :=
[
  term ((5118063626532233 : Rat) / 13054820678298) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((5118063626532233 : Rat) / 13054820678298) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-5118063626532233 : Rat) / 13054820678298) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((-5118063626532233 : Rat) / 13054820678298) [(7, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0172_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0172
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0173 : Poly :=
[
  term ((-23188249238213 : Rat) / 1934047507896) [(7, 1), (13, 1)]
]

/-- Partial product 173 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0173 : Poly :=
[
  term ((-23188249238213 : Rat) / 1934047507896) [(0, 2), (7, 1), (13, 1)],
  term ((-23188249238213 : Rat) / 1934047507896) [(1, 2), (7, 1), (13, 1)],
  term ((23188249238213 : Rat) / 1934047507896) [(7, 1), (10, 2), (13, 1)],
  term ((23188249238213 : Rat) / 1934047507896) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0173_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0173
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0174 : Poly :=
[
  term ((10732472496839915 : Rat) / 26109641356596) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 174 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0174 : Poly :=
[
  term ((10732472496839915 : Rat) / 26109641356596) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((10732472496839915 : Rat) / 26109641356596) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-10732472496839915 : Rat) / 26109641356596) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((-10732472496839915 : Rat) / 26109641356596) [(7, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0174_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0174
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0175 : Poly :=
[
  term ((725 : Rat) / 42) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 175 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0175 : Poly :=
[
  term ((725 : Rat) / 42) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 42) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0175_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0175
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0176 : Poly :=
[
  term ((-725 : Rat) / 84) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 176 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0176 : Poly :=
[
  term ((-725 : Rat) / 84) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0176_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0176
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0177 : Poly :=
[
  term ((-199322344047389 : Rat) / 2901071261844) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 177 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0177 : Poly :=
[
  term ((-199322344047389 : Rat) / 2901071261844) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-199322344047389 : Rat) / 2901071261844) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((199322344047389 : Rat) / 2901071261844) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((199322344047389 : Rat) / 2901071261844) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0177_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0177
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0178 : Poly :=
[
  term ((-314 : Rat) / 21) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0178 : Poly :=
[
  term ((-314 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0178_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0178
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0179 : Poly :=
[
  term ((48174332071457 : Rat) / 828877503384) [(7, 1), (15, 1)]
]

/-- Partial product 179 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0179 : Poly :=
[
  term ((48174332071457 : Rat) / 828877503384) [(0, 2), (7, 1), (15, 1)],
  term ((48174332071457 : Rat) / 828877503384) [(1, 2), (7, 1), (15, 1)],
  term ((-48174332071457 : Rat) / 828877503384) [(7, 1), (10, 2), (15, 1)],
  term ((-48174332071457 : Rat) / 828877503384) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0179_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0179
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0180 : Poly :=
[
  term ((157 : Rat) / 21) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 180 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0180 : Poly :=
[
  term ((157 : Rat) / 21) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0180_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0180
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0181 : Poly :=
[
  term ((6128799131236 : Rat) / 11512187547) [(7, 2)]
]

/-- Partial product 181 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0181 : Poly :=
[
  term ((6128799131236 : Rat) / 11512187547) [(0, 2), (7, 2)],
  term ((6128799131236 : Rat) / 11512187547) [(1, 2), (7, 2)],
  term ((-6128799131236 : Rat) / 11512187547) [(7, 2), (10, 2)],
  term ((-6128799131236 : Rat) / 11512187547) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0181_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0181
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0182 : Poly :=
[
  term ((-691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 1)]
]

/-- Partial product 182 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0182 : Poly :=
[
  term ((-691022102046859 : Rat) / 1864974382614) [(0, 2), (7, 2), (10, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(1, 2), (7, 2), (10, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 1), (11, 2)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0182_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0182
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0183 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(7, 2), (14, 1)]
]

/-- Partial product 183 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0183 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(0, 2), (7, 2), (14, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 2), (7, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 2), (10, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0183_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0183
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0184 : Poly :=
[
  term ((-119808 : Rat) / 553) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 184 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0184 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(9, 1), (10, 1), (11, 3)],
  term ((119808 : Rat) / 553) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0184_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0184
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0185 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 185 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0185 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0185_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0185
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0186 : Poly :=
[
  term ((-305 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 186 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0186 : Poly :=
[
  term ((-305 : Rat) / 28) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0186_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0186
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0187 : Poly :=
[
  term ((-7943019986156513 : Rat) / 12788395766496) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 187 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0187 : Poly :=
[
  term ((-7943019986156513 : Rat) / 12788395766496) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-7943019986156513 : Rat) / 12788395766496) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((7943019986156513 : Rat) / 12788395766496) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((7943019986156513 : Rat) / 12788395766496) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0187_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0187
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0188 : Poly :=
[
  term ((65 : Rat) / 7) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0188 : Poly :=
[
  term ((65 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0188_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0188
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0189 : Poly :=
[
  term ((-34662171116885 : Rat) / 473644287648) [(9, 1), (11, 1)]
]

/-- Partial product 189 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0189 : Poly :=
[
  term ((-34662171116885 : Rat) / 473644287648) [(0, 2), (9, 1), (11, 1)],
  term ((-34662171116885 : Rat) / 473644287648) [(1, 2), (9, 1), (11, 1)],
  term ((34662171116885 : Rat) / 473644287648) [(9, 1), (10, 2), (11, 1)],
  term ((34662171116885 : Rat) / 473644287648) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0189_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0189
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0190 : Poly :=
[
  term ((6345045920713649 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 190 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0190 : Poly :=
[
  term ((6345045920713649 : Rat) / 12788395766496) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((6345045920713649 : Rat) / 12788395766496) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-6345045920713649 : Rat) / 12788395766496) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-6345045920713649 : Rat) / 12788395766496) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0190_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0190
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0191 : Poly :=
[
  term ((-119808 : Rat) / 553) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 191 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0191 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-119808 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0191_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0191
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0192 : Poly :=
[
  term ((-58221655903721 : Rat) / 608971226976) [(9, 1), (13, 1)]
]

/-- Partial product 192 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0192 : Poly :=
[
  term ((-58221655903721 : Rat) / 608971226976) [(0, 2), (9, 1), (13, 1)],
  term ((-58221655903721 : Rat) / 608971226976) [(1, 2), (9, 1), (13, 1)],
  term ((58221655903721 : Rat) / 608971226976) [(9, 1), (10, 2), (13, 1)],
  term ((58221655903721 : Rat) / 608971226976) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0192_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0192
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0193 : Poly :=
[
  term ((-3780830633087983 : Rat) / 6394197883248) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 193 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0193 : Poly :=
[
  term ((-3780830633087983 : Rat) / 6394197883248) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3780830633087983 : Rat) / 6394197883248) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((3780830633087983 : Rat) / 6394197883248) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((3780830633087983 : Rat) / 6394197883248) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0193_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0193
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0194 : Poly :=
[
  term ((-25 : Rat) / 84) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 194 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0194 : Poly :=
[
  term ((-25 : Rat) / 84) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25 : Rat) / 84) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((25 : Rat) / 84) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((25 : Rat) / 84) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0194_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0194
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0195 : Poly :=
[
  term ((12753863657789 : Rat) / 59205535956) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 195 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0195 : Poly :=
[
  term ((12753863657789 : Rat) / 59205535956) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((12753863657789 : Rat) / 59205535956) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((-12753863657789 : Rat) / 59205535956) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-12753863657789 : Rat) / 59205535956) [(9, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0195_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0195
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0196 : Poly :=
[
  term ((-305 : Rat) / 28) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 196 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0196 : Poly :=
[
  term ((-305 : Rat) / 28) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0196_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0196
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0197 : Poly :=
[
  term ((5 : Rat) / 48) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 197 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0197 : Poly :=
[
  term ((5 : Rat) / 48) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 48) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 48) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-5 : Rat) / 48) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0197_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0197
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0198 : Poly :=
[
  term ((-14465067141227705 : Rat) / 69625710284256) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 198 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0198 : Poly :=
[
  term ((-14465067141227705 : Rat) / 69625710284256) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-14465067141227705 : Rat) / 69625710284256) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((14465067141227705 : Rat) / 69625710284256) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((14465067141227705 : Rat) / 69625710284256) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0198_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0198
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009YNNNN_coefficient_02_0199 : Poly :=
[
  term ((-1 : Rat) / 21) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 2. -/
def rs_R009_ueqv_R009YNNNN_partial_02_0199 : Poly :=
[
  term ((-1 : Rat) / 21) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1 : Rat) / 21) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 21) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((1 : Rat) / 21) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 2. -/
theorem rs_R009_ueqv_R009YNNNN_partial_02_0199_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_02_0199
        rs_R009_ueqv_R009YNNNN_generator_02_0100_0199 =
      rs_R009_ueqv_R009YNNNN_partial_02_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_02_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_02_0100,
  rs_R009_ueqv_R009YNNNN_partial_02_0101,
  rs_R009_ueqv_R009YNNNN_partial_02_0102,
  rs_R009_ueqv_R009YNNNN_partial_02_0103,
  rs_R009_ueqv_R009YNNNN_partial_02_0104,
  rs_R009_ueqv_R009YNNNN_partial_02_0105,
  rs_R009_ueqv_R009YNNNN_partial_02_0106,
  rs_R009_ueqv_R009YNNNN_partial_02_0107,
  rs_R009_ueqv_R009YNNNN_partial_02_0108,
  rs_R009_ueqv_R009YNNNN_partial_02_0109,
  rs_R009_ueqv_R009YNNNN_partial_02_0110,
  rs_R009_ueqv_R009YNNNN_partial_02_0111,
  rs_R009_ueqv_R009YNNNN_partial_02_0112,
  rs_R009_ueqv_R009YNNNN_partial_02_0113,
  rs_R009_ueqv_R009YNNNN_partial_02_0114,
  rs_R009_ueqv_R009YNNNN_partial_02_0115,
  rs_R009_ueqv_R009YNNNN_partial_02_0116,
  rs_R009_ueqv_R009YNNNN_partial_02_0117,
  rs_R009_ueqv_R009YNNNN_partial_02_0118,
  rs_R009_ueqv_R009YNNNN_partial_02_0119,
  rs_R009_ueqv_R009YNNNN_partial_02_0120,
  rs_R009_ueqv_R009YNNNN_partial_02_0121,
  rs_R009_ueqv_R009YNNNN_partial_02_0122,
  rs_R009_ueqv_R009YNNNN_partial_02_0123,
  rs_R009_ueqv_R009YNNNN_partial_02_0124,
  rs_R009_ueqv_R009YNNNN_partial_02_0125,
  rs_R009_ueqv_R009YNNNN_partial_02_0126,
  rs_R009_ueqv_R009YNNNN_partial_02_0127,
  rs_R009_ueqv_R009YNNNN_partial_02_0128,
  rs_R009_ueqv_R009YNNNN_partial_02_0129,
  rs_R009_ueqv_R009YNNNN_partial_02_0130,
  rs_R009_ueqv_R009YNNNN_partial_02_0131,
  rs_R009_ueqv_R009YNNNN_partial_02_0132,
  rs_R009_ueqv_R009YNNNN_partial_02_0133,
  rs_R009_ueqv_R009YNNNN_partial_02_0134,
  rs_R009_ueqv_R009YNNNN_partial_02_0135,
  rs_R009_ueqv_R009YNNNN_partial_02_0136,
  rs_R009_ueqv_R009YNNNN_partial_02_0137,
  rs_R009_ueqv_R009YNNNN_partial_02_0138,
  rs_R009_ueqv_R009YNNNN_partial_02_0139,
  rs_R009_ueqv_R009YNNNN_partial_02_0140,
  rs_R009_ueqv_R009YNNNN_partial_02_0141,
  rs_R009_ueqv_R009YNNNN_partial_02_0142,
  rs_R009_ueqv_R009YNNNN_partial_02_0143,
  rs_R009_ueqv_R009YNNNN_partial_02_0144,
  rs_R009_ueqv_R009YNNNN_partial_02_0145,
  rs_R009_ueqv_R009YNNNN_partial_02_0146,
  rs_R009_ueqv_R009YNNNN_partial_02_0147,
  rs_R009_ueqv_R009YNNNN_partial_02_0148,
  rs_R009_ueqv_R009YNNNN_partial_02_0149,
  rs_R009_ueqv_R009YNNNN_partial_02_0150,
  rs_R009_ueqv_R009YNNNN_partial_02_0151,
  rs_R009_ueqv_R009YNNNN_partial_02_0152,
  rs_R009_ueqv_R009YNNNN_partial_02_0153,
  rs_R009_ueqv_R009YNNNN_partial_02_0154,
  rs_R009_ueqv_R009YNNNN_partial_02_0155,
  rs_R009_ueqv_R009YNNNN_partial_02_0156,
  rs_R009_ueqv_R009YNNNN_partial_02_0157,
  rs_R009_ueqv_R009YNNNN_partial_02_0158,
  rs_R009_ueqv_R009YNNNN_partial_02_0159,
  rs_R009_ueqv_R009YNNNN_partial_02_0160,
  rs_R009_ueqv_R009YNNNN_partial_02_0161,
  rs_R009_ueqv_R009YNNNN_partial_02_0162,
  rs_R009_ueqv_R009YNNNN_partial_02_0163,
  rs_R009_ueqv_R009YNNNN_partial_02_0164,
  rs_R009_ueqv_R009YNNNN_partial_02_0165,
  rs_R009_ueqv_R009YNNNN_partial_02_0166,
  rs_R009_ueqv_R009YNNNN_partial_02_0167,
  rs_R009_ueqv_R009YNNNN_partial_02_0168,
  rs_R009_ueqv_R009YNNNN_partial_02_0169,
  rs_R009_ueqv_R009YNNNN_partial_02_0170,
  rs_R009_ueqv_R009YNNNN_partial_02_0171,
  rs_R009_ueqv_R009YNNNN_partial_02_0172,
  rs_R009_ueqv_R009YNNNN_partial_02_0173,
  rs_R009_ueqv_R009YNNNN_partial_02_0174,
  rs_R009_ueqv_R009YNNNN_partial_02_0175,
  rs_R009_ueqv_R009YNNNN_partial_02_0176,
  rs_R009_ueqv_R009YNNNN_partial_02_0177,
  rs_R009_ueqv_R009YNNNN_partial_02_0178,
  rs_R009_ueqv_R009YNNNN_partial_02_0179,
  rs_R009_ueqv_R009YNNNN_partial_02_0180,
  rs_R009_ueqv_R009YNNNN_partial_02_0181,
  rs_R009_ueqv_R009YNNNN_partial_02_0182,
  rs_R009_ueqv_R009YNNNN_partial_02_0183,
  rs_R009_ueqv_R009YNNNN_partial_02_0184,
  rs_R009_ueqv_R009YNNNN_partial_02_0185,
  rs_R009_ueqv_R009YNNNN_partial_02_0186,
  rs_R009_ueqv_R009YNNNN_partial_02_0187,
  rs_R009_ueqv_R009YNNNN_partial_02_0188,
  rs_R009_ueqv_R009YNNNN_partial_02_0189,
  rs_R009_ueqv_R009YNNNN_partial_02_0190,
  rs_R009_ueqv_R009YNNNN_partial_02_0191,
  rs_R009_ueqv_R009YNNNN_partial_02_0192,
  rs_R009_ueqv_R009YNNNN_partial_02_0193,
  rs_R009_ueqv_R009YNNNN_partial_02_0194,
  rs_R009_ueqv_R009YNNNN_partial_02_0195,
  rs_R009_ueqv_R009YNNNN_partial_02_0196,
  rs_R009_ueqv_R009YNNNN_partial_02_0197,
  rs_R009_ueqv_R009YNNNN_partial_02_0198,
  rs_R009_ueqv_R009YNNNN_partial_02_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_02_0100_0199 : Poly :=
[
  term ((6163114192678721 : Rat) / 17406427571064) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((437 : Rat) / 28) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((89856 : Rat) / 553) [(0, 2), (2, 1), (11, 2)],
  term ((-42643465442869 : Rat) / 43497944784) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((8425 : Rat) / 168) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((7050139276131881 : Rat) / 17406427571064) [(0, 2), (2, 1), (14, 1)],
  term ((25638893142626375 : Rat) / 26109641356596) [(0, 2), (2, 1), (15, 2)],
  term ((-247 : Rat) / 6) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 2)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((113897227093955111 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((48487526969875909 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((85 : Rat) / 21) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-4315988293470491 : Rat) / 2175803446383) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-59755791529551 : Rat) / 107447083772) [(0, 2), (3, 1), (7, 1)],
  term ((60472291253842177 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((254345163946294 : Rat) / 2175803446383) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((3282196818563 : Rat) / 3996998208) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((-1031795823175 : Rat) / 1101213792) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-89856 : Rat) / 553) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-135756748565609 : Rat) / 157881429216) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((2245 : Rat) / 112) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((106920059393860357 : Rat) / 156657848139576) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-437 : Rat) / 28) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(0, 2), (3, 1), (11, 1)],
  term ((-81194043563984423 : Rat) / 78328924069788) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((442939868145011507 : Rat) / 313315696279152) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-8425 : Rat) / 168) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25638893142626375 : Rat) / 26109641356596) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 6) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((3344287120854959 : Rat) / 8703213785532) [(0, 2), (3, 1), (15, 1)],
  term ((1328274198856205 : Rat) / 13054820678298) [(0, 2), (3, 2)],
  term ((5406607540071400 : Rat) / 6527410339149) [(0, 2), (3, 2), (6, 1)],
  term ((640 : Rat) / 21) [(0, 2), (3, 2), (10, 1)],
  term ((-5859727241921320 : Rat) / 6527410339149) [(0, 2), (3, 2), (14, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(0, 2), (4, 1)],
  term ((415226141141239 : Rat) / 5802142523688) [(0, 2), (6, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((1434444757396439 : Rat) / 1598549470812) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((13804982796901 : Rat) / 20234803428) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((725 : Rat) / 42) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-488444928462163 : Rat) / 5802142523688) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 166541592) [(0, 2), (6, 1), (9, 2)],
  term ((2149676295281027 : Rat) / 5802142523688) [(0, 2), (6, 1), (10, 1)],
  term ((-34412959094360513 : Rat) / 39164462034894) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((5613605521284791 : Rat) / 26109641356596) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((16 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(0, 2), (6, 1), (11, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((6070875812284601 : Rat) / 13054820678298) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1727 : Rat) / 126) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 2)],
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(0, 2), (6, 1), (14, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(0, 2), (6, 1), (15, 2)],
  term ((314 : Rat) / 21) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((2172201733 : Rat) / 333083184) [(0, 2), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((-6888730390305 : Rat) / 214894167544) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((948134543867143 : Rat) / 932487191307) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((85 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-107821311390131 : Rat) / 177616607868) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9321684538499 : Rat) / 29602767978) [(0, 2), (7, 1), (11, 1)],
  term ((5118063626532233 : Rat) / 13054820678298) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-23188249238213 : Rat) / 1934047507896) [(0, 2), (7, 1), (13, 1)],
  term ((10732472496839915 : Rat) / 26109641356596) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 42) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-199322344047389 : Rat) / 2901071261844) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((48174332071457 : Rat) / 828877503384) [(0, 2), (7, 1), (15, 1)],
  term ((157 : Rat) / 21) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 11512187547) [(0, 2), (7, 2)],
  term ((-691022102046859 : Rat) / 1864974382614) [(0, 2), (7, 2), (10, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(0, 2), (7, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-305 : Rat) / 28) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7943019986156513 : Rat) / 12788395766496) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((65 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-34662171116885 : Rat) / 473644287648) [(0, 2), (9, 1), (11, 1)],
  term ((6345045920713649 : Rat) / 12788395766496) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-58221655903721 : Rat) / 608971226976) [(0, 2), (9, 1), (13, 1)],
  term ((-3780830633087983 : Rat) / 6394197883248) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-25 : Rat) / 84) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12753863657789 : Rat) / 59205535956) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 48) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-14465067141227705 : Rat) / 69625710284256) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 21) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((6163114192678721 : Rat) / 17406427571064) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((437 : Rat) / 28) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((89856 : Rat) / 553) [(1, 2), (2, 1), (11, 2)],
  term ((-42643465442869 : Rat) / 43497944784) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((8425 : Rat) / 168) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((7050139276131881 : Rat) / 17406427571064) [(1, 2), (2, 1), (14, 1)],
  term ((25638893142626375 : Rat) / 26109641356596) [(1, 2), (2, 1), (15, 2)],
  term ((-247 : Rat) / 6) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 2)],
  term ((-1239549624292481 : Rat) / 2175803446383) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((113897227093955111 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((48487526969875909 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((85 : Rat) / 21) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-4315988293470491 : Rat) / 2175803446383) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-59755791529551 : Rat) / 107447083772) [(1, 2), (3, 1), (7, 1)],
  term ((60472291253842177 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((254345163946294 : Rat) / 2175803446383) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((3282196818563 : Rat) / 3996998208) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-1031795823175 : Rat) / 1101213792) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-89856 : Rat) / 553) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-135756748565609 : Rat) / 157881429216) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((2245 : Rat) / 112) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((106920059393860357 : Rat) / 156657848139576) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-437 : Rat) / 28) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(1, 2), (3, 1), (11, 1)],
  term ((-81194043563984423 : Rat) / 78328924069788) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((442939868145011507 : Rat) / 313315696279152) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-8425 : Rat) / 168) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-25638893142626375 : Rat) / 26109641356596) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 6) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((3344287120854959 : Rat) / 8703213785532) [(1, 2), (3, 1), (15, 1)],
  term ((1328274198856205 : Rat) / 13054820678298) [(1, 2), (3, 2)],
  term ((5406607540071400 : Rat) / 6527410339149) [(1, 2), (3, 2), (6, 1)],
  term ((640 : Rat) / 21) [(1, 2), (3, 2), (10, 1)],
  term ((-5859727241921320 : Rat) / 6527410339149) [(1, 2), (3, 2), (14, 1)],
  term ((1994038900525423 : Rat) / 17406427571064) [(1, 2), (4, 1)],
  term ((415226141141239 : Rat) / 5802142523688) [(1, 2), (6, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-2237011682901140 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((1434444757396439 : Rat) / 1598549470812) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((13804982796901 : Rat) / 20234803428) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((725 : Rat) / 42) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-488444928462163 : Rat) / 5802142523688) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 2), (6, 1), (9, 2)],
  term ((2149676295281027 : Rat) / 5802142523688) [(1, 2), (6, 1), (10, 1)],
  term ((-34412959094360513 : Rat) / 39164462034894) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-85 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((5613605521284791 : Rat) / 26109641356596) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((16 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(1, 2), (6, 1), (11, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((6070875812284601 : Rat) / 13054820678298) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1727 : Rat) / 126) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (13, 2)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(1, 2), (6, 1), (14, 1)],
  term ((282061132319075 : Rat) / 2901071261844) [(1, 2), (6, 1), (15, 2)],
  term ((314 : Rat) / 21) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((-6888730390305 : Rat) / 214894167544) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((948134543867143 : Rat) / 932487191307) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((85 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-107821311390131 : Rat) / 177616607868) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9321684538499 : Rat) / 29602767978) [(1, 2), (7, 1), (11, 1)],
  term ((5118063626532233 : Rat) / 13054820678298) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-23188249238213 : Rat) / 1934047507896) [(1, 2), (7, 1), (13, 1)],
  term ((10732472496839915 : Rat) / 26109641356596) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 42) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-199322344047389 : Rat) / 2901071261844) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((48174332071457 : Rat) / 828877503384) [(1, 2), (7, 1), (15, 1)],
  term ((157 : Rat) / 21) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((6128799131236 : Rat) / 11512187547) [(1, 2), (7, 2)],
  term ((-691022102046859 : Rat) / 1864974382614) [(1, 2), (7, 2), (10, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 2), (7, 2), (14, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-305 : Rat) / 28) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7943019986156513 : Rat) / 12788395766496) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((65 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-34662171116885 : Rat) / 473644287648) [(1, 2), (9, 1), (11, 1)],
  term ((6345045920713649 : Rat) / 12788395766496) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-58221655903721 : Rat) / 608971226976) [(1, 2), (9, 1), (13, 1)],
  term ((-3780830633087983 : Rat) / 6394197883248) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-25 : Rat) / 84) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((12753863657789 : Rat) / 59205535956) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 48) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-14465067141227705 : Rat) / 69625710284256) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1 : Rat) / 21) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6163114192678721 : Rat) / 17406427571064) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-437 : Rat) / 28) [(2, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89856 : Rat) / 553) [(2, 1), (10, 2), (11, 2)],
  term ((42643465442869 : Rat) / 43497944784) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-8425 : Rat) / 168) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7050139276131881 : Rat) / 17406427571064) [(2, 1), (10, 2), (14, 1)],
  term ((-25638893142626375 : Rat) / 26109641356596) [(2, 1), (10, 2), (15, 2)],
  term ((247 : Rat) / 6) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((42643465442869 : Rat) / 43497944784) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8425 : Rat) / 168) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7050139276131881 : Rat) / 17406427571064) [(2, 1), (11, 2), (14, 1)],
  term ((-25638893142626375 : Rat) / 26109641356596) [(2, 1), (11, 2), (15, 2)],
  term ((247 : Rat) / 6) [(2, 1), (11, 2), (15, 2), (16, 1)],
  term ((-6163114192678721 : Rat) / 17406427571064) [(2, 1), (11, 3), (15, 1)],
  term ((-437 : Rat) / 28) [(2, 1), (11, 3), (15, 1), (16, 1)],
  term ((-89856 : Rat) / 553) [(2, 1), (11, 4)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2), (10, 2)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2), (11, 2)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 1), (6, 1), (7, 1), (10, 2)],
  term ((1239549624292481 : Rat) / 2175803446383) [(3, 1), (6, 1), (7, 1), (11, 2)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (10, 2)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (11, 2)],
  term ((-113897227093955111 : Rat) / 78328924069788) [(3, 1), (6, 1), (10, 2), (11, 1)],
  term ((-48487526969875909 : Rat) / 78328924069788) [(3, 1), (6, 1), (10, 2), (13, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (10, 2), (15, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-48487526969875909 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 2), (13, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((4315988293470491 : Rat) / 2175803446383) [(3, 1), (6, 1), (11, 2), (15, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-113897227093955111 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 3)],
  term ((-60472291253842177 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (11, 2)],
  term ((59755791529551 : Rat) / 107447083772) [(3, 1), (7, 1), (10, 2)],
  term ((-254345163946294 : Rat) / 2175803446383) [(3, 1), (7, 1), (10, 2), (14, 1)],
  term ((-60472291253842177 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 3)],
  term ((59755791529551 : Rat) / 107447083772) [(3, 1), (7, 1), (11, 2)],
  term ((-254345163946294 : Rat) / 2175803446383) [(3, 1), (7, 1), (11, 2), (14, 1)],
  term ((-3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 1), (11, 2)],
  term ((1031795823175 : Rat) / 1101213792) [(3, 1), (9, 1), (10, 2), (14, 1)],
  term ((-3282196818563 : Rat) / 3996998208) [(3, 1), (9, 1), (10, 3)],
  term ((1031795823175 : Rat) / 1101213792) [(3, 1), (9, 1), (11, 2), (14, 1)],
  term ((135756748565609 : Rat) / 157881429216) [(3, 1), (10, 1), (11, 2), (13, 1)],
  term ((-2245 : Rat) / 112) [(3, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((437 : Rat) / 28) [(3, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((89856 : Rat) / 553) [(3, 1), (10, 1), (11, 3)],
  term ((-395910373848515 : Rat) / 4351606892766) [(3, 1), (10, 2), (11, 1)],
  term ((81194043563984423 : Rat) / 78328924069788) [(3, 1), (10, 2), (11, 1), (14, 1)],
  term ((-442939868145011507 : Rat) / 313315696279152) [(3, 1), (10, 2), (13, 1), (14, 1)],
  term ((8425 : Rat) / 168) [(3, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((25638893142626375 : Rat) / 26109641356596) [(3, 1), (10, 2), (14, 1), (15, 1)],
  term ((-247 : Rat) / 6) [(3, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3344287120854959 : Rat) / 8703213785532) [(3, 1), (10, 2), (15, 1)],
  term ((89856 : Rat) / 553) [(3, 1), (10, 3), (11, 1)],
  term ((135756748565609 : Rat) / 157881429216) [(3, 1), (10, 3), (13, 1)],
  term ((-2245 : Rat) / 112) [(3, 1), (10, 3), (13, 1), (16, 1)],
  term ((-106920059393860357 : Rat) / 156657848139576) [(3, 1), (10, 3), (15, 1)],
  term ((437 : Rat) / 28) [(3, 1), (10, 3), (15, 1), (16, 1)],
  term ((-442939868145011507 : Rat) / 313315696279152) [(3, 1), (11, 2), (13, 1), (14, 1)],
  term ((8425 : Rat) / 168) [(3, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((25638893142626375 : Rat) / 26109641356596) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-247 : Rat) / 6) [(3, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3344287120854959 : Rat) / 8703213785532) [(3, 1), (11, 2), (15, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(3, 1), (11, 3)],
  term ((81194043563984423 : Rat) / 78328924069788) [(3, 1), (11, 3), (14, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (10, 2)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (11, 2)],
  term ((-640 : Rat) / 21) [(3, 2), (10, 1), (11, 2)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(3, 2), (10, 2)],
  term ((5859727241921320 : Rat) / 6527410339149) [(3, 2), (10, 2), (14, 1)],
  term ((-640 : Rat) / 21) [(3, 2), (10, 3)],
  term ((-1328274198856205 : Rat) / 13054820678298) [(3, 2), (11, 2)],
  term ((5859727241921320 : Rat) / 6527410339149) [(3, 2), (11, 2), (14, 1)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1), (10, 2)],
  term ((-1994038900525423 : Rat) / 17406427571064) [(4, 1), (11, 2)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (10, 2)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-691022102046859 : Rat) / 1864974382614) [(6, 1), (7, 1), (10, 2), (11, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (10, 2), (13, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (10, 2), (15, 1)],
  term ((2237011682901140 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 2), (13, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-691022102046859 : Rat) / 1864974382614) [(6, 1), (7, 1), (11, 3)],
  term ((-1434444757396439 : Rat) / 1598549470812) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-13804982796901 : Rat) / 20234803428) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((488444928462163 : Rat) / 5802142523688) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-13804982796901 : Rat) / 20234803428) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((488444928462163 : Rat) / 5802142523688) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1434444757396439 : Rat) / 1598549470812) [(6, 1), (9, 1), (11, 3)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (10, 2)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (11, 2)],
  term ((-2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 1), (11, 2)],
  term ((-415226141141239 : Rat) / 5802142523688) [(6, 1), (10, 2)],
  term ((34412959094360513 : Rat) / 39164462034894) [(6, 1), (10, 2), (11, 1), (13, 1)],
  term ((85 : Rat) / 63) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-5613605521284791 : Rat) / 26109641356596) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((948134543867143 : Rat) / 932487191307) [(6, 1), (10, 2), (11, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-6070875812284601 : Rat) / 13054820678298) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((1727 : Rat) / 126) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (10, 2), (13, 2)],
  term ((170 : Rat) / 63) [(6, 1), (10, 2), (13, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (10, 2), (14, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (10, 2), (15, 2)],
  term ((-314 : Rat) / 21) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-2149676295281027 : Rat) / 5802142523688) [(6, 1), (10, 3)],
  term ((-415226141141239 : Rat) / 5802142523688) [(6, 1), (11, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-6070875812284601 : Rat) / 13054820678298) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((1727 : Rat) / 126) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (11, 2), (13, 2)],
  term ((170 : Rat) / 63) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(6, 1), (11, 2), (14, 1)],
  term ((-282061132319075 : Rat) / 2901071261844) [(6, 1), (11, 2), (15, 2)],
  term ((-314 : Rat) / 21) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((34412959094360513 : Rat) / 39164462034894) [(6, 1), (11, 3), (13, 1)],
  term ((85 : Rat) / 63) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((-5613605521284791 : Rat) / 26109641356596) [(6, 1), (11, 3), (15, 1)],
  term ((-16 : Rat) / 9) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((948134543867143 : Rat) / 932487191307) [(6, 1), (11, 4)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 1), (11, 2)],
  term ((-2172201733 : Rat) / 333083184) [(7, 1), (9, 1), (10, 2)],
  term ((6888730390305 : Rat) / 214894167544) [(7, 1), (9, 1), (10, 2), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(7, 1), (9, 1), (10, 3)],
  term ((-2172201733 : Rat) / 333083184) [(7, 1), (9, 1), (11, 2)],
  term ((6888730390305 : Rat) / 214894167544) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(7, 1), (10, 1), (11, 2), (13, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((107821311390131 : Rat) / 177616607868) [(7, 1), (10, 1), (11, 2), (15, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 1), (11, 3)],
  term ((9321684538499 : Rat) / 29602767978) [(7, 1), (10, 2), (11, 1)],
  term ((-5118063626532233 : Rat) / 13054820678298) [(7, 1), (10, 2), (11, 1), (14, 1)],
  term ((23188249238213 : Rat) / 1934047507896) [(7, 1), (10, 2), (13, 1)],
  term ((-10732472496839915 : Rat) / 26109641356596) [(7, 1), (10, 2), (13, 1), (14, 1)],
  term ((-725 : Rat) / 42) [(7, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((199322344047389 : Rat) / 2901071261844) [(7, 1), (10, 2), (14, 1), (15, 1)],
  term ((314 : Rat) / 21) [(7, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-48174332071457 : Rat) / 828877503384) [(7, 1), (10, 2), (15, 1)],
  term ((-157 : Rat) / 21) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-948134543867143 : Rat) / 932487191307) [(7, 1), (10, 3), (11, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(7, 1), (10, 3), (13, 1)],
  term ((-85 : Rat) / 63) [(7, 1), (10, 3), (13, 1), (16, 1)],
  term ((107821311390131 : Rat) / 177616607868) [(7, 1), (10, 3), (15, 1)],
  term ((16 : Rat) / 9) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((23188249238213 : Rat) / 1934047507896) [(7, 1), (11, 2), (13, 1)],
  term ((-10732472496839915 : Rat) / 26109641356596) [(7, 1), (11, 2), (13, 1), (14, 1)],
  term ((-725 : Rat) / 42) [(7, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((199322344047389 : Rat) / 2901071261844) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((314 : Rat) / 21) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-48174332071457 : Rat) / 828877503384) [(7, 1), (11, 2), (15, 1)],
  term ((-157 : Rat) / 21) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((9321684538499 : Rat) / 29602767978) [(7, 1), (11, 3)],
  term ((-5118063626532233 : Rat) / 13054820678298) [(7, 1), (11, 3), (14, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 1), (11, 2)],
  term ((-6128799131236 : Rat) / 11512187547) [(7, 2), (10, 2)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 2), (10, 2), (14, 1)],
  term ((691022102046859 : Rat) / 1864974382614) [(7, 2), (10, 3)],
  term ((-6128799131236 : Rat) / 11512187547) [(7, 2), (11, 2)],
  term ((-1532199782809 : Rat) / 80585312829) [(7, 2), (11, 2), (14, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((305 : Rat) / 28) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((7943019986156513 : Rat) / 12788395766496) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(9, 1), (10, 1), (11, 3)],
  term ((34662171116885 : Rat) / 473644287648) [(9, 1), (10, 2), (11, 1)],
  term ((-6345045920713649 : Rat) / 12788395766496) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((58221655903721 : Rat) / 608971226976) [(9, 1), (10, 2), (13, 1)],
  term ((3780830633087983 : Rat) / 6394197883248) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((25 : Rat) / 84) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12753863657789 : Rat) / 59205535956) [(9, 1), (10, 2), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 48) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((14465067141227705 : Rat) / 69625710284256) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((1 : Rat) / 21) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((119808 : Rat) / 553) [(9, 1), (10, 3), (11, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (10, 3), (13, 1)],
  term ((305 : Rat) / 28) [(9, 1), (10, 3), (13, 1), (16, 1)],
  term ((7943019986156513 : Rat) / 12788395766496) [(9, 1), (10, 3), (15, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((58221655903721 : Rat) / 608971226976) [(9, 1), (11, 2), (13, 1)],
  term ((3780830633087983 : Rat) / 6394197883248) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((25 : Rat) / 84) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12753863657789 : Rat) / 59205535956) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-5 : Rat) / 48) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((14465067141227705 : Rat) / 69625710284256) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((1 : Rat) / 21) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((34662171116885 : Rat) / 473644287648) [(9, 1), (11, 3)],
  term ((-6345045920713649 : Rat) / 12788395766496) [(9, 1), (11, 3), (14, 1)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 100 through 199. -/
theorem rs_R009_ueqv_R009YNNNN_block_02_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_02_0100_0199
      rs_R009_ueqv_R009YNNNN_block_02_0100_0199 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
