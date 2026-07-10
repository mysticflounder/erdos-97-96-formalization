/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 13:100-128

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 13 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0100 : Poly :=
[
  term ((-15384320 : Rat) / 36742197) [(9, 1), (15, 3)]
]

/-- Partial product 100 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0100 : Poly :=
[
  term ((30768640 : Rat) / 36742197) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((-15384320 : Rat) / 36742197) [(2, 2), (9, 1), (15, 3)],
  term ((30768640 : Rat) / 36742197) [(3, 1), (5, 1), (9, 1), (15, 3)],
  term ((-15384320 : Rat) / 36742197) [(3, 2), (9, 1), (15, 3)],
  term ((-30768640 : Rat) / 36742197) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((-30768640 : Rat) / 36742197) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((15384320 : Rat) / 36742197) [(6, 2), (9, 1), (15, 3)],
  term ((15384320 : Rat) / 36742197) [(7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0100
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0101 : Poly :=
[
  term ((551 : Rat) / 67) [(9, 2)]
]

/-- Partial product 101 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0101 : Poly :=
[
  term ((-1102 : Rat) / 67) [(2, 1), (4, 1), (9, 2)],
  term ((551 : Rat) / 67) [(2, 2), (9, 2)],
  term ((-1102 : Rat) / 67) [(3, 1), (5, 1), (9, 2)],
  term ((551 : Rat) / 67) [(3, 2), (9, 2)],
  term ((1102 : Rat) / 67) [(4, 1), (6, 1), (9, 2)],
  term ((1102 : Rat) / 67) [(5, 1), (7, 1), (9, 2)],
  term ((-551 : Rat) / 67) [(6, 2), (9, 2)],
  term ((-551 : Rat) / 67) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0101
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0102 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0102 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(2, 1), (4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(4, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0102
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0103 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0103 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(2, 1), (4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(4, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0103
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0104 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0104 : Poly :=
[
  term ((-76905767668 : Rat) / 18848747061) [(2, 1), (4, 1), (9, 2), (15, 2), (16, 1)],
  term ((38452883834 : Rat) / 18848747061) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((38452883834 : Rat) / 18848747061) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(4, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(6, 2), (9, 2), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(7, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0104
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0105 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 105 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0105 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((19496960 : Rat) / 110226591) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((-38993920 : Rat) / 110226591) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((19496960 : Rat) / 110226591) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((38993920 : Rat) / 110226591) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((38993920 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-19496960 : Rat) / 110226591) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((-19496960 : Rat) / 110226591) [(7, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0105
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0106 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 106 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0106 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(6, 2), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(7, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0106
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0107 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 2)]
]

/-- Partial product 107 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0107 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(2, 1), (4, 1), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(2, 2), (10, 1), (13, 2)],
  term ((-1827840 : Rat) / 12247399) [(3, 1), (5, 1), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(3, 2), (10, 1), (13, 2)],
  term ((1827840 : Rat) / 12247399) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((-913920 : Rat) / 12247399) [(6, 2), (10, 1), (13, 2)],
  term ((-913920 : Rat) / 12247399) [(7, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0107
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0108 : Poly :=
[
  term ((-90576640 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 108 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0108 : Poly :=
[
  term ((181153280 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-90576640 : Rat) / 110226591) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((181153280 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-90576640 : Rat) / 110226591) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-181153280 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-181153280 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((90576640 : Rat) / 110226591) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((90576640 : Rat) / 110226591) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0108
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0109 : Poly :=
[
  term ((-1530558860 : Rat) / 110226591) [(11, 1), (13, 1)]
]

/-- Partial product 109 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0109 : Poly :=
[
  term ((3061117720 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-1530558860 : Rat) / 110226591) [(2, 2), (11, 1), (13, 1)],
  term ((3061117720 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-1530558860 : Rat) / 110226591) [(3, 2), (11, 1), (13, 1)],
  term ((-3061117720 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-3061117720 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((1530558860 : Rat) / 110226591) [(6, 2), (11, 1), (13, 1)],
  term ((1530558860 : Rat) / 110226591) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0109
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0110 : Poly :=
[
  term ((738133760 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 110 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0110 : Poly :=
[
  term ((-1476267520 : Rat) / 330679773) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((738133760 : Rat) / 330679773) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1476267520 : Rat) / 330679773) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((738133760 : Rat) / 330679773) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((1476267520 : Rat) / 330679773) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((1476267520 : Rat) / 330679773) [(5, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-738133760 : Rat) / 330679773) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-738133760 : Rat) / 330679773) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0110
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0111 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 111 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0111 : Poly :=
[
  term ((-35164160 : Rat) / 36742197) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((17582080 : Rat) / 36742197) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((-35164160 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((17582080 : Rat) / 36742197) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((35164160 : Rat) / 36742197) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((35164160 : Rat) / 36742197) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(7, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0111
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0112 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 112 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0112 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(6, 2), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(7, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0112
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0113 : Poly :=
[
  term ((3131968000 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 113 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0113 : Poly :=
[
  term ((-6263936000 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((3131968000 : Rat) / 110226591) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-6263936000 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((3131968000 : Rat) / 110226591) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((6263936000 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((6263936000 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3131968000 : Rat) / 110226591) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3131968000 : Rat) / 110226591) [(7, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0113
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0114 : Poly :=
[
  term ((611589874094 : Rat) / 18848747061) [(11, 1), (15, 1)]
]

/-- Partial product 114 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0114 : Poly :=
[
  term ((-1223179748188 : Rat) / 18848747061) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((611589874094 : Rat) / 18848747061) [(2, 2), (11, 1), (15, 1)],
  term ((-1223179748188 : Rat) / 18848747061) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((611589874094 : Rat) / 18848747061) [(3, 2), (11, 1), (15, 1)],
  term ((1223179748188 : Rat) / 18848747061) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((1223179748188 : Rat) / 18848747061) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-611589874094 : Rat) / 18848747061) [(6, 2), (11, 1), (15, 1)],
  term ((-611589874094 : Rat) / 18848747061) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0114
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0115 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(11, 1), (15, 3)]
]

/-- Partial product 115 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0115 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(2, 1), (4, 1), (11, 1), (15, 3)],
  term ((9748480 : Rat) / 36742197) [(2, 2), (11, 1), (15, 3)],
  term ((-19496960 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((9748480 : Rat) / 36742197) [(3, 2), (11, 1), (15, 3)],
  term ((19496960 : Rat) / 36742197) [(4, 1), (6, 1), (11, 1), (15, 3)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (7, 1), (11, 1), (15, 3)],
  term ((-9748480 : Rat) / 36742197) [(6, 2), (11, 1), (15, 3)],
  term ((-9748480 : Rat) / 36742197) [(7, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0115
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0116 : Poly :=
[
  term ((-6365488640 : Rat) / 330679773) [(11, 2)]
]

/-- Partial product 116 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0116 : Poly :=
[
  term ((12730977280 : Rat) / 330679773) [(2, 1), (4, 1), (11, 2)],
  term ((-6365488640 : Rat) / 330679773) [(2, 2), (11, 2)],
  term ((12730977280 : Rat) / 330679773) [(3, 1), (5, 1), (11, 2)],
  term ((-6365488640 : Rat) / 330679773) [(3, 2), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(4, 1), (6, 1), (11, 2)],
  term ((-12730977280 : Rat) / 330679773) [(5, 1), (7, 1), (11, 2)],
  term ((6365488640 : Rat) / 330679773) [(6, 2), (11, 2)],
  term ((6365488640 : Rat) / 330679773) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0116
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0117 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 117 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0117 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(7, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0117
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0118 : Poly :=
[
  term ((-4245780 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 118 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0118 : Poly :=
[
  term ((8491560 : Rat) / 12247399) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4245780 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((8491560 : Rat) / 12247399) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4245780 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8491560 : Rat) / 12247399) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8491560 : Rat) / 12247399) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((4245780 : Rat) / 12247399) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((4245780 : Rat) / 12247399) [(7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0118
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0119 : Poly :=
[
  term ((81680720 : Rat) / 110226591) [(12, 1), (15, 2)]
]

/-- Partial product 119 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0119 : Poly :=
[
  term ((-163361440 : Rat) / 110226591) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((81680720 : Rat) / 110226591) [(2, 2), (12, 1), (15, 2)],
  term ((-163361440 : Rat) / 110226591) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((81680720 : Rat) / 110226591) [(3, 2), (12, 1), (15, 2)],
  term ((163361440 : Rat) / 110226591) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((163361440 : Rat) / 110226591) [(5, 1), (7, 1), (12, 1), (15, 2)],
  term ((-81680720 : Rat) / 110226591) [(6, 2), (12, 1), (15, 2)],
  term ((-81680720 : Rat) / 110226591) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0119
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0120 : Poly :=
[
  term ((3653615888 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 120 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0120 : Poly :=
[
  term ((-7307231776 : Rat) / 330679773) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((3653615888 : Rat) / 330679773) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-7307231776 : Rat) / 330679773) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((3653615888 : Rat) / 330679773) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((7307231776 : Rat) / 330679773) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((7307231776 : Rat) / 330679773) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3653615888 : Rat) / 330679773) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3653615888 : Rat) / 330679773) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0120_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0120
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0121 : Poly :=
[
  term ((37069979471 : Rat) / 4188610458) [(13, 1), (15, 1)]
]

/-- Partial product 121 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0121 : Poly :=
[
  term ((-37069979471 : Rat) / 2094305229) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((37069979471 : Rat) / 4188610458) [(2, 2), (13, 1), (15, 1)],
  term ((-37069979471 : Rat) / 2094305229) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((37069979471 : Rat) / 4188610458) [(3, 2), (13, 1), (15, 1)],
  term ((37069979471 : Rat) / 2094305229) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((37069979471 : Rat) / 2094305229) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-37069979471 : Rat) / 4188610458) [(6, 2), (13, 1), (15, 1)],
  term ((-37069979471 : Rat) / 4188610458) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0121_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0121
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0122 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(13, 1), (15, 3)]
]

/-- Partial product 122 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0122 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((1370880 : Rat) / 12247399) [(2, 2), (13, 1), (15, 3)],
  term ((-2741760 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((1370880 : Rat) / 12247399) [(3, 2), (13, 1), (15, 3)],
  term ((2741760 : Rat) / 12247399) [(4, 1), (6, 1), (13, 1), (15, 3)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-1370880 : Rat) / 12247399) [(6, 2), (13, 1), (15, 3)],
  term ((-1370880 : Rat) / 12247399) [(7, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0122_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0122
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0123 : Poly :=
[
  term ((-27008709 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 123 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0123 : Poly :=
[
  term ((54017418 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2)],
  term ((-27008709 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((54017418 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2)],
  term ((-27008709 : Rat) / 12247399) [(3, 2), (13, 2)],
  term ((-54017418 : Rat) / 12247399) [(4, 1), (6, 1), (13, 2)],
  term ((-54017418 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2)],
  term ((27008709 : Rat) / 12247399) [(6, 2), (13, 2)],
  term ((27008709 : Rat) / 12247399) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0123_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0123
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0124 : Poly :=
[
  term ((11533340 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 124 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0124 : Poly :=
[
  term ((-23066680 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((11533340 : Rat) / 12247399) [(2, 2), (13, 2), (14, 1)],
  term ((-23066680 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((11533340 : Rat) / 12247399) [(3, 2), (13, 2), (14, 1)],
  term ((23066680 : Rat) / 12247399) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((23066680 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((-11533340 : Rat) / 12247399) [(6, 2), (13, 2), (14, 1)],
  term ((-11533340 : Rat) / 12247399) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0124_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0124
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0125 : Poly :=
[
  term ((49 : Rat) / 67) [(14, 1)]
]

/-- Partial product 125 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0125 : Poly :=
[
  term ((-98 : Rat) / 67) [(2, 1), (4, 1), (14, 1)],
  term ((49 : Rat) / 67) [(2, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(3, 1), (5, 1), (14, 1)],
  term ((49 : Rat) / 67) [(3, 2), (14, 1)],
  term ((98 : Rat) / 67) [(4, 1), (6, 1), (14, 1)],
  term ((98 : Rat) / 67) [(5, 1), (7, 1), (14, 1)],
  term ((-49 : Rat) / 67) [(6, 2), (14, 1)],
  term ((-49 : Rat) / 67) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0125_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0125
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0126 : Poly :=
[
  term ((-2824364000 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 126 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0126 : Poly :=
[
  term ((5648728000 : Rat) / 110226591) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((-2824364000 : Rat) / 110226591) [(2, 2), (14, 1), (15, 2)],
  term ((5648728000 : Rat) / 110226591) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-2824364000 : Rat) / 110226591) [(3, 2), (14, 1), (15, 2)],
  term ((-5648728000 : Rat) / 110226591) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-5648728000 : Rat) / 110226591) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((2824364000 : Rat) / 110226591) [(6, 2), (14, 1), (15, 2)],
  term ((2824364000 : Rat) / 110226591) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0126_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0126
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0127 : Poly :=
[
  term ((-2671111129 : Rat) / 281324583) [(15, 2)]
]

/-- Partial product 127 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0127 : Poly :=
[
  term ((5342222258 : Rat) / 281324583) [(2, 1), (4, 1), (15, 2)],
  term ((-2671111129 : Rat) / 281324583) [(2, 2), (15, 2)],
  term ((5342222258 : Rat) / 281324583) [(3, 1), (5, 1), (15, 2)],
  term ((-2671111129 : Rat) / 281324583) [(3, 2), (15, 2)],
  term ((-5342222258 : Rat) / 281324583) [(4, 1), (6, 1), (15, 2)],
  term ((-5342222258 : Rat) / 281324583) [(5, 1), (7, 1), (15, 2)],
  term ((2671111129 : Rat) / 281324583) [(6, 2), (15, 2)],
  term ((2671111129 : Rat) / 281324583) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0127_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0127
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 13. -/
def rs_R009_ueqv_R009NNNYN_coefficient_13_0128 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(15, 4)]
]

/-- Partial product 128 for generator 13. -/
def rs_R009_ueqv_R009NNNYN_partial_13_0128 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(2, 1), (4, 1), (15, 4)],
  term ((-8791040 : Rat) / 36742197) [(2, 2), (15, 4)],
  term ((17582080 : Rat) / 36742197) [(3, 1), (5, 1), (15, 4)],
  term ((-8791040 : Rat) / 36742197) [(3, 2), (15, 4)],
  term ((-17582080 : Rat) / 36742197) [(4, 1), (6, 1), (15, 4)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (7, 1), (15, 4)],
  term ((8791040 : Rat) / 36742197) [(6, 2), (15, 4)],
  term ((8791040 : Rat) / 36742197) [(7, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 13. -/
theorem rs_R009_ueqv_R009NNNYN_partial_13_0128_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_13_0128
        rs_R009_ueqv_R009NNNYN_generator_13_0100_0128 =
      rs_R009_ueqv_R009NNNYN_partial_13_0128 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_13_0100_0128 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_13_0100,
  rs_R009_ueqv_R009NNNYN_partial_13_0101,
  rs_R009_ueqv_R009NNNYN_partial_13_0102,
  rs_R009_ueqv_R009NNNYN_partial_13_0103,
  rs_R009_ueqv_R009NNNYN_partial_13_0104,
  rs_R009_ueqv_R009NNNYN_partial_13_0105,
  rs_R009_ueqv_R009NNNYN_partial_13_0106,
  rs_R009_ueqv_R009NNNYN_partial_13_0107,
  rs_R009_ueqv_R009NNNYN_partial_13_0108,
  rs_R009_ueqv_R009NNNYN_partial_13_0109,
  rs_R009_ueqv_R009NNNYN_partial_13_0110,
  rs_R009_ueqv_R009NNNYN_partial_13_0111,
  rs_R009_ueqv_R009NNNYN_partial_13_0112,
  rs_R009_ueqv_R009NNNYN_partial_13_0113,
  rs_R009_ueqv_R009NNNYN_partial_13_0114,
  rs_R009_ueqv_R009NNNYN_partial_13_0115,
  rs_R009_ueqv_R009NNNYN_partial_13_0116,
  rs_R009_ueqv_R009NNNYN_partial_13_0117,
  rs_R009_ueqv_R009NNNYN_partial_13_0118,
  rs_R009_ueqv_R009NNNYN_partial_13_0119,
  rs_R009_ueqv_R009NNNYN_partial_13_0120,
  rs_R009_ueqv_R009NNNYN_partial_13_0121,
  rs_R009_ueqv_R009NNNYN_partial_13_0122,
  rs_R009_ueqv_R009NNNYN_partial_13_0123,
  rs_R009_ueqv_R009NNNYN_partial_13_0124,
  rs_R009_ueqv_R009NNNYN_partial_13_0125,
  rs_R009_ueqv_R009NNNYN_partial_13_0126,
  rs_R009_ueqv_R009NNNYN_partial_13_0127,
  rs_R009_ueqv_R009NNNYN_partial_13_0128
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_13_0100_0128 : Poly :=
[
  term ((30768640 : Rat) / 36742197) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((-1102 : Rat) / 67) [(2, 1), (4, 1), (9, 2)],
  term ((44102409344 : Rat) / 18848747061) [(2, 1), (4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(2, 1), (4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(2, 1), (4, 1), (9, 2), (15, 2), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(2, 1), (4, 1), (10, 1), (11, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(2, 1), (4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(2, 1), (4, 1), (10, 1), (13, 2)],
  term ((181153280 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((3061117720 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-1476267520 : Rat) / 330679773) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-35164160 : Rat) / 36742197) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(2, 1), (4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-6263936000 : Rat) / 110226591) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1223179748188 : Rat) / 18848747061) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(2, 1), (4, 1), (11, 1), (15, 3)],
  term ((12730977280 : Rat) / 330679773) [(2, 1), (4, 1), (11, 2)],
  term ((38993920 : Rat) / 36742197) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((8491560 : Rat) / 12247399) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-163361440 : Rat) / 110226591) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-7307231776 : Rat) / 330679773) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-37069979471 : Rat) / 2094305229) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((54017418 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2)],
  term ((-23066680 : Rat) / 12247399) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(2, 1), (4, 1), (14, 1)],
  term ((5648728000 : Rat) / 110226591) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((5342222258 : Rat) / 281324583) [(2, 1), (4, 1), (15, 2)],
  term ((17582080 : Rat) / 36742197) [(2, 1), (4, 1), (15, 4)],
  term ((-15384320 : Rat) / 36742197) [(2, 2), (9, 1), (15, 3)],
  term ((551 : Rat) / 67) [(2, 2), (9, 2)],
  term ((-22051204672 : Rat) / 18848747061) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((38452883834 : Rat) / 18848747061) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((19496960 : Rat) / 110226591) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(2, 2), (10, 1), (13, 2)],
  term ((-90576640 : Rat) / 110226591) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1530558860 : Rat) / 110226591) [(2, 2), (11, 1), (13, 1)],
  term ((738133760 : Rat) / 330679773) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((17582080 : Rat) / 36742197) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((3131968000 : Rat) / 110226591) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((611589874094 : Rat) / 18848747061) [(2, 2), (11, 1), (15, 1)],
  term ((9748480 : Rat) / 36742197) [(2, 2), (11, 1), (15, 3)],
  term ((-6365488640 : Rat) / 330679773) [(2, 2), (11, 2)],
  term ((-19496960 : Rat) / 36742197) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-4245780 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((81680720 : Rat) / 110226591) [(2, 2), (12, 1), (15, 2)],
  term ((3653615888 : Rat) / 330679773) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((37069979471 : Rat) / 4188610458) [(2, 2), (13, 1), (15, 1)],
  term ((1370880 : Rat) / 12247399) [(2, 2), (13, 1), (15, 3)],
  term ((-27008709 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((11533340 : Rat) / 12247399) [(2, 2), (13, 2), (14, 1)],
  term ((49 : Rat) / 67) [(2, 2), (14, 1)],
  term ((-2824364000 : Rat) / 110226591) [(2, 2), (14, 1), (15, 2)],
  term ((-2671111129 : Rat) / 281324583) [(2, 2), (15, 2)],
  term ((-8791040 : Rat) / 36742197) [(2, 2), (15, 4)],
  term ((30768640 : Rat) / 36742197) [(3, 1), (5, 1), (9, 1), (15, 3)],
  term ((-1102 : Rat) / 67) [(3, 1), (5, 1), (9, 2)],
  term ((44102409344 : Rat) / 18848747061) [(3, 1), (5, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(3, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(3, 1), (5, 1), (10, 1), (13, 2)],
  term ((181153280 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((3061117720 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-1476267520 : Rat) / 330679773) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-35164160 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(3, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((-6263936000 : Rat) / 110226591) [(3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1223179748188 : Rat) / 18848747061) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((12730977280 : Rat) / 330679773) [(3, 1), (5, 1), (11, 2)],
  term ((38993920 : Rat) / 36742197) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((8491560 : Rat) / 12247399) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-163361440 : Rat) / 110226591) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-7307231776 : Rat) / 330679773) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-37069979471 : Rat) / 2094305229) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((54017418 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2)],
  term ((-23066680 : Rat) / 12247399) [(3, 1), (5, 1), (13, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(3, 1), (5, 1), (14, 1)],
  term ((5648728000 : Rat) / 110226591) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((5342222258 : Rat) / 281324583) [(3, 1), (5, 1), (15, 2)],
  term ((17582080 : Rat) / 36742197) [(3, 1), (5, 1), (15, 4)],
  term ((-15384320 : Rat) / 36742197) [(3, 2), (9, 1), (15, 3)],
  term ((551 : Rat) / 67) [(3, 2), (9, 2)],
  term ((-22051204672 : Rat) / 18848747061) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((38452883834 : Rat) / 18848747061) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((19496960 : Rat) / 110226591) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(3, 2), (10, 1), (13, 2)],
  term ((-90576640 : Rat) / 110226591) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1530558860 : Rat) / 110226591) [(3, 2), (11, 1), (13, 1)],
  term ((738133760 : Rat) / 330679773) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((17582080 : Rat) / 36742197) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((3131968000 : Rat) / 110226591) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((611589874094 : Rat) / 18848747061) [(3, 2), (11, 1), (15, 1)],
  term ((9748480 : Rat) / 36742197) [(3, 2), (11, 1), (15, 3)],
  term ((-6365488640 : Rat) / 330679773) [(3, 2), (11, 2)],
  term ((-19496960 : Rat) / 36742197) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-4245780 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((81680720 : Rat) / 110226591) [(3, 2), (12, 1), (15, 2)],
  term ((3653615888 : Rat) / 330679773) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((37069979471 : Rat) / 4188610458) [(3, 2), (13, 1), (15, 1)],
  term ((1370880 : Rat) / 12247399) [(3, 2), (13, 1), (15, 3)],
  term ((-27008709 : Rat) / 12247399) [(3, 2), (13, 2)],
  term ((11533340 : Rat) / 12247399) [(3, 2), (13, 2), (14, 1)],
  term ((49 : Rat) / 67) [(3, 2), (14, 1)],
  term ((-2824364000 : Rat) / 110226591) [(3, 2), (14, 1), (15, 2)],
  term ((-2671111129 : Rat) / 281324583) [(3, 2), (15, 2)],
  term ((-8791040 : Rat) / 36742197) [(3, 2), (15, 4)],
  term ((-30768640 : Rat) / 36742197) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((1102 : Rat) / 67) [(4, 1), (6, 1), (9, 2)],
  term ((-44102409344 : Rat) / 18848747061) [(4, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(4, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(4, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((38993920 : Rat) / 110226591) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((-181153280 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3061117720 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((1476267520 : Rat) / 330679773) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((35164160 : Rat) / 36742197) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((6263936000 : Rat) / 110226591) [(4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((1223179748188 : Rat) / 18848747061) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 1), (6, 1), (11, 1), (15, 3)],
  term ((-12730977280 : Rat) / 330679773) [(4, 1), (6, 1), (11, 2)],
  term ((-38993920 : Rat) / 36742197) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8491560 : Rat) / 12247399) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((163361440 : Rat) / 110226591) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((7307231776 : Rat) / 330679773) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((37069979471 : Rat) / 2094305229) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 1), (6, 1), (13, 1), (15, 3)],
  term ((-54017418 : Rat) / 12247399) [(4, 1), (6, 1), (13, 2)],
  term ((23066680 : Rat) / 12247399) [(4, 1), (6, 1), (13, 2), (14, 1)],
  term ((98 : Rat) / 67) [(4, 1), (6, 1), (14, 1)],
  term ((-5648728000 : Rat) / 110226591) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-5342222258 : Rat) / 281324583) [(4, 1), (6, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(4, 1), (6, 1), (15, 4)],
  term ((-30768640 : Rat) / 36742197) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((1102 : Rat) / 67) [(5, 1), (7, 1), (9, 2)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((38993920 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((-181153280 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3061117720 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((1476267520 : Rat) / 330679773) [(5, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((35164160 : Rat) / 36742197) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((6263936000 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((1223179748188 : Rat) / 18848747061) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (7, 1), (11, 1), (15, 3)],
  term ((-12730977280 : Rat) / 330679773) [(5, 1), (7, 1), (11, 2)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8491560 : Rat) / 12247399) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((163361440 : Rat) / 110226591) [(5, 1), (7, 1), (12, 1), (15, 2)],
  term ((7307231776 : Rat) / 330679773) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((37069979471 : Rat) / 2094305229) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-54017418 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2)],
  term ((23066680 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((98 : Rat) / 67) [(5, 1), (7, 1), (14, 1)],
  term ((-5648728000 : Rat) / 110226591) [(5, 1), (7, 1), (14, 1), (15, 2)],
  term ((-5342222258 : Rat) / 281324583) [(5, 1), (7, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(5, 1), (7, 1), (15, 4)],
  term ((15384320 : Rat) / 36742197) [(6, 2), (9, 1), (15, 3)],
  term ((-551 : Rat) / 67) [(6, 2), (9, 2)],
  term ((22051204672 : Rat) / 18848747061) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(6, 2), (9, 2), (15, 2), (16, 1)],
  term ((-19496960 : Rat) / 110226591) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(6, 2), (10, 1), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(6, 2), (10, 1), (13, 2)],
  term ((90576640 : Rat) / 110226591) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((1530558860 : Rat) / 110226591) [(6, 2), (11, 1), (13, 1)],
  term ((-738133760 : Rat) / 330679773) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-17582080 : Rat) / 36742197) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(6, 2), (11, 1), (13, 2), (15, 1)],
  term ((-3131968000 : Rat) / 110226591) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-611589874094 : Rat) / 18848747061) [(6, 2), (11, 1), (15, 1)],
  term ((-9748480 : Rat) / 36742197) [(6, 2), (11, 1), (15, 3)],
  term ((6365488640 : Rat) / 330679773) [(6, 2), (11, 2)],
  term ((19496960 : Rat) / 36742197) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((4245780 : Rat) / 12247399) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((-81680720 : Rat) / 110226591) [(6, 2), (12, 1), (15, 2)],
  term ((-3653615888 : Rat) / 330679773) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-37069979471 : Rat) / 4188610458) [(6, 2), (13, 1), (15, 1)],
  term ((-1370880 : Rat) / 12247399) [(6, 2), (13, 1), (15, 3)],
  term ((27008709 : Rat) / 12247399) [(6, 2), (13, 2)],
  term ((-11533340 : Rat) / 12247399) [(6, 2), (13, 2), (14, 1)],
  term ((-49 : Rat) / 67) [(6, 2), (14, 1)],
  term ((2824364000 : Rat) / 110226591) [(6, 2), (14, 1), (15, 2)],
  term ((2671111129 : Rat) / 281324583) [(6, 2), (15, 2)],
  term ((8791040 : Rat) / 36742197) [(6, 2), (15, 4)],
  term ((15384320 : Rat) / 36742197) [(7, 2), (9, 1), (15, 3)],
  term ((-551 : Rat) / 67) [(7, 2), (9, 2)],
  term ((22051204672 : Rat) / 18848747061) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-19496960 : Rat) / 110226591) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(7, 2), (10, 1), (13, 2)],
  term ((90576640 : Rat) / 110226591) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((1530558860 : Rat) / 110226591) [(7, 2), (11, 1), (13, 1)],
  term ((-738133760 : Rat) / 330679773) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-17582080 : Rat) / 36742197) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(7, 2), (11, 1), (13, 2), (15, 1)],
  term ((-3131968000 : Rat) / 110226591) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-611589874094 : Rat) / 18848747061) [(7, 2), (11, 1), (15, 1)],
  term ((-9748480 : Rat) / 36742197) [(7, 2), (11, 1), (15, 3)],
  term ((6365488640 : Rat) / 330679773) [(7, 2), (11, 2)],
  term ((19496960 : Rat) / 36742197) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((4245780 : Rat) / 12247399) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-81680720 : Rat) / 110226591) [(7, 2), (12, 1), (15, 2)],
  term ((-3653615888 : Rat) / 330679773) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-37069979471 : Rat) / 4188610458) [(7, 2), (13, 1), (15, 1)],
  term ((-1370880 : Rat) / 12247399) [(7, 2), (13, 1), (15, 3)],
  term ((27008709 : Rat) / 12247399) [(7, 2), (13, 2)],
  term ((-11533340 : Rat) / 12247399) [(7, 2), (13, 2), (14, 1)],
  term ((-49 : Rat) / 67) [(7, 2), (14, 1)],
  term ((2824364000 : Rat) / 110226591) [(7, 2), (14, 1), (15, 2)],
  term ((2671111129 : Rat) / 281324583) [(7, 2), (15, 2)],
  term ((8791040 : Rat) / 36742197) [(7, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 100 through 128. -/
theorem rs_R009_ueqv_R009NNNYN_block_13_0100_0128_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_13_0100_0128
      rs_R009_ueqv_R009NNNYN_block_13_0100_0128 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
