/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 2:100-191

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_02_0100_0191 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0100 : Poly :=
[
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 100 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0100 : Poly :=
[
  term ((-226286722403123200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0100
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0101 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0101 : Poly :=
[
  term ((525370704355696640 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 2), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0101_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0101
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0102 : Poly :=
[
  term ((-265743411665469692 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 102 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0102 : Poly :=
[
  term ((-265743411665469692 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-265743411665469692 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((265743411665469692 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((265743411665469692 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0102_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0102
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0103 : Poly :=
[
  term ((653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 103 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0103 : Poly :=
[
  term ((653580947326739038 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0103_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0103
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0104 : Poly :=
[
  term ((-369935424697479436 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 104 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0104 : Poly :=
[
  term ((-369935424697479436 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-369935424697479436 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((369935424697479436 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((369935424697479436 : Rat) / 53898264945705951) [(5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0104_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0104
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0105 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 105 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0105 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0105_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0105
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0106 : Poly :=
[
  term ((232947465497600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0106 : Poly :=
[
  term ((232947465497600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((232947465497600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-232947465497600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-232947465497600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0106_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0106
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0107 : Poly :=
[
  term ((-3898112014609433600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0107 : Poly :=
[
  term ((-3898112014609433600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3898112014609433600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3898112014609433600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((3898112014609433600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0107_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0107
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0108 : Poly :=
[
  term ((5551222871488000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 108 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0108 : Poly :=
[
  term ((5551222871488000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((5551222871488000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-5551222871488000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-5551222871488000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0108_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0108
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0109 : Poly :=
[
  term ((-434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0109 : Poly :=
[
  term ((-434226380360671360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0109_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0109
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0110 : Poly :=
[
  term ((541945419433531520 : Rat) / 161694794837117853) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 110 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0110 : Poly :=
[
  term ((541945419433531520 : Rat) / 161694794837117853) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((541945419433531520 : Rat) / 161694794837117853) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-541945419433531520 : Rat) / 161694794837117853) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-541945419433531520 : Rat) / 161694794837117853) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0110_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0110
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0111 : Poly :=
[
  term ((-71765579684270080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 111 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0111 : Poly :=
[
  term ((-71765579684270080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-71765579684270080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((71765579684270080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((71765579684270080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0111_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0111
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0112 : Poly :=
[
  term ((286342149088808960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0112 : Poly :=
[
  term ((286342149088808960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((286342149088808960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-286342149088808960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-286342149088808960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0112_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0112
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0113 : Poly :=
[
  term ((-8027921526690114560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0113 : Poly :=
[
  term ((-8027921526690114560 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-8027921526690114560 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((8027921526690114560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((8027921526690114560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0113_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0113
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0114 : Poly :=
[
  term ((71329181350697365778 : Rat) / 808473974185589265) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 114 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0114 : Poly :=
[
  term ((71329181350697365778 : Rat) / 808473974185589265) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((71329181350697365778 : Rat) / 808473974185589265) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-71329181350697365778 : Rat) / 808473974185589265) [(5, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-71329181350697365778 : Rat) / 808473974185589265) [(5, 1), (8, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0114_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0114
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0115 : Poly :=
[
  term ((16328215527985529932 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 115 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0115 : Poly :=
[
  term ((16328215527985529932 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((16328215527985529932 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-16328215527985529932 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((-16328215527985529932 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0115_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0115
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0116 : Poly :=
[
  term ((-92618615359293776704 : Rat) / 53898264945705951) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0116 : Poly :=
[
  term ((-92618615359293776704 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-92618615359293776704 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((92618615359293776704 : Rat) / 53898264945705951) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((92618615359293776704 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0116_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0116
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0117 : Poly :=
[
  term ((128209750962227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 117 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0117 : Poly :=
[
  term ((128209750962227200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((128209750962227200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-128209750962227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 3), (13, 1), (16, 1)],
  term ((-128209750962227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0117_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0117
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0118 : Poly :=
[
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0118 : Poly :=
[
  term ((-120823873476454400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0118_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0118
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0119 : Poly :=
[
  term ((138162939205668160 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0119 : Poly :=
[
  term ((138162939205668160 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((138162939205668160 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0119_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0119
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0120 : Poly :=
[
  term ((-39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 120 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0120 : Poly :=
[
  term ((-39475125487333760 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0120_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0120
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0121 : Poly :=
[
  term ((-251223568242557301046 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 121 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0121 : Poly :=
[
  term ((-251223568242557301046 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-251223568242557301046 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((251223568242557301046 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((251223568242557301046 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0121_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0121
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0122 : Poly :=
[
  term ((4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 122 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0122 : Poly :=
[
  term ((4351667738521600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0122_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0122
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0123 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 123 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0123 : Poly :=
[
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0123_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0123
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0124 : Poly :=
[
  term ((-4867122002982400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 124 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0124 : Poly :=
[
  term ((-4867122002982400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4867122002982400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((4867122002982400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((4867122002982400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0124_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0124
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0125 : Poly :=
[
  term ((-1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0125 : Poly :=
[
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0125_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0125
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0126 : Poly :=
[
  term ((2877132866877473120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0126 : Poly :=
[
  term ((2877132866877473120 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2877132866877473120 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2877132866877473120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2877132866877473120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0126_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0126
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0127 : Poly :=
[
  term ((-51049872265548800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 127 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0127 : Poly :=
[
  term ((-51049872265548800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-51049872265548800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((51049872265548800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((51049872265548800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0127_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0127
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0128 : Poly :=
[
  term ((32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0128 : Poly :=
[
  term ((32792565959231680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((32792565959231680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0128_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0128
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0129 : Poly :=
[
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 129 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0129 : Poly :=
[
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((516891906287477420264 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((516891906287477420264 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0129_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0129
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0130 : Poly :=
[
  term ((927975564792982720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0130 : Poly :=
[
  term ((927975564792982720 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((927975564792982720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-927975564792982720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-927975564792982720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0130_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0130
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0131 : Poly :=
[
  term ((12888735422905340594 : Rat) / 808473974185589265) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 131 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0131 : Poly :=
[
  term ((12888735422905340594 : Rat) / 808473974185589265) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((12888735422905340594 : Rat) / 808473974185589265) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-12888735422905340594 : Rat) / 808473974185589265) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-12888735422905340594 : Rat) / 808473974185589265) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0131_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0131
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0132 : Poly :=
[
  term ((8993222828531200 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 132 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0132 : Poly :=
[
  term ((8993222828531200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((8993222828531200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-8993222828531200 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 3), (16, 1)],
  term ((-8993222828531200 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0132_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0132
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0133 : Poly :=
[
  term ((-40675381968560640 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0133 : Poly :=
[
  term ((-40675381968560640 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-40675381968560640 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((40675381968560640 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((40675381968560640 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0133_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0133
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0134 : Poly :=
[
  term ((640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0134 : Poly :=
[
  term ((640843183909698560 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0134_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0134
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0135 : Poly :=
[
  term ((153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 135 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0135 : Poly :=
[
  term ((153889062020556800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0135_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0135
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0136 : Poly :=
[
  term ((38012892672482560 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 136 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0136 : Poly :=
[
  term ((38012892672482560 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((38012892672482560 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-38012892672482560 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-38012892672482560 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0136_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0136
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0137 : Poly :=
[
  term ((5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 137 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0137 : Poly :=
[
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0137_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0137
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0138 : Poly :=
[
  term ((95753029263754240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 138 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0138 : Poly :=
[
  term ((95753029263754240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((95753029263754240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-95753029263754240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-95753029263754240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0138_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0138
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0139 : Poly :=
[
  term ((-3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0139 : Poly :=
[
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0139_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0139
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0140 : Poly :=
[
  term ((1826555621901551436496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0140 : Poly :=
[
  term ((1826555621901551436496 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1826555621901551436496 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1826555621901551436496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-1826555621901551436496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0140_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0140
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0141 : Poly :=
[
  term ((-418859942263705600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 141 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0141 : Poly :=
[
  term ((-418859942263705600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-418859942263705600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((418859942263705600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 2), (16, 1)],
  term ((418859942263705600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0141_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0141
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0142 : Poly :=
[
  term ((-63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 142 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0142 : Poly :=
[
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0142_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0142
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0143 : Poly :=
[
  term ((-508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 143 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0143 : Poly :=
[
  term ((-508414149220311040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (14, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0143_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0143
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0144 : Poly :=
[
  term ((164474097750538240 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 144 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0144 : Poly :=
[
  term ((164474097750538240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((164474097750538240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((-164474097750538240 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((-164474097750538240 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0144_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0144
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0145 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0145 : Poly :=
[
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 2), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0145_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0145
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0146 : Poly :=
[
  term ((-41064381954394431556 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 146 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0146 : Poly :=
[
  term ((-41064381954394431556 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-41064381954394431556 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((41064381954394431556 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((41064381954394431556 : Rat) / 1347456623642648775) [(5, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0146_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0146
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0147 : Poly :=
[
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0147 : Poly :=
[
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0147_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0147
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0148 : Poly :=
[
  term ((-2866781276425471520 : Rat) / 53898264945705951) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 148 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0148 : Poly :=
[
  term ((-2866781276425471520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2866781276425471520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((2866781276425471520 : Rat) / 53898264945705951) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((2866781276425471520 : Rat) / 53898264945705951) [(5, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0148_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0148
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0149 : Poly :=
[
  term ((6262995214723956642 : Rat) / 149717402626960975) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 149 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0149 : Poly :=
[
  term ((6262995214723956642 : Rat) / 149717402626960975) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((6262995214723956642 : Rat) / 149717402626960975) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-6262995214723956642 : Rat) / 149717402626960975) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-6262995214723956642 : Rat) / 149717402626960975) [(5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0149_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0149
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0150 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 150 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0150 : Poly :=
[
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0150_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0150
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0151 : Poly :=
[
  term ((-411979024895034342 : Rat) / 29943480525392195) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 151 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0151 : Poly :=
[
  term ((-411979024895034342 : Rat) / 29943480525392195) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-411979024895034342 : Rat) / 29943480525392195) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((411979024895034342 : Rat) / 29943480525392195) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((411979024895034342 : Rat) / 29943480525392195) [(5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0151_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0151
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0152 : Poly :=
[
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0152 : Poly :=
[
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0152_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0152
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0153 : Poly :=
[
  term ((866931486815005713278 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0153 : Poly :=
[
  term ((866931486815005713278 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((866931486815005713278 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-866931486815005713278 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-866931486815005713278 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0153_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0153
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0154 : Poly :=
[
  term ((-27842100101650560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 154 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0154 : Poly :=
[
  term ((-27842100101650560 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((27842100101650560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((27842100101650560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0154_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0154
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0155 : Poly :=
[
  term ((143850850525194560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 155 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0155 : Poly :=
[
  term ((143850850525194560 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((143850850525194560 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-143850850525194560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-143850850525194560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0155_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0155
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0156 : Poly :=
[
  term ((-18561400067767040 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0156 : Poly :=
[
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0156_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0156
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0157 : Poly :=
[
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 157 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0157 : Poly :=
[
  term ((18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0157_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0157
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0158 : Poly :=
[
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (16, 1)]
]

/-- Partial product 158 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0158 : Poly :=
[
  term ((-632341872967488004 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (10, 2), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0158_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0158
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0159 : Poly :=
[
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 159 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0159 : Poly :=
[
  term ((-18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0159_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0159
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0160 : Poly :=
[
  term ((27842100101650560 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 160 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0160 : Poly :=
[
  term ((27842100101650560 : Rat) / 5988696105078439) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((27842100101650560 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0160_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0160
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0161 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 161 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0161 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0161_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0161
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0162 : Poly :=
[
  term ((-399070101456991360 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 162 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0162 : Poly :=
[
  term ((-399070101456991360 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-399070101456991360 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((399070101456991360 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((399070101456991360 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0162_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0162
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0163 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0163 : Poly :=
[
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(1, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0163_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0163
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0164 : Poly :=
[
  term ((1362194639045326784 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 164 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0164 : Poly :=
[
  term ((1362194639045326784 : Rat) / 17966088315235317) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1362194639045326784 : Rat) / 17966088315235317) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1362194639045326784 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1362194639045326784 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0164_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0164
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0165 : Poly :=
[
  term ((-29276133054362801024 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 165 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0165 : Poly :=
[
  term ((-29276133054362801024 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-29276133054362801024 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((29276133054362801024 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((29276133054362801024 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0165_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0165
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0166 : Poly :=
[
  term ((-52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 166 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0166 : Poly :=
[
  term ((-52737274368242928640 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-52737274368242928640 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0166_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0166
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0167 : Poly :=
[
  term ((-40526899738787840 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 167 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0167 : Poly :=
[
  term ((-40526899738787840 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-40526899738787840 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((40526899738787840 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((40526899738787840 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0167_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0167
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0168 : Poly :=
[
  term ((-76650229521926139368 : Rat) / 449152207880882925) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 168 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0168 : Poly :=
[
  term ((-76650229521926139368 : Rat) / 449152207880882925) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((-76650229521926139368 : Rat) / 449152207880882925) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((76650229521926139368 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((76650229521926139368 : Rat) / 449152207880882925) [(5, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0168_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0168
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0169 : Poly :=
[
  term ((-43264143068787200 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 169 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0169 : Poly :=
[
  term ((-43264143068787200 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-43264143068787200 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((43264143068787200 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (11, 3), (16, 1)],
  term ((43264143068787200 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0169_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0169
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0170 : Poly :=
[
  term ((2423893336513103488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 170 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0170 : Poly :=
[
  term ((2423893336513103488 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2423893336513103488 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2423893336513103488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-2423893336513103488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0170_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0170
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0171 : Poly :=
[
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0171 : Poly :=
[
  term ((-149393249891224064 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0171_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0171
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0172 : Poly :=
[
  term ((-43245114164134400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 172 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0172 : Poly :=
[
  term ((-43245114164134400 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0172_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0172
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0173 : Poly :=
[
  term ((-94567123768964416 : Rat) / 29943480525392195) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 173 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0173 : Poly :=
[
  term ((-94567123768964416 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-94567123768964416 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((94567123768964416 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((94567123768964416 : Rat) / 29943480525392195) [(5, 2), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0173_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0173
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0174 : Poly :=
[
  term ((-412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 174 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0174 : Poly :=
[
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0174_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0174
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0175 : Poly :=
[
  term ((476863184264375744 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 175 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0175 : Poly :=
[
  term ((476863184264375744 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((476863184264375744 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-476863184264375744 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-476863184264375744 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0175_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0175
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0176 : Poly :=
[
  term ((-55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0176 : Poly :=
[
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0176_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0176
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0177 : Poly :=
[
  term ((80268603053427788456 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0177 : Poly :=
[
  term ((80268603053427788456 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((80268603053427788456 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-80268603053427788456 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-80268603053427788456 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0177_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0177
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0178 : Poly :=
[
  term ((-8127906208509370688 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 178 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0178 : Poly :=
[
  term ((-8127906208509370688 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-8127906208509370688 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((8127906208509370688 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((8127906208509370688 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0178_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0178
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0179 : Poly :=
[
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0179 : Poly :=
[
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0179_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0179
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0180 : Poly :=
[
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 180 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0180 : Poly :=
[
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (14, 1), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0180_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0180
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0181 : Poly :=
[
  term ((1372199580197246912 : Rat) / 17966088315235317) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 181 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0181 : Poly :=
[
  term ((1372199580197246912 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((1372199580197246912 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-1372199580197246912 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-1372199580197246912 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0181_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0181
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0182 : Poly :=
[
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0182 : Poly :=
[
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 2), (15, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0182_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0182
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0183 : Poly :=
[
  term ((39074578135108563752 : Rat) / 449152207880882925) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 183 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0183 : Poly :=
[
  term ((39074578135108563752 : Rat) / 449152207880882925) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((39074578135108563752 : Rat) / 449152207880882925) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-39074578135108563752 : Rat) / 449152207880882925) [(5, 2), (10, 1), (11, 2), (16, 1)],
  term ((-39074578135108563752 : Rat) / 449152207880882925) [(5, 2), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0183_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0183
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0184 : Poly :=
[
  term ((28410267567304724026 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 184 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0184 : Poly :=
[
  term ((28410267567304724026 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (14, 1), (16, 1)],
  term ((28410267567304724026 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (14, 1), (16, 1)],
  term ((-28410267567304724026 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (14, 1), (16, 1)],
  term ((-28410267567304724026 : Rat) / 1347456623642648775) [(5, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0184_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0184
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0185 : Poly :=
[
  term ((20721435171929135191 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

/-- Partial product 185 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0185 : Poly :=
[
  term ((20721435171929135191 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (16, 1)],
  term ((20721435171929135191 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (16, 1)],
  term ((-20721435171929135191 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (16, 1)],
  term ((-20721435171929135191 : Rat) / 1347456623642648775) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0185_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0185
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0186 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 186 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0186 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(0, 2), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 2), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0186_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0186
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0187 : Poly :=
[
  term ((-529884604177581312 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 187 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0187 : Poly :=
[
  term ((-529884604177581312 : Rat) / 29943480525392195) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-529884604177581312 : Rat) / 29943480525392195) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((529884604177581312 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((529884604177581312 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0187_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0187
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0188 : Poly :=
[
  term ((14308688411492870912 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 188 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0188 : Poly :=
[
  term ((14308688411492870912 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((14308688411492870912 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-14308688411492870912 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-14308688411492870912 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0188_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0188
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0189 : Poly :=
[
  term ((798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 189 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0189 : Poly :=
[
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(1, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0189_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0189
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0190 : Poly :=
[
  term ((-5627621345639711968 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 190 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0190 : Poly :=
[
  term ((-5627621345639711968 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((-5627621345639711968 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((5627621345639711968 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 2), (16, 1)],
  term ((5627621345639711968 : Rat) / 269491324728529755) [(5, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0190_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0190
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0191 : Poly :=
[
  term ((2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0191 : Poly :=
[
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0191_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0191
        rs_R010_ueqv_R010YNN_generator_02_0100_0191 =
      rs_R010_ueqv_R010YNN_partial_02_0191 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_02_0100_0191 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_02_0100,
  rs_R010_ueqv_R010YNN_partial_02_0101,
  rs_R010_ueqv_R010YNN_partial_02_0102,
  rs_R010_ueqv_R010YNN_partial_02_0103,
  rs_R010_ueqv_R010YNN_partial_02_0104,
  rs_R010_ueqv_R010YNN_partial_02_0105,
  rs_R010_ueqv_R010YNN_partial_02_0106,
  rs_R010_ueqv_R010YNN_partial_02_0107,
  rs_R010_ueqv_R010YNN_partial_02_0108,
  rs_R010_ueqv_R010YNN_partial_02_0109,
  rs_R010_ueqv_R010YNN_partial_02_0110,
  rs_R010_ueqv_R010YNN_partial_02_0111,
  rs_R010_ueqv_R010YNN_partial_02_0112,
  rs_R010_ueqv_R010YNN_partial_02_0113,
  rs_R010_ueqv_R010YNN_partial_02_0114,
  rs_R010_ueqv_R010YNN_partial_02_0115,
  rs_R010_ueqv_R010YNN_partial_02_0116,
  rs_R010_ueqv_R010YNN_partial_02_0117,
  rs_R010_ueqv_R010YNN_partial_02_0118,
  rs_R010_ueqv_R010YNN_partial_02_0119,
  rs_R010_ueqv_R010YNN_partial_02_0120,
  rs_R010_ueqv_R010YNN_partial_02_0121,
  rs_R010_ueqv_R010YNN_partial_02_0122,
  rs_R010_ueqv_R010YNN_partial_02_0123,
  rs_R010_ueqv_R010YNN_partial_02_0124,
  rs_R010_ueqv_R010YNN_partial_02_0125,
  rs_R010_ueqv_R010YNN_partial_02_0126,
  rs_R010_ueqv_R010YNN_partial_02_0127,
  rs_R010_ueqv_R010YNN_partial_02_0128,
  rs_R010_ueqv_R010YNN_partial_02_0129,
  rs_R010_ueqv_R010YNN_partial_02_0130,
  rs_R010_ueqv_R010YNN_partial_02_0131,
  rs_R010_ueqv_R010YNN_partial_02_0132,
  rs_R010_ueqv_R010YNN_partial_02_0133,
  rs_R010_ueqv_R010YNN_partial_02_0134,
  rs_R010_ueqv_R010YNN_partial_02_0135,
  rs_R010_ueqv_R010YNN_partial_02_0136,
  rs_R010_ueqv_R010YNN_partial_02_0137,
  rs_R010_ueqv_R010YNN_partial_02_0138,
  rs_R010_ueqv_R010YNN_partial_02_0139,
  rs_R010_ueqv_R010YNN_partial_02_0140,
  rs_R010_ueqv_R010YNN_partial_02_0141,
  rs_R010_ueqv_R010YNN_partial_02_0142,
  rs_R010_ueqv_R010YNN_partial_02_0143,
  rs_R010_ueqv_R010YNN_partial_02_0144,
  rs_R010_ueqv_R010YNN_partial_02_0145,
  rs_R010_ueqv_R010YNN_partial_02_0146,
  rs_R010_ueqv_R010YNN_partial_02_0147,
  rs_R010_ueqv_R010YNN_partial_02_0148,
  rs_R010_ueqv_R010YNN_partial_02_0149,
  rs_R010_ueqv_R010YNN_partial_02_0150,
  rs_R010_ueqv_R010YNN_partial_02_0151,
  rs_R010_ueqv_R010YNN_partial_02_0152,
  rs_R010_ueqv_R010YNN_partial_02_0153,
  rs_R010_ueqv_R010YNN_partial_02_0154,
  rs_R010_ueqv_R010YNN_partial_02_0155,
  rs_R010_ueqv_R010YNN_partial_02_0156,
  rs_R010_ueqv_R010YNN_partial_02_0157,
  rs_R010_ueqv_R010YNN_partial_02_0158,
  rs_R010_ueqv_R010YNN_partial_02_0159,
  rs_R010_ueqv_R010YNN_partial_02_0160,
  rs_R010_ueqv_R010YNN_partial_02_0161,
  rs_R010_ueqv_R010YNN_partial_02_0162,
  rs_R010_ueqv_R010YNN_partial_02_0163,
  rs_R010_ueqv_R010YNN_partial_02_0164,
  rs_R010_ueqv_R010YNN_partial_02_0165,
  rs_R010_ueqv_R010YNN_partial_02_0166,
  rs_R010_ueqv_R010YNN_partial_02_0167,
  rs_R010_ueqv_R010YNN_partial_02_0168,
  rs_R010_ueqv_R010YNN_partial_02_0169,
  rs_R010_ueqv_R010YNN_partial_02_0170,
  rs_R010_ueqv_R010YNN_partial_02_0171,
  rs_R010_ueqv_R010YNN_partial_02_0172,
  rs_R010_ueqv_R010YNN_partial_02_0173,
  rs_R010_ueqv_R010YNN_partial_02_0174,
  rs_R010_ueqv_R010YNN_partial_02_0175,
  rs_R010_ueqv_R010YNN_partial_02_0176,
  rs_R010_ueqv_R010YNN_partial_02_0177,
  rs_R010_ueqv_R010YNN_partial_02_0178,
  rs_R010_ueqv_R010YNN_partial_02_0179,
  rs_R010_ueqv_R010YNN_partial_02_0180,
  rs_R010_ueqv_R010YNN_partial_02_0181,
  rs_R010_ueqv_R010YNN_partial_02_0182,
  rs_R010_ueqv_R010YNN_partial_02_0183,
  rs_R010_ueqv_R010YNN_partial_02_0184,
  rs_R010_ueqv_R010YNN_partial_02_0185,
  rs_R010_ueqv_R010YNN_partial_02_0186,
  rs_R010_ueqv_R010YNN_partial_02_0187,
  rs_R010_ueqv_R010YNN_partial_02_0188,
  rs_R010_ueqv_R010YNN_partial_02_0189,
  rs_R010_ueqv_R010YNN_partial_02_0190,
  rs_R010_ueqv_R010YNN_partial_02_0191
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_02_0100_0191 : Poly :=
[
  term ((-226286722403123200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-265743411665469692 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-369935424697479436 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((232947465497600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3898112014609433600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5551222871488000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((541945419433531520 : Rat) / 161694794837117853) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-71765579684270080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((286342149088808960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-8027921526690114560 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((71329181350697365778 : Rat) / 808473974185589265) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((16328215527985529932 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-92618615359293776704 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((128209750962227200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((138162939205668160 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-251223568242557301046 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4867122002982400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2877132866877473120 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51049872265548800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((32792565959231680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((927975564792982720 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((12888735422905340594 : Rat) / 808473974185589265) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((8993222828531200 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-40675381968560640 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((38012892672482560 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((95753029263754240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1826555621901551436496 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-418859942263705600 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((164474097750538240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-41064381954394431556 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2866781276425471520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((6262995214723956642 : Rat) / 149717402626960975) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-411979024895034342 : Rat) / 29943480525392195) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((866931486815005713278 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((143850850525194560 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(0, 2), (5, 2), (6, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((27842100101650560 : Rat) / 5988696105078439) [(0, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-399070101456991360 : Rat) / 53898264945705951) [(0, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(0, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1362194639045326784 : Rat) / 17966088315235317) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-29276133054362801024 : Rat) / 269491324728529755) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-52737274368242928640 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-40526899738787840 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-76650229521926139368 : Rat) / 449152207880882925) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((-43264143068787200 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2423893336513103488 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-94567123768964416 : Rat) / 29943480525392195) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((476863184264375744 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((80268603053427788456 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8127906208509370688 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((1372199580197246912 : Rat) / 17966088315235317) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((39074578135108563752 : Rat) / 449152207880882925) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((28410267567304724026 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (14, 1), (16, 1)],
  term ((20721435171929135191 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(0, 2), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-529884604177581312 : Rat) / 29943480525392195) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((14308688411492870912 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(0, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-5627621345639711968 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-265743411665469692 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-369935424697479436 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((232947465497600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3898112014609433600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5551222871488000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((541945419433531520 : Rat) / 161694794837117853) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-71765579684270080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((286342149088808960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-8027921526690114560 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((71329181350697365778 : Rat) / 808473974185589265) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((16328215527985529932 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-92618615359293776704 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((128209750962227200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((138162939205668160 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-251223568242557301046 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((4351667738521600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4867122002982400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1612092780390400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2877132866877473120 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51049872265548800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((32792565959231680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-516891906287477420264 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((927975564792982720 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((12888735422905340594 : Rat) / 808473974185589265) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((8993222828531200 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-40675381968560640 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((640843183909698560 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((153889062020556800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((38012892672482560 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((95753029263754240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-3562539845652480 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1826555621901551436496 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-418859942263705600 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (10, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-508414149220311040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((164474097750538240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 4), (15, 1), (16, 1)],
  term ((-41064381954394431556 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((11644083773161700368 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2866781276425471520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((6262995214723956642 : Rat) / 149717402626960975) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-411979024895034342 : Rat) / 29943480525392195) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((19107738859691087576 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((866931486815005713278 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((143850850525194560 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(1, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(1, 2), (5, 2), (6, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((27842100101650560 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-399070101456991360 : Rat) / 53898264945705951) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(1, 2), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((1362194639045326784 : Rat) / 17966088315235317) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-29276133054362801024 : Rat) / 269491324728529755) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-52737274368242928640 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-40526899738787840 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-76650229521926139368 : Rat) / 449152207880882925) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((-43264143068787200 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2423893336513103488 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-94567123768964416 : Rat) / 29943480525392195) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((476863184264375744 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-55129092911554816 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((80268603053427788456 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8127906208509370688 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7190090068238555392 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((1372199580197246912 : Rat) / 17966088315235317) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 3), (15, 1), (16, 1)],
  term ((39074578135108563752 : Rat) / 449152207880882925) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((28410267567304724026 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (14, 1), (16, 1)],
  term ((20721435171929135191 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(1, 2), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-529884604177581312 : Rat) / 29943480525392195) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((14308688411492870912 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((798565206934225984 : Rat) / 89830441576176585) [(1, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-5627621345639711968 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (5, 3), (9, 2), (15, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 2), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 2), (15, 1), (16, 1)],
  term ((265743411665469692 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (11, 2), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (14, 1), (16, 1)],
  term ((369935424697479436 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 2), (16, 1)],
  term ((265743411665469692 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 3), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(5, 1), (7, 1), (11, 2), (14, 1), (16, 1)],
  term ((369935424697479436 : Rat) / 53898264945705951) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-232947465497600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((3898112014609433600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5551222871488000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-541945419433531520 : Rat) / 161694794837117853) [(5, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 3), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-541945419433531520 : Rat) / 161694794837117853) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-232947465497600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((3898112014609433600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-5551222871488000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 4), (16, 1)],
  term ((71765579684270080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-286342149088808960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((8027921526690114560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-286342149088808960 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((8027921526690114560 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((71765579684270080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 3), (16, 1)],
  term ((-71329181350697365778 : Rat) / 808473974185589265) [(5, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-16328215527985529932 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 2), (13, 1), (16, 1)],
  term ((92618615359293776704 : Rat) / 53898264945705951) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-16328215527985529932 : Rat) / 149717402626960975) [(5, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((92618615359293776704 : Rat) / 53898264945705951) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-71329181350697365778 : Rat) / 808473974185589265) [(5, 1), (8, 1), (11, 3), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((251223568242557301046 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-128209750962227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 3), (13, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4867122002982400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2877132866877473120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((37994869049984000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((516891906287477420264 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((-927975564792982720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-12888735422905340594 : Rat) / 808473974185589265) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-128209750962227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 3), (11, 1), (13, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 3), (11, 1), (15, 1), (16, 1)],
  term ((-138162939205668160 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 3), (15, 2), (16, 1)],
  term ((251223568242557301046 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 3), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 4), (16, 1)],
  term ((-32792565959231680 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((516891906287477420264 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-927975564792982720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-12888735422905340594 : Rat) / 808473974185589265) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((4867122002982400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2877132866877473120 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((51049872265548800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 4), (16, 1)],
  term ((40675381968560640 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8993222828531200 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 1), (11, 3), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-38012892672482560 : Rat) / 17966088315235317) [(5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-95753029263754240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1826555621901551436496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-8993222828531200 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 3), (11, 1), (16, 1)],
  term ((40675381968560640 : Rat) / 5988696105078439) [(5, 1), (9, 2), (10, 3), (13, 1), (16, 1)],
  term ((-640843183909698560 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 3), (15, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-95753029263754240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((3562539845652480 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1826555621901551436496 : Rat) / 1347456623642648775) [(5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 3), (14, 1), (16, 1)],
  term ((-38012892672482560 : Rat) / 17966088315235317) [(5, 1), (9, 2), (11, 3), (16, 1)],
  term ((418859942263705600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 1), (11, 2), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (14, 1), (16, 1)],
  term ((-164474097750538240 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 2), (16, 1)],
  term ((418859942263705600 : Rat) / 53898264945705951) [(5, 1), (9, 3), (10, 3), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (14, 1), (16, 1)],
  term ((-164474097750538240 : Rat) / 53898264945705951) [(5, 1), (9, 3), (11, 2), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(5, 1), (9, 3), (11, 3), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (10, 2), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(5, 1), (9, 4), (11, 2), (15, 1), (16, 1)],
  term ((41064381954394431556 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((2866781276425471520 : Rat) / 53898264945705951) [(5, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-6262995214723956642 : Rat) / 149717402626960975) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((411979024895034342 : Rat) / 29943480525392195) [(5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-866931486815005713278 : Rat) / 1347456623642648775) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((41064381954394431556 : Rat) / 1347456623642648775) [(5, 1), (10, 3), (13, 1), (16, 1)],
  term ((-11644083773161700368 : Rat) / 1347456623642648775) [(5, 1), (10, 3), (15, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((411979024895034342 : Rat) / 29943480525392195) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-19107738859691087576 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-866931486815005713278 : Rat) / 1347456623642648775) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((2866781276425471520 : Rat) / 53898264945705951) [(5, 1), (11, 3), (14, 1), (16, 1)],
  term ((-6262995214723956642 : Rat) / 149717402626960975) [(5, 1), (11, 3), (16, 1)],
  term ((27842100101650560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-143850850525194560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-143850850525194560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((27842100101650560 : Rat) / 5988696105078439) [(5, 2), (6, 1), (9, 1), (11, 3), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (10, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 2), (11, 2), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (10, 2), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 1), (11, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((399070101456991360 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-27842100101650560 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 1), (10, 3), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((399070101456991360 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-1362194639045326784 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((29276133054362801024 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((29276133054362801024 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((52737274368242928640 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1362194639045326784 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 3), (16, 1)],
  term ((40526899738787840 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((40526899738787840 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((76650229521926139368 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 2), (16, 1)],
  term ((76650229521926139368 : Rat) / 449152207880882925) [(5, 2), (8, 1), (11, 2), (16, 1)],
  term ((-2423893336513103488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((43264143068787200 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (11, 3), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((94567123768964416 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((-476863184264375744 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-80268603053427788456 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((43264143068787200 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 3), (11, 1), (16, 1)],
  term ((-2423893336513103488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 3), (13, 1), (16, 1)],
  term ((149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-476863184264375744 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((55129092911554816 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-80268603053427788456 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 3), (14, 1), (16, 1)],
  term ((94567123768964416 : Rat) / 29943480525392195) [(5, 2), (9, 1), (11, 3), (16, 1)],
  term ((8127906208509370688 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (14, 1), (16, 1)],
  term ((-1372199580197246912 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 2), (16, 1)],
  term ((8127906208509370688 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 3), (16, 1)],
  term ((7190090068238555392 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-1372199580197246912 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 3), (15, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 2), (15, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 2), (15, 1), (16, 1)],
  term ((-39074578135108563752 : Rat) / 449152207880882925) [(5, 2), (10, 1), (11, 2), (16, 1)],
  term ((-28410267567304724026 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (14, 1), (16, 1)],
  term ((-20721435171929135191 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (16, 1)],
  term ((-39074578135108563752 : Rat) / 449152207880882925) [(5, 2), (10, 3), (16, 1)],
  term ((-28410267567304724026 : Rat) / 1347456623642648775) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((-20721435171929135191 : Rat) / 1347456623642648775) [(5, 2), (11, 2), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((529884604177581312 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((529884604177581312 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-14308688411492870912 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((5627621345639711968 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 2), (16, 1)],
  term ((-14308688411492870912 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 3), (16, 1)],
  term ((-798565206934225984 : Rat) / 89830441576176585) [(5, 3), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((5627621345639711968 : Rat) / 269491324728529755) [(5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(5, 3), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 100 through 191. -/
theorem rs_R010_ueqv_R010YNN_block_02_0100_0191_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_02_0100_0191
      rs_R010_ueqv_R010YNN_block_02_0100_0191 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
