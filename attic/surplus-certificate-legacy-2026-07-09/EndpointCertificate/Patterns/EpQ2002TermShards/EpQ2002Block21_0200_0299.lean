/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 21:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_21_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0200 : Poly :=
[
  term ((312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 1), (15, 1)]
]

/-- Partial product 200 for generator 21. -/
def ep_Q2_002_partial_21_0200 : Poly :=
[
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((624820994695497283979198664198734830116576 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 21. -/
theorem ep_Q2_002_partial_21_0200_valid :
    mulPoly ep_Q2_002_coefficient_21_0200
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0201 : Poly :=
[
  term ((-5130926716 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 21. -/
def ep_Q2_002_partial_21_0201 : Poly :=
[
  term ((5130926716 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10261853432 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 21. -/
theorem ep_Q2_002_partial_21_0201_valid :
    mulPoly ep_Q2_002_coefficient_21_0201
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0202 : Poly :=
[
  term ((10624765533227947803238467165648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 202 for generator 21. -/
def ep_Q2_002_partial_21_0202 : Poly :=
[
  term ((21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-10624765533227947803238467165648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 21. -/
theorem ep_Q2_002_partial_21_0202_valid :
    mulPoly ep_Q2_002_coefficient_21_0202
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0203 : Poly :=
[
  term ((-24014011339497326574859070514992 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1)]
]

/-- Partial product 203 for generator 21. -/
def ep_Q2_002_partial_21_0203 : Poly :=
[
  term ((-48028022678994653149718141029984 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1)],
  term ((24014011339497326574859070514992 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 21. -/
theorem ep_Q2_002_partial_21_0203_valid :
    mulPoly ep_Q2_002_coefficient_21_0203
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0204 : Poly :=
[
  term ((48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 204 for generator 21. -/
def ep_Q2_002_partial_21_0204 : Poly :=
[
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 21. -/
theorem ep_Q2_002_partial_21_0204_valid :
    mulPoly ep_Q2_002_coefficient_21_0204
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0205 : Poly :=
[
  term ((-72881599214385935929660780312735918670816 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 205 for generator 21. -/
def ep_Q2_002_partial_21_0205 : Poly :=
[
  term ((-145763198428771871859321560625471837341632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((72881599214385935929660780312735918670816 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 21. -/
theorem ep_Q2_002_partial_21_0205_valid :
    mulPoly ep_Q2_002_coefficient_21_0205
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0206 : Poly :=
[
  term ((14304889212 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 21. -/
def ep_Q2_002_partial_21_0206 : Poly :=
[
  term ((28609778424 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 21. -/
theorem ep_Q2_002_partial_21_0206_valid :
    mulPoly ep_Q2_002_coefficient_21_0206
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0207 : Poly :=
[
  term ((-21007630737334825507822556526944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 207 for generator 21. -/
def ep_Q2_002_partial_21_0207 : Poly :=
[
  term ((-42015261474669651015645113053888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((21007630737334825507822556526944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 21. -/
theorem ep_Q2_002_partial_21_0207_valid :
    mulPoly ep_Q2_002_coefficient_21_0207
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0208 : Poly :=
[
  term ((156205248673874320994799666049683707529144 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 208 for generator 21. -/
def ep_Q2_002_partial_21_0208 : Poly :=
[
  term ((312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((-156205248673874320994799666049683707529144 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 21. -/
theorem ep_Q2_002_partial_21_0208_valid :
    mulPoly ep_Q2_002_coefficient_21_0208
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0209 : Poly :=
[
  term ((-2565463358 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 21. -/
def ep_Q2_002_partial_21_0209 : Poly :=
[
  term ((-5130926716 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((2565463358 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 21. -/
theorem ep_Q2_002_partial_21_0209_valid :
    mulPoly ep_Q2_002_coefficient_21_0209
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0210 : Poly :=
[
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)]
]

/-- Partial product 210 for generator 21. -/
def ep_Q2_002_partial_21_0210 : Poly :=
[
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)],
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 21. -/
theorem ep_Q2_002_partial_21_0210_valid :
    mulPoly ep_Q2_002_coefficient_21_0210
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0211 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 211 for generator 21. -/
def ep_Q2_002_partial_21_0211 : Poly :=
[
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 21. -/
theorem ep_Q2_002_partial_21_0211_valid :
    mulPoly ep_Q2_002_coefficient_21_0211
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0212 : Poly :=
[
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1)]
]

/-- Partial product 212 for generator 21. -/
def ep_Q2_002_partial_21_0212 : Poly :=
[
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1)],
  term ((-6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 21. -/
theorem ep_Q2_002_partial_21_0212_valid :
    mulPoly ep_Q2_002_coefficient_21_0212
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0213 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 213 for generator 21. -/
def ep_Q2_002_partial_21_0213 : Poly :=
[
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 21. -/
theorem ep_Q2_002_partial_21_0213_valid :
    mulPoly ep_Q2_002_coefficient_21_0213
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0214 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 214 for generator 21. -/
def ep_Q2_002_partial_21_0214 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 21. -/
theorem ep_Q2_002_partial_21_0214_valid :
    mulPoly ep_Q2_002_coefficient_21_0214
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0215 : Poly :=
[
  term ((1039119348873522506615009066768 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 215 for generator 21. -/
def ep_Q2_002_partial_21_0215 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term ((-1039119348873522506615009066768 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 21. -/
theorem ep_Q2_002_partial_21_0215_valid :
    mulPoly ep_Q2_002_coefficient_21_0215
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0216 : Poly :=
[
  term ((293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2)]
]

/-- Partial product 216 for generator 21. -/
def ep_Q2_002_partial_21_0216 : Poly :=
[
  term ((-293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 21. -/
theorem ep_Q2_002_partial_21_0216_valid :
    mulPoly ep_Q2_002_coefficient_21_0216
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0217 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2), (10, 1)]
]

/-- Partial product 217 for generator 21. -/
def ep_Q2_002_partial_21_0217 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2), (10, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 21. -/
theorem ep_Q2_002_partial_21_0217_valid :
    mulPoly ep_Q2_002_coefficient_21_0217
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0218 : Poly :=
[
  term ((-247713257658506218668617745504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 218 for generator 21. -/
def ep_Q2_002_partial_21_0218 : Poly :=
[
  term ((-495426515317012437337235491008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (10, 1), (12, 1)],
  term ((247713257658506218668617745504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 21. -/
theorem ep_Q2_002_partial_21_0218_valid :
    mulPoly ep_Q2_002_coefficient_21_0218
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0219 : Poly :=
[
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 219 for generator 21. -/
def ep_Q2_002_partial_21_0219 : Poly :=
[
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(1, 1), (6, 1), (7, 1)],
  term ((2139782730770747845440 : Rat) / 253528477699481291099) [(1, 1), (6, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 21. -/
theorem ep_Q2_002_partial_21_0219_valid :
    mulPoly ep_Q2_002_coefficient_21_0219
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0220 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 220 for generator 21. -/
def ep_Q2_002_partial_21_0220 : Poly :=
[
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 21. -/
theorem ep_Q2_002_partial_21_0220_valid :
    mulPoly ep_Q2_002_coefficient_21_0220
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0221 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 221 for generator 21. -/
def ep_Q2_002_partial_21_0221 : Poly :=
[
  term ((367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 21. -/
theorem ep_Q2_002_partial_21_0221_valid :
    mulPoly ep_Q2_002_coefficient_21_0221
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0222 : Poly :=
[
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 222 for generator 21. -/
def ep_Q2_002_partial_21_0222 : Poly :=
[
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 21. -/
theorem ep_Q2_002_partial_21_0222_valid :
    mulPoly ep_Q2_002_coefficient_21_0222
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0223 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 21. -/
def ep_Q2_002_partial_21_0223 : Poly :=
[
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 21. -/
theorem ep_Q2_002_partial_21_0223_valid :
    mulPoly ep_Q2_002_coefficient_21_0223
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0224 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 2)]
]

/-- Partial product 224 for generator 21. -/
def ep_Q2_002_partial_21_0224 : Poly :=
[
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 2)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 21. -/
theorem ep_Q2_002_partial_21_0224_valid :
    mulPoly ep_Q2_002_coefficient_21_0224
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0225 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 2), (11, 1)]
]

/-- Partial product 225 for generator 21. -/
def ep_Q2_002_partial_21_0225 : Poly :=
[
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 2), (10, 1), (11, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 21. -/
theorem ep_Q2_002_partial_21_0225_valid :
    mulPoly ep_Q2_002_coefficient_21_0225
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0226 : Poly :=
[
  term ((-59278050915783734706276927104976 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 226 for generator 21. -/
def ep_Q2_002_partial_21_0226 : Poly :=
[
  term ((-118556101831567469412553854209952 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((59278050915783734706276927104976 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 21. -/
theorem ep_Q2_002_partial_21_0226_valid :
    mulPoly ep_Q2_002_coefficient_21_0226
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0227 : Poly :=
[
  term ((124384479309981426291892942130880 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 227 for generator 21. -/
def ep_Q2_002_partial_21_0227 : Poly :=
[
  term ((248768958619962852583785884261760 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((-124384479309981426291892942130880 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 21. -/
theorem ep_Q2_002_partial_21_0227_valid :
    mulPoly ep_Q2_002_coefficient_21_0227
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0228 : Poly :=
[
  term ((847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 228 for generator 21. -/
def ep_Q2_002_partial_21_0228 : Poly :=
[
  term ((1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 21. -/
theorem ep_Q2_002_partial_21_0228_valid :
    mulPoly ep_Q2_002_coefficient_21_0228
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0229 : Poly :=
[
  term ((61246522028 : Rat) / 7401317245) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 229 for generator 21. -/
def ep_Q2_002_partial_21_0229 : Poly :=
[
  term ((122493044056 : Rat) / 7401317245) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 21. -/
theorem ep_Q2_002_partial_21_0229_valid :
    mulPoly ep_Q2_002_coefficient_21_0229
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0230 : Poly :=
[
  term ((-6190114411005038325868163380896 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 230 for generator 21. -/
def ep_Q2_002_partial_21_0230 : Poly :=
[
  term ((6190114411005038325868163380896 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)],
  term ((-12380228822010076651736326761792 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 21. -/
theorem ep_Q2_002_partial_21_0230_valid :
    mulPoly ep_Q2_002_coefficient_21_0230
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0231 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 231 for generator 21. -/
def ep_Q2_002_partial_21_0231 : Poly :=
[
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 21. -/
theorem ep_Q2_002_partial_21_0231_valid :
    mulPoly ep_Q2_002_coefficient_21_0231
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0232 : Poly :=
[
  term ((25136666926104291569589792187008 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (11, 1)]
]

/-- Partial product 232 for generator 21. -/
def ep_Q2_002_partial_21_0232 : Poly :=
[
  term ((-25136666926104291569589792187008 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((50273333852208583139179584374016 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 21. -/
theorem ep_Q2_002_partial_21_0232_valid :
    mulPoly ep_Q2_002_coefficient_21_0232
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0233 : Poly :=
[
  term ((-51484218912504674868521337230592 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (13, 1)]
]

/-- Partial product 233 for generator 21. -/
def ep_Q2_002_partial_21_0233 : Poly :=
[
  term ((51484218912504674868521337230592 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 21. -/
theorem ep_Q2_002_partial_21_0233_valid :
    mulPoly ep_Q2_002_coefficient_21_0233
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0234 : Poly :=
[
  term ((-40237514641192072847410994088921181231248 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 234 for generator 21. -/
def ep_Q2_002_partial_21_0234 : Poly :=
[
  term ((40237514641192072847410994088921181231248 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-80475029282384145694821988177842362462496 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (6, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 21. -/
theorem ep_Q2_002_partial_21_0234_valid :
    mulPoly ep_Q2_002_coefficient_21_0234
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0235 : Poly :=
[
  term ((-4392978188 : Rat) / 1480263449) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 21. -/
def ep_Q2_002_partial_21_0235 : Poly :=
[
  term ((4392978188 : Rat) / 1480263449) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-8785956376 : Rat) / 1480263449) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 21. -/
theorem ep_Q2_002_partial_21_0235_valid :
    mulPoly ep_Q2_002_coefficient_21_0235
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0236 : Poly :=
[
  term ((53508550612082527587491807271624 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 236 for generator 21. -/
def ep_Q2_002_partial_21_0236 : Poly :=
[
  term ((107017101224165055174983614543248 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((-53508550612082527587491807271624 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 21. -/
theorem ep_Q2_002_partial_21_0236_valid :
    mulPoly ep_Q2_002_coefficient_21_0236
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0237 : Poly :=
[
  term ((3296448496519742962692021635520 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 237 for generator 21. -/
def ep_Q2_002_partial_21_0237 : Poly :=
[
  term ((6592896993039485925384043271040 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-3296448496519742962692021635520 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 21. -/
theorem ep_Q2_002_partial_21_0237_valid :
    mulPoly ep_Q2_002_coefficient_21_0237
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0238 : Poly :=
[
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 238 for generator 21. -/
def ep_Q2_002_partial_21_0238 : Poly :=
[
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 21. -/
theorem ep_Q2_002_partial_21_0238_valid :
    mulPoly ep_Q2_002_coefficient_21_0238
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0239 : Poly :=
[
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 239 for generator 21. -/
def ep_Q2_002_partial_21_0239 : Poly :=
[
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 2)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 21. -/
theorem ep_Q2_002_partial_21_0239_valid :
    mulPoly ep_Q2_002_coefficient_21_0239
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0240 : Poly :=
[
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 240 for generator 21. -/
def ep_Q2_002_partial_21_0240 : Poly :=
[
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 21. -/
theorem ep_Q2_002_partial_21_0240_valid :
    mulPoly ep_Q2_002_coefficient_21_0240
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0241 : Poly :=
[
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 241 for generator 21. -/
def ep_Q2_002_partial_21_0241 : Poly :=
[
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 21. -/
theorem ep_Q2_002_partial_21_0241_valid :
    mulPoly ep_Q2_002_coefficient_21_0241
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0242 : Poly :=
[
  term ((-64345863447570381402836755883520 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 242 for generator 21. -/
def ep_Q2_002_partial_21_0242 : Poly :=
[
  term ((-128691726895140762805673511767040 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((64345863447570381402836755883520 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 21. -/
theorem ep_Q2_002_partial_21_0242_valid :
    mulPoly ep_Q2_002_coefficient_21_0242
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0243 : Poly :=
[
  term ((-919899738167902823005517005946193676882272 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 243 for generator 21. -/
def ep_Q2_002_partial_21_0243 : Poly :=
[
  term ((-1839799476335805646011034011892387353764544 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((919899738167902823005517005946193676882272 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 21. -/
theorem ep_Q2_002_partial_21_0243_valid :
    mulPoly ep_Q2_002_coefficient_21_0243
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0244 : Poly :=
[
  term ((-46941632816 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 21. -/
def ep_Q2_002_partial_21_0244 : Poly :=
[
  term ((-93883265632 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 21. -/
theorem ep_Q2_002_partial_21_0244_valid :
    mulPoly ep_Q2_002_coefficient_21_0244
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0245 : Poly :=
[
  term ((-9761525190006929209588852357248 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 245 for generator 21. -/
def ep_Q2_002_partial_21_0245 : Poly :=
[
  term ((-19523050380013858419177704714496 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((9761525190006929209588852357248 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 21. -/
theorem ep_Q2_002_partial_21_0245_valid :
    mulPoly ep_Q2_002_coefficient_21_0245
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0246 : Poly :=
[
  term ((197338462762932714210777022787042909437824 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 246 for generator 21. -/
def ep_Q2_002_partial_21_0246 : Poly :=
[
  term ((394676925525865428421554045574085818875648 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-197338462762932714210777022787042909437824 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 21. -/
theorem ep_Q2_002_partial_21_0246_valid :
    mulPoly ep_Q2_002_coefficient_21_0246
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0247 : Poly :=
[
  term ((-27868255928 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 21. -/
def ep_Q2_002_partial_21_0247 : Poly :=
[
  term ((-55736511856 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((27868255928 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 21. -/
theorem ep_Q2_002_partial_21_0247_valid :
    mulPoly ep_Q2_002_coefficient_21_0247
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0248 : Poly :=
[
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 2), (15, 1)]
]

/-- Partial product 248 for generator 21. -/
def ep_Q2_002_partial_21_0248 : Poly :=
[
  term ((-186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 2), (10, 1), (15, 1)],
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 21. -/
theorem ep_Q2_002_partial_21_0248_valid :
    mulPoly ep_Q2_002_coefficient_21_0248
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0249 : Poly :=
[
  term ((-12548443744 : Rat) / 7401317245) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 21. -/
def ep_Q2_002_partial_21_0249 : Poly :=
[
  term ((-25096887488 : Rat) / 7401317245) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((12548443744 : Rat) / 7401317245) [(1, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 21. -/
theorem ep_Q2_002_partial_21_0249_valid :
    mulPoly ep_Q2_002_coefficient_21_0249
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0250 : Poly :=
[
  term ((-1623407645443406567069583408780 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 250 for generator 21. -/
def ep_Q2_002_partial_21_0250 : Poly :=
[
  term ((1623407645443406567069583408780 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)],
  term ((-3246815290886813134139166817560 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 21. -/
theorem ep_Q2_002_partial_21_0250_valid :
    mulPoly ep_Q2_002_coefficient_21_0250
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0251 : Poly :=
[
  term ((489005272803720198875289407136 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 251 for generator 21. -/
def ep_Q2_002_partial_21_0251 : Poly :=
[
  term ((-489005272803720198875289407136 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (8, 1)],
  term ((978010545607440397750578814272 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 21. -/
theorem ep_Q2_002_partial_21_0251_valid :
    mulPoly ep_Q2_002_coefficient_21_0251
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0252 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (10, 1)]
]

/-- Partial product 252 for generator 21. -/
def ep_Q2_002_partial_21_0252 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 21. -/
theorem ep_Q2_002_partial_21_0252_valid :
    mulPoly ep_Q2_002_coefficient_21_0252
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0253 : Poly :=
[
  term ((-93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 253 for generator 21. -/
def ep_Q2_002_partial_21_0253 : Poly :=
[
  term ((-187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 21. -/
theorem ep_Q2_002_partial_21_0253_valid :
    mulPoly ep_Q2_002_coefficient_21_0253
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0254 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 254 for generator 21. -/
def ep_Q2_002_partial_21_0254 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 21. -/
theorem ep_Q2_002_partial_21_0254_valid :
    mulPoly ep_Q2_002_coefficient_21_0254
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0255 : Poly :=
[
  term ((-1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 255 for generator 21. -/
def ep_Q2_002_partial_21_0255 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 21. -/
theorem ep_Q2_002_partial_21_0255_valid :
    mulPoly ep_Q2_002_coefficient_21_0255
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0256 : Poly :=
[
  term ((-3246815290886813134139166817560 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1)]
]

/-- Partial product 256 for generator 21. -/
def ep_Q2_002_partial_21_0256 : Poly :=
[
  term ((3246815290886813134139166817560 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1)],
  term ((-6493630581773626268278333635120 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 21. -/
theorem ep_Q2_002_partial_21_0256_valid :
    mulPoly ep_Q2_002_coefficient_21_0256
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0257 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 257 for generator 21. -/
def ep_Q2_002_partial_21_0257 : Poly :=
[
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 21. -/
theorem ep_Q2_002_partial_21_0257_valid :
    mulPoly ep_Q2_002_coefficient_21_0257
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0258 : Poly :=
[
  term ((-524995135106830052221704249120 : Rat) / 115799135485108289802725034287) [(1, 1), (7, 1), (10, 1), (12, 1)]
]

/-- Partial product 258 for generator 21. -/
def ep_Q2_002_partial_21_0258 : Poly :=
[
  term ((524995135106830052221704249120 : Rat) / 115799135485108289802725034287) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-1049990270213660104443408498240 : Rat) / 115799135485108289802725034287) [(1, 1), (7, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 21. -/
theorem ep_Q2_002_partial_21_0258_valid :
    mulPoly ep_Q2_002_coefficient_21_0258
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0259 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 259 for generator 21. -/
def ep_Q2_002_partial_21_0259 : Poly :=
[
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 21. -/
theorem ep_Q2_002_partial_21_0259_valid :
    mulPoly ep_Q2_002_coefficient_21_0259
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0260 : Poly :=
[
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (10, 1), (15, 2)]
]

/-- Partial product 260 for generator 21. -/
def ep_Q2_002_partial_21_0260 : Poly :=
[
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 21. -/
theorem ep_Q2_002_partial_21_0260_valid :
    mulPoly ep_Q2_002_coefficient_21_0260
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0261 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 261 for generator 21. -/
def ep_Q2_002_partial_21_0261 : Poly :=
[
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (7, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 21. -/
theorem ep_Q2_002_partial_21_0261_valid :
    mulPoly ep_Q2_002_coefficient_21_0261
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0262 : Poly :=
[
  term ((-16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 262 for generator 21. -/
def ep_Q2_002_partial_21_0262 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 21. -/
theorem ep_Q2_002_partial_21_0262_valid :
    mulPoly ep_Q2_002_coefficient_21_0262
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0263 : Poly :=
[
  term ((2702015612417102487346248800592 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 263 for generator 21. -/
def ep_Q2_002_partial_21_0263 : Poly :=
[
  term ((5404031224834204974692497601184 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((-2702015612417102487346248800592 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 21. -/
theorem ep_Q2_002_partial_21_0263_valid :
    mulPoly ep_Q2_002_coefficient_21_0263
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0264 : Poly :=
[
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2)]
]

/-- Partial product 264 for generator 21. -/
def ep_Q2_002_partial_21_0264 : Poly :=
[
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 21. -/
theorem ep_Q2_002_partial_21_0264_valid :
    mulPoly ep_Q2_002_coefficient_21_0264
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0265 : Poly :=
[
  term ((30613964406158752511093938969344 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 265 for generator 21. -/
def ep_Q2_002_partial_21_0265 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-30613964406158752511093938969344 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 21. -/
theorem ep_Q2_002_partial_21_0265_valid :
    mulPoly ep_Q2_002_coefficient_21_0265
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0266 : Poly :=
[
  term ((93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (15, 2)]
]

/-- Partial product 266 for generator 21. -/
def ep_Q2_002_partial_21_0266 : Poly :=
[
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((-93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 21. -/
theorem ep_Q2_002_partial_21_0266_valid :
    mulPoly ep_Q2_002_coefficient_21_0266
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0267 : Poly :=
[
  term ((12746693892 : Rat) / 7401317245) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 267 for generator 21. -/
def ep_Q2_002_partial_21_0267 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-12746693892 : Rat) / 7401317245) [(1, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 21. -/
theorem ep_Q2_002_partial_21_0267_valid :
    mulPoly ep_Q2_002_coefficient_21_0267
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0268 : Poly :=
[
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1)]
]

/-- Partial product 268 for generator 21. -/
def ep_Q2_002_partial_21_0268 : Poly :=
[
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 21. -/
theorem ep_Q2_002_partial_21_0268_valid :
    mulPoly ep_Q2_002_coefficient_21_0268
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0269 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1), (10, 1)]
]

/-- Partial product 269 for generator 21. -/
def ep_Q2_002_partial_21_0269 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1), (10, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 21. -/
theorem ep_Q2_002_partial_21_0269_valid :
    mulPoly ep_Q2_002_coefficient_21_0269
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0270 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 1), (11, 1)]
]

/-- Partial product 270 for generator 21. -/
def ep_Q2_002_partial_21_0270 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 21. -/
theorem ep_Q2_002_partial_21_0270_valid :
    mulPoly ep_Q2_002_coefficient_21_0270
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0271 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 1), (13, 1)]
]

/-- Partial product 271 for generator 21. -/
def ep_Q2_002_partial_21_0271 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 1), (13, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 21. -/
theorem ep_Q2_002_partial_21_0271_valid :
    mulPoly ep_Q2_002_coefficient_21_0271
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0272 : Poly :=
[
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (10, 1), (15, 1)]
]

/-- Partial product 272 for generator 21. -/
def ep_Q2_002_partial_21_0272 : Poly :=
[
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 21. -/
theorem ep_Q2_002_partial_21_0272_valid :
    mulPoly ep_Q2_002_coefficient_21_0272
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0273 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 21. -/
def ep_Q2_002_partial_21_0273 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (7, 2), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 21. -/
theorem ep_Q2_002_partial_21_0273_valid :
    mulPoly ep_Q2_002_coefficient_21_0273
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0274 : Poly :=
[
  term ((48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1)]
]

/-- Partial product 274 for generator 21. -/
def ep_Q2_002_partial_21_0274 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 1), (11, 1)],
  term ((-48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 21. -/
theorem ep_Q2_002_partial_21_0274_valid :
    mulPoly ep_Q2_002_coefficient_21_0274
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0275 : Poly :=
[
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (13, 1)]
]

/-- Partial product 275 for generator 21. -/
def ep_Q2_002_partial_21_0275 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 1), (13, 1)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 21. -/
theorem ep_Q2_002_partial_21_0275_valid :
    mulPoly ep_Q2_002_coefficient_21_0275
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0276 : Poly :=
[
  term ((-280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (15, 1)]
]

/-- Partial product 276 for generator 21. -/
def ep_Q2_002_partial_21_0276 : Poly :=
[
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 21. -/
theorem ep_Q2_002_partial_21_0276_valid :
    mulPoly ep_Q2_002_coefficient_21_0276
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0277 : Poly :=
[
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 21. -/
def ep_Q2_002_partial_21_0277 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 21. -/
theorem ep_Q2_002_partial_21_0277_valid :
    mulPoly ep_Q2_002_coefficient_21_0277
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0278 : Poly :=
[
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3)]
]

/-- Partial product 278 for generator 21. -/
def ep_Q2_002_partial_21_0278 : Poly :=
[
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 21. -/
theorem ep_Q2_002_partial_21_0278_valid :
    mulPoly ep_Q2_002_coefficient_21_0278
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0279 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3), (10, 1)]
]

/-- Partial product 279 for generator 21. -/
def ep_Q2_002_partial_21_0279 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3), (10, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 21. -/
theorem ep_Q2_002_partial_21_0279_valid :
    mulPoly ep_Q2_002_coefficient_21_0279
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0280 : Poly :=
[
  term ((9463278878139340577211415164288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (12, 1)]
]

/-- Partial product 280 for generator 21. -/
def ep_Q2_002_partial_21_0280 : Poly :=
[
  term ((18926557756278681154422830328576 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-9463278878139340577211415164288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 21. -/
theorem ep_Q2_002_partial_21_0280_valid :
    mulPoly ep_Q2_002_coefficient_21_0280
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0281 : Poly :=
[
  term ((30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 281 for generator 21. -/
def ep_Q2_002_partial_21_0281 : Poly :=
[
  term ((-30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((61967924136900462606692617135656 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 21. -/
theorem ep_Q2_002_partial_21_0281_valid :
    mulPoly ep_Q2_002_coefficient_21_0281
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0282 : Poly :=
[
  term ((-4300925783968230726549259451136 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 282 for generator 21. -/
def ep_Q2_002_partial_21_0282 : Poly :=
[
  term ((4300925783968230726549259451136 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-8601851567936461453098518902272 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 21. -/
theorem ep_Q2_002_partial_21_0282_valid :
    mulPoly ep_Q2_002_coefficient_21_0282
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0283 : Poly :=
[
  term ((-781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 283 for generator 21. -/
def ep_Q2_002_partial_21_0283 : Poly :=
[
  term ((781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1562380103114150014404839347339184000460936 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 21. -/
theorem ep_Q2_002_partial_21_0283_valid :
    mulPoly ep_Q2_002_coefficient_21_0283
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0284 : Poly :=
[
  term ((-41805008824 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 284 for generator 21. -/
def ep_Q2_002_partial_21_0284 : Poly :=
[
  term ((41805008824 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-83610017648 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 21. -/
theorem ep_Q2_002_partial_21_0284_valid :
    mulPoly ep_Q2_002_coefficient_21_0284
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0285 : Poly :=
[
  term ((9350859168594295909635378516498 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 285 for generator 21. -/
def ep_Q2_002_partial_21_0285 : Poly :=
[
  term ((18701718337188591819270757032996 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-9350859168594295909635378516498 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 21. -/
theorem ep_Q2_002_partial_21_0285_valid :
    mulPoly ep_Q2_002_coefficient_21_0285
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0286 : Poly :=
[
  term ((-50916069337248831535596439854504 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 286 for generator 21. -/
def ep_Q2_002_partial_21_0286 : Poly :=
[
  term ((-101832138674497663071192879709008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((50916069337248831535596439854504 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 21. -/
theorem ep_Q2_002_partial_21_0286_valid :
    mulPoly ep_Q2_002_coefficient_21_0286
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0287 : Poly :=
[
  term ((99249050315424231324755358561120 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 287 for generator 21. -/
def ep_Q2_002_partial_21_0287 : Poly :=
[
  term ((198498100630848462649510717122240 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((-99249050315424231324755358561120 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 21. -/
theorem ep_Q2_002_partial_21_0287_valid :
    mulPoly ep_Q2_002_coefficient_21_0287
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0288 : Poly :=
[
  term ((594271459358220604214421154716914552697504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 288 for generator 21. -/
def ep_Q2_002_partial_21_0288 : Poly :=
[
  term ((1188542918716441208428842309433829105395008 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-594271459358220604214421154716914552697504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 21. -/
theorem ep_Q2_002_partial_21_0288_valid :
    mulPoly ep_Q2_002_coefficient_21_0288
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0289 : Poly :=
[
  term ((48244374142 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 21. -/
def ep_Q2_002_partial_21_0289 : Poly :=
[
  term ((96488748284 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48244374142 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 21. -/
theorem ep_Q2_002_partial_21_0289_valid :
    mulPoly ep_Q2_002_coefficient_21_0289
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0290 : Poly :=
[
  term ((-229152054892110245023976527422720 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 290 for generator 21. -/
def ep_Q2_002_partial_21_0290 : Poly :=
[
  term ((-458304109784220490047953054845440 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((229152054892110245023976527422720 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 21. -/
theorem ep_Q2_002_partial_21_0290_valid :
    mulPoly ep_Q2_002_coefficient_21_0290
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0291 : Poly :=
[
  term ((1815488944507511914814568818034964154082 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 291 for generator 21. -/
def ep_Q2_002_partial_21_0291 : Poly :=
[
  term ((3630977889015023829629137636069928308164 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-1815488944507511914814568818034964154082 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 21. -/
theorem ep_Q2_002_partial_21_0291_valid :
    mulPoly ep_Q2_002_coefficient_21_0291
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0292 : Poly :=
[
  term ((-76681367494 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 21. -/
def ep_Q2_002_partial_21_0292 : Poly :=
[
  term ((-153362734988 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((76681367494 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 21. -/
theorem ep_Q2_002_partial_21_0292_valid :
    mulPoly ep_Q2_002_coefficient_21_0292
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0293 : Poly :=
[
  term ((-1226220236850208348483097070960 : Rat) / 115799135485108289802725034287) [(1, 1), (8, 2), (11, 1)]
]

/-- Partial product 293 for generator 21. -/
def ep_Q2_002_partial_21_0293 : Poly :=
[
  term ((-2452440473700416696966194141920 : Rat) / 115799135485108289802725034287) [(1, 1), (8, 2), (10, 1), (11, 1)],
  term ((1226220236850208348483097070960 : Rat) / 115799135485108289802725034287) [(1, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 21. -/
theorem ep_Q2_002_partial_21_0293_valid :
    mulPoly ep_Q2_002_coefficient_21_0293
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0294 : Poly :=
[
  term ((15937946888940466285596715127232 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (13, 1)]
]

/-- Partial product 294 for generator 21. -/
def ep_Q2_002_partial_21_0294 : Poly :=
[
  term ((31875893777880932571193430254464 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((-15937946888940466285596715127232 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 21. -/
theorem ep_Q2_002_partial_21_0294_valid :
    mulPoly ep_Q2_002_coefficient_21_0294
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0295 : Poly :=
[
  term ((88077041215055602719325856128508759392392 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (8, 2), (15, 1)]
]

/-- Partial product 295 for generator 21. -/
def ep_Q2_002_partial_21_0295 : Poly :=
[
  term ((176154082430111205438651712257017518784784 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((-88077041215055602719325856128508759392392 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 21. -/
theorem ep_Q2_002_partial_21_0295_valid :
    mulPoly ep_Q2_002_coefficient_21_0295
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0296 : Poly :=
[
  term ((35365643506 : Rat) / 7401317245) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 21. -/
def ep_Q2_002_partial_21_0296 : Poly :=
[
  term ((70731287012 : Rat) / 7401317245) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-35365643506 : Rat) / 7401317245) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 21. -/
theorem ep_Q2_002_partial_21_0296_valid :
    mulPoly ep_Q2_002_coefficient_21_0296
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0297 : Poly :=
[
  term ((-746379732480224569787722956048 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 297 for generator 21. -/
def ep_Q2_002_partial_21_0297 : Poly :=
[
  term ((746379732480224569787722956048 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)],
  term ((-1492759464960449139575445912096 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 21. -/
theorem ep_Q2_002_partial_21_0297_valid :
    mulPoly ep_Q2_002_coefficient_21_0297
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0298 : Poly :=
[
  term ((-1492759464960449139575445912096 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 298 for generator 21. -/
def ep_Q2_002_partial_21_0298 : Poly :=
[
  term ((1492759464960449139575445912096 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1)],
  term ((-2985518929920898279150891824192 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 21. -/
theorem ep_Q2_002_partial_21_0298_valid :
    mulPoly ep_Q2_002_coefficient_21_0298
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 21. -/
def ep_Q2_002_coefficient_21_0299 : Poly :=
[
  term ((4806583275303591327283482613680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 299 for generator 21. -/
def ep_Q2_002_partial_21_0299 : Poly :=
[
  term ((9613166550607182654566965227360 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-4806583275303591327283482613680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 21. -/
theorem ep_Q2_002_partial_21_0299_valid :
    mulPoly ep_Q2_002_coefficient_21_0299
        ep_Q2_002_generator_21_0200_0299 =
      ep_Q2_002_partial_21_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_21_0200_0299 : List Poly :=
[
  ep_Q2_002_partial_21_0200,
  ep_Q2_002_partial_21_0201,
  ep_Q2_002_partial_21_0202,
  ep_Q2_002_partial_21_0203,
  ep_Q2_002_partial_21_0204,
  ep_Q2_002_partial_21_0205,
  ep_Q2_002_partial_21_0206,
  ep_Q2_002_partial_21_0207,
  ep_Q2_002_partial_21_0208,
  ep_Q2_002_partial_21_0209,
  ep_Q2_002_partial_21_0210,
  ep_Q2_002_partial_21_0211,
  ep_Q2_002_partial_21_0212,
  ep_Q2_002_partial_21_0213,
  ep_Q2_002_partial_21_0214,
  ep_Q2_002_partial_21_0215,
  ep_Q2_002_partial_21_0216,
  ep_Q2_002_partial_21_0217,
  ep_Q2_002_partial_21_0218,
  ep_Q2_002_partial_21_0219,
  ep_Q2_002_partial_21_0220,
  ep_Q2_002_partial_21_0221,
  ep_Q2_002_partial_21_0222,
  ep_Q2_002_partial_21_0223,
  ep_Q2_002_partial_21_0224,
  ep_Q2_002_partial_21_0225,
  ep_Q2_002_partial_21_0226,
  ep_Q2_002_partial_21_0227,
  ep_Q2_002_partial_21_0228,
  ep_Q2_002_partial_21_0229,
  ep_Q2_002_partial_21_0230,
  ep_Q2_002_partial_21_0231,
  ep_Q2_002_partial_21_0232,
  ep_Q2_002_partial_21_0233,
  ep_Q2_002_partial_21_0234,
  ep_Q2_002_partial_21_0235,
  ep_Q2_002_partial_21_0236,
  ep_Q2_002_partial_21_0237,
  ep_Q2_002_partial_21_0238,
  ep_Q2_002_partial_21_0239,
  ep_Q2_002_partial_21_0240,
  ep_Q2_002_partial_21_0241,
  ep_Q2_002_partial_21_0242,
  ep_Q2_002_partial_21_0243,
  ep_Q2_002_partial_21_0244,
  ep_Q2_002_partial_21_0245,
  ep_Q2_002_partial_21_0246,
  ep_Q2_002_partial_21_0247,
  ep_Q2_002_partial_21_0248,
  ep_Q2_002_partial_21_0249,
  ep_Q2_002_partial_21_0250,
  ep_Q2_002_partial_21_0251,
  ep_Q2_002_partial_21_0252,
  ep_Q2_002_partial_21_0253,
  ep_Q2_002_partial_21_0254,
  ep_Q2_002_partial_21_0255,
  ep_Q2_002_partial_21_0256,
  ep_Q2_002_partial_21_0257,
  ep_Q2_002_partial_21_0258,
  ep_Q2_002_partial_21_0259,
  ep_Q2_002_partial_21_0260,
  ep_Q2_002_partial_21_0261,
  ep_Q2_002_partial_21_0262,
  ep_Q2_002_partial_21_0263,
  ep_Q2_002_partial_21_0264,
  ep_Q2_002_partial_21_0265,
  ep_Q2_002_partial_21_0266,
  ep_Q2_002_partial_21_0267,
  ep_Q2_002_partial_21_0268,
  ep_Q2_002_partial_21_0269,
  ep_Q2_002_partial_21_0270,
  ep_Q2_002_partial_21_0271,
  ep_Q2_002_partial_21_0272,
  ep_Q2_002_partial_21_0273,
  ep_Q2_002_partial_21_0274,
  ep_Q2_002_partial_21_0275,
  ep_Q2_002_partial_21_0276,
  ep_Q2_002_partial_21_0277,
  ep_Q2_002_partial_21_0278,
  ep_Q2_002_partial_21_0279,
  ep_Q2_002_partial_21_0280,
  ep_Q2_002_partial_21_0281,
  ep_Q2_002_partial_21_0282,
  ep_Q2_002_partial_21_0283,
  ep_Q2_002_partial_21_0284,
  ep_Q2_002_partial_21_0285,
  ep_Q2_002_partial_21_0286,
  ep_Q2_002_partial_21_0287,
  ep_Q2_002_partial_21_0288,
  ep_Q2_002_partial_21_0289,
  ep_Q2_002_partial_21_0290,
  ep_Q2_002_partial_21_0291,
  ep_Q2_002_partial_21_0292,
  ep_Q2_002_partial_21_0293,
  ep_Q2_002_partial_21_0294,
  ep_Q2_002_partial_21_0295,
  ep_Q2_002_partial_21_0296,
  ep_Q2_002_partial_21_0297,
  ep_Q2_002_partial_21_0298,
  ep_Q2_002_partial_21_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_21_0200_0299 : Poly :=
[
  term ((21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-48028022678994653149718141029984 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (11, 1), (12, 1)],
  term ((97972540527695988759115675151232 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (12, 1), (13, 1)],
  term ((-145763198428771871859321560625471837341632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1)],
  term ((28609778424 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-42015261474669651015645113053888 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 1), (13, 1)],
  term ((624820994695497283979198664198734830116576 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((-10261853432 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10624765533227947803238467165648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)],
  term ((24014011339497326574859070514992 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1)],
  term ((-48986270263847994379557837575616 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1)],
  term ((72881599214385935929660780312735918670816 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((21007630737334825507822556526944 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)],
  term ((-156205248673874320994799666049683707529144 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)],
  term ((2565463358 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (6, 1), (7, 1), (10, 1), (11, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((3004507436351752700373876750720 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1)],
  term ((-6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (8, 1), (10, 1)],
  term ((6009014872703505400747753501440 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (10, 1)],
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (10, 2), (15, 1)],
  term ((-1039119348873522506615009066768 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (15, 1)],
  term ((-293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2), (10, 2)],
  term ((-495426515317012437337235491008 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (10, 1), (12, 1)],
  term ((247713257658506218668617745504 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(1, 1), (6, 1), (7, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (9, 1), (11, 1)],
  term ((2139782730770747845440 : Rat) / 253528477699481291099) [(1, 1), (6, 1), (7, 1), (10, 1)],
  term ((367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (10, 1), (11, 2)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (11, 2)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 2), (10, 1), (11, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 2), (11, 1)],
  term ((-118556101831567469412553854209952 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((248768958619962852583785884261760 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1)],
  term ((1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((122493044056 : Rat) / 7401317245) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((59278050915783734706276927104976 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-124384479309981426291892942130880 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((-847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((6190114411005038325868163380896 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)],
  term ((-12380228822010076651736326761792 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (10, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((81880434298060763605393822356240 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((6592896993039485925384043271040 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 2)],
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((-128691726895140762805673511767040 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1839799476335805646011034011892387353764544 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-163269335267647767742433414628864 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((45835730671678907127585308924514748079376 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((-33771620916 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((50273333852208583139179584374016 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 2), (11, 1)],
  term ((-102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 2), (13, 1)],
  term ((-80475029282384145694821988177842362462496 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (6, 1), (10, 2), (15, 1)],
  term ((-8785956376 : Rat) / 1480263449) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-53508550612082527587491807271624 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)],
  term ((-3296448496519742962692021635520 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((64345863447570381402836755883520 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((919899738167902823005517005946193676882272 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((9761525190006929209588852357248 : Rat) / 115799135485108289802725034287) [(1, 1), (6, 1), (13, 1)],
  term ((-197338462762932714210777022787042909437824 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)],
  term ((27868255928 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 2), (10, 1), (15, 1)],
  term ((-25096887488 : Rat) / 7401317245) [(1, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(1, 1), (6, 2), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((1623407645443406567069583408780 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)],
  term ((-489005272803720198875289407136 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (8, 1)],
  term ((12380228822010076651736326761792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (10, 1)],
  term ((-187155526347636087040440117504 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (10, 1), (12, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (10, 2)],
  term ((93577763173818043520220058752 : Rat) / 8907625806546791523286541099) [(1, 1), (7, 1), (8, 1), (12, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (10, 2), (15, 1)],
  term ((1335299582732552090676339463488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((859921362385333503779326487808 : Rat) / 97983883872014706756151952089) [(1, 1), (7, 1), (10, 1), (12, 1)],
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 1), (12, 2)],
  term ((-6493630581773626268278333635120 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1049990270213660104443408498240 : Rat) / 115799135485108289802725034287) [(1, 1), (7, 1), (10, 2), (12, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (10, 2), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2702015612417102487346248800592 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2)],
  term ((-30613964406158752511093938969344 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (15, 2)],
  term ((-12746693892 : Rat) / 7401317245) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (9, 1), (10, 2)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 2), (11, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (10, 2), (13, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (10, 2), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (7, 2), (10, 2), (15, 1), (16, 1)],
  term ((-48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (11, 1)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 2), (13, 1)],
  term ((280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 2), (15, 1)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 3), (10, 2)],
  term ((18926557756278681154422830328576 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (10, 1), (12, 1)],
  term ((-9463278878139340577211415164288 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (9, 1), (12, 1)],
  term ((212138376315001462347173532861120 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (11, 1)],
  term ((-101832138674497663071192879709008 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1)],
  term ((198498100630848462649510717122240 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((1188542918716441208428842309433829105395008 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((96488748284 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-402392074592633490602812681980672 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((821130808336240269328340187666361211620272 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-111557726164 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((61967924136900462606692617135656 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((-8601851567936461453098518902272 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 1), (10, 2), (13, 1)],
  term ((-1562380103114150014404839347339184000460936 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-83610017648 : Rat) / 7401317245) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-9350859168594295909635378516498 : Rat) / 97983883872014706756151952089) [(1, 1), (8, 1), (11, 1)],
  term ((50916069337248831535596439854504 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((-99249050315424231324755358561120 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((-594271459358220604214421154716914552697504 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-48244374142 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((229152054892110245023976527422720 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)],
  term ((-1815488944507511914814568818034964154082 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (8, 1), (15, 1)],
  term ((76681367494 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2452440473700416696966194141920 : Rat) / 115799135485108289802725034287) [(1, 1), (8, 2), (10, 1), (11, 1)],
  term ((31875893777880932571193430254464 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (10, 1), (13, 1)],
  term ((176154082430111205438651712257017518784784 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (8, 2), (10, 1), (15, 1)],
  term ((70731287012 : Rat) / 7401317245) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((1226220236850208348483097070960 : Rat) / 115799135485108289802725034287) [(1, 1), (8, 2), (11, 1)],
  term ((-15937946888940466285596715127232 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 2), (13, 1)],
  term ((-88077041215055602719325856128508759392392 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (8, 2), (15, 1)],
  term ((-35365643506 : Rat) / 7401317245) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((746379732480224569787722956048 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)],
  term ((9613166550607182654566965227360 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 1), (12, 1)],
  term ((-2985518929920898279150891824192 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (10, 2)],
  term ((-4806583275303591327283482613680 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 200 through 299. -/
theorem ep_Q2_002_block_21_0200_0299_valid :
    checkProductSumEq ep_Q2_002_partials_21_0200_0299
      ep_Q2_002_block_21_0200_0299 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
