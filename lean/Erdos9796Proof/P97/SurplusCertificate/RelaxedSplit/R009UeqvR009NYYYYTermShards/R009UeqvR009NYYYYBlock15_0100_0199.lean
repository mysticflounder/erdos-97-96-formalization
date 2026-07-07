/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 15:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0100 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 100 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0100 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(4, 1), (8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(8, 1), (9, 2), (11, 1), (13, 1), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(8, 3), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0100_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0100
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0101 : Poly :=
[
  term ((5888 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0101 : Poly :=
[
  term ((11776 : Rat) / 32699) [(4, 1), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11776 : Rat) / 32699) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5888 : Rat) / 32699) [(8, 3), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0101_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0101
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0102 : Poly :=
[
  term ((15502696 : Rat) / 228893) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 102 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0102 : Poly :=
[
  term ((31005392 : Rat) / 228893) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((31005392 : Rat) / 228893) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-15502696 : Rat) / 228893) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-15502696 : Rat) / 228893) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0102_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0102
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0103 : Poly :=
[
  term ((-426880 : Rat) / 32699) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0103 : Poly :=
[
  term ((-853760 : Rat) / 32699) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-853760 : Rat) / 32699) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((426880 : Rat) / 32699) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((426880 : Rat) / 32699) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0103_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0103
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0104 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 104 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0104 : Poly :=
[
  term ((-496086272 : Rat) / 33189485) [(4, 1), (8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-496086272 : Rat) / 33189485) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (9, 2), (11, 2), (13, 1), (15, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0104_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0104
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0105 : Poly :=
[
  term ((47104 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0105 : Poly :=
[
  term ((94208 : Rat) / 32699) [(4, 1), (8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((94208 : Rat) / 32699) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-47104 : Rat) / 32699) [(8, 3), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0105_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0105
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0106 : Poly :=
[
  term ((-89 : Rat) / 40) [(8, 1), (12, 1)]
]

/-- Partial product 106 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0106 : Poly :=
[
  term ((-89 : Rat) / 20) [(4, 1), (8, 2), (12, 1)],
  term ((-89 : Rat) / 20) [(5, 1), (8, 1), (9, 1), (12, 1)],
  term ((89 : Rat) / 40) [(8, 1), (9, 2), (12, 1)],
  term ((89 : Rat) / 40) [(8, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0106_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0106
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0107 : Poly :=
[
  term ((-174927712759 : Rat) / 398273820) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 107 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0107 : Poly :=
[
  term ((-174927712759 : Rat) / 199136910) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((-174927712759 : Rat) / 199136910) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((174927712759 : Rat) / 398273820) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((174927712759 : Rat) / 398273820) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0107_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0107
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0108 : Poly :=
[
  term ((8420008 : Rat) / 98097) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0108 : Poly :=
[
  term ((16840016 : Rat) / 98097) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((16840016 : Rat) / 98097) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8420008 : Rat) / 98097) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8420008 : Rat) / 98097) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0108_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0108
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0109 : Poly :=
[
  term ((-80505533747 : Rat) / 796547640) [(8, 1), (15, 2)]
]

/-- Partial product 109 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0109 : Poly :=
[
  term ((-80505533747 : Rat) / 398273820) [(4, 1), (8, 2), (15, 2)],
  term ((-80505533747 : Rat) / 398273820) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((80505533747 : Rat) / 796547640) [(8, 1), (9, 2), (15, 2)],
  term ((80505533747 : Rat) / 796547640) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0109_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0109
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0110 : Poly :=
[
  term ((1876366 : Rat) / 98097) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 110 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0110 : Poly :=
[
  term ((3752732 : Rat) / 98097) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((3752732 : Rat) / 98097) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1876366 : Rat) / 98097) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1876366 : Rat) / 98097) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0110_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0110
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0111 : Poly :=
[
  term ((4 : Rat) / 29) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 111 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0111 : Poly :=
[
  term ((8 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((8 : Rat) / 29) [(5, 1), (9, 2), (10, 1), (15, 1)],
  term ((-4 : Rat) / 29) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((-4 : Rat) / 29) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0111_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0111
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0112 : Poly :=
[
  term ((-15502696 : Rat) / 6637897) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 112 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0112 : Poly :=
[
  term ((-31005392 : Rat) / 6637897) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-31005392 : Rat) / 6637897) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((15502696 : Rat) / 6637897) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((15502696 : Rat) / 6637897) [(9, 3), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0112_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0112
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0113 : Poly :=
[
  term ((14720 : Rat) / 32699) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0113 : Poly :=
[
  term ((29440 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((29440 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14720 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14720 : Rat) / 32699) [(9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0113_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0113
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0114 : Poly :=
[
  term ((-32 : Rat) / 29) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 114 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0114 : Poly :=
[
  term ((-64 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-64 : Rat) / 29) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((32 : Rat) / 29) [(8, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((32 : Rat) / 29) [(9, 3), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0114_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0114
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0115 : Poly :=
[
  term ((11627022 : Rat) / 6637897) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 115 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0115 : Poly :=
[
  term ((23254044 : Rat) / 6637897) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((23254044 : Rat) / 6637897) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-11627022 : Rat) / 6637897) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11627022 : Rat) / 6637897) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0115_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0115
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0116 : Poly :=
[
  term ((-11040 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0116 : Poly :=
[
  term ((-22080 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22080 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11040 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11040 : Rat) / 32699) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0116_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0116
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0117 : Poly :=
[
  term ((57743064 : Rat) / 33189485) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 117 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0117 : Poly :=
[
  term ((115486128 : Rat) / 33189485) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((115486128 : Rat) / 33189485) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 3)],
  term ((-57743064 : Rat) / 33189485) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-57743064 : Rat) / 33189485) [(9, 3), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0117_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0117
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0118 : Poly :=
[
  term ((2944 : Rat) / 32699) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 118 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0118 : Poly :=
[
  term ((5888 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((5888 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2944 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2944 : Rat) / 32699) [(9, 3), (11, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0118_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0118
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0119 : Poly :=
[
  term ((31005392 : Rat) / 6637897) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 119 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0119 : Poly :=
[
  term ((62010784 : Rat) / 6637897) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((62010784 : Rat) / 6637897) [(5, 1), (9, 2), (11, 1), (13, 2), (15, 2)],
  term ((-31005392 : Rat) / 6637897) [(8, 2), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-31005392 : Rat) / 6637897) [(9, 3), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0119_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0119
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0120 : Poly :=
[
  term ((-29440 : Rat) / 32699) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 120 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0120 : Poly :=
[
  term ((-58880 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-58880 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((29440 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((29440 : Rat) / 32699) [(9, 3), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0120_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0120
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0121 : Poly :=
[
  term ((28871532 : Rat) / 33189485) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 121 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0121 : Poly :=
[
  term ((57743064 : Rat) / 33189485) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((57743064 : Rat) / 33189485) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((-28871532 : Rat) / 33189485) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-28871532 : Rat) / 33189485) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0121_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0121
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0122 : Poly :=
[
  term ((1472 : Rat) / 32699) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0122 : Poly :=
[
  term ((2944 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2944 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1472 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1472 : Rat) / 32699) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0122_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0122
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0123 : Poly :=
[
  term ((-67628272 : Rat) / 33189485) [(9, 1), (11, 1), (15, 4)]
]

/-- Partial product 123 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0123 : Poly :=
[
  term ((-135256544 : Rat) / 33189485) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 4)],
  term ((-135256544 : Rat) / 33189485) [(5, 1), (9, 2), (11, 1), (15, 4)],
  term ((67628272 : Rat) / 33189485) [(8, 2), (9, 1), (11, 1), (15, 4)],
  term ((67628272 : Rat) / 33189485) [(9, 3), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0123_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0123
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0124 : Poly :=
[
  term ((5888 : Rat) / 32699) [(9, 1), (11, 1), (15, 4), (16, 1)]
]

/-- Partial product 124 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0124 : Poly :=
[
  term ((11776 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((11776 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (15, 4), (16, 1)],
  term ((-5888 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-5888 : Rat) / 32699) [(9, 3), (11, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0124_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0124
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0125 : Poly :=
[
  term ((-5 : Rat) / 4) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 125 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0125 : Poly :=
[
  term ((-5 : Rat) / 2) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 2) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((5 : Rat) / 4) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 4) [(9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0125_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0125
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0126 : Poly :=
[
  term ((-40 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 126 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0126 : Poly :=
[
  term ((-80 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 29) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 29) [(9, 3), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0126_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0126
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0127 : Poly :=
[
  term (-2 : Rat) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 127 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0127 : Poly :=
[
  term (-4 : Rat) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term (-4 : Rat) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term (2 : Rat) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term (2 : Rat) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0127_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0127
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0128 : Poly :=
[
  term ((15 : Rat) / 16) [(9, 1), (13, 1)]
]

/-- Partial product 128 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0128 : Poly :=
[
  term ((15 : Rat) / 8) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((15 : Rat) / 8) [(5, 1), (9, 2), (13, 1)],
  term ((-15 : Rat) / 16) [(8, 2), (9, 1), (13, 1)],
  term ((-15 : Rat) / 16) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0128_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0128
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0129 : Poly :=
[
  term ((795 : Rat) / 116) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 129 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0129 : Poly :=
[
  term ((795 : Rat) / 58) [(4, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((795 : Rat) / 58) [(5, 1), (9, 2), (13, 1), (15, 2)],
  term ((-795 : Rat) / 116) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-795 : Rat) / 116) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0129_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0129
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0130 : Poly :=
[
  term ((-40 : Rat) / 29) [(9, 1), (13, 1), (15, 4)]
]

/-- Partial product 130 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0130 : Poly :=
[
  term ((-80 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (13, 1), (15, 4)],
  term ((-80 : Rat) / 29) [(5, 1), (9, 2), (13, 1), (15, 4)],
  term ((40 : Rat) / 29) [(8, 2), (9, 1), (13, 1), (15, 4)],
  term ((40 : Rat) / 29) [(9, 3), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0130_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0130
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0131 : Poly :=
[
  term ((5 : Rat) / 2) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 131 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0131 : Poly :=
[
  term (5 : Rat) [(4, 1), (8, 1), (9, 1), (13, 2), (15, 1)],
  term (5 : Rat) [(5, 1), (9, 2), (13, 2), (15, 1)],
  term ((-5 : Rat) / 2) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((-5 : Rat) / 2) [(9, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0131_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0131
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0132 : Poly :=
[
  term ((80 : Rat) / 29) [(9, 1), (13, 2), (15, 3)]
]

/-- Partial product 132 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0132 : Poly :=
[
  term ((160 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (13, 2), (15, 3)],
  term ((160 : Rat) / 29) [(5, 1), (9, 2), (13, 2), (15, 3)],
  term ((-80 : Rat) / 29) [(8, 2), (9, 1), (13, 2), (15, 3)],
  term ((-80 : Rat) / 29) [(9, 3), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0132_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0132
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0133 : Poly :=
[
  term ((255 : Rat) / 232) [(9, 1), (15, 1)]
]

/-- Partial product 133 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0133 : Poly :=
[
  term ((255 : Rat) / 116) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((255 : Rat) / 116) [(5, 1), (9, 2), (15, 1)],
  term ((-255 : Rat) / 232) [(8, 2), (9, 1), (15, 1)],
  term ((-255 : Rat) / 232) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0133_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0133
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0134 : Poly :=
[
  term ((-249 : Rat) / 58) [(9, 1), (15, 3)]
]

/-- Partial product 134 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0134 : Poly :=
[
  term ((-249 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (15, 3)],
  term ((-249 : Rat) / 29) [(5, 1), (9, 2), (15, 3)],
  term ((249 : Rat) / 58) [(8, 2), (9, 1), (15, 3)],
  term ((249 : Rat) / 58) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0134_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0134
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0135 : Poly :=
[
  term ((-1116194112 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 135 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0135 : Poly :=
[
  term ((-2232388224 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2232388224 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((1116194112 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((1116194112 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0135_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0135
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0136 : Poly :=
[
  term ((211968 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0136 : Poly :=
[
  term ((423936 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((423936 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211968 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211968 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0136_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0136
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0137 : Poly :=
[
  term ((31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

/-- Partial product 137 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0137 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 3)],
  term ((62010784 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3)],
  term ((-31005392 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 3)],
  term ((-31005392 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0137_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0137
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0138 : Poly :=
[
  term ((-5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 138 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0138 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-11776 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((5888 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((5888 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0138_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0138
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0139 : Poly :=
[
  term ((3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 139 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0139 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((7973016144 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0139_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0139
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0140 : Poly :=
[
  term ((-762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0140 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0140_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0140
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0141 : Poly :=
[
  term ((2989881054 : Rat) / 33189485) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 141 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0141 : Poly :=
[
  term ((5979762108 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((5979762108 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-2989881054 : Rat) / 33189485) [(8, 2), (10, 1), (12, 1), (15, 2)],
  term ((-2989881054 : Rat) / 33189485) [(9, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0141_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0141
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0142 : Poly :=
[
  term ((-571860 : Rat) / 32699) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 142 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0142 : Poly :=
[
  term ((-1143720 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1143720 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((571860 : Rat) / 32699) [(8, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((571860 : Rat) / 32699) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0142_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0142
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0143 : Poly :=
[
  term ((57473363179 : Rat) / 199136910) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 143 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0143 : Poly :=
[
  term ((57473363179 : Rat) / 99568455) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((57473363179 : Rat) / 99568455) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-57473363179 : Rat) / 199136910) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-57473363179 : Rat) / 199136910) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0143_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0143
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0144 : Poly :=
[
  term ((-5518172 : Rat) / 98097) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0144 : Poly :=
[
  term ((-11036344 : Rat) / 98097) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11036344 : Rat) / 98097) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5518172 : Rat) / 98097) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5518172 : Rat) / 98097) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0144_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0144
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0145 : Poly :=
[
  term ((-1993254036 : Rat) / 33189485) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 145 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0145 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-3986508072 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((1993254036 : Rat) / 33189485) [(8, 2), (10, 1), (13, 1), (15, 3)],
  term ((1993254036 : Rat) / 33189485) [(9, 2), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0145_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0145
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0146 : Poly :=
[
  term ((381240 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 146 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0146 : Poly :=
[
  term ((762480 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((762480 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-381240 : Rat) / 32699) [(8, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-381240 : Rat) / 32699) [(9, 2), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0146_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0146
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0147 : Poly :=
[
  term ((-7973016144 : Rat) / 33189485) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 147 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0147 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-15946032288 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(8, 2), (10, 1), (13, 2), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(9, 2), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0147_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0147
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0148 : Poly :=
[
  term ((1524960 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 148 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0148 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3049920 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0148_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0148
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0149 : Poly :=
[
  term ((-59009681 : Rat) / 1373358) [(10, 1), (15, 2)]
]

/-- Partial product 149 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0149 : Poly :=
[
  term ((-59009681 : Rat) / 686679) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((-59009681 : Rat) / 686679) [(5, 1), (9, 1), (10, 1), (15, 2)],
  term ((59009681 : Rat) / 1373358) [(8, 2), (10, 1), (15, 2)],
  term ((59009681 : Rat) / 1373358) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0149_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0149
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0150 : Poly :=
[
  term ((816598 : Rat) / 98097) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 150 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0150 : Poly :=
[
  term ((1633196 : Rat) / 98097) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1633196 : Rat) / 98097) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-816598 : Rat) / 98097) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-816598 : Rat) / 98097) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0150_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0150
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0151 : Poly :=
[
  term ((2989881054 : Rat) / 33189485) [(10, 1), (15, 4)]
]

/-- Partial product 151 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0151 : Poly :=
[
  term ((5979762108 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (15, 4)],
  term ((5979762108 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (15, 4)],
  term ((-2989881054 : Rat) / 33189485) [(8, 2), (10, 1), (15, 4)],
  term ((-2989881054 : Rat) / 33189485) [(9, 2), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0151_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0151
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0152 : Poly :=
[
  term ((-571860 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 152 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0152 : Poly :=
[
  term ((-1143720 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (15, 4), (16, 1)],
  term ((-1143720 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (15, 4), (16, 1)],
  term ((571860 : Rat) / 32699) [(8, 2), (10, 1), (15, 4), (16, 1)],
  term ((571860 : Rat) / 32699) [(9, 2), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0152_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0152
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0153 : Poly :=
[
  term ((2906755500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 153 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0153 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5813511000 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2906755500 : Rat) / 6637897) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2906755500 : Rat) / 6637897) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0153_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0153
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0154 : Poly :=
[
  term ((-2760000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0154 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2760000 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2760000 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0154_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0154
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0155 : Poly :=
[
  term ((-15355821729 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 155 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0155 : Poly :=
[
  term ((-30711643458 : Rat) / 33189485) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-30711643458 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((15355821729 : Rat) / 33189485) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((15355821729 : Rat) / 33189485) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0155_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0155
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0156 : Poly :=
[
  term ((2951138 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0156 : Poly :=
[
  term ((5902276 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5902276 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2951138 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2951138 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0156_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0156
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0157 : Poly :=
[
  term ((3875674 : Rat) / 4741355) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 157 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0157 : Poly :=
[
  term ((7751348 : Rat) / 4741355) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((7751348 : Rat) / 4741355) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-3875674 : Rat) / 4741355) [(8, 2), (11, 1), (12, 1), (15, 3)],
  term ((-3875674 : Rat) / 4741355) [(9, 2), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0157_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0157
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0158 : Poly :=
[
  term ((-5152 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 158 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0158 : Poly :=
[
  term ((-10304 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-10304 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((5152 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((5152 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0158_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0158
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0159 : Poly :=
[
  term ((201128720203 : Rat) / 99568455) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 159 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0159 : Poly :=
[
  term ((402257440406 : Rat) / 99568455) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((402257440406 : Rat) / 99568455) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-201128720203 : Rat) / 99568455) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-201128720203 : Rat) / 99568455) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0159_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0159
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0160 : Poly :=
[
  term ((-38532676 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 160 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0160 : Poly :=
[
  term ((-77065352 : Rat) / 98097) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-77065352 : Rat) / 98097) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((38532676 : Rat) / 98097) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((38532676 : Rat) / 98097) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0160_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0160
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0161 : Poly :=
[
  term ((2906755500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)]
]

/-- Partial product 161 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0161 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 4)],
  term ((5813511000 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 4)],
  term ((-2906755500 : Rat) / 6637897) [(8, 2), (11, 1), (13, 1), (15, 4)],
  term ((-2906755500 : Rat) / 6637897) [(9, 2), (11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0161_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0161
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0162 : Poly :=
[
  term ((-2760000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 162 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0162 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((2760000 : Rat) / 32699) [(8, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((2760000 : Rat) / 32699) [(9, 2), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0162_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0162
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0163 : Poly :=
[
  term ((-5813511000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)]
]

/-- Partial product 163 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0163 : Poly :=
[
  term ((-11627022000 : Rat) / 6637897) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 3)],
  term ((-11627022000 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 3)],
  term ((5813511000 : Rat) / 6637897) [(8, 2), (11, 1), (13, 2), (15, 3)],
  term ((5813511000 : Rat) / 6637897) [(9, 2), (11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0163_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0163
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0164 : Poly :=
[
  term ((5520000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 164 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0164 : Poly :=
[
  term ((11040000 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((11040000 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(8, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(9, 2), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0164_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0164
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0165 : Poly :=
[
  term ((15909027649 : Rat) / 56896260) [(11, 1), (15, 1)]
]

/-- Partial product 165 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0165 : Poly :=
[
  term ((15909027649 : Rat) / 28448130) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((15909027649 : Rat) / 28448130) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-15909027649 : Rat) / 56896260) [(8, 2), (11, 1), (15, 1)],
  term ((-15909027649 : Rat) / 56896260) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0165_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0165
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0166 : Poly :=
[
  term ((-5363293 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0166 : Poly :=
[
  term ((-10726586 : Rat) / 98097) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10726586 : Rat) / 98097) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5363293 : Rat) / 98097) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((5363293 : Rat) / 98097) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0166_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0166
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0167 : Poly :=
[
  term ((-5128782012 : Rat) / 6637897) [(11, 1), (15, 3)]
]

/-- Partial product 167 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0167 : Poly :=
[
  term ((-10257564024 : Rat) / 6637897) [(4, 1), (8, 1), (11, 1), (15, 3)],
  term ((-10257564024 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((5128782012 : Rat) / 6637897) [(8, 2), (11, 1), (15, 3)],
  term ((5128782012 : Rat) / 6637897) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0167_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0167
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0168 : Poly :=
[
  term ((4921622 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 168 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0168 : Poly :=
[
  term ((9843244 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((9843244 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-4921622 : Rat) / 32699) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-4921622 : Rat) / 32699) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0168_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0168
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0169 : Poly :=
[
  term ((-6883197024 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 169 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0169 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(4, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-13766394048 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0169_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0169
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0170 : Poly :=
[
  term ((1307136 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 170 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0170 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2614272 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0170_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0170
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0171 : Poly :=
[
  term ((527091664 : Rat) / 1746815) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 171 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0171 : Poly :=
[
  term ((1054183328 : Rat) / 1746815) [(4, 1), (8, 1), (11, 2), (12, 1), (15, 2)],
  term ((1054183328 : Rat) / 1746815) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2)],
  term ((-527091664 : Rat) / 1746815) [(8, 2), (11, 2), (12, 1), (15, 2)],
  term ((-527091664 : Rat) / 1746815) [(9, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0171_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0171
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0172 : Poly :=
[
  term ((-100096 : Rat) / 1721) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 172 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0172 : Poly :=
[
  term ((-200192 : Rat) / 1721) [(4, 1), (8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-200192 : Rat) / 1721) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((100096 : Rat) / 1721) [(8, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((100096 : Rat) / 1721) [(9, 2), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0172_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0172
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0173 : Poly :=
[
  term ((759632104 : Rat) / 4741355) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 173 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0173 : Poly :=
[
  term ((1519264208 : Rat) / 4741355) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((1519264208 : Rat) / 4741355) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-759632104 : Rat) / 4741355) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-759632104 : Rat) / 4741355) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0173_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0173
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0174 : Poly :=
[
  term ((-1009792 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0174 : Poly :=
[
  term ((-2019584 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2019584 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1009792 : Rat) / 32699) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1009792 : Rat) / 32699) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0174_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0174
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0175 : Poly :=
[
  term ((-27532788096 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 175 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0175 : Poly :=
[
  term ((-55065576192 : Rat) / 33189485) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 3)],
  term ((-55065576192 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 3)],
  term ((27532788096 : Rat) / 33189485) [(8, 2), (11, 2), (13, 1), (15, 3)],
  term ((27532788096 : Rat) / 33189485) [(9, 2), (11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0175_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0175
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0176 : Poly :=
[
  term ((5228544 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 176 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0176 : Poly :=
[
  term ((10457088 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((10457088 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(8, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(9, 2), (11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0176_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0176
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0177 : Poly :=
[
  term ((13766394048 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

/-- Partial product 177 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0177 : Poly :=
[
  term ((27532788096 : Rat) / 33189485) [(4, 1), (8, 1), (11, 2), (13, 2), (15, 2)],
  term ((27532788096 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2)],
  term ((-13766394048 : Rat) / 33189485) [(8, 2), (11, 2), (13, 2), (15, 2)],
  term ((-13766394048 : Rat) / 33189485) [(9, 2), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0177_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0177
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0178 : Poly :=
[
  term ((-2614272 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 178 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0178 : Poly :=
[
  term ((-5228544 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((2614272 : Rat) / 32699) [(8, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((2614272 : Rat) / 32699) [(9, 2), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0178_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0178
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0179 : Poly :=
[
  term ((-1402993988 : Rat) / 4741355) [(11, 2), (15, 2)]
]

/-- Partial product 179 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0179 : Poly :=
[
  term ((-2805987976 : Rat) / 4741355) [(4, 1), (8, 1), (11, 2), (15, 2)],
  term ((-2805987976 : Rat) / 4741355) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((1402993988 : Rat) / 4741355) [(8, 2), (11, 2), (15, 2)],
  term ((1402993988 : Rat) / 4741355) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0179_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0179
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0180 : Poly :=
[
  term ((1865024 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 180 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0180 : Poly :=
[
  term ((3730048 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((3730048 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1865024 : Rat) / 32699) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((-1865024 : Rat) / 32699) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0180_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0180
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0181 : Poly :=
[
  term ((10262784752 : Rat) / 33189485) [(11, 2), (15, 4)]
]

/-- Partial product 181 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0181 : Poly :=
[
  term ((20525569504 : Rat) / 33189485) [(4, 1), (8, 1), (11, 2), (15, 4)],
  term ((20525569504 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (15, 4)],
  term ((-10262784752 : Rat) / 33189485) [(8, 2), (11, 2), (15, 4)],
  term ((-10262784752 : Rat) / 33189485) [(9, 2), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0181_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0181
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0182 : Poly :=
[
  term ((-1948928 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

/-- Partial product 182 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0182 : Poly :=
[
  term ((-3897856 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (15, 4), (16, 1)],
  term ((-3897856 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (15, 4), (16, 1)],
  term ((1948928 : Rat) / 32699) [(8, 2), (11, 2), (15, 4), (16, 1)],
  term ((1948928 : Rat) / 32699) [(9, 2), (11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0182_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0182
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0183 : Poly :=
[
  term ((496086272 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

/-- Partial product 183 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0183 : Poly :=
[
  term ((992172544 : Rat) / 33189485) [(4, 1), (8, 1), (11, 3), (13, 1), (15, 2)],
  term ((992172544 : Rat) / 33189485) [(5, 1), (9, 1), (11, 3), (13, 1), (15, 2)],
  term ((-496086272 : Rat) / 33189485) [(8, 2), (11, 3), (13, 1), (15, 2)],
  term ((-496086272 : Rat) / 33189485) [(9, 2), (11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0183_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0183
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0184 : Poly :=
[
  term ((-94208 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 184 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0184 : Poly :=
[
  term ((-188416 : Rat) / 32699) [(4, 1), (8, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-188416 : Rat) / 32699) [(5, 1), (9, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((94208 : Rat) / 32699) [(8, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((94208 : Rat) / 32699) [(9, 2), (11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0184_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0184
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0185 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(11, 3), (15, 1)]
]

/-- Partial product 185 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0185 : Poly :=
[
  term ((-62010784 : Rat) / 33189485) [(4, 1), (8, 1), (11, 3), (15, 1)],
  term ((-62010784 : Rat) / 33189485) [(5, 1), (9, 1), (11, 3), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(8, 2), (11, 3), (15, 1)],
  term ((31005392 : Rat) / 33189485) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0185_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0185
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0186 : Poly :=
[
  term ((5888 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 186 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0186 : Poly :=
[
  term ((11776 : Rat) / 32699) [(4, 1), (8, 1), (11, 3), (15, 1), (16, 1)],
  term ((11776 : Rat) / 32699) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((-5888 : Rat) / 32699) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0186_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0186
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0187 : Poly :=
[
  term ((-124021568 : Rat) / 33189485) [(11, 3), (15, 3)]
]

/-- Partial product 187 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0187 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(4, 1), (8, 1), (11, 3), (15, 3)],
  term ((-248043136 : Rat) / 33189485) [(5, 1), (9, 1), (11, 3), (15, 3)],
  term ((124021568 : Rat) / 33189485) [(8, 2), (11, 3), (15, 3)],
  term ((124021568 : Rat) / 33189485) [(9, 2), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0187_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0187
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0188 : Poly :=
[
  term ((23552 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

/-- Partial product 188 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0188 : Poly :=
[
  term ((47104 : Rat) / 32699) [(4, 1), (8, 1), (11, 3), (15, 3), (16, 1)],
  term ((47104 : Rat) / 32699) [(5, 1), (9, 1), (11, 3), (15, 3), (16, 1)],
  term ((-23552 : Rat) / 32699) [(8, 2), (11, 3), (15, 3), (16, 1)],
  term ((-23552 : Rat) / 32699) [(9, 2), (11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0188_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0188
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0189 : Poly :=
[
  term ((109 : Rat) / 40) [(12, 1)]
]

/-- Partial product 189 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0189 : Poly :=
[
  term ((109 : Rat) / 20) [(4, 1), (8, 1), (12, 1)],
  term ((109 : Rat) / 20) [(5, 1), (9, 1), (12, 1)],
  term ((-109 : Rat) / 40) [(8, 2), (12, 1)],
  term ((-109 : Rat) / 40) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0189_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0189
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0190 : Poly :=
[
  term ((-72607343635 : Rat) / 53103176) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 190 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0190 : Poly :=
[
  term ((-72607343635 : Rat) / 26551588) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-72607343635 : Rat) / 26551588) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((72607343635 : Rat) / 53103176) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((72607343635 : Rat) / 53103176) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0190_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0190
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0191 : Poly :=
[
  term ((8620783 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0191 : Poly :=
[
  term ((17241566 : Rat) / 32699) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17241566 : Rat) / 32699) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8620783 : Rat) / 32699) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8620783 : Rat) / 32699) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0191_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0191
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0192 : Poly :=
[
  term ((1471224841259 : Rat) / 1593095280) [(12, 1), (15, 2)]
]

/-- Partial product 192 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0192 : Poly :=
[
  term ((1471224841259 : Rat) / 796547640) [(4, 1), (8, 1), (12, 1), (15, 2)],
  term ((1471224841259 : Rat) / 796547640) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1471224841259 : Rat) / 1593095280) [(8, 2), (12, 1), (15, 2)],
  term ((-1471224841259 : Rat) / 1593095280) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0192_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0192
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0193 : Poly :=
[
  term ((-35114623 : Rat) / 196194) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 193 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0193 : Poly :=
[
  term ((-35114623 : Rat) / 98097) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-35114623 : Rat) / 98097) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((35114623 : Rat) / 196194) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((35114623 : Rat) / 196194) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0193_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0193
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0194 : Poly :=
[
  term ((6964005774 : Rat) / 6637897) [(13, 1), (15, 1)]
]

/-- Partial product 194 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0194 : Poly :=
[
  term ((13928011548 : Rat) / 6637897) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((13928011548 : Rat) / 6637897) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-6964005774 : Rat) / 6637897) [(8, 2), (13, 1), (15, 1)],
  term ((-6964005774 : Rat) / 6637897) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0194_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0194
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0195 : Poly :=
[
  term ((-6605794 : Rat) / 32699) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 195 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0195 : Poly :=
[
  term ((-13211588 : Rat) / 32699) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13211588 : Rat) / 32699) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((6605794 : Rat) / 32699) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((6605794 : Rat) / 32699) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0195_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0195
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0196 : Poly :=
[
  term ((-179348477725 : Rat) / 53103176) [(13, 1), (15, 3)]
]

/-- Partial product 196 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0196 : Poly :=
[
  term ((-179348477725 : Rat) / 26551588) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((-179348477725 : Rat) / 26551588) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((179348477725 : Rat) / 53103176) [(8, 2), (13, 1), (15, 3)],
  term ((179348477725 : Rat) / 53103176) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0196_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0196
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0197 : Poly :=
[
  term ((21400505 : Rat) / 32699) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 197 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0197 : Poly :=
[
  term ((42801010 : Rat) / 32699) [(4, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((42801010 : Rat) / 32699) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-21400505 : Rat) / 32699) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-21400505 : Rat) / 32699) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0197_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0197
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0198 : Poly :=
[
  term ((-41 : Rat) / 20) [(13, 2)]
]

/-- Partial product 198 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0198 : Poly :=
[
  term ((-41 : Rat) / 10) [(4, 1), (8, 1), (13, 2)],
  term ((-41 : Rat) / 10) [(5, 1), (9, 1), (13, 2)],
  term ((41 : Rat) / 20) [(8, 2), (13, 2)],
  term ((41 : Rat) / 20) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0198_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0198
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 15. -/
def rs_R009_ueqv_R009NYYYY_coefficient_15_0199 : Poly :=
[
  term ((361948103067 : Rat) / 132757940) [(13, 2), (15, 2)]
]

/-- Partial product 199 for generator 15. -/
def rs_R009_ueqv_R009NYYYY_partial_15_0199 : Poly :=
[
  term ((361948103067 : Rat) / 66378970) [(4, 1), (8, 1), (13, 2), (15, 2)],
  term ((361948103067 : Rat) / 66378970) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((-361948103067 : Rat) / 132757940) [(8, 2), (13, 2), (15, 2)],
  term ((-361948103067 : Rat) / 132757940) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 15. -/
theorem rs_R009_ueqv_R009NYYYY_partial_15_0199_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_15_0199
        rs_R009_ueqv_R009NYYYY_generator_15_0100_0199 =
      rs_R009_ueqv_R009NYYYY_partial_15_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_15_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_15_0100,
  rs_R009_ueqv_R009NYYYY_partial_15_0101,
  rs_R009_ueqv_R009NYYYY_partial_15_0102,
  rs_R009_ueqv_R009NYYYY_partial_15_0103,
  rs_R009_ueqv_R009NYYYY_partial_15_0104,
  rs_R009_ueqv_R009NYYYY_partial_15_0105,
  rs_R009_ueqv_R009NYYYY_partial_15_0106,
  rs_R009_ueqv_R009NYYYY_partial_15_0107,
  rs_R009_ueqv_R009NYYYY_partial_15_0108,
  rs_R009_ueqv_R009NYYYY_partial_15_0109,
  rs_R009_ueqv_R009NYYYY_partial_15_0110,
  rs_R009_ueqv_R009NYYYY_partial_15_0111,
  rs_R009_ueqv_R009NYYYY_partial_15_0112,
  rs_R009_ueqv_R009NYYYY_partial_15_0113,
  rs_R009_ueqv_R009NYYYY_partial_15_0114,
  rs_R009_ueqv_R009NYYYY_partial_15_0115,
  rs_R009_ueqv_R009NYYYY_partial_15_0116,
  rs_R009_ueqv_R009NYYYY_partial_15_0117,
  rs_R009_ueqv_R009NYYYY_partial_15_0118,
  rs_R009_ueqv_R009NYYYY_partial_15_0119,
  rs_R009_ueqv_R009NYYYY_partial_15_0120,
  rs_R009_ueqv_R009NYYYY_partial_15_0121,
  rs_R009_ueqv_R009NYYYY_partial_15_0122,
  rs_R009_ueqv_R009NYYYY_partial_15_0123,
  rs_R009_ueqv_R009NYYYY_partial_15_0124,
  rs_R009_ueqv_R009NYYYY_partial_15_0125,
  rs_R009_ueqv_R009NYYYY_partial_15_0126,
  rs_R009_ueqv_R009NYYYY_partial_15_0127,
  rs_R009_ueqv_R009NYYYY_partial_15_0128,
  rs_R009_ueqv_R009NYYYY_partial_15_0129,
  rs_R009_ueqv_R009NYYYY_partial_15_0130,
  rs_R009_ueqv_R009NYYYY_partial_15_0131,
  rs_R009_ueqv_R009NYYYY_partial_15_0132,
  rs_R009_ueqv_R009NYYYY_partial_15_0133,
  rs_R009_ueqv_R009NYYYY_partial_15_0134,
  rs_R009_ueqv_R009NYYYY_partial_15_0135,
  rs_R009_ueqv_R009NYYYY_partial_15_0136,
  rs_R009_ueqv_R009NYYYY_partial_15_0137,
  rs_R009_ueqv_R009NYYYY_partial_15_0138,
  rs_R009_ueqv_R009NYYYY_partial_15_0139,
  rs_R009_ueqv_R009NYYYY_partial_15_0140,
  rs_R009_ueqv_R009NYYYY_partial_15_0141,
  rs_R009_ueqv_R009NYYYY_partial_15_0142,
  rs_R009_ueqv_R009NYYYY_partial_15_0143,
  rs_R009_ueqv_R009NYYYY_partial_15_0144,
  rs_R009_ueqv_R009NYYYY_partial_15_0145,
  rs_R009_ueqv_R009NYYYY_partial_15_0146,
  rs_R009_ueqv_R009NYYYY_partial_15_0147,
  rs_R009_ueqv_R009NYYYY_partial_15_0148,
  rs_R009_ueqv_R009NYYYY_partial_15_0149,
  rs_R009_ueqv_R009NYYYY_partial_15_0150,
  rs_R009_ueqv_R009NYYYY_partial_15_0151,
  rs_R009_ueqv_R009NYYYY_partial_15_0152,
  rs_R009_ueqv_R009NYYYY_partial_15_0153,
  rs_R009_ueqv_R009NYYYY_partial_15_0154,
  rs_R009_ueqv_R009NYYYY_partial_15_0155,
  rs_R009_ueqv_R009NYYYY_partial_15_0156,
  rs_R009_ueqv_R009NYYYY_partial_15_0157,
  rs_R009_ueqv_R009NYYYY_partial_15_0158,
  rs_R009_ueqv_R009NYYYY_partial_15_0159,
  rs_R009_ueqv_R009NYYYY_partial_15_0160,
  rs_R009_ueqv_R009NYYYY_partial_15_0161,
  rs_R009_ueqv_R009NYYYY_partial_15_0162,
  rs_R009_ueqv_R009NYYYY_partial_15_0163,
  rs_R009_ueqv_R009NYYYY_partial_15_0164,
  rs_R009_ueqv_R009NYYYY_partial_15_0165,
  rs_R009_ueqv_R009NYYYY_partial_15_0166,
  rs_R009_ueqv_R009NYYYY_partial_15_0167,
  rs_R009_ueqv_R009NYYYY_partial_15_0168,
  rs_R009_ueqv_R009NYYYY_partial_15_0169,
  rs_R009_ueqv_R009NYYYY_partial_15_0170,
  rs_R009_ueqv_R009NYYYY_partial_15_0171,
  rs_R009_ueqv_R009NYYYY_partial_15_0172,
  rs_R009_ueqv_R009NYYYY_partial_15_0173,
  rs_R009_ueqv_R009NYYYY_partial_15_0174,
  rs_R009_ueqv_R009NYYYY_partial_15_0175,
  rs_R009_ueqv_R009NYYYY_partial_15_0176,
  rs_R009_ueqv_R009NYYYY_partial_15_0177,
  rs_R009_ueqv_R009NYYYY_partial_15_0178,
  rs_R009_ueqv_R009NYYYY_partial_15_0179,
  rs_R009_ueqv_R009NYYYY_partial_15_0180,
  rs_R009_ueqv_R009NYYYY_partial_15_0181,
  rs_R009_ueqv_R009NYYYY_partial_15_0182,
  rs_R009_ueqv_R009NYYYY_partial_15_0183,
  rs_R009_ueqv_R009NYYYY_partial_15_0184,
  rs_R009_ueqv_R009NYYYY_partial_15_0185,
  rs_R009_ueqv_R009NYYYY_partial_15_0186,
  rs_R009_ueqv_R009NYYYY_partial_15_0187,
  rs_R009_ueqv_R009NYYYY_partial_15_0188,
  rs_R009_ueqv_R009NYYYY_partial_15_0189,
  rs_R009_ueqv_R009NYYYY_partial_15_0190,
  rs_R009_ueqv_R009NYYYY_partial_15_0191,
  rs_R009_ueqv_R009NYYYY_partial_15_0192,
  rs_R009_ueqv_R009NYYYY_partial_15_0193,
  rs_R009_ueqv_R009NYYYY_partial_15_0194,
  rs_R009_ueqv_R009NYYYY_partial_15_0195,
  rs_R009_ueqv_R009NYYYY_partial_15_0196,
  rs_R009_ueqv_R009NYYYY_partial_15_0197,
  rs_R009_ueqv_R009NYYYY_partial_15_0198,
  rs_R009_ueqv_R009NYYYY_partial_15_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_15_0100_0199 : Poly :=
[
  term ((8 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-31005392 : Rat) / 6637897) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((29440 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((23254044 : Rat) / 6637897) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-22080 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((115486128 : Rat) / 33189485) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((5888 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 6637897) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-58880 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((57743064 : Rat) / 33189485) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((2944 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-135256544 : Rat) / 33189485) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 4)],
  term ((11776 : Rat) / 32699) [(4, 1), (8, 1), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-5 : Rat) / 2) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-80 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term (-4 : Rat) [(4, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((15 : Rat) / 8) [(4, 1), (8, 1), (9, 1), (13, 1)],
  term ((795 : Rat) / 58) [(4, 1), (8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (13, 1), (15, 4)],
  term (5 : Rat) [(4, 1), (8, 1), (9, 1), (13, 2), (15, 1)],
  term ((160 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (13, 2), (15, 3)],
  term ((255 : Rat) / 116) [(4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-249 : Rat) / 29) [(4, 1), (8, 1), (9, 1), (15, 3)],
  term ((-2232388224 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((423936 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 3)],
  term ((-11776 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1143720 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((57473363179 : Rat) / 99568455) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-11036344 : Rat) / 98097) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 3)],
  term ((762480 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (13, 2), (15, 2)],
  term ((3049920 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-59009681 : Rat) / 686679) [(4, 1), (8, 1), (10, 1), (15, 2)],
  term ((1633196 : Rat) / 98097) [(4, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(4, 1), (8, 1), (10, 1), (15, 4)],
  term ((-1143720 : Rat) / 32699) [(4, 1), (8, 1), (10, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30711643458 : Rat) / 33189485) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((5902276 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7751348 : Rat) / 4741355) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-10304 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((402257440406 : Rat) / 99568455) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-77065352 : Rat) / 98097) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 4)],
  term ((-5520000 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 3)],
  term ((11040000 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((15909027649 : Rat) / 28448130) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-10726586 : Rat) / 98097) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10257564024 : Rat) / 6637897) [(4, 1), (8, 1), (11, 1), (15, 3)],
  term ((9843244 : Rat) / 32699) [(4, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(4, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1054183328 : Rat) / 1746815) [(4, 1), (8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-200192 : Rat) / 1721) [(4, 1), (8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1519264208 : Rat) / 4741355) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2019584 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-55065576192 : Rat) / 33189485) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 3)],
  term ((10457088 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(4, 1), (8, 1), (11, 2), (13, 2), (15, 2)],
  term ((-5228544 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2805987976 : Rat) / 4741355) [(4, 1), (8, 1), (11, 2), (15, 2)],
  term ((3730048 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((20525569504 : Rat) / 33189485) [(4, 1), (8, 1), (11, 2), (15, 4)],
  term ((-3897856 : Rat) / 32699) [(4, 1), (8, 1), (11, 2), (15, 4), (16, 1)],
  term ((992172544 : Rat) / 33189485) [(4, 1), (8, 1), (11, 3), (13, 1), (15, 2)],
  term ((-188416 : Rat) / 32699) [(4, 1), (8, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(4, 1), (8, 1), (11, 3), (15, 1)],
  term ((11776 : Rat) / 32699) [(4, 1), (8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(4, 1), (8, 1), (11, 3), (15, 3)],
  term ((47104 : Rat) / 32699) [(4, 1), (8, 1), (11, 3), (15, 3), (16, 1)],
  term ((109 : Rat) / 20) [(4, 1), (8, 1), (12, 1)],
  term ((-72607343635 : Rat) / 26551588) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((17241566 : Rat) / 32699) [(4, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1471224841259 : Rat) / 796547640) [(4, 1), (8, 1), (12, 1), (15, 2)],
  term ((-35114623 : Rat) / 98097) [(4, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((13928011548 : Rat) / 6637897) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-13211588 : Rat) / 32699) [(4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-179348477725 : Rat) / 26551588) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((42801010 : Rat) / 32699) [(4, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 10) [(4, 1), (8, 1), (13, 2)],
  term ((361948103067 : Rat) / 66378970) [(4, 1), (8, 1), (13, 2), (15, 2)],
  term ((-62010784 : Rat) / 33189485) [(4, 1), (8, 2), (11, 1), (13, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(4, 1), (8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 228893) [(4, 1), (8, 2), (11, 1), (15, 1)],
  term ((-853760 : Rat) / 32699) [(4, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(4, 1), (8, 2), (11, 2), (13, 1), (15, 1)],
  term ((94208 : Rat) / 32699) [(4, 1), (8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 20) [(4, 1), (8, 2), (12, 1)],
  term ((-174927712759 : Rat) / 199136910) [(4, 1), (8, 2), (13, 1), (15, 1)],
  term ((16840016 : Rat) / 98097) [(4, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80505533747 : Rat) / 398273820) [(4, 1), (8, 2), (15, 2)],
  term ((3752732 : Rat) / 98097) [(4, 1), (8, 2), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((11776 : Rat) / 32699) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 228893) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((-853760 : Rat) / 32699) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((94208 : Rat) / 32699) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 20) [(5, 1), (8, 1), (9, 1), (12, 1)],
  term ((-174927712759 : Rat) / 199136910) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((16840016 : Rat) / 98097) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80505533747 : Rat) / 398273820) [(5, 1), (8, 1), (9, 1), (15, 2)],
  term ((3752732 : Rat) / 98097) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2232388224 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((423936 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3)],
  term ((-11776 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1143720 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((57473363179 : Rat) / 99568455) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-11036344 : Rat) / 98097) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 3)],
  term ((762480 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2)],
  term ((3049920 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-59009681 : Rat) / 686679) [(5, 1), (9, 1), (10, 1), (15, 2)],
  term ((1633196 : Rat) / 98097) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(5, 1), (9, 1), (10, 1), (15, 4)],
  term ((-1143720 : Rat) / 32699) [(5, 1), (9, 1), (10, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-30711643458 : Rat) / 33189485) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((5902276 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7751348 : Rat) / 4741355) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-10304 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((402257440406 : Rat) / 99568455) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-77065352 : Rat) / 98097) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 4)],
  term ((-5520000 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 3)],
  term ((11040000 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((15909027649 : Rat) / 28448130) [(5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-10726586 : Rat) / 98097) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10257564024 : Rat) / 6637897) [(5, 1), (9, 1), (11, 1), (15, 3)],
  term ((9843244 : Rat) / 32699) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1054183328 : Rat) / 1746815) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2)],
  term ((-200192 : Rat) / 1721) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1519264208 : Rat) / 4741355) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2019584 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-55065576192 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 3)],
  term ((10457088 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2)],
  term ((-5228544 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2805987976 : Rat) / 4741355) [(5, 1), (9, 1), (11, 2), (15, 2)],
  term ((3730048 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((20525569504 : Rat) / 33189485) [(5, 1), (9, 1), (11, 2), (15, 4)],
  term ((-3897856 : Rat) / 32699) [(5, 1), (9, 1), (11, 2), (15, 4), (16, 1)],
  term ((992172544 : Rat) / 33189485) [(5, 1), (9, 1), (11, 3), (13, 1), (15, 2)],
  term ((-188416 : Rat) / 32699) [(5, 1), (9, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(5, 1), (9, 1), (11, 3), (15, 1)],
  term ((11776 : Rat) / 32699) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(5, 1), (9, 1), (11, 3), (15, 3)],
  term ((47104 : Rat) / 32699) [(5, 1), (9, 1), (11, 3), (15, 3), (16, 1)],
  term ((109 : Rat) / 20) [(5, 1), (9, 1), (12, 1)],
  term ((-72607343635 : Rat) / 26551588) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((17241566 : Rat) / 32699) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1471224841259 : Rat) / 796547640) [(5, 1), (9, 1), (12, 1), (15, 2)],
  term ((-35114623 : Rat) / 98097) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((13928011548 : Rat) / 6637897) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-13211588 : Rat) / 32699) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-179348477725 : Rat) / 26551588) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((42801010 : Rat) / 32699) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 10) [(5, 1), (9, 1), (13, 2)],
  term ((361948103067 : Rat) / 66378970) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((8 : Rat) / 29) [(5, 1), (9, 2), (10, 1), (15, 1)],
  term ((-31005392 : Rat) / 6637897) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((29440 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 29) [(5, 1), (9, 2), (11, 1), (12, 1), (15, 2)],
  term ((23254044 : Rat) / 6637897) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1)],
  term ((-22080 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((115486128 : Rat) / 33189485) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 3)],
  term ((5888 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((62010784 : Rat) / 6637897) [(5, 1), (9, 2), (11, 1), (13, 2), (15, 2)],
  term ((-58880 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((57743064 : Rat) / 33189485) [(5, 1), (9, 2), (11, 1), (15, 2)],
  term ((2944 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-135256544 : Rat) / 33189485) [(5, 1), (9, 2), (11, 1), (15, 4)],
  term ((11776 : Rat) / 32699) [(5, 1), (9, 2), (11, 1), (15, 4), (16, 1)],
  term ((-5 : Rat) / 2) [(5, 1), (9, 2), (12, 1), (13, 1)],
  term ((-80 : Rat) / 29) [(5, 1), (9, 2), (12, 1), (13, 1), (15, 2)],
  term (-4 : Rat) [(5, 1), (9, 2), (12, 1), (15, 1)],
  term ((15 : Rat) / 8) [(5, 1), (9, 2), (13, 1)],
  term ((795 : Rat) / 58) [(5, 1), (9, 2), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(5, 1), (9, 2), (13, 1), (15, 4)],
  term (5 : Rat) [(5, 1), (9, 2), (13, 2), (15, 1)],
  term ((160 : Rat) / 29) [(5, 1), (9, 2), (13, 2), (15, 3)],
  term ((255 : Rat) / 116) [(5, 1), (9, 2), (15, 1)],
  term ((-249 : Rat) / 29) [(5, 1), (9, 2), (15, 3)],
  term ((31005392 : Rat) / 33189485) [(8, 1), (9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(8, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15502696 : Rat) / 228893) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((426880 : Rat) / 32699) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 40) [(8, 1), (9, 2), (12, 1)],
  term ((174927712759 : Rat) / 398273820) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-8420008 : Rat) / 98097) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((80505533747 : Rat) / 796547640) [(8, 1), (9, 2), (15, 2)],
  term ((-1876366 : Rat) / 98097) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 29) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((15502696 : Rat) / 6637897) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-14720 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 29) [(8, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-11627022 : Rat) / 6637897) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((11040 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57743064 : Rat) / 33189485) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-2944 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-31005392 : Rat) / 6637897) [(8, 2), (9, 1), (11, 1), (13, 2), (15, 2)],
  term ((29440 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-28871532 : Rat) / 33189485) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-1472 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((67628272 : Rat) / 33189485) [(8, 2), (9, 1), (11, 1), (15, 4)],
  term ((-5888 : Rat) / 32699) [(8, 2), (9, 1), (11, 1), (15, 4), (16, 1)],
  term ((5 : Rat) / 4) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((40 : Rat) / 29) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term (2 : Rat) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-15 : Rat) / 16) [(8, 2), (9, 1), (13, 1)],
  term ((-795 : Rat) / 116) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 29) [(8, 2), (9, 1), (13, 1), (15, 4)],
  term ((-5 : Rat) / 2) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((-80 : Rat) / 29) [(8, 2), (9, 1), (13, 2), (15, 3)],
  term ((-255 : Rat) / 232) [(8, 2), (9, 1), (15, 1)],
  term ((249 : Rat) / 58) [(8, 2), (9, 1), (15, 3)],
  term ((1116194112 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-211968 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 3)],
  term ((5888 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(8, 2), (10, 1), (12, 1), (15, 2)],
  term ((571860 : Rat) / 32699) [(8, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-57473363179 : Rat) / 199136910) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((5518172 : Rat) / 98097) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(8, 2), (10, 1), (13, 1), (15, 3)],
  term ((-381240 : Rat) / 32699) [(8, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(8, 2), (10, 1), (13, 2), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((59009681 : Rat) / 1373358) [(8, 2), (10, 1), (15, 2)],
  term ((-816598 : Rat) / 98097) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(8, 2), (10, 1), (15, 4)],
  term ((571860 : Rat) / 32699) [(8, 2), (10, 1), (15, 4), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2760000 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((15355821729 : Rat) / 33189485) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2951138 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3875674 : Rat) / 4741355) [(8, 2), (11, 1), (12, 1), (15, 3)],
  term ((5152 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-201128720203 : Rat) / 99568455) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((38532676 : Rat) / 98097) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(8, 2), (11, 1), (13, 1), (15, 4)],
  term ((2760000 : Rat) / 32699) [(8, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(8, 2), (11, 1), (13, 2), (15, 3)],
  term ((-5520000 : Rat) / 32699) [(8, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-15909027649 : Rat) / 56896260) [(8, 2), (11, 1), (15, 1)],
  term ((5363293 : Rat) / 98097) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((5128782012 : Rat) / 6637897) [(8, 2), (11, 1), (15, 3)],
  term ((-4921622 : Rat) / 32699) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-527091664 : Rat) / 1746815) [(8, 2), (11, 2), (12, 1), (15, 2)],
  term ((100096 : Rat) / 1721) [(8, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-759632104 : Rat) / 4741355) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((1009792 : Rat) / 32699) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(8, 2), (11, 2), (13, 1), (15, 3)],
  term ((-5228544 : Rat) / 32699) [(8, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(8, 2), (11, 2), (13, 2), (15, 2)],
  term ((2614272 : Rat) / 32699) [(8, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((1402993988 : Rat) / 4741355) [(8, 2), (11, 2), (15, 2)],
  term ((-1865024 : Rat) / 32699) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((-10262784752 : Rat) / 33189485) [(8, 2), (11, 2), (15, 4)],
  term ((1948928 : Rat) / 32699) [(8, 2), (11, 2), (15, 4), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(8, 2), (11, 3), (13, 1), (15, 2)],
  term ((94208 : Rat) / 32699) [(8, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(8, 2), (11, 3), (15, 1)],
  term ((-5888 : Rat) / 32699) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(8, 2), (11, 3), (15, 3)],
  term ((-23552 : Rat) / 32699) [(8, 2), (11, 3), (15, 3), (16, 1)],
  term ((-109 : Rat) / 40) [(8, 2), (12, 1)],
  term ((72607343635 : Rat) / 53103176) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8620783 : Rat) / 32699) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1471224841259 : Rat) / 1593095280) [(8, 2), (12, 1), (15, 2)],
  term ((35114623 : Rat) / 196194) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6964005774 : Rat) / 6637897) [(8, 2), (13, 1), (15, 1)],
  term ((6605794 : Rat) / 32699) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((179348477725 : Rat) / 53103176) [(8, 2), (13, 1), (15, 3)],
  term ((-21400505 : Rat) / 32699) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 20) [(8, 2), (13, 2)],
  term ((-361948103067 : Rat) / 132757940) [(8, 2), (13, 2), (15, 2)],
  term ((31005392 : Rat) / 33189485) [(8, 3), (11, 1), (13, 1), (15, 2)],
  term ((-5888 : Rat) / 32699) [(8, 3), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15502696 : Rat) / 228893) [(8, 3), (11, 1), (15, 1)],
  term ((426880 : Rat) / 32699) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 3), (11, 2), (13, 1), (15, 1)],
  term ((-47104 : Rat) / 32699) [(8, 3), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 40) [(8, 3), (12, 1)],
  term ((174927712759 : Rat) / 398273820) [(8, 3), (13, 1), (15, 1)],
  term ((-8420008 : Rat) / 98097) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((80505533747 : Rat) / 796547640) [(8, 3), (15, 2)],
  term ((-1876366 : Rat) / 98097) [(8, 3), (15, 2), (16, 1)],
  term ((1116194112 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-211968 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 3)],
  term ((5888 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(9, 2), (10, 1), (12, 1), (15, 2)],
  term ((571860 : Rat) / 32699) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-57473363179 : Rat) / 199136910) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((5518172 : Rat) / 98097) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(9, 2), (10, 1), (13, 1), (15, 3)],
  term ((-381240 : Rat) / 32699) [(9, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(9, 2), (10, 1), (13, 2), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((59009681 : Rat) / 1373358) [(9, 2), (10, 1), (15, 2)],
  term ((-816598 : Rat) / 98097) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(9, 2), (10, 1), (15, 4)],
  term ((571860 : Rat) / 32699) [(9, 2), (10, 1), (15, 4), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2760000 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((15355821729 : Rat) / 33189485) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2951138 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3875674 : Rat) / 4741355) [(9, 2), (11, 1), (12, 1), (15, 3)],
  term ((5152 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-201128720203 : Rat) / 99568455) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((38532676 : Rat) / 98097) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(9, 2), (11, 1), (13, 1), (15, 4)],
  term ((2760000 : Rat) / 32699) [(9, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(9, 2), (11, 1), (13, 2), (15, 3)],
  term ((-5520000 : Rat) / 32699) [(9, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-15909027649 : Rat) / 56896260) [(9, 2), (11, 1), (15, 1)],
  term ((5363293 : Rat) / 98097) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((5128782012 : Rat) / 6637897) [(9, 2), (11, 1), (15, 3)],
  term ((-4921622 : Rat) / 32699) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-527091664 : Rat) / 1746815) [(9, 2), (11, 2), (12, 1), (15, 2)],
  term ((100096 : Rat) / 1721) [(9, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-759632104 : Rat) / 4741355) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((1009792 : Rat) / 32699) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(9, 2), (11, 2), (13, 1), (15, 3)],
  term ((-5228544 : Rat) / 32699) [(9, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(9, 2), (11, 2), (13, 2), (15, 2)],
  term ((2614272 : Rat) / 32699) [(9, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((1402993988 : Rat) / 4741355) [(9, 2), (11, 2), (15, 2)],
  term ((-1865024 : Rat) / 32699) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-10262784752 : Rat) / 33189485) [(9, 2), (11, 2), (15, 4)],
  term ((1948928 : Rat) / 32699) [(9, 2), (11, 2), (15, 4), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(9, 2), (11, 3), (13, 1), (15, 2)],
  term ((94208 : Rat) / 32699) [(9, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(9, 2), (11, 3), (15, 1)],
  term ((-5888 : Rat) / 32699) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(9, 2), (11, 3), (15, 3)],
  term ((-23552 : Rat) / 32699) [(9, 2), (11, 3), (15, 3), (16, 1)],
  term ((-109 : Rat) / 40) [(9, 2), (12, 1)],
  term ((72607343635 : Rat) / 53103176) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8620783 : Rat) / 32699) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1471224841259 : Rat) / 1593095280) [(9, 2), (12, 1), (15, 2)],
  term ((35114623 : Rat) / 196194) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6964005774 : Rat) / 6637897) [(9, 2), (13, 1), (15, 1)],
  term ((6605794 : Rat) / 32699) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((179348477725 : Rat) / 53103176) [(9, 2), (13, 1), (15, 3)],
  term ((-21400505 : Rat) / 32699) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 20) [(9, 2), (13, 2)],
  term ((-361948103067 : Rat) / 132757940) [(9, 2), (13, 2), (15, 2)],
  term ((-4 : Rat) / 29) [(9, 3), (10, 1), (15, 1)],
  term ((15502696 : Rat) / 6637897) [(9, 3), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-14720 : Rat) / 32699) [(9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 29) [(9, 3), (11, 1), (12, 1), (15, 2)],
  term ((-11627022 : Rat) / 6637897) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((11040 : Rat) / 32699) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57743064 : Rat) / 33189485) [(9, 3), (11, 1), (13, 1), (15, 3)],
  term ((-2944 : Rat) / 32699) [(9, 3), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-31005392 : Rat) / 6637897) [(9, 3), (11, 1), (13, 2), (15, 2)],
  term ((29440 : Rat) / 32699) [(9, 3), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-28871532 : Rat) / 33189485) [(9, 3), (11, 1), (15, 2)],
  term ((-1472 : Rat) / 32699) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((67628272 : Rat) / 33189485) [(9, 3), (11, 1), (15, 4)],
  term ((-5888 : Rat) / 32699) [(9, 3), (11, 1), (15, 4), (16, 1)],
  term ((5 : Rat) / 4) [(9, 3), (12, 1), (13, 1)],
  term ((40 : Rat) / 29) [(9, 3), (12, 1), (13, 1), (15, 2)],
  term (2 : Rat) [(9, 3), (12, 1), (15, 1)],
  term ((-15 : Rat) / 16) [(9, 3), (13, 1)],
  term ((-795 : Rat) / 116) [(9, 3), (13, 1), (15, 2)],
  term ((40 : Rat) / 29) [(9, 3), (13, 1), (15, 4)],
  term ((-5 : Rat) / 2) [(9, 3), (13, 2), (15, 1)],
  term ((-80 : Rat) / 29) [(9, 3), (13, 2), (15, 3)],
  term ((-255 : Rat) / 232) [(9, 3), (15, 1)],
  term ((249 : Rat) / 58) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NYYYY_block_15_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_15_0100_0199
      rs_R009_ueqv_R009NYYYY_block_15_0100_0199 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
