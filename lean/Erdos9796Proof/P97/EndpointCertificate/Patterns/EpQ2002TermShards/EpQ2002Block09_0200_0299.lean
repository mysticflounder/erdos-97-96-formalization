/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0200 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)]
]

/-- Partial product 200 for generator 9. -/
def ep_Q2_002_partial_09_0200 : Poly :=
[
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 9. -/
theorem ep_Q2_002_partial_09_0200_valid :
    mulPoly ep_Q2_002_coefficient_09_0200
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0201 : Poly :=
[
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1)]
]

/-- Partial product 201 for generator 9. -/
def ep_Q2_002_partial_09_0201 : Poly :=
[
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (6, 1)],
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 9. -/
theorem ep_Q2_002_partial_09_0201_valid :
    mulPoly ep_Q2_002_coefficient_09_0201
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0202 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1)]
]

/-- Partial product 202 for generator 9. -/
def ep_Q2_002_partial_09_0202 : Poly :=
[
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (6, 1), (12, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 9. -/
theorem ep_Q2_002_partial_09_0202_valid :
    mulPoly ep_Q2_002_coefficient_09_0202
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0203 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 1), (9, 1)]
]

/-- Partial product 203 for generator 9. -/
def ep_Q2_002_partial_09_0203 : Poly :=
[
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (9, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 9. -/
theorem ep_Q2_002_partial_09_0203_valid :
    mulPoly ep_Q2_002_coefficient_09_0203
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0204 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)]
]

/-- Partial product 204 for generator 9. -/
def ep_Q2_002_partial_09_0204 : Poly :=
[
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 9. -/
theorem ep_Q2_002_partial_09_0204_valid :
    mulPoly ep_Q2_002_coefficient_09_0204
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0205 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 1), (13, 1)]
]

/-- Partial product 205 for generator 9. -/
def ep_Q2_002_partial_09_0205 : Poly :=
[
  term ((367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (13, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 9. -/
theorem ep_Q2_002_partial_09_0205_valid :
    mulPoly ep_Q2_002_coefficient_09_0205
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0206 : Poly :=
[
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)]
]

/-- Partial product 206 for generator 9. -/
def ep_Q2_002_partial_09_0206 : Poly :=
[
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 9. -/
theorem ep_Q2_002_partial_09_0206_valid :
    mulPoly ep_Q2_002_coefficient_09_0206
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0207 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 9. -/
def ep_Q2_002_partial_09_0207 : Poly :=
[
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 9. -/
theorem ep_Q2_002_partial_09_0207_valid :
    mulPoly ep_Q2_002_coefficient_09_0207
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0208 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 2)]
]

/-- Partial product 208 for generator 9. -/
def ep_Q2_002_partial_09_0208 : Poly :=
[
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 2)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 9. -/
theorem ep_Q2_002_partial_09_0208_valid :
    mulPoly ep_Q2_002_coefficient_09_0208
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0209 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (8, 1)]
]

/-- Partial product 209 for generator 9. -/
def ep_Q2_002_partial_09_0209 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (8, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 9. -/
theorem ep_Q2_002_partial_09_0209_valid :
    mulPoly ep_Q2_002_coefficient_09_0209
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0210 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (9, 1), (15, 1)]
]

/-- Partial product 210 for generator 9. -/
def ep_Q2_002_partial_09_0210 : Poly :=
[
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (9, 1), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 9. -/
theorem ep_Q2_002_partial_09_0210_valid :
    mulPoly ep_Q2_002_coefficient_09_0210
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0211 : Poly :=
[
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)]
]

/-- Partial product 211 for generator 9. -/
def ep_Q2_002_partial_09_0211 : Poly :=
[
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 9. -/
theorem ep_Q2_002_partial_09_0211_valid :
    mulPoly ep_Q2_002_coefficient_09_0211
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0212 : Poly :=
[
  term ((405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 1), (12, 1)]
]

/-- Partial product 212 for generator 9. -/
def ep_Q2_002_partial_09_0212 : Poly :=
[
  term ((811427640791136329432340613824 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1)],
  term ((-405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 9. -/
theorem ep_Q2_002_partial_09_0212_valid :
    mulPoly ep_Q2_002_coefficient_09_0212
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0213 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1)]
]

/-- Partial product 213 for generator 9. -/
def ep_Q2_002_partial_09_0213 : Poly :=
[
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1), (14, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 9. -/
theorem ep_Q2_002_partial_09_0213_valid :
    mulPoly ep_Q2_002_coefficient_09_0213
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0214 : Poly :=
[
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1)]
]

/-- Partial product 214 for generator 9. -/
def ep_Q2_002_partial_09_0214 : Poly :=
[
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 9. -/
theorem ep_Q2_002_partial_09_0214_valid :
    mulPoly ep_Q2_002_coefficient_09_0214
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0215 : Poly :=
[
  term ((-711470458559495974939851948368 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (14, 1)]
]

/-- Partial product 215 for generator 9. -/
def ep_Q2_002_partial_09_0215 : Poly :=
[
  term ((-1422940917118991949879703896736 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (14, 1)],
  term ((711470458559495974939851948368 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 9. -/
theorem ep_Q2_002_partial_09_0215_valid :
    mulPoly ep_Q2_002_coefficient_09_0215
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0216 : Poly :=
[
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (15, 2)]
]

/-- Partial product 216 for generator 9. -/
def ep_Q2_002_partial_09_0216 : Poly :=
[
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 9. -/
theorem ep_Q2_002_partial_09_0216_valid :
    mulPoly ep_Q2_002_coefficient_09_0216
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0217 : Poly :=
[
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 217 for generator 9. -/
def ep_Q2_002_partial_09_0217 : Poly :=
[
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 9. -/
theorem ep_Q2_002_partial_09_0217_valid :
    mulPoly ep_Q2_002_coefficient_09_0217
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0218 : Poly :=
[
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2)]
]

/-- Partial product 218 for generator 9. -/
def ep_Q2_002_partial_09_0218 : Poly :=
[
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 9. -/
theorem ep_Q2_002_partial_09_0218_valid :
    mulPoly ep_Q2_002_coefficient_09_0218
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0219 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2), (12, 1)]
]

/-- Partial product 219 for generator 9. -/
def ep_Q2_002_partial_09_0219 : Poly :=
[
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 9. -/
theorem ep_Q2_002_partial_09_0219_valid :
    mulPoly ep_Q2_002_coefficient_09_0219
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0220 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1)]
]

/-- Partial product 220 for generator 9. -/
def ep_Q2_002_partial_09_0220 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (7, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 9. -/
theorem ep_Q2_002_partial_09_0220_valid :
    mulPoly ep_Q2_002_coefficient_09_0220
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0221 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 221 for generator 9. -/
def ep_Q2_002_partial_09_0221 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 9. -/
theorem ep_Q2_002_partial_09_0221_valid :
    mulPoly ep_Q2_002_coefficient_09_0221
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0222 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (14, 1)]
]

/-- Partial product 222 for generator 9. -/
def ep_Q2_002_partial_09_0222 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (3, 1), (5, 1), (7, 1), (14, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 9. -/
theorem ep_Q2_002_partial_09_0222_valid :
    mulPoly ep_Q2_002_coefficient_09_0222
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0223 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 223 for generator 9. -/
def ep_Q2_002_partial_09_0223 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 9. -/
theorem ep_Q2_002_partial_09_0223_valid :
    mulPoly ep_Q2_002_coefficient_09_0223
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0224 : Poly :=
[
  term ((-361741570445535644005850830520 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 224 for generator 9. -/
def ep_Q2_002_partial_09_0224 : Poly :=
[
  term ((-723483140891071288011701661040 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((361741570445535644005850830520 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 9. -/
theorem ep_Q2_002_partial_09_0224_valid :
    mulPoly ep_Q2_002_coefficient_09_0224
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0225 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)]
]

/-- Partial product 225 for generator 9. -/
def ep_Q2_002_partial_09_0225 : Poly :=
[
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 9. -/
theorem ep_Q2_002_partial_09_0225_valid :
    mulPoly ep_Q2_002_coefficient_09_0225
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0226 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 226 for generator 9. -/
def ep_Q2_002_partial_09_0226 : Poly :=
[
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 9. -/
theorem ep_Q2_002_partial_09_0226_valid :
    mulPoly ep_Q2_002_coefficient_09_0226
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0227 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 227 for generator 9. -/
def ep_Q2_002_partial_09_0227 : Poly :=
[
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 9. -/
theorem ep_Q2_002_partial_09_0227_valid :
    mulPoly ep_Q2_002_coefficient_09_0227
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0228 : Poly :=
[
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 228 for generator 9. -/
def ep_Q2_002_partial_09_0228 : Poly :=
[
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 9. -/
theorem ep_Q2_002_partial_09_0228_valid :
    mulPoly ep_Q2_002_coefficient_09_0228
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0229 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 9. -/
def ep_Q2_002_partial_09_0229 : Poly :=
[
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 9. -/
theorem ep_Q2_002_partial_09_0229_valid :
    mulPoly ep_Q2_002_coefficient_09_0229
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0230 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 2)]
]

/-- Partial product 230 for generator 9. -/
def ep_Q2_002_partial_09_0230 : Poly :=
[
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 2)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 9. -/
theorem ep_Q2_002_partial_09_0230_valid :
    mulPoly ep_Q2_002_coefficient_09_0230
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0231 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1)]
]

/-- Partial product 231 for generator 9. -/
def ep_Q2_002_partial_09_0231 : Poly :=
[
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (8, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 9. -/
theorem ep_Q2_002_partial_09_0231_valid :
    mulPoly ep_Q2_002_coefficient_09_0231
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0232 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 232 for generator 9. -/
def ep_Q2_002_partial_09_0232 : Poly :=
[
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 9. -/
theorem ep_Q2_002_partial_09_0232_valid :
    mulPoly ep_Q2_002_coefficient_09_0232
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0233 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 233 for generator 9. -/
def ep_Q2_002_partial_09_0233 : Poly :=
[
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 9. -/
theorem ep_Q2_002_partial_09_0233_valid :
    mulPoly ep_Q2_002_coefficient_09_0233
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0234 : Poly :=
[
  term ((-405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1)]
]

/-- Partial product 234 for generator 9. -/
def ep_Q2_002_partial_09_0234 : Poly :=
[
  term ((-811427640791136329432340613824 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1)],
  term ((405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 9. -/
theorem ep_Q2_002_partial_09_0234_valid :
    mulPoly ep_Q2_002_coefficient_09_0234
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0235 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 235 for generator 9. -/
def ep_Q2_002_partial_09_0235 : Poly :=
[
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 9. -/
theorem ep_Q2_002_partial_09_0235_valid :
    mulPoly ep_Q2_002_coefficient_09_0235
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0236 : Poly :=
[
  term ((-613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (14, 1)]
]

/-- Partial product 236 for generator 9. -/
def ep_Q2_002_partial_09_0236 : Poly :=
[
  term ((-1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 9. -/
theorem ep_Q2_002_partial_09_0236_valid :
    mulPoly ep_Q2_002_coefficient_09_0236
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0237 : Poly :=
[
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (15, 2)]
]

/-- Partial product 237 for generator 9. -/
def ep_Q2_002_partial_09_0237 : Poly :=
[
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (6, 1), (15, 2)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 9. -/
theorem ep_Q2_002_partial_09_0237_valid :
    mulPoly ep_Q2_002_coefficient_09_0237
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0238 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 238 for generator 9. -/
def ep_Q2_002_partial_09_0238 : Poly :=
[
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 9. -/
theorem ep_Q2_002_partial_09_0238_valid :
    mulPoly ep_Q2_002_coefficient_09_0238
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0239 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 239 for generator 9. -/
def ep_Q2_002_partial_09_0239 : Poly :=
[
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 9. -/
theorem ep_Q2_002_partial_09_0239_valid :
    mulPoly ep_Q2_002_coefficient_09_0239
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0240 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 240 for generator 9. -/
def ep_Q2_002_partial_09_0240 : Poly :=
[
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 9. -/
theorem ep_Q2_002_partial_09_0240_valid :
    mulPoly ep_Q2_002_coefficient_09_0240
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0241 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 241 for generator 9. -/
def ep_Q2_002_partial_09_0241 : Poly :=
[
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 9. -/
theorem ep_Q2_002_partial_09_0241_valid :
    mulPoly ep_Q2_002_coefficient_09_0241
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0242 : Poly :=
[
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 242 for generator 9. -/
def ep_Q2_002_partial_09_0242 : Poly :=
[
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 9. -/
theorem ep_Q2_002_partial_09_0242_valid :
    mulPoly ep_Q2_002_coefficient_09_0242
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0243 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 9. -/
def ep_Q2_002_partial_09_0243 : Poly :=
[
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 9. -/
theorem ep_Q2_002_partial_09_0243_valid :
    mulPoly ep_Q2_002_coefficient_09_0243
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0244 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (14, 1)]
]

/-- Partial product 244 for generator 9. -/
def ep_Q2_002_partial_09_0244 : Poly :=
[
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (7, 2), (14, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 9. -/
theorem ep_Q2_002_partial_09_0244_valid :
    mulPoly ep_Q2_002_coefficient_09_0244
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0245 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 1)]
]

/-- Partial product 245 for generator 9. -/
def ep_Q2_002_partial_09_0245 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (8, 1), (14, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 9. -/
theorem ep_Q2_002_partial_09_0245_valid :
    mulPoly ep_Q2_002_coefficient_09_0245
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0246 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 246 for generator 9. -/
def ep_Q2_002_partial_09_0246 : Poly :=
[
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 9. -/
theorem ep_Q2_002_partial_09_0246_valid :
    mulPoly ep_Q2_002_coefficient_09_0246
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0247 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 247 for generator 9. -/
def ep_Q2_002_partial_09_0247 : Poly :=
[
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 9. -/
theorem ep_Q2_002_partial_09_0247_valid :
    mulPoly ep_Q2_002_coefficient_09_0247
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0248 : Poly :=
[
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 1)]
]

/-- Partial product 248 for generator 9. -/
def ep_Q2_002_partial_09_0248 : Poly :=
[
  term ((-1252951825237464718032818647488 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1)],
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 9. -/
theorem ep_Q2_002_partial_09_0248_valid :
    mulPoly ep_Q2_002_coefficient_09_0248
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0249 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 249 for generator 9. -/
def ep_Q2_002_partial_09_0249 : Poly :=
[
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 9. -/
theorem ep_Q2_002_partial_09_0249_valid :
    mulPoly ep_Q2_002_coefficient_09_0249
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0250 : Poly :=
[
  term ((5409403201519578932274990536504 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 250 for generator 9. -/
def ep_Q2_002_partial_09_0250 : Poly :=
[
  term ((10818806403039157864549981073008 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-5409403201519578932274990536504 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 9. -/
theorem ep_Q2_002_partial_09_0250_valid :
    mulPoly ep_Q2_002_coefficient_09_0250
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0251 : Poly :=
[
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (14, 1), (15, 2)]
]

/-- Partial product 251 for generator 9. -/
def ep_Q2_002_partial_09_0251 : Poly :=
[
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 9. -/
theorem ep_Q2_002_partial_09_0251_valid :
    mulPoly ep_Q2_002_coefficient_09_0251
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0252 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 252 for generator 9. -/
def ep_Q2_002_partial_09_0252 : Poly :=
[
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 9. -/
theorem ep_Q2_002_partial_09_0252_valid :
    mulPoly ep_Q2_002_coefficient_09_0252
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0253 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 1)]
]

/-- Partial product 253 for generator 9. -/
def ep_Q2_002_partial_09_0253 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (5, 1), (6, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 9. -/
theorem ep_Q2_002_partial_09_0253_valid :
    mulPoly ep_Q2_002_coefficient_09_0253
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0254 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 254 for generator 9. -/
def ep_Q2_002_partial_09_0254 : Poly :=
[
  term ((2345622979022214119647616213376 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 9. -/
theorem ep_Q2_002_partial_09_0254_valid :
    mulPoly ep_Q2_002_coefficient_09_0254
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0255 : Poly :=
[
  term ((2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1)]
]

/-- Partial product 255 for generator 9. -/
def ep_Q2_002_partial_09_0255 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1)],
  term ((-2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 9. -/
theorem ep_Q2_002_partial_09_0255_valid :
    mulPoly ep_Q2_002_coefficient_09_0255
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0256 : Poly :=
[
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1)]
]

/-- Partial product 256 for generator 9. -/
def ep_Q2_002_partial_09_0256 : Poly :=
[
  term ((-21971709299870815468377193874688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1), (14, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 9. -/
theorem ep_Q2_002_partial_09_0256_valid :
    mulPoly ep_Q2_002_coefficient_09_0256
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0257 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 1)]
]

/-- Partial product 257 for generator 9. -/
def ep_Q2_002_partial_09_0257 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (14, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 9. -/
theorem ep_Q2_002_partial_09_0257_valid :
    mulPoly ep_Q2_002_coefficient_09_0257
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0258 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (15, 2)]
]

/-- Partial product 258 for generator 9. -/
def ep_Q2_002_partial_09_0258 : Poly :=
[
  term ((8312954790988180052920072534144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (15, 2)],
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 9. -/
theorem ep_Q2_002_partial_09_0258_valid :
    mulPoly ep_Q2_002_coefficient_09_0258
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0259 : Poly :=
[
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1)]
]

/-- Partial product 259 for generator 9. -/
def ep_Q2_002_partial_09_0259 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (9, 1)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 9. -/
theorem ep_Q2_002_partial_09_0259_valid :
    mulPoly ep_Q2_002_coefficient_09_0259
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0260 : Poly :=
[
  term ((46637213846167253158511956573616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1)]
]

/-- Partial product 260 for generator 9. -/
def ep_Q2_002_partial_09_0260 : Poly :=
[
  term ((93274427692334506317023913147232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1)],
  term ((-46637213846167253158511956573616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 9. -/
theorem ep_Q2_002_partial_09_0260_valid :
    mulPoly ep_Q2_002_coefficient_09_0260
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0261 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 261 for generator 9. -/
def ep_Q2_002_partial_09_0261 : Poly :=
[
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 9. -/
theorem ep_Q2_002_partial_09_0261_valid :
    mulPoly ep_Q2_002_coefficient_09_0261
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0262 : Poly :=
[
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1)]
]

/-- Partial product 262 for generator 9. -/
def ep_Q2_002_partial_09_0262 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (13, 1)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 9. -/
theorem ep_Q2_002_partial_09_0262_valid :
    mulPoly ep_Q2_002_coefficient_09_0262
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0263 : Poly :=
[
  term ((-22591541956366432416348319595201528108592 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (6, 1), (15, 1)]
]

/-- Partial product 263 for generator 9. -/
def ep_Q2_002_partial_09_0263 : Poly :=
[
  term ((-45183083912732864832696639190403056217184 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((22591541956366432416348319595201528108592 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 9. -/
theorem ep_Q2_002_partial_09_0263_valid :
    mulPoly ep_Q2_002_coefficient_09_0263
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0264 : Poly :=
[
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 264 for generator 9. -/
def ep_Q2_002_partial_09_0264 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 9. -/
theorem ep_Q2_002_partial_09_0264_valid :
    mulPoly ep_Q2_002_coefficient_09_0264
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0265 : Poly :=
[
  term ((771121821042083652725108447352 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 265 for generator 9. -/
def ep_Q2_002_partial_09_0265 : Poly :=
[
  term ((1542243642084167305450216894704 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (7, 1)],
  term ((-771121821042083652725108447352 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 9. -/
theorem ep_Q2_002_partial_09_0265_valid :
    mulPoly ep_Q2_002_coefficient_09_0265
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0266 : Poly :=
[
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (8, 1)]
]

/-- Partial product 266 for generator 9. -/
def ep_Q2_002_partial_09_0266 : Poly :=
[
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (8, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 9. -/
theorem ep_Q2_002_partial_09_0266_valid :
    mulPoly ep_Q2_002_coefficient_09_0266
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0267 : Poly :=
[
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 267 for generator 9. -/
def ep_Q2_002_partial_09_0267 : Poly :=
[
  term ((32047189985581250176232147123712 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 9. -/
theorem ep_Q2_002_partial_09_0267_valid :
    mulPoly ep_Q2_002_coefficient_09_0267
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0268 : Poly :=
[
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 268 for generator 9. -/
def ep_Q2_002_partial_09_0268 : Poly :=
[
  term ((390155114549454292952617578029568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 9. -/
theorem ep_Q2_002_partial_09_0268_valid :
    mulPoly ep_Q2_002_coefficient_09_0268
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0269 : Poly :=
[
  term ((-6280341307998706883268283567584 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 1)]
]

/-- Partial product 269 for generator 9. -/
def ep_Q2_002_partial_09_0269 : Poly :=
[
  term ((-12560682615997413766536567135168 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (12, 1)],
  term ((6280341307998706883268283567584 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 9. -/
theorem ep_Q2_002_partial_09_0269_valid :
    mulPoly ep_Q2_002_coefficient_09_0269
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0270 : Poly :=
[
  term ((-360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 270 for generator 9. -/
def ep_Q2_002_partial_09_0270 : Poly :=
[
  term ((-720599635165750640467369997931264 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 9. -/
theorem ep_Q2_002_partial_09_0270_valid :
    mulPoly ep_Q2_002_coefficient_09_0270
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0271 : Poly :=
[
  term ((-26083004779079191290412511424256 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 1)]
]

/-- Partial product 271 for generator 9. -/
def ep_Q2_002_partial_09_0271 : Poly :=
[
  term ((-52166009558158382580825022848512 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (14, 1)],
  term ((26083004779079191290412511424256 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 9. -/
theorem ep_Q2_002_partial_09_0271_valid :
    mulPoly ep_Q2_002_coefficient_09_0271
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0272 : Poly :=
[
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (7, 1), (15, 2)]
]

/-- Partial product 272 for generator 9. -/
def ep_Q2_002_partial_09_0272 : Poly :=
[
  term ((-2244206414374987957333299333783500317696256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2)],
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 9. -/
theorem ep_Q2_002_partial_09_0272_valid :
    mulPoly ep_Q2_002_coefficient_09_0272
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0273 : Poly :=
[
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 273 for generator 9. -/
def ep_Q2_002_partial_09_0273 : Poly :=
[
  term ((-305920653408 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 9. -/
theorem ep_Q2_002_partial_09_0273_valid :
    mulPoly ep_Q2_002_coefficient_09_0273
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0274 : Poly :=
[
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 2), (15, 1)]
]

/-- Partial product 274 for generator 9. -/
def ep_Q2_002_partial_09_0274 : Poly :=
[
  term ((57633634447981455265059241442688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 2), (15, 1)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 9. -/
theorem ep_Q2_002_partial_09_0274_valid :
    mulPoly ep_Q2_002_coefficient_09_0274
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0275 : Poly :=
[
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (15, 1)]
]

/-- Partial product 275 for generator 9. -/
def ep_Q2_002_partial_09_0275 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1)],
  term ((-1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 9. -/
theorem ep_Q2_002_partial_09_0275_valid :
    mulPoly ep_Q2_002_coefficient_09_0275
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0276 : Poly :=
[
  term ((166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 276 for generator 9. -/
def ep_Q2_002_partial_09_0276 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 9. -/
theorem ep_Q2_002_partial_09_0276_valid :
    mulPoly ep_Q2_002_coefficient_09_0276
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0277 : Poly :=
[
  term ((-1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 1)]
]

/-- Partial product 277 for generator 9. -/
def ep_Q2_002_partial_09_0277 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (14, 1)],
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 9. -/
theorem ep_Q2_002_partial_09_0277_valid :
    mulPoly ep_Q2_002_coefficient_09_0277
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0278 : Poly :=
[
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (15, 2)]
]

/-- Partial product 278 for generator 9. -/
def ep_Q2_002_partial_09_0278 : Poly :=
[
  term ((-10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (15, 2)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 9. -/
theorem ep_Q2_002_partial_09_0278_valid :
    mulPoly ep_Q2_002_coefficient_09_0278
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0279 : Poly :=
[
  term ((528037812592785206818545952800 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 279 for generator 9. -/
def ep_Q2_002_partial_09_0279 : Poly :=
[
  term ((1056075625185570413637091905600 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-528037812592785206818545952800 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 9. -/
theorem ep_Q2_002_partial_09_0279_valid :
    mulPoly ep_Q2_002_coefficient_09_0279
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0280 : Poly :=
[
  term ((-36342654626175531549108430564656 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 1)]
]

/-- Partial product 280 for generator 9. -/
def ep_Q2_002_partial_09_0280 : Poly :=
[
  term ((-72685309252351063098216861129312 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1)],
  term ((36342654626175531549108430564656 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 9. -/
theorem ep_Q2_002_partial_09_0280_valid :
    mulPoly ep_Q2_002_coefficient_09_0280
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0281 : Poly :=
[
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (15, 2)]
]

/-- Partial product 281 for generator 9. -/
def ep_Q2_002_partial_09_0281 : Poly :=
[
  term ((-130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 9. -/
theorem ep_Q2_002_partial_09_0281_valid :
    mulPoly ep_Q2_002_coefficient_09_0281
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0282 : Poly :=
[
  term ((-11696765767737080962526529240672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 282 for generator 9. -/
def ep_Q2_002_partial_09_0282 : Poly :=
[
  term ((-23393531535474161925053058481344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((11696765767737080962526529240672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 9. -/
theorem ep_Q2_002_partial_09_0282_valid :
    mulPoly ep_Q2_002_coefficient_09_0282
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0283 : Poly :=
[
  term ((-8301195132180155242166743638672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 283 for generator 9. -/
def ep_Q2_002_partial_09_0283 : Poly :=
[
  term ((-16602390264360310484333487277344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((8301195132180155242166743638672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 9. -/
theorem ep_Q2_002_partial_09_0283_valid :
    mulPoly ep_Q2_002_coefficient_09_0283
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0284 : Poly :=
[
  term ((6471498934361592528962642584608 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 284 for generator 9. -/
def ep_Q2_002_partial_09_0284 : Poly :=
[
  term ((12942997868723185057925285169216 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1)],
  term ((-6471498934361592528962642584608 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 9. -/
theorem ep_Q2_002_partial_09_0284_valid :
    mulPoly ep_Q2_002_coefficient_09_0284
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0285 : Poly :=
[
  term ((8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (13, 1), (15, 2)]
]

/-- Partial product 285 for generator 9. -/
def ep_Q2_002_partial_09_0285 : Poly :=
[
  term ((17752015743631584637682074955520 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((-8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 9. -/
theorem ep_Q2_002_partial_09_0285_valid :
    mulPoly ep_Q2_002_coefficient_09_0285
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0286 : Poly :=
[
  term ((-111736832756261175044802319987326365727104 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 286 for generator 9. -/
def ep_Q2_002_partial_09_0286 : Poly :=
[
  term ((-223473665512522350089604639974652731454208 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((111736832756261175044802319987326365727104 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 9. -/
theorem ep_Q2_002_partial_09_0286_valid :
    mulPoly ep_Q2_002_coefficient_09_0286
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0287 : Poly :=
[
  term ((20537663828 : Rat) / 7401317245) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 287 for generator 9. -/
def ep_Q2_002_partial_09_0287 : Poly :=
[
  term ((41075327656 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20537663828 : Rat) / 7401317245) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 9. -/
theorem ep_Q2_002_partial_09_0287_valid :
    mulPoly ep_Q2_002_coefficient_09_0287
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0288 : Poly :=
[
  term ((-46985649370684740272365891257631123861672 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 288 for generator 9. -/
def ep_Q2_002_partial_09_0288 : Poly :=
[
  term ((-93971298741369480544731782515262247723344 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((46985649370684740272365891257631123861672 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 9. -/
theorem ep_Q2_002_partial_09_0288_valid :
    mulPoly ep_Q2_002_coefficient_09_0288
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0289 : Poly :=
[
  term ((-2043666262 : Rat) / 1480263449) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 9. -/
def ep_Q2_002_partial_09_0289 : Poly :=
[
  term ((-4087332524 : Rat) / 1480263449) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((2043666262 : Rat) / 1480263449) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 9. -/
theorem ep_Q2_002_partial_09_0289_valid :
    mulPoly ep_Q2_002_coefficient_09_0289
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0290 : Poly :=
[
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 3)]
]

/-- Partial product 290 for generator 9. -/
def ep_Q2_002_partial_09_0290 : Poly :=
[
  term ((745809674377051221998173723204418943823232 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 9. -/
theorem ep_Q2_002_partial_09_0290_valid :
    mulPoly ep_Q2_002_coefficient_09_0290
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0291 : Poly :=
[
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

/-- Partial product 291 for generator 9. -/
def ep_Q2_002_partial_09_0291 : Poly :=
[
  term ((101973551136 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (15, 3), (16, 1)],
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 9. -/
theorem ep_Q2_002_partial_09_0291_valid :
    mulPoly ep_Q2_002_coefficient_09_0291
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0292 : Poly :=
[
  term ((-293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 2), (7, 1)]
]

/-- Partial product 292 for generator 9. -/
def ep_Q2_002_partial_09_0292 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 2), (7, 1)],
  term ((293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 9. -/
theorem ep_Q2_002_partial_09_0292_valid :
    mulPoly ep_Q2_002_coefficient_09_0292
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0293 : Poly :=
[
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (12, 1), (15, 1)]
]

/-- Partial product 293 for generator 9. -/
def ep_Q2_002_partial_09_0293 : Poly :=
[
  term ((21971709299870815468377193874688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (12, 1), (15, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 9. -/
theorem ep_Q2_002_partial_09_0293_valid :
    mulPoly ep_Q2_002_coefficient_09_0293
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0294 : Poly :=
[
  term ((-2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (13, 1)]
]

/-- Partial product 294 for generator 9. -/
def ep_Q2_002_partial_09_0294 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (13, 1)],
  term ((2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 9. -/
theorem ep_Q2_002_partial_09_0294_valid :
    mulPoly ep_Q2_002_coefficient_09_0294
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0295 : Poly :=
[
  term ((-1039119348873522506615009066768 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (15, 1)]
]

/-- Partial product 295 for generator 9. -/
def ep_Q2_002_partial_09_0295 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((1039119348873522506615009066768 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 9. -/
theorem ep_Q2_002_partial_09_0295_valid :
    mulPoly ep_Q2_002_coefficient_09_0295
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0296 : Poly :=
[
  term ((-888220121617392736547657352948 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)]
]

/-- Partial product 296 for generator 9. -/
def ep_Q2_002_partial_09_0296 : Poly :=
[
  term ((-1776440243234785473095314705896 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1)],
  term ((888220121617392736547657352948 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 9. -/
theorem ep_Q2_002_partial_09_0296_valid :
    mulPoly ep_Q2_002_coefficient_09_0296
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0297 : Poly :=
[
  term ((-9028868093283425656951308727528 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)]
]

/-- Partial product 297 for generator 9. -/
def ep_Q2_002_partial_09_0297 : Poly :=
[
  term ((-18057736186566851313902617455056 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1)],
  term ((9028868093283425656951308727528 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 9. -/
theorem ep_Q2_002_partial_09_0297_valid :
    mulPoly ep_Q2_002_coefficient_09_0297
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0298 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 298 for generator 9. -/
def ep_Q2_002_partial_09_0298 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 9. -/
theorem ep_Q2_002_partial_09_0298_valid :
    mulPoly ep_Q2_002_coefficient_09_0298
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0299 : Poly :=
[
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1)]
]

/-- Partial product 299 for generator 9. -/
def ep_Q2_002_partial_09_0299 : Poly :=
[
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (8, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 9. -/
theorem ep_Q2_002_partial_09_0299_valid :
    mulPoly ep_Q2_002_coefficient_09_0299
        ep_Q2_002_generator_09_0200_0299 =
      ep_Q2_002_partial_09_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_0200_0299 : List Poly :=
[
  ep_Q2_002_partial_09_0200,
  ep_Q2_002_partial_09_0201,
  ep_Q2_002_partial_09_0202,
  ep_Q2_002_partial_09_0203,
  ep_Q2_002_partial_09_0204,
  ep_Q2_002_partial_09_0205,
  ep_Q2_002_partial_09_0206,
  ep_Q2_002_partial_09_0207,
  ep_Q2_002_partial_09_0208,
  ep_Q2_002_partial_09_0209,
  ep_Q2_002_partial_09_0210,
  ep_Q2_002_partial_09_0211,
  ep_Q2_002_partial_09_0212,
  ep_Q2_002_partial_09_0213,
  ep_Q2_002_partial_09_0214,
  ep_Q2_002_partial_09_0215,
  ep_Q2_002_partial_09_0216,
  ep_Q2_002_partial_09_0217,
  ep_Q2_002_partial_09_0218,
  ep_Q2_002_partial_09_0219,
  ep_Q2_002_partial_09_0220,
  ep_Q2_002_partial_09_0221,
  ep_Q2_002_partial_09_0222,
  ep_Q2_002_partial_09_0223,
  ep_Q2_002_partial_09_0224,
  ep_Q2_002_partial_09_0225,
  ep_Q2_002_partial_09_0226,
  ep_Q2_002_partial_09_0227,
  ep_Q2_002_partial_09_0228,
  ep_Q2_002_partial_09_0229,
  ep_Q2_002_partial_09_0230,
  ep_Q2_002_partial_09_0231,
  ep_Q2_002_partial_09_0232,
  ep_Q2_002_partial_09_0233,
  ep_Q2_002_partial_09_0234,
  ep_Q2_002_partial_09_0235,
  ep_Q2_002_partial_09_0236,
  ep_Q2_002_partial_09_0237,
  ep_Q2_002_partial_09_0238,
  ep_Q2_002_partial_09_0239,
  ep_Q2_002_partial_09_0240,
  ep_Q2_002_partial_09_0241,
  ep_Q2_002_partial_09_0242,
  ep_Q2_002_partial_09_0243,
  ep_Q2_002_partial_09_0244,
  ep_Q2_002_partial_09_0245,
  ep_Q2_002_partial_09_0246,
  ep_Q2_002_partial_09_0247,
  ep_Q2_002_partial_09_0248,
  ep_Q2_002_partial_09_0249,
  ep_Q2_002_partial_09_0250,
  ep_Q2_002_partial_09_0251,
  ep_Q2_002_partial_09_0252,
  ep_Q2_002_partial_09_0253,
  ep_Q2_002_partial_09_0254,
  ep_Q2_002_partial_09_0255,
  ep_Q2_002_partial_09_0256,
  ep_Q2_002_partial_09_0257,
  ep_Q2_002_partial_09_0258,
  ep_Q2_002_partial_09_0259,
  ep_Q2_002_partial_09_0260,
  ep_Q2_002_partial_09_0261,
  ep_Q2_002_partial_09_0262,
  ep_Q2_002_partial_09_0263,
  ep_Q2_002_partial_09_0264,
  ep_Q2_002_partial_09_0265,
  ep_Q2_002_partial_09_0266,
  ep_Q2_002_partial_09_0267,
  ep_Q2_002_partial_09_0268,
  ep_Q2_002_partial_09_0269,
  ep_Q2_002_partial_09_0270,
  ep_Q2_002_partial_09_0271,
  ep_Q2_002_partial_09_0272,
  ep_Q2_002_partial_09_0273,
  ep_Q2_002_partial_09_0274,
  ep_Q2_002_partial_09_0275,
  ep_Q2_002_partial_09_0276,
  ep_Q2_002_partial_09_0277,
  ep_Q2_002_partial_09_0278,
  ep_Q2_002_partial_09_0279,
  ep_Q2_002_partial_09_0280,
  ep_Q2_002_partial_09_0281,
  ep_Q2_002_partial_09_0282,
  ep_Q2_002_partial_09_0283,
  ep_Q2_002_partial_09_0284,
  ep_Q2_002_partial_09_0285,
  ep_Q2_002_partial_09_0286,
  ep_Q2_002_partial_09_0287,
  ep_Q2_002_partial_09_0288,
  ep_Q2_002_partial_09_0289,
  ep_Q2_002_partial_09_0290,
  ep_Q2_002_partial_09_0291,
  ep_Q2_002_partial_09_0292,
  ep_Q2_002_partial_09_0293,
  ep_Q2_002_partial_09_0294,
  ep_Q2_002_partial_09_0295,
  ep_Q2_002_partial_09_0296,
  ep_Q2_002_partial_09_0297,
  ep_Q2_002_partial_09_0298,
  ep_Q2_002_partial_09_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_0200_0299 : Poly :=
[
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (6, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (6, 1), (12, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (9, 1)],
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (13, 1)],
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (7, 2)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (8, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (9, 1), (15, 1)],
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((811427640791136329432340613824 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (12, 1), (14, 1)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((-1422940917118991949879703896736 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1), (14, 1)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2)],
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 2), (12, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (7, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (3, 1), (5, 1), (7, 1), (14, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((-723483140891071288011701661040 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (7, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (8, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-811427640791136329432340613824 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (6, 1), (12, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (6, 1), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (7, 2), (14, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (8, 1), (14, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1252951825237464718032818647488 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (3, 1), (12, 1), (14, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((10818806403039157864549981073008 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (5, 1), (6, 1)],
  term ((2345622979022214119647616213376 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1)],
  term ((-21971709299870815468377193874688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1), (14, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (14, 1)],
  term ((8312954790988180052920072534144 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (15, 2)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (9, 1)],
  term ((93274427692334506317023913147232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (6, 1), (13, 1)],
  term ((-45183083912732864832696639190403056217184 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1542243642084167305450216894704 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (7, 1)],
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (8, 1)],
  term ((32047189985581250176232147123712 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((390155114549454292952617578029568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((-12560682615997413766536567135168 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (12, 1)],
  term ((-720599635165750640467369997931264 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-52166009558158382580825022848512 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (14, 1)],
  term ((-2244206414374987957333299333783500317696256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2)],
  term ((-305920653408 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((57633634447981455265059241442688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 2), (15, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (8, 1), (15, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (14, 1)],
  term ((-10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (9, 1), (15, 2)],
  term ((1056075625185570413637091905600 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-72685309252351063098216861129312 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (14, 1)],
  term ((-130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (11, 1), (15, 2)],
  term ((-23393531535474161925053058481344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-16602390264360310484333487277344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((12942997868723185057925285169216 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1)],
  term ((17752015743631584637682074955520 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((-223473665512522350089604639974652731454208 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((41075327656 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-93971298741369480544731782515262247723344 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-4087332524 : Rat) / 1480263449) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((745809674377051221998173723204418943823232 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((101973551136 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (15, 3), (16, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (4, 2), (7, 1)],
  term ((21971709299870815468377193874688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (12, 1), (15, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (13, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-1776440243234785473095314705896 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1)],
  term ((-18057736186566851313902617455056 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (8, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (6, 1), (12, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 1), (9, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 1), (13, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (7, 2)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (8, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (9, 1), (15, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1)],
  term ((-405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (4, 1), (12, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((711470458559495974939851948368 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (14, 1)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 2), (12, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (6, 1), (7, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (14, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((361741570445535644005850830520 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (9, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (11, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 2)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (14, 1)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (14, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5409403201519578932274990536504 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 1)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 1)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 1)],
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (15, 2)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1)],
  term ((-46637213846167253158511956573616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1)],
  term ((22591541956366432416348319595201528108592 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (6, 1), (15, 1)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-771121821042083652725108447352 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (7, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (8, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((6280341307998706883268283567584 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 1)],
  term ((360299817582875320233684998965632 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((26083004779079191290412511424256 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 1)],
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (7, 1), (15, 2)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 2), (15, 1)],
  term ((-1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (8, 1), (15, 1)],
  term ((-166954135443324259510598911872 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1)],
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-528037812592785206818545952800 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (11, 1)],
  term ((36342654626175531549108430564656 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 1)],
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((11696765767737080962526529240672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((8301195132180155242166743638672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)],
  term ((-6471498934361592528962642584608 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term ((-8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((111736832756261175044802319987326365727104 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((-20537663828 : Rat) / 7401317245) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((46985649370684740272365891257631123861672 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (4, 1), (15, 1)],
  term ((2043666262 : Rat) / 1480263449) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 3)],
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 2), (7, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (12, 1), (15, 1)],
  term ((2746463662483851933547149234336 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (13, 1)],
  term ((1039119348873522506615009066768 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 2), (15, 1)],
  term ((888220121617392736547657352948 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)],
  term ((9028868093283425656951308727528 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 200 through 299. -/
theorem ep_Q2_002_block_09_0200_0299_valid :
    checkProductSumEq ep_Q2_002_partials_09_0200_0299
      ep_Q2_002_block_09_0200_0299 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
