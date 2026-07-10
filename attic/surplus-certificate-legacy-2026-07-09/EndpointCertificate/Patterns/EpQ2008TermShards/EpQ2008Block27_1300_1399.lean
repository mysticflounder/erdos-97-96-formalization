/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:1300-1399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_1300_1399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1300 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1300 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1300 for generator 27. -/
def ep_Q2_008_partial_27_1300 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 27. -/
theorem ep_Q2_008_partial_27_1300_valid :
    mulPoly ep_Q2_008_coefficient_27_1300
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1301 : Poly :=
[
  term ((-964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1301 for generator 27. -/
def ep_Q2_008_partial_27_1301 : Poly :=
[
  term ((964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1929200151340521309385049351973926400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 27. -/
theorem ep_Q2_008_partial_27_1301_valid :
    mulPoly ep_Q2_008_coefficient_27_1301
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1302 : Poly :=
[
  term ((-482300037835130327346262337993481600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1302 for generator 27. -/
def ep_Q2_008_partial_27_1302 : Poly :=
[
  term ((-964600075670260654692524675986963200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((482300037835130327346262337993481600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 27. -/
theorem ep_Q2_008_partial_27_1302_valid :
    mulPoly ep_Q2_008_coefficient_27_1302
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1303 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1303 for generator 27. -/
def ep_Q2_008_partial_27_1303 : Poly :=
[
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 27. -/
theorem ep_Q2_008_partial_27_1303_valid :
    mulPoly ep_Q2_008_coefficient_27_1303
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1304 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1304 for generator 27. -/
def ep_Q2_008_partial_27_1304 : Poly :=
[
  term ((-93766382576283600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 27. -/
theorem ep_Q2_008_partial_27_1304_valid :
    mulPoly ep_Q2_008_coefficient_27_1304
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1305 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1305 for generator 27. -/
def ep_Q2_008_partial_27_1305 : Poly :=
[
  term ((-46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 27. -/
theorem ep_Q2_008_partial_27_1305_valid :
    mulPoly ep_Q2_008_coefficient_27_1305
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1306 : Poly :=
[
  term ((23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1306 for generator 27. -/
def ep_Q2_008_partial_27_1306 : Poly :=
[
  term ((46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 27. -/
theorem ep_Q2_008_partial_27_1306_valid :
    mulPoly ep_Q2_008_coefficient_27_1306
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1307 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1307 for generator 27. -/
def ep_Q2_008_partial_27_1307 : Poly :=
[
  term ((26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 27. -/
theorem ep_Q2_008_partial_27_1307_valid :
    mulPoly ep_Q2_008_coefficient_27_1307
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1308 : Poly :=
[
  term ((-13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1308 for generator 27. -/
def ep_Q2_008_partial_27_1308 : Poly :=
[
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 27. -/
theorem ep_Q2_008_partial_27_1308_valid :
    mulPoly ep_Q2_008_coefficient_27_1308
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1309 : Poly :=
[
  term ((8682474875731335000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1309 for generator 27. -/
def ep_Q2_008_partial_27_1309 : Poly :=
[
  term ((17364949751462670000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8682474875731335000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 27. -/
theorem ep_Q2_008_partial_27_1309_valid :
    mulPoly ep_Q2_008_coefficient_27_1309
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1310 : Poly :=
[
  term ((19101444726608937000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1310 for generator 27. -/
def ep_Q2_008_partial_27_1310 : Poly :=
[
  term ((38202889453217874000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19101444726608937000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 27. -/
theorem ep_Q2_008_partial_27_1310_valid :
    mulPoly ep_Q2_008_coefficient_27_1310
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1311 : Poly :=
[
  term ((5402428811566164000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1311 for generator 27. -/
def ep_Q2_008_partial_27_1311 : Poly :=
[
  term ((10804857623132328000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 27. -/
theorem ep_Q2_008_partial_27_1311_valid :
    mulPoly ep_Q2_008_coefficient_27_1311
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1312 : Poly :=
[
  term ((11576633167641780000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1312 for generator 27. -/
def ep_Q2_008_partial_27_1312 : Poly :=
[
  term ((23153266335283560000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-11576633167641780000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 27. -/
theorem ep_Q2_008_partial_27_1312_valid :
    mulPoly ep_Q2_008_coefficient_27_1312
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1313 : Poly :=
[
  term ((-659232631192728508074791832042887676228000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1313 for generator 27. -/
def ep_Q2_008_partial_27_1313 : Poly :=
[
  term ((659232631192728508074791832042887676228000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1318465262385457016149583664085775352456000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 27. -/
theorem ep_Q2_008_partial_27_1313_valid :
    mulPoly ep_Q2_008_coefficient_27_1313
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1314 : Poly :=
[
  term ((-328946370738316714685123091312550502562000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1314 for generator 27. -/
def ep_Q2_008_partial_27_1314 : Poly :=
[
  term ((-657892741476633429370246182625101005124000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((328946370738316714685123091312550502562000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 27. -/
theorem ep_Q2_008_partial_27_1314_valid :
    mulPoly ep_Q2_008_coefficient_27_1314
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1315 : Poly :=
[
  term ((-8682474875731335000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1315 for generator 27. -/
def ep_Q2_008_partial_27_1315 : Poly :=
[
  term ((8682474875731335000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-17364949751462670000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 27. -/
theorem ep_Q2_008_partial_27_1315_valid :
    mulPoly ep_Q2_008_coefficient_27_1315
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1316 : Poly :=
[
  term ((-4341237437865667500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1316 for generator 27. -/
def ep_Q2_008_partial_27_1316 : Poly :=
[
  term ((-8682474875731335000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((4341237437865667500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 27. -/
theorem ep_Q2_008_partial_27_1316_valid :
    mulPoly ep_Q2_008_coefficient_27_1316
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1317 : Poly :=
[
  term ((-23337805564717347483 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1317 for generator 27. -/
def ep_Q2_008_partial_27_1317 : Poly :=
[
  term ((23337805564717347483 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-23337805564717347483 : Rat) / 2771825814456705436) [(4, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 27. -/
theorem ep_Q2_008_partial_27_1317_valid :
    mulPoly ep_Q2_008_coefficient_27_1317
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1318 : Poly :=
[
  term ((18483064059075688449 : Rat) / 11087303257826821744) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 1318 for generator 27. -/
def ep_Q2_008_partial_27_1318 : Poly :=
[
  term ((18483064059075688449 : Rat) / 5543651628913410872) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-18483064059075688449 : Rat) / 11087303257826821744) [(4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 27. -/
theorem ep_Q2_008_partial_27_1318_valid :
    mulPoly ep_Q2_008_coefficient_27_1318
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1319 : Poly :=
[
  term ((2382276856869612000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1319 for generator 27. -/
def ep_Q2_008_partial_27_1319 : Poly :=
[
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 27. -/
theorem ep_Q2_008_partial_27_1319_valid :
    mulPoly ep_Q2_008_coefficient_27_1319
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1320 : Poly :=
[
  term ((40079222221316191245204935876337094430400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1320 for generator 27. -/
def ep_Q2_008_partial_27_1320 : Poly :=
[
  term ((80158444442632382490409871752674188860800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-40079222221316191245204935876337094430400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 27. -/
theorem ep_Q2_008_partial_27_1320_valid :
    mulPoly ep_Q2_008_coefficient_27_1320
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1321 : Poly :=
[
  term ((291451479778659578625 : Rat) / 5543651628913410872) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1321 for generator 27. -/
def ep_Q2_008_partial_27_1321 : Poly :=
[
  term ((291451479778659578625 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-291451479778659578625 : Rat) / 5543651628913410872) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 27. -/
theorem ep_Q2_008_partial_27_1321_valid :
    mulPoly ep_Q2_008_coefficient_27_1321
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1322 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1322 for generator 27. -/
def ep_Q2_008_partial_27_1322 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 27. -/
theorem ep_Q2_008_partial_27_1322_valid :
    mulPoly ep_Q2_008_coefficient_27_1322
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1323 : Poly :=
[
  term ((2847104729026265613281871801155147529267600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1323 for generator 27. -/
def ep_Q2_008_partial_27_1323 : Poly :=
[
  term ((5694209458052531226563743602310295058535200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2847104729026265613281871801155147529267600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 27. -/
theorem ep_Q2_008_partial_27_1323_valid :
    mulPoly ep_Q2_008_coefficient_27_1323
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1324 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 1324 for generator 27. -/
def ep_Q2_008_partial_27_1324 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 27. -/
theorem ep_Q2_008_partial_27_1324_valid :
    mulPoly ep_Q2_008_coefficient_27_1324
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1325 : Poly :=
[
  term ((1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1325 for generator 27. -/
def ep_Q2_008_partial_27_1325 : Poly :=
[
  term ((3747110474404081788541944780086383334400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 27. -/
theorem ep_Q2_008_partial_27_1325_valid :
    mulPoly ep_Q2_008_coefficient_27_1325
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1326 : Poly :=
[
  term ((53601229279566270000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (16, 1)]
]

/-- Partial product 1326 for generator 27. -/
def ep_Q2_008_partial_27_1326 : Poly :=
[
  term ((107202458559132540000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 27. -/
theorem ep_Q2_008_partial_27_1326_valid :
    mulPoly ep_Q2_008_coefficient_27_1326
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1327 : Poly :=
[
  term ((4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1327 for generator 27. -/
def ep_Q2_008_partial_27_1327 : Poly :=
[
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 27. -/
theorem ep_Q2_008_partial_27_1327_valid :
    mulPoly ep_Q2_008_coefficient_27_1327
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1328 : Poly :=
[
  term ((202976031701298666547768404172385690103375 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1328 for generator 27. -/
def ep_Q2_008_partial_27_1328 : Poly :=
[
  term ((202976031701298666547768404172385690103375 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-202976031701298666547768404172385690103375 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 27. -/
theorem ep_Q2_008_partial_27_1328_valid :
    mulPoly ep_Q2_008_coefficient_27_1328
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1329 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1329 for generator 27. -/
def ep_Q2_008_partial_27_1329 : Poly :=
[
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 27. -/
theorem ep_Q2_008_partial_27_1329_valid :
    mulPoly ep_Q2_008_coefficient_27_1329
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1330 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1330 for generator 27. -/
def ep_Q2_008_partial_27_1330 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 27. -/
theorem ep_Q2_008_partial_27_1330_valid :
    mulPoly ep_Q2_008_coefficient_27_1330
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1331 : Poly :=
[
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1331 for generator 27. -/
def ep_Q2_008_partial_27_1331 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 27. -/
theorem ep_Q2_008_partial_27_1331_valid :
    mulPoly ep_Q2_008_coefficient_27_1331
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1332 : Poly :=
[
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1332 for generator 27. -/
def ep_Q2_008_partial_27_1332 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 27. -/
theorem ep_Q2_008_partial_27_1332_valid :
    mulPoly ep_Q2_008_coefficient_27_1332
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1333 : Poly :=
[
  term ((-18192626125873275375 : Rat) / 5543651628913410872) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1333 for generator 27. -/
def ep_Q2_008_partial_27_1333 : Poly :=
[
  term ((18192626125873275375 : Rat) / 5543651628913410872) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18192626125873275375 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 27. -/
theorem ep_Q2_008_partial_27_1333_valid :
    mulPoly ep_Q2_008_coefficient_27_1333
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1334 : Poly :=
[
  term ((-727609364929957885460590062701981376000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1334 for generator 27. -/
def ep_Q2_008_partial_27_1334 : Poly :=
[
  term ((-1455218729859915770921180125403962752000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((727609364929957885460590062701981376000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 27. -/
theorem ep_Q2_008_partial_27_1334_valid :
    mulPoly ep_Q2_008_coefficient_27_1334
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1335 : Poly :=
[
  term ((7588582113497882625 : Rat) / 11087303257826821744) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1335 for generator 27. -/
def ep_Q2_008_partial_27_1335 : Poly :=
[
  term ((7588582113497882625 : Rat) / 5543651628913410872) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7588582113497882625 : Rat) / 11087303257826821744) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 27. -/
theorem ep_Q2_008_partial_27_1335_valid :
    mulPoly ep_Q2_008_coefficient_27_1335
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1336 : Poly :=
[
  term ((-40276438562074300813022932970025851448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1336 for generator 27. -/
def ep_Q2_008_partial_27_1336 : Poly :=
[
  term ((40276438562074300813022932970025851448000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-80552877124148601626045865940051702896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 27. -/
theorem ep_Q2_008_partial_27_1336_valid :
    mulPoly ep_Q2_008_coefficient_27_1336
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1337 : Poly :=
[
  term ((-583095697961162428989416946163620705400800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1337 for generator 27. -/
def ep_Q2_008_partial_27_1337 : Poly :=
[
  term ((-1166191395922324857978833892327241410801600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((583095697961162428989416946163620705400800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 27. -/
theorem ep_Q2_008_partial_27_1337_valid :
    mulPoly ep_Q2_008_coefficient_27_1337
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1338 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1338 for generator 27. -/
def ep_Q2_008_partial_27_1338 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 27. -/
theorem ep_Q2_008_partial_27_1338_valid :
    mulPoly ep_Q2_008_coefficient_27_1338
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1339 : Poly :=
[
  term ((-22631630140261314000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1339 for generator 27. -/
def ep_Q2_008_partial_27_1339 : Poly :=
[
  term ((22631630140261314000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-45263260280522628000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 27. -/
theorem ep_Q2_008_partial_27_1339_valid :
    mulPoly ep_Q2_008_coefficient_27_1339
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1340 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1340 for generator 27. -/
def ep_Q2_008_partial_27_1340 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 27. -/
theorem ep_Q2_008_partial_27_1340_valid :
    mulPoly ep_Q2_008_coefficient_27_1340
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1341 : Poly :=
[
  term ((-11315815070130657000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 1341 for generator 27. -/
def ep_Q2_008_partial_27_1341 : Poly :=
[
  term ((-22631630140261314000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((11315815070130657000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 27. -/
theorem ep_Q2_008_partial_27_1341_valid :
    mulPoly ep_Q2_008_coefficient_27_1341
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1342 : Poly :=
[
  term ((-1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1342 for generator 27. -/
def ep_Q2_008_partial_27_1342 : Poly :=
[
  term ((1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-3747110474404081788541944780086383334400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 27. -/
theorem ep_Q2_008_partial_27_1342_valid :
    mulPoly ep_Q2_008_coefficient_27_1342
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1343 : Poly :=
[
  term ((-936777618601020447135486195021595833600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1343 for generator 27. -/
def ep_Q2_008_partial_27_1343 : Poly :=
[
  term ((-1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((936777618601020447135486195021595833600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 27. -/
theorem ep_Q2_008_partial_27_1343_valid :
    mulPoly ep_Q2_008_coefficient_27_1343
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1344 : Poly :=
[
  term ((-306802816330859147816267951682865152000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1344 for generator 27. -/
def ep_Q2_008_partial_27_1344 : Poly :=
[
  term ((306802816330859147816267951682865152000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 27. -/
theorem ep_Q2_008_partial_27_1344_valid :
    mulPoly ep_Q2_008_coefficient_27_1344
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1345 : Poly :=
[
  term ((-30064046690641206407516313837199676428725 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1345 for generator 27. -/
def ep_Q2_008_partial_27_1345 : Poly :=
[
  term ((-60128093381282412815032627674399352857450 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((30064046690641206407516313837199676428725 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 27. -/
theorem ep_Q2_008_partial_27_1345_valid :
    mulPoly ep_Q2_008_coefficient_27_1345
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1346 : Poly :=
[
  term ((98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1346 for generator 27. -/
def ep_Q2_008_partial_27_1346 : Poly :=
[
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 27. -/
theorem ep_Q2_008_partial_27_1346_valid :
    mulPoly ep_Q2_008_coefficient_27_1346
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1347 : Poly :=
[
  term ((515700953587329750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1347 for generator 27. -/
def ep_Q2_008_partial_27_1347 : Poly :=
[
  term ((1031401907174659500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 27. -/
theorem ep_Q2_008_partial_27_1347_valid :
    mulPoly ep_Q2_008_coefficient_27_1347
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1348 : Poly :=
[
  term ((59550582138075000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 1348 for generator 27. -/
def ep_Q2_008_partial_27_1348 : Poly :=
[
  term ((119101164276150000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 27. -/
theorem ep_Q2_008_partial_27_1348_valid :
    mulPoly ep_Q2_008_coefficient_27_1348
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1349 : Poly :=
[
  term ((6858544380761353535115185685499964006400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1349 for generator 27. -/
def ep_Q2_008_partial_27_1349 : Poly :=
[
  term ((-6858544380761353535115185685499964006400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13717088761522707070230371370999928012800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 27. -/
theorem ep_Q2_008_partial_27_1349_valid :
    mulPoly ep_Q2_008_coefficient_27_1349
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1350 : Poly :=
[
  term ((-27281021114071939011224139321877640580905211 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1350 for generator 27. -/
def ep_Q2_008_partial_27_1350 : Poly :=
[
  term ((-27281021114071939011224139321877640580905211 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27281021114071939011224139321877640580905211 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 27. -/
theorem ep_Q2_008_partial_27_1350_valid :
    mulPoly ep_Q2_008_coefficient_27_1350
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1351 : Poly :=
[
  term ((4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1351 for generator 27. -/
def ep_Q2_008_partial_27_1351 : Poly :=
[
  term ((9903242853643923660771756997289457580800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 27. -/
theorem ep_Q2_008_partial_27_1351_valid :
    mulPoly ep_Q2_008_coefficient_27_1351
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1352 : Poly :=
[
  term ((28575233031978352276588022136271838121600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1352 for generator 27. -/
def ep_Q2_008_partial_27_1352 : Poly :=
[
  term ((57150466063956704553176044272543676243200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-28575233031978352276588022136271838121600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 27. -/
theorem ep_Q2_008_partial_27_1352_valid :
    mulPoly ep_Q2_008_coefficient_27_1352
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1353 : Poly :=
[
  term ((-211665078957808510839 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1353 for generator 27. -/
def ep_Q2_008_partial_27_1353 : Poly :=
[
  term ((-211665078957808510839 : Rat) / 5543651628913410872) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((211665078957808510839 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 27. -/
theorem ep_Q2_008_partial_27_1353_valid :
    mulPoly ep_Q2_008_coefficient_27_1353
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1354 : Poly :=
[
  term ((78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1354 for generator 27. -/
def ep_Q2_008_partial_27_1354 : Poly :=
[
  term ((156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 27. -/
theorem ep_Q2_008_partial_27_1354_valid :
    mulPoly ep_Q2_008_coefficient_27_1354
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1355 : Poly :=
[
  term ((-6996519595368862983 : Rat) / 5543651628913410872) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1355 for generator 27. -/
def ep_Q2_008_partial_27_1355 : Poly :=
[
  term ((6996519595368862983 : Rat) / 5543651628913410872) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6996519595368862983 : Rat) / 2771825814456705436) [(4, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 27. -/
theorem ep_Q2_008_partial_27_1355_valid :
    mulPoly ep_Q2_008_coefficient_27_1355
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1356 : Poly :=
[
  term ((-2139788244535472647315220866084471951092741 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1356 for generator 27. -/
def ep_Q2_008_partial_27_1356 : Poly :=
[
  term ((-2139788244535472647315220866084471951092741 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2139788244535472647315220866084471951092741 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 27. -/
theorem ep_Q2_008_partial_27_1356_valid :
    mulPoly ep_Q2_008_coefficient_27_1356
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1357 : Poly :=
[
  term ((-147899193970680736347 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 1357 for generator 27. -/
def ep_Q2_008_partial_27_1357 : Poly :=
[
  term ((-147899193970680736347 : Rat) / 5543651628913410872) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((147899193970680736347 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 27. -/
theorem ep_Q2_008_partial_27_1357_valid :
    mulPoly ep_Q2_008_coefficient_27_1357
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1358 : Poly :=
[
  term ((-7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1358 for generator 27. -/
def ep_Q2_008_partial_27_1358 : Poly :=
[
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 27. -/
theorem ep_Q2_008_partial_27_1358_valid :
    mulPoly ep_Q2_008_coefficient_27_1358
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1359 : Poly :=
[
  term ((2107832893987185507321024096741574896142341 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1359 for generator 27. -/
def ep_Q2_008_partial_27_1359 : Poly :=
[
  term ((-2107832893987185507321024096741574896142341 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2107832893987185507321024096741574896142341 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 27. -/
theorem ep_Q2_008_partial_27_1359_valid :
    mulPoly ep_Q2_008_coefficient_27_1359
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1360 : Poly :=
[
  term ((2734247309618544202436865535555525926721941 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1360 for generator 27. -/
def ep_Q2_008_partial_27_1360 : Poly :=
[
  term ((2734247309618544202436865535555525926721941 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2734247309618544202436865535555525926721941 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 27. -/
theorem ep_Q2_008_partial_27_1360_valid :
    mulPoly ep_Q2_008_coefficient_27_1360
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1361 : Poly :=
[
  term ((-4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1361 for generator 27. -/
def ep_Q2_008_partial_27_1361 : Poly :=
[
  term ((4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-9903242853643923660771756997289457580800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 27. -/
theorem ep_Q2_008_partial_27_1361_valid :
    mulPoly ep_Q2_008_coefficient_27_1361
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1362 : Poly :=
[
  term ((132193365562855162329 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1362 for generator 27. -/
def ep_Q2_008_partial_27_1362 : Poly :=
[
  term ((-132193365562855162329 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((132193365562855162329 : Rat) / 5543651628913410872) [(4, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 27. -/
theorem ep_Q2_008_partial_27_1362_valid :
    mulPoly ep_Q2_008_coefficient_27_1362
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1363 : Poly :=
[
  term ((-2361806981142741325364885089986113323200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1363 for generator 27. -/
def ep_Q2_008_partial_27_1363 : Poly :=
[
  term ((-4723613962285482650729770179972226646400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2361806981142741325364885089986113323200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 27. -/
theorem ep_Q2_008_partial_27_1363_valid :
    mulPoly ep_Q2_008_coefficient_27_1363
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1364 : Poly :=
[
  term ((77010273690117886329 : Rat) / 22174606515653643488) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 1364 for generator 27. -/
def ep_Q2_008_partial_27_1364 : Poly :=
[
  term ((77010273690117886329 : Rat) / 11087303257826821744) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-77010273690117886329 : Rat) / 22174606515653643488) [(4, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 27. -/
theorem ep_Q2_008_partial_27_1364_valid :
    mulPoly ep_Q2_008_coefficient_27_1364
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1365 : Poly :=
[
  term ((-31299049682083277488741732604315109331200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1365 for generator 27. -/
def ep_Q2_008_partial_27_1365 : Poly :=
[
  term ((31299049682083277488741732604315109331200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-62598099364166554977483465208630218662400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 27. -/
theorem ep_Q2_008_partial_27_1365_valid :
    mulPoly ep_Q2_008_coefficient_27_1365
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1366 : Poly :=
[
  term ((-16562186029956571543786448203911695260800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1366 for generator 27. -/
def ep_Q2_008_partial_27_1366 : Poly :=
[
  term ((-33124372059913143087572896407823390521600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((16562186029956571543786448203911695260800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 27. -/
theorem ep_Q2_008_partial_27_1366_valid :
    mulPoly ep_Q2_008_coefficient_27_1366
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1367 : Poly :=
[
  term ((-13546325160838195297 : Rat) / 11087303257826821744) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 1367 for generator 27. -/
def ep_Q2_008_partial_27_1367 : Poly :=
[
  term ((13546325160838195297 : Rat) / 11087303257826821744) [(4, 1), (14, 1), (16, 1)],
  term ((-13546325160838195297 : Rat) / 5543651628913410872) [(4, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 27. -/
theorem ep_Q2_008_partial_27_1367_valid :
    mulPoly ep_Q2_008_coefficient_27_1367
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1368 : Poly :=
[
  term ((-49793198908938735641899133769099264000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 1368 for generator 27. -/
def ep_Q2_008_partial_27_1368 : Poly :=
[
  term ((-99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((49793198908938735641899133769099264000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 27. -/
theorem ep_Q2_008_partial_27_1368_valid :
    mulPoly ep_Q2_008_coefficient_27_1368
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1369 : Poly :=
[
  term ((-44619505720351455229 : Rat) / 22174606515653643488) [(4, 1), (16, 1)]
]

/-- Partial product 1369 for generator 27. -/
def ep_Q2_008_partial_27_1369 : Poly :=
[
  term ((-44619505720351455229 : Rat) / 11087303257826821744) [(4, 1), (14, 1), (16, 1)],
  term ((44619505720351455229 : Rat) / 22174606515653643488) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 27. -/
theorem ep_Q2_008_partial_27_1369_valid :
    mulPoly ep_Q2_008_coefficient_27_1369
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1370 : Poly :=
[
  term ((34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1370 for generator 27. -/
def ep_Q2_008_partial_27_1370 : Poly :=
[
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 27. -/
theorem ep_Q2_008_partial_27_1370_valid :
    mulPoly ep_Q2_008_coefficient_27_1370
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1371 : Poly :=
[
  term ((1676788083043091541186122953764926884800 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1371 for generator 27. -/
def ep_Q2_008_partial_27_1371 : Poly :=
[
  term ((-1676788083043091541186122953764926884800 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3353576166086183082372245907529853769600 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 27. -/
theorem ep_Q2_008_partial_27_1371_valid :
    mulPoly ep_Q2_008_coefficient_27_1371
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1372 : Poly :=
[
  term ((838394041521545770593061476882463442400 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1372 for generator 27. -/
def ep_Q2_008_partial_27_1372 : Poly :=
[
  term ((1676788083043091541186122953764926884800 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-838394041521545770593061476882463442400 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 27. -/
theorem ep_Q2_008_partial_27_1372_valid :
    mulPoly ep_Q2_008_coefficient_27_1372
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1373 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(4, 2), (14, 1), (16, 1)]
]

/-- Partial product 1373 for generator 27. -/
def ep_Q2_008_partial_27_1373 : Poly :=
[
  term ((-346288422606126750 : Rat) / 692956453614176359) [(4, 2), (14, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 27. -/
theorem ep_Q2_008_partial_27_1373_valid :
    mulPoly ep_Q2_008_coefficient_27_1373
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1374 : Poly :=
[
  term ((173144211303063375 : Rat) / 692956453614176359) [(4, 2), (16, 1)]
]

/-- Partial product 1374 for generator 27. -/
def ep_Q2_008_partial_27_1374 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(4, 2), (14, 1), (16, 1)],
  term ((-173144211303063375 : Rat) / 692956453614176359) [(4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 27. -/
theorem ep_Q2_008_partial_27_1374_valid :
    mulPoly ep_Q2_008_coefficient_27_1374
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1375 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1375 for generator 27. -/
def ep_Q2_008_partial_27_1375 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 27. -/
theorem ep_Q2_008_partial_27_1375_valid :
    mulPoly ep_Q2_008_coefficient_27_1375
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1376 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1376 for generator 27. -/
def ep_Q2_008_partial_27_1376 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 27. -/
theorem ep_Q2_008_partial_27_1376_valid :
    mulPoly ep_Q2_008_coefficient_27_1376
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1377 : Poly :=
[
  term ((590016338208307280244347306835638400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1377 for generator 27. -/
def ep_Q2_008_partial_27_1377 : Poly :=
[
  term ((1180032676416614560488694613671276800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-590016338208307280244347306835638400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 27. -/
theorem ep_Q2_008_partial_27_1377_valid :
    mulPoly ep_Q2_008_coefficient_27_1377
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1378 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1378 for generator 27. -/
def ep_Q2_008_partial_27_1378 : Poly :=
[
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 27. -/
theorem ep_Q2_008_partial_27_1378_valid :
    mulPoly ep_Q2_008_coefficient_27_1378
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1379 : Poly :=
[
  term ((-79812851171707651310734217867719200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1379 for generator 27. -/
def ep_Q2_008_partial_27_1379 : Poly :=
[
  term ((-159625702343415302621468435735438400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((79812851171707651310734217867719200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 27. -/
theorem ep_Q2_008_partial_27_1379_valid :
    mulPoly ep_Q2_008_coefficient_27_1379
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1380 : Poly :=
[
  term ((-18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1380 for generator 27. -/
def ep_Q2_008_partial_27_1380 : Poly :=
[
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 27. -/
theorem ep_Q2_008_partial_27_1380_valid :
    mulPoly ep_Q2_008_coefficient_27_1380
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1381 : Poly :=
[
  term ((231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1381 for generator 27. -/
def ep_Q2_008_partial_27_1381 : Poly :=
[
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 27. -/
theorem ep_Q2_008_partial_27_1381_valid :
    mulPoly ep_Q2_008_coefficient_27_1381
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1382 : Poly :=
[
  term ((-191912993603254276160755059473184000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1382 for generator 27. -/
def ep_Q2_008_partial_27_1382 : Poly :=
[
  term ((191912993603254276160755059473184000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-383825987206508552321510118946368000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 27. -/
theorem ep_Q2_008_partial_27_1382_valid :
    mulPoly ep_Q2_008_coefficient_27_1382
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1383 : Poly :=
[
  term ((-95956496801627138080377529736592000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1383 for generator 27. -/
def ep_Q2_008_partial_27_1383 : Poly :=
[
  term ((-191912993603254276160755059473184000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((95956496801627138080377529736592000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 27. -/
theorem ep_Q2_008_partial_27_1383_valid :
    mulPoly ep_Q2_008_coefficient_27_1383
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1384 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1384 for generator 27. -/
def ep_Q2_008_partial_27_1384 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 27. -/
theorem ep_Q2_008_partial_27_1384_valid :
    mulPoly ep_Q2_008_coefficient_27_1384
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1385 : Poly :=
[
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1385 for generator 27. -/
def ep_Q2_008_partial_27_1385 : Poly :=
[
  term ((107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 27. -/
theorem ep_Q2_008_partial_27_1385_valid :
    mulPoly ep_Q2_008_coefficient_27_1385
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1386 : Poly :=
[
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1386 for generator 27. -/
def ep_Q2_008_partial_27_1386 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 27. -/
theorem ep_Q2_008_partial_27_1386_valid :
    mulPoly ep_Q2_008_coefficient_27_1386
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1387 : Poly :=
[
  term ((-53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 1387 for generator 27. -/
def ep_Q2_008_partial_27_1387 : Poly :=
[
  term ((-107639722585045279740 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 27. -/
theorem ep_Q2_008_partial_27_1387_valid :
    mulPoly ep_Q2_008_coefficient_27_1387
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1388 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1388 for generator 27. -/
def ep_Q2_008_partial_27_1388 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 27. -/
theorem ep_Q2_008_partial_27_1388_valid :
    mulPoly ep_Q2_008_coefficient_27_1388
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1389 : Poly :=
[
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1389 for generator 27. -/
def ep_Q2_008_partial_27_1389 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 27. -/
theorem ep_Q2_008_partial_27_1389_valid :
    mulPoly ep_Q2_008_coefficient_27_1389
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1390 : Poly :=
[
  term ((-194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1390 for generator 27. -/
def ep_Q2_008_partial_27_1390 : Poly :=
[
  term ((194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 27. -/
theorem ep_Q2_008_partial_27_1390_valid :
    mulPoly ep_Q2_008_coefficient_27_1390
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1391 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 1391 for generator 27. -/
def ep_Q2_008_partial_27_1391 : Poly :=
[
  term ((5014213127946281709 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-5014213127946281709 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 27. -/
theorem ep_Q2_008_partial_27_1391_valid :
    mulPoly ep_Q2_008_coefficient_27_1391
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1392 : Poly :=
[
  term ((-97309513697953132801819541906150400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1392 for generator 27. -/
def ep_Q2_008_partial_27_1392 : Poly :=
[
  term ((-194619027395906265603639083812300800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((97309513697953132801819541906150400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 27. -/
theorem ep_Q2_008_partial_27_1392_valid :
    mulPoly ep_Q2_008_coefficient_27_1392
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1393 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 1393 for generator 27. -/
def ep_Q2_008_partial_27_1393 : Poly :=
[
  term ((-5014213127946281709 : Rat) / 2771825814456705436) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((5014213127946281709 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 27. -/
theorem ep_Q2_008_partial_27_1393_valid :
    mulPoly ep_Q2_008_coefficient_27_1393
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1394 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1394 for generator 27. -/
def ep_Q2_008_partial_27_1394 : Poly :=
[
  term ((645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 27. -/
theorem ep_Q2_008_partial_27_1394_valid :
    mulPoly ep_Q2_008_coefficient_27_1394
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1395 : Poly :=
[
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1395 for generator 27. -/
def ep_Q2_008_partial_27_1395 : Poly :=
[
  term ((-645409253829534198466965805060992000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 27. -/
theorem ep_Q2_008_partial_27_1395_valid :
    mulPoly ep_Q2_008_coefficient_27_1395
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1396 : Poly :=
[
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1396 for generator 27. -/
def ep_Q2_008_partial_27_1396 : Poly :=
[
  term ((11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 27. -/
theorem ep_Q2_008_partial_27_1396_valid :
    mulPoly ep_Q2_008_coefficient_27_1396
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1397 : Poly :=
[
  term ((-5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 1397 for generator 27. -/
def ep_Q2_008_partial_27_1397 : Poly :=
[
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 27. -/
theorem ep_Q2_008_partial_27_1397_valid :
    mulPoly ep_Q2_008_coefficient_27_1397
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1398 : Poly :=
[
  term ((-40196642943200625 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1398 for generator 27. -/
def ep_Q2_008_partial_27_1398 : Poly :=
[
  term ((-80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((40196642943200625 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 27. -/
theorem ep_Q2_008_partial_27_1398_valid :
    mulPoly ep_Q2_008_coefficient_27_1398
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1399 : Poly :=
[
  term ((80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1399 for generator 27. -/
def ep_Q2_008_partial_27_1399 : Poly :=
[
  term ((160786571772802500 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 27. -/
theorem ep_Q2_008_partial_27_1399_valid :
    mulPoly ep_Q2_008_coefficient_27_1399
        ep_Q2_008_generator_27_1300_1399 =
      ep_Q2_008_partial_27_1399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_1300_1399 : List Poly :=
[
  ep_Q2_008_partial_27_1300,
  ep_Q2_008_partial_27_1301,
  ep_Q2_008_partial_27_1302,
  ep_Q2_008_partial_27_1303,
  ep_Q2_008_partial_27_1304,
  ep_Q2_008_partial_27_1305,
  ep_Q2_008_partial_27_1306,
  ep_Q2_008_partial_27_1307,
  ep_Q2_008_partial_27_1308,
  ep_Q2_008_partial_27_1309,
  ep_Q2_008_partial_27_1310,
  ep_Q2_008_partial_27_1311,
  ep_Q2_008_partial_27_1312,
  ep_Q2_008_partial_27_1313,
  ep_Q2_008_partial_27_1314,
  ep_Q2_008_partial_27_1315,
  ep_Q2_008_partial_27_1316,
  ep_Q2_008_partial_27_1317,
  ep_Q2_008_partial_27_1318,
  ep_Q2_008_partial_27_1319,
  ep_Q2_008_partial_27_1320,
  ep_Q2_008_partial_27_1321,
  ep_Q2_008_partial_27_1322,
  ep_Q2_008_partial_27_1323,
  ep_Q2_008_partial_27_1324,
  ep_Q2_008_partial_27_1325,
  ep_Q2_008_partial_27_1326,
  ep_Q2_008_partial_27_1327,
  ep_Q2_008_partial_27_1328,
  ep_Q2_008_partial_27_1329,
  ep_Q2_008_partial_27_1330,
  ep_Q2_008_partial_27_1331,
  ep_Q2_008_partial_27_1332,
  ep_Q2_008_partial_27_1333,
  ep_Q2_008_partial_27_1334,
  ep_Q2_008_partial_27_1335,
  ep_Q2_008_partial_27_1336,
  ep_Q2_008_partial_27_1337,
  ep_Q2_008_partial_27_1338,
  ep_Q2_008_partial_27_1339,
  ep_Q2_008_partial_27_1340,
  ep_Q2_008_partial_27_1341,
  ep_Q2_008_partial_27_1342,
  ep_Q2_008_partial_27_1343,
  ep_Q2_008_partial_27_1344,
  ep_Q2_008_partial_27_1345,
  ep_Q2_008_partial_27_1346,
  ep_Q2_008_partial_27_1347,
  ep_Q2_008_partial_27_1348,
  ep_Q2_008_partial_27_1349,
  ep_Q2_008_partial_27_1350,
  ep_Q2_008_partial_27_1351,
  ep_Q2_008_partial_27_1352,
  ep_Q2_008_partial_27_1353,
  ep_Q2_008_partial_27_1354,
  ep_Q2_008_partial_27_1355,
  ep_Q2_008_partial_27_1356,
  ep_Q2_008_partial_27_1357,
  ep_Q2_008_partial_27_1358,
  ep_Q2_008_partial_27_1359,
  ep_Q2_008_partial_27_1360,
  ep_Q2_008_partial_27_1361,
  ep_Q2_008_partial_27_1362,
  ep_Q2_008_partial_27_1363,
  ep_Q2_008_partial_27_1364,
  ep_Q2_008_partial_27_1365,
  ep_Q2_008_partial_27_1366,
  ep_Q2_008_partial_27_1367,
  ep_Q2_008_partial_27_1368,
  ep_Q2_008_partial_27_1369,
  ep_Q2_008_partial_27_1370,
  ep_Q2_008_partial_27_1371,
  ep_Q2_008_partial_27_1372,
  ep_Q2_008_partial_27_1373,
  ep_Q2_008_partial_27_1374,
  ep_Q2_008_partial_27_1375,
  ep_Q2_008_partial_27_1376,
  ep_Q2_008_partial_27_1377,
  ep_Q2_008_partial_27_1378,
  ep_Q2_008_partial_27_1379,
  ep_Q2_008_partial_27_1380,
  ep_Q2_008_partial_27_1381,
  ep_Q2_008_partial_27_1382,
  ep_Q2_008_partial_27_1383,
  ep_Q2_008_partial_27_1384,
  ep_Q2_008_partial_27_1385,
  ep_Q2_008_partial_27_1386,
  ep_Q2_008_partial_27_1387,
  ep_Q2_008_partial_27_1388,
  ep_Q2_008_partial_27_1389,
  ep_Q2_008_partial_27_1390,
  ep_Q2_008_partial_27_1391,
  ep_Q2_008_partial_27_1392,
  ep_Q2_008_partial_27_1393,
  ep_Q2_008_partial_27_1394,
  ep_Q2_008_partial_27_1395,
  ep_Q2_008_partial_27_1396,
  ep_Q2_008_partial_27_1397,
  ep_Q2_008_partial_27_1398,
  ep_Q2_008_partial_27_1399
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_1300_1399 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1929200151340521309385049351973926400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((482300037835130327346262337993481600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-26057995947026191960698093562571673600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-93766382576283600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-23441595644070900 : Rat) / 692956453614176359) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((13028997973513095980349046781285836800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((17364949751462670000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8682474875731335000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((38202889453217874000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-19101444726608937000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((10804857623132328000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((23153266335283560000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11576633167641780000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((1339889716095078704545649417786671104000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1318465262385457016149583664085775352456000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((328946370738316714685123091312550502562000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17364949751462670000 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((4341237437865667500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (13, 2), (16, 1)],
  term ((10455217405948258983 : Rat) / 1385912907228352718) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-23337805564717347483 : Rat) / 2771825814456705436) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-18483064059075688449 : Rat) / 11087303257826821744) [(4, 1), (10, 1), (16, 1)],
  term ((80158444442632382490409871752674188860800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((281922372351181130625 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-40079222221316191245204935876337094430400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-291451479778659578625 : Rat) / 5543651628913410872) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((5688490184170546049097021686593321105024800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2847104729026265613281871801155147529267600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 2), (15, 3), (16, 1)],
  term ((3747110474404081788541944780086383334400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((107202458559132540000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-53601229279566270000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 1), (13, 3), (16, 1)],
  term ((8874735334114930551809869215994065792000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 4), (14, 1), (15, 1), (16, 1)],
  term ((-4437367667057465275904934607997032896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 1), (13, 4), (15, 1), (16, 1)],
  term ((202976031701298666547768404172385690103375 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-202976031701298666547768404172385690103375 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3222651029921394750 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-18192626125873275375 : Rat) / 2771825814456705436) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((727609364929957885460590062701981376000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7588582113497882625 : Rat) / 11087303257826821744) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-80552877124148601626045865940051702896000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((583095697961162428989416946163620705400800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (14, 2), (15, 2), (16, 1)],
  term ((-45263260280522628000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (14, 2), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((11315815070130657000 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-3747110474404081788541944780086383334400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (14, 2), (15, 1), (16, 1)],
  term ((936777618601020447135486195021595833600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-59821290564951553667216359722716487705450 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((30064046690641206407516313837199676428725 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-98608170379054783908998546844378508800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1031401907174659500 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-515700953587329750 : Rat) / 692956453614176359) [(4, 1), (11, 2), (12, 1), (16, 1)],
  term ((119101164276150000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-59550582138075000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (16, 1)],
  term ((-27335889469118029839505060807361640292956411 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9903242853643923660771756997289457580800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((13717088761522707070230371370999928012800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((27281021114071939011224139321877640580905211 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4951621426821961830385878498644728790400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((57150466063956704553176044272543676243200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-211665078957808510839 : Rat) / 5543651628913410872) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-28575233031978352276588022136271838121600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((211665078957808510839 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((156088613732203079208085647751520649177600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-78044306866101539604042823875760324588800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2139788244535472647315220866084471951092741 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35225668593827968341 : Rat) / 1385912907228352718) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6996519595368862983 : Rat) / 2771825814456705436) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((2139788244535472647315220866084471951092741 : Rat) / 674830407405318061502963313035932218791992) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((147899193970680736347 : Rat) / 11087303257826821744) [(4, 1), (12, 1), (16, 1)],
  term ((-14387033619570246422503196079893263564800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((7193516809785123211251598039946631782400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (12, 2), (15, 2), (16, 1)],
  term ((78301801953919836889480179851743878822450 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2107832893987185507321024096741574896142341 : Rat) / 337415203702659030751481656517966109395996) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2734247309618544202436865535555525926721941 : Rat) / 1349660814810636123005926626071864437583984) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3448943242046079750 : Rat) / 692956453614176359) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9903242853643923660771756997289457580800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((132193365562855162329 : Rat) / 5543651628913410872) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((2361806981142741325364885089986113323200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-77010273690117886329 : Rat) / 22174606515653643488) [(4, 1), (13, 2), (16, 1)],
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-62598099364166554977483465208630218662400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((16562186029956571543786448203911695260800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-99586397817877471283798267538198528000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7768295139878314983 : Rat) / 2771825814456705436) [(4, 1), (14, 1), (16, 1)],
  term ((-13546325160838195297 : Rat) / 5543651628913410872) [(4, 1), (14, 2), (16, 1)],
  term ((49793198908938735641899133769099264000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (15, 2), (16, 1)],
  term ((44619505720351455229 : Rat) / 22174606515653643488) [(4, 1), (16, 1)],
  term ((69611186046410533288739366850729600 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-34805593023205266644369683425364800 : Rat) / 2908751756057405437512772901016949218931) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((3353576166086183082372245907529853769600 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-838394041521545770593061476882463442400 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (14, 2), (16, 1)],
  term ((-173144211303063375 : Rat) / 692956453614176359) [(4, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((1180032676416614560488694613671276800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-590016338208307280244347306835638400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-159625702343415302621468435735438400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((79812851171707651310734217867719200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-36592039046906006496312329122982400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((18296019523453003248156164561491200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((463519355542844131959082169072745600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-383825987206508552321510118946368000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((95956496801627138080377529736592000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-215279445170090559480 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((-322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((53819861292522639870 : Rat) / 692956453614176359) [(5, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-389238054791812531207278167624601600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-5014213127946281709 : Rat) / 1385912907228352718) [(5, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((97309513697953132801819541906150400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((5014213127946281709 : Rat) / 5543651628913410872) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-1290818507659068396933931610121984000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((322704626914767099233482902530496000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-22779150135160030534128204884505600 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((40196642943200625 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((160786571772802500 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-80393285886401250 : Rat) / 692956453614176359) [(5, 1), (6, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 1300 through 1399. -/
theorem ep_Q2_008_block_27_1300_1399_valid :
    checkProductSumEq ep_Q2_008_partials_27_1300_1399
      ep_Q2_008_block_27_1300_1399 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
