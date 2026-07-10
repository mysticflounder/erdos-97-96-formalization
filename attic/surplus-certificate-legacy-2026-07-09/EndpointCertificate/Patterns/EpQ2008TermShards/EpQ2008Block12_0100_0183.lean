/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 12:100-183

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 12 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_12_0100_0183 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0100 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 100 for generator 12. -/
def ep_Q2_008_partial_12_0100 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 3), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 2), (10, 1), (13, 3), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (13, 3), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 2), (7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 12. -/
theorem ep_Q2_008_partial_12_0100_valid :
    mulPoly ep_Q2_008_coefficient_12_0100
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0101 : Poly :=
[
  term ((-427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 12. -/
def ep_Q2_008_partial_12_0101 : Poly :=
[
  term ((-855696896323730156389740661899223257600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-855696896323730156389740661899223257600 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 12. -/
theorem ep_Q2_008_partial_12_0101_valid :
    mulPoly ep_Q2_008_coefficient_12_0101
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0102 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 102 for generator 12. -/
def ep_Q2_008_partial_12_0102 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (7, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 12. -/
theorem ep_Q2_008_partial_12_0102_valid :
    mulPoly ep_Q2_008_coefficient_12_0102
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0103 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 103 for generator 12. -/
def ep_Q2_008_partial_12_0103 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 12. -/
theorem ep_Q2_008_partial_12_0103_valid :
    mulPoly ep_Q2_008_coefficient_12_0103
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0104 : Poly :=
[
  term ((11910116427615000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 104 for generator 12. -/
def ep_Q2_008_partial_12_0104 : Poly :=
[
  term ((23820232855230000 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 12. -/
theorem ep_Q2_008_partial_12_0104_valid :
    mulPoly ep_Q2_008_coefficient_12_0104
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0105 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 12. -/
def ep_Q2_008_partial_12_0105 : Poly :=
[
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 12. -/
theorem ep_Q2_008_partial_12_0105_valid :
    mulPoly ep_Q2_008_coefficient_12_0105
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0106 : Poly :=
[
  term ((13173063711564428265 : Rat) / 2771825814456705436) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 106 for generator 12. -/
def ep_Q2_008_partial_12_0106 : Poly :=
[
  term ((13173063711564428265 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-13173063711564428265 : Rat) / 2771825814456705436) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-13173063711564428265 : Rat) / 2771825814456705436) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((13173063711564428265 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 12. -/
theorem ep_Q2_008_partial_12_0106_valid :
    mulPoly ep_Q2_008_coefficient_12_0106
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0107 : Poly :=
[
  term ((-1310062603113932827899805426735711956789414 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 12. -/
def ep_Q2_008_partial_12_0107 : Poly :=
[
  term ((-2620125206227865655799610853471423913578828 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((1310062603113932827899805426735711956789414 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((1310062603113932827899805426735711956789414 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-2620125206227865655799610853471423913578828 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 12. -/
theorem ep_Q2_008_partial_12_0107_valid :
    mulPoly ep_Q2_008_coefficient_12_0107
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0108 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (13, 3), (16, 1)]
]

/-- Partial product 108 for generator 12. -/
def ep_Q2_008_partial_12_0108 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 2), (13, 3), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (7, 2), (13, 3), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 12. -/
theorem ep_Q2_008_partial_12_0108_valid :
    mulPoly ep_Q2_008_coefficient_12_0108
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0109 : Poly :=
[
  term ((-629519541242425917985976534251027319803149 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 12. -/
def ep_Q2_008_partial_12_0109 : Poly :=
[
  term ((-629519541242425917985976534251027319803149 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((629519541242425917985976534251027319803149 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((629519541242425917985976534251027319803149 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-629519541242425917985976534251027319803149 : Rat) / 337415203702659030751481656517966109395996) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 12. -/
theorem ep_Q2_008_partial_12_0109_valid :
    mulPoly ep_Q2_008_coefficient_12_0109
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0110 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 12. -/
def ep_Q2_008_partial_12_0110 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 3), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 12. -/
theorem ep_Q2_008_partial_12_0110_valid :
    mulPoly ep_Q2_008_coefficient_12_0110
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0111 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 12. -/
def ep_Q2_008_partial_12_0111 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 3), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 12. -/
theorem ep_Q2_008_partial_12_0111_valid :
    mulPoly ep_Q2_008_coefficient_12_0111
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0112 : Poly :=
[
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 12. -/
def ep_Q2_008_partial_12_0112 : Poly :=
[
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 12. -/
theorem ep_Q2_008_partial_12_0112_valid :
    mulPoly ep_Q2_008_coefficient_12_0112
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0113 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 113 for generator 12. -/
def ep_Q2_008_partial_12_0113 : Poly :=
[
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 12. -/
theorem ep_Q2_008_partial_12_0113_valid :
    mulPoly ep_Q2_008_coefficient_12_0113
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0114 : Poly :=
[
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 114 for generator 12. -/
def ep_Q2_008_partial_12_0114 : Poly :=
[
  term ((9249340331398466862 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(6, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(7, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 12. -/
theorem ep_Q2_008_partial_12_0114_valid :
    mulPoly ep_Q2_008_coefficient_12_0114
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0115 : Poly :=
[
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 12. -/
def ep_Q2_008_partial_12_0115 : Poly :=
[
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 12. -/
theorem ep_Q2_008_partial_12_0115_valid :
    mulPoly ep_Q2_008_coefficient_12_0115
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0116 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 116 for generator 12. -/
def ep_Q2_008_partial_12_0116 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (13, 3), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(6, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 3), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 12. -/
theorem ep_Q2_008_partial_12_0116_valid :
    mulPoly ep_Q2_008_coefficient_12_0116
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0117 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (10, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 12. -/
def ep_Q2_008_partial_12_0117 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 12. -/
theorem ep_Q2_008_partial_12_0117_valid :
    mulPoly ep_Q2_008_coefficient_12_0117
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0118 : Poly :=
[
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 12. -/
def ep_Q2_008_partial_12_0118 : Poly :=
[
  term ((180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 12. -/
theorem ep_Q2_008_partial_12_0118_valid :
    mulPoly ep_Q2_008_coefficient_12_0118
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0119 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 119 for generator 12. -/
def ep_Q2_008_partial_12_0119 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(5, 1), (7, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(6, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 3), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 12. -/
theorem ep_Q2_008_partial_12_0119_valid :
    mulPoly ep_Q2_008_coefficient_12_0119
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0120 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 12. -/
def ep_Q2_008_partial_12_0120 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 12. -/
theorem ep_Q2_008_partial_12_0120_valid :
    mulPoly ep_Q2_008_coefficient_12_0120
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0121 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 12. -/
def ep_Q2_008_partial_12_0121 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 12. -/
theorem ep_Q2_008_partial_12_0121_valid :
    mulPoly ep_Q2_008_coefficient_12_0121
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0122 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 122 for generator 12. -/
def ep_Q2_008_partial_12_0122 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(6, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 12. -/
theorem ep_Q2_008_partial_12_0122_valid :
    mulPoly ep_Q2_008_coefficient_12_0122
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0123 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 123 for generator 12. -/
def ep_Q2_008_partial_12_0123 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 12. -/
theorem ep_Q2_008_partial_12_0123_valid :
    mulPoly ep_Q2_008_coefficient_12_0123
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0124 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 124 for generator 12. -/
def ep_Q2_008_partial_12_0124 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(6, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 12. -/
theorem ep_Q2_008_partial_12_0124_valid :
    mulPoly ep_Q2_008_coefficient_12_0124
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0125 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 12. -/
def ep_Q2_008_partial_12_0125 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 12. -/
theorem ep_Q2_008_partial_12_0125_valid :
    mulPoly ep_Q2_008_coefficient_12_0125
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0126 : Poly :=
[
  term ((68589878930914045841459616923956800 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 126 for generator 12. -/
def ep_Q2_008_partial_12_0126 : Poly :=
[
  term ((137179757861828091682919233847913600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((137179757861828091682919233847913600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-68589878930914045841459616923956800 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68589878930914045841459616923956800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 12. -/
theorem ep_Q2_008_partial_12_0126_valid :
    mulPoly ep_Q2_008_coefficient_12_0126
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0127 : Poly :=
[
  term ((-3448052429063870577 : Rat) / 1385912907228352718) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 127 for generator 12. -/
def ep_Q2_008_partial_12_0127 : Poly :=
[
  term ((-3448052429063870577 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-3448052429063870577 : Rat) / 692956453614176359) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 12. -/
theorem ep_Q2_008_partial_12_0127_valid :
    mulPoly ep_Q2_008_coefficient_12_0127
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0128 : Poly :=
[
  term ((44212524302177419025459394308982803241303 : Rat) / 168707601851329515375740828258983054697998) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 12. -/
def ep_Q2_008_partial_12_0128 : Poly :=
[
  term ((44212524302177419025459394308982803241303 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((44212524302177419025459394308982803241303 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-44212524302177419025459394308982803241303 : Rat) / 168707601851329515375740828258983054697998) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-44212524302177419025459394308982803241303 : Rat) / 168707601851329515375740828258983054697998) [(7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 12. -/
theorem ep_Q2_008_partial_12_0128_valid :
    mulPoly ep_Q2_008_coefficient_12_0128
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0129 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 129 for generator 12. -/
def ep_Q2_008_partial_12_0129 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 12. -/
theorem ep_Q2_008_partial_12_0129_valid :
    mulPoly ep_Q2_008_coefficient_12_0129
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0130 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 130 for generator 12. -/
def ep_Q2_008_partial_12_0130 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(5, 1), (7, 2), (13, 3), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(6, 2), (7, 1), (13, 3), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 12. -/
theorem ep_Q2_008_partial_12_0130_valid :
    mulPoly ep_Q2_008_coefficient_12_0130
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0131 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 12. -/
def ep_Q2_008_partial_12_0131 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 12. -/
theorem ep_Q2_008_partial_12_0131_valid :
    mulPoly ep_Q2_008_coefficient_12_0131
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0132 : Poly :=
[
  term ((223588744262086415523792234111809818925989 : Rat) / 674830407405318061502963313035932218791992) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 12. -/
def ep_Q2_008_partial_12_0132 : Poly :=
[
  term ((223588744262086415523792234111809818925989 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((223588744262086415523792234111809818925989 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-223588744262086415523792234111809818925989 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-223588744262086415523792234111809818925989 : Rat) / 674830407405318061502963313035932218791992) [(7, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 12. -/
theorem ep_Q2_008_partial_12_0132_valid :
    mulPoly ep_Q2_008_coefficient_12_0132
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0133 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 12. -/
def ep_Q2_008_partial_12_0133 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 12. -/
theorem ep_Q2_008_partial_12_0133_valid :
    mulPoly ep_Q2_008_coefficient_12_0133
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0134 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 12. -/
def ep_Q2_008_partial_12_0134 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 12. -/
theorem ep_Q2_008_partial_12_0134_valid :
    mulPoly ep_Q2_008_coefficient_12_0134
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0135 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 12. -/
def ep_Q2_008_partial_12_0135 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 12. -/
theorem ep_Q2_008_partial_12_0135_valid :
    mulPoly ep_Q2_008_coefficient_12_0135
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0136 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 12. -/
def ep_Q2_008_partial_12_0136 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 12. -/
theorem ep_Q2_008_partial_12_0136_valid :
    mulPoly ep_Q2_008_coefficient_12_0136
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0137 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 12. -/
def ep_Q2_008_partial_12_0137 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 12. -/
theorem ep_Q2_008_partial_12_0137_valid :
    mulPoly ep_Q2_008_coefficient_12_0137
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0138 : Poly :=
[
  term ((-115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 12. -/
def ep_Q2_008_partial_12_0138 : Poly :=
[
  term ((-231964986305441682093988753049664000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-231964986305441682093988753049664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 12. -/
theorem ep_Q2_008_partial_12_0138_valid :
    mulPoly ep_Q2_008_coefficient_12_0138
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0139 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 139 for generator 12. -/
def ep_Q2_008_partial_12_0139 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 12. -/
theorem ep_Q2_008_partial_12_0139_valid :
    mulPoly ep_Q2_008_coefficient_12_0139
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0140 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 12. -/
def ep_Q2_008_partial_12_0140 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 12. -/
theorem ep_Q2_008_partial_12_0140_valid :
    mulPoly ep_Q2_008_coefficient_12_0140
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0141 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 141 for generator 12. -/
def ep_Q2_008_partial_12_0141 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 12. -/
theorem ep_Q2_008_partial_12_0141_valid :
    mulPoly ep_Q2_008_coefficient_12_0141
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0142 : Poly :=
[
  term ((41685407496652500 : Rat) / 692956453614176359) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 142 for generator 12. -/
def ep_Q2_008_partial_12_0142 : Poly :=
[
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 12. -/
theorem ep_Q2_008_partial_12_0142_valid :
    mulPoly ep_Q2_008_coefficient_12_0142
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0143 : Poly :=
[
  term ((-32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 143 for generator 12. -/
def ep_Q2_008_partial_12_0143 : Poly :=
[
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 12. -/
theorem ep_Q2_008_partial_12_0143_valid :
    mulPoly ep_Q2_008_coefficient_12_0143
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0144 : Poly :=
[
  term ((-2315584888450340175 : Rat) / 2771825814456705436) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 12. -/
def ep_Q2_008_partial_12_0144 : Poly :=
[
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 12. -/
theorem ep_Q2_008_partial_12_0144_valid :
    mulPoly ep_Q2_008_coefficient_12_0144
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0145 : Poly :=
[
  term ((-123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 12. -/
def ep_Q2_008_partial_12_0145 : Poly :=
[
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 12. -/
theorem ep_Q2_008_partial_12_0145_valid :
    mulPoly ep_Q2_008_coefficient_12_0145
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0146 : Poly :=
[
  term ((7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 12. -/
def ep_Q2_008_partial_12_0146 : Poly :=
[
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 12. -/
theorem ep_Q2_008_partial_12_0146_valid :
    mulPoly ep_Q2_008_coefficient_12_0146
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0147 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 147 for generator 12. -/
def ep_Q2_008_partial_12_0147 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 12. -/
theorem ep_Q2_008_partial_12_0147_valid :
    mulPoly ep_Q2_008_coefficient_12_0147
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0148 : Poly :=
[
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 148 for generator 12. -/
def ep_Q2_008_partial_12_0148 : Poly :=
[
  term ((3830163888954054375 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 12. -/
theorem ep_Q2_008_partial_12_0148_valid :
    mulPoly ep_Q2_008_coefficient_12_0148
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0149 : Poly :=
[
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 12. -/
def ep_Q2_008_partial_12_0149 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 12. -/
theorem ep_Q2_008_partial_12_0149_valid :
    mulPoly ep_Q2_008_coefficient_12_0149
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0150 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 150 for generator 12. -/
def ep_Q2_008_partial_12_0150 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 2), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 12. -/
theorem ep_Q2_008_partial_12_0150_valid :
    mulPoly ep_Q2_008_coefficient_12_0150
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0151 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 12. -/
def ep_Q2_008_partial_12_0151 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 12. -/
theorem ep_Q2_008_partial_12_0151_valid :
    mulPoly ep_Q2_008_coefficient_12_0151
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0152 : Poly :=
[
  term ((-1615453079391623472694314323432553395858121 : Rat) / 337415203702659030751481656517966109395996) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 12. -/
def ep_Q2_008_partial_12_0152 : Poly :=
[
  term ((-1615453079391623472694314323432553395858121 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1615453079391623472694314323432553395858121 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1615453079391623472694314323432553395858121 : Rat) / 337415203702659030751481656517966109395996) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1615453079391623472694314323432553395858121 : Rat) / 337415203702659030751481656517966109395996) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 12. -/
theorem ep_Q2_008_partial_12_0152_valid :
    mulPoly ep_Q2_008_coefficient_12_0152
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0153 : Poly :=
[
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 153 for generator 12. -/
def ep_Q2_008_partial_12_0153 : Poly :=
[
  term ((1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 12. -/
theorem ep_Q2_008_partial_12_0153_valid :
    mulPoly ep_Q2_008_coefficient_12_0153
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0154 : Poly :=
[
  term ((-32460362833291968321 : Rat) / 1385912907228352718) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 154 for generator 12. -/
def ep_Q2_008_partial_12_0154 : Poly :=
[
  term ((-32460362833291968321 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-32460362833291968321 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((32460362833291968321 : Rat) / 1385912907228352718) [(6, 2), (10, 1), (13, 2), (16, 1)],
  term ((32460362833291968321 : Rat) / 1385912907228352718) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 12. -/
theorem ep_Q2_008_partial_12_0154_valid :
    mulPoly ep_Q2_008_coefficient_12_0154
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0155 : Poly :=
[
  term ((10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 12. -/
def ep_Q2_008_partial_12_0155 : Poly :=
[
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 12. -/
theorem ep_Q2_008_partial_12_0155_valid :
    mulPoly ep_Q2_008_coefficient_12_0155
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0156 : Poly :=
[
  term ((-257258514836484000 : Rat) / 692956453614176359) [(10, 1), (16, 1)]
]

/-- Partial product 156 for generator 12. -/
def ep_Q2_008_partial_12_0156 : Poly :=
[
  term ((-514517029672968000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(6, 2), (10, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 12. -/
theorem ep_Q2_008_partial_12_0156_valid :
    mulPoly ep_Q2_008_coefficient_12_0156
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0157 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 2), (13, 2), (16, 1)]
]

/-- Partial product 157 for generator 12. -/
def ep_Q2_008_partial_12_0157 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 2), (13, 2), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 2), (13, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 2), (10, 2), (13, 2), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 2), (10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 12. -/
theorem ep_Q2_008_partial_12_0157_valid :
    mulPoly ep_Q2_008_coefficient_12_0157
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0158 : Poly :=
[
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 158 for generator 12. -/
def ep_Q2_008_partial_12_0158 : Poly :=
[
  term ((-1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 12. -/
theorem ep_Q2_008_partial_12_0158_valid :
    mulPoly ep_Q2_008_coefficient_12_0158
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0159 : Poly :=
[
  term ((32594263279974480321 : Rat) / 1385912907228352718) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 159 for generator 12. -/
def ep_Q2_008_partial_12_0159 : Poly :=
[
  term ((32594263279974480321 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((32594263279974480321 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32594263279974480321 : Rat) / 1385912907228352718) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32594263279974480321 : Rat) / 1385912907228352718) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 12. -/
theorem ep_Q2_008_partial_12_0159_valid :
    mulPoly ep_Q2_008_coefficient_12_0159
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0160 : Poly :=
[
  term ((-5059799732663222940603959137642142668800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 12. -/
def ep_Q2_008_partial_12_0160 : Poly :=
[
  term ((-10119599465326445881207918275284285337600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10119599465326445881207918275284285337600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5059799732663222940603959137642142668800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5059799732663222940603959137642142668800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 12. -/
theorem ep_Q2_008_partial_12_0160_valid :
    mulPoly ep_Q2_008_coefficient_12_0160
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0161 : Poly :=
[
  term ((1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 12. -/
def ep_Q2_008_partial_12_0161 : Poly :=
[
  term ((1051762241666102759812986055633265271626121 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1051762241666102759812986055633265271626121 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 12. -/
theorem ep_Q2_008_partial_12_0161_valid :
    mulPoly ep_Q2_008_coefficient_12_0161
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0162 : Poly :=
[
  term ((1025256291770634480324904383065808950400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 162 for generator 12. -/
def ep_Q2_008_partial_12_0162 : Poly :=
[
  term ((2050512583541268960649808766131617900800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2050512583541268960649808766131617900800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1025256291770634480324904383065808950400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1025256291770634480324904383065808950400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 12. -/
theorem ep_Q2_008_partial_12_0162_valid :
    mulPoly ep_Q2_008_coefficient_12_0162
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0163 : Poly :=
[
  term ((-2182986373634789625 : Rat) / 692956453614176359) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 163 for generator 12. -/
def ep_Q2_008_partial_12_0163 : Poly :=
[
  term ((-4365972747269579250 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4365972747269579250 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((2182986373634789625 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((2182986373634789625 : Rat) / 692956453614176359) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 12. -/
theorem ep_Q2_008_partial_12_0163_valid :
    mulPoly ep_Q2_008_coefficient_12_0163
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0164 : Poly :=
[
  term ((282925253228902119651065690544070868402400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 12. -/
def ep_Q2_008_partial_12_0164 : Poly :=
[
  term ((565850506457804239302131381088141736804800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((565850506457804239302131381088141736804800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-282925253228902119651065690544070868402400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-282925253228902119651065690544070868402400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 12. -/
theorem ep_Q2_008_partial_12_0164_valid :
    mulPoly ep_Q2_008_coefficient_12_0164
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0165 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 165 for generator 12. -/
def ep_Q2_008_partial_12_0165 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 12. -/
theorem ep_Q2_008_partial_12_0165_valid :
    mulPoly ep_Q2_008_coefficient_12_0165
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0166 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 166 for generator 12. -/
def ep_Q2_008_partial_12_0166 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 3), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(7, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 12. -/
theorem ep_Q2_008_partial_12_0166_valid :
    mulPoly ep_Q2_008_coefficient_12_0166
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0167 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 12. -/
def ep_Q2_008_partial_12_0167 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 12. -/
theorem ep_Q2_008_partial_12_0167_valid :
    mulPoly ep_Q2_008_coefficient_12_0167
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0168 : Poly :=
[
  term ((-43559866034559937213302593377145788497675 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 12. -/
def ep_Q2_008_partial_12_0168 : Poly :=
[
  term ((-43559866034559937213302593377145788497675 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43559866034559937213302593377145788497675 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((43559866034559937213302593377145788497675 : Rat) / 337415203702659030751481656517966109395996) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((43559866034559937213302593377145788497675 : Rat) / 337415203702659030751481656517966109395996) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 12. -/
theorem ep_Q2_008_partial_12_0168_valid :
    mulPoly ep_Q2_008_coefficient_12_0168
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0169 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 12. -/
def ep_Q2_008_partial_12_0169 : Poly :=
[
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 12. -/
theorem ep_Q2_008_partial_12_0169_valid :
    mulPoly ep_Q2_008_coefficient_12_0169
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0170 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(11, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 170 for generator 12. -/
def ep_Q2_008_partial_12_0170 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 2), (11, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 12. -/
theorem ep_Q2_008_partial_12_0170_valid :
    mulPoly ep_Q2_008_coefficient_12_0170
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0171 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 12. -/
def ep_Q2_008_partial_12_0171 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 12. -/
theorem ep_Q2_008_partial_12_0171_valid :
    mulPoly ep_Q2_008_coefficient_12_0171
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0172 : Poly :=
[
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 172 for generator 12. -/
def ep_Q2_008_partial_12_0172 : Poly :=
[
  term ((-3830163888954054375 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(7, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 12. -/
theorem ep_Q2_008_partial_12_0172_valid :
    mulPoly ep_Q2_008_coefficient_12_0172
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0173 : Poly :=
[
  term ((-2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 12. -/
def ep_Q2_008_partial_12_0173 : Poly :=
[
  term ((-5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 12. -/
theorem ep_Q2_008_partial_12_0173_valid :
    mulPoly ep_Q2_008_coefficient_12_0173
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0174 : Poly :=
[
  term ((-555162983192035125 : Rat) / 692956453614176359) [(11, 2), (16, 1)]
]

/-- Partial product 174 for generator 12. -/
def ep_Q2_008_partial_12_0174 : Poly :=
[
  term ((-1110325966384070250 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-1110325966384070250 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((555162983192035125 : Rat) / 692956453614176359) [(6, 2), (11, 2), (16, 1)],
  term ((555162983192035125 : Rat) / 692956453614176359) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 12. -/
theorem ep_Q2_008_partial_12_0174_valid :
    mulPoly ep_Q2_008_coefficient_12_0174
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0175 : Poly :=
[
  term ((7206545807758636307231947086727917619200 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 12. -/
def ep_Q2_008_partial_12_0175 : Poly :=
[
  term ((14413091615517272614463894173455835238400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14413091615517272614463894173455835238400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7206545807758636307231947086727917619200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7206545807758636307231947086727917619200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 12. -/
theorem ep_Q2_008_partial_12_0175_valid :
    mulPoly ep_Q2_008_coefficient_12_0175
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0176 : Poly :=
[
  term ((-409329367898796900 : Rat) / 692956453614176359) [(12, 1), (16, 1)]
]

/-- Partial product 176 for generator 12. -/
def ep_Q2_008_partial_12_0176 : Poly :=
[
  term ((-818658735797593800 : Rat) / 692956453614176359) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-818658735797593800 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((409329367898796900 : Rat) / 692956453614176359) [(6, 2), (12, 1), (16, 1)],
  term ((409329367898796900 : Rat) / 692956453614176359) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 12. -/
theorem ep_Q2_008_partial_12_0176_valid :
    mulPoly ep_Q2_008_coefficient_12_0176
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0177 : Poly :=
[
  term ((1032928267072699001729795052284727453139791 : Rat) / 674830407405318061502963313035932218791992) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 12. -/
def ep_Q2_008_partial_12_0177 : Poly :=
[
  term ((1032928267072699001729795052284727453139791 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1032928267072699001729795052284727453139791 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1032928267072699001729795052284727453139791 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1032928267072699001729795052284727453139791 : Rat) / 674830407405318061502963313035932218791992) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 12. -/
theorem ep_Q2_008_partial_12_0177_valid :
    mulPoly ep_Q2_008_coefficient_12_0177
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0178 : Poly :=
[
  term ((1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 178 for generator 12. -/
def ep_Q2_008_partial_12_0178 : Poly :=
[
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 12. -/
theorem ep_Q2_008_partial_12_0178_valid :
    mulPoly ep_Q2_008_coefficient_12_0178
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0179 : Poly :=
[
  term ((11224846111688635147959551382147111091200 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 179 for generator 12. -/
def ep_Q2_008_partial_12_0179 : Poly :=
[
  term ((22449692223377270295919102764294222182400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((22449692223377270295919102764294222182400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11224846111688635147959551382147111091200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-11224846111688635147959551382147111091200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 12. -/
theorem ep_Q2_008_partial_12_0179_valid :
    mulPoly ep_Q2_008_coefficient_12_0179
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0180 : Poly :=
[
  term ((5096103920250367791 : Rat) / 1385912907228352718) [(13, 2), (16, 1)]
]

/-- Partial product 180 for generator 12. -/
def ep_Q2_008_partial_12_0180 : Poly :=
[
  term ((5096103920250367791 : Rat) / 692956453614176359) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((5096103920250367791 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-5096103920250367791 : Rat) / 1385912907228352718) [(6, 2), (13, 2), (16, 1)],
  term ((-5096103920250367791 : Rat) / 1385912907228352718) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 12. -/
theorem ep_Q2_008_partial_12_0180_valid :
    mulPoly ep_Q2_008_coefficient_12_0180
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0181 : Poly :=
[
  term ((-3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 12. -/
def ep_Q2_008_partial_12_0181 : Poly :=
[
  term ((-6577608283822311738606861968574637056000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6577608283822311738606861968574637056000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 3), (15, 1), (16, 1)],
  term ((3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 12. -/
theorem ep_Q2_008_partial_12_0181_valid :
    mulPoly ep_Q2_008_coefficient_12_0181
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0182 : Poly :=
[
  term ((2316866900256753463235085726284326834650 : Rat) / 2908751756057405437512772901016949218931) [(15, 2), (16, 1)]
]

/-- Partial product 182 for generator 12. -/
def ep_Q2_008_partial_12_0182 : Poly :=
[
  term ((4633733800513506926470171452568653669300 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((4633733800513506926470171452568653669300 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2316866900256753463235085726284326834650 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (15, 2), (16, 1)],
  term ((-2316866900256753463235085726284326834650 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 12. -/
theorem ep_Q2_008_partial_12_0182_valid :
    mulPoly ep_Q2_008_coefficient_12_0182
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0183 : Poly :=
[
  term ((45053597210648750 : Rat) / 692956453614176359) [(16, 1)]
]

/-- Partial product 183 for generator 12. -/
def ep_Q2_008_partial_12_0183 : Poly :=
[
  term ((90107194421297500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (16, 1)],
  term ((90107194421297500 : Rat) / 692956453614176359) [(5, 1), (7, 1), (16, 1)],
  term ((-45053597210648750 : Rat) / 692956453614176359) [(6, 2), (16, 1)],
  term ((-45053597210648750 : Rat) / 692956453614176359) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 12. -/
theorem ep_Q2_008_partial_12_0183_valid :
    mulPoly ep_Q2_008_coefficient_12_0183
        ep_Q2_008_generator_12_0100_0183 =
      ep_Q2_008_partial_12_0183 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_12_0100_0183 : List Poly :=
[
  ep_Q2_008_partial_12_0100,
  ep_Q2_008_partial_12_0101,
  ep_Q2_008_partial_12_0102,
  ep_Q2_008_partial_12_0103,
  ep_Q2_008_partial_12_0104,
  ep_Q2_008_partial_12_0105,
  ep_Q2_008_partial_12_0106,
  ep_Q2_008_partial_12_0107,
  ep_Q2_008_partial_12_0108,
  ep_Q2_008_partial_12_0109,
  ep_Q2_008_partial_12_0110,
  ep_Q2_008_partial_12_0111,
  ep_Q2_008_partial_12_0112,
  ep_Q2_008_partial_12_0113,
  ep_Q2_008_partial_12_0114,
  ep_Q2_008_partial_12_0115,
  ep_Q2_008_partial_12_0116,
  ep_Q2_008_partial_12_0117,
  ep_Q2_008_partial_12_0118,
  ep_Q2_008_partial_12_0119,
  ep_Q2_008_partial_12_0120,
  ep_Q2_008_partial_12_0121,
  ep_Q2_008_partial_12_0122,
  ep_Q2_008_partial_12_0123,
  ep_Q2_008_partial_12_0124,
  ep_Q2_008_partial_12_0125,
  ep_Q2_008_partial_12_0126,
  ep_Q2_008_partial_12_0127,
  ep_Q2_008_partial_12_0128,
  ep_Q2_008_partial_12_0129,
  ep_Q2_008_partial_12_0130,
  ep_Q2_008_partial_12_0131,
  ep_Q2_008_partial_12_0132,
  ep_Q2_008_partial_12_0133,
  ep_Q2_008_partial_12_0134,
  ep_Q2_008_partial_12_0135,
  ep_Q2_008_partial_12_0136,
  ep_Q2_008_partial_12_0137,
  ep_Q2_008_partial_12_0138,
  ep_Q2_008_partial_12_0139,
  ep_Q2_008_partial_12_0140,
  ep_Q2_008_partial_12_0141,
  ep_Q2_008_partial_12_0142,
  ep_Q2_008_partial_12_0143,
  ep_Q2_008_partial_12_0144,
  ep_Q2_008_partial_12_0145,
  ep_Q2_008_partial_12_0146,
  ep_Q2_008_partial_12_0147,
  ep_Q2_008_partial_12_0148,
  ep_Q2_008_partial_12_0149,
  ep_Q2_008_partial_12_0150,
  ep_Q2_008_partial_12_0151,
  ep_Q2_008_partial_12_0152,
  ep_Q2_008_partial_12_0153,
  ep_Q2_008_partial_12_0154,
  ep_Q2_008_partial_12_0155,
  ep_Q2_008_partial_12_0156,
  ep_Q2_008_partial_12_0157,
  ep_Q2_008_partial_12_0158,
  ep_Q2_008_partial_12_0159,
  ep_Q2_008_partial_12_0160,
  ep_Q2_008_partial_12_0161,
  ep_Q2_008_partial_12_0162,
  ep_Q2_008_partial_12_0163,
  ep_Q2_008_partial_12_0164,
  ep_Q2_008_partial_12_0165,
  ep_Q2_008_partial_12_0166,
  ep_Q2_008_partial_12_0167,
  ep_Q2_008_partial_12_0168,
  ep_Q2_008_partial_12_0169,
  ep_Q2_008_partial_12_0170,
  ep_Q2_008_partial_12_0171,
  ep_Q2_008_partial_12_0172,
  ep_Q2_008_partial_12_0173,
  ep_Q2_008_partial_12_0174,
  ep_Q2_008_partial_12_0175,
  ep_Q2_008_partial_12_0176,
  ep_Q2_008_partial_12_0177,
  ep_Q2_008_partial_12_0178,
  ep_Q2_008_partial_12_0179,
  ep_Q2_008_partial_12_0180,
  ep_Q2_008_partial_12_0181,
  ep_Q2_008_partial_12_0182,
  ep_Q2_008_partial_12_0183
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_12_0100_0183 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 3), (16, 1)],
  term ((-855696896323730156389740661899223257600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((13173063711564428265 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-2620125206227865655799610853471423913578828 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-629519541242425917985976534251027319803149 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((137179757861828091682919233847913600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3448052429063870577 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((44212524302177419025459394308982803241303 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(4, 1), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((223588744262086415523792234111809818925989 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-231964986305441682093988753049664000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1615453079391623472694314323432553395858121 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-32460362833291968321 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (10, 2), (13, 2), (16, 1)],
  term ((-1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((32594263279974480321 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10119599465326445881207918275284285337600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1051762241666102759812986055633265271626121 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2050512583541268960649808766131617900800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4365972747269579250 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((565850506457804239302131381088141736804800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-43559866034559937213302593377145788497675 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1110325966384070250 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((14413091615517272614463894173455835238400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-818658735797593800 : Rat) / 692956453614176359) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term ((1032928267072699001729795052284727453139791 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((22449692223377270295919102764294222182400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((5096103920250367791 : Rat) / 692956453614176359) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-6577608283822311738606861968574637056000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((4633733800513506926470171452568653669300 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((90107194421297500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 2), (10, 1), (13, 3), (16, 1)],
  term ((427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(5, 1), (6, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(5, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-11910116427615000 : Rat) / 692956453614176359) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((10763972258504527974 : Rat) / 692956453614176359) [(5, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((-13173063711564428265 : Rat) / 2771825814456705436) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((1310062603113932827899805426735711956789414 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 1), (6, 2), (13, 3), (16, 1)],
  term ((629519541242425917985976534251027319803149 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((83370814993305000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-65144989867565479901745233906429184000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2315584888450340175 : Rat) / 1385912907228352718) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-247686246661537983796163737501030617600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((14101733902665438481833198704299528700100 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-1615453079391623472694314323432553395858121 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-32460362833291968321 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((21558147229296800814651749709232192358400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-514517029672968000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (10, 2), (13, 2), (16, 1)],
  term ((-1302899797351309598034904678128583680000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((32594263279974480321 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10119599465326445881207918275284285337600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1051762241666102759812986055633265271626121 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2050512583541268960649808766131617900800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4365972747269579250 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((565850506457804239302131381088141736804800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-43559866034559937213302593377145788497675 : Rat) / 168707601851329515375740828258983054697998) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-5033392335722293481756429023752787392000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1110325966384070250 : Rat) / 692956453614176359) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((14413091615517272614463894173455835238400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-818658735797593800 : Rat) / 692956453614176359) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term ((1032928267072699001729795052284727453139791 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((22449692223377270295919102764294222182400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((5096103920250367791 : Rat) / 692956453614176359) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-6577608283822311738606861968574637056000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((4633733800513506926470171452568653669300 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((90107194421297500 : Rat) / 692956453614176359) [(5, 1), (7, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((66773467462613457582 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (13, 3), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((180940767031058398568961627451392000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-66773467462613457582 : Rat) / 692956453614176359) [(5, 1), (7, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10455203680638529791 : Rat) / 2771825814456705436) [(5, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-65505640351882500 : Rat) / 692956453614176359) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((11128911243768909597 : Rat) / 692956453614176359) [(5, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((137179757861828091682919233847913600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-26965273427819910573 : Rat) / 2771825814456705436) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((1354275127416110246925264821044694760030717 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-22257822487537819194 : Rat) / 692956453614176359) [(5, 1), (7, 2), (13, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((1076697029766598749033561002474646957655127 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-231964986305441682093988753049664000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(5, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-855696896323730156389740661899223257600 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(5, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((13173063711564428265 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2620125206227865655799610853471423913578828 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(5, 2), (7, 1), (13, 3), (16, 1)],
  term ((-629519541242425917985976534251027319803149 : Rat) / 337415203702659030751481656517966109395996) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(6, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(6, 2), (7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(6, 2), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(6, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(6, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-68589878930914045841459616923956800 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-44212524302177419025459394308982803241303 : Rat) / 168707601851329515375740828258983054697998) [(6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(6, 2), (7, 1), (13, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-223588744262086415523792234111809818925989 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(6, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(6, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1615453079391623472694314323432553395858121 : Rat) / 337415203702659030751481656517966109395996) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((32460362833291968321 : Rat) / 1385912907228352718) [(6, 2), (10, 1), (13, 2), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(6, 2), (10, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(6, 2), (10, 2), (13, 2), (16, 1)],
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32594263279974480321 : Rat) / 1385912907228352718) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5059799732663222940603959137642142668800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1025256291770634480324904383065808950400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2182986373634789625 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-282925253228902119651065690544070868402400 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(6, 2), (11, 1), (13, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((43559866034559937213302593377145788497675 : Rat) / 337415203702659030751481656517966109395996) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(6, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((555162983192035125 : Rat) / 692956453614176359) [(6, 2), (11, 2), (16, 1)],
  term ((-7206545807758636307231947086727917619200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((409329367898796900 : Rat) / 692956453614176359) [(6, 2), (12, 1), (16, 1)],
  term ((-1032928267072699001729795052284727453139791 : Rat) / 674830407405318061502963313035932218791992) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 1), (15, 3), (16, 1)],
  term ((-11224846111688635147959551382147111091200 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5096103920250367791 : Rat) / 1385912907228352718) [(6, 2), (13, 2), (16, 1)],
  term ((3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(6, 2), (13, 3), (15, 1), (16, 1)],
  term ((-2316866900256753463235085726284326834650 : Rat) / 2908751756057405437512772901016949218931) [(6, 2), (15, 2), (16, 1)],
  term ((-45053597210648750 : Rat) / 692956453614176359) [(6, 2), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(6, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(6, 3), (13, 1), (15, 1), (16, 1)],
  term ((-41685407496652500 : Rat) / 692956453614176359) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((32572494933782739950872616953214592000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2315584888450340175 : Rat) / 2771825814456705436) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((123843123330768991898081868750515308800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-7050866951332719240916599352149764350050 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(7, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3830163888954054375 : Rat) / 1385912907228352718) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(7, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (10, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1615453079391623472694314323432553395858121 : Rat) / 337415203702659030751481656517966109395996) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((32460362833291968321 : Rat) / 1385912907228352718) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-10779073614648400407325874854616096179200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((257258514836484000 : Rat) / 692956453614176359) [(7, 2), (10, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(7, 2), (10, 2), (13, 2), (16, 1)],
  term ((651449898675654799017452339064291840000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32594263279974480321 : Rat) / 1385912907228352718) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5059799732663222940603959137642142668800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1051762241666102759812986055633265271626121 : Rat) / 337415203702659030751481656517966109395996) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1025256291770634480324904383065808950400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2182986373634789625 : Rat) / 692956453614176359) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-282925253228902119651065690544070868402400 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(7, 2), (11, 1), (13, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((43559866034559937213302593377145788497675 : Rat) / 337415203702659030751481656517966109395996) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(7, 2), (11, 2), (12, 1), (13, 2), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (11, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3830163888954054375 : Rat) / 1385912907228352718) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((2516696167861146740878214511876393696000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((555162983192035125 : Rat) / 692956453614176359) [(7, 2), (11, 2), (16, 1)],
  term ((-7206545807758636307231947086727917619200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((409329367898796900 : Rat) / 692956453614176359) [(7, 2), (12, 1), (16, 1)],
  term ((-1032928267072699001729795052284727453139791 : Rat) / 674830407405318061502963313035932218791992) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1677797445240764493918809674584262464000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 1), (15, 3), (16, 1)],
  term ((-11224846111688635147959551382147111091200 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-5096103920250367791 : Rat) / 1385912907228352718) [(7, 2), (13, 2), (16, 1)],
  term ((3288804141911155869303430984287318528000 : Rat) / 84353800925664757687870414129491527348999) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-2316866900256753463235085726284326834650 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)],
  term ((-45053597210648750 : Rat) / 692956453614176359) [(7, 2), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(7, 3), (10, 1), (13, 1), (16, 1)],
  term ((90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(7, 3), (10, 1), (13, 3), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((-90470383515529199284480813725696000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(7, 3), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 3), (11, 1), (12, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(7, 3), (11, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(7, 3), (12, 1), (13, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-68589878930914045841459616923956800 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 1), (15, 2), (16, 1)],
  term ((3448052429063870577 : Rat) / 1385912907228352718) [(7, 3), (13, 1), (16, 1)],
  term ((-44212524302177419025459394308982803241303 : Rat) / 168707601851329515375740828258983054697998) [(7, 3), (13, 2), (15, 1), (16, 1)],
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 3), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(7, 3), (13, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (13, 4), (15, 1), (16, 1)],
  term ((-223588744262086415523792234111809818925989 : Rat) / 674830407405318061502963313035932218791992) [(7, 3), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((115982493152720841046994376524832000 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 1), (15, 1), (16, 1)],
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 2), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (13, 3), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 100 through 183. -/
theorem ep_Q2_008_block_12_0100_0183_valid :
    checkProductSumEq ep_Q2_008_partials_12_0100_0183
      ep_Q2_008_block_12_0100_0183 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
