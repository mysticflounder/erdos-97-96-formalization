/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 0:100-178

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 0 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_00_0100_0178 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0100 : Poly :=
[
  term ((-786342780941490011192 : Rat) / 314931072359881393269) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0100 : Poly :=
[
  term ((-786342780941490011192 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-786342780941490011192 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((786342780941490011192 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((786342780941490011192 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0100_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0100
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0101 : Poly :=
[
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 101 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0101 : Poly :=
[
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 629862144719762786538) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 629862144719762786538) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0101_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0101
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0102 : Poly :=
[
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0102 : Poly :=
[
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 209954048239920928846) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0102_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0102
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0103 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 103 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0103 : Poly :=
[
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0103_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0103
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0104 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0104 : Poly :=
[
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0104_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0104
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0105 : Poly :=
[
  term ((280547526197204000736115 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 105 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0105 : Poly :=
[
  term ((280547526197204000736115 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((280547526197204000736115 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-280547526197204000736115 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-280547526197204000736115 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0105_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0105
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0106 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0106 : Poly :=
[
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0106_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0106
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0107 : Poly :=
[
  term ((-91189735697380919524585 : Rat) / 419908096479841857692) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 107 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0107 : Poly :=
[
  term ((-91189735697380919524585 : Rat) / 419908096479841857692) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-91189735697380919524585 : Rat) / 419908096479841857692) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((91189735697380919524585 : Rat) / 419908096479841857692) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((91189735697380919524585 : Rat) / 419908096479841857692) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0107_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0107
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0108 : Poly :=
[
  term ((3100725265542746542320 : Rat) / 6175119065880027319) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0108 : Poly :=
[
  term ((3100725265542746542320 : Rat) / 6175119065880027319) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((3100725265542746542320 : Rat) / 6175119065880027319) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3100725265542746542320 : Rat) / 6175119065880027319) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3100725265542746542320 : Rat) / 6175119065880027319) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0108_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0108
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0109 : Poly :=
[
  term ((110266557944269863015595 : Rat) / 204279614503706849688) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 109 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0109 : Poly :=
[
  term ((110266557944269863015595 : Rat) / 204279614503706849688) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((110266557944269863015595 : Rat) / 204279614503706849688) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-110266557944269863015595 : Rat) / 204279614503706849688) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-110266557944269863015595 : Rat) / 204279614503706849688) [(3, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0109_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0109
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0110 : Poly :=
[
  term ((-56109505239440800147223 : Rat) / 314931072359881393269) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0110 : Poly :=
[
  term ((-56109505239440800147223 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56109505239440800147223 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((56109505239440800147223 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((56109505239440800147223 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0110_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0110
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0111 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0111 : Poly :=
[
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0111_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0111
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0112 : Poly :=
[
  term ((54713841418428551714751 : Rat) / 419908096479841857692) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0112 : Poly :=
[
  term ((54713841418428551714751 : Rat) / 419908096479841857692) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((54713841418428551714751 : Rat) / 419908096479841857692) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54713841418428551714751 : Rat) / 419908096479841857692) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54713841418428551714751 : Rat) / 419908096479841857692) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0112_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0112
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0113 : Poly :=
[
  term ((-22053311588853972603119 : Rat) / 68093204834568949896) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0113 : Poly :=
[
  term ((-22053311588853972603119 : Rat) / 68093204834568949896) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-22053311588853972603119 : Rat) / 68093204834568949896) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((22053311588853972603119 : Rat) / 68093204834568949896) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((22053311588853972603119 : Rat) / 68093204834568949896) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0113_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0113
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0114 : Poly :=
[
  term ((-1860435159325647925392 : Rat) / 6175119065880027319) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 114 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0114 : Poly :=
[
  term ((-1860435159325647925392 : Rat) / 6175119065880027319) [(0, 2), (5, 1), (15, 3), (16, 1)],
  term ((-1860435159325647925392 : Rat) / 6175119065880027319) [(1, 2), (5, 1), (15, 3), (16, 1)],
  term ((1860435159325647925392 : Rat) / 6175119065880027319) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((1860435159325647925392 : Rat) / 6175119065880027319) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0114_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0114
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0115 : Poly :=
[
  term ((61461385264115124582025 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 115 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0115 : Poly :=
[
  term ((61461385264115124582025 : Rat) / 104977024119960464423) [(0, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((61461385264115124582025 : Rat) / 104977024119960464423) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-61461385264115124582025 : Rat) / 104977024119960464423) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-61461385264115124582025 : Rat) / 104977024119960464423) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0115_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0115
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0116 : Poly :=
[
  term ((-36876831158469074749215 : Rat) / 104977024119960464423) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0116 : Poly :=
[
  term ((-36876831158469074749215 : Rat) / 104977024119960464423) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-36876831158469074749215 : Rat) / 104977024119960464423) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((36876831158469074749215 : Rat) / 104977024119960464423) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((36876831158469074749215 : Rat) / 104977024119960464423) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0116_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0116
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0117 : Poly :=
[
  term ((-8266469230966924024145 : Rat) / 19281494226115187343) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 117 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0117 : Poly :=
[
  term ((-8266469230966924024145 : Rat) / 19281494226115187343) [(0, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8266469230966924024145 : Rat) / 19281494226115187343) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((8266469230966924024145 : Rat) / 19281494226115187343) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((8266469230966924024145 : Rat) / 19281494226115187343) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0117_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0117
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0118 : Poly :=
[
  term ((-6711156976628389708785 : Rat) / 209954048239920928846) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0118 : Poly :=
[
  term ((-6711156976628389708785 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6711156976628389708785 : Rat) / 209954048239920928846) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6711156976628389708785 : Rat) / 209954048239920928846) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6711156976628389708785 : Rat) / 209954048239920928846) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0118_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0118
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0119 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 119 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0119 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(0, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 2), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0119_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0119
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0120 : Poly :=
[
  term ((996820702434231940086005 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 120 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0120 : Poly :=
[
  term ((996820702434231940086005 : Rat) / 7558345736637153438456) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((996820702434231940086005 : Rat) / 7558345736637153438456) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-996820702434231940086005 : Rat) / 7558345736637153438456) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-996820702434231940086005 : Rat) / 7558345736637153438456) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0120_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0120
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0121 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 3779172868318576719228) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 121 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0121 : Poly :=
[
  term ((491656423605717141358255 : Rat) / 3779172868318576719228) [(0, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((491656423605717141358255 : Rat) / 3779172868318576719228) [(1, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(2, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(3, 2), (7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0121_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0121
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0122 : Poly :=
[
  term ((-1016934515148052353188825 : Rat) / 1259724289439525573076) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0122 : Poly :=
[
  term ((-1016934515148052353188825 : Rat) / 1259724289439525573076) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1016934515148052353188825 : Rat) / 1259724289439525573076) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1016934515148052353188825 : Rat) / 1259724289439525573076) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1016934515148052353188825 : Rat) / 1259724289439525573076) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0122_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0122
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0123 : Poly :=
[
  term ((111542065144875792102955 : Rat) / 7558345736637153438456) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 123 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0123 : Poly :=
[
  term ((111542065144875792102955 : Rat) / 7558345736637153438456) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((111542065144875792102955 : Rat) / 7558345736637153438456) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-111542065144875792102955 : Rat) / 7558345736637153438456) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-111542065144875792102955 : Rat) / 7558345736637153438456) [(3, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0123_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0123
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0124 : Poly :=
[
  term ((1653293846193384804829 : Rat) / 6427164742038395781) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0124 : Poly :=
[
  term ((1653293846193384804829 : Rat) / 6427164742038395781) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1653293846193384804829 : Rat) / 6427164742038395781) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1653293846193384804829 : Rat) / 6427164742038395781) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1653293846193384804829 : Rat) / 6427164742038395781) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0124_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0124
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0125 : Poly :=
[
  term ((4026694185977033825271 : Rat) / 209954048239920928846) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0125 : Poly :=
[
  term ((4026694185977033825271 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((4026694185977033825271 : Rat) / 209954048239920928846) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4026694185977033825271 : Rat) / 209954048239920928846) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4026694185977033825271 : Rat) / 209954048239920928846) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0125_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0125
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0126 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0126 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0126_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0126
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0127 : Poly :=
[
  term ((-199364140486846388017201 : Rat) / 2519448578879051146152) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0127 : Poly :=
[
  term ((-199364140486846388017201 : Rat) / 2519448578879051146152) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-199364140486846388017201 : Rat) / 2519448578879051146152) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((199364140486846388017201 : Rat) / 2519448578879051146152) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((199364140486846388017201 : Rat) / 2519448578879051146152) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0127_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0127
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0128 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 1259724289439525573076) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0128 : Poly :=
[
  term ((-98331284721143428271651 : Rat) / 1259724289439525573076) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 1259724289439525573076) [(1, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0128_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0128
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0129 : Poly :=
[
  term ((-8555892600271297760709 : Rat) / 839816192959683715384) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0129 : Poly :=
[
  term ((-8555892600271297760709 : Rat) / 839816192959683715384) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-8555892600271297760709 : Rat) / 839816192959683715384) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((8555892600271297760709 : Rat) / 839816192959683715384) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((8555892600271297760709 : Rat) / 839816192959683715384) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0129_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0129
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0130 : Poly :=
[
  term ((203386903029610470637765 : Rat) / 419908096479841857692) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 130 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0130 : Poly :=
[
  term ((203386903029610470637765 : Rat) / 419908096479841857692) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((203386903029610470637765 : Rat) / 419908096479841857692) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((-203386903029610470637765 : Rat) / 419908096479841857692) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-203386903029610470637765 : Rat) / 419908096479841857692) [(3, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0130_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0130
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0131 : Poly :=
[
  term ((-2 : Rat) / 3) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 131 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0131 : Poly :=
[
  term ((-2 : Rat) / 3) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0131_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0131
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0132 : Poly :=
[
  term ((1 : Rat) / 3) [(7, 2), (16, 1)]
]

/-- Partial product 132 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0132 : Poly :=
[
  term ((1 : Rat) / 3) [(0, 2), (7, 2), (16, 1)],
  term ((1 : Rat) / 3) [(1, 2), (7, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(2, 2), (7, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(3, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0132_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0132
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0133 : Poly :=
[
  term ((221851295542241594346410 : Rat) / 944793217079644179807) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0133 : Poly :=
[
  term ((221851295542241594346410 : Rat) / 944793217079644179807) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((221851295542241594346410 : Rat) / 944793217079644179807) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-221851295542241594346410 : Rat) / 944793217079644179807) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-221851295542241594346410 : Rat) / 944793217079644179807) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0133_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0133
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0134 : Poly :=
[
  term ((2684073563320887806659855 : Rat) / 3779172868318576719228) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0134 : Poly :=
[
  term ((2684073563320887806659855 : Rat) / 3779172868318576719228) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((2684073563320887806659855 : Rat) / 3779172868318576719228) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2684073563320887806659855 : Rat) / 3779172868318576719228) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2684073563320887806659855 : Rat) / 3779172868318576719228) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0134_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0134
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0135 : Poly :=
[
  term ((-1268577488839149672503525 : Rat) / 3779172868318576719228) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 135 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0135 : Poly :=
[
  term ((-1268577488839149672503525 : Rat) / 3779172868318576719228) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-1268577488839149672503525 : Rat) / 3779172868318576719228) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((1268577488839149672503525 : Rat) / 3779172868318576719228) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((1268577488839149672503525 : Rat) / 3779172868318576719228) [(3, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0135_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0135
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0136 : Poly :=
[
  term ((-44370259108448318869282 : Rat) / 314931072359881393269) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0136 : Poly :=
[
  term ((-44370259108448318869282 : Rat) / 314931072359881393269) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-44370259108448318869282 : Rat) / 314931072359881393269) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((44370259108448318869282 : Rat) / 314931072359881393269) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((44370259108448318869282 : Rat) / 314931072359881393269) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0136_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0136
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0137 : Poly :=
[
  term ((-5655667852992347068111 : Rat) / 18525357197640081957) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 137 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0137 : Poly :=
[
  term ((-5655667852992347068111 : Rat) / 18525357197640081957) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-5655667852992347068111 : Rat) / 18525357197640081957) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((5655667852992347068111 : Rat) / 18525357197640081957) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((5655667852992347068111 : Rat) / 18525357197640081957) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0137_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0137
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0138 : Poly :=
[
  term ((29898813728725695957765 : Rat) / 419908096479841857692) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 138 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0138 : Poly :=
[
  term ((29898813728725695957765 : Rat) / 419908096479841857692) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((29898813728725695957765 : Rat) / 419908096479841857692) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-29898813728725695957765 : Rat) / 419908096479841857692) [(2, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-29898813728725695957765 : Rat) / 419908096479841857692) [(3, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0138_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0138
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0139 : Poly :=
[
  term ((-17939288237235417574659 : Rat) / 419908096479841857692) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0139 : Poly :=
[
  term ((-17939288237235417574659 : Rat) / 419908096479841857692) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17939288237235417574659 : Rat) / 419908096479841857692) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17939288237235417574659 : Rat) / 419908096479841857692) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17939288237235417574659 : Rat) / 419908096479841857692) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0139_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0139
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0140 : Poly :=
[
  term ((-42296427274686633334630 : Rat) / 104977024119960464423) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 140 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0140 : Poly :=
[
  term ((-42296427274686633334630 : Rat) / 104977024119960464423) [(0, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-42296427274686633334630 : Rat) / 104977024119960464423) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((42296427274686633334630 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((42296427274686633334630 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0140_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0140
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0141 : Poly :=
[
  term ((-477881280841191497300725 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 141 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0141 : Poly :=
[
  term ((-477881280841191497300725 : Rat) / 944793217079644179807) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-477881280841191497300725 : Rat) / 944793217079644179807) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((477881280841191497300725 : Rat) / 944793217079644179807) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((477881280841191497300725 : Rat) / 944793217079644179807) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0141_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0141
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0142 : Poly :=
[
  term ((783952514245700707700015 : Rat) / 1889586434159288359614) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 142 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0142 : Poly :=
[
  term ((783952514245700707700015 : Rat) / 1889586434159288359614) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((783952514245700707700015 : Rat) / 1889586434159288359614) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-783952514245700707700015 : Rat) / 1889586434159288359614) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-783952514245700707700015 : Rat) / 1889586434159288359614) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0142_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0142
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0143 : Poly :=
[
  term ((25377856364811980000778 : Rat) / 104977024119960464423) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0143 : Poly :=
[
  term ((25377856364811980000778 : Rat) / 104977024119960464423) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((25377856364811980000778 : Rat) / 104977024119960464423) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25377856364811980000778 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25377856364811980000778 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0143_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0143
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0144 : Poly :=
[
  term ((95576256168238299460145 : Rat) / 314931072359881393269) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0144 : Poly :=
[
  term ((95576256168238299460145 : Rat) / 314931072359881393269) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((95576256168238299460145 : Rat) / 314931072359881393269) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95576256168238299460145 : Rat) / 314931072359881393269) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-95576256168238299460145 : Rat) / 314931072359881393269) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0144_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0144
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0145 : Poly :=
[
  term ((-156790502849140141540003 : Rat) / 629862144719762786538) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0145 : Poly :=
[
  term ((-156790502849140141540003 : Rat) / 629862144719762786538) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-156790502849140141540003 : Rat) / 629862144719762786538) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((156790502849140141540003 : Rat) / 629862144719762786538) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((156790502849140141540003 : Rat) / 629862144719762786538) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0145_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0145
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0146 : Poly :=
[
  term ((-21198539313498540667445 : Rat) / 209954048239920928846) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 146 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0146 : Poly :=
[
  term ((-21198539313498540667445 : Rat) / 209954048239920928846) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-21198539313498540667445 : Rat) / 209954048239920928846) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((21198539313498540667445 : Rat) / 209954048239920928846) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((21198539313498540667445 : Rat) / 209954048239920928846) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0146_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0146
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0147 : Poly :=
[
  term ((112332570233612930494967 : Rat) / 1259724289439525573076) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0147 : Poly :=
[
  term ((112332570233612930494967 : Rat) / 1259724289439525573076) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((112332570233612930494967 : Rat) / 1259724289439525573076) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-112332570233612930494967 : Rat) / 1259724289439525573076) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-112332570233612930494967 : Rat) / 1259724289439525573076) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0147_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0147
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0148 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(10, 1), (11, 2), (16, 1)]
]

/-- Partial product 148 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0148 : Poly :=
[
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(0, 2), (10, 1), (11, 2), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(1, 2), (10, 1), (11, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 2), (10, 1), (11, 2), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 2), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0148_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0148
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0149 : Poly :=
[
  term ((12719123588099124400467 : Rat) / 209954048239920928846) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0149 : Poly :=
[
  term ((12719123588099124400467 : Rat) / 209954048239920928846) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((12719123588099124400467 : Rat) / 209954048239920928846) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12719123588099124400467 : Rat) / 209954048239920928846) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12719123588099124400467 : Rat) / 209954048239920928846) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0149_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0149
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0150 : Poly :=
[
  term ((-29168669452000732892355 : Rat) / 419908096479841857692) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 150 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0150 : Poly :=
[
  term ((-29168669452000732892355 : Rat) / 419908096479841857692) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-29168669452000732892355 : Rat) / 419908096479841857692) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((29168669452000732892355 : Rat) / 419908096479841857692) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((29168669452000732892355 : Rat) / 419908096479841857692) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0150_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0150
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0151 : Poly :=
[
  term ((-2 : Rat) / 3) [(10, 1), (16, 1)]
]

/-- Partial product 151 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0151 : Poly :=
[
  term ((-2 : Rat) / 3) [(0, 2), (10, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (10, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (10, 1), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0151_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0151
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0152 : Poly :=
[
  term ((15106333406146649188490 : Rat) / 314931072359881393269) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 152 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0152 : Poly :=
[
  term ((15106333406146649188490 : Rat) / 314931072359881393269) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((15106333406146649188490 : Rat) / 314931072359881393269) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-15106333406146649188490 : Rat) / 314931072359881393269) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-15106333406146649188490 : Rat) / 314931072359881393269) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0152_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0152
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0153 : Poly :=
[
  term ((402352605665510998595999 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0153 : Poly :=
[
  term ((402352605665510998595999 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((402352605665510998595999 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-402352605665510998595999 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-402352605665510998595999 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0153_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0153
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0154 : Poly :=
[
  term ((-72035427136264351841885 : Rat) / 179960612777075081868) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 154 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0154 : Poly :=
[
  term ((-72035427136264351841885 : Rat) / 179960612777075081868) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72035427136264351841885 : Rat) / 179960612777075081868) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72035427136264351841885 : Rat) / 179960612777075081868) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((72035427136264351841885 : Rat) / 179960612777075081868) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0154_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0154
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0155 : Poly :=
[
  term ((8875220688151803796000 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 155 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0155 : Poly :=
[
  term ((8875220688151803796000 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((8875220688151803796000 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 44990153194268770467) [(2, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 44990153194268770467) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0155_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0155
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0156 : Poly :=
[
  term ((33725838614976854424800 : Rat) / 134970459582806311401) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 156 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0156 : Poly :=
[
  term ((33725838614976854424800 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((33725838614976854424800 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33725838614976854424800 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-33725838614976854424800 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0156_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0156
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0157 : Poly :=
[
  term ((124478519198137207181170 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 157 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0157 : Poly :=
[
  term ((124478519198137207181170 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((124478519198137207181170 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-124478519198137207181170 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-124478519198137207181170 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0157_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0157
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0158 : Poly :=
[
  term ((568175665930391325123526 : Rat) / 944793217079644179807) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0158 : Poly :=
[
  term ((568175665930391325123526 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((568175665930391325123526 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-568175665930391325123526 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-568175665930391325123526 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0158_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0158
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0159 : Poly :=
[
  term ((-565098653296578342128455 : Rat) / 1889586434159288359614) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0159 : Poly :=
[
  term ((-565098653296578342128455 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-565098653296578342128455 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((565098653296578342128455 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((565098653296578342128455 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0159_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0159
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0160 : Poly :=
[
  term ((-29584102742155125800299 : Rat) / 36251058688907210736) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0160 : Poly :=
[
  term ((-29584102742155125800299 : Rat) / 36251058688907210736) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-29584102742155125800299 : Rat) / 36251058688907210736) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((29584102742155125800299 : Rat) / 36251058688907210736) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((29584102742155125800299 : Rat) / 36251058688907210736) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0160_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0160
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0161 : Poly :=
[
  term ((-711681691860367945315175 : Rat) / 1889586434159288359614) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 161 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0161 : Poly :=
[
  term ((-711681691860367945315175 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((-711681691860367945315175 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((711681691860367945315175 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((711681691860367945315175 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0161_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0161
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0162 : Poly :=
[
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 162 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0162 : Poly :=
[
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(0, 2), (11, 2), (12, 1), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0162_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0162
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0163 : Poly :=
[
  term ((-113553915494321961984695 : Rat) / 539881838331225245604) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 163 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0163 : Poly :=
[
  term ((-113553915494321961984695 : Rat) / 539881838331225245604) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((-113553915494321961984695 : Rat) / 539881838331225245604) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((113553915494321961984695 : Rat) / 539881838331225245604) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((113553915494321961984695 : Rat) / 539881838331225245604) [(3, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0163_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0163
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0164 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 164 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0164 : Poly :=
[
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0164_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0164
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0165 : Poly :=
[
  term ((-261210696703837211163565 : Rat) / 314931072359881393269) [(11, 2), (16, 1)]
]

/-- Partial product 165 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0165 : Poly :=
[
  term ((-261210696703837211163565 : Rat) / 314931072359881393269) [(0, 2), (11, 2), (16, 1)],
  term ((-261210696703837211163565 : Rat) / 314931072359881393269) [(1, 2), (11, 2), (16, 1)],
  term ((261210696703837211163565 : Rat) / 314931072359881393269) [(2, 2), (11, 2), (16, 1)],
  term ((261210696703837211163565 : Rat) / 314931072359881393269) [(3, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0165_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0165
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0166 : Poly :=
[
  term ((-3021266681229329837698 : Rat) / 104977024119960464423) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0166 : Poly :=
[
  term ((-3021266681229329837698 : Rat) / 104977024119960464423) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3021266681229329837698 : Rat) / 104977024119960464423) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3021266681229329837698 : Rat) / 104977024119960464423) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3021266681229329837698 : Rat) / 104977024119960464423) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0166_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0166
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0167 : Poly :=
[
  term ((-167867361319816036272119 : Rat) / 629862144719762786538) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 167 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0167 : Poly :=
[
  term ((-167867361319816036272119 : Rat) / 629862144719762786538) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-167867361319816036272119 : Rat) / 629862144719762786538) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((167867361319816036272119 : Rat) / 629862144719762786538) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((167867361319816036272119 : Rat) / 629862144719762786538) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0167_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0167
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0168 : Poly :=
[
  term ((-2 : Rat) / 3) [(12, 1), (16, 1)]
]

/-- Partial product 168 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0168 : Poly :=
[
  term ((-2 : Rat) / 3) [(0, 2), (12, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (12, 1), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (12, 1), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0168_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0168
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0169 : Poly :=
[
  term ((14407085427252870368377 : Rat) / 59986870925691693956) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0169 : Poly :=
[
  term ((14407085427252870368377 : Rat) / 59986870925691693956) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14407085427252870368377 : Rat) / 59986870925691693956) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14407085427252870368377 : Rat) / 59986870925691693956) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14407085427252870368377 : Rat) / 59986870925691693956) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0169_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0169
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0170 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 14996717731422923489) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0170 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 14996717731422923489) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 14996717731422923489) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 14996717731422923489) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 14996717731422923489) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0170_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0170
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0171 : Poly :=
[
  term ((-24895703839627441436234 : Rat) / 314931072359881393269) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0171 : Poly :=
[
  term ((-24895703839627441436234 : Rat) / 314931072359881393269) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24895703839627441436234 : Rat) / 314931072359881393269) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((24895703839627441436234 : Rat) / 314931072359881393269) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((24895703839627441436234 : Rat) / 314931072359881393269) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0171_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0171
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0172 : Poly :=
[
  term ((-6745167722995370884960 : Rat) / 44990153194268770467) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 172 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0172 : Poly :=
[
  term ((-6745167722995370884960 : Rat) / 44990153194268770467) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-6745167722995370884960 : Rat) / 44990153194268770467) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((6745167722995370884960 : Rat) / 44990153194268770467) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((6745167722995370884960 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0172_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0172
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0173 : Poly :=
[
  term ((-359155243729082612031677 : Rat) / 1259724289439525573076) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 173 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0173 : Poly :=
[
  term ((-359155243729082612031677 : Rat) / 1259724289439525573076) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-359155243729082612031677 : Rat) / 1259724289439525573076) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((359155243729082612031677 : Rat) / 1259724289439525573076) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((359155243729082612031677 : Rat) / 1259724289439525573076) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0173_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0173
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0174 : Poly :=
[
  term ((1 : Rat) / 2) [(14, 1), (16, 1)]
]

/-- Partial product 174 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0174 : Poly :=
[
  term ((1 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 2) [(1, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(2, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 2) [(3, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0174_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0174
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0175 : Poly :=
[
  term ((113019730659315668425691 : Rat) / 629862144719762786538) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 175 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0175 : Poly :=
[
  term ((113019730659315668425691 : Rat) / 629862144719762786538) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((113019730659315668425691 : Rat) / 629862144719762786538) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((-113019730659315668425691 : Rat) / 629862144719762786538) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((-113019730659315668425691 : Rat) / 629862144719762786538) [(3, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0175_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0175
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0176 : Poly :=
[
  term ((1872648647670834430951 : Rat) / 2375717660423433424) [(15, 2), (16, 1)]
]

/-- Partial product 176 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0176 : Poly :=
[
  term ((1872648647670834430951 : Rat) / 2375717660423433424) [(0, 2), (15, 2), (16, 1)],
  term ((1872648647670834430951 : Rat) / 2375717660423433424) [(1, 2), (15, 2), (16, 1)],
  term ((-1872648647670834430951 : Rat) / 2375717660423433424) [(2, 2), (15, 2), (16, 1)],
  term ((-1872648647670834430951 : Rat) / 2375717660423433424) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0176_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0176
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0177 : Poly :=
[
  term ((132900225000775708928731 : Rat) / 629862144719762786538) [(15, 4), (16, 1)]
]

/-- Partial product 177 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0177 : Poly :=
[
  term ((132900225000775708928731 : Rat) / 629862144719762786538) [(0, 2), (15, 4), (16, 1)],
  term ((132900225000775708928731 : Rat) / 629862144719762786538) [(1, 2), (15, 4), (16, 1)],
  term ((-132900225000775708928731 : Rat) / 629862144719762786538) [(2, 2), (15, 4), (16, 1)],
  term ((-132900225000775708928731 : Rat) / 629862144719762786538) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0177_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0177
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 0. -/
def rs_R007_ueqv_R007NY_coefficient_00_0178 : Poly :=
[
  term ((1 : Rat) / 12) [(16, 1)]
]

/-- Partial product 178 for generator 0. -/
def rs_R007_ueqv_R007NY_partial_00_0178 : Poly :=
[
  term ((1 : Rat) / 12) [(0, 2), (16, 1)],
  term ((1 : Rat) / 12) [(1, 2), (16, 1)],
  term ((-1 : Rat) / 12) [(2, 2), (16, 1)],
  term ((-1 : Rat) / 12) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 0. -/
theorem rs_R007_ueqv_R007NY_partial_00_0178_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_00_0178
        rs_R007_ueqv_R007NY_generator_00_0100_0178 =
      rs_R007_ueqv_R007NY_partial_00_0178 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_00_0100_0178 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_00_0100,
  rs_R007_ueqv_R007NY_partial_00_0101,
  rs_R007_ueqv_R007NY_partial_00_0102,
  rs_R007_ueqv_R007NY_partial_00_0103,
  rs_R007_ueqv_R007NY_partial_00_0104,
  rs_R007_ueqv_R007NY_partial_00_0105,
  rs_R007_ueqv_R007NY_partial_00_0106,
  rs_R007_ueqv_R007NY_partial_00_0107,
  rs_R007_ueqv_R007NY_partial_00_0108,
  rs_R007_ueqv_R007NY_partial_00_0109,
  rs_R007_ueqv_R007NY_partial_00_0110,
  rs_R007_ueqv_R007NY_partial_00_0111,
  rs_R007_ueqv_R007NY_partial_00_0112,
  rs_R007_ueqv_R007NY_partial_00_0113,
  rs_R007_ueqv_R007NY_partial_00_0114,
  rs_R007_ueqv_R007NY_partial_00_0115,
  rs_R007_ueqv_R007NY_partial_00_0116,
  rs_R007_ueqv_R007NY_partial_00_0117,
  rs_R007_ueqv_R007NY_partial_00_0118,
  rs_R007_ueqv_R007NY_partial_00_0119,
  rs_R007_ueqv_R007NY_partial_00_0120,
  rs_R007_ueqv_R007NY_partial_00_0121,
  rs_R007_ueqv_R007NY_partial_00_0122,
  rs_R007_ueqv_R007NY_partial_00_0123,
  rs_R007_ueqv_R007NY_partial_00_0124,
  rs_R007_ueqv_R007NY_partial_00_0125,
  rs_R007_ueqv_R007NY_partial_00_0126,
  rs_R007_ueqv_R007NY_partial_00_0127,
  rs_R007_ueqv_R007NY_partial_00_0128,
  rs_R007_ueqv_R007NY_partial_00_0129,
  rs_R007_ueqv_R007NY_partial_00_0130,
  rs_R007_ueqv_R007NY_partial_00_0131,
  rs_R007_ueqv_R007NY_partial_00_0132,
  rs_R007_ueqv_R007NY_partial_00_0133,
  rs_R007_ueqv_R007NY_partial_00_0134,
  rs_R007_ueqv_R007NY_partial_00_0135,
  rs_R007_ueqv_R007NY_partial_00_0136,
  rs_R007_ueqv_R007NY_partial_00_0137,
  rs_R007_ueqv_R007NY_partial_00_0138,
  rs_R007_ueqv_R007NY_partial_00_0139,
  rs_R007_ueqv_R007NY_partial_00_0140,
  rs_R007_ueqv_R007NY_partial_00_0141,
  rs_R007_ueqv_R007NY_partial_00_0142,
  rs_R007_ueqv_R007NY_partial_00_0143,
  rs_R007_ueqv_R007NY_partial_00_0144,
  rs_R007_ueqv_R007NY_partial_00_0145,
  rs_R007_ueqv_R007NY_partial_00_0146,
  rs_R007_ueqv_R007NY_partial_00_0147,
  rs_R007_ueqv_R007NY_partial_00_0148,
  rs_R007_ueqv_R007NY_partial_00_0149,
  rs_R007_ueqv_R007NY_partial_00_0150,
  rs_R007_ueqv_R007NY_partial_00_0151,
  rs_R007_ueqv_R007NY_partial_00_0152,
  rs_R007_ueqv_R007NY_partial_00_0153,
  rs_R007_ueqv_R007NY_partial_00_0154,
  rs_R007_ueqv_R007NY_partial_00_0155,
  rs_R007_ueqv_R007NY_partial_00_0156,
  rs_R007_ueqv_R007NY_partial_00_0157,
  rs_R007_ueqv_R007NY_partial_00_0158,
  rs_R007_ueqv_R007NY_partial_00_0159,
  rs_R007_ueqv_R007NY_partial_00_0160,
  rs_R007_ueqv_R007NY_partial_00_0161,
  rs_R007_ueqv_R007NY_partial_00_0162,
  rs_R007_ueqv_R007NY_partial_00_0163,
  rs_R007_ueqv_R007NY_partial_00_0164,
  rs_R007_ueqv_R007NY_partial_00_0165,
  rs_R007_ueqv_R007NY_partial_00_0166,
  rs_R007_ueqv_R007NY_partial_00_0167,
  rs_R007_ueqv_R007NY_partial_00_0168,
  rs_R007_ueqv_R007NY_partial_00_0169,
  rs_R007_ueqv_R007NY_partial_00_0170,
  rs_R007_ueqv_R007NY_partial_00_0171,
  rs_R007_ueqv_R007NY_partial_00_0172,
  rs_R007_ueqv_R007NY_partial_00_0173,
  rs_R007_ueqv_R007NY_partial_00_0174,
  rs_R007_ueqv_R007NY_partial_00_0175,
  rs_R007_ueqv_R007NY_partial_00_0176,
  rs_R007_ueqv_R007NY_partial_00_0177,
  rs_R007_ueqv_R007NY_partial_00_0178
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_00_0100_0178 : Poly :=
[
  term ((-786342780941490011192 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((280547526197204000736115 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91189735697380919524585 : Rat) / 419908096479841857692) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((3100725265542746542320 : Rat) / 6175119065880027319) [(0, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((110266557944269863015595 : Rat) / 204279614503706849688) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-56109505239440800147223 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(0, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((54713841418428551714751 : Rat) / 419908096479841857692) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22053311588853972603119 : Rat) / 68093204834568949896) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1860435159325647925392 : Rat) / 6175119065880027319) [(0, 2), (5, 1), (15, 3), (16, 1)],
  term ((61461385264115124582025 : Rat) / 104977024119960464423) [(0, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-36876831158469074749215 : Rat) / 104977024119960464423) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8266469230966924024145 : Rat) / 19281494226115187343) [(0, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6711156976628389708785 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(0, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((996820702434231940086005 : Rat) / 7558345736637153438456) [(0, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 3779172868318576719228) [(0, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1016934515148052353188825 : Rat) / 1259724289439525573076) [(0, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((111542065144875792102955 : Rat) / 7558345736637153438456) [(0, 2), (7, 1), (11, 1), (16, 1)],
  term ((1653293846193384804829 : Rat) / 6427164742038395781) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((4026694185977033825271 : Rat) / 209954048239920928846) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-199364140486846388017201 : Rat) / 2519448578879051146152) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 1259724289439525573076) [(0, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8555892600271297760709 : Rat) / 839816192959683715384) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((203386903029610470637765 : Rat) / 419908096479841857692) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(0, 2), (7, 2), (16, 1)],
  term ((221851295542241594346410 : Rat) / 944793217079644179807) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2684073563320887806659855 : Rat) / 3779172868318576719228) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1268577488839149672503525 : Rat) / 3779172868318576719228) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-44370259108448318869282 : Rat) / 314931072359881393269) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5655667852992347068111 : Rat) / 18525357197640081957) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((29898813728725695957765 : Rat) / 419908096479841857692) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-17939288237235417574659 : Rat) / 419908096479841857692) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-42296427274686633334630 : Rat) / 104977024119960464423) [(0, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-477881280841191497300725 : Rat) / 944793217079644179807) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((783952514245700707700015 : Rat) / 1889586434159288359614) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((25377856364811980000778 : Rat) / 104977024119960464423) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((95576256168238299460145 : Rat) / 314931072359881393269) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-156790502849140141540003 : Rat) / 629862144719762786538) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21198539313498540667445 : Rat) / 209954048239920928846) [(0, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((112332570233612930494967 : Rat) / 1259724289439525573076) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(0, 2), (10, 1), (11, 2), (16, 1)],
  term ((12719123588099124400467 : Rat) / 209954048239920928846) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29168669452000732892355 : Rat) / 419908096479841857692) [(0, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (10, 1), (16, 1)],
  term ((15106333406146649188490 : Rat) / 314931072359881393269) [(0, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((402352605665510998595999 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72035427136264351841885 : Rat) / 179960612777075081868) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8875220688151803796000 : Rat) / 44990153194268770467) [(0, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((33725838614976854424800 : Rat) / 134970459582806311401) [(0, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((124478519198137207181170 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((568175665930391325123526 : Rat) / 944793217079644179807) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-565098653296578342128455 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-29584102742155125800299 : Rat) / 36251058688907210736) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-711681691860367945315175 : Rat) / 1889586434159288359614) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(0, 2), (11, 2), (12, 1), (16, 1)],
  term ((-113553915494321961984695 : Rat) / 539881838331225245604) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(0, 2), (11, 2), (15, 2), (16, 1)],
  term ((-261210696703837211163565 : Rat) / 314931072359881393269) [(0, 2), (11, 2), (16, 1)],
  term ((-3021266681229329837698 : Rat) / 104977024119960464423) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-167867361319816036272119 : Rat) / 629862144719762786538) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(0, 2), (12, 1), (16, 1)],
  term ((14407085427252870368377 : Rat) / 59986870925691693956) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 14996717731422923489) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24895703839627441436234 : Rat) / 314931072359881393269) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6745167722995370884960 : Rat) / 44990153194268770467) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((-359155243729082612031677 : Rat) / 1259724289439525573076) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(0, 2), (14, 1), (16, 1)],
  term ((113019730659315668425691 : Rat) / 629862144719762786538) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((1872648647670834430951 : Rat) / 2375717660423433424) [(0, 2), (15, 2), (16, 1)],
  term ((132900225000775708928731 : Rat) / 629862144719762786538) [(0, 2), (15, 4), (16, 1)],
  term ((1 : Rat) / 12) [(0, 2), (16, 1)],
  term ((-786342780941490011192 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((2790737854788069213275 : Rat) / 629862144719762786538) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-558147570957613842655 : Rat) / 209954048239920928846) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((9829284761768625139900 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1965856952353725027980 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((280547526197204000736115 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91189735697380919524585 : Rat) / 419908096479841857692) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((3100725265542746542320 : Rat) / 6175119065880027319) [(1, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((110266557944269863015595 : Rat) / 204279614503706849688) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-56109505239440800147223 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((7863427809414900111920 : Rat) / 314931072359881393269) [(1, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((54713841418428551714751 : Rat) / 419908096479841857692) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22053311588853972603119 : Rat) / 68093204834568949896) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1860435159325647925392 : Rat) / 6175119065880027319) [(1, 2), (5, 1), (15, 3), (16, 1)],
  term ((61461385264115124582025 : Rat) / 104977024119960464423) [(1, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-36876831158469074749215 : Rat) / 104977024119960464423) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8266469230966924024145 : Rat) / 19281494226115187343) [(1, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6711156976628389708785 : Rat) / 209954048239920928846) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(1, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((996820702434231940086005 : Rat) / 7558345736637153438456) [(1, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((491656423605717141358255 : Rat) / 3779172868318576719228) [(1, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1016934515148052353188825 : Rat) / 1259724289439525573076) [(1, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((111542065144875792102955 : Rat) / 7558345736637153438456) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((1653293846193384804829 : Rat) / 6427164742038395781) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((4026694185977033825271 : Rat) / 209954048239920928846) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1420035310104288607360 : Rat) / 44990153194268770467) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-199364140486846388017201 : Rat) / 2519448578879051146152) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98331284721143428271651 : Rat) / 1259724289439525573076) [(1, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8555892600271297760709 : Rat) / 839816192959683715384) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((203386903029610470637765 : Rat) / 419908096479841857692) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((1 : Rat) / 3) [(1, 2), (7, 2), (16, 1)],
  term ((221851295542241594346410 : Rat) / 944793217079644179807) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2684073563320887806659855 : Rat) / 3779172868318576719228) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1268577488839149672503525 : Rat) / 3779172868318576719228) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((-44370259108448318869282 : Rat) / 314931072359881393269) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5655667852992347068111 : Rat) / 18525357197640081957) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((29898813728725695957765 : Rat) / 419908096479841857692) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-17939288237235417574659 : Rat) / 419908096479841857692) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-42296427274686633334630 : Rat) / 104977024119960464423) [(1, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-477881280841191497300725 : Rat) / 944793217079644179807) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((783952514245700707700015 : Rat) / 1889586434159288359614) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((25377856364811980000778 : Rat) / 104977024119960464423) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((95576256168238299460145 : Rat) / 314931072359881393269) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-156790502849140141540003 : Rat) / 629862144719762786538) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-21198539313498540667445 : Rat) / 209954048239920928846) [(1, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((112332570233612930494967 : Rat) / 1259724289439525573076) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((41888471282988417458510 : Rat) / 944793217079644179807) [(1, 2), (10, 1), (11, 2), (16, 1)],
  term ((12719123588099124400467 : Rat) / 209954048239920928846) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-29168669452000732892355 : Rat) / 419908096479841857692) [(1, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (10, 1), (16, 1)],
  term ((15106333406146649188490 : Rat) / 314931072359881393269) [(1, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((402352605665510998595999 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72035427136264351841885 : Rat) / 179960612777075081868) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8875220688151803796000 : Rat) / 44990153194268770467) [(1, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((33725838614976854424800 : Rat) / 134970459582806311401) [(1, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((124478519198137207181170 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((568175665930391325123526 : Rat) / 944793217079644179807) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-565098653296578342128455 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-29584102742155125800299 : Rat) / 36251058688907210736) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-711681691860367945315175 : Rat) / 1889586434159288359614) [(1, 2), (11, 1), (15, 3), (16, 1)],
  term ((57719325446763640280995 : Rat) / 1889586434159288359614) [(1, 2), (11, 2), (12, 1), (16, 1)],
  term ((-113553915494321961984695 : Rat) / 539881838331225245604) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(1, 2), (11, 2), (15, 2), (16, 1)],
  term ((-261210696703837211163565 : Rat) / 314931072359881393269) [(1, 2), (11, 2), (16, 1)],
  term ((-3021266681229329837698 : Rat) / 104977024119960464423) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-167867361319816036272119 : Rat) / 629862144719762786538) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(1, 2), (12, 1), (16, 1)],
  term ((14407085427252870368377 : Rat) / 59986870925691693956) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1775044137630360759200 : Rat) / 14996717731422923489) [(1, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24895703839627441436234 : Rat) / 314931072359881393269) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6745167722995370884960 : Rat) / 44990153194268770467) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-359155243729082612031677 : Rat) / 1259724289439525573076) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((1 : Rat) / 2) [(1, 2), (14, 1), (16, 1)],
  term ((113019730659315668425691 : Rat) / 629862144719762786538) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((1872648647670834430951 : Rat) / 2375717660423433424) [(1, 2), (15, 2), (16, 1)],
  term ((132900225000775708928731 : Rat) / 629862144719762786538) [(1, 2), (15, 4), (16, 1)],
  term ((1 : Rat) / 12) [(1, 2), (16, 1)],
  term ((786342780941490011192 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 629862144719762786538) [(2, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 209954048239920928846) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-280547526197204000736115 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((91189735697380919524585 : Rat) / 419908096479841857692) [(2, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3100725265542746542320 : Rat) / 6175119065880027319) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-110266557944269863015595 : Rat) / 204279614503706849688) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((56109505239440800147223 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(2, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-54713841418428551714751 : Rat) / 419908096479841857692) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((22053311588853972603119 : Rat) / 68093204834568949896) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((1860435159325647925392 : Rat) / 6175119065880027319) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((-61461385264115124582025 : Rat) / 104977024119960464423) [(2, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((36876831158469074749215 : Rat) / 104977024119960464423) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((8266469230966924024145 : Rat) / 19281494226115187343) [(2, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((6711156976628389708785 : Rat) / 209954048239920928846) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(2, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-996820702434231940086005 : Rat) / 7558345736637153438456) [(2, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(2, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((1016934515148052353188825 : Rat) / 1259724289439525573076) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-111542065144875792102955 : Rat) / 7558345736637153438456) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1653293846193384804829 : Rat) / 6427164742038395781) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4026694185977033825271 : Rat) / 209954048239920928846) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((199364140486846388017201 : Rat) / 2519448578879051146152) [(2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(2, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((8555892600271297760709 : Rat) / 839816192959683715384) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-203386903029610470637765 : Rat) / 419908096479841857692) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (7, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(2, 2), (7, 2), (16, 1)],
  term ((-221851295542241594346410 : Rat) / 944793217079644179807) [(2, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2684073563320887806659855 : Rat) / 3779172868318576719228) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1268577488839149672503525 : Rat) / 3779172868318576719228) [(2, 2), (8, 1), (11, 2), (16, 1)],
  term ((44370259108448318869282 : Rat) / 314931072359881393269) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((5655667852992347068111 : Rat) / 18525357197640081957) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-29898813728725695957765 : Rat) / 419908096479841857692) [(2, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((17939288237235417574659 : Rat) / 419908096479841857692) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((42296427274686633334630 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((477881280841191497300725 : Rat) / 944793217079644179807) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-783952514245700707700015 : Rat) / 1889586434159288359614) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-25377856364811980000778 : Rat) / 104977024119960464423) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95576256168238299460145 : Rat) / 314931072359881393269) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((156790502849140141540003 : Rat) / 629862144719762786538) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((21198539313498540667445 : Rat) / 209954048239920928846) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-112332570233612930494967 : Rat) / 1259724289439525573076) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(2, 2), (10, 1), (11, 2), (16, 1)],
  term ((-12719123588099124400467 : Rat) / 209954048239920928846) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((29168669452000732892355 : Rat) / 419908096479841857692) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (10, 1), (16, 1)],
  term ((-15106333406146649188490 : Rat) / 314931072359881393269) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-402352605665510998595999 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((72035427136264351841885 : Rat) / 179960612777075081868) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 44990153194268770467) [(2, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-33725838614976854424800 : Rat) / 134970459582806311401) [(2, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-124478519198137207181170 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-568175665930391325123526 : Rat) / 944793217079644179807) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((565098653296578342128455 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((29584102742155125800299 : Rat) / 36251058688907210736) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((711681691860367945315175 : Rat) / 1889586434159288359614) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(2, 2), (11, 2), (12, 1), (16, 1)],
  term ((113553915494321961984695 : Rat) / 539881838331225245604) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(2, 2), (11, 2), (15, 2), (16, 1)],
  term ((261210696703837211163565 : Rat) / 314931072359881393269) [(2, 2), (11, 2), (16, 1)],
  term ((3021266681229329837698 : Rat) / 104977024119960464423) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((167867361319816036272119 : Rat) / 629862144719762786538) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(2, 2), (12, 1), (16, 1)],
  term ((-14407085427252870368377 : Rat) / 59986870925691693956) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 14996717731422923489) [(2, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24895703839627441436234 : Rat) / 314931072359881393269) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((6745167722995370884960 : Rat) / 44990153194268770467) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((359155243729082612031677 : Rat) / 1259724289439525573076) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(2, 2), (14, 1), (16, 1)],
  term ((-113019730659315668425691 : Rat) / 629862144719762786538) [(2, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1872648647670834430951 : Rat) / 2375717660423433424) [(2, 2), (15, 2), (16, 1)],
  term ((-132900225000775708928731 : Rat) / 629862144719762786538) [(2, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 12) [(2, 2), (16, 1)],
  term ((786342780941490011192 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2790737854788069213275 : Rat) / 629862144719762786538) [(3, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((558147570957613842655 : Rat) / 209954048239920928846) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-9829284761768625139900 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((1965856952353725027980 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-280547526197204000736115 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((91189735697380919524585 : Rat) / 419908096479841857692) [(3, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3100725265542746542320 : Rat) / 6175119065880027319) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-110266557944269863015595 : Rat) / 204279614503706849688) [(3, 2), (5, 1), (11, 1), (16, 1)],
  term ((56109505239440800147223 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7863427809414900111920 : Rat) / 314931072359881393269) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-54713841418428551714751 : Rat) / 419908096479841857692) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((22053311588853972603119 : Rat) / 68093204834568949896) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((1860435159325647925392 : Rat) / 6175119065880027319) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-61461385264115124582025 : Rat) / 104977024119960464423) [(3, 2), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((36876831158469074749215 : Rat) / 104977024119960464423) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((8266469230966924024145 : Rat) / 19281494226115187343) [(3, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((6711156976628389708785 : Rat) / 209954048239920928846) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(3, 2), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-996820702434231940086005 : Rat) / 7558345736637153438456) [(3, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-491656423605717141358255 : Rat) / 3779172868318576719228) [(3, 2), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((1016934515148052353188825 : Rat) / 1259724289439525573076) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-111542065144875792102955 : Rat) / 7558345736637153438456) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1653293846193384804829 : Rat) / 6427164742038395781) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4026694185977033825271 : Rat) / 209954048239920928846) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((199364140486846388017201 : Rat) / 2519448578879051146152) [(3, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((98331284721143428271651 : Rat) / 1259724289439525573076) [(3, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((8555892600271297760709 : Rat) / 839816192959683715384) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-203386903029610470637765 : Rat) / 419908096479841857692) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (7, 2), (14, 1), (16, 1)],
  term ((-1 : Rat) / 3) [(3, 2), (7, 2), (16, 1)],
  term ((-221851295542241594346410 : Rat) / 944793217079644179807) [(3, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2684073563320887806659855 : Rat) / 3779172868318576719228) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1268577488839149672503525 : Rat) / 3779172868318576719228) [(3, 2), (8, 1), (11, 2), (16, 1)],
  term ((44370259108448318869282 : Rat) / 314931072359881393269) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((5655667852992347068111 : Rat) / 18525357197640081957) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-29898813728725695957765 : Rat) / 419908096479841857692) [(3, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((17939288237235417574659 : Rat) / 419908096479841857692) [(3, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((42296427274686633334630 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((477881280841191497300725 : Rat) / 944793217079644179807) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-783952514245700707700015 : Rat) / 1889586434159288359614) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((-25377856364811980000778 : Rat) / 104977024119960464423) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-95576256168238299460145 : Rat) / 314931072359881393269) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((156790502849140141540003 : Rat) / 629862144719762786538) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((21198539313498540667445 : Rat) / 209954048239920928846) [(3, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-112332570233612930494967 : Rat) / 1259724289439525573076) [(3, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41888471282988417458510 : Rat) / 944793217079644179807) [(3, 2), (10, 1), (11, 2), (16, 1)],
  term ((-12719123588099124400467 : Rat) / 209954048239920928846) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((29168669452000732892355 : Rat) / 419908096479841857692) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (10, 1), (16, 1)],
  term ((-15106333406146649188490 : Rat) / 314931072359881393269) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-402352605665510998595999 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((72035427136264351841885 : Rat) / 179960612777075081868) [(3, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8875220688151803796000 : Rat) / 44990153194268770467) [(3, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-33725838614976854424800 : Rat) / 134970459582806311401) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-124478519198137207181170 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-568175665930391325123526 : Rat) / 944793217079644179807) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((565098653296578342128455 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((29584102742155125800299 : Rat) / 36251058688907210736) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((711681691860367945315175 : Rat) / 1889586434159288359614) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((-57719325446763640280995 : Rat) / 1889586434159288359614) [(3, 2), (11, 2), (12, 1), (16, 1)],
  term ((113553915494321961984695 : Rat) / 539881838331225245604) [(3, 2), (11, 2), (14, 1), (16, 1)],
  term ((-39317139047074500559600 : Rat) / 944793217079644179807) [(3, 2), (11, 2), (15, 2), (16, 1)],
  term ((261210696703837211163565 : Rat) / 314931072359881393269) [(3, 2), (11, 2), (16, 1)],
  term ((3021266681229329837698 : Rat) / 104977024119960464423) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((167867361319816036272119 : Rat) / 629862144719762786538) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(3, 2), (12, 1), (16, 1)],
  term ((-14407085427252870368377 : Rat) / 59986870925691693956) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 14996717731422923489) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((24895703839627441436234 : Rat) / 314931072359881393269) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((6745167722995370884960 : Rat) / 44990153194268770467) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((359155243729082612031677 : Rat) / 1259724289439525573076) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 2) [(3, 2), (14, 1), (16, 1)],
  term ((-113019730659315668425691 : Rat) / 629862144719762786538) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1872648647670834430951 : Rat) / 2375717660423433424) [(3, 2), (15, 2), (16, 1)],
  term ((-132900225000775708928731 : Rat) / 629862144719762786538) [(3, 2), (15, 4), (16, 1)],
  term ((-1 : Rat) / 12) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 0, terms 100 through 178. -/
theorem rs_R007_ueqv_R007NY_block_00_0100_0178_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_00_0100_0178
      rs_R007_ueqv_R007NY_block_00_0100_0178 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
