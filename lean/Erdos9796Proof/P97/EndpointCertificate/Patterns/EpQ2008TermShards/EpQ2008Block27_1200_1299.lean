/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:1200-1299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_1200_1299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1200 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1200 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1200 for generator 27. -/
def ep_Q2_008_partial_27_1200 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1200 for generator 27. -/
theorem ep_Q2_008_partial_27_1200_valid :
    mulPoly ep_Q2_008_coefficient_27_1200
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1200 := by
  native_decide

/-- Coefficient term 1201 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1201 : Poly :=
[
  term ((-41237350849231661131770157388550183622500 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1201 for generator 27. -/
def ep_Q2_008_partial_27_1201 : Poly :=
[
  term ((41237350849231661131770157388550183622500 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82474701698463322263540314777100367245000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1201 for generator 27. -/
theorem ep_Q2_008_partial_27_1201_valid :
    mulPoly ep_Q2_008_coefficient_27_1201
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1201 := by
  native_decide

/-- Coefficient term 1202 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1202 : Poly :=
[
  term ((-20618675424615830565885078694275091811250 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1202 for generator 27. -/
def ep_Q2_008_partial_27_1202 : Poly :=
[
  term ((-41237350849231661131770157388550183622500 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((20618675424615830565885078694275091811250 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1202 for generator 27. -/
theorem ep_Q2_008_partial_27_1202_valid :
    mulPoly ep_Q2_008_coefficient_27_1202
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1202 := by
  native_decide

/-- Coefficient term 1203 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1203 : Poly :=
[
  term ((-8103043384029627320145661541981094643200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1203 for generator 27. -/
def ep_Q2_008_partial_27_1203 : Poly :=
[
  term ((-16206086768059254640291323083962189286400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8103043384029627320145661541981094643200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1203 for generator 27. -/
theorem ep_Q2_008_partial_27_1203_valid :
    mulPoly ep_Q2_008_coefficient_27_1203
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1203 := by
  native_decide

/-- Coefficient term 1204 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1204 : Poly :=
[
  term ((45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1204 for generator 27. -/
def ep_Q2_008_partial_27_1204 : Poly :=
[
  term ((90509358110485524848330304051662417928000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1204 for generator 27. -/
theorem ep_Q2_008_partial_27_1204_valid :
    mulPoly ep_Q2_008_coefficient_27_1204
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1204 := by
  native_decide

/-- Coefficient term 1205 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1205 : Poly :=
[
  term ((10904462326114517187 : Rat) / 2771825814456705436) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 1205 for generator 27. -/
def ep_Q2_008_partial_27_1205 : Poly :=
[
  term ((10904462326114517187 : Rat) / 1385912907228352718) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-10904462326114517187 : Rat) / 2771825814456705436) [(3, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1205 for generator 27. -/
theorem ep_Q2_008_partial_27_1205_valid :
    mulPoly ep_Q2_008_coefficient_27_1205
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1205 := by
  native_decide

/-- Coefficient term 1206 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1206 : Poly :=
[
  term ((4051521692014813660072830770990547321600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1206 for generator 27. -/
def ep_Q2_008_partial_27_1206 : Poly :=
[
  term ((-4051521692014813660072830770990547321600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8103043384029627320145661541981094643200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1206 for generator 27. -/
theorem ep_Q2_008_partial_27_1206_valid :
    mulPoly ep_Q2_008_coefficient_27_1206
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1206 := by
  native_decide

/-- Coefficient term 1207 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1207 : Poly :=
[
  term ((2025760846007406830036415385495273660800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1207 for generator 27. -/
def ep_Q2_008_partial_27_1207 : Poly :=
[
  term ((4051521692014813660072830770990547321600 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2025760846007406830036415385495273660800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1207 for generator 27. -/
theorem ep_Q2_008_partial_27_1207_valid :
    mulPoly ep_Q2_008_coefficient_27_1207
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1207 := by
  native_decide

/-- Coefficient term 1208 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1208 : Poly :=
[
  term ((-22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1208 for generator 27. -/
def ep_Q2_008_partial_27_1208 : Poly :=
[
  term ((22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1208 for generator 27. -/
theorem ep_Q2_008_partial_27_1208_valid :
    mulPoly ep_Q2_008_coefficient_27_1208
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1208 := by
  native_decide

/-- Coefficient term 1209 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1209 : Poly :=
[
  term ((-7296051961747042737 : Rat) / 5543651628913410872) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 1209 for generator 27. -/
def ep_Q2_008_partial_27_1209 : Poly :=
[
  term ((7296051961747042737 : Rat) / 5543651628913410872) [(3, 2), (14, 1), (16, 1)],
  term ((-7296051961747042737 : Rat) / 2771825814456705436) [(3, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1209 for generator 27. -/
theorem ep_Q2_008_partial_27_1209_valid :
    mulPoly ep_Q2_008_coefficient_27_1209
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1209 := by
  native_decide

/-- Coefficient term 1210 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1210 : Poly :=
[
  term ((-11313669763810690606041288006457802241000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 1210 for generator 27. -/
def ep_Q2_008_partial_27_1210 : Poly :=
[
  term ((-22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((11313669763810690606041288006457802241000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1210 for generator 27. -/
theorem ep_Q2_008_partial_27_1210_valid :
    mulPoly ep_Q2_008_coefficient_27_1210
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1210 := by
  native_decide

/-- Coefficient term 1211 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1211 : Poly :=
[
  term ((-7296051961747042737 : Rat) / 11087303257826821744) [(3, 2), (16, 1)]
]

/-- Partial product 1211 for generator 27. -/
def ep_Q2_008_partial_27_1211 : Poly :=
[
  term ((-7296051961747042737 : Rat) / 5543651628913410872) [(3, 2), (14, 1), (16, 1)],
  term ((7296051961747042737 : Rat) / 11087303257826821744) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1211 for generator 27. -/
theorem ep_Q2_008_partial_27_1211_valid :
    mulPoly ep_Q2_008_coefficient_27_1211
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1211 := by
  native_decide

/-- Coefficient term 1212 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1212 : Poly :=
[
  term ((-32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1212 for generator 27. -/
def ep_Q2_008_partial_27_1212 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1212 for generator 27. -/
theorem ep_Q2_008_partial_27_1212_valid :
    mulPoly ep_Q2_008_coefficient_27_1212
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1212 := by
  native_decide

/-- Coefficient term 1213 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1213 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1213 for generator 27. -/
def ep_Q2_008_partial_27_1213 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1213 for generator 27. -/
theorem ep_Q2_008_partial_27_1213_valid :
    mulPoly ep_Q2_008_coefficient_27_1213
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1213 := by
  native_decide

/-- Coefficient term 1214 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1214 : Poly :=
[
  term ((-961469961954879622127994647833507200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1214 for generator 27. -/
def ep_Q2_008_partial_27_1214 : Poly :=
[
  term ((-1922939923909759244255989295667014400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((961469961954879622127994647833507200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1214 for generator 27. -/
theorem ep_Q2_008_partial_27_1214_valid :
    mulPoly ep_Q2_008_coefficient_27_1214
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1214 := by
  native_decide

/-- Coefficient term 1215 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1215 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1215 for generator 27. -/
def ep_Q2_008_partial_27_1215 : Poly :=
[
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1215 for generator 27. -/
theorem ep_Q2_008_partial_27_1215_valid :
    mulPoly ep_Q2_008_coefficient_27_1215
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1215 := by
  native_decide

/-- Coefficient term 1216 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1216 : Poly :=
[
  term ((-613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1216 for generator 27. -/
def ep_Q2_008_partial_27_1216 : Poly :=
[
  term ((-1226277582276114977087235029615884800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1216 for generator 27. -/
theorem ep_Q2_008_partial_27_1216_valid :
    mulPoly ep_Q2_008_coefficient_27_1216
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1216 := by
  native_decide

/-- Coefficient term 1217 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1217 : Poly :=
[
  term ((-1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1217 for generator 27. -/
def ep_Q2_008_partial_27_1217 : Poly :=
[
  term ((-2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1217 for generator 27. -/
theorem ep_Q2_008_partial_27_1217_valid :
    mulPoly ep_Q2_008_coefficient_27_1217
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1217 := by
  native_decide

/-- Coefficient term 1218 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1218 : Poly :=
[
  term ((8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1218 for generator 27. -/
def ep_Q2_008_partial_27_1218 : Poly :=
[
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1218 for generator 27. -/
theorem ep_Q2_008_partial_27_1218_valid :
    mulPoly ep_Q2_008_coefficient_27_1218
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1218 := by
  native_decide

/-- Coefficient term 1219 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1219 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1219 for generator 27. -/
def ep_Q2_008_partial_27_1219 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1219 for generator 27. -/
theorem ep_Q2_008_partial_27_1219_valid :
    mulPoly ep_Q2_008_coefficient_27_1219
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1219 := by
  native_decide

/-- Coefficient term 1220 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1220 : Poly :=
[
  term ((55998744082268408396398503674409600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1220 for generator 27. -/
def ep_Q2_008_partial_27_1220 : Poly :=
[
  term ((-55998744082268408396398503674409600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((111997488164536816792797007348819200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1220 for generator 27. -/
theorem ep_Q2_008_partial_27_1220_valid :
    mulPoly ep_Q2_008_coefficient_27_1220
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1220 := by
  native_decide

/-- Coefficient term 1221 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1221 : Poly :=
[
  term ((27999372041134204198199251837204800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1221 for generator 27. -/
def ep_Q2_008_partial_27_1221 : Poly :=
[
  term ((55998744082268408396398503674409600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27999372041134204198199251837204800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1221 for generator 27. -/
theorem ep_Q2_008_partial_27_1221_valid :
    mulPoly ep_Q2_008_coefficient_27_1221
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1221 := by
  native_decide

/-- Coefficient term 1222 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1222 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1222 for generator 27. -/
def ep_Q2_008_partial_27_1222 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1222 for generator 27. -/
theorem ep_Q2_008_partial_27_1222_valid :
    mulPoly ep_Q2_008_coefficient_27_1222
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1222 := by
  native_decide

/-- Coefficient term 1223 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1223 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1223 for generator 27. -/
def ep_Q2_008_partial_27_1223 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1223 for generator 27. -/
theorem ep_Q2_008_partial_27_1223_valid :
    mulPoly ep_Q2_008_coefficient_27_1223
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1223 := by
  native_decide

/-- Coefficient term 1224 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1224 : Poly :=
[
  term ((613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1224 for generator 27. -/
def ep_Q2_008_partial_27_1224 : Poly :=
[
  term ((-613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1226277582276114977087235029615884800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1224 for generator 27. -/
theorem ep_Q2_008_partial_27_1224_valid :
    mulPoly ep_Q2_008_coefficient_27_1224
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1224 := by
  native_decide

/-- Coefficient term 1225 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1225 : Poly :=
[
  term ((306569395569028744271808757403971200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1225 for generator 27. -/
def ep_Q2_008_partial_27_1225 : Poly :=
[
  term ((613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-306569395569028744271808757403971200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1225 for generator 27. -/
theorem ep_Q2_008_partial_27_1225_valid :
    mulPoly ep_Q2_008_coefficient_27_1225
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1225 := by
  native_decide

/-- Coefficient term 1226 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1226 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1226 for generator 27. -/
def ep_Q2_008_partial_27_1226 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1226 for generator 27. -/
theorem ep_Q2_008_partial_27_1226_valid :
    mulPoly ep_Q2_008_coefficient_27_1226
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1226 := by
  native_decide

/-- Coefficient term 1227 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1227 : Poly :=
[
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1227 for generator 27. -/
def ep_Q2_008_partial_27_1227 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1227 for generator 27. -/
theorem ep_Q2_008_partial_27_1227_valid :
    mulPoly ep_Q2_008_coefficient_27_1227
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1227 := by
  native_decide

/-- Coefficient term 1228 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1228 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1228 for generator 27. -/
def ep_Q2_008_partial_27_1228 : Poly :=
[
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1228 for generator 27. -/
theorem ep_Q2_008_partial_27_1228_valid :
    mulPoly ep_Q2_008_coefficient_27_1228
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1228 := by
  native_decide

/-- Coefficient term 1229 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1229 : Poly :=
[
  term ((-2542369482124567025349 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1229 for generator 27. -/
def ep_Q2_008_partial_27_1229 : Poly :=
[
  term ((-2542369482124567025349 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2542369482124567025349 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1229 for generator 27. -/
theorem ep_Q2_008_partial_27_1229_valid :
    mulPoly ep_Q2_008_coefficient_27_1229
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1229 := by
  native_decide

/-- Coefficient term 1230 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1230 : Poly :=
[
  term ((-102257736455793015753 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1230 for generator 27. -/
def ep_Q2_008_partial_27_1230 : Poly :=
[
  term ((-204515472911586031506 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((102257736455793015753 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1230 for generator 27. -/
theorem ep_Q2_008_partial_27_1230_valid :
    mulPoly ep_Q2_008_coefficient_27_1230
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1230 := by
  native_decide

/-- Coefficient term 1231 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1231 : Poly :=
[
  term ((-242189375816351879415 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (16, 1)]
]

/-- Partial product 1231 for generator 27. -/
def ep_Q2_008_partial_27_1231 : Poly :=
[
  term ((-484378751632703758830 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((242189375816351879415 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1231 for generator 27. -/
theorem ep_Q2_008_partial_27_1231_valid :
    mulPoly ep_Q2_008_coefficient_27_1231
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1231 := by
  native_decide

/-- Coefficient term 1232 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1232 : Poly :=
[
  term ((12525414675047893253206982086047601171677117 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1232 for generator 27. -/
def ep_Q2_008_partial_27_1232 : Poly :=
[
  term ((12525414675047893253206982086047601171677117 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12525414675047893253206982086047601171677117 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1232 for generator 27. -/
theorem ep_Q2_008_partial_27_1232_valid :
    mulPoly ep_Q2_008_coefficient_27_1232
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1232 := by
  native_decide

/-- Coefficient term 1233 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1233 : Poly :=
[
  term ((10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1233 for generator 27. -/
def ep_Q2_008_partial_27_1233 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1233 for generator 27. -/
theorem ep_Q2_008_partial_27_1233_valid :
    mulPoly ep_Q2_008_coefficient_27_1233
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1233 := by
  native_decide

/-- Coefficient term 1234 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1234 : Poly :=
[
  term ((69328828898298509187 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1234 for generator 27. -/
def ep_Q2_008_partial_27_1234 : Poly :=
[
  term ((-69328828898298509187 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((69328828898298509187 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1234 for generator 27. -/
theorem ep_Q2_008_partial_27_1234_valid :
    mulPoly ep_Q2_008_coefficient_27_1234
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1234 := by
  native_decide

/-- Coefficient term 1235 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1235 : Poly :=
[
  term ((69328828898298509187 : Rat) / 22174606515653643488) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 1235 for generator 27. -/
def ep_Q2_008_partial_27_1235 : Poly :=
[
  term ((69328828898298509187 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-69328828898298509187 : Rat) / 22174606515653643488) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1235 for generator 27. -/
theorem ep_Q2_008_partial_27_1235_valid :
    mulPoly ep_Q2_008_coefficient_27_1235
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1235 := by
  native_decide

/-- Coefficient term 1236 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1236 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1236 for generator 27. -/
def ep_Q2_008_partial_27_1236 : Poly :=
[
  term ((-43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1236 for generator 27. -/
theorem ep_Q2_008_partial_27_1236_valid :
    mulPoly ep_Q2_008_coefficient_27_1236
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1236 := by
  native_decide

/-- Coefficient term 1237 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1237 : Poly :=
[
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1237 for generator 27. -/
def ep_Q2_008_partial_27_1237 : Poly :=
[
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1237 for generator 27. -/
theorem ep_Q2_008_partial_27_1237_valid :
    mulPoly ep_Q2_008_coefficient_27_1237
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1237 := by
  native_decide

/-- Coefficient term 1238 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1238 : Poly :=
[
  term ((102257736455793015753 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1238 for generator 27. -/
def ep_Q2_008_partial_27_1238 : Poly :=
[
  term ((-102257736455793015753 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((204515472911586031506 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1238 for generator 27. -/
theorem ep_Q2_008_partial_27_1238_valid :
    mulPoly ep_Q2_008_coefficient_27_1238
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1238 := by
  native_decide

/-- Coefficient term 1239 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1239 : Poly :=
[
  term ((102257736455793015753 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 1239 for generator 27. -/
def ep_Q2_008_partial_27_1239 : Poly :=
[
  term ((102257736455793015753 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-102257736455793015753 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1239 for generator 27. -/
theorem ep_Q2_008_partial_27_1239_valid :
    mulPoly ep_Q2_008_coefficient_27_1239
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1239 := by
  native_decide

/-- Coefficient term 1240 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1240 : Poly :=
[
  term ((-225661004596937731563489029682542400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1240 for generator 27. -/
def ep_Q2_008_partial_27_1240 : Poly :=
[
  term ((-451322009193875463126978059365084800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((225661004596937731563489029682542400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1240 for generator 27. -/
theorem ep_Q2_008_partial_27_1240_valid :
    mulPoly ep_Q2_008_coefficient_27_1240
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1240 := by
  native_decide

/-- Coefficient term 1241 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1241 : Poly :=
[
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1241 for generator 27. -/
def ep_Q2_008_partial_27_1241 : Poly :=
[
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1241 for generator 27. -/
theorem ep_Q2_008_partial_27_1241_valid :
    mulPoly ep_Q2_008_coefficient_27_1241
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1241 := by
  native_decide

/-- Coefficient term 1242 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1242 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1242 for generator 27. -/
def ep_Q2_008_partial_27_1242 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1242 for generator 27. -/
theorem ep_Q2_008_partial_27_1242_valid :
    mulPoly ep_Q2_008_coefficient_27_1242
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1242 := by
  native_decide

/-- Coefficient term 1243 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1243 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1243 for generator 27. -/
def ep_Q2_008_partial_27_1243 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1243 for generator 27. -/
theorem ep_Q2_008_partial_27_1243_valid :
    mulPoly ep_Q2_008_coefficient_27_1243
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1243 := by
  native_decide

/-- Coefficient term 1244 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1244 : Poly :=
[
  term ((38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1244 for generator 27. -/
def ep_Q2_008_partial_27_1244 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1244 for generator 27. -/
theorem ep_Q2_008_partial_27_1244_valid :
    mulPoly ep_Q2_008_coefficient_27_1244
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1244 := by
  native_decide

/-- Coefficient term 1245 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1245 : Poly :=
[
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1245 for generator 27. -/
def ep_Q2_008_partial_27_1245 : Poly :=
[
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1245 for generator 27. -/
theorem ep_Q2_008_partial_27_1245_valid :
    mulPoly ep_Q2_008_coefficient_27_1245
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1245 := by
  native_decide

/-- Coefficient term 1246 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1246 : Poly :=
[
  term ((-3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1246 for generator 27. -/
def ep_Q2_008_partial_27_1246 : Poly :=
[
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1246 for generator 27. -/
theorem ep_Q2_008_partial_27_1246_valid :
    mulPoly ep_Q2_008_coefficient_27_1246
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1246 := by
  native_decide

/-- Coefficient term 1247 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1247 : Poly :=
[
  term ((-80393285886401250 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1247 for generator 27. -/
def ep_Q2_008_partial_27_1247 : Poly :=
[
  term ((-160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((80393285886401250 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1247 for generator 27. -/
theorem ep_Q2_008_partial_27_1247_valid :
    mulPoly ep_Q2_008_coefficient_27_1247
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1247 := by
  native_decide

/-- Coefficient term 1248 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1248 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1248 for generator 27. -/
def ep_Q2_008_partial_27_1248 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1248 for generator 27. -/
theorem ep_Q2_008_partial_27_1248_valid :
    mulPoly ep_Q2_008_coefficient_27_1248
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1248 := by
  native_decide

/-- Coefficient term 1249 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1249 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1249 for generator 27. -/
def ep_Q2_008_partial_27_1249 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1249 for generator 27. -/
theorem ep_Q2_008_partial_27_1249_valid :
    mulPoly ep_Q2_008_coefficient_27_1249
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1249 := by
  native_decide

/-- Coefficient term 1250 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1250 : Poly :=
[
  term ((13398880981066875 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1250 for generator 27. -/
def ep_Q2_008_partial_27_1250 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13398880981066875 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1250 for generator 27. -/
theorem ep_Q2_008_partial_27_1250_valid :
    mulPoly ep_Q2_008_coefficient_27_1250
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1250 := by
  native_decide

/-- Coefficient term 1251 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1251 : Poly :=
[
  term ((1488724574836201803112421091006352224704385 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1251 for generator 27. -/
def ep_Q2_008_partial_27_1251 : Poly :=
[
  term ((1488724574836201803112421091006352224704385 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1488724574836201803112421091006352224704385 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1251 for generator 27. -/
theorem ep_Q2_008_partial_27_1251_valid :
    mulPoly ep_Q2_008_coefficient_27_1251
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1251 := by
  native_decide

/-- Coefficient term 1252 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1252 : Poly :=
[
  term ((-23985511571295349047 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1252 for generator 27. -/
def ep_Q2_008_partial_27_1252 : Poly :=
[
  term ((-23985511571295349047 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1252 for generator 27. -/
theorem ep_Q2_008_partial_27_1252_valid :
    mulPoly ep_Q2_008_coefficient_27_1252
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1252 := by
  native_decide

/-- Coefficient term 1253 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1253 : Poly :=
[
  term ((1203246973189179433531786288486998954033321 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1253 for generator 27. -/
def ep_Q2_008_partial_27_1253 : Poly :=
[
  term ((1203246973189179433531786288486998954033321 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1203246973189179433531786288486998954033321 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1253 for generator 27. -/
theorem ep_Q2_008_partial_27_1253_valid :
    mulPoly ep_Q2_008_coefficient_27_1253
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1253 := by
  native_decide

/-- Coefficient term 1254 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1254 : Poly :=
[
  term ((-41028434263008735088980545210011201873149 : Rat) / 23270014048459243500102183208135593751448) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1254 for generator 27. -/
def ep_Q2_008_partial_27_1254 : Poly :=
[
  term ((41028434263008735088980545210011201873149 : Rat) / 23270014048459243500102183208135593751448) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41028434263008735088980545210011201873149 : Rat) / 11635007024229621750051091604067796875724) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1254 for generator 27. -/
theorem ep_Q2_008_partial_27_1254_valid :
    mulPoly ep_Q2_008_coefficient_27_1254
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1254 := by
  native_decide

/-- Coefficient term 1255 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1255 : Poly :=
[
  term ((-41028434263008735088980545210011201873149 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1255 for generator 27. -/
def ep_Q2_008_partial_27_1255 : Poly :=
[
  term ((-41028434263008735088980545210011201873149 : Rat) / 23270014048459243500102183208135593751448) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((41028434263008735088980545210011201873149 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1255 for generator 27. -/
theorem ep_Q2_008_partial_27_1255_valid :
    mulPoly ep_Q2_008_coefficient_27_1255
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1255 := by
  native_decide

/-- Coefficient term 1256 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1256 : Poly :=
[
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1256 for generator 27. -/
def ep_Q2_008_partial_27_1256 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1256 for generator 27. -/
theorem ep_Q2_008_partial_27_1256_valid :
    mulPoly ep_Q2_008_coefficient_27_1256
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1256 := by
  native_decide

/-- Coefficient term 1257 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1257 : Poly :=
[
  term ((7995170523765116349 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (13, 2), (16, 1)]
]

/-- Partial product 1257 for generator 27. -/
def ep_Q2_008_partial_27_1257 : Poly :=
[
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-7995170523765116349 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1257 for generator 27. -/
theorem ep_Q2_008_partial_27_1257_valid :
    mulPoly ep_Q2_008_coefficient_27_1257
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1257 := by
  native_decide

/-- Coefficient term 1258 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1258 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 1258 for generator 27. -/
def ep_Q2_008_partial_27_1258 : Poly :=
[
  term ((-346288422606126750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1258 for generator 27. -/
theorem ep_Q2_008_partial_27_1258_valid :
    mulPoly ep_Q2_008_coefficient_27_1258
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1258 := by
  native_decide

/-- Coefficient term 1259 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1259 : Poly :=
[
  term ((173144211303063375 : Rat) / 692956453614176359) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 1259 for generator 27. -/
def ep_Q2_008_partial_27_1259 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term ((-173144211303063375 : Rat) / 692956453614176359) [(4, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1259 for generator 27. -/
theorem ep_Q2_008_partial_27_1259_valid :
    mulPoly ep_Q2_008_coefficient_27_1259
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1259 := by
  native_decide

/-- Coefficient term 1260 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1260 : Poly :=
[
  term ((1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1260 for generator 27. -/
def ep_Q2_008_partial_27_1260 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1260 for generator 27. -/
theorem ep_Q2_008_partial_27_1260_valid :
    mulPoly ep_Q2_008_coefficient_27_1260
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1260 := by
  native_decide

/-- Coefficient term 1261 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1261 : Poly :=
[
  term ((364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1261 for generator 27. -/
def ep_Q2_008_partial_27_1261 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1261 for generator 27. -/
theorem ep_Q2_008_partial_27_1261_valid :
    mulPoly ep_Q2_008_coefficient_27_1261
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1261 := by
  native_decide

/-- Coefficient term 1262 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1262 : Poly :=
[
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1262 for generator 27. -/
def ep_Q2_008_partial_27_1262 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1262 for generator 27. -/
theorem ep_Q2_008_partial_27_1262_valid :
    mulPoly ep_Q2_008_coefficient_27_1262
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1262 := by
  native_decide

/-- Coefficient term 1263 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1263 : Poly :=
[
  term ((88859948305338140140286162095122085888206 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1263 for generator 27. -/
def ep_Q2_008_partial_27_1263 : Poly :=
[
  term ((177719896610676280280572324190244171776412 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-88859948305338140140286162095122085888206 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1263 for generator 27. -/
theorem ep_Q2_008_partial_27_1263_valid :
    mulPoly ep_Q2_008_coefficient_27_1263
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1263 := by
  native_decide

/-- Coefficient term 1264 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1264 : Poly :=
[
  term ((56909740678724944809 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1264 for generator 27. -/
def ep_Q2_008_partial_27_1264 : Poly :=
[
  term ((56909740678724944809 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-56909740678724944809 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1264 for generator 27. -/
theorem ep_Q2_008_partial_27_1264_valid :
    mulPoly ep_Q2_008_coefficient_27_1264
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1264 := by
  native_decide

/-- Coefficient term 1265 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1265 : Poly :=
[
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1265 for generator 27. -/
def ep_Q2_008_partial_27_1265 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1265 for generator 27. -/
theorem ep_Q2_008_partial_27_1265_valid :
    mulPoly ep_Q2_008_coefficient_27_1265
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1265 := by
  native_decide

/-- Coefficient term 1266 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1266 : Poly :=
[
  term ((850456312382750586060660228671357122093557 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1266 for generator 27. -/
def ep_Q2_008_partial_27_1266 : Poly :=
[
  term ((850456312382750586060660228671357122093557 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-850456312382750586060660228671357122093557 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1266 for generator 27. -/
theorem ep_Q2_008_partial_27_1266_valid :
    mulPoly ep_Q2_008_coefficient_27_1266
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1266 := by
  native_decide

/-- Coefficient term 1267 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1267 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 1267 for generator 27. -/
def ep_Q2_008_partial_27_1267 : Poly :=
[
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1267 for generator 27. -/
theorem ep_Q2_008_partial_27_1267_valid :
    mulPoly ep_Q2_008_coefficient_27_1267
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1267 := by
  native_decide

/-- Coefficient term 1268 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1268 : Poly :=
[
  term ((35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1268 for generator 27. -/
def ep_Q2_008_partial_27_1268 : Poly :=
[
  term ((70047973408094014580820583371957024000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1268 for generator 27. -/
theorem ep_Q2_008_partial_27_1268_valid :
    mulPoly ep_Q2_008_coefficient_27_1268
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1268 := by
  native_decide

/-- Coefficient term 1269 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1269 : Poly :=
[
  term ((16422254336897173035 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 3), (16, 1)]
]

/-- Partial product 1269 for generator 27. -/
def ep_Q2_008_partial_27_1269 : Poly :=
[
  term ((16422254336897173035 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1269 for generator 27. -/
theorem ep_Q2_008_partial_27_1269_valid :
    mulPoly ep_Q2_008_coefficient_27_1269
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1269 := by
  native_decide

/-- Coefficient term 1270 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1270 : Poly :=
[
  term ((82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1270 for generator 27. -/
def ep_Q2_008_partial_27_1270 : Poly :=
[
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1270 for generator 27. -/
theorem ep_Q2_008_partial_27_1270_valid :
    mulPoly ep_Q2_008_coefficient_27_1270
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1270 := by
  native_decide

/-- Coefficient term 1271 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1271 : Poly :=
[
  term ((3593957875636097820661418254136807305881519 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1271 for generator 27. -/
def ep_Q2_008_partial_27_1271 : Poly :=
[
  term ((3593957875636097820661418254136807305881519 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3593957875636097820661418254136807305881519 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1271 for generator 27. -/
theorem ep_Q2_008_partial_27_1271_valid :
    mulPoly ep_Q2_008_coefficient_27_1271
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1271 := by
  native_decide

/-- Coefficient term 1272 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1272 : Poly :=
[
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1272 for generator 27. -/
def ep_Q2_008_partial_27_1272 : Poly :=
[
  term ((-379203740429673479143781188483200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1272 for generator 27. -/
theorem ep_Q2_008_partial_27_1272_valid :
    mulPoly ep_Q2_008_coefficient_27_1272
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1272 := by
  native_decide

/-- Coefficient term 1273 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1273 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1273 for generator 27. -/
def ep_Q2_008_partial_27_1273 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1273 for generator 27. -/
theorem ep_Q2_008_partial_27_1273_valid :
    mulPoly ep_Q2_008_coefficient_27_1273
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1273 := by
  native_decide

/-- Coefficient term 1274 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1274 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1274 for generator 27. -/
def ep_Q2_008_partial_27_1274 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1274 for generator 27. -/
theorem ep_Q2_008_partial_27_1274_valid :
    mulPoly ep_Q2_008_coefficient_27_1274
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1274 := by
  native_decide

/-- Coefficient term 1275 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1275 : Poly :=
[
  term ((189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1275 for generator 27. -/
def ep_Q2_008_partial_27_1275 : Poly :=
[
  term ((-189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((379203740429673479143781188483200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1275 for generator 27. -/
theorem ep_Q2_008_partial_27_1275_valid :
    mulPoly ep_Q2_008_coefficient_27_1275
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1275 := by
  native_decide

/-- Coefficient term 1276 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1276 : Poly :=
[
  term ((-32443358895196523463 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1276 for generator 27. -/
def ep_Q2_008_partial_27_1276 : Poly :=
[
  term ((32443358895196523463 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32443358895196523463 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1276 for generator 27. -/
theorem ep_Q2_008_partial_27_1276_valid :
    mulPoly ep_Q2_008_coefficient_27_1276
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1276 := by
  native_decide

/-- Coefficient term 1277 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1277 : Poly :=
[
  term ((94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1277 for generator 27. -/
def ep_Q2_008_partial_27_1277 : Poly :=
[
  term ((189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1277 for generator 27. -/
theorem ep_Q2_008_partial_27_1277_valid :
    mulPoly ep_Q2_008_coefficient_27_1277
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1277 := by
  native_decide

/-- Coefficient term 1278 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1278 : Poly :=
[
  term ((-32443358895196523463 : Rat) / 22174606515653643488) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 1278 for generator 27. -/
def ep_Q2_008_partial_27_1278 : Poly :=
[
  term ((-32443358895196523463 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((32443358895196523463 : Rat) / 22174606515653643488) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1278 for generator 27. -/
theorem ep_Q2_008_partial_27_1278_valid :
    mulPoly ep_Q2_008_coefficient_27_1278
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1278 := by
  native_decide

/-- Coefficient term 1279 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1279 : Poly :=
[
  term ((-88971052381636892743972408916101879144206 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1279 for generator 27. -/
def ep_Q2_008_partial_27_1279 : Poly :=
[
  term ((88971052381636892743972408916101879144206 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-177942104763273785487944817832203758288412 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1279 for generator 27. -/
theorem ep_Q2_008_partial_27_1279_valid :
    mulPoly ep_Q2_008_coefficient_27_1279
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1279 := by
  native_decide

/-- Coefficient term 1280 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1280 : Poly :=
[
  term ((-44485526190818446371986204458050939572103 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1280 for generator 27. -/
def ep_Q2_008_partial_27_1280 : Poly :=
[
  term ((-88971052381636892743972408916101879144206 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((44485526190818446371986204458050939572103 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1280 for generator 27. -/
theorem ep_Q2_008_partial_27_1280_valid :
    mulPoly ep_Q2_008_coefficient_27_1280
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1280 := by
  native_decide

/-- Coefficient term 1281 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1281 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1281 for generator 27. -/
def ep_Q2_008_partial_27_1281 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1281 for generator 27. -/
theorem ep_Q2_008_partial_27_1281_valid :
    mulPoly ep_Q2_008_coefficient_27_1281
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1281 := by
  native_decide

/-- Coefficient term 1282 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1282 : Poly :=
[
  term ((-6933840720023250837 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1282 for generator 27. -/
def ep_Q2_008_partial_27_1282 : Poly :=
[
  term ((6933840720023250837 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((-6933840720023250837 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1282 for generator 27. -/
theorem ep_Q2_008_partial_27_1282_valid :
    mulPoly ep_Q2_008_coefficient_27_1282
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1282 := by
  native_decide

/-- Coefficient term 1283 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1283 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1283 for generator 27. -/
def ep_Q2_008_partial_27_1283 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1283 for generator 27. -/
theorem ep_Q2_008_partial_27_1283_valid :
    mulPoly ep_Q2_008_coefficient_27_1283
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1283 := by
  native_decide

/-- Coefficient term 1284 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1284 : Poly :=
[
  term ((-6933840720023250837 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 1284 for generator 27. -/
def ep_Q2_008_partial_27_1284 : Poly :=
[
  term ((-6933840720023250837 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (13, 3), (14, 1), (16, 1)],
  term ((6933840720023250837 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1284 for generator 27. -/
theorem ep_Q2_008_partial_27_1284_valid :
    mulPoly ep_Q2_008_coefficient_27_1284
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1284 := by
  native_decide

/-- Coefficient term 1285 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1285 : Poly :=
[
  term ((-35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1285 for generator 27. -/
def ep_Q2_008_partial_27_1285 : Poly :=
[
  term ((35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-70047973408094014580820583371957024000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1285 for generator 27. -/
theorem ep_Q2_008_partial_27_1285_valid :
    mulPoly ep_Q2_008_coefficient_27_1285
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1285 := by
  native_decide

/-- Coefficient term 1286 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1286 : Poly :=
[
  term ((-17511993352023503645205145842989256000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1286 for generator 27. -/
def ep_Q2_008_partial_27_1286 : Poly :=
[
  term ((-35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((17511993352023503645205145842989256000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1286 for generator 27. -/
theorem ep_Q2_008_partial_27_1286_valid :
    mulPoly ep_Q2_008_coefficient_27_1286
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1286 := by
  native_decide

/-- Coefficient term 1287 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1287 : Poly :=
[
  term ((-210778379689630531748158173600223200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1287 for generator 27. -/
def ep_Q2_008_partial_27_1287 : Poly :=
[
  term ((210778379689630531748158173600223200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-421556759379261063496316347200446400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1287 for generator 27. -/
theorem ep_Q2_008_partial_27_1287_valid :
    mulPoly ep_Q2_008_coefficient_27_1287
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1287 := by
  native_decide

/-- Coefficient term 1288 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1288 : Poly :=
[
  term ((-105389189844815265874079086800111600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1288 for generator 27. -/
def ep_Q2_008_partial_27_1288 : Poly :=
[
  term ((-210778379689630531748158173600223200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((105389189844815265874079086800111600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1288 for generator 27. -/
theorem ep_Q2_008_partial_27_1288_valid :
    mulPoly ep_Q2_008_coefficient_27_1288
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1288 := by
  native_decide

/-- Coefficient term 1289 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1289 : Poly :=
[
  term ((50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1289 for generator 27. -/
def ep_Q2_008_partial_27_1289 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1289 for generator 27. -/
theorem ep_Q2_008_partial_27_1289_valid :
    mulPoly ep_Q2_008_coefficient_27_1289
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1289 := by
  native_decide

/-- Coefficient term 1290 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1290 : Poly :=
[
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1290 for generator 27. -/
def ep_Q2_008_partial_27_1290 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1290 for generator 27. -/
theorem ep_Q2_008_partial_27_1290_valid :
    mulPoly ep_Q2_008_coefficient_27_1290
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1290 := by
  native_decide

/-- Coefficient term 1291 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1291 : Poly :=
[
  term ((1493427739313377427385091432467945600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1291 for generator 27. -/
def ep_Q2_008_partial_27_1291 : Poly :=
[
  term ((2986855478626754854770182864935891200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1493427739313377427385091432467945600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1291 for generator 27. -/
theorem ep_Q2_008_partial_27_1291_valid :
    mulPoly ep_Q2_008_coefficient_27_1291
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1291 := by
  native_decide

/-- Coefficient term 1292 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1292 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1292 for generator 27. -/
def ep_Q2_008_partial_27_1292 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1292 for generator 27. -/
theorem ep_Q2_008_partial_27_1292_valid :
    mulPoly ep_Q2_008_coefficient_27_1292
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1292 := by
  native_decide

/-- Coefficient term 1293 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1293 : Poly :=
[
  term ((964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1293 for generator 27. -/
def ep_Q2_008_partial_27_1293 : Poly :=
[
  term ((1929200151340521309385049351973926400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1293 for generator 27. -/
theorem ep_Q2_008_partial_27_1293_valid :
    mulPoly ep_Q2_008_coefficient_27_1293
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1293 := by
  native_decide

/-- Coefficient term 1294 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1294 : Poly :=
[
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1294 for generator 27. -/
def ep_Q2_008_partial_27_1294 : Poly :=
[
  term ((4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1294 for generator 27. -/
theorem ep_Q2_008_partial_27_1294_valid :
    mulPoly ep_Q2_008_coefficient_27_1294
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1294 := by
  native_decide

/-- Coefficient term 1295 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1295 : Poly :=
[
  term ((21493447512283090276439526653731200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1295 for generator 27. -/
def ep_Q2_008_partial_27_1295 : Poly :=
[
  term ((42986895024566180552879053307462400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21493447512283090276439526653731200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1295 for generator 27. -/
theorem ep_Q2_008_partial_27_1295_valid :
    mulPoly ep_Q2_008_coefficient_27_1295
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1295 := by
  native_decide

/-- Coefficient term 1296 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1296 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1296 for generator 27. -/
def ep_Q2_008_partial_27_1296 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1296 for generator 27. -/
theorem ep_Q2_008_partial_27_1296_valid :
    mulPoly ep_Q2_008_coefficient_27_1296
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1296 := by
  native_decide

/-- Coefficient term 1297 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1297 : Poly :=
[
  term ((-123030297582836843401968439915516800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1297 for generator 27. -/
def ep_Q2_008_partial_27_1297 : Poly :=
[
  term ((123030297582836843401968439915516800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-246060595165673686803936879831033600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1297 for generator 27. -/
theorem ep_Q2_008_partial_27_1297_valid :
    mulPoly ep_Q2_008_coefficient_27_1297
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1297 := by
  native_decide

/-- Coefficient term 1298 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1298 : Poly :=
[
  term ((-61515148791418421700984219957758400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1298 for generator 27. -/
def ep_Q2_008_partial_27_1298 : Poly :=
[
  term ((-123030297582836843401968439915516800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((61515148791418421700984219957758400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1298 for generator 27. -/
theorem ep_Q2_008_partial_27_1298_valid :
    mulPoly ep_Q2_008_coefficient_27_1298
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1298 := by
  native_decide

/-- Coefficient term 1299 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1299 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1299 for generator 27. -/
def ep_Q2_008_partial_27_1299 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1299 for generator 27. -/
theorem ep_Q2_008_partial_27_1299_valid :
    mulPoly ep_Q2_008_coefficient_27_1299
        ep_Q2_008_generator_27_1200_1299 =
      ep_Q2_008_partial_27_1299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_1200_1299 : List Poly :=
[
  ep_Q2_008_partial_27_1200,
  ep_Q2_008_partial_27_1201,
  ep_Q2_008_partial_27_1202,
  ep_Q2_008_partial_27_1203,
  ep_Q2_008_partial_27_1204,
  ep_Q2_008_partial_27_1205,
  ep_Q2_008_partial_27_1206,
  ep_Q2_008_partial_27_1207,
  ep_Q2_008_partial_27_1208,
  ep_Q2_008_partial_27_1209,
  ep_Q2_008_partial_27_1210,
  ep_Q2_008_partial_27_1211,
  ep_Q2_008_partial_27_1212,
  ep_Q2_008_partial_27_1213,
  ep_Q2_008_partial_27_1214,
  ep_Q2_008_partial_27_1215,
  ep_Q2_008_partial_27_1216,
  ep_Q2_008_partial_27_1217,
  ep_Q2_008_partial_27_1218,
  ep_Q2_008_partial_27_1219,
  ep_Q2_008_partial_27_1220,
  ep_Q2_008_partial_27_1221,
  ep_Q2_008_partial_27_1222,
  ep_Q2_008_partial_27_1223,
  ep_Q2_008_partial_27_1224,
  ep_Q2_008_partial_27_1225,
  ep_Q2_008_partial_27_1226,
  ep_Q2_008_partial_27_1227,
  ep_Q2_008_partial_27_1228,
  ep_Q2_008_partial_27_1229,
  ep_Q2_008_partial_27_1230,
  ep_Q2_008_partial_27_1231,
  ep_Q2_008_partial_27_1232,
  ep_Q2_008_partial_27_1233,
  ep_Q2_008_partial_27_1234,
  ep_Q2_008_partial_27_1235,
  ep_Q2_008_partial_27_1236,
  ep_Q2_008_partial_27_1237,
  ep_Q2_008_partial_27_1238,
  ep_Q2_008_partial_27_1239,
  ep_Q2_008_partial_27_1240,
  ep_Q2_008_partial_27_1241,
  ep_Q2_008_partial_27_1242,
  ep_Q2_008_partial_27_1243,
  ep_Q2_008_partial_27_1244,
  ep_Q2_008_partial_27_1245,
  ep_Q2_008_partial_27_1246,
  ep_Q2_008_partial_27_1247,
  ep_Q2_008_partial_27_1248,
  ep_Q2_008_partial_27_1249,
  ep_Q2_008_partial_27_1250,
  ep_Q2_008_partial_27_1251,
  ep_Q2_008_partial_27_1252,
  ep_Q2_008_partial_27_1253,
  ep_Q2_008_partial_27_1254,
  ep_Q2_008_partial_27_1255,
  ep_Q2_008_partial_27_1256,
  ep_Q2_008_partial_27_1257,
  ep_Q2_008_partial_27_1258,
  ep_Q2_008_partial_27_1259,
  ep_Q2_008_partial_27_1260,
  ep_Q2_008_partial_27_1261,
  ep_Q2_008_partial_27_1262,
  ep_Q2_008_partial_27_1263,
  ep_Q2_008_partial_27_1264,
  ep_Q2_008_partial_27_1265,
  ep_Q2_008_partial_27_1266,
  ep_Q2_008_partial_27_1267,
  ep_Q2_008_partial_27_1268,
  ep_Q2_008_partial_27_1269,
  ep_Q2_008_partial_27_1270,
  ep_Q2_008_partial_27_1271,
  ep_Q2_008_partial_27_1272,
  ep_Q2_008_partial_27_1273,
  ep_Q2_008_partial_27_1274,
  ep_Q2_008_partial_27_1275,
  ep_Q2_008_partial_27_1276,
  ep_Q2_008_partial_27_1277,
  ep_Q2_008_partial_27_1278,
  ep_Q2_008_partial_27_1279,
  ep_Q2_008_partial_27_1280,
  ep_Q2_008_partial_27_1281,
  ep_Q2_008_partial_27_1282,
  ep_Q2_008_partial_27_1283,
  ep_Q2_008_partial_27_1284,
  ep_Q2_008_partial_27_1285,
  ep_Q2_008_partial_27_1286,
  ep_Q2_008_partial_27_1287,
  ep_Q2_008_partial_27_1288,
  ep_Q2_008_partial_27_1289,
  ep_Q2_008_partial_27_1290,
  ep_Q2_008_partial_27_1291,
  ep_Q2_008_partial_27_1292,
  ep_Q2_008_partial_27_1293,
  ep_Q2_008_partial_27_1294,
  ep_Q2_008_partial_27_1295,
  ep_Q2_008_partial_27_1296,
  ep_Q2_008_partial_27_1297,
  ep_Q2_008_partial_27_1298,
  ep_Q2_008_partial_27_1299
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_1200_1299 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-82474701698463322263540314777100367245000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((20618675424615830565885078694275091811250 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16206086768059254640291323083962189286400 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8103043384029627320145661541981094643200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((90509358110485524848330304051662417928000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((10904462326114517187 : Rat) / 1385912907228352718) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-10904462326114517187 : Rat) / 2771825814456705436) [(3, 2), (12, 1), (16, 1)],
  term ((8103043384029627320145661541981094643200 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2025760846007406830036415385495273660800 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((-7296051961747042737 : Rat) / 2771825814456705436) [(3, 2), (14, 2), (16, 1)],
  term ((11313669763810690606041288006457802241000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 2), (16, 1)],
  term ((7296051961747042737 : Rat) / 11087303257826821744) [(3, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32270462691476709923348290253049600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1858398998526805824409292715160915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((961469961954879622127994647833507200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1226277582276114977087235029615884800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((613138791138057488543617514807942400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2904341642232903893101346122774464000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((1452170821116451946550673061387232000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((17084362601370022900596153663379200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8542181300685011450298076831689600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((111997488164536816792797007348819200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27999372041134204198199251837204800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((516327403063627358773572644048793600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((1226277582276114977087235029615884800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-306569395569028744271808757403971200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 692956453614176359) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-86111778068036223792 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2456257704056530801557 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((43055889034018111896 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2542369482124567025349 : Rat) / 11087303257826821744) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-204515472911586031506 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((102257736455793015753 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-484378751632703758830 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((242189375816351879415 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 1), (13, 3), (16, 1)],
  term ((12525414675047893253206982086047601171677117 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12525414675047893253206982086047601171677117 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10763972258504527974 : Rat) / 692956453614176359) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((69328828898298509187 : Rat) / 5543651628913410872) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-69328828898298509187 : Rat) / 22174606515653643488) [(4, 1), (5, 1), (13, 1), (16, 1)],
  term ((86111778068036223792 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-21527944517009055948 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((204515472911586031506 : Rat) / 692956453614176359) [(4, 1), (5, 1), (13, 3), (14, 2), (16, 1)],
  term ((-102257736455793015753 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-451322009193875463126978059365084800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((225661004596937731563489029682542400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-38626612961903677663256847422728800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((3049336587242167208026027426915200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-160786571772802500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((80393285886401250 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-53595523924267500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26797761962133750 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13398880981066875 : Rat) / 692956453614176359) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1488724574836201803112421091006352224704385 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1488724574836201803112421091006352224704385 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23985511571295349047 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((23985511571295349047 : Rat) / 2771825814456705436) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((1203246973189179433531786288486998954033321 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1203246973189179433531786288486998954033321 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-41028434263008735088980545210011201873149 : Rat) / 11635007024229621750051091604067796875724) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((41028434263008735088980545210011201873149 : Rat) / 46540028096918487000204366416271187502896) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(4, 1), (6, 1), (13, 2), (14, 2), (16, 1)],
  term ((-7995170523765116349 : Rat) / 5543651628913410872) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((-173144211303063375 : Rat) / 692956453614176359) [(4, 1), (6, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1843367721265631962653173246630448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((177719896610676280280572324190244171776412 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((55449984737667418317 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-88859948305338140140286162095122085888206 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-56909740678724944809 : Rat) / 11087303257826821744) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((850242481727083772752992460574747990125557 : Rat) / 168707601851329515375740828258983054697998) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-850456312382750586060660228671357122093557 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((70047973408094014580820583371957024000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((16422254336897173035 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-35023986704047007290410291685978512000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-16422254336897173035 : Rat) / 2771825814456705436) [(4, 1), (7, 1), (12, 1), (13, 3), (16, 1)],
  term ((165903094913906876638785592196740320000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-82951547456953438319392796098370160000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((3593957875636097820661418254136807305881519 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-379203740429673479143781188483200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3593957875636097820661418254136807305881519 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((189601870214836739571890594241600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((379203740429673479143781188483200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-32443358895196523463 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-94800935107418369785945297120800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((32443358895196523463 : Rat) / 22174606515653643488) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-177942104763273785487944817832203758288412 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((44485526190818446371986204458050939572103 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-29493883540250111402450771946087168000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-6933840720023250837 : Rat) / 1385912907228352718) [(4, 1), (7, 1), (13, 3), (14, 2), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 3), (15, 2), (16, 1)],
  term ((6933840720023250837 : Rat) / 5543651628913410872) [(4, 1), (7, 1), (13, 3), (16, 1)],
  term ((-70047973408094014580820583371957024000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((17511993352023503645205145842989256000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-421556759379261063496316347200446400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((105389189844815265874079086800111600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50768425035276876562764456630892800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2885318628556201101644653951674105600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1493427739313377427385091432467945600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1929200151340521309385049351973926400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((42986895024566180552879053307462400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-21493447512283090276439526653731200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-246060595165673686803936879831033600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((61515148791418421700984219957758400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 1200 through 1299. -/
theorem ep_Q2_008_block_27_1200_1299_valid :
    checkProductSumEq ep_Q2_008_partials_27_1200_1299
      ep_Q2_008_block_27_1200_1299 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
