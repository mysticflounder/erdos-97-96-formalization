/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 14:200-248

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 14 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_14_0200_0248 : Poly :=
[
  term (2 : Rat) [(4, 1), (12, 1)],
  term (2 : Rat) [(5, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0200 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 200 for generator 14. -/
def ep_Q2_008_partial_14_0200 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(4, 1), (7, 2), (10, 1), (12, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 14. -/
theorem ep_Q2_008_partial_14_0200_valid :
    mulPoly ep_Q2_008_coefficient_14_0200
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0201 : Poly :=
[
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 14. -/
def ep_Q2_008_partial_14_0201 : Poly :=
[
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 14. -/
theorem ep_Q2_008_partial_14_0201_valid :
    mulPoly ep_Q2_008_coefficient_14_0201
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0202 : Poly :=
[
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 202 for generator 14. -/
def ep_Q2_008_partial_14_0202 : Poly :=
[
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 14. -/
theorem ep_Q2_008_partial_14_0202_valid :
    mulPoly ep_Q2_008_coefficient_14_0202
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0203 : Poly :=
[
  term ((80393436780205746060606723089731200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 203 for generator 14. -/
def ep_Q2_008_partial_14_0203 : Poly :=
[
  term ((160786873560411492121213446179462400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (15, 2), (16, 1)],
  term ((160786873560411492121213446179462400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-80393436780205746060606723089731200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-80393436780205746060606723089731200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 14. -/
theorem ep_Q2_008_partial_14_0203_valid :
    mulPoly ep_Q2_008_coefficient_14_0203
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0204 : Poly :=
[
  term ((846392845780048563618482612785320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 14. -/
def ep_Q2_008_partial_14_0204 : Poly :=
[
  term ((1692785691560097127236965225570640000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1692785691560097127236965225570640000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-846392845780048563618482612785320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-846392845780048563618482612785320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 14. -/
theorem ep_Q2_008_partial_14_0204_valid :
    mulPoly ep_Q2_008_coefficient_14_0204
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0205 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 205 for generator 14. -/
def ep_Q2_008_partial_14_0205 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 14. -/
theorem ep_Q2_008_partial_14_0205_valid :
    mulPoly ep_Q2_008_coefficient_14_0205
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0206 : Poly :=
[
  term ((4086858215339788563302538758786870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 14. -/
def ep_Q2_008_partial_14_0206 : Poly :=
[
  term ((8173716430679577126605077517573740800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((8173716430679577126605077517573740800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-4086858215339788563302538758786870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-4086858215339788563302538758786870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 14. -/
theorem ep_Q2_008_partial_14_0206_valid :
    mulPoly ep_Q2_008_coefficient_14_0206
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0207 : Poly :=
[
  term ((-1142289563293729722662200274195088000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 14. -/
def ep_Q2_008_partial_14_0207 : Poly :=
[
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((1142289563293729722662200274195088000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((1142289563293729722662200274195088000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 14. -/
theorem ep_Q2_008_partial_14_0207_valid :
    mulPoly ep_Q2_008_coefficient_14_0207
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0208 : Poly :=
[
  term ((-18127733839830367088772829714531200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 208 for generator 14. -/
def ep_Q2_008_partial_14_0208 : Poly :=
[
  term ((-36255467679660734177545659429062400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-36255467679660734177545659429062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((18127733839830367088772829714531200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (15, 2), (16, 1)],
  term ((18127733839830367088772829714531200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 14. -/
theorem ep_Q2_008_partial_14_0208_valid :
    mulPoly ep_Q2_008_coefficient_14_0208
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0209 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 14. -/
def ep_Q2_008_partial_14_0209 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 3), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 14. -/
theorem ep_Q2_008_partial_14_0209_valid :
    mulPoly ep_Q2_008_coefficient_14_0209
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0210 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 14. -/
def ep_Q2_008_partial_14_0210 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 14. -/
theorem ep_Q2_008_partial_14_0210_valid :
    mulPoly ep_Q2_008_coefficient_14_0210
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0211 : Poly :=
[
  term ((-293055800820181875 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 211 for generator 14. -/
def ep_Q2_008_partial_14_0211 : Poly :=
[
  term ((-293055800820181875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-293055800820181875 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((293055800820181875 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((293055800820181875 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 14. -/
theorem ep_Q2_008_partial_14_0211_valid :
    mulPoly ep_Q2_008_coefficient_14_0211
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0212 : Poly :=
[
  term ((-45601492907295835931221663734500428800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 212 for generator 14. -/
def ep_Q2_008_partial_14_0212 : Poly :=
[
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((45601492907295835931221663734500428800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((45601492907295835931221663734500428800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 14. -/
theorem ep_Q2_008_partial_14_0212_valid :
    mulPoly ep_Q2_008_coefficient_14_0212
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0213 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 2771825814456705436) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 213 for generator 14. -/
def ep_Q2_008_partial_14_0213 : Poly :=
[
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 14. -/
theorem ep_Q2_008_partial_14_0213_valid :
    mulPoly ep_Q2_008_coefficient_14_0213
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0214 : Poly :=
[
  term ((-97785127383742799937383775187943635200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 14. -/
def ep_Q2_008_partial_14_0214 : Poly :=
[
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((97785127383742799937383775187943635200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((97785127383742799937383775187943635200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 14. -/
theorem ep_Q2_008_partial_14_0214_valid :
    mulPoly ep_Q2_008_coefficient_14_0214
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0215 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 14. -/
def ep_Q2_008_partial_14_0215 : Poly :=
[
  term ((93766382576283600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 14. -/
theorem ep_Q2_008_partial_14_0215_valid :
    mulPoly ep_Q2_008_coefficient_14_0215
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0216 : Poly :=
[
  term ((-19101444726608937000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 14. -/
def ep_Q2_008_partial_14_0216 : Poly :=
[
  term ((-38202889453217874000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-38202889453217874000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((19101444726608937000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((19101444726608937000 : Rat) / 692956453614176359) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 14. -/
theorem ep_Q2_008_partial_14_0216_valid :
    mulPoly ep_Q2_008_coefficient_14_0216
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0217 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 217 for generator 14. -/
def ep_Q2_008_partial_14_0217 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 14. -/
theorem ep_Q2_008_partial_14_0217_valid :
    mulPoly ep_Q2_008_coefficient_14_0217
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0218 : Poly :=
[
  term ((4121369018408372020574294000946487526907300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 14. -/
def ep_Q2_008_partial_14_0218 : Poly :=
[
  term ((8242738036816744041148588001892975053814600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8242738036816744041148588001892975053814600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4121369018408372020574294000946487526907300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4121369018408372020574294000946487526907300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 14. -/
theorem ep_Q2_008_partial_14_0218_valid :
    mulPoly ep_Q2_008_coefficient_14_0218
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0219 : Poly :=
[
  term ((-9550722363304468500 : Rat) / 692956453614176359) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 219 for generator 14. -/
def ep_Q2_008_partial_14_0219 : Poly :=
[
  term ((-19101444726608937000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-19101444726608937000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)],
  term ((9550722363304468500 : Rat) / 692956453614176359) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((9550722363304468500 : Rat) / 692956453614176359) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 14. -/
theorem ep_Q2_008_partial_14_0219_valid :
    mulPoly ep_Q2_008_coefficient_14_0219
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0220 : Poly :=
[
  term ((-328820160020985918990474499576661073591600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 14. -/
def ep_Q2_008_partial_14_0220 : Poly :=
[
  term ((-657640320041971837980948999153322147183200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-657640320041971837980948999153322147183200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((328820160020985918990474499576661073591600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((328820160020985918990474499576661073591600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 14. -/
theorem ep_Q2_008_partial_14_0220_valid :
    mulPoly ep_Q2_008_coefficient_14_0220
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0221 : Poly :=
[
  term ((50123062701239304267 : Rat) / 5543651628913410872) [(10, 1), (16, 1)]
]

/-- Partial product 221 for generator 14. -/
def ep_Q2_008_partial_14_0221 : Poly :=
[
  term ((50123062701239304267 : Rat) / 2771825814456705436) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((50123062701239304267 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-50123062701239304267 : Rat) / 5543651628913410872) [(10, 1), (12, 2), (16, 1)],
  term ((-50123062701239304267 : Rat) / 5543651628913410872) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 14. -/
theorem ep_Q2_008_partial_14_0221_valid :
    mulPoly ep_Q2_008_coefficient_14_0221
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0222 : Poly :=
[
  term ((-3500728704925502794314684785304599102400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 222 for generator 14. -/
def ep_Q2_008_partial_14_0222 : Poly :=
[
  term ((-7001457409851005588629369570609198204800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-7001457409851005588629369570609198204800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3500728704925502794314684785304599102400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((3500728704925502794314684785304599102400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 14. -/
theorem ep_Q2_008_partial_14_0222_valid :
    mulPoly ep_Q2_008_coefficient_14_0222
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0223 : Poly :=
[
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 223 for generator 14. -/
def ep_Q2_008_partial_14_0223 : Poly :=
[
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 14. -/
theorem ep_Q2_008_partial_14_0223_valid :
    mulPoly ep_Q2_008_coefficient_14_0223
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0224 : Poly :=
[
  term ((-6570648216412494245465435011212296853553200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 14. -/
def ep_Q2_008_partial_14_0224 : Poly :=
[
  term ((-13141296432824988490930870022424593707106400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-13141296432824988490930870022424593707106400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((6570648216412494245465435011212296853553200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((6570648216412494245465435011212296853553200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 14. -/
theorem ep_Q2_008_partial_14_0224_valid :
    mulPoly ep_Q2_008_coefficient_14_0224
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0225 : Poly :=
[
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 225 for generator 14. -/
def ep_Q2_008_partial_14_0225 : Poly :=
[
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 5), (15, 2), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 14. -/
theorem ep_Q2_008_partial_14_0225_valid :
    mulPoly ep_Q2_008_coefficient_14_0225
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0226 : Poly :=
[
  term ((1119072537855155602045763439007757074491375 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 14. -/
def ep_Q2_008_partial_14_0226 : Poly :=
[
  term ((1119072537855155602045763439007757074491375 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1119072537855155602045763439007757074491375 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1119072537855155602045763439007757074491375 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1119072537855155602045763439007757074491375 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 14. -/
theorem ep_Q2_008_partial_14_0226_valid :
    mulPoly ep_Q2_008_coefficient_14_0226
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0227 : Poly :=
[
  term ((-569914811253879004161714790928216331439200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 14. -/
def ep_Q2_008_partial_14_0227 : Poly :=
[
  term ((-1139829622507758008323429581856432662878400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1139829622507758008323429581856432662878400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((569914811253879004161714790928216331439200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((569914811253879004161714790928216331439200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 14. -/
theorem ep_Q2_008_partial_14_0227_valid :
    mulPoly ep_Q2_008_coefficient_14_0227
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0228 : Poly :=
[
  term ((298925595904645254375 : Rat) / 11087303257826821744) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 228 for generator 14. -/
def ep_Q2_008_partial_14_0228 : Poly :=
[
  term ((298925595904645254375 : Rat) / 5543651628913410872) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((298925595904645254375 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((-298925595904645254375 : Rat) / 11087303257826821744) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-298925595904645254375 : Rat) / 11087303257826821744) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 14. -/
theorem ep_Q2_008_partial_14_0228_valid :
    mulPoly ep_Q2_008_coefficient_14_0228
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0229 : Poly :=
[
  term ((11716770580435816856322961433868653524392600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 14. -/
def ep_Q2_008_partial_14_0229 : Poly :=
[
  term ((23433541160871633712645922867737307048785200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((23433541160871633712645922867737307048785200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11716770580435816856322961433868653524392600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-11716770580435816856322961433868653524392600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 14. -/
theorem ep_Q2_008_partial_14_0229_valid :
    mulPoly ep_Q2_008_coefficient_14_0229
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0230 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 230 for generator 14. -/
def ep_Q2_008_partial_14_0230 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 14. -/
theorem ep_Q2_008_partial_14_0230_valid :
    mulPoly ep_Q2_008_coefficient_14_0230
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0231 : Poly :=
[
  term ((7937957715513910104674383020972469958400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 14. -/
def ep_Q2_008_partial_14_0231 : Poly :=
[
  term ((15875915431027820209348766041944939916800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((15875915431027820209348766041944939916800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-7937957715513910104674383020972469958400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((-7937957715513910104674383020972469958400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 5), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 14. -/
theorem ep_Q2_008_partial_14_0231_valid :
    mulPoly ep_Q2_008_coefficient_14_0231
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0232 : Poly :=
[
  term ((-26800614639783135000 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 232 for generator 14. -/
def ep_Q2_008_partial_14_0232 : Poly :=
[
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 4), (16, 1)],
  term ((26800614639783135000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((26800614639783135000 : Rat) / 692956453614176359) [(11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 14. -/
theorem ep_Q2_008_partial_14_0232_valid :
    mulPoly ep_Q2_008_coefficient_14_0232
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0233 : Poly :=
[
  term ((-2218683833528732637952467303998516448000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 233 for generator 14. -/
def ep_Q2_008_partial_14_0233 : Poly :=
[
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((2218683833528732637952467303998516448000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((2218683833528732637952467303998516448000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 6), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 14. -/
theorem ep_Q2_008_partial_14_0233_valid :
    mulPoly ep_Q2_008_coefficient_14_0233
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0234 : Poly :=
[
  term ((-437903143737707255838601655851796377876275 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 234 for generator 14. -/
def ep_Q2_008_partial_14_0234 : Poly :=
[
  term ((-437903143737707255838601655851796377876275 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-437903143737707255838601655851796377876275 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((437903143737707255838601655851796377876275 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((437903143737707255838601655851796377876275 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 14. -/
theorem ep_Q2_008_partial_14_0234_valid :
    mulPoly ep_Q2_008_coefficient_14_0234
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0235 : Poly :=
[
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 235 for generator 14. -/
def ep_Q2_008_partial_14_0235 : Poly :=
[
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 14. -/
theorem ep_Q2_008_partial_14_0235_valid :
    mulPoly ep_Q2_008_coefficient_14_0235
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0236 : Poly :=
[
  term ((23820232855230000 : Rat) / 692956453614176359) [(11, 2), (16, 1)]
]

/-- Partial product 236 for generator 14. -/
def ep_Q2_008_partial_14_0236 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(11, 2), (12, 2), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 14. -/
theorem ep_Q2_008_partial_14_0236_valid :
    mulPoly ep_Q2_008_coefficient_14_0236
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0237 : Poly :=
[
  term ((25336909261031643448077319596039450341779479 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 237 for generator 14. -/
def ep_Q2_008_partial_14_0237 : Poly :=
[
  term ((25336909261031643448077319596039450341779479 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((25336909261031643448077319596039450341779479 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-25336909261031643448077319596039450341779479 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-25336909261031643448077319596039450341779479 : Rat) / 1349660814810636123005926626071864437583984) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 14. -/
theorem ep_Q2_008_partial_14_0237_valid :
    mulPoly ep_Q2_008_coefficient_14_0237
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0238 : Poly :=
[
  term ((2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 238 for generator 14. -/
def ep_Q2_008_partial_14_0238 : Poly :=
[
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 3), (15, 3), (16, 1)],
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 3), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 14. -/
theorem ep_Q2_008_partial_14_0238_valid :
    mulPoly ep_Q2_008_coefficient_14_0238
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0239 : Poly :=
[
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 239 for generator 14. -/
def ep_Q2_008_partial_14_0239 : Poly :=
[
  term ((-156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 4), (15, 2), (16, 1)],
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 14. -/
theorem ep_Q2_008_partial_14_0239_valid :
    mulPoly ep_Q2_008_coefficient_14_0239
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0240 : Poly :=
[
  term ((5843690537152653356942430173800956723026721 : Rat) / 674830407405318061502963313035932218791992) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 240 for generator 14. -/
def ep_Q2_008_partial_14_0240 : Poly :=
[
  term ((5843690537152653356942430173800956723026721 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((5843690537152653356942430173800956723026721 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5843690537152653356942430173800956723026721 : Rat) / 674830407405318061502963313035932218791992) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-5843690537152653356942430173800956723026721 : Rat) / 674830407405318061502963313035932218791992) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 14. -/
theorem ep_Q2_008_partial_14_0240_valid :
    mulPoly ep_Q2_008_coefficient_14_0240
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0241 : Poly :=
[
  term ((7230255796256723313 : Rat) / 692956453614176359) [(12, 1), (16, 1)]
]

/-- Partial product 241 for generator 14. -/
def ep_Q2_008_partial_14_0241 : Poly :=
[
  term ((14460511592513446626 : Rat) / 692956453614176359) [(4, 1), (12, 2), (16, 1)],
  term ((14460511592513446626 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-7230255796256723313 : Rat) / 692956453614176359) [(12, 1), (13, 2), (16, 1)],
  term ((-7230255796256723313 : Rat) / 692956453614176359) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 14. -/
theorem ep_Q2_008_partial_14_0241_valid :
    mulPoly ep_Q2_008_coefficient_14_0241
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0242 : Poly :=
[
  term ((-75031075408032793529771568007449288693780705 : Rat) / 2699321629621272246011853252143728875167968) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 14. -/
def ep_Q2_008_partial_14_0242 : Poly :=
[
  term ((-75031075408032793529771568007449288693780705 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75031075408032793529771568007449288693780705 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((75031075408032793529771568007449288693780705 : Rat) / 2699321629621272246011853252143728875167968) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((75031075408032793529771568007449288693780705 : Rat) / 2699321629621272246011853252143728875167968) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 14. -/
theorem ep_Q2_008_partial_14_0242_valid :
    mulPoly ep_Q2_008_coefficient_14_0242
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0243 : Poly :=
[
  term ((-8258416442644601015636772539855574590400 : Rat) / 84353800925664757687870414129491527348999) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 243 for generator 14. -/
def ep_Q2_008_partial_14_0243 : Poly :=
[
  term ((-16516832885289202031273545079711149180800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-16516832885289202031273545079711149180800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((8258416442644601015636772539855574590400 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((8258416442644601015636772539855574590400 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 14. -/
theorem ep_Q2_008_partial_14_0243_valid :
    mulPoly ep_Q2_008_coefficient_14_0243
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0244 : Poly :=
[
  term ((141800997216213903069791636683384730116800 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 244 for generator 14. -/
def ep_Q2_008_partial_14_0244 : Poly :=
[
  term ((283601994432427806139583273366769460233600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((283601994432427806139583273366769460233600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-141800997216213903069791636683384730116800 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-141800997216213903069791636683384730116800 : Rat) / 84353800925664757687870414129491527348999) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 14. -/
theorem ep_Q2_008_partial_14_0244_valid :
    mulPoly ep_Q2_008_coefficient_14_0244
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0245 : Poly :=
[
  term ((211665078957808510839 : Rat) / 22174606515653643488) [(13, 2), (16, 1)]
]

/-- Partial product 245 for generator 14. -/
def ep_Q2_008_partial_14_0245 : Poly :=
[
  term ((211665078957808510839 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((211665078957808510839 : Rat) / 11087303257826821744) [(5, 1), (13, 3), (16, 1)],
  term ((-211665078957808510839 : Rat) / 22174606515653643488) [(12, 2), (13, 2), (16, 1)],
  term ((-211665078957808510839 : Rat) / 22174606515653643488) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 14. -/
theorem ep_Q2_008_partial_14_0245_valid :
    mulPoly ep_Q2_008_coefficient_14_0245
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0246 : Poly :=
[
  term ((-39022153433050769802021411937880162294400 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 14. -/
def ep_Q2_008_partial_14_0246 : Poly :=
[
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 4), (15, 1), (16, 1)],
  term ((39022153433050769802021411937880162294400 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((39022153433050769802021411937880162294400 : Rat) / 84353800925664757687870414129491527348999) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 14. -/
theorem ep_Q2_008_partial_14_0246_valid :
    mulPoly ep_Q2_008_coefficient_14_0246
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0247 : Poly :=
[
  term ((-22851235986791164292077596855932139595403469 : Rat) / 1349660814810636123005926626071864437583984) [(15, 2), (16, 1)]
]

/-- Partial product 247 for generator 14. -/
def ep_Q2_008_partial_14_0247 : Poly :=
[
  term ((-22851235986791164292077596855932139595403469 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-22851235986791164292077596855932139595403469 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((22851235986791164292077596855932139595403469 : Rat) / 1349660814810636123005926626071864437583984) [(12, 2), (15, 2), (16, 1)],
  term ((22851235986791164292077596855932139595403469 : Rat) / 1349660814810636123005926626071864437583984) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 14. -/
theorem ep_Q2_008_partial_14_0247_valid :
    mulPoly ep_Q2_008_coefficient_14_0247
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 14. -/
def ep_Q2_008_coefficient_14_0248 : Poly :=
[
  term ((-60011027524421888549 : Rat) / 5543651628913410872) [(16, 1)]
]

/-- Partial product 248 for generator 14. -/
def ep_Q2_008_partial_14_0248 : Poly :=
[
  term ((-60011027524421888549 : Rat) / 2771825814456705436) [(4, 1), (12, 1), (16, 1)],
  term ((-60011027524421888549 : Rat) / 2771825814456705436) [(5, 1), (13, 1), (16, 1)],
  term ((60011027524421888549 : Rat) / 5543651628913410872) [(12, 2), (16, 1)],
  term ((60011027524421888549 : Rat) / 5543651628913410872) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 14. -/
theorem ep_Q2_008_partial_14_0248_valid :
    mulPoly ep_Q2_008_coefficient_14_0248
        ep_Q2_008_generator_14_0200_0248 =
      ep_Q2_008_partial_14_0248 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_14_0200_0248 : List Poly :=
[
  ep_Q2_008_partial_14_0200,
  ep_Q2_008_partial_14_0201,
  ep_Q2_008_partial_14_0202,
  ep_Q2_008_partial_14_0203,
  ep_Q2_008_partial_14_0204,
  ep_Q2_008_partial_14_0205,
  ep_Q2_008_partial_14_0206,
  ep_Q2_008_partial_14_0207,
  ep_Q2_008_partial_14_0208,
  ep_Q2_008_partial_14_0209,
  ep_Q2_008_partial_14_0210,
  ep_Q2_008_partial_14_0211,
  ep_Q2_008_partial_14_0212,
  ep_Q2_008_partial_14_0213,
  ep_Q2_008_partial_14_0214,
  ep_Q2_008_partial_14_0215,
  ep_Q2_008_partial_14_0216,
  ep_Q2_008_partial_14_0217,
  ep_Q2_008_partial_14_0218,
  ep_Q2_008_partial_14_0219,
  ep_Q2_008_partial_14_0220,
  ep_Q2_008_partial_14_0221,
  ep_Q2_008_partial_14_0222,
  ep_Q2_008_partial_14_0223,
  ep_Q2_008_partial_14_0224,
  ep_Q2_008_partial_14_0225,
  ep_Q2_008_partial_14_0226,
  ep_Q2_008_partial_14_0227,
  ep_Q2_008_partial_14_0228,
  ep_Q2_008_partial_14_0229,
  ep_Q2_008_partial_14_0230,
  ep_Q2_008_partial_14_0231,
  ep_Q2_008_partial_14_0232,
  ep_Q2_008_partial_14_0233,
  ep_Q2_008_partial_14_0234,
  ep_Q2_008_partial_14_0235,
  ep_Q2_008_partial_14_0236,
  ep_Q2_008_partial_14_0237,
  ep_Q2_008_partial_14_0238,
  ep_Q2_008_partial_14_0239,
  ep_Q2_008_partial_14_0240,
  ep_Q2_008_partial_14_0241,
  ep_Q2_008_partial_14_0242,
  ep_Q2_008_partial_14_0243,
  ep_Q2_008_partial_14_0244,
  ep_Q2_008_partial_14_0245,
  ep_Q2_008_partial_14_0246,
  ep_Q2_008_partial_14_0247,
  ep_Q2_008_partial_14_0248
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_14_0200_0248 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(4, 1), (7, 2), (10, 1), (12, 1), (16, 1)],
  term ((1692785691560097127236965225570640000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((8173716430679577126605077517573740800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-36255467679660734177545659429062400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((160786873560411492121213446179462400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 3), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-293055800820181875 : Rat) / 692956453614176359) [(4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8242738036816744041148588001892975053814600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19101444726608937000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-657640320041971837980948999153322147183200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((50123062701239304267 : Rat) / 2771825814456705436) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-38202889453217874000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 2), (16, 1)],
  term ((-1139829622507758008323429581856432662878400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((298925595904645254375 : Rat) / 5543651628913410872) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((23433541160871633712645922867737307048785200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((15875915431027820209348766041944939916800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((-437903143737707255838601655851796377876275 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-7001457409851005588629369570609198204800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-13141296432824988490930870022424593707106400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((1119072537855155602045763439007757074491375 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term ((-75031075408032793529771568007449288693780705 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16516832885289202031273545079711149180800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((283601994432427806139583273366769460233600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((211665078957808510839 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-22851235986791164292077596855932139595403469 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-60011027524421888549 : Rat) / 2771825814456705436) [(4, 1), (12, 1), (16, 1)],
  term ((25336909261031643448077319596039450341779479 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((5843690537152653356942430173800956723026721 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((14460511592513446626 : Rat) / 692956453614176359) [(4, 1), (12, 2), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((160786873560411492121213446179462400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4569158253174918890648801096780352000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-36255467679660734177545659429062400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((1692785691560097127236965225570640000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 2), (15, 3), (16, 1)],
  term ((8173716430679577126605077517573740800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 3), (15, 2), (16, 1)],
  term ((-2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-293055800820181875 : Rat) / 692956453614176359) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91202985814591671862443327469000857600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2503117653602907375 : Rat) / 1385912907228352718) [(5, 1), (9, 1), (13, 2), (16, 1)],
  term ((-195570254767485599874767550375887270400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-38202889453217874000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-657640320041971837980948999153322147183200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((50123062701239304267 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)],
  term ((8242738036816744041148588001892975053814600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-19101444726608937000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (13, 3), (16, 1)],
  term ((1119072537855155602045763439007757074491375 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7001457409851005588629369570609198204800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-38116429709913792000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-13141296432824988490930870022424593707106400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((-437903143737707255838601655851796377876275 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1139829622507758008323429581856432662878400 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((298925595904645254375 : Rat) / 5543651628913410872) [(5, 1), (11, 1), (13, 2), (16, 1)],
  term ((23433541160871633712645922867737307048785200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 3), (15, 3), (16, 1)],
  term ((15875915431027820209348766041944939916800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 4), (15, 2), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(5, 1), (11, 1), (13, 4), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (11, 1), (13, 5), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(5, 1), (11, 2), (13, 1), (16, 1)],
  term ((5843690537152653356942430173800956723026721 : Rat) / 337415203702659030751481656517966109395996) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((14460511592513446626 : Rat) / 692956453614176359) [(5, 1), (12, 1), (13, 1), (16, 1)],
  term ((25336909261031643448077319596039450341779479 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5447633300209850424307420936086542419200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((-156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-22851235986791164292077596855932139595403469 : Rat) / 674830407405318061502963313035932218791992) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-60011027524421888549 : Rat) / 2771825814456705436) [(5, 1), (13, 1), (16, 1)],
  term ((-75031075408032793529771568007449288693780705 : Rat) / 1349660814810636123005926626071864437583984) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16516832885289202031273545079711149180800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((283601994432427806139583273366769460233600 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((211665078957808510839 : Rat) / 11087303257826821744) [(5, 1), (13, 3), (16, 1)],
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (13, 4), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (12, 2), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-80393436780205746060606723089731200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 1), (13, 4), (15, 2), (16, 1)],
  term ((-846392845780048563618482612785320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4086858215339788563302538758786870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 2), (15, 2), (16, 1)],
  term ((1142289563293729722662200274195088000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (13, 3), (15, 1), (16, 1)],
  term ((18127733839830367088772829714531200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 2), (15, 2), (16, 1)],
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((2284579126587459445324400548390176000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (13, 2), (15, 2), (16, 1)],
  term ((-80393436780205746060606723089731200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (12, 3), (15, 2), (16, 1)],
  term ((18127733839830367088772829714531200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-846392845780048563618482612785320000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 3), (15, 3), (16, 1)],
  term ((-4086858215339788563302538758786870400 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 4), (15, 2), (16, 1)],
  term ((1142289563293729722662200274195088000 : Rat) / 2908751756057405437512772901016949218931) [(7, 2), (13, 5), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(7, 3), (10, 1), (13, 4), (15, 1), (16, 1)],
  term ((293055800820181875 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((293055800820181875 : Rat) / 1385912907228352718) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((45601492907295835931221663734500428800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((97785127383742799937383775187943635200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-46883191288141800 : Rat) / 692956453614176359) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((45601492907295835931221663734500428800 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((2503117653602907375 : Rat) / 2771825814456705436) [(9, 1), (13, 3), (16, 1)],
  term ((97785127383742799937383775187943635200 : Rat) / 84353800925664757687870414129491527348999) [(9, 1), (13, 4), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((19101444726608937000 : Rat) / 692956453614176359) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4121369018408372020574294000946487526907300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9550722363304468500 : Rat) / 692956453614176359) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((328820160020985918990474499576661073591600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-50123062701239304267 : Rat) / 5543651628913410872) [(10, 1), (12, 2), (16, 1)],
  term ((19101444726608937000 : Rat) / 692956453614176359) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(10, 1), (12, 3), (16, 1)],
  term ((328820160020985918990474499576661073591600 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-50123062701239304267 : Rat) / 5543651628913410872) [(10, 1), (13, 2), (16, 1)],
  term ((-4121369018408372020574294000946487526907300 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((9550722363304468500 : Rat) / 692956453614176359) [(10, 1), (13, 4), (16, 1)],
  term ((-1119072537855155602045763439007757074491375 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3500728704925502794314684785304599102400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((6570648216412494245465435011212296853553200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 5), (15, 2), (16, 1)],
  term ((569914811253879004161714790928216331439200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-298925595904645254375 : Rat) / 11087303257826821744) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-11716770580435816856322961433868653524392600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 2), (15, 3), (16, 1)],
  term ((-7937957715513910104674383020972469958400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 3), (15, 2), (16, 1)],
  term ((26800614639783135000 : Rat) / 692956453614176359) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((2218683833528732637952467303998516448000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 2), (13, 4), (15, 1), (16, 1)],
  term ((437903143737707255838601655851796377876275 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((3500728704925502794314684785304599102400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 3), (13, 1), (15, 2), (16, 1)],
  term ((19058214854956896000 : Rat) / 692956453614176359) [(11, 1), (12, 3), (13, 1), (16, 1)],
  term ((6570648216412494245465435011212296853553200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 3), (13, 2), (15, 1), (16, 1)],
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 3), (13, 3), (15, 2), (16, 1)],
  term ((-1119072537855155602045763439007757074491375 : Rat) / 674830407405318061502963313035932218791992) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((437903143737707255838601655851796377876275 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((569914811253879004161714790928216331439200 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-298925595904645254375 : Rat) / 11087303257826821744) [(11, 1), (13, 3), (16, 1)],
  term ((-11716770580435816856322961433868653524392600 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 3), (16, 1)],
  term ((-7937957715513910104674383020972469958400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 5), (15, 2), (16, 1)],
  term ((26800614639783135000 : Rat) / 692956453614176359) [(11, 1), (13, 5), (16, 1)],
  term ((2218683833528732637952467303998516448000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 6), (15, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(11, 2), (12, 2), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(11, 2), (13, 2), (16, 1)],
  term ((-5843690537152653356942430173800956723026721 : Rat) / 674830407405318061502963313035932218791992) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-7230255796256723313 : Rat) / 692956453614176359) [(12, 1), (13, 2), (16, 1)],
  term ((-25336909261031643448077319596039450341779479 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 3), (15, 3), (16, 1)],
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 4), (15, 2), (16, 1)],
  term ((75031075408032793529771568007449288693780705 : Rat) / 2699321629621272246011853252143728875167968) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((8258416442644601015636772539855574590400 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-141800997216213903069791636683384730116800 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-211665078957808510839 : Rat) / 22174606515653643488) [(12, 2), (13, 2), (16, 1)],
  term ((39022153433050769802021411937880162294400 : Rat) / 84353800925664757687870414129491527348999) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((22851235986791164292077596855932139595403469 : Rat) / 1349660814810636123005926626071864437583984) [(12, 2), (15, 2), (16, 1)],
  term ((60011027524421888549 : Rat) / 5543651628913410872) [(12, 2), (16, 1)],
  term ((-25336909261031643448077319596039450341779479 : Rat) / 1349660814810636123005926626071864437583984) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-2723816650104925212153710468043271209600 : Rat) / 84353800925664757687870414129491527348999) [(12, 3), (13, 1), (15, 3), (16, 1)],
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(12, 3), (13, 2), (15, 2), (16, 1)],
  term ((-5843690537152653356942430173800956723026721 : Rat) / 674830407405318061502963313035932218791992) [(12, 3), (15, 2), (16, 1)],
  term ((-7230255796256723313 : Rat) / 692956453614176359) [(12, 3), (16, 1)],
  term ((22851235986791164292077596855932139595403469 : Rat) / 1349660814810636123005926626071864437583984) [(13, 2), (15, 2), (16, 1)],
  term ((60011027524421888549 : Rat) / 5543651628913410872) [(13, 2), (16, 1)],
  term ((75031075408032793529771568007449288693780705 : Rat) / 2699321629621272246011853252143728875167968) [(13, 3), (15, 1), (16, 1)],
  term ((8258416442644601015636772539855574590400 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 3), (16, 1)],
  term ((-141800997216213903069791636683384730116800 : Rat) / 84353800925664757687870414129491527348999) [(13, 4), (15, 2), (16, 1)],
  term ((-211665078957808510839 : Rat) / 22174606515653643488) [(13, 4), (16, 1)],
  term ((39022153433050769802021411937880162294400 : Rat) / 84353800925664757687870414129491527348999) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 200 through 248. -/
theorem ep_Q2_008_block_14_0200_0248_valid :
    checkProductSumEq ep_Q2_008_partials_14_0200_0248
      ep_Q2_008_block_14_0200_0248 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
