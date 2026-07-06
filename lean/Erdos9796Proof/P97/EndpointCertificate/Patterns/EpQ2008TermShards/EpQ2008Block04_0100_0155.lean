/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 4:100-155

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_04_0100_0155 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0100 : Poly :=
[
  term ((-1848532210371095162412798876416271781275 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 4. -/
def ep_Q2_008_partial_04_0100 : Poly :=
[
  term ((-1848532210371095162412798876416271781275 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1848532210371095162412798876416271781275 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((1848532210371095162412798876416271781275 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((1848532210371095162412798876416271781275 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 4. -/
theorem ep_Q2_008_partial_04_0100_valid :
    mulPoly ep_Q2_008_coefficient_04_0100
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0101 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 4. -/
def ep_Q2_008_partial_04_0101 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 4. -/
theorem ep_Q2_008_partial_04_0101_valid :
    mulPoly ep_Q2_008_coefficient_04_0101
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0102 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 4. -/
def ep_Q2_008_partial_04_0102 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 4. -/
theorem ep_Q2_008_partial_04_0102_valid :
    mulPoly ep_Q2_008_coefficient_04_0102
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0103 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 103 for generator 4. -/
def ep_Q2_008_partial_04_0103 : Poly :=
[
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 2), (15, 2), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 4. -/
theorem ep_Q2_008_partial_04_0103_valid :
    mulPoly ep_Q2_008_coefficient_04_0103
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0104 : Poly :=
[
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 4. -/
def ep_Q2_008_partial_04_0104 : Poly :=
[
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 4. -/
theorem ep_Q2_008_partial_04_0104_valid :
    mulPoly ep_Q2_008_coefficient_04_0104
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0105 : Poly :=
[
  term ((-173144211303063375 : Rat) / 692956453614176359) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 105 for generator 4. -/
def ep_Q2_008_partial_04_0105 : Poly :=
[
  term ((-173144211303063375 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (16, 1)],
  term ((-173144211303063375 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (16, 1)],
  term ((173144211303063375 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((173144211303063375 : Rat) / 692956453614176359) [(6, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 4. -/
theorem ep_Q2_008_partial_04_0105_valid :
    mulPoly ep_Q2_008_coefficient_04_0105
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0106 : Poly :=
[
  term ((-1742792922544147875 : Rat) / 1385912907228352718) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 4. -/
def ep_Q2_008_partial_04_0106 : Poly :=
[
  term ((-1742792922544147875 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1742792922544147875 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1742792922544147875 : Rat) / 1385912907228352718) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((1742792922544147875 : Rat) / 1385912907228352718) [(6, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 4. -/
theorem ep_Q2_008_partial_04_0106_valid :
    mulPoly ep_Q2_008_coefficient_04_0106
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0107 : Poly :=
[
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 4. -/
def ep_Q2_008_partial_04_0107 : Poly :=
[
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 4. -/
theorem ep_Q2_008_partial_04_0107_valid :
    mulPoly ep_Q2_008_coefficient_04_0107
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0108 : Poly :=
[
  term ((17430635607359208072648074502772192373700 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 4. -/
def ep_Q2_008_partial_04_0108 : Poly :=
[
  term ((17430635607359208072648074502772192373700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((17430635607359208072648074502772192373700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17430635607359208072648074502772192373700 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17430635607359208072648074502772192373700 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 4. -/
theorem ep_Q2_008_partial_04_0108_valid :
    mulPoly ep_Q2_008_coefficient_04_0108
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0109 : Poly :=
[
  term ((35730349282845000 : Rat) / 692956453614176359) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 109 for generator 4. -/
def ep_Q2_008_partial_04_0109 : Poly :=
[
  term ((35730349282845000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((35730349282845000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 2), (16, 1)],
  term ((-35730349282845000 : Rat) / 692956453614176359) [(6, 1), (10, 2), (11, 2), (16, 1)],
  term ((-35730349282845000 : Rat) / 692956453614176359) [(6, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 4. -/
theorem ep_Q2_008_partial_04_0109_valid :
    mulPoly ep_Q2_008_coefficient_04_0109
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0110 : Poly :=
[
  term ((-23357868711748380515738092595827034095875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 4. -/
def ep_Q2_008_partial_04_0110 : Poly :=
[
  term ((-23357868711748380515738092595827034095875 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23357868711748380515738092595827034095875 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((23357868711748380515738092595827034095875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((23357868711748380515738092595827034095875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 4. -/
theorem ep_Q2_008_partial_04_0110_valid :
    mulPoly ep_Q2_008_coefficient_04_0110
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0111 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 4. -/
def ep_Q2_008_partial_04_0111 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 4. -/
theorem ep_Q2_008_partial_04_0111_valid :
    mulPoly ep_Q2_008_coefficient_04_0111
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0112 : Poly :=
[
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 4. -/
def ep_Q2_008_partial_04_0112 : Poly :=
[
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 4. -/
theorem ep_Q2_008_partial_04_0112_valid :
    mulPoly ep_Q2_008_coefficient_04_0112
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0113 : Poly :=
[
  term ((-295959638135460375 : Rat) / 2771825814456705436) [(6, 1), (16, 1)]
]

/-- Partial product 113 for generator 4. -/
def ep_Q2_008_partial_04_0113 : Poly :=
[
  term ((-295959638135460375 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (16, 1)],
  term ((-295959638135460375 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (16, 1)],
  term ((295959638135460375 : Rat) / 2771825814456705436) [(6, 1), (10, 2), (16, 1)],
  term ((295959638135460375 : Rat) / 2771825814456705436) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 4. -/
theorem ep_Q2_008_partial_04_0113_valid :
    mulPoly ep_Q2_008_coefficient_04_0113
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0114 : Poly :=
[
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 4. -/
def ep_Q2_008_partial_04_0114 : Poly :=
[
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 4. -/
theorem ep_Q2_008_partial_04_0114_valid :
    mulPoly ep_Q2_008_coefficient_04_0114
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0115 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(6, 2), (16, 1)]
]

/-- Partial product 115 for generator 4. -/
def ep_Q2_008_partial_04_0115 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(2, 2), (6, 2), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(3, 2), (6, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(6, 2), (10, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(6, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 4. -/
theorem ep_Q2_008_partial_04_0115_valid :
    mulPoly ep_Q2_008_coefficient_04_0115
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0116 : Poly :=
[
  term ((-35730349282845000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 116 for generator 4. -/
def ep_Q2_008_partial_04_0116 : Poly :=
[
  term ((-35730349282845000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-35730349282845000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((35730349282845000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 3), (16, 1)],
  term ((35730349282845000 : Rat) / 692956453614176359) [(7, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 4. -/
theorem ep_Q2_008_partial_04_0116_valid :
    mulPoly ep_Q2_008_coefficient_04_0116
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0117 : Poly :=
[
  term ((1742792922544147875 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 117 for generator 4. -/
def ep_Q2_008_partial_04_0117 : Poly :=
[
  term ((1742792922544147875 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((1742792922544147875 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1742792922544147875 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1742792922544147875 : Rat) / 1385912907228352718) [(7, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 4. -/
theorem ep_Q2_008_partial_04_0117_valid :
    mulPoly ep_Q2_008_coefficient_04_0117
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0118 : Poly :=
[
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 4. -/
def ep_Q2_008_partial_04_0118 : Poly :=
[
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 4. -/
theorem ep_Q2_008_partial_04_0118_valid :
    mulPoly ep_Q2_008_coefficient_04_0118
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0119 : Poly :=
[
  term ((-27579390401800167409503264509446618478700 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 4. -/
def ep_Q2_008_partial_04_0119 : Poly :=
[
  term ((-27579390401800167409503264509446618478700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-27579390401800167409503264509446618478700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((27579390401800167409503264509446618478700 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((27579390401800167409503264509446618478700 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 4. -/
theorem ep_Q2_008_partial_04_0119_valid :
    mulPoly ep_Q2_008_coefficient_04_0119
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0120 : Poly :=
[
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 4. -/
def ep_Q2_008_partial_04_0120 : Poly :=
[
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 4. -/
theorem ep_Q2_008_partial_04_0120_valid :
    mulPoly ep_Q2_008_coefficient_04_0120
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0121 : Poly :=
[
  term ((-205897031479004625 : Rat) / 692956453614176359) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 121 for generator 4. -/
def ep_Q2_008_partial_04_0121 : Poly :=
[
  term ((-205897031479004625 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-205897031479004625 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((205897031479004625 : Rat) / 692956453614176359) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((205897031479004625 : Rat) / 692956453614176359) [(7, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 4. -/
theorem ep_Q2_008_partial_04_0121_valid :
    mulPoly ep_Q2_008_coefficient_04_0121
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0122 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 122 for generator 4. -/
def ep_Q2_008_partial_04_0122 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (11, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 4. -/
theorem ep_Q2_008_partial_04_0122_valid :
    mulPoly ep_Q2_008_coefficient_04_0122
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0123 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 4. -/
def ep_Q2_008_partial_04_0123 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 4. -/
theorem ep_Q2_008_partial_04_0123_valid :
    mulPoly ep_Q2_008_coefficient_04_0123
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0124 : Poly :=
[
  term ((-158790912802190857260504007646921136000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 4. -/
def ep_Q2_008_partial_04_0124 : Poly :=
[
  term ((-158790912802190857260504007646921136000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-158790912802190857260504007646921136000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((158790912802190857260504007646921136000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((158790912802190857260504007646921136000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 4. -/
theorem ep_Q2_008_partial_04_0124_valid :
    mulPoly ep_Q2_008_coefficient_04_0124
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0125 : Poly :=
[
  term ((489685135114639251 : Rat) / 1385912907228352718) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 125 for generator 4. -/
def ep_Q2_008_partial_04_0125 : Poly :=
[
  term ((489685135114639251 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((489685135114639251 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-489685135114639251 : Rat) / 1385912907228352718) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-489685135114639251 : Rat) / 1385912907228352718) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 4. -/
theorem ep_Q2_008_partial_04_0125_valid :
    mulPoly ep_Q2_008_coefficient_04_0125
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0126 : Poly :=
[
  term ((-44292019249488362900733100348796357078103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 4. -/
def ep_Q2_008_partial_04_0126 : Poly :=
[
  term ((-44292019249488362900733100348796357078103 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44292019249488362900733100348796357078103 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((44292019249488362900733100348796357078103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((44292019249488362900733100348796357078103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 4. -/
theorem ep_Q2_008_partial_04_0126_valid :
    mulPoly ep_Q2_008_coefficient_04_0126
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0127 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 4. -/
def ep_Q2_008_partial_04_0127 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 2), (13, 3), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 4. -/
theorem ep_Q2_008_partial_04_0127_valid :
    mulPoly ep_Q2_008_coefficient_04_0127
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0128 : Poly :=
[
  term ((-39922212321247683200230031677871680496925 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 4. -/
def ep_Q2_008_partial_04_0128 : Poly :=
[
  term ((-39922212321247683200230031677871680496925 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-39922212321247683200230031677871680496925 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((39922212321247683200230031677871680496925 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((39922212321247683200230031677871680496925 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 4. -/
theorem ep_Q2_008_partial_04_0128_valid :
    mulPoly ep_Q2_008_coefficient_04_0128
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0129 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 4. -/
def ep_Q2_008_partial_04_0129 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 4. -/
theorem ep_Q2_008_partial_04_0129_valid :
    mulPoly ep_Q2_008_coefficient_04_0129
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0130 : Poly :=
[
  term ((1676325160914741464498489505341966572800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 4. -/
def ep_Q2_008_partial_04_0130 : Poly :=
[
  term ((1676325160914741464498489505341966572800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1676325160914741464498489505341966572800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1676325160914741464498489505341966572800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1676325160914741464498489505341966572800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 4. -/
theorem ep_Q2_008_partial_04_0130_valid :
    mulPoly ep_Q2_008_coefficient_04_0130
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0131 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 131 for generator 4. -/
def ep_Q2_008_partial_04_0131 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 2), (13, 2), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 4. -/
theorem ep_Q2_008_partial_04_0131_valid :
    mulPoly ep_Q2_008_coefficient_04_0131
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0132 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(7, 2), (16, 1)]
]

/-- Partial product 132 for generator 4. -/
def ep_Q2_008_partial_04_0132 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(2, 2), (7, 2), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(3, 2), (7, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(7, 2), (10, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 4. -/
theorem ep_Q2_008_partial_04_0132_valid :
    mulPoly ep_Q2_008_coefficient_04_0132
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0133 : Poly :=
[
  term ((-11354230986311300733 : Rat) / 5543651628913410872) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 133 for generator 4. -/
def ep_Q2_008_partial_04_0133 : Poly :=
[
  term ((-11354230986311300733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-11354230986311300733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((11354230986311300733 : Rat) / 5543651628913410872) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((11354230986311300733 : Rat) / 5543651628913410872) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 4. -/
theorem ep_Q2_008_partial_04_0133_valid :
    mulPoly ep_Q2_008_coefficient_04_0133
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0134 : Poly :=
[
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 134 for generator 4. -/
def ep_Q2_008_partial_04_0134 : Poly :=
[
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 4. -/
theorem ep_Q2_008_partial_04_0134_valid :
    mulPoly ep_Q2_008_coefficient_04_0134
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0135 : Poly :=
[
  term ((20887558139098227483 : Rat) / 5543651628913410872) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 135 for generator 4. -/
def ep_Q2_008_partial_04_0135 : Poly :=
[
  term ((20887558139098227483 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((20887558139098227483 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-20887558139098227483 : Rat) / 5543651628913410872) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-20887558139098227483 : Rat) / 5543651628913410872) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 4. -/
theorem ep_Q2_008_partial_04_0135_valid :
    mulPoly ep_Q2_008_coefficient_04_0135
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0136 : Poly :=
[
  term ((768685291431110956925087460611282668800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 4. -/
def ep_Q2_008_partial_04_0136 : Poly :=
[
  term ((768685291431110956925087460611282668800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((768685291431110956925087460611282668800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-768685291431110956925087460611282668800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((-768685291431110956925087460611282668800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 4. -/
theorem ep_Q2_008_partial_04_0136_valid :
    mulPoly ep_Q2_008_coefficient_04_0136
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0137 : Poly :=
[
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 4. -/
def ep_Q2_008_partial_04_0137 : Poly :=
[
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 4. -/
theorem ep_Q2_008_partial_04_0137_valid :
    mulPoly ep_Q2_008_coefficient_04_0137
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0138 : Poly :=
[
  term ((-419449361310191123479702418646065616000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 4. -/
def ep_Q2_008_partial_04_0138 : Poly :=
[
  term ((-419449361310191123479702418646065616000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-419449361310191123479702418646065616000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((419449361310191123479702418646065616000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((419449361310191123479702418646065616000 : Rat) / 84353800925664757687870414129491527348999) [(10, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 4. -/
theorem ep_Q2_008_partial_04_0138_valid :
    mulPoly ep_Q2_008_coefficient_04_0138
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0139 : Poly :=
[
  term ((-9966709572387035733 : Rat) / 11087303257826821744) [(10, 1), (16, 1)]
]

/-- Partial product 139 for generator 4. -/
def ep_Q2_008_partial_04_0139 : Poly :=
[
  term ((-9966709572387035733 : Rat) / 11087303257826821744) [(2, 2), (10, 1), (16, 1)],
  term ((-9966709572387035733 : Rat) / 11087303257826821744) [(3, 2), (10, 1), (16, 1)],
  term ((9966709572387035733 : Rat) / 11087303257826821744) [(10, 1), (11, 2), (16, 1)],
  term ((9966709572387035733 : Rat) / 11087303257826821744) [(10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 4. -/
theorem ep_Q2_008_partial_04_0139_valid :
    mulPoly ep_Q2_008_coefficient_04_0139
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0140 : Poly :=
[
  term ((515700953587329750 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 140 for generator 4. -/
def ep_Q2_008_partial_04_0140 : Poly :=
[
  term ((515700953587329750 : Rat) / 692956453614176359) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(11, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 4. -/
theorem ep_Q2_008_partial_04_0140_valid :
    mulPoly ep_Q2_008_coefficient_04_0140
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0141 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 141 for generator 4. -/
def ep_Q2_008_partial_04_0141 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 4. -/
theorem ep_Q2_008_partial_04_0141_valid :
    mulPoly ep_Q2_008_coefficient_04_0141
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0142 : Poly :=
[
  term ((-491880720732099750 : Rat) / 692956453614176359) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 142 for generator 4. -/
def ep_Q2_008_partial_04_0142 : Poly :=
[
  term ((-491880720732099750 : Rat) / 692956453614176359) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-491880720732099750 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((491880720732099750 : Rat) / 692956453614176359) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((491880720732099750 : Rat) / 692956453614176359) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 4. -/
theorem ep_Q2_008_partial_04_0142_valid :
    mulPoly ep_Q2_008_coefficient_04_0142
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0143 : Poly :=
[
  term ((-128412506386672727015569037734234718534700 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 4. -/
def ep_Q2_008_partial_04_0143 : Poly :=
[
  term ((-128412506386672727015569037734234718534700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-128412506386672727015569037734234718534700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((128412506386672727015569037734234718534700 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((128412506386672727015569037734234718534700 : Rat) / 84353800925664757687870414129491527348999) [(11, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 4. -/
theorem ep_Q2_008_partial_04_0143_valid :
    mulPoly ep_Q2_008_coefficient_04_0143
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0144 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 144 for generator 4. -/
def ep_Q2_008_partial_04_0144 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 4. -/
theorem ep_Q2_008_partial_04_0144_valid :
    mulPoly ep_Q2_008_coefficient_04_0144
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0145 : Poly :=
[
  term ((62528111244978750 : Rat) / 692956453614176359) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 4. -/
def ep_Q2_008_partial_04_0145 : Poly :=
[
  term ((62528111244978750 : Rat) / 692956453614176359) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((62528111244978750 : Rat) / 692956453614176359) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-62528111244978750 : Rat) / 692956453614176359) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-62528111244978750 : Rat) / 692956453614176359) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 4. -/
theorem ep_Q2_008_partial_04_0145_valid :
    mulPoly ep_Q2_008_coefficient_04_0145
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0146 : Poly :=
[
  term ((33915301221980565495608307339658872915000 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 4. -/
def ep_Q2_008_partial_04_0146 : Poly :=
[
  term ((33915301221980565495608307339658872915000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33915301221980565495608307339658872915000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33915301221980565495608307339658872915000 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-33915301221980565495608307339658872915000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 4. -/
theorem ep_Q2_008_partial_04_0146_valid :
    mulPoly ep_Q2_008_coefficient_04_0146
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0147 : Poly :=
[
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 147 for generator 4. -/
def ep_Q2_008_partial_04_0147 : Poly :=
[
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 4. -/
theorem ep_Q2_008_partial_04_0147_valid :
    mulPoly ep_Q2_008_coefficient_04_0147
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0148 : Poly :=
[
  term ((-16476868068834389733 : Rat) / 11087303257826821744) [(12, 1), (16, 1)]
]

/-- Partial product 148 for generator 4. -/
def ep_Q2_008_partial_04_0148 : Poly :=
[
  term ((-16476868068834389733 : Rat) / 11087303257826821744) [(2, 2), (12, 1), (16, 1)],
  term ((-16476868068834389733 : Rat) / 11087303257826821744) [(3, 2), (12, 1), (16, 1)],
  term ((16476868068834389733 : Rat) / 11087303257826821744) [(10, 2), (12, 1), (16, 1)],
  term ((16476868068834389733 : Rat) / 11087303257826821744) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 4. -/
theorem ep_Q2_008_partial_04_0148_valid :
    mulPoly ep_Q2_008_coefficient_04_0148
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0149 : Poly :=
[
  term ((-111484012337006441937416210821707417648825 : Rat) / 337415203702659030751481656517966109395996) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 4. -/
def ep_Q2_008_partial_04_0149 : Poly :=
[
  term ((-111484012337006441937416210821707417648825 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-111484012337006441937416210821707417648825 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((111484012337006441937416210821707417648825 : Rat) / 337415203702659030751481656517966109395996) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((111484012337006441937416210821707417648825 : Rat) / 337415203702659030751481656517966109395996) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 4. -/
theorem ep_Q2_008_partial_04_0149_valid :
    mulPoly ep_Q2_008_coefficient_04_0149
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0150 : Poly :=
[
  term ((476529716482049265005946973687618896000 : Rat) / 84353800925664757687870414129491527348999) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 150 for generator 4. -/
def ep_Q2_008_partial_04_0150 : Poly :=
[
  term ((476529716482049265005946973687618896000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((476529716482049265005946973687618896000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-476529716482049265005946973687618896000 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((-476529716482049265005946973687618896000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 4. -/
theorem ep_Q2_008_partial_04_0150_valid :
    mulPoly ep_Q2_008_coefficient_04_0150
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0151 : Poly :=
[
  term ((-68080415949846768764593011514415968364400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 4. -/
def ep_Q2_008_partial_04_0151 : Poly :=
[
  term ((-68080415949846768764593011514415968364400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((-68080415949846768764593011514415968364400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((68080415949846768764593011514415968364400 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((68080415949846768764593011514415968364400 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 4. -/
theorem ep_Q2_008_partial_04_0151_valid :
    mulPoly ep_Q2_008_coefficient_04_0151
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0152 : Poly :=
[
  term ((-952696076513587875 : Rat) / 1385912907228352718) [(13, 2), (16, 1)]
]

/-- Partial product 152 for generator 4. -/
def ep_Q2_008_partial_04_0152 : Poly :=
[
  term ((-952696076513587875 : Rat) / 1385912907228352718) [(2, 2), (13, 2), (16, 1)],
  term ((-952696076513587875 : Rat) / 1385912907228352718) [(3, 2), (13, 2), (16, 1)],
  term ((952696076513587875 : Rat) / 1385912907228352718) [(10, 2), (13, 2), (16, 1)],
  term ((952696076513587875 : Rat) / 1385912907228352718) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 4. -/
theorem ep_Q2_008_partial_04_0152_valid :
    mulPoly ep_Q2_008_coefficient_04_0152
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0153 : Poly :=
[
  term ((-456330594457466399707790950877070297600 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 153 for generator 4. -/
def ep_Q2_008_partial_04_0153 : Poly :=
[
  term ((-456330594457466399707790950877070297600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 3), (15, 1), (16, 1)],
  term ((-456330594457466399707790950877070297600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 3), (15, 1), (16, 1)],
  term ((456330594457466399707790950877070297600 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (13, 3), (15, 1), (16, 1)],
  term ((456330594457466399707790950877070297600 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 4. -/
theorem ep_Q2_008_partial_04_0153_valid :
    mulPoly ep_Q2_008_coefficient_04_0153
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0154 : Poly :=
[
  term ((-129717108962904319273579793112848556615375 : Rat) / 337415203702659030751481656517966109395996) [(15, 2), (16, 1)]
]

/-- Partial product 154 for generator 4. -/
def ep_Q2_008_partial_04_0154 : Poly :=
[
  term ((-129717108962904319273579793112848556615375 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (15, 2), (16, 1)],
  term ((-129717108962904319273579793112848556615375 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (15, 2), (16, 1)],
  term ((129717108962904319273579793112848556615375 : Rat) / 337415203702659030751481656517966109395996) [(10, 2), (15, 2), (16, 1)],
  term ((129717108962904319273579793112848556615375 : Rat) / 337415203702659030751481656517966109395996) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 4. -/
theorem ep_Q2_008_partial_04_0154_valid :
    mulPoly ep_Q2_008_coefficient_04_0154
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 4. -/
def ep_Q2_008_coefficient_04_0155 : Poly :=
[
  term ((-7136991946966395483 : Rat) / 11087303257826821744) [(16, 1)]
]

/-- Partial product 155 for generator 4. -/
def ep_Q2_008_partial_04_0155 : Poly :=
[
  term ((-7136991946966395483 : Rat) / 11087303257826821744) [(2, 2), (16, 1)],
  term ((-7136991946966395483 : Rat) / 11087303257826821744) [(3, 2), (16, 1)],
  term ((7136991946966395483 : Rat) / 11087303257826821744) [(10, 2), (16, 1)],
  term ((7136991946966395483 : Rat) / 11087303257826821744) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 4. -/
theorem ep_Q2_008_partial_04_0155_valid :
    mulPoly ep_Q2_008_coefficient_04_0155
        ep_Q2_008_generator_04_0100_0155 =
      ep_Q2_008_partial_04_0155 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_04_0100_0155 : List Poly :=
[
  ep_Q2_008_partial_04_0100,
  ep_Q2_008_partial_04_0101,
  ep_Q2_008_partial_04_0102,
  ep_Q2_008_partial_04_0103,
  ep_Q2_008_partial_04_0104,
  ep_Q2_008_partial_04_0105,
  ep_Q2_008_partial_04_0106,
  ep_Q2_008_partial_04_0107,
  ep_Q2_008_partial_04_0108,
  ep_Q2_008_partial_04_0109,
  ep_Q2_008_partial_04_0110,
  ep_Q2_008_partial_04_0111,
  ep_Q2_008_partial_04_0112,
  ep_Q2_008_partial_04_0113,
  ep_Q2_008_partial_04_0114,
  ep_Q2_008_partial_04_0115,
  ep_Q2_008_partial_04_0116,
  ep_Q2_008_partial_04_0117,
  ep_Q2_008_partial_04_0118,
  ep_Q2_008_partial_04_0119,
  ep_Q2_008_partial_04_0120,
  ep_Q2_008_partial_04_0121,
  ep_Q2_008_partial_04_0122,
  ep_Q2_008_partial_04_0123,
  ep_Q2_008_partial_04_0124,
  ep_Q2_008_partial_04_0125,
  ep_Q2_008_partial_04_0126,
  ep_Q2_008_partial_04_0127,
  ep_Q2_008_partial_04_0128,
  ep_Q2_008_partial_04_0129,
  ep_Q2_008_partial_04_0130,
  ep_Q2_008_partial_04_0131,
  ep_Q2_008_partial_04_0132,
  ep_Q2_008_partial_04_0133,
  ep_Q2_008_partial_04_0134,
  ep_Q2_008_partial_04_0135,
  ep_Q2_008_partial_04_0136,
  ep_Q2_008_partial_04_0137,
  ep_Q2_008_partial_04_0138,
  ep_Q2_008_partial_04_0139,
  ep_Q2_008_partial_04_0140,
  ep_Q2_008_partial_04_0141,
  ep_Q2_008_partial_04_0142,
  ep_Q2_008_partial_04_0143,
  ep_Q2_008_partial_04_0144,
  ep_Q2_008_partial_04_0145,
  ep_Q2_008_partial_04_0146,
  ep_Q2_008_partial_04_0147,
  ep_Q2_008_partial_04_0148,
  ep_Q2_008_partial_04_0149,
  ep_Q2_008_partial_04_0150,
  ep_Q2_008_partial_04_0151,
  ep_Q2_008_partial_04_0152,
  ep_Q2_008_partial_04_0153,
  ep_Q2_008_partial_04_0154,
  ep_Q2_008_partial_04_0155
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_04_0100_0155 : Poly :=
[
  term ((-1848532210371095162412798876416271781275 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(2, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (5, 2), (15, 2), (16, 1)],
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-173144211303063375 : Rat) / 692956453614176359) [(2, 2), (6, 1), (10, 1), (16, 1)],
  term ((-1742792922544147875 : Rat) / 1385912907228352718) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((17430635607359208072648074502772192373700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((35730349282845000 : Rat) / 692956453614176359) [(2, 2), (6, 1), (11, 2), (16, 1)],
  term ((-23357868711748380515738092595827034095875 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-295959638135460375 : Rat) / 2771825814456705436) [(2, 2), (6, 1), (16, 1)],
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(2, 2), (6, 2), (16, 1)],
  term ((-35730349282845000 : Rat) / 692956453614176359) [(2, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((1742792922544147875 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27579390401800167409503264509446618478700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-205897031479004625 : Rat) / 692956453614176359) [(2, 2), (7, 1), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(2, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-158790912802190857260504007646921136000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((489685135114639251 : Rat) / 1385912907228352718) [(2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-44292019249488362900733100348796357078103 : Rat) / 168707601851329515375740828258983054697998) [(2, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-39922212321247683200230031677871680496925 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1676325160914741464498489505341966572800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(2, 2), (7, 2), (16, 1)],
  term ((-11354230986311300733 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((20887558139098227483 : Rat) / 5543651628913410872) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((768685291431110956925087460611282668800 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-419449361310191123479702418646065616000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9966709572387035733 : Rat) / 11087303257826821744) [(2, 2), (10, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-491880720732099750 : Rat) / 692956453614176359) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-128412506386672727015569037734234718534700 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((62528111244978750 : Rat) / 692956453614176359) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((33915301221980565495608307339658872915000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-16476868068834389733 : Rat) / 11087303257826821744) [(2, 2), (12, 1), (16, 1)],
  term ((-111484012337006441937416210821707417648825 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((476529716482049265005946973687618896000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((-68080415949846768764593011514415968364400 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 2), (15, 2), (16, 1)],
  term ((-952696076513587875 : Rat) / 1385912907228352718) [(2, 2), (13, 2), (16, 1)],
  term ((-456330594457466399707790950877070297600 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 3), (15, 1), (16, 1)],
  term ((-129717108962904319273579793112848556615375 : Rat) / 337415203702659030751481656517966109395996) [(2, 2), (15, 2), (16, 1)],
  term ((-7136991946966395483 : Rat) / 11087303257826821744) [(2, 2), (16, 1)],
  term ((-1848532210371095162412798876416271781275 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(3, 2), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-173144211303063375 : Rat) / 692956453614176359) [(3, 2), (6, 1), (10, 1), (16, 1)],
  term ((-1742792922544147875 : Rat) / 1385912907228352718) [(3, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((17430635607359208072648074502772192373700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((35730349282845000 : Rat) / 692956453614176359) [(3, 2), (6, 1), (11, 2), (16, 1)],
  term ((-23357868711748380515738092595827034095875 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-295959638135460375 : Rat) / 2771825814456705436) [(3, 2), (6, 1), (16, 1)],
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(3, 2), (6, 2), (16, 1)],
  term ((-35730349282845000 : Rat) / 692956453614176359) [(3, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((1742792922544147875 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-27579390401800167409503264509446618478700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-205897031479004625 : Rat) / 692956453614176359) [(3, 2), (7, 1), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 2771825814456705436) [(3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-158790912802190857260504007646921136000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((489685135114639251 : Rat) / 1385912907228352718) [(3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-44292019249488362900733100348796357078103 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-39922212321247683200230031677871680496925 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1676325160914741464498489505341966572800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((346288422606126750 : Rat) / 692956453614176359) [(3, 2), (7, 2), (16, 1)],
  term ((-11354230986311300733 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((20887558139098227483 : Rat) / 5543651628913410872) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((768685291431110956925087460611282668800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-419449361310191123479702418646065616000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9966709572387035733 : Rat) / 11087303257826821744) [(3, 2), (10, 1), (16, 1)],
  term ((515700953587329750 : Rat) / 692956453614176359) [(3, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-491880720732099750 : Rat) / 692956453614176359) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-128412506386672727015569037734234718534700 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((62528111244978750 : Rat) / 692956453614176359) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((33915301221980565495608307339658872915000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-16476868068834389733 : Rat) / 11087303257826821744) [(3, 2), (12, 1), (16, 1)],
  term ((-111484012337006441937416210821707417648825 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((476529716482049265005946973687618896000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-68080415949846768764593011514415968364400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-952696076513587875 : Rat) / 1385912907228352718) [(3, 2), (13, 2), (16, 1)],
  term ((-456330594457466399707790950877070297600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 3), (15, 1), (16, 1)],
  term ((-129717108962904319273579793112848556615375 : Rat) / 337415203702659030751481656517966109395996) [(3, 2), (15, 2), (16, 1)],
  term ((-7136991946966395483 : Rat) / 11087303257826821744) [(3, 2), (16, 1)],
  term ((1848532210371095162412798876416271781275 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((1848532210371095162412798876416271781275 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (10, 2), (15, 2), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((173144211303063375 : Rat) / 692956453614176359) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((1742792922544147875 : Rat) / 1385912907228352718) [(6, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17430635607359208072648074502772192373700 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-35730349282845000 : Rat) / 692956453614176359) [(6, 1), (10, 2), (11, 2), (16, 1)],
  term ((23357868711748380515738092595827034095875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((295959638135460375 : Rat) / 2771825814456705436) [(6, 1), (10, 2), (16, 1)],
  term ((838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 3), (13, 1), (15, 1), (16, 1)],
  term ((173144211303063375 : Rat) / 692956453614176359) [(6, 1), (10, 3), (16, 1)],
  term ((23357868711748380515738092595827034095875 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-29288232546467947710010875230829295141800 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((295959638135460375 : Rat) / 2771825814456705436) [(6, 1), (11, 2), (16, 1)],
  term ((1742792922544147875 : Rat) / 1385912907228352718) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((-239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 3), (13, 2), (15, 1), (16, 1)],
  term ((-17430635607359208072648074502772192373700 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-35730349282845000 : Rat) / 692956453614176359) [(6, 1), (11, 4), (16, 1)],
  term ((-1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(6, 2), (10, 2), (16, 1)],
  term ((-1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(6, 2), (11, 2), (16, 1)],
  term ((-1742792922544147875 : Rat) / 1385912907228352718) [(7, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((27579390401800167409503264509446618478700 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((35730349282845000 : Rat) / 692956453614176359) [(7, 1), (10, 1), (11, 3), (16, 1)],
  term ((838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((205897031479004625 : Rat) / 692956453614176359) [(7, 1), (10, 2), (11, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((158790912802190857260504007646921136000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-489685135114639251 : Rat) / 1385912907228352718) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((44292019249488362900733100348796357078103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 2), (13, 3), (15, 2), (16, 1)],
  term ((39922212321247683200230031677871680496925 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((35730349282845000 : Rat) / 692956453614176359) [(7, 1), (10, 3), (11, 1), (16, 1)],
  term ((-1742792922544147875 : Rat) / 1385912907228352718) [(7, 1), (10, 3), (13, 1), (16, 1)],
  term ((239030311382482399846938117126084441600 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 3), (13, 2), (15, 1), (16, 1)],
  term ((27579390401800167409503264509446618478700 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (10, 3), (15, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(7, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((158790912802190857260504007646921136000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-489685135114639251 : Rat) / 1385912907228352718) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((44292019249488362900733100348796357078103 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 2), (13, 3), (15, 2), (16, 1)],
  term ((39922212321247683200230031677871680496925 : Rat) / 337415203702659030751481656517966109395996) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((838898722620382246959404837292131232000 : Rat) / 84353800925664757687870414129491527348999) [(7, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((205897031479004625 : Rat) / 692956453614176359) [(7, 1), (11, 3), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1676325160914741464498489505341966572800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 2), (13, 2), (15, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(7, 2), (10, 2), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1676325160914741464498489505341966572800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(7, 2), (11, 2), (16, 1)],
  term ((11354230986311300733 : Rat) / 5543651628913410872) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-20887558139098227483 : Rat) / 5543651628913410872) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-768685291431110956925087460611282668800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-20887558139098227483 : Rat) / 5543651628913410872) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-768685291431110956925087460611282668800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((11354230986311300733 : Rat) / 5543651628913410872) [(9, 1), (11, 3), (16, 1)],
  term ((419449361310191123479702418646065616000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((9966709572387035733 : Rat) / 11087303257826821744) [(10, 1), (11, 2), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(10, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((491880720732099750 : Rat) / 692956453614176359) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term ((128412506386672727015569037734234718534700 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(10, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-62528111244978750 : Rat) / 692956453614176359) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-33915301221980565495608307339658872915000 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((16476868068834389733 : Rat) / 11087303257826821744) [(10, 2), (12, 1), (16, 1)],
  term ((111484012337006441937416210821707417648825 : Rat) / 337415203702659030751481656517966109395996) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-476529716482049265005946973687618896000 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((68080415949846768764593011514415968364400 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((952696076513587875 : Rat) / 1385912907228352718) [(10, 2), (13, 2), (16, 1)],
  term ((456330594457466399707790950877070297600 : Rat) / 84353800925664757687870414129491527348999) [(10, 2), (13, 3), (15, 1), (16, 1)],
  term ((129717108962904319273579793112848556615375 : Rat) / 337415203702659030751481656517966109395996) [(10, 2), (15, 2), (16, 1)],
  term ((7136991946966395483 : Rat) / 11087303257826821744) [(10, 2), (16, 1)],
  term ((419449361310191123479702418646065616000 : Rat) / 84353800925664757687870414129491527348999) [(10, 3), (13, 1), (15, 1), (16, 1)],
  term ((9966709572387035733 : Rat) / 11087303257826821744) [(10, 3), (16, 1)],
  term ((-33915301221980565495608307339658872915000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17402796511602633322184841712682400 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((16476868068834389733 : Rat) / 11087303257826821744) [(11, 2), (12, 1), (16, 1)],
  term ((111484012337006441937416210821707417648825 : Rat) / 337415203702659030751481656517966109395996) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-476529716482049265005946973687618896000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((68080415949846768764593011514415968364400 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((952696076513587875 : Rat) / 1385912907228352718) [(11, 2), (13, 2), (16, 1)],
  term ((456330594457466399707790950877070297600 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 3), (15, 1), (16, 1)],
  term ((129717108962904319273579793112848556615375 : Rat) / 337415203702659030751481656517966109395996) [(11, 2), (15, 2), (16, 1)],
  term ((7136991946966395483 : Rat) / 11087303257826821744) [(11, 2), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(11, 3), (12, 1), (13, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(11, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((491880720732099750 : Rat) / 692956453614176359) [(11, 3), (13, 1), (16, 1)],
  term ((128412506386672727015569037734234718534700 : Rat) / 84353800925664757687870414129491527348999) [(11, 3), (13, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 3), (13, 3), (15, 2), (16, 1)],
  term ((-62528111244978750 : Rat) / 692956453614176359) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 100 through 155. -/
theorem ep_Q2_008_block_04_0100_0155_valid :
    checkProductSumEq ep_Q2_008_partials_04_0100_0155
      ep_Q2_008_block_04_0100_0155 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
