/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 1:100-132

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 1 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_01_0100_0132 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0100 : Poly :=
[
  term ((53028754680678991096 : Rat) / 4042369870927946325) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 100 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0100 : Poly :=
[
  term ((53028754680678991096 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((53028754680678991096 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-53028754680678991096 : Rat) / 4042369870927946325) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-53028754680678991096 : Rat) / 4042369870927946325) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0100
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0101 : Poly :=
[
  term ((4480848481102361272 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 101 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0101 : Poly :=
[
  term ((4480848481102361272 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((4480848481102361272 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4480848481102361272 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((-4480848481102361272 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0101_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0101
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0102 : Poly :=
[
  term ((-1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0102 : Poly :=
[
  term ((-1693975153504287628 : Rat) / 89830441576176585) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1693975153504287628 : Rat) / 89830441576176585) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0102_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0102
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0103 : Poly :=
[
  term ((-97263739797401274634 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 103 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0103 : Poly :=
[
  term ((-97263739797401274634 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-97263739797401274634 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((97263739797401274634 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((97263739797401274634 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0103_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0103
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0104 : Poly :=
[
  term ((22287675336467310701 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 104 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0104 : Poly :=
[
  term ((22287675336467310701 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((22287675336467310701 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-22287675336467310701 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-22287675336467310701 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0104_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0104
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0105 : Poly :=
[
  term ((4397984485405254587 : Rat) / 89830441576176585) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0105 : Poly :=
[
  term ((4397984485405254587 : Rat) / 89830441576176585) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((4397984485405254587 : Rat) / 89830441576176585) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4397984485405254587 : Rat) / 89830441576176585) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-4397984485405254587 : Rat) / 89830441576176585) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0105_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0105
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0106 : Poly :=
[
  term ((-60324550220242880 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 106 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0106 : Poly :=
[
  term ((-60324550220242880 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-60324550220242880 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0106_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0106
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0107 : Poly :=
[
  term ((-464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0107 : Poly :=
[
  term ((-464035001694176000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-464035001694176000 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0107_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0107
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0108 : Poly :=
[
  term ((106728050389660480 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0108 : Poly :=
[
  term ((106728050389660480 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((106728050389660480 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-106728050389660480 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-106728050389660480 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0108_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0108
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0109 : Poly :=
[
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 109 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0109 : Poly :=
[
  term ((-18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 2), (9, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0109_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0109
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0110 : Poly :=
[
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (16, 1)]
]

/-- Partial product 110 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0110 : Poly :=
[
  term ((632341872967488004 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0110_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0110
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0111 : Poly :=
[
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 111 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0111 : Poly :=
[
  term ((18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 3), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0111_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0111
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0112 : Poly :=
[
  term ((60324550220242880 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 112 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0112 : Poly :=
[
  term ((60324550220242880 : Rat) / 5988696105078439) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-60324550220242880 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-60324550220242880 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0112_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0112
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0113 : Poly :=
[
  term ((85846475313422560 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 113 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0113 : Poly :=
[
  term ((85846475313422560 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((85846475313422560 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-85846475313422560 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-85846475313422560 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0113_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0113
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0114 : Poly :=
[
  term ((-4916473791676765376 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 114 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0114 : Poly :=
[
  term ((-4916473791676765376 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-4916473791676765376 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((4916473791676765376 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((4916473791676765376 : Rat) / 269491324728529755) [(5, 2), (8, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0114_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0114
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0115 : Poly :=
[
  term ((6601422648961382528 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 115 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0115 : Poly :=
[
  term ((6601422648961382528 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((6601422648961382528 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-6601422648961382528 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((-6601422648961382528 : Rat) / 89830441576176585) [(5, 2), (8, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0115_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0115
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0116 : Poly :=
[
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0116 : Poly :=
[
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0116_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0116
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0117 : Poly :=
[
  term ((1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 117 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0117 : Poly :=
[
  term ((1793305900789760 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 4), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0117_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0117
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0118 : Poly :=
[
  term ((5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 118 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0118 : Poly :=
[
  term ((5368203664041180424 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((5368203664041180424 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((-5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0118_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0118
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0119 : Poly :=
[
  term ((-8836150542388027136 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 119 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0119 : Poly :=
[
  term ((-8836150542388027136 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-8836150542388027136 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((8836150542388027136 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((8836150542388027136 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0119_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0119
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0120 : Poly :=
[
  term ((-398393564445175552 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 120 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0120 : Poly :=
[
  term ((-398393564445175552 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-398393564445175552 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((398393564445175552 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((398393564445175552 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0120_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0120
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0121 : Poly :=
[
  term ((72458848675759744 : Rat) / 17966088315235317) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0121 : Poly :=
[
  term ((72458848675759744 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((72458848675759744 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-72458848675759744 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-72458848675759744 : Rat) / 17966088315235317) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0121_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0121
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0122 : Poly :=
[
  term ((6772042374061821632 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 122 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0122 : Poly :=
[
  term ((6772042374061821632 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((6772042374061821632 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-6772042374061821632 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-6772042374061821632 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0122_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0122
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0123 : Poly :=
[
  term ((-14313905552680142816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 123 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0123 : Poly :=
[
  term ((-14313905552680142816 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-14313905552680142816 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((14313905552680142816 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((14313905552680142816 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0123_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0123
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0124 : Poly :=
[
  term ((3041784130311057824 : Rat) / 17966088315235317) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0124 : Poly :=
[
  term ((3041784130311057824 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((3041784130311057824 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3041784130311057824 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3041784130311057824 : Rat) / 17966088315235317) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0124_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0124
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0125 : Poly :=
[
  term ((5331170877180266176 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 125 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0125 : Poly :=
[
  term ((5331170877180266176 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((5331170877180266176 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-5331170877180266176 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((-5331170877180266176 : Rat) / 269491324728529755) [(5, 2), (9, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0125_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0125
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0126 : Poly :=
[
  term ((-12758568616859088128 : Rat) / 269491324728529755) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 126 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0126 : Poly :=
[
  term ((-12758568616859088128 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((-12758568616859088128 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((12758568616859088128 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 2), (16, 1)],
  term ((12758568616859088128 : Rat) / 269491324728529755) [(5, 2), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0126_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0126
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0127 : Poly :=
[
  term ((-23313765249534971954 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 127 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0127 : Poly :=
[
  term ((-23313765249534971954 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((-23313765249534971954 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((23313765249534971954 : Rat) / 1347456623642648775) [(5, 2), (8, 2), (10, 1), (16, 1)],
  term ((23313765249534971954 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0127_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0127
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0128 : Poly :=
[
  term ((-8572974611816032012 : Rat) / 449152207880882925) [(5, 2), (16, 1)]
]

/-- Partial product 128 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0128 : Poly :=
[
  term ((-8572974611816032012 : Rat) / 449152207880882925) [(0, 2), (5, 2), (16, 1)],
  term ((-8572974611816032012 : Rat) / 449152207880882925) [(1, 2), (5, 2), (16, 1)],
  term ((8572974611816032012 : Rat) / 449152207880882925) [(5, 2), (8, 2), (16, 1)],
  term ((8572974611816032012 : Rat) / 449152207880882925) [(5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0128_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0128
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0129 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 129 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0129 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 2), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 2), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0129_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0129
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0130 : Poly :=
[
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 130 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0130 : Poly :=
[
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 3), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0130_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0130
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0131 : Poly :=
[
  term ((6076664113681020992 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 131 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0131 : Poly :=
[
  term ((6076664113681020992 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((6076664113681020992 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(5, 3), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0131_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0131
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 1. -/
def rs_R010_ueqv_R010YNN_coefficient_01_0132 : Poly :=
[
  term ((8995322844617318528 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 132 for generator 1. -/
def rs_R010_ueqv_R010YNN_partial_01_0132 : Poly :=
[
  term ((8995322844617318528 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((8995322844617318528 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((-8995322844617318528 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (16, 1)],
  term ((-8995322844617318528 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 1. -/
theorem rs_R010_ueqv_R010YNN_partial_01_0132_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_01_0132
        rs_R010_ueqv_R010YNN_generator_01_0100_0132 =
      rs_R010_ueqv_R010YNN_partial_01_0132 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_01_0100_0132 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_01_0100,
  rs_R010_ueqv_R010YNN_partial_01_0101,
  rs_R010_ueqv_R010YNN_partial_01_0102,
  rs_R010_ueqv_R010YNN_partial_01_0103,
  rs_R010_ueqv_R010YNN_partial_01_0104,
  rs_R010_ueqv_R010YNN_partial_01_0105,
  rs_R010_ueqv_R010YNN_partial_01_0106,
  rs_R010_ueqv_R010YNN_partial_01_0107,
  rs_R010_ueqv_R010YNN_partial_01_0108,
  rs_R010_ueqv_R010YNN_partial_01_0109,
  rs_R010_ueqv_R010YNN_partial_01_0110,
  rs_R010_ueqv_R010YNN_partial_01_0111,
  rs_R010_ueqv_R010YNN_partial_01_0112,
  rs_R010_ueqv_R010YNN_partial_01_0113,
  rs_R010_ueqv_R010YNN_partial_01_0114,
  rs_R010_ueqv_R010YNN_partial_01_0115,
  rs_R010_ueqv_R010YNN_partial_01_0116,
  rs_R010_ueqv_R010YNN_partial_01_0117,
  rs_R010_ueqv_R010YNN_partial_01_0118,
  rs_R010_ueqv_R010YNN_partial_01_0119,
  rs_R010_ueqv_R010YNN_partial_01_0120,
  rs_R010_ueqv_R010YNN_partial_01_0121,
  rs_R010_ueqv_R010YNN_partial_01_0122,
  rs_R010_ueqv_R010YNN_partial_01_0123,
  rs_R010_ueqv_R010YNN_partial_01_0124,
  rs_R010_ueqv_R010YNN_partial_01_0125,
  rs_R010_ueqv_R010YNN_partial_01_0126,
  rs_R010_ueqv_R010YNN_partial_01_0127,
  rs_R010_ueqv_R010YNN_partial_01_0128,
  rs_R010_ueqv_R010YNN_partial_01_0129,
  rs_R010_ueqv_R010YNN_partial_01_0130,
  rs_R010_ueqv_R010YNN_partial_01_0131,
  rs_R010_ueqv_R010YNN_partial_01_0132
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_01_0100_0132 : Poly :=
[
  term ((53028754680678991096 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((4480848481102361272 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1693975153504287628 : Rat) / 89830441576176585) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-97263739797401274634 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((22287675336467310701 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((4397984485405254587 : Rat) / 89830441576176585) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-60324550220242880 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-464035001694176000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((106728050389660480 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((85846475313422560 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-4916473791676765376 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((6601422648961382528 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((5368203664041180424 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((-8836150542388027136 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-398393564445175552 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((72458848675759744 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6772042374061821632 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-14313905552680142816 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((3041784130311057824 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((5331170877180266176 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-12758568616859088128 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((-23313765249534971954 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((-8572974611816032012 : Rat) / 449152207880882925) [(0, 2), (5, 2), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 2), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((6076664113681020992 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((8995322844617318528 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((53028754680678991096 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((4480848481102361272 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1693975153504287628 : Rat) / 89830441576176585) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-97263739797401274634 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((22287675336467310701 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((4397984485405254587 : Rat) / 89830441576176585) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-60324550220242880 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-464035001694176000 : Rat) / 17966088315235317) [(1, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((106728050389660480 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((85846475313422560 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-4916473791676765376 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((6601422648961382528 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5487738644895360128 : Rat) / 89830441576176585) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1793305900789760 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((5368203664041180424 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((-8836150542388027136 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-398393564445175552 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((72458848675759744 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6772042374061821632 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-14313905552680142816 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((3041784130311057824 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((5331170877180266176 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-12758568616859088128 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-23313765249534971954 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-8572974611816032012 : Rat) / 449152207880882925) [(1, 2), (5, 2), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 2), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-7658156114314807552 : Rat) / 269491324728529755) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((6076664113681020992 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((8995322844617318528 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((-53028754680678991096 : Rat) / 4042369870927946325) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-4480848481102361272 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (10, 1), (13, 1), (16, 1)],
  term ((1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((97263739797401274634 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-22287675336467310701 : Rat) / 1347456623642648775) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-4397984485405254587 : Rat) / 89830441576176585) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((-53028754680678991096 : Rat) / 4042369870927946325) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-4480848481102361272 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((1693975153504287628 : Rat) / 89830441576176585) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((97263739797401274634 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-22287675336467310701 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-4397984485405254587 : Rat) / 89830441576176585) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-106728050389660480 : Rat) / 5988696105078439) [(5, 2), (6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 2), (9, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)],
  term ((60324550220242880 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 3), (11, 1), (16, 1)],
  term ((464035001694176000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (9, 3), (13, 1), (16, 1)],
  term ((-106728050389660480 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 4), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 3), (16, 1)],
  term ((-60324550220242880 : Rat) / 5988696105078439) [(5, 2), (7, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-85846475313422560 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 2), (9, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 3), (9, 1), (16, 1)],
  term ((-60324550220242880 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 3), (10, 1), (16, 1)],
  term ((-85846475313422560 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 3), (16, 1)],
  term ((-5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (9, 2), (16, 1)],
  term ((4916473791676765376 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((-6601422648961382528 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 4), (16, 1)],
  term ((8836150542388027136 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((398393564445175552 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-72458848675759744 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6772042374061821632 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((14313905552680142816 : Rat) / 89830441576176585) [(5, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3041784130311057824 : Rat) / 17966088315235317) [(5, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5331170877180266176 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 2), (10, 1), (16, 1)],
  term ((12758568616859088128 : Rat) / 269491324728529755) [(5, 2), (8, 2), (9, 2), (16, 1)],
  term ((23313765249534971954 : Rat) / 1347456623642648775) [(5, 2), (8, 2), (10, 1), (16, 1)],
  term ((8572974611816032012 : Rat) / 449152207880882925) [(5, 2), (8, 2), (16, 1)],
  term ((4916473791676765376 : Rat) / 269491324728529755) [(5, 2), (8, 3), (9, 1), (11, 1), (16, 1)],
  term ((-6601422648961382528 : Rat) / 89830441576176585) [(5, 2), (8, 3), (9, 1), (13, 1), (16, 1)],
  term ((5487738644895360128 : Rat) / 89830441576176585) [(5, 2), (8, 3), (9, 1), (15, 1), (16, 1)],
  term ((-1793305900789760 : Rat) / 53898264945705951) [(5, 2), (8, 3), (9, 2), (16, 1)],
  term ((-5368203664041180424 : Rat) / 1347456623642648775) [(5, 2), (8, 3), (16, 1)],
  term ((23313765249534971954 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (10, 1), (16, 1)],
  term ((8572974611816032012 : Rat) / 449152207880882925) [(5, 2), (9, 2), (16, 1)],
  term ((8836150542388027136 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((398393564445175552 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-72458848675759744 : Rat) / 17966088315235317) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-6772042374061821632 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (16, 1)],
  term ((14313905552680142816 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-3041784130311057824 : Rat) / 17966088315235317) [(5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-5331170877180266176 : Rat) / 269491324728529755) [(5, 2), (9, 4), (10, 1), (16, 1)],
  term ((12758568616859088128 : Rat) / 269491324728529755) [(5, 2), (9, 4), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (8, 2), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 3), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 3), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-8995322844617318528 : Rat) / 269491324728529755) [(5, 3), (8, 2), (9, 1), (16, 1)],
  term ((7658156114314807552 : Rat) / 269491324728529755) [(5, 3), (8, 3), (9, 1), (16, 1)],
  term ((-6076664113681020992 : Rat) / 269491324728529755) [(5, 3), (9, 3), (10, 1), (16, 1)],
  term ((-8995322844617318528 : Rat) / 269491324728529755) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 100 through 132. -/
theorem rs_R010_ueqv_R010YNN_block_01_0100_0132_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_01_0100_0132
      rs_R010_ueqv_R010YNN_block_01_0100_0132 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
