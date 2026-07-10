/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:2100-2199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_2100_2199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 2100 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2100 : Poly :=
[
  term ((169148025789850295024 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 2100 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2100 : Poly :=
[
  term ((338296051579700590048 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-169148025789850295024 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2100 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2100
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2100 := by
  native_decide

/-- Coefficient term 2101 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2101 : Poly :=
[
  term ((2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2101 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2101 : Poly :=
[
  term ((4299895776072604928 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2101 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2101_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2101
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2101 := by
  native_decide

/-- Coefficient term 2102 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2102 : Poly :=
[
  term ((-18573065642129441152 : Rat) / 53898264945705951) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2102 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2102 : Poly :=
[
  term ((-37146131284258882304 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18573065642129441152 : Rat) / 53898264945705951) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2102 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2102_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2102
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2102 := by
  native_decide

/-- Coefficient term 2103 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2103 : Poly :=
[
  term ((-5066707111208655616 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 2103 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2103 : Poly :=
[
  term ((-10133414222417311232 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5066707111208655616 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2103 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2103_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2103
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2103 := by
  native_decide

/-- Coefficient term 2104 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2104 : Poly :=
[
  term ((486824889458065060396 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2104 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2104 : Poly :=
[
  term ((973649778916130120792 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-486824889458065060396 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2104 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2104_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2104
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2104 := by
  native_decide

/-- Coefficient term 2105 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2105 : Poly :=
[
  term ((-31214114089250075024 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 2105 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2105 : Poly :=
[
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((31214114089250075024 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2105 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2105_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2105
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2105 := by
  native_decide

/-- Coefficient term 2106 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2106 : Poly :=
[
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2106 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2106 : Poly :=
[
  term ((1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2106 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2106_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2106
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2106 := by
  native_decide

/-- Coefficient term 2107 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2107 : Poly :=
[
  term ((1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2107 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2107 : Poly :=
[
  term ((3310882268386201600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2107 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2107_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2107
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2107 := by
  native_decide

/-- Coefficient term 2108 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2108 : Poly :=
[
  term ((827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2108 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2108 : Poly :=
[
  term ((1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2108 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2108_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2108
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2108 := by
  native_decide

/-- Coefficient term 2109 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2109 : Poly :=
[
  term ((-8646072569523200 : Rat) / 393417992304423) [(5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2109 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2109 : Poly :=
[
  term ((-17292145139046400 : Rat) / 393417992304423) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((8646072569523200 : Rat) / 393417992304423) [(5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2109 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2109_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2109
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2109 := by
  native_decide

/-- Coefficient term 2110 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2110 : Poly :=
[
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2110 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2110 : Poly :=
[
  term ((5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2110 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2110_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2110
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2110 := by
  native_decide

/-- Coefficient term 2111 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2111 : Poly :=
[
  term ((5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2111 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2111 : Poly :=
[
  term ((10036678766706849280 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2111 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2111_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2111
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2111 := by
  native_decide

/-- Coefficient term 2112 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2112 : Poly :=
[
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2112 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2112 : Poly :=
[
  term ((5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2112 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2112_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2112
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2112 := by
  native_decide

/-- Coefficient term 2113 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2113 : Poly :=
[
  term ((-3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 2113 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2113 : Poly :=
[
  term ((-6602966398784643200 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2113 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2113_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2113
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2113 := by
  native_decide

/-- Coefficient term 2114 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2114 : Poly :=
[
  term ((-2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 2114 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2114 : Poly :=
[
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2114 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2114_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2114
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2114 := by
  native_decide

/-- Coefficient term 2115 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2115 : Poly :=
[
  term ((8355047748897245248 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 2115 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2115 : Poly :=
[
  term ((16710095497794490496 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-8355047748897245248 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2115 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2115_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2115
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2115 := by
  native_decide

/-- Coefficient term 2116 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2116 : Poly :=
[
  term ((-1846119119942138752 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (16, 1)]
]

/-- Partial product 2116 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2116 : Poly :=
[
  term ((-3692238239884277504 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (12, 1), (16, 1)],
  term ((1846119119942138752 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2116 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2116_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2116
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2116 := by
  native_decide

/-- Coefficient term 2117 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2117 : Poly :=
[
  term ((-38002807054286547712 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2117 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2117 : Poly :=
[
  term ((38002807054286547712 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-76005614108573095424 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2117 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2117_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2117
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2117 := by
  native_decide

/-- Coefficient term 2118 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2118 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 2118 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2118 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2118 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2118_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2118
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2118 := by
  native_decide

/-- Coefficient term 2119 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2119 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2119 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2119 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2119 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2119_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2119
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2119 := by
  native_decide

/-- Coefficient term 2120 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2120 : Poly :=
[
  term ((37408154762739667712 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2120 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2120 : Poly :=
[
  term ((74816309525479335424 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-37408154762739667712 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2120 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2120_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2120
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2120 := by
  native_decide

/-- Coefficient term 2121 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2121 : Poly :=
[
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2121 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2121 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2121 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2121_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2121
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2121 := by
  native_decide

/-- Coefficient term 2122 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2122 : Poly :=
[
  term ((6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2122 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2122 : Poly :=
[
  term ((12828368000182530304 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2122 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2122_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2122
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2122 := by
  native_decide

/-- Coefficient term 2123 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2123 : Poly :=
[
  term ((475721833237504000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2123 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2123 : Poly :=
[
  term ((951443666475008000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2123 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2123_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2123
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2123 := by
  native_decide

/-- Coefficient term 2124 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2124 : Poly :=
[
  term ((-2535948969041587584 : Rat) / 29943480525392195) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2124 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2124 : Poly :=
[
  term ((-5071897938083175168 : Rat) / 29943480525392195) [(5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2535948969041587584 : Rat) / 29943480525392195) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2124 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2124_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2124
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2124 := by
  native_decide

/-- Coefficient term 2125 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2125 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 2125 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2125 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2125 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2125_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2125
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2125 := by
  native_decide

/-- Coefficient term 2126 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2126 : Poly :=
[
  term ((118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 2126 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2126 : Poly :=
[
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2126 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2126_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2126
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2126 := by
  native_decide

/-- Coefficient term 2127 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2127 : Poly :=
[
  term ((332284749484620800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 2127 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2127 : Poly :=
[
  term ((664569498969241600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-332284749484620800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2127 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2127_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2127
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2127 := by
  native_decide

/-- Coefficient term 2128 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2128 : Poly :=
[
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2128 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2128 : Poly :=
[
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2128 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2128_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2128
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2128 := by
  native_decide

/-- Coefficient term 2129 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2129 : Poly :=
[
  term ((-2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2129 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2129 : Poly :=
[
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2129 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2129_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2129
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2129 := by
  native_decide

/-- Coefficient term 2130 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2130 : Poly :=
[
  term ((-3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2130 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2130 : Poly :=
[
  term ((-7069044629699601730624 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2130 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2130_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2130
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2130 := by
  native_decide

/-- Coefficient term 2131 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2131 : Poly :=
[
  term ((-9024280337186309824 : Rat) / 53898264945705951) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 2131 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2131 : Poly :=
[
  term ((-18048560674372619648 : Rat) / 53898264945705951) [(5, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((9024280337186309824 : Rat) / 53898264945705951) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2131 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2131_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2131
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2131 := by
  native_decide

/-- Coefficient term 2132 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2132 : Poly :=
[
  term ((12717550981311972352 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 2), (16, 1)]
]

/-- Partial product 2132 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2132 : Poly :=
[
  term ((25435101962623944704 : Rat) / 269491324728529755) [(5, 2), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-12717550981311972352 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2132 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2132_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2132
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2132 := by
  native_decide

/-- Coefficient term 2133 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2133 : Poly :=
[
  term ((1198675148702006237024 : Rat) / 449152207880882925) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 2133 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2133 : Poly :=
[
  term ((2397350297404012474048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1198675148702006237024 : Rat) / 449152207880882925) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2133 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2133_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2133
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2133 := by
  native_decide

/-- Coefficient term 2134 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2134 : Poly :=
[
  term ((-39329472641077359416 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 2134 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2134 : Poly :=
[
  term ((-78658945282154718832 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (12, 1), (16, 1)],
  term ((39329472641077359416 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2134 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2134_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2134
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2134 := by
  native_decide

/-- Coefficient term 2135 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2135 : Poly :=
[
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2135 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2135 : Poly :=
[
  term ((386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2135 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2135_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2135
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2135 := by
  native_decide

/-- Coefficient term 2136 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2136 : Poly :=
[
  term ((386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2136 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2136 : Poly :=
[
  term ((773343643161751980032 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2136 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2136_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2136
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2136 := by
  native_decide

/-- Coefficient term 2137 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2137 : Poly :=
[
  term ((193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 2137 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2137 : Poly :=
[
  term ((386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2137 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2137_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2137
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2137 := by
  native_decide

/-- Coefficient term 2138 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2138 : Poly :=
[
  term ((-397774025194744226816 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 2138 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2138 : Poly :=
[
  term ((-795548050389488453632 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((397774025194744226816 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2138 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2138_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2138
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2138 := by
  native_decide

/-- Coefficient term 2139 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2139 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2139 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2139 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2139 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2139_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2139
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2139 := by
  native_decide

/-- Coefficient term 2140 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2140 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2140 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2140 : Poly :=
[
  term ((508415370829004800 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2140 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2140_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2140
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2140 := by
  native_decide

/-- Coefficient term 2141 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2141 : Poly :=
[
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2141 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2141 : Poly :=
[
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2141 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2141_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2141
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2141 := by
  native_decide

/-- Coefficient term 2142 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2142 : Poly :=
[
  term ((68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 2142 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2142 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2142 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2142_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2142
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2142 := by
  native_decide

/-- Coefficient term 2143 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2143 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 2143 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2143 : Poly :=
[
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2143 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2143_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2143
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2143 := by
  native_decide

/-- Coefficient term 2144 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2144 : Poly :=
[
  term ((99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 2144 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2144 : Poly :=
[
  term ((198679984575180241408 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2144 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2144_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2144
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2144 := by
  native_decide

/-- Coefficient term 2145 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2145 : Poly :=
[
  term ((-162691529255018089472 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2145 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2145 : Poly :=
[
  term ((162691529255018089472 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-325383058510036178944 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2145 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2145_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2145
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2145 := by
  native_decide

/-- Coefficient term 2146 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2146 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 2146 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2146 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2146 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2146_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2146
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2146 := by
  native_decide

/-- Coefficient term 2147 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2147 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2147 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2147 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2147 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2147_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2147
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2147 := by
  native_decide

/-- Coefficient term 2148 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2148 : Poly :=
[
  term ((94545491120249345536 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2148 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2148 : Poly :=
[
  term ((189090982240498691072 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-94545491120249345536 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2148 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2148_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2148
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2148 := by
  native_decide

/-- Coefficient term 2149 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2149 : Poly :=
[
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2149 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2149 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2149 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2149_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2149
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2149 := by
  native_decide

/-- Coefficient term 2150 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2150 : Poly :=
[
  term ((47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 2150 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2150 : Poly :=
[
  term ((95249152919655527936 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2150 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2150_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2150
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2150 := by
  native_decide

/-- Coefficient term 2151 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2151 : Poly :=
[
  term ((272584152539074975744 : Rat) / 269491324728529755) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2151 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2151 : Poly :=
[
  term ((545168305078149951488 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 269491324728529755) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2151 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2151_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2151
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2151 := by
  native_decide

/-- Coefficient term 2152 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2152 : Poly :=
[
  term ((-39437083656163379968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 2152 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2152 : Poly :=
[
  term ((-78874167312326759936 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((39437083656163379968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2152 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2152_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2152
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2152 := by
  native_decide

/-- Coefficient term 2153 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2153 : Poly :=
[
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 3), (16, 1)]
]

/-- Partial product 2153 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2153 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2153 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2153_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2153
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2153 := by
  native_decide

/-- Coefficient term 2154 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2154 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2154 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2154 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2154 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2154_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2154
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2154 := by
  native_decide

/-- Coefficient term 2155 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2155 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2155 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2155 : Poly :=
[
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2155 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2155_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2155
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2155 := by
  native_decide

/-- Coefficient term 2156 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2156 : Poly :=
[
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2156 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2156 : Poly :=
[
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2156 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2156_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2156
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2156 := by
  native_decide

/-- Coefficient term 2157 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2157 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (15, 2), (16, 1)]
]

/-- Partial product 2157 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2157 : Poly :=
[
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 1), (15, 2), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2157 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2157_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2157
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2157 := by
  native_decide

/-- Coefficient term 2158 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2158 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 2), (9, 4), (16, 1)]
]

/-- Partial product 2158 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2158 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (9, 4), (12, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 2), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2158 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2158_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2158
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2158 := by
  native_decide

/-- Coefficient term 2159 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2159 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2159 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2159 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2159 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2159_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2159
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2159 := by
  native_decide

/-- Coefficient term 2160 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2160 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2160 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2160 : Poly :=
[
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2160 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2160_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2160
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2160 := by
  native_decide

/-- Coefficient term 2161 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2161 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2161 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2161 : Poly :=
[
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2161 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2161_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2161
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2161 := by
  native_decide

/-- Coefficient term 2162 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2162 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2162 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2162 : Poly :=
[
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2162 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2162_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2162
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2162 := by
  native_decide

/-- Coefficient term 2163 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2163 : Poly :=
[
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 2163 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2163 : Poly :=
[
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2163 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2163_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2163
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2163 := by
  native_decide

/-- Coefficient term 2164 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2164 : Poly :=
[
  term ((7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 2164 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2164 : Poly :=
[
  term ((14764711569654377772 : Rat) / 149717402626960975) [(5, 2), (10, 1), (12, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2164 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2164_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2164
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2164 := by
  native_decide

/-- Coefficient term 2165 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2165 : Poly :=
[
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (16, 1)]
]

/-- Partial product 2165 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2165 : Poly :=
[
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (12, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2165 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2165_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2165
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2165 := by
  native_decide

/-- Coefficient term 2166 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2166 : Poly :=
[
  term ((83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2166 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2166 : Poly :=
[
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((167077330816621548352 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2166 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2166_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2166
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2166 := by
  native_decide

/-- Coefficient term 2167 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2167 : Poly :=
[
  term ((-83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2167 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2167 : Poly :=
[
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2167 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2167_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2167
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2167 := by
  native_decide

/-- Coefficient term 2168 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2168 : Poly :=
[
  term ((-84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2168 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2168 : Poly :=
[
  term ((-169985274191818794752 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2168 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2168_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2168
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2168 := by
  native_decide

/-- Coefficient term 2169 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2169 : Poly :=
[
  term ((249708793825024862 : Rat) / 9835449807610575) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2169 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2169 : Poly :=
[
  term ((499417587650049724 : Rat) / 9835449807610575) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-249708793825024862 : Rat) / 9835449807610575) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2169 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2169_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2169
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2169 := by
  native_decide

/-- Coefficient term 2170 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2170 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 2), (11, 2), (16, 1)]
]

/-- Partial product 2170 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2170 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (11, 2), (12, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2170 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2170_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2170
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2170 := by
  native_decide

/-- Coefficient term 2171 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2171 : Poly :=
[
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2171 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2171 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(5, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2171 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2171_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2171
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2171 := by
  native_decide

/-- Coefficient term 2172 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2172 : Poly :=
[
  term ((-3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2172 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2172 : Poly :=
[
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2172 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2172_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2172
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2172 := by
  native_decide

/-- Coefficient term 2173 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2173 : Poly :=
[
  term ((-1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2173 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2173 : Poly :=
[
  term ((-3847359404906993352292 : Rat) / 1347456623642648775) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2173 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2173_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2173
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2173 := by
  native_decide

/-- Coefficient term 2174 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2174 : Poly :=
[
  term ((6074553157722855502 : Rat) / 89830441576176585) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 2174 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2174 : Poly :=
[
  term ((12149106315445711004 : Rat) / 89830441576176585) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-6074553157722855502 : Rat) / 89830441576176585) [(5, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2174 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2174_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2174
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2174 := by
  native_decide

/-- Coefficient term 2175 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2175 : Poly :=
[
  term ((-12499223725930014278 : Rat) / 89830441576176585) [(5, 2), (14, 2), (16, 1)]
]

/-- Partial product 2175 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2175 : Poly :=
[
  term ((-24998447451860028556 : Rat) / 89830441576176585) [(5, 2), (12, 1), (14, 2), (16, 1)],
  term ((12499223725930014278 : Rat) / 89830441576176585) [(5, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2175 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2175_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2175
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2175 := by
  native_decide

/-- Coefficient term 2176 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2176 : Poly :=
[
  term ((580707707275083403916 : Rat) / 449152207880882925) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 2176 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2176 : Poly :=
[
  term ((1161415414550166807832 : Rat) / 449152207880882925) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-580707707275083403916 : Rat) / 449152207880882925) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2176 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2176_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2176
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2176 := by
  native_decide

/-- Coefficient term 2177 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2177 : Poly :=
[
  term ((-71831061555039082351 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

/-- Partial product 2177 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2177 : Poly :=
[
  term ((-143662123110078164702 : Rat) / 1347456623642648775) [(5, 2), (12, 1), (16, 1)],
  term ((71831061555039082351 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2177 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2177_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2177
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2177 := by
  native_decide

/-- Coefficient term 2178 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2178 : Poly :=
[
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 2178 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2178 : Poly :=
[
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2178 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2178_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2178
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2178 := by
  native_decide

/-- Coefficient term 2179 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2179 : Poly :=
[
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2179 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2179 : Poly :=
[
  term ((-259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((519719201897477120 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2179 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2179_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2179
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2179 := by
  native_decide

/-- Coefficient term 2180 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2180 : Poly :=
[
  term ((-259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2180 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2180 : Poly :=
[
  term ((-519719201897477120 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2180 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2180_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2180
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2180 := by
  native_decide

/-- Coefficient term 2181 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2181 : Poly :=
[
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2181 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2181 : Poly :=
[
  term ((-259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2181 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2181_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2181
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2181 := by
  native_decide

/-- Coefficient term 2182 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2182 : Poly :=
[
  term ((129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2182 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2182 : Poly :=
[
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2182 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2182_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2182
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2182 := by
  native_decide

/-- Coefficient term 2183 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2183 : Poly :=
[
  term ((9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 2183 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2183 : Poly :=
[
  term ((18847575223765126784 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2183 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2183_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2183
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2183 := by
  native_decide

/-- Coefficient term 2184 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2184 : Poly :=
[
  term ((-24186579808678211584 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 2184 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2184 : Poly :=
[
  term ((-48373159617356423168 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((24186579808678211584 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2184 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2184_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2184
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2184 := by
  native_decide

/-- Coefficient term 2185 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2185 : Poly :=
[
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2185 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2185 : Poly :=
[
  term ((-74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2185 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2185_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2185
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2185 := by
  native_decide

/-- Coefficient term 2186 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2186 : Poly :=
[
  term ((-74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2186 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2186 : Poly :=
[
  term ((-148491200542136320 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2186 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2186_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2186
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2186 := by
  native_decide

/-- Coefficient term 2187 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2187 : Poly :=
[
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 2187 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2187 : Poly :=
[
  term ((-74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2187 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2187_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2187
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2187 := by
  native_decide

/-- Coefficient term 2188 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2188 : Poly :=
[
  term ((37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 2188 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2188 : Poly :=
[
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2188 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2188_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2188
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2188 := by
  native_decide

/-- Coefficient term 2189 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2189 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2189 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2189 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2189 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2189_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2189
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2189 := by
  native_decide

/-- Coefficient term 2190 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2190 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2190 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2190 : Poly :=
[
  term ((593964802168545280 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2190 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2190_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2190
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2190 := by
  native_decide

/-- Coefficient term 2191 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2191 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 2191 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2191 : Poly :=
[
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2191 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2191_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2191
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2191 := by
  native_decide

/-- Coefficient term 2192 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2192 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2192 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2192 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2192 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2192_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2192
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2192 := by
  native_decide

/-- Coefficient term 2193 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2193 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2193 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2193 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2193 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2193_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2193
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2193 := by
  native_decide

/-- Coefficient term 2194 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2194 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2194 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2194 : Poly :=
[
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2194 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2194_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2194
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2194 := by
  native_decide

/-- Coefficient term 2195 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2195 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 2195 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2195 : Poly :=
[
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2195 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2195_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2195
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2195 := by
  native_decide

/-- Coefficient term 2196 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2196 : Poly :=
[
  term ((12764839624080630592 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2196 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2196 : Poly :=
[
  term ((25529679248161261184 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12764839624080630592 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2196 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2196_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2196
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2196 := by
  native_decide

/-- Coefficient term 2197 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2197 : Poly :=
[
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2197 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2197 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2197 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2197_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2197
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2197 := by
  native_decide

/-- Coefficient term 2198 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2198 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2198 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2198 : Poly :=
[
  term ((41612091580709377024 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2198 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2198_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2198
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2198 := by
  native_decide

/-- Coefficient term 2199 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2199 : Poly :=
[
  term ((10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2199 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2199 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2199 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2199_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2199
        rs_R010_ueqv_R010YNN_generator_25_2100_2199 =
      rs_R010_ueqv_R010YNN_partial_25_2199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_2100_2199 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_2100,
  rs_R010_ueqv_R010YNN_partial_25_2101,
  rs_R010_ueqv_R010YNN_partial_25_2102,
  rs_R010_ueqv_R010YNN_partial_25_2103,
  rs_R010_ueqv_R010YNN_partial_25_2104,
  rs_R010_ueqv_R010YNN_partial_25_2105,
  rs_R010_ueqv_R010YNN_partial_25_2106,
  rs_R010_ueqv_R010YNN_partial_25_2107,
  rs_R010_ueqv_R010YNN_partial_25_2108,
  rs_R010_ueqv_R010YNN_partial_25_2109,
  rs_R010_ueqv_R010YNN_partial_25_2110,
  rs_R010_ueqv_R010YNN_partial_25_2111,
  rs_R010_ueqv_R010YNN_partial_25_2112,
  rs_R010_ueqv_R010YNN_partial_25_2113,
  rs_R010_ueqv_R010YNN_partial_25_2114,
  rs_R010_ueqv_R010YNN_partial_25_2115,
  rs_R010_ueqv_R010YNN_partial_25_2116,
  rs_R010_ueqv_R010YNN_partial_25_2117,
  rs_R010_ueqv_R010YNN_partial_25_2118,
  rs_R010_ueqv_R010YNN_partial_25_2119,
  rs_R010_ueqv_R010YNN_partial_25_2120,
  rs_R010_ueqv_R010YNN_partial_25_2121,
  rs_R010_ueqv_R010YNN_partial_25_2122,
  rs_R010_ueqv_R010YNN_partial_25_2123,
  rs_R010_ueqv_R010YNN_partial_25_2124,
  rs_R010_ueqv_R010YNN_partial_25_2125,
  rs_R010_ueqv_R010YNN_partial_25_2126,
  rs_R010_ueqv_R010YNN_partial_25_2127,
  rs_R010_ueqv_R010YNN_partial_25_2128,
  rs_R010_ueqv_R010YNN_partial_25_2129,
  rs_R010_ueqv_R010YNN_partial_25_2130,
  rs_R010_ueqv_R010YNN_partial_25_2131,
  rs_R010_ueqv_R010YNN_partial_25_2132,
  rs_R010_ueqv_R010YNN_partial_25_2133,
  rs_R010_ueqv_R010YNN_partial_25_2134,
  rs_R010_ueqv_R010YNN_partial_25_2135,
  rs_R010_ueqv_R010YNN_partial_25_2136,
  rs_R010_ueqv_R010YNN_partial_25_2137,
  rs_R010_ueqv_R010YNN_partial_25_2138,
  rs_R010_ueqv_R010YNN_partial_25_2139,
  rs_R010_ueqv_R010YNN_partial_25_2140,
  rs_R010_ueqv_R010YNN_partial_25_2141,
  rs_R010_ueqv_R010YNN_partial_25_2142,
  rs_R010_ueqv_R010YNN_partial_25_2143,
  rs_R010_ueqv_R010YNN_partial_25_2144,
  rs_R010_ueqv_R010YNN_partial_25_2145,
  rs_R010_ueqv_R010YNN_partial_25_2146,
  rs_R010_ueqv_R010YNN_partial_25_2147,
  rs_R010_ueqv_R010YNN_partial_25_2148,
  rs_R010_ueqv_R010YNN_partial_25_2149,
  rs_R010_ueqv_R010YNN_partial_25_2150,
  rs_R010_ueqv_R010YNN_partial_25_2151,
  rs_R010_ueqv_R010YNN_partial_25_2152,
  rs_R010_ueqv_R010YNN_partial_25_2153,
  rs_R010_ueqv_R010YNN_partial_25_2154,
  rs_R010_ueqv_R010YNN_partial_25_2155,
  rs_R010_ueqv_R010YNN_partial_25_2156,
  rs_R010_ueqv_R010YNN_partial_25_2157,
  rs_R010_ueqv_R010YNN_partial_25_2158,
  rs_R010_ueqv_R010YNN_partial_25_2159,
  rs_R010_ueqv_R010YNN_partial_25_2160,
  rs_R010_ueqv_R010YNN_partial_25_2161,
  rs_R010_ueqv_R010YNN_partial_25_2162,
  rs_R010_ueqv_R010YNN_partial_25_2163,
  rs_R010_ueqv_R010YNN_partial_25_2164,
  rs_R010_ueqv_R010YNN_partial_25_2165,
  rs_R010_ueqv_R010YNN_partial_25_2166,
  rs_R010_ueqv_R010YNN_partial_25_2167,
  rs_R010_ueqv_R010YNN_partial_25_2168,
  rs_R010_ueqv_R010YNN_partial_25_2169,
  rs_R010_ueqv_R010YNN_partial_25_2170,
  rs_R010_ueqv_R010YNN_partial_25_2171,
  rs_R010_ueqv_R010YNN_partial_25_2172,
  rs_R010_ueqv_R010YNN_partial_25_2173,
  rs_R010_ueqv_R010YNN_partial_25_2174,
  rs_R010_ueqv_R010YNN_partial_25_2175,
  rs_R010_ueqv_R010YNN_partial_25_2176,
  rs_R010_ueqv_R010YNN_partial_25_2177,
  rs_R010_ueqv_R010YNN_partial_25_2178,
  rs_R010_ueqv_R010YNN_partial_25_2179,
  rs_R010_ueqv_R010YNN_partial_25_2180,
  rs_R010_ueqv_R010YNN_partial_25_2181,
  rs_R010_ueqv_R010YNN_partial_25_2182,
  rs_R010_ueqv_R010YNN_partial_25_2183,
  rs_R010_ueqv_R010YNN_partial_25_2184,
  rs_R010_ueqv_R010YNN_partial_25_2185,
  rs_R010_ueqv_R010YNN_partial_25_2186,
  rs_R010_ueqv_R010YNN_partial_25_2187,
  rs_R010_ueqv_R010YNN_partial_25_2188,
  rs_R010_ueqv_R010YNN_partial_25_2189,
  rs_R010_ueqv_R010YNN_partial_25_2190,
  rs_R010_ueqv_R010YNN_partial_25_2191,
  rs_R010_ueqv_R010YNN_partial_25_2192,
  rs_R010_ueqv_R010YNN_partial_25_2193,
  rs_R010_ueqv_R010YNN_partial_25_2194,
  rs_R010_ueqv_R010YNN_partial_25_2195,
  rs_R010_ueqv_R010YNN_partial_25_2196,
  rs_R010_ueqv_R010YNN_partial_25_2197,
  rs_R010_ueqv_R010YNN_partial_25_2198,
  rs_R010_ueqv_R010YNN_partial_25_2199
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_2100_2199 : Poly :=
[
  term ((338296051579700590048 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((4299895776072604928 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-37146131284258882304 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10133414222417311232 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((973649778916130120792 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-169148025789850295024 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((18573065642129441152 : Rat) / 53898264945705951) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((5066707111208655616 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-486824889458065060396 : Rat) / 4042369870927946325) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((31214114089250075024 : Rat) / 53898264945705951) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((3310882268386201600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3310882268386201600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1655441134193100800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-827720567096550400 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((8646072569523200 : Rat) / 393417992304423) [(5, 2), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((10036678766706849280 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6602966398784643200 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((16710095497794490496 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-10036678766706849280 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-5018339383353424640 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3301483199392321600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((2509169691676712320 : Rat) / 17966088315235317) [(5, 2), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-8355047748897245248 : Rat) / 269491324728529755) [(5, 2), (9, 2), (10, 1), (16, 1)],
  term ((-3692238239884277504 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (12, 1), (16, 1)],
  term ((1846119119942138752 : Rat) / 89830441576176585) [(5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((74816309525479335424 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((12828368000182530304 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1528854877692405760 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-76005614108573095424 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-37408154762739667712 : Rat) / 269491324728529755) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6414184000091265152 : Rat) / 89830441576176585) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2535948969041587584 : Rat) / 29943480525392195) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 1), (15, 3), (16, 1)],
  term ((237860916618752000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((664569498969241600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(5, 2), (9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-332284749484620800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-4793988086838894452096 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7069044629699601730624 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18048560674372619648 : Rat) / 53898264945705951) [(5, 2), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((25435101962623944704 : Rat) / 269491324728529755) [(5, 2), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-78658945282154718832 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (12, 1), (16, 1)],
  term ((4793988086838894452096 : Rat) / 449152207880882925) [(5, 2), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((2396994043419447226048 : Rat) / 449152207880882925) [(5, 2), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3534522314849800865312 : Rat) / 1347456623642648775) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((9024280337186309824 : Rat) / 53898264945705951) [(5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-12717550981311972352 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 2), (16, 1)],
  term ((-1198675148702006237024 : Rat) / 449152207880882925) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((39329472641077359416 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (16, 1)],
  term ((773343643161751980032 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-773343643161751980032 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-386671821580875990016 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-193335910790437995008 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (13, 1), (16, 1)],
  term ((397774025194744226816 : Rat) / 269491324728529755) [(5, 2), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((508415370829004800 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((198679984575180241408 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-508415370829004800 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-254207685414502400 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(5, 2), (9, 3), (11, 1), (14, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(5, 2), (9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-99339992287590120704 : Rat) / 269491324728529755) [(5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((189090982240498691072 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((95249152919655527936 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((27939120647563776512 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-325383058510036178944 : Rat) / 269491324728529755) [(5, 2), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(5, 2), (9, 3), (12, 2), (15, 3), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-94545491120249345536 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-47624576459827763968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 269491324728529755) [(5, 2), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((39437083656163379968 : Rat) / 269491324728529755) [(5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-136292076269537487872 : Rat) / 89830441576176585) [(5, 2), (9, 3), (15, 3), (16, 1)],
  term ((-5742910519015505920 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (9, 4), (12, 1), (16, 1)],
  term ((5742910519015505920 : Rat) / 17966088315235317) [(5, 2), (9, 4), (12, 2), (15, 2), (16, 1)],
  term ((2871455259507752960 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(5, 2), (9, 4), (15, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 2), (9, 4), (16, 1)],
  term ((-2586005023494621440 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2586005023494621440 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1293002511747310720 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((14764711569654377772 : Rat) / 149717402626960975) [(5, 2), (10, 1), (12, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (14, 1), (16, 1)],
  term ((-7382355784827188886 : Rat) / 149717402626960975) [(5, 2), (10, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (12, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(5, 2), (10, 2), (16, 1)],
  term ((-167077330816621548352 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-169985274191818794752 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-36439157343375102068 : Rat) / 269491324728529755) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((167077330816621548352 : Rat) / 449152207880882925) [(5, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((83538665408310774176 : Rat) / 449152207880882925) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((84992637095909397376 : Rat) / 1347456623642648775) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-249708793825024862 : Rat) / 9835449807610575) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (11, 2), (12, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (11, 2), (16, 1)],
  term ((-6866595978647111450128 : Rat) / 1347456623642648775) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3847359404906993352292 : Rat) / 1347456623642648775) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12149106315445711004 : Rat) / 89830441576176585) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-24998447451860028556 : Rat) / 89830441576176585) [(5, 2), (12, 1), (14, 2), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-143662123110078164702 : Rat) / 1347456623642648775) [(5, 2), (12, 1), (16, 1)],
  term ((6866595978647111450128 : Rat) / 1347456623642648775) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((3433297989323555725064 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1923679702453496676146 : Rat) / 1347456623642648775) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6074553157722855502 : Rat) / 89830441576176585) [(5, 2), (14, 1), (16, 1)],
  term ((12499223725930014278 : Rat) / 89830441576176585) [(5, 2), (14, 2), (16, 1)],
  term ((-580707707275083403916 : Rat) / 449152207880882925) [(5, 2), (15, 2), (16, 1)],
  term ((71831061555039082351 : Rat) / 1347456623642648775) [(5, 2), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-519719201897477120 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((519719201897477120 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((259859600948738560 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((18847575223765126784 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-48373159617356423168 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((-9423787611882563392 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((24186579808678211584 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(5, 3), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((593964802168545280 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-593964802168545280 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((18847575223765126784 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((296982401084272640 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(5, 3), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-12764839624080630592 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(5, 3), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 2100 through 2199. -/
theorem rs_R010_ueqv_R010YNN_block_25_2100_2199_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_2100_2199
      rs_R010_ueqv_R010YNN_block_25_2100_2199 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
