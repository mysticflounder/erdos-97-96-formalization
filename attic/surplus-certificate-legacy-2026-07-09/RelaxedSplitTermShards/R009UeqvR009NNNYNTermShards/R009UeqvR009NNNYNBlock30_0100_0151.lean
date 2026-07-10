/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 30:100-151

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0100 : Poly :=
[
  term ((106124620 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 100 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0100 : Poly :=
[
  term ((212249240 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-106124620 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((106124620 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)],
  term ((-212249240 : Rat) / 12247399) [(7, 1), (13, 1), (14, 2)],
  term ((212249240 : Rat) / 12247399) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-106124620 : Rat) / 12247399) [(7, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0100
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0101 : Poly :=
[
  term ((-6124906640 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 101 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0101 : Poly :=
[
  term ((-12249813280 : Rat) / 330679773) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((6124906640 : Rat) / 330679773) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-12249813280 : Rat) / 330679773) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((6124906640 : Rat) / 330679773) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-6124906640 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)],
  term ((12249813280 : Rat) / 330679773) [(7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0101
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0102 : Poly :=
[
  term ((1576739263 : Rat) / 110226591) [(7, 1), (15, 1)]
]

/-- Partial product 102 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0102 : Poly :=
[
  term ((3153478526 : Rat) / 110226591) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1576739263 : Rat) / 110226591) [(7, 1), (12, 2), (15, 1)],
  term ((3153478526 : Rat) / 110226591) [(7, 1), (13, 1), (15, 2)],
  term ((-1576739263 : Rat) / 110226591) [(7, 1), (13, 2), (15, 1)],
  term ((-3153478526 : Rat) / 110226591) [(7, 1), (14, 1), (15, 1)],
  term ((1576739263 : Rat) / 110226591) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0102
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0103 : Poly :=
[
  term ((-747564201664 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 103 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0103 : Poly :=
[
  term ((-747564201664 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1)],
  term ((-1495128403328 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((747564201664 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-1495128403328 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((747564201664 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((1495128403328 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0103
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0104 : Poly :=
[
  term ((-11680690651 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 104 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0104 : Poly :=
[
  term ((-23361381302 : Rat) / 698101743) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((11680690651 : Rat) / 698101743) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-11680690651 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1)],
  term ((23361381302 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-23361381302 : Rat) / 698101743) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((11680690651 : Rat) / 698101743) [(9, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0104
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0105 : Poly :=
[
  term ((674142717572 : Rat) / 18848747061) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 105 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0105 : Poly :=
[
  term ((1348285435144 : Rat) / 18848747061) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-674142717572 : Rat) / 18848747061) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((1348285435144 : Rat) / 18848747061) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-674142717572 : Rat) / 18848747061) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-1348285435144 : Rat) / 18848747061) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((674142717572 : Rat) / 18848747061) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0105
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0106 : Poly :=
[
  term ((-40882128086 : Rat) / 1778183685) [(9, 1), (11, 1)]
]

/-- Partial product 106 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0106 : Poly :=
[
  term ((-40882128086 : Rat) / 1778183685) [(9, 1), (11, 1)],
  term ((-81764256172 : Rat) / 1778183685) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((40882128086 : Rat) / 1778183685) [(9, 1), (11, 1), (12, 2)],
  term ((-81764256172 : Rat) / 1778183685) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((40882128086 : Rat) / 1778183685) [(9, 1), (11, 1), (13, 2)],
  term ((81764256172 : Rat) / 1778183685) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0106
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0107 : Poly :=
[
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 107 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0107 : Poly :=
[
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1)],
  term ((10093723136 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-10093723136 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((10093723136 : Rat) / 110226591) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0107
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0108 : Poly :=
[
  term ((-5178880 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 108 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0108 : Poly :=
[
  term ((-10357760 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5178880 : Rat) / 110226591) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((10357760 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5178880 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10357760 : Rat) / 110226591) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((5178880 : Rat) / 110226591) [(9, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0108
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0109 : Poly :=
[
  term ((-11479801088 : Rat) / 330679773) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 109 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0109 : Poly :=
[
  term ((-22959602176 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((11479801088 : Rat) / 330679773) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-22959602176 : Rat) / 330679773) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((11479801088 : Rat) / 330679773) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-11479801088 : Rat) / 330679773) [(9, 1), (11, 1), (14, 1)],
  term ((22959602176 : Rat) / 330679773) [(9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0109
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0110 : Poly :=
[
  term ((42997760 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 110 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0110 : Poly :=
[
  term ((85995520 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-42997760 : Rat) / 110226591) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((85995520 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((-42997760 : Rat) / 110226591) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-85995520 : Rat) / 110226591) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((42997760 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0110
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0111 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 111 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0111 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0111
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0112 : Poly :=
[
  term ((236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 112 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0112 : Poly :=
[
  term ((236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)],
  term ((-473143272 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((473143272 : Rat) / 12247399) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 3)],
  term ((473143272 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-236571636 : Rat) / 12247399) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0112
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0113 : Poly :=
[
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 113 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0113 : Poly :=
[
  term ((-9102375328 : Rat) / 110226591) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((9102375328 : Rat) / 110226591) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (15, 1)],
  term ((-9102375328 : Rat) / 110226591) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((4551187664 : Rat) / 110226591) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0113
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0114 : Poly :=
[
  term ((-804821773 : Rat) / 131717310) [(9, 1), (13, 1)]
]

/-- Partial product 114 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0114 : Poly :=
[
  term ((-804821773 : Rat) / 65858655) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((804821773 : Rat) / 131717310) [(9, 1), (12, 2), (13, 1)],
  term ((-804821773 : Rat) / 131717310) [(9, 1), (13, 1)],
  term ((804821773 : Rat) / 65858655) [(9, 1), (13, 1), (14, 1)],
  term ((-804821773 : Rat) / 65858655) [(9, 1), (13, 2), (15, 1)],
  term ((804821773 : Rat) / 131717310) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0114
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0115 : Poly :=
[
  term ((-179371892 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 115 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0115 : Poly :=
[
  term ((-358743784 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((179371892 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-179371892 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1)],
  term ((358743784 : Rat) / 12247399) [(9, 1), (13, 1), (14, 2)],
  term ((-358743784 : Rat) / 12247399) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((179371892 : Rat) / 12247399) [(9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0115
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0116 : Poly :=
[
  term ((-21694720 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 116 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0116 : Poly :=
[
  term ((-43389440 : Rat) / 110226591) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((21694720 : Rat) / 110226591) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((43389440 : Rat) / 110226591) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-21694720 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)],
  term ((-43389440 : Rat) / 110226591) [(9, 1), (13, 2), (15, 3)],
  term ((21694720 : Rat) / 110226591) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0116
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0117 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 117 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0117 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(9, 1), (13, 3), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0117
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0118 : Poly :=
[
  term ((10707677992 : Rat) / 330679773) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 118 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0118 : Poly :=
[
  term ((21415355984 : Rat) / 330679773) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-10707677992 : Rat) / 330679773) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((21415355984 : Rat) / 330679773) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-10707677992 : Rat) / 330679773) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((10707677992 : Rat) / 330679773) [(9, 1), (14, 1), (15, 1)],
  term ((-21415355984 : Rat) / 330679773) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0118
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0119 : Poly :=
[
  term ((25348061278 : Rat) / 1778183685) [(9, 1), (15, 1)]
]

/-- Partial product 119 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0119 : Poly :=
[
  term ((50696122556 : Rat) / 1778183685) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25348061278 : Rat) / 1778183685) [(9, 1), (12, 2), (15, 1)],
  term ((50696122556 : Rat) / 1778183685) [(9, 1), (13, 1), (15, 2)],
  term ((-25348061278 : Rat) / 1778183685) [(9, 1), (13, 2), (15, 1)],
  term ((-50696122556 : Rat) / 1778183685) [(9, 1), (14, 1), (15, 1)],
  term ((25348061278 : Rat) / 1778183685) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0119
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0120 : Poly :=
[
  term ((8791040 : Rat) / 110226591) [(9, 1), (15, 3)]
]

/-- Partial product 120 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0120 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(9, 1), (12, 2), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(9, 1), (13, 1), (15, 4)],
  term ((-8791040 : Rat) / 110226591) [(9, 1), (13, 2), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (14, 1), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0120_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0120
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0121 : Poly :=
[
  term ((366 : Rat) / 67) [(9, 2)]
]

/-- Partial product 121 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0121 : Poly :=
[
  term ((366 : Rat) / 67) [(9, 2)],
  term ((732 : Rat) / 67) [(9, 2), (12, 1), (14, 1)],
  term ((-366 : Rat) / 67) [(9, 2), (12, 2)],
  term ((732 : Rat) / 67) [(9, 2), (13, 1), (15, 1)],
  term ((-366 : Rat) / 67) [(9, 2), (13, 2)],
  term ((-732 : Rat) / 67) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0121_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0121
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0122 : Poly :=
[
  term ((-120 : Rat) / 67) [(10, 1)]
]

/-- Partial product 122 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0122 : Poly :=
[
  term ((-120 : Rat) / 67) [(10, 1)],
  term ((-240 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((120 : Rat) / 67) [(10, 1), (12, 2)],
  term ((-240 : Rat) / 67) [(10, 1), (13, 1), (15, 1)],
  term ((120 : Rat) / 67) [(10, 1), (13, 2)],
  term ((240 : Rat) / 67) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0122_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0122
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0123 : Poly :=
[
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 123 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0123 : Poly :=
[
  term ((113004316796 : Rat) / 3490508715) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((113004316796 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0123_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0123
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0124 : Poly :=
[
  term ((-3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 124 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0124 : Poly :=
[
  term ((-6488623624912 : Rat) / 94243735305) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-6488623624912 : Rat) / 94243735305) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((6488623624912 : Rat) / 94243735305) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0124_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0124
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0125 : Poly :=
[
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2)]
]

/-- Partial product 125 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0125 : Poly :=
[
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2)],
  term ((7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (12, 2)],
  term ((7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (13, 2)],
  term ((-7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0125_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0125
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0126 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 126 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0126 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(10, 1), (13, 2), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0126_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0126
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0127 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(10, 1), (15, 2)]
]

/-- Partial product 127 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0127 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((17582080 : Rat) / 110226591) [(10, 1), (12, 2), (15, 2)],
  term ((-35164160 : Rat) / 110226591) [(10, 1), (13, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(10, 1), (13, 2), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0127_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0127
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0128 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 128 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0128 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 3)],
  term ((3655680 : Rat) / 12247399) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0128_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0128
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0129 : Poly :=
[
  term ((28979200 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 129 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0129 : Poly :=
[
  term ((57958400 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-28979200 : Rat) / 330679773) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-57958400 : Rat) / 330679773) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((28979200 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)],
  term ((57958400 : Rat) / 330679773) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-28979200 : Rat) / 330679773) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0129_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0129
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0130 : Poly :=
[
  term ((-3806923673 : Rat) / 1185455790) [(11, 1), (13, 1)]
]

/-- Partial product 130 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0130 : Poly :=
[
  term ((-3806923673 : Rat) / 592727895) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((3806923673 : Rat) / 1185455790) [(11, 1), (12, 2), (13, 1)],
  term ((-3806923673 : Rat) / 1185455790) [(11, 1), (13, 1)],
  term ((3806923673 : Rat) / 592727895) [(11, 1), (13, 1), (14, 1)],
  term ((-3806923673 : Rat) / 592727895) [(11, 1), (13, 2), (15, 1)],
  term ((3806923673 : Rat) / 1185455790) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0130_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0130
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0131 : Poly :=
[
  term ((-257850880 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 131 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0131 : Poly :=
[
  term ((-515701760 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((257850880 : Rat) / 330679773) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-257850880 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)],
  term ((515701760 : Rat) / 330679773) [(11, 1), (13, 1), (14, 2)],
  term ((-515701760 : Rat) / 330679773) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((257850880 : Rat) / 330679773) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0131_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0131
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0132 : Poly :=
[
  term ((-2981120 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 132 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0132 : Poly :=
[
  term ((-5962240 : Rat) / 110226591) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2981120 : Rat) / 110226591) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((5962240 : Rat) / 110226591) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2981120 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)],
  term ((-5962240 : Rat) / 110226591) [(11, 1), (13, 2), (15, 3)],
  term ((2981120 : Rat) / 110226591) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0132_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0132
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0133 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 133 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0133 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(11, 1), (12, 2), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(11, 1), (13, 3), (15, 2)],
  term ((913920 : Rat) / 12247399) [(11, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0133_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0133
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0134 : Poly :=
[
  term ((195143680 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 134 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0134 : Poly :=
[
  term ((390287360 : Rat) / 110226591) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-195143680 : Rat) / 110226591) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((390287360 : Rat) / 110226591) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-195143680 : Rat) / 110226591) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((195143680 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)],
  term ((-390287360 : Rat) / 110226591) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0134_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0134
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0135 : Poly :=
[
  term ((525207639256 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

/-- Partial product 135 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0135 : Poly :=
[
  term ((1050415278512 : Rat) / 94243735305) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-525207639256 : Rat) / 94243735305) [(11, 1), (12, 2), (15, 1)],
  term ((1050415278512 : Rat) / 94243735305) [(11, 1), (13, 1), (15, 2)],
  term ((-525207639256 : Rat) / 94243735305) [(11, 1), (13, 2), (15, 1)],
  term ((-1050415278512 : Rat) / 94243735305) [(11, 1), (14, 1), (15, 1)],
  term ((525207639256 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0135_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0135
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0136 : Poly :=
[
  term ((43955200 : Rat) / 110226591) [(11, 1), (15, 3)]
]

/-- Partial product 136 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0136 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-43955200 : Rat) / 110226591) [(11, 1), (12, 2), (15, 3)],
  term ((87910400 : Rat) / 110226591) [(11, 1), (13, 1), (15, 4)],
  term ((-43955200 : Rat) / 110226591) [(11, 1), (13, 2), (15, 3)],
  term ((-87910400 : Rat) / 110226591) [(11, 1), (14, 1), (15, 3)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0136_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0136
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0137 : Poly :=
[
  term ((-1270985446712 : Rat) / 94243735305) [(11, 2)]
]

/-- Partial product 137 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0137 : Poly :=
[
  term ((-1270985446712 : Rat) / 94243735305) [(11, 2)],
  term ((-2541970893424 : Rat) / 94243735305) [(11, 2), (12, 1), (14, 1)],
  term ((1270985446712 : Rat) / 94243735305) [(11, 2), (12, 2)],
  term ((-2541970893424 : Rat) / 94243735305) [(11, 2), (13, 1), (15, 1)],
  term ((1270985446712 : Rat) / 94243735305) [(11, 2), (13, 2)],
  term ((2541970893424 : Rat) / 94243735305) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0137_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0137
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0138 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 138 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0138 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1)],
  term ((77987840 : Rat) / 110226591) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(11, 2), (12, 1), (13, 2)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)],
  term ((77987840 : Rat) / 110226591) [(11, 2), (12, 2), (14, 1)],
  term ((-38993920 : Rat) / 110226591) [(11, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0138_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0138
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0139 : Poly :=
[
  term ((62755840 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 139 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0139 : Poly :=
[
  term ((125511680 : Rat) / 110226591) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-62755840 : Rat) / 110226591) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-125511680 : Rat) / 110226591) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((62755840 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)],
  term ((125511680 : Rat) / 110226591) [(11, 2), (13, 2), (15, 2)],
  term ((-62755840 : Rat) / 110226591) [(11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0139_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0139
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0140 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(11, 2), (14, 1)]
]

/-- Partial product 140 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0140 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(11, 2), (12, 1), (14, 2)],
  term ((97484800 : Rat) / 110226591) [(11, 2), (12, 2), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(11, 2), (13, 2), (14, 1)],
  term ((-97484800 : Rat) / 110226591) [(11, 2), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0140_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0140
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0141 : Poly :=
[
  term ((-74854400 : Rat) / 36742197) [(11, 2), (15, 2)]
]

/-- Partial product 141 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0141 : Poly :=
[
  term ((-149708800 : Rat) / 36742197) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((74854400 : Rat) / 36742197) [(11, 2), (12, 2), (15, 2)],
  term ((-149708800 : Rat) / 36742197) [(11, 2), (13, 1), (15, 3)],
  term ((74854400 : Rat) / 36742197) [(11, 2), (13, 2), (15, 2)],
  term ((149708800 : Rat) / 36742197) [(11, 2), (14, 1), (15, 2)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0141_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0141
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0142 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(11, 3), (15, 1)]
]

/-- Partial product 142 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0142 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(11, 3), (12, 2), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(11, 3), (13, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(11, 3), (13, 2), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(11, 3), (14, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0142_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0142
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0143 : Poly :=
[
  term ((31360 : Rat) / 182797) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 143 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0143 : Poly :=
[
  term ((-62720 : Rat) / 182797) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((31360 : Rat) / 182797) [(12, 1), (13, 1), (15, 1)],
  term ((62720 : Rat) / 182797) [(12, 1), (13, 2), (15, 2)],
  term ((-31360 : Rat) / 182797) [(12, 1), (13, 3), (15, 1)],
  term ((62720 : Rat) / 182797) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-31360 : Rat) / 182797) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0143_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0143
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0144 : Poly :=
[
  term ((-1809920 : Rat) / 4935519) [(12, 1), (15, 2)]
]

/-- Partial product 144 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0144 : Poly :=
[
  term ((-3619840 : Rat) / 4935519) [(12, 1), (13, 1), (15, 3)],
  term ((1809920 : Rat) / 4935519) [(12, 1), (13, 2), (15, 2)],
  term ((3619840 : Rat) / 4935519) [(12, 1), (14, 1), (15, 2)],
  term ((-1809920 : Rat) / 4935519) [(12, 1), (15, 2)],
  term ((-3619840 : Rat) / 4935519) [(12, 2), (14, 1), (15, 2)],
  term ((1809920 : Rat) / 4935519) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0144_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0144
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0145 : Poly :=
[
  term ((256981760 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 145 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0145 : Poly :=
[
  term ((513963520 : Rat) / 330679773) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-256981760 : Rat) / 330679773) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((256981760 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)],
  term ((-513963520 : Rat) / 330679773) [(13, 1), (14, 2), (15, 1)],
  term ((513963520 : Rat) / 330679773) [(13, 2), (14, 1), (15, 2)],
  term ((-256981760 : Rat) / 330679773) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0145_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0145
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0146 : Poly :=
[
  term ((-1904735170 : Rat) / 330679773) [(13, 1), (15, 1)]
]

/-- Partial product 146 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0146 : Poly :=
[
  term ((-3809470340 : Rat) / 330679773) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1904735170 : Rat) / 330679773) [(12, 2), (13, 1), (15, 1)],
  term ((3809470340 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)],
  term ((-1904735170 : Rat) / 330679773) [(13, 1), (15, 1)],
  term ((-3809470340 : Rat) / 330679773) [(13, 2), (15, 2)],
  term ((1904735170 : Rat) / 330679773) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0146_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0146
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0147 : Poly :=
[
  term ((16708160 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 147 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0147 : Poly :=
[
  term ((33416320 : Rat) / 12247399) [(12, 1), (13, 2), (14, 1)],
  term ((-16708160 : Rat) / 12247399) [(12, 2), (13, 2)],
  term ((16708160 : Rat) / 12247399) [(13, 2)],
  term ((-33416320 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((33416320 : Rat) / 12247399) [(13, 3), (15, 1)],
  term ((-16708160 : Rat) / 12247399) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0147_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0147
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0148 : Poly :=
[
  term ((-31360 : Rat) / 182797) [(13, 2), (14, 1)]
]

/-- Partial product 148 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0148 : Poly :=
[
  term ((-62720 : Rat) / 182797) [(12, 1), (13, 2), (14, 2)],
  term ((31360 : Rat) / 182797) [(12, 2), (13, 2), (14, 1)],
  term ((-31360 : Rat) / 182797) [(13, 2), (14, 1)],
  term ((62720 : Rat) / 182797) [(13, 2), (14, 2)],
  term ((-62720 : Rat) / 182797) [(13, 3), (14, 1), (15, 1)],
  term ((31360 : Rat) / 182797) [(13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0148_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0148
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0149 : Poly :=
[
  term ((9 : Rat) / 67) [(14, 1)]
]

/-- Partial product 149 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0149 : Poly :=
[
  term ((18 : Rat) / 67) [(12, 1), (14, 2)],
  term ((-9 : Rat) / 67) [(12, 2), (14, 1)],
  term ((18 : Rat) / 67) [(13, 1), (14, 1), (15, 1)],
  term ((-9 : Rat) / 67) [(13, 2), (14, 1)],
  term ((9 : Rat) / 67) [(14, 1)],
  term ((-18 : Rat) / 67) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0149_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0149
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0150 : Poly :=
[
  term ((-96701440 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 150 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0150 : Poly :=
[
  term ((-193402880 : Rat) / 110226591) [(12, 1), (14, 2), (15, 2)],
  term ((96701440 : Rat) / 110226591) [(12, 2), (14, 1), (15, 2)],
  term ((-193402880 : Rat) / 110226591) [(13, 1), (14, 1), (15, 3)],
  term ((96701440 : Rat) / 110226591) [(13, 2), (14, 1), (15, 2)],
  term ((-96701440 : Rat) / 110226591) [(14, 1), (15, 2)],
  term ((193402880 : Rat) / 110226591) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0150_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0150
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0151 : Poly :=
[
  term ((2010243400 : Rat) / 330679773) [(15, 2)]
]

/-- Partial product 151 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0151 : Poly :=
[
  term ((4020486800 : Rat) / 330679773) [(12, 1), (14, 1), (15, 2)],
  term ((-2010243400 : Rat) / 330679773) [(12, 2), (15, 2)],
  term ((4020486800 : Rat) / 330679773) [(13, 1), (15, 3)],
  term ((-2010243400 : Rat) / 330679773) [(13, 2), (15, 2)],
  term ((-4020486800 : Rat) / 330679773) [(14, 1), (15, 2)],
  term ((2010243400 : Rat) / 330679773) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0151_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0151
        rs_R009_ueqv_R009NNNYN_generator_30_0100_0151 =
      rs_R009_ueqv_R009NNNYN_partial_30_0151 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_30_0100_0151 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_30_0100,
  rs_R009_ueqv_R009NNNYN_partial_30_0101,
  rs_R009_ueqv_R009NNNYN_partial_30_0102,
  rs_R009_ueqv_R009NNNYN_partial_30_0103,
  rs_R009_ueqv_R009NNNYN_partial_30_0104,
  rs_R009_ueqv_R009NNNYN_partial_30_0105,
  rs_R009_ueqv_R009NNNYN_partial_30_0106,
  rs_R009_ueqv_R009NNNYN_partial_30_0107,
  rs_R009_ueqv_R009NNNYN_partial_30_0108,
  rs_R009_ueqv_R009NNNYN_partial_30_0109,
  rs_R009_ueqv_R009NNNYN_partial_30_0110,
  rs_R009_ueqv_R009NNNYN_partial_30_0111,
  rs_R009_ueqv_R009NNNYN_partial_30_0112,
  rs_R009_ueqv_R009NNNYN_partial_30_0113,
  rs_R009_ueqv_R009NNNYN_partial_30_0114,
  rs_R009_ueqv_R009NNNYN_partial_30_0115,
  rs_R009_ueqv_R009NNNYN_partial_30_0116,
  rs_R009_ueqv_R009NNNYN_partial_30_0117,
  rs_R009_ueqv_R009NNNYN_partial_30_0118,
  rs_R009_ueqv_R009NNNYN_partial_30_0119,
  rs_R009_ueqv_R009NNNYN_partial_30_0120,
  rs_R009_ueqv_R009NNNYN_partial_30_0121,
  rs_R009_ueqv_R009NNNYN_partial_30_0122,
  rs_R009_ueqv_R009NNNYN_partial_30_0123,
  rs_R009_ueqv_R009NNNYN_partial_30_0124,
  rs_R009_ueqv_R009NNNYN_partial_30_0125,
  rs_R009_ueqv_R009NNNYN_partial_30_0126,
  rs_R009_ueqv_R009NNNYN_partial_30_0127,
  rs_R009_ueqv_R009NNNYN_partial_30_0128,
  rs_R009_ueqv_R009NNNYN_partial_30_0129,
  rs_R009_ueqv_R009NNNYN_partial_30_0130,
  rs_R009_ueqv_R009NNNYN_partial_30_0131,
  rs_R009_ueqv_R009NNNYN_partial_30_0132,
  rs_R009_ueqv_R009NNNYN_partial_30_0133,
  rs_R009_ueqv_R009NNNYN_partial_30_0134,
  rs_R009_ueqv_R009NNNYN_partial_30_0135,
  rs_R009_ueqv_R009NNNYN_partial_30_0136,
  rs_R009_ueqv_R009NNNYN_partial_30_0137,
  rs_R009_ueqv_R009NNNYN_partial_30_0138,
  rs_R009_ueqv_R009NNNYN_partial_30_0139,
  rs_R009_ueqv_R009NNNYN_partial_30_0140,
  rs_R009_ueqv_R009NNNYN_partial_30_0141,
  rs_R009_ueqv_R009NNNYN_partial_30_0142,
  rs_R009_ueqv_R009NNNYN_partial_30_0143,
  rs_R009_ueqv_R009NNNYN_partial_30_0144,
  rs_R009_ueqv_R009NNNYN_partial_30_0145,
  rs_R009_ueqv_R009NNNYN_partial_30_0146,
  rs_R009_ueqv_R009NNNYN_partial_30_0147,
  rs_R009_ueqv_R009NNNYN_partial_30_0148,
  rs_R009_ueqv_R009NNNYN_partial_30_0149,
  rs_R009_ueqv_R009NNNYN_partial_30_0150,
  rs_R009_ueqv_R009NNNYN_partial_30_0151
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_30_0100_0151 : Poly :=
[
  term ((212249240 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((3153478526 : Rat) / 110226591) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12249813280 : Rat) / 330679773) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-106124620 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((6124906640 : Rat) / 330679773) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1576739263 : Rat) / 110226591) [(7, 1), (12, 2), (15, 1)],
  term ((106124620 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)],
  term ((-12249813280 : Rat) / 330679773) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-212249240 : Rat) / 12247399) [(7, 1), (13, 1), (14, 2)],
  term ((3153478526 : Rat) / 110226591) [(7, 1), (13, 1), (15, 2)],
  term ((11855636120 : Rat) / 330679773) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1576739263 : Rat) / 110226591) [(7, 1), (13, 2), (15, 1)],
  term ((-106124620 : Rat) / 12247399) [(7, 1), (13, 3), (14, 1)],
  term ((-15585342218 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)],
  term ((12249813280 : Rat) / 330679773) [(7, 1), (14, 2), (15, 1)],
  term ((1576739263 : Rat) / 110226591) [(7, 1), (15, 1)],
  term ((-747564201664 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1)],
  term ((-1495128403328 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((747564201664 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-1495128403328 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((747564201664 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((1495128403328 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-23361381302 : Rat) / 698101743) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((1348285435144 : Rat) / 18848747061) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((11680690651 : Rat) / 698101743) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-674142717572 : Rat) / 18848747061) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-11680690651 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1)],
  term ((23361381302 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1348285435144 : Rat) / 18848747061) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1304900012726 : Rat) / 18848747061) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((11680690651 : Rat) / 698101743) [(9, 1), (10, 1), (13, 3)],
  term ((-1348285435144 : Rat) / 18848747061) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((674142717572 : Rat) / 18848747061) [(9, 1), (10, 1), (15, 1)],
  term ((-40882128086 : Rat) / 1778183685) [(9, 1), (11, 1)],
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1)],
  term ((-10357760 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10093723136 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-12963638858396 : Rat) / 94243735305) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((85995520 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-22959602176 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((40882128086 : Rat) / 1778183685) [(9, 1), (11, 1), (12, 2)],
  term ((5178880 : Rat) / 110226591) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((41760970496 : Rat) / 330679773) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-42997760 : Rat) / 110226591) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 3)],
  term ((-22928528896 : Rat) / 330679773) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4337933519516 : Rat) / 94243735305) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((85995520 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((40882128086 : Rat) / 1778183685) [(9, 1), (11, 1), (13, 2)],
  term ((11479801088 : Rat) / 330679773) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-53355520 : Rat) / 110226591) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((5178880 : Rat) / 110226591) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term ((1061762267036 : Rat) / 94243735305) [(9, 1), (11, 1), (14, 1)],
  term ((-85995520 : Rat) / 110226591) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((22959602176 : Rat) / 330679773) [(9, 1), (11, 1), (14, 2)],
  term ((42997760 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (15, 1)],
  term ((236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)],
  term ((-177501386489 : Rat) / 3490508715) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-43389440 : Rat) / 110226591) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-358743784 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-9102375328 : Rat) / 110226591) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((8809477112 : Rat) / 110226591) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 3)],
  term ((10469425400908 : Rat) / 94243735305) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((21415355984 : Rat) / 330679773) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (15, 1)],
  term ((804821773 : Rat) / 131717310) [(9, 1), (12, 2), (13, 1)],
  term ((652515164 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((21694720 : Rat) / 110226591) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (12, 2), (13, 2), (15, 1)],
  term ((-38014803976 : Rat) / 330679773) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-25348061278 : Rat) / 1778183685) [(9, 1), (12, 2), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(9, 1), (12, 2), (15, 3)],
  term ((-236571636 : Rat) / 12247399) [(9, 1), (12, 3), (13, 1)],
  term ((4551187664 : Rat) / 110226591) [(9, 1), (12, 3), (15, 1)],
  term ((-804821773 : Rat) / 131717310) [(9, 1), (13, 1)],
  term ((-8465435251 : Rat) / 3490508715) [(9, 1), (13, 1), (14, 1)],
  term ((21545524304 : Rat) / 330679773) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((358743784 : Rat) / 12247399) [(9, 1), (13, 1), (14, 2)],
  term ((2668345509868 : Rat) / 94243735305) [(9, 1), (13, 1), (15, 2)],
  term ((17582080 : Rat) / 110226591) [(9, 1), (13, 1), (15, 4)],
  term ((-20443111840 : Rat) / 330679773) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2488114590497 : Rat) / 94243735305) [(9, 1), (13, 2), (15, 1)],
  term ((-52180480 : Rat) / 110226591) [(9, 1), (13, 2), (15, 3)],
  term ((804821773 : Rat) / 131717310) [(9, 1), (13, 3)],
  term ((179371892 : Rat) / 12247399) [(9, 1), (13, 3), (14, 1)],
  term ((38145280 : Rat) / 110226591) [(9, 1), (13, 3), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 4), (15, 1)],
  term ((364793732252 : Rat) / 94243735305) [(9, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (14, 1), (15, 3)],
  term ((-21415355984 : Rat) / 330679773) [(9, 1), (14, 2), (15, 1)],
  term ((25348061278 : Rat) / 1778183685) [(9, 1), (15, 1)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (15, 3)],
  term ((366 : Rat) / 67) [(9, 2)],
  term ((732 : Rat) / 67) [(9, 2), (12, 1), (14, 1)],
  term ((-366 : Rat) / 67) [(9, 2), (12, 2)],
  term ((732 : Rat) / 67) [(9, 2), (13, 1), (15, 1)],
  term ((-366 : Rat) / 67) [(9, 2), (13, 2)],
  term ((-732 : Rat) / 67) [(9, 2), (14, 1)],
  term ((-120 : Rat) / 67) [(10, 1)],
  term ((113004316796 : Rat) / 3490508715) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6488623624912 : Rat) / 94243735305) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-6488623624912 : Rat) / 94243735305) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((6295428365948 : Rat) / 94243735305) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 3)],
  term ((6488623624912 : Rat) / 94243735305) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 1)],
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2)],
  term ((7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (12, 2)],
  term ((7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (13, 2)],
  term ((-7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-240 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((-35164160 : Rat) / 110226591) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((120 : Rat) / 67) [(10, 1), (12, 2)],
  term ((-913920 : Rat) / 12247399) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(10, 1), (12, 2), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-42957360 : Rat) / 12247399) [(10, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(10, 1), (13, 1), (15, 3)],
  term ((120 : Rat) / 67) [(10, 1), (13, 2)],
  term ((34032640 : Rat) / 110226591) [(10, 1), (13, 2), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 3), (15, 1)],
  term ((240 : Rat) / 67) [(10, 1), (14, 1)],
  term ((35164160 : Rat) / 110226591) [(10, 1), (14, 1), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)],
  term ((-211143773869 : Rat) / 31414578435) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5962240 : Rat) / 110226591) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-515701760 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((57958400 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((69724160 : Rat) / 330679773) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 3)],
  term ((19507493104 : Rat) / 1778183685) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((390287360 : Rat) / 110226591) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((28979200 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)],
  term ((3806923673 : Rat) / 1185455790) [(11, 1), (12, 2), (13, 1)],
  term ((356554240 : Rat) / 330679773) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((2981120 : Rat) / 110226591) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(11, 1), (12, 2), (13, 2), (15, 1)],
  term ((-527472640 : Rat) / 330679773) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-525207639256 : Rat) / 94243735305) [(11, 1), (12, 2), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(11, 1), (12, 2), (15, 3)],
  term ((-1827840 : Rat) / 12247399) [(11, 1), (12, 3), (13, 1)],
  term ((-28979200 : Rat) / 330679773) [(11, 1), (12, 3), (15, 1)],
  term ((-3806923673 : Rat) / 1185455790) [(11, 1), (13, 1)],
  term ((177271121069 : Rat) / 31414578435) [(11, 1), (13, 1), (14, 1)],
  term ((132083200 : Rat) / 36742197) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((515701760 : Rat) / 330679773) [(11, 1), (13, 1), (14, 2)],
  term ((1047866420912 : Rat) / 94243735305) [(11, 1), (13, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(11, 1), (13, 1), (15, 4)],
  term ((-1051781120 : Rat) / 330679773) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1137541117663 : Rat) / 94243735305) [(11, 1), (13, 2), (15, 1)],
  term ((-49917440 : Rat) / 110226591) [(11, 1), (13, 2), (15, 3)],
  term ((3806923673 : Rat) / 1185455790) [(11, 1), (13, 3)],
  term ((257850880 : Rat) / 330679773) [(11, 1), (13, 3), (14, 1)],
  term ((-13469440 : Rat) / 110226591) [(11, 1), (13, 3), (15, 2)],
  term ((913920 : Rat) / 12247399) [(11, 1), (13, 4), (15, 1)],
  term ((-883567432112 : Rat) / 94243735305) [(11, 1), (14, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(11, 1), (14, 1), (15, 3)],
  term ((-390287360 : Rat) / 110226591) [(11, 1), (14, 2), (15, 1)],
  term ((525207639256 : Rat) / 94243735305) [(11, 1), (15, 1)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (15, 3)],
  term ((-1270985446712 : Rat) / 94243735305) [(11, 2)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1)],
  term ((125511680 : Rat) / 110226591) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(11, 2), (12, 1), (13, 2)],
  term ((-2608650496624 : Rat) / 94243735305) [(11, 2), (12, 1), (14, 1)],
  term ((-149708800 : Rat) / 36742197) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(11, 2), (12, 1), (14, 2)],
  term ((1270985446712 : Rat) / 94243735305) [(11, 2), (12, 2)],
  term ((-62755840 : Rat) / 110226591) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 12247399) [(11, 2), (12, 2), (14, 1)],
  term ((74854400 : Rat) / 36742197) [(11, 2), (12, 2), (15, 2)],
  term ((-38993920 : Rat) / 110226591) [(11, 2), (12, 3)],
  term ((-320481280 : Rat) / 110226591) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2488314650224 : Rat) / 94243735305) [(11, 2), (13, 1), (15, 1)],
  term ((-149708800 : Rat) / 36742197) [(11, 2), (13, 1), (15, 3)],
  term ((1270985446712 : Rat) / 94243735305) [(11, 2), (13, 2)],
  term ((97484800 : Rat) / 110226591) [(11, 2), (13, 2), (14, 1)],
  term ((350074880 : Rat) / 110226591) [(11, 2), (13, 2), (15, 2)],
  term ((-62755840 : Rat) / 110226591) [(11, 2), (13, 3), (15, 1)],
  term ((2458621389424 : Rat) / 94243735305) [(11, 2), (14, 1)],
  term ((149708800 : Rat) / 36742197) [(11, 2), (14, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(11, 2), (14, 2)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(11, 3), (12, 2), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(11, 3), (13, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(11, 3), (13, 2), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(11, 3), (14, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (15, 1)],
  term ((-3922930820 : Rat) / 330679773) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((513963520 : Rat) / 330679773) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((31360 : Rat) / 182797) [(12, 1), (13, 1), (15, 1)],
  term ((-3619840 : Rat) / 4935519) [(12, 1), (13, 1), (15, 3)],
  term ((33416320 : Rat) / 12247399) [(12, 1), (13, 2), (14, 1)],
  term ((-62720 : Rat) / 182797) [(12, 1), (13, 2), (14, 2)],
  term ((3503360 : Rat) / 4935519) [(12, 1), (13, 2), (15, 2)],
  term ((-31360 : Rat) / 182797) [(12, 1), (13, 3), (15, 1)],
  term ((1421005360 : Rat) / 110226591) [(12, 1), (14, 1), (15, 2)],
  term ((18 : Rat) / 67) [(12, 1), (14, 2)],
  term ((-193402880 : Rat) / 110226591) [(12, 1), (14, 2), (15, 2)],
  term ((-1809920 : Rat) / 4935519) [(12, 1), (15, 2)],
  term ((-143521280 : Rat) / 330679773) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((1904735170 : Rat) / 330679773) [(12, 2), (13, 1), (15, 1)],
  term ((-16708160 : Rat) / 12247399) [(12, 2), (13, 2)],
  term ((31360 : Rat) / 182797) [(12, 2), (13, 2), (14, 1)],
  term ((-9 : Rat) / 67) [(12, 2), (14, 1)],
  term ((47575040 : Rat) / 330679773) [(12, 2), (14, 1), (15, 2)],
  term ((-2010243400 : Rat) / 330679773) [(12, 2), (15, 2)],
  term ((-31360 : Rat) / 182797) [(12, 3), (13, 1), (15, 1)],
  term ((1809920 : Rat) / 4935519) [(12, 3), (15, 2)],
  term ((4155291442 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)],
  term ((-193402880 : Rat) / 110226591) [(13, 1), (14, 1), (15, 3)],
  term ((-513963520 : Rat) / 330679773) [(13, 1), (14, 2), (15, 1)],
  term ((-1904735170 : Rat) / 330679773) [(13, 1), (15, 1)],
  term ((4020486800 : Rat) / 330679773) [(13, 1), (15, 3)],
  term ((16708160 : Rat) / 12247399) [(13, 2)],
  term ((-37162613 : Rat) / 12247399) [(13, 2), (14, 1)],
  term ((804067840 : Rat) / 330679773) [(13, 2), (14, 1), (15, 2)],
  term ((62720 : Rat) / 182797) [(13, 2), (14, 2)],
  term ((-646634860 : Rat) / 36742197) [(13, 2), (15, 2)],
  term ((-370442240 : Rat) / 330679773) [(13, 3), (14, 1), (15, 1)],
  term ((2806975810 : Rat) / 330679773) [(13, 3), (15, 1)],
  term ((-16708160 : Rat) / 12247399) [(13, 4)],
  term ((31360 : Rat) / 182797) [(13, 4), (14, 1)],
  term ((9 : Rat) / 67) [(14, 1)],
  term ((-4310591120 : Rat) / 330679773) [(14, 1), (15, 2)],
  term ((-18 : Rat) / 67) [(14, 2)],
  term ((193402880 : Rat) / 110226591) [(14, 2), (15, 2)],
  term ((2010243400 : Rat) / 330679773) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 100 through 151. -/
theorem rs_R009_ueqv_R009NNNYN_block_30_0100_0151_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_30_0100_0151
      rs_R009_ueqv_R009NNNYN_block_30_0100_0151 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
