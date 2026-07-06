/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 11:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_11_0200_0299 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0200 : Poly :=
[
  term ((-305400461132830240168496295539824 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 200 for generator 11. -/
def ep_Q2_002_partial_11_0200 : Poly :=
[
  term ((-610800922265660480336992591079648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1)],
  term ((-610800922265660480336992591079648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((305400461132830240168496295539824 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1), (14, 2)],
  term ((305400461132830240168496295539824 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 11. -/
theorem ep_Q2_002_partial_11_0200_valid :
    mulPoly ep_Q2_002_coefficient_11_0200
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0201 : Poly :=
[
  term ((13237675849560166279020518273536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1), (14, 1)]
]

/-- Partial product 201 for generator 11. -/
def ep_Q2_002_partial_11_0201 : Poly :=
[
  term ((26475351699120332558041036547072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 2)],
  term ((26475351699120332558041036547072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13237675849560166279020518273536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((-13237675849560166279020518273536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 11. -/
theorem ep_Q2_002_partial_11_0201_valid :
    mulPoly ep_Q2_002_coefficient_11_0201
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0202 : Poly :=
[
  term ((-15696970778214711061165551062718810973664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (14, 1), (15, 1)]
]

/-- Partial product 202 for generator 11. -/
def ep_Q2_002_partial_11_0202 : Poly :=
[
  term ((-31393941556429422122331102125437621947328 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (4, 1), (14, 2), (15, 1)],
  term ((-31393941556429422122331102125437621947328 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 1), (4, 1), (14, 1), (15, 2)],
  term ((15696970778214711061165551062718810973664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (14, 1), (15, 3)],
  term ((15696970778214711061165551062718810973664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 11. -/
theorem ep_Q2_002_partial_11_0202_valid :
    mulPoly ep_Q2_002_coefficient_11_0202
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0203 : Poly :=
[
  term ((-91120708 : Rat) / 1057331035) [(1, 1), (4, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 11. -/
def ep_Q2_002_partial_11_0203 : Poly :=
[
  term ((-182241416 : Rat) / 1057331035) [(1, 1), (2, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-182241416 : Rat) / 1057331035) [(1, 1), (3, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((91120708 : Rat) / 1057331035) [(1, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((91120708 : Rat) / 1057331035) [(1, 1), (4, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 11. -/
theorem ep_Q2_002_partial_11_0203_valid :
    mulPoly ep_Q2_002_coefficient_11_0203
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0204 : Poly :=
[
  term ((-642303713203653903811196870576095822726736 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 204 for generator 11. -/
def ep_Q2_002_partial_11_0204 : Poly :=
[
  term ((-1284607426407307807622393741152191645453472 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((-1284607426407307807622393741152191645453472 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((642303713203653903811196870576095822726736 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((642303713203653903811196870576095822726736 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 11. -/
theorem ep_Q2_002_partial_11_0204_valid :
    mulPoly ep_Q2_002_coefficient_11_0204
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0205 : Poly :=
[
  term ((-122474114188 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 11. -/
def ep_Q2_002_partial_11_0205 : Poly :=
[
  term ((-244948228376 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-244948228376 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((122474114188 : Rat) / 7401317245) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((122474114188 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 11. -/
theorem ep_Q2_002_partial_11_0205_valid :
    mulPoly ep_Q2_002_coefficient_11_0205
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0206 : Poly :=
[
  term ((6386431406474854198508012410636 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1)]
]

/-- Partial product 206 for generator 11. -/
def ep_Q2_002_partial_11_0206 : Poly :=
[
  term ((12772862812949708397016024821272 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((12772862812949708397016024821272 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-6386431406474854198508012410636 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 2)],
  term ((-6386431406474854198508012410636 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 11. -/
theorem ep_Q2_002_partial_11_0206_valid :
    mulPoly ep_Q2_002_coefficient_11_0206
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0207 : Poly :=
[
  term ((-3576132565553478206523009552968 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1)]
]

/-- Partial product 207 for generator 11. -/
def ep_Q2_002_partial_11_0207 : Poly :=
[
  term ((-7152265131106956413046019105936 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((-7152265131106956413046019105936 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((3576132565553478206523009552968 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (14, 2)],
  term ((3576132565553478206523009552968 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 11. -/
theorem ep_Q2_002_partial_11_0207_valid :
    mulPoly ep_Q2_002_coefficient_11_0207
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0208 : Poly :=
[
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (12, 1)]
]

/-- Partial product 208 for generator 11. -/
def ep_Q2_002_partial_11_0208 : Poly :=
[
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (12, 1), (14, 1)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 2)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 11. -/
theorem ep_Q2_002_partial_11_0208_valid :
    mulPoly ep_Q2_002_coefficient_11_0208
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0209 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1)]
]

/-- Partial product 209 for generator 11. -/
def ep_Q2_002_partial_11_0209 : Poly :=
[
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 2)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 11. -/
theorem ep_Q2_002_partial_11_0209_valid :
    mulPoly ep_Q2_002_coefficient_11_0209
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0210 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1)]
]

/-- Partial product 210 for generator 11. -/
def ep_Q2_002_partial_11_0210 : Poly :=
[
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 2)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 11. -/
theorem ep_Q2_002_partial_11_0210_valid :
    mulPoly ep_Q2_002_coefficient_11_0210
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0211 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 211 for generator 11. -/
def ep_Q2_002_partial_11_0211 : Poly :=
[
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 11. -/
theorem ep_Q2_002_partial_11_0211_valid :
    mulPoly ep_Q2_002_coefficient_11_0211
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0212 : Poly :=
[
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 212 for generator 11. -/
def ep_Q2_002_partial_11_0212 : Poly :=
[
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 11. -/
theorem ep_Q2_002_partial_11_0212_valid :
    mulPoly ep_Q2_002_coefficient_11_0212
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0213 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 11. -/
def ep_Q2_002_partial_11_0213 : Poly :=
[
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 11. -/
theorem ep_Q2_002_partial_11_0213_valid :
    mulPoly ep_Q2_002_coefficient_11_0213
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0214 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2)]
]

/-- Partial product 214 for generator 11. -/
def ep_Q2_002_partial_11_0214 : Poly :=
[
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 2), (14, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2), (14, 2)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 11. -/
theorem ep_Q2_002_partial_11_0214_valid :
    mulPoly ep_Q2_002_coefficient_11_0214
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0215 : Poly :=
[
  term ((500862406329972778531796735616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 215 for generator 11. -/
def ep_Q2_002_partial_11_0215 : Poly :=
[
  term ((1001724812659945557063593471232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1), (14, 1)],
  term ((1001724812659945557063593471232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)],
  term ((-500862406329972778531796735616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (14, 2)],
  term ((-500862406329972778531796735616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 11. -/
theorem ep_Q2_002_partial_11_0215_valid :
    mulPoly ep_Q2_002_coefficient_11_0215
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0216 : Poly :=
[
  term ((2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (12, 1)]
]

/-- Partial product 216 for generator 11. -/
def ep_Q2_002_partial_11_0216 : Poly :=
[
  term ((4951818709625393821685005772928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (14, 1)],
  term ((4951818709625393821685005772928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((-2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 2)],
  term ((-2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 11. -/
theorem ep_Q2_002_partial_11_0216_valid :
    mulPoly ep_Q2_002_coefficient_11_0216
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0217 : Poly :=
[
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1)]
]

/-- Partial product 217 for generator 11. -/
def ep_Q2_002_partial_11_0217 : Poly :=
[
  term ((-125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (14, 1)],
  term ((-125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 11. -/
theorem ep_Q2_002_partial_11_0217_valid :
    mulPoly ep_Q2_002_coefficient_11_0217
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0218 : Poly :=
[
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (13, 1)]
]

/-- Partial product 218 for generator 11. -/
def ep_Q2_002_partial_11_0218 : Poly :=
[
  term ((235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 11. -/
theorem ep_Q2_002_partial_11_0218_valid :
    mulPoly ep_Q2_002_coefficient_11_0218
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0219 : Poly :=
[
  term ((26733665368476559155050664625823984858112 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 219 for generator 11. -/
def ep_Q2_002_partial_11_0219 : Poly :=
[
  term ((53467330736953118310101329251647969716224 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((53467330736953118310101329251647969716224 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2)],
  term ((-26733665368476559155050664625823984858112 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((-26733665368476559155050664625823984858112 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 11. -/
theorem ep_Q2_002_partial_11_0219_valid :
    mulPoly ep_Q2_002_coefficient_11_0219
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0220 : Poly :=
[
  term ((1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 11. -/
def ep_Q2_002_partial_11_0220 : Poly :=
[
  term ((2487323152 : Rat) / 211466207) [(1, 1), (2, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2487323152 : Rat) / 211466207) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 11. -/
theorem ep_Q2_002_partial_11_0220_valid :
    mulPoly ep_Q2_002_coefficient_11_0220
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0221 : Poly :=
[
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (13, 1)]
]

/-- Partial product 221 for generator 11. -/
def ep_Q2_002_partial_11_0221 : Poly :=
[
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 11. -/
theorem ep_Q2_002_partial_11_0221_valid :
    mulPoly ep_Q2_002_coefficient_11_0221
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0222 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 222 for generator 11. -/
def ep_Q2_002_partial_11_0222 : Poly :=
[
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 11. -/
theorem ep_Q2_002_partial_11_0222_valid :
    mulPoly ep_Q2_002_coefficient_11_0222
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0223 : Poly :=
[
  term ((6527909045841414358241135207280 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 223 for generator 11. -/
def ep_Q2_002_partial_11_0223 : Poly :=
[
  term ((13055818091682828716482270414560 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1)],
  term ((13055818091682828716482270414560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-6527909045841414358241135207280 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (14, 2)],
  term ((-6527909045841414358241135207280 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 11. -/
theorem ep_Q2_002_partial_11_0223_valid :
    mulPoly ep_Q2_002_coefficient_11_0223
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0224 : Poly :=
[
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (14, 1)]
]

/-- Partial product 224 for generator 11. -/
def ep_Q2_002_partial_11_0224 : Poly :=
[
  term ((8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 2)],
  term ((8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 11. -/
theorem ep_Q2_002_partial_11_0224_valid :
    mulPoly ep_Q2_002_coefficient_11_0224
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0225 : Poly :=
[
  term ((-5070376619906432339477197587696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2)]
]

/-- Partial product 225 for generator 11. -/
def ep_Q2_002_partial_11_0225 : Poly :=
[
  term ((-10140753239812864678954395175392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (12, 2), (14, 1)],
  term ((-10140753239812864678954395175392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1)],
  term ((5070376619906432339477197587696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2), (14, 2)],
  term ((5070376619906432339477197587696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 11. -/
theorem ep_Q2_002_partial_11_0225_valid :
    mulPoly ep_Q2_002_coefficient_11_0225
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0226 : Poly :=
[
  term ((-14162895826945175191261969830767417373120 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 226 for generator 11. -/
def ep_Q2_002_partial_11_0226 : Poly :=
[
  term ((-28325791653890350382523939661534834746240 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28325791653890350382523939661534834746240 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((14162895826945175191261969830767417373120 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((14162895826945175191261969830767417373120 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 11. -/
theorem ep_Q2_002_partial_11_0226_valid :
    mulPoly ep_Q2_002_coefficient_11_0226
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0227 : Poly :=
[
  term ((-1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 11. -/
def ep_Q2_002_partial_11_0227 : Poly :=
[
  term ((-2487323152 : Rat) / 211466207) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2487323152 : Rat) / 211466207) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 11. -/
theorem ep_Q2_002_partial_11_0227_valid :
    mulPoly ep_Q2_002_coefficient_11_0227
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0228 : Poly :=
[
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 2)]
]

/-- Partial product 228 for generator 11. -/
def ep_Q2_002_partial_11_0228 : Poly :=
[
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (13, 2), (14, 1)],
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 2), (14, 2)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 11. -/
theorem ep_Q2_002_partial_11_0228_valid :
    mulPoly ep_Q2_002_coefficient_11_0228
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0229 : Poly :=
[
  term ((2997407923262161616489734890840 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 229 for generator 11. -/
def ep_Q2_002_partial_11_0229 : Poly :=
[
  term ((5994815846524323232979469781680 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (14, 2)],
  term ((5994815846524323232979469781680 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((-2997407923262161616489734890840 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-2997407923262161616489734890840 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 11. -/
theorem ep_Q2_002_partial_11_0229_valid :
    mulPoly ep_Q2_002_coefficient_11_0229
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0230 : Poly :=
[
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (15, 2)]
]

/-- Partial product 230 for generator 11. -/
def ep_Q2_002_partial_11_0230 : Poly :=
[
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 11. -/
theorem ep_Q2_002_partial_11_0230_valid :
    mulPoly ep_Q2_002_coefficient_11_0230
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0231 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 11. -/
def ep_Q2_002_partial_11_0231 : Poly :=
[
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (5, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 11. -/
theorem ep_Q2_002_partial_11_0231_valid :
    mulPoly ep_Q2_002_coefficient_11_0231
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0232 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1)]
]

/-- Partial product 232 for generator 11. -/
def ep_Q2_002_partial_11_0232 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 2), (7, 1), (14, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 2), (7, 1), (15, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1), (14, 2)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 11. -/
theorem ep_Q2_002_partial_11_0232_valid :
    mulPoly ep_Q2_002_coefficient_11_0232
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0233 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (15, 1)]
]

/-- Partial product 233 for generator 11. -/
def ep_Q2_002_partial_11_0233 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 2), (14, 1), (15, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (15, 2)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (14, 2), (15, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 11. -/
theorem ep_Q2_002_partial_11_0233_valid :
    mulPoly ep_Q2_002_coefficient_11_0233
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0234 : Poly :=
[
  term ((3602102152998840954066202590168 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 234 for generator 11. -/
def ep_Q2_002_partial_11_0234 : Poly :=
[
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((-3602102152998840954066202590168 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (14, 2)],
  term ((-3602102152998840954066202590168 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 11. -/
theorem ep_Q2_002_partial_11_0234_valid :
    mulPoly ep_Q2_002_coefficient_11_0234
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0235 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 235 for generator 11. -/
def ep_Q2_002_partial_11_0235 : Poly :=
[
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 11. -/
theorem ep_Q2_002_partial_11_0235_valid :
    mulPoly ep_Q2_002_coefficient_11_0235
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0236 : Poly :=
[
  term ((13363599800947987590858250831488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 236 for generator 11. -/
def ep_Q2_002_partial_11_0236 : Poly :=
[
  term ((26727199601895975181716501662976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (9, 1), (14, 1)],
  term ((26727199601895975181716501662976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-13363599800947987590858250831488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((-13363599800947987590858250831488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 11. -/
theorem ep_Q2_002_partial_11_0236_valid :
    mulPoly ep_Q2_002_coefficient_11_0236
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0237 : Poly :=
[
  term ((-19164812493546237652726280853048 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 237 for generator 11. -/
def ep_Q2_002_partial_11_0237 : Poly :=
[
  term ((-38329624987092475305452561706096 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((-38329624987092475305452561706096 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((19164812493546237652726280853048 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (14, 2)],
  term ((19164812493546237652726280853048 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 11. -/
theorem ep_Q2_002_partial_11_0237_valid :
    mulPoly ep_Q2_002_coefficient_11_0237
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0238 : Poly :=
[
  term ((-2669972583901010603675612311776 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 238 for generator 11. -/
def ep_Q2_002_partial_11_0238 : Poly :=
[
  term ((-5339945167802021207351224623552 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5339945167802021207351224623552 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((2669972583901010603675612311776 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 2)],
  term ((2669972583901010603675612311776 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 11. -/
theorem ep_Q2_002_partial_11_0238_valid :
    mulPoly ep_Q2_002_coefficient_11_0238
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0239 : Poly :=
[
  term ((64345863447570381402836755883520 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 239 for generator 11. -/
def ep_Q2_002_partial_11_0239 : Poly :=
[
  term ((128691726895140762805673511767040 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((128691726895140762805673511767040 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-64345863447570381402836755883520 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-64345863447570381402836755883520 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 11. -/
theorem ep_Q2_002_partial_11_0239_valid :
    mulPoly ep_Q2_002_coefficient_11_0239
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0240 : Poly :=
[
  term ((920601774727430320266433159206754126879392 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 240 for generator 11. -/
def ep_Q2_002_partial_11_0240 : Poly :=
[
  term ((1841203549454860640532866318413508253758784 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((1841203549454860640532866318413508253758784 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((-920601774727430320266433159206754126879392 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-920601774727430320266433159206754126879392 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 11. -/
theorem ep_Q2_002_partial_11_0240_valid :
    mulPoly ep_Q2_002_coefficient_11_0240
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0241 : Poly :=
[
  term ((46941632816 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 241 for generator 11. -/
def ep_Q2_002_partial_11_0241 : Poly :=
[
  term ((93883265632 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((93883265632 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 11. -/
theorem ep_Q2_002_partial_11_0241_valid :
    mulPoly ep_Q2_002_coefficient_11_0241
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0242 : Poly :=
[
  term ((40231033974065036467986535639776 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 242 for generator 11. -/
def ep_Q2_002_partial_11_0242 : Poly :=
[
  term ((80462067948130072935973071279552 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((80462067948130072935973071279552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-40231033974065036467986535639776 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-40231033974065036467986535639776 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 11. -/
theorem ep_Q2_002_partial_11_0242_valid :
    mulPoly ep_Q2_002_coefficient_11_0242
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0243 : Poly :=
[
  term ((5311804969396415754476799826752 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 243 for generator 11. -/
def ep_Q2_002_partial_11_0243 : Poly :=
[
  term ((10623609938792831508953599653504 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 2)],
  term ((10623609938792831508953599653504 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5311804969396415754476799826752 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5311804969396415754476799826752 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 11. -/
theorem ep_Q2_002_partial_11_0243_valid :
    mulPoly ep_Q2_002_coefficient_11_0243
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0244 : Poly :=
[
  term ((-7242241572152584879768642954571377244168 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 244 for generator 11. -/
def ep_Q2_002_partial_11_0244 : Poly :=
[
  term ((-14484483144305169759537285909142754488336 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((-14484483144305169759537285909142754488336 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((7242241572152584879768642954571377244168 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((7242241572152584879768642954571377244168 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 11. -/
theorem ep_Q2_002_partial_11_0244_valid :
    mulPoly ep_Q2_002_coefficient_11_0244
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0245 : Poly :=
[
  term ((9036801768 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 11. -/
def ep_Q2_002_partial_11_0245 : Poly :=
[
  term ((18073603536 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((18073603536 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-9036801768 : Rat) / 7401317245) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9036801768 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 11. -/
theorem ep_Q2_002_partial_11_0245_valid :
    mulPoly ep_Q2_002_coefficient_11_0245
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0246 : Poly :=
[
  term ((1063262771062551660210223212616 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 246 for generator 11. -/
def ep_Q2_002_partial_11_0246 : Poly :=
[
  term ((2126525542125103320420446425232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term ((2126525542125103320420446425232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-1063262771062551660210223212616 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 2)],
  term ((-1063262771062551660210223212616 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 11. -/
theorem ep_Q2_002_partial_11_0246_valid :
    mulPoly ep_Q2_002_coefficient_11_0246
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0247 : Poly :=
[
  term ((-20907034127593570639935971245920 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 247 for generator 11. -/
def ep_Q2_002_partial_11_0247 : Poly :=
[
  term ((-41814068255187141279871942491840 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (8, 1), (14, 1)],
  term ((-41814068255187141279871942491840 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((20907034127593570639935971245920 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (14, 2)],
  term ((20907034127593570639935971245920 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 11. -/
theorem ep_Q2_002_partial_11_0247_valid :
    mulPoly ep_Q2_002_coefficient_11_0247
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0248 : Poly :=
[
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 248 for generator 11. -/
def ep_Q2_002_partial_11_0248 : Poly :=
[
  term ((-1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (8, 1), (14, 2)],
  term ((-1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 11. -/
theorem ep_Q2_002_partial_11_0248_valid :
    mulPoly ep_Q2_002_coefficient_11_0248
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0249 : Poly :=
[
  term ((-1796791278719846145770105081280 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 249 for generator 11. -/
def ep_Q2_002_partial_11_0249 : Poly :=
[
  term ((-3593582557439692291540210162560 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1)],
  term ((-3593582557439692291540210162560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((1796791278719846145770105081280 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 2)],
  term ((1796791278719846145770105081280 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 11. -/
theorem ep_Q2_002_partial_11_0249_valid :
    mulPoly ep_Q2_002_coefficient_11_0249
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0250 : Poly :=
[
  term ((-663970446613720423818027114432 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 250 for generator 11. -/
def ep_Q2_002_partial_11_0250 : Poly :=
[
  term ((-1327940893227440847636054228864 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 2)],
  term ((-1327940893227440847636054228864 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((663970446613720423818027114432 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((663970446613720423818027114432 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 11. -/
theorem ep_Q2_002_partial_11_0250_valid :
    mulPoly ep_Q2_002_coefficient_11_0250
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0251 : Poly :=
[
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2)]
]

/-- Partial product 251 for generator 11. -/
def ep_Q2_002_partial_11_0251 : Poly :=
[
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (12, 2), (14, 1)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (12, 2), (15, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2), (14, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 11. -/
theorem ep_Q2_002_partial_11_0251_valid :
    mulPoly ep_Q2_002_coefficient_11_0251
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0252 : Poly :=
[
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 252 for generator 11. -/
def ep_Q2_002_partial_11_0252 : Poly :=
[
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 11. -/
theorem ep_Q2_002_partial_11_0252_valid :
    mulPoly ep_Q2_002_coefficient_11_0252
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0253 : Poly :=
[
  term ((-6365423069945865047642874607944 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 1)]
]

/-- Partial product 253 for generator 11. -/
def ep_Q2_002_partial_11_0253 : Poly :=
[
  term ((-12730846139891730095285749215888 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((-12730846139891730095285749215888 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((6365423069945865047642874607944 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((6365423069945865047642874607944 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 11. -/
theorem ep_Q2_002_partial_11_0253_valid :
    mulPoly ep_Q2_002_coefficient_11_0253
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0254 : Poly :=
[
  term ((-119369660153333818878233481186810 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 254 for generator 11. -/
def ep_Q2_002_partial_11_0254 : Poly :=
[
  term ((-238739320306667637756466962373620 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1)],
  term ((-238739320306667637756466962373620 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((119369660153333818878233481186810 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((119369660153333818878233481186810 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 11. -/
theorem ep_Q2_002_partial_11_0254_valid :
    mulPoly ep_Q2_002_coefficient_11_0254
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0255 : Poly :=
[
  term ((13459106898232590361245441613920 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 255 for generator 11. -/
def ep_Q2_002_partial_11_0255 : Poly :=
[
  term ((26918213796465180722490883227840 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((26918213796465180722490883227840 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-13459106898232590361245441613920 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((-13459106898232590361245441613920 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 11. -/
theorem ep_Q2_002_partial_11_0255_valid :
    mulPoly ep_Q2_002_coefficient_11_0255
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0256 : Poly :=
[
  term ((47725938796811484608203950298188 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 256 for generator 11. -/
def ep_Q2_002_partial_11_0256 : Poly :=
[
  term ((95451877593622969216407900596376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 2)],
  term ((95451877593622969216407900596376 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-47725938796811484608203950298188 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-47725938796811484608203950298188 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 11. -/
theorem ep_Q2_002_partial_11_0256_valid :
    mulPoly ep_Q2_002_coefficient_11_0256
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0257 : Poly :=
[
  term ((-31315492236800060757868604432208 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 257 for generator 11. -/
def ep_Q2_002_partial_11_0257 : Poly :=
[
  term ((-62630984473600121515737208864416 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-62630984473600121515737208864416 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((31315492236800060757868604432208 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((31315492236800060757868604432208 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 11. -/
theorem ep_Q2_002_partial_11_0257_valid :
    mulPoly ep_Q2_002_coefficient_11_0257
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0258 : Poly :=
[
  term ((-72504712868751783884653904934193744654368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 258 for generator 11. -/
def ep_Q2_002_partial_11_0258 : Poly :=
[
  term ((-145009425737503567769307809868387489308736 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-145009425737503567769307809868387489308736 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)],
  term ((72504712868751783884653904934193744654368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((72504712868751783884653904934193744654368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 11. -/
theorem ep_Q2_002_partial_11_0258_valid :
    mulPoly ep_Q2_002_coefficient_11_0258
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0259 : Poly :=
[
  term ((-10981330664 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 11. -/
def ep_Q2_002_partial_11_0259 : Poly :=
[
  term ((-21962661328 : Rat) / 7401317245) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21962661328 : Rat) / 7401317245) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((10981330664 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((10981330664 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 11. -/
theorem ep_Q2_002_partial_11_0259_valid :
    mulPoly ep_Q2_002_coefficient_11_0259
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0260 : Poly :=
[
  term ((215770434758254264800585059021184 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 260 for generator 11. -/
def ep_Q2_002_partial_11_0260 : Poly :=
[
  term ((431540869516508529601170118042368 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1)],
  term ((431540869516508529601170118042368 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((-215770434758254264800585059021184 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((-215770434758254264800585059021184 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 11. -/
theorem ep_Q2_002_partial_11_0260_valid :
    mulPoly ep_Q2_002_coefficient_11_0260
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0261 : Poly :=
[
  term ((-89159889481510179941000342156352 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 261 for generator 11. -/
def ep_Q2_002_partial_11_0261 : Poly :=
[
  term ((-178319778963020359882000684312704 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 2)],
  term ((-178319778963020359882000684312704 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((89159889481510179941000342156352 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((89159889481510179941000342156352 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 11. -/
theorem ep_Q2_002_partial_11_0261_valid :
    mulPoly ep_Q2_002_coefficient_11_0261
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0262 : Poly :=
[
  term ((409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 262 for generator 11. -/
def ep_Q2_002_partial_11_0262 : Poly :=
[
  term ((818004037517494687406953582565296337119368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (8, 1), (14, 2), (15, 1)],
  term ((818004037517494687406953582565296337119368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((-409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((-409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 11. -/
theorem ep_Q2_002_partial_11_0262_valid :
    mulPoly ep_Q2_002_coefficient_11_0262
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0263 : Poly :=
[
  term ((-18957995568 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 11. -/
def ep_Q2_002_partial_11_0263 : Poly :=
[
  term ((-37915991136 : Rat) / 7401317245) [(1, 1), (2, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-37915991136 : Rat) / 7401317245) [(1, 1), (3, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((18957995568 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((18957995568 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 11. -/
theorem ep_Q2_002_partial_11_0263_valid :
    mulPoly ep_Q2_002_coefficient_11_0263
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0264 : Poly :=
[
  term ((-9214610264839694941868664586150533608742 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 264 for generator 11. -/
def ep_Q2_002_partial_11_0264 : Poly :=
[
  term ((-18429220529679389883737329172301067217484 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((-18429220529679389883737329172301067217484 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((9214610264839694941868664586150533608742 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((9214610264839694941868664586150533608742 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 11. -/
theorem ep_Q2_002_partial_11_0264_valid :
    mulPoly ep_Q2_002_coefficient_11_0264
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0265 : Poly :=
[
  term ((76681367494 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 265 for generator 11. -/
def ep_Q2_002_partial_11_0265 : Poly :=
[
  term ((153362734988 : Rat) / 7401317245) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((153362734988 : Rat) / 7401317245) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-76681367494 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-76681367494 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 11. -/
theorem ep_Q2_002_partial_11_0265_valid :
    mulPoly ep_Q2_002_coefficient_11_0265
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0266 : Poly :=
[
  term ((-7365327946375908386845453328496 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1)]
]

/-- Partial product 266 for generator 11. -/
def ep_Q2_002_partial_11_0266 : Poly :=
[
  term ((-14730655892751816773690906656992 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-14730655892751816773690906656992 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((7365327946375908386845453328496 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 2)],
  term ((7365327946375908386845453328496 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 11. -/
theorem ep_Q2_002_partial_11_0266_valid :
    mulPoly ep_Q2_002_coefficient_11_0266
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0267 : Poly :=
[
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 267 for generator 11. -/
def ep_Q2_002_partial_11_0267 : Poly :=
[
  term ((-25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 11. -/
theorem ep_Q2_002_partial_11_0267_valid :
    mulPoly ep_Q2_002_coefficient_11_0267
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0268 : Poly :=
[
  term ((123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 268 for generator 11. -/
def ep_Q2_002_partial_11_0268 : Poly :=
[
  term ((247022923639257370452335177372256 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((247022923639257370452335177372256 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((-123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 11. -/
theorem ep_Q2_002_partial_11_0268_valid :
    mulPoly ep_Q2_002_coefficient_11_0268
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0269 : Poly :=
[
  term ((-3472394347461607857286524956016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1)]
]

/-- Partial product 269 for generator 11. -/
def ep_Q2_002_partial_11_0269 : Poly :=
[
  term ((-6944788694923215714573049912032 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1)],
  term ((-6944788694923215714573049912032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((3472394347461607857286524956016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((3472394347461607857286524956016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 11. -/
theorem ep_Q2_002_partial_11_0269_valid :
    mulPoly ep_Q2_002_coefficient_11_0269
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0270 : Poly :=
[
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 270 for generator 11. -/
def ep_Q2_002_partial_11_0270 : Poly :=
[
  term ((-1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 2)],
  term ((-1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 11. -/
theorem ep_Q2_002_partial_11_0270_valid :
    mulPoly ep_Q2_002_coefficient_11_0270
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0271 : Poly :=
[
  term ((357969010259140202108465955024 : Rat) / 97983883872014706756151952089) [(1, 1), (9, 1), (12, 2)]
]

/-- Partial product 271 for generator 11. -/
def ep_Q2_002_partial_11_0271 : Poly :=
[
  term ((715938020518280404216931910048 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (9, 1), (12, 2), (14, 1)],
  term ((715938020518280404216931910048 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (9, 1), (12, 2), (15, 1)],
  term ((-357969010259140202108465955024 : Rat) / 97983883872014706756151952089) [(1, 1), (9, 1), (12, 2), (14, 2)],
  term ((-357969010259140202108465955024 : Rat) / 97983883872014706756151952089) [(1, 1), (9, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 11. -/
theorem ep_Q2_002_partial_11_0271_valid :
    mulPoly ep_Q2_002_coefficient_11_0271
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0272 : Poly :=
[
  term ((16254337881631315947164018624506125666144 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 272 for generator 11. -/
def ep_Q2_002_partial_11_0272 : Poly :=
[
  term ((32508675763262631894328037249012251332288 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((32508675763262631894328037249012251332288 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((-16254337881631315947164018624506125666144 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-16254337881631315947164018624506125666144 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 11. -/
theorem ep_Q2_002_partial_11_0272_valid :
    mulPoly ep_Q2_002_coefficient_11_0272
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0273 : Poly :=
[
  term ((351733096 : Rat) / 22496405) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 11. -/
def ep_Q2_002_partial_11_0273 : Poly :=
[
  term ((703466192 : Rat) / 22496405) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((703466192 : Rat) / 22496405) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-351733096 : Rat) / 22496405) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-351733096 : Rat) / 22496405) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 11. -/
theorem ep_Q2_002_partial_11_0273_valid :
    mulPoly ep_Q2_002_coefficient_11_0273
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0274 : Poly :=
[
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (13, 2)]
]

/-- Partial product 274 for generator 11. -/
def ep_Q2_002_partial_11_0274 : Poly :=
[
  term ((47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1)],
  term ((47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 11. -/
theorem ep_Q2_002_partial_11_0274_valid :
    mulPoly ep_Q2_002_coefficient_11_0274
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0275 : Poly :=
[
  term ((3149678527190751309393560042784 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1)]
]

/-- Partial product 275 for generator 11. -/
def ep_Q2_002_partial_11_0275 : Poly :=
[
  term ((6299357054381502618787120085568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((6299357054381502618787120085568 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-3149678527190751309393560042784 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-3149678527190751309393560042784 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 11. -/
theorem ep_Q2_002_partial_11_0275_valid :
    mulPoly ep_Q2_002_coefficient_11_0275
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0276 : Poly :=
[
  term ((-144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (9, 1), (15, 2)]
]

/-- Partial product 276 for generator 11. -/
def ep_Q2_002_partial_11_0276 : Poly :=
[
  term ((-288788796214319549172783691939157369735328 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (9, 1), (14, 1), (15, 2)],
  term ((-288788796214319549172783691939157369735328 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (9, 1), (14, 2), (15, 2)],
  term ((144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 11. -/
theorem ep_Q2_002_partial_11_0276_valid :
    mulPoly ep_Q2_002_coefficient_11_0276
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0277 : Poly :=
[
  term ((-129020865416 : Rat) / 7401317245) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 277 for generator 11. -/
def ep_Q2_002_partial_11_0277 : Poly :=
[
  term ((-258041730832 : Rat) / 7401317245) [(1, 1), (2, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-258041730832 : Rat) / 7401317245) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((129020865416 : Rat) / 7401317245) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((129020865416 : Rat) / 7401317245) [(1, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 11. -/
theorem ep_Q2_002_partial_11_0277_valid :
    mulPoly ep_Q2_002_coefficient_11_0277
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0278 : Poly :=
[
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1)]
]

/-- Partial product 278 for generator 11. -/
def ep_Q2_002_partial_11_0278 : Poly :=
[
  term ((31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 2), (11, 1), (14, 1)],
  term ((31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (14, 2)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 11. -/
theorem ep_Q2_002_partial_11_0278_valid :
    mulPoly ep_Q2_002_coefficient_11_0278
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0279 : Poly :=
[
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1)]
]

/-- Partial product 279 for generator 11. -/
def ep_Q2_002_partial_11_0279 : Poly :=
[
  term ((-58647225192412125545659641250944 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 2), (13, 1), (14, 1)],
  term ((-58647225192412125545659641250944 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 11. -/
theorem ep_Q2_002_partial_11_0279_valid :
    mulPoly ep_Q2_002_coefficient_11_0279
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0280 : Poly :=
[
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 2), (15, 1)]
]

/-- Partial product 280 for generator 11. -/
def ep_Q2_002_partial_11_0280 : Poly :=
[
  term ((1713683577970808379391201839843529699126368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1)],
  term ((1713683577970808379391201839843529699126368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (9, 2), (15, 2)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 11. -/
theorem ep_Q2_002_partial_11_0280_valid :
    mulPoly ep_Q2_002_coefficient_11_0280
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0281 : Poly :=
[
  term ((13300676832 : Rat) / 7401317245) [(1, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 11. -/
def ep_Q2_002_partial_11_0281 : Poly :=
[
  term ((26601353664 : Rat) / 7401317245) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((26601353664 : Rat) / 7401317245) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(1, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 11. -/
theorem ep_Q2_002_partial_11_0281_valid :
    mulPoly ep_Q2_002_coefficient_11_0281
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0282 : Poly :=
[
  term ((58256270794126378770646786058968 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1)]
]

/-- Partial product 282 for generator 11. -/
def ep_Q2_002_partial_11_0282 : Poly :=
[
  term ((116512541588252757541293572117936 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((116512541588252757541293572117936 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-58256270794126378770646786058968 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 2)],
  term ((-58256270794126378770646786058968 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 11. -/
theorem ep_Q2_002_partial_11_0282_valid :
    mulPoly ep_Q2_002_coefficient_11_0282
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0283 : Poly :=
[
  term ((187653613400586664083029944863788 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 283 for generator 11. -/
def ep_Q2_002_partial_11_0283 : Poly :=
[
  term ((375307226801173328166059889727576 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((375307226801173328166059889727576 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((-187653613400586664083029944863788 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-187653613400586664083029944863788 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 11. -/
theorem ep_Q2_002_partial_11_0283_valid :
    mulPoly ep_Q2_002_coefficient_11_0283
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0284 : Poly :=
[
  term ((-18304824174505895515549787463744 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 284 for generator 11. -/
def ep_Q2_002_partial_11_0284 : Poly :=
[
  term ((-36609648349011791031099574927488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 2)],
  term ((-36609648349011791031099574927488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((18304824174505895515549787463744 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((18304824174505895515549787463744 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 11. -/
theorem ep_Q2_002_partial_11_0284_valid :
    mulPoly ep_Q2_002_coefficient_11_0284
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0285 : Poly :=
[
  term ((68816679643759148560287901980792 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2)]
]

/-- Partial product 285 for generator 11. -/
def ep_Q2_002_partial_11_0285 : Poly :=
[
  term ((137633359287518297120575803961584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1)],
  term ((137633359287518297120575803961584 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1)],
  term ((-68816679643759148560287901980792 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2), (14, 2)],
  term ((-68816679643759148560287901980792 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 11. -/
theorem ep_Q2_002_partial_11_0285_valid :
    mulPoly ep_Q2_002_coefficient_11_0285
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0286 : Poly :=
[
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 286 for generator 11. -/
def ep_Q2_002_partial_11_0286 : Poly :=
[
  term ((-146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 11. -/
theorem ep_Q2_002_partial_11_0286_valid :
    mulPoly ep_Q2_002_coefficient_11_0286
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0287 : Poly :=
[
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 2)]
]

/-- Partial product 287 for generator 11. -/
def ep_Q2_002_partial_11_0287 : Poly :=
[
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (13, 2), (14, 1)],
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 11. -/
theorem ep_Q2_002_partial_11_0287_valid :
    mulPoly ep_Q2_002_coefficient_11_0287
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0288 : Poly :=
[
  term ((-2767383610612628711000726776536 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 288 for generator 11. -/
def ep_Q2_002_partial_11_0288 : Poly :=
[
  term ((-5534767221225257422001453553072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-5534767221225257422001453553072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((2767383610612628711000726776536 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((2767383610612628711000726776536 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 11. -/
theorem ep_Q2_002_partial_11_0288_valid :
    mulPoly ep_Q2_002_coefficient_11_0288
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0289 : Poly :=
[
  term ((-358628631735930061001574995241552 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 289 for generator 11. -/
def ep_Q2_002_partial_11_0289 : Poly :=
[
  term ((-717257263471860122003149990483104 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((-717257263471860122003149990483104 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((358628631735930061001574995241552 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((358628631735930061001574995241552 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 11. -/
theorem ep_Q2_002_partial_11_0289_valid :
    mulPoly ep_Q2_002_coefficient_11_0289
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0290 : Poly :=
[
  term ((40768891093958370469455990844416 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 290 for generator 11. -/
def ep_Q2_002_partial_11_0290 : Poly :=
[
  term ((81537782187916740938911981688832 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2)],
  term ((81537782187916740938911981688832 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-40768891093958370469455990844416 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-40768891093958370469455990844416 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 11. -/
theorem ep_Q2_002_partial_11_0290_valid :
    mulPoly ep_Q2_002_coefficient_11_0290
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0291 : Poly :=
[
  term ((-205818451350790426972439103911587510060344 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 291 for generator 11. -/
def ep_Q2_002_partial_11_0291 : Poly :=
[
  term ((-411636902701580853944878207823175020120688 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1)],
  term ((-411636902701580853944878207823175020120688 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((205818451350790426972439103911587510060344 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((205818451350790426972439103911587510060344 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 11. -/
theorem ep_Q2_002_partial_11_0291_valid :
    mulPoly ep_Q2_002_coefficient_11_0291
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0292 : Poly :=
[
  term ((5459230738 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 11. -/
def ep_Q2_002_partial_11_0292 : Poly :=
[
  term ((10918461476 : Rat) / 7401317245) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((10918461476 : Rat) / 7401317245) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5459230738 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5459230738 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 11. -/
theorem ep_Q2_002_partial_11_0292_valid :
    mulPoly ep_Q2_002_coefficient_11_0292
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0293 : Poly :=
[
  term ((-299288004881525098878035738545047339668728 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 293 for generator 11. -/
def ep_Q2_002_partial_11_0293 : Poly :=
[
  term ((-598576009763050197756071477090094679337456 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-598576009763050197756071477090094679337456 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((299288004881525098878035738545047339668728 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((299288004881525098878035738545047339668728 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 11. -/
theorem ep_Q2_002_partial_11_0293_valid :
    mulPoly ep_Q2_002_coefficient_11_0293
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0294 : Poly :=
[
  term ((-126280412579 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 11. -/
def ep_Q2_002_partial_11_0294 : Poly :=
[
  term ((-252560825158 : Rat) / 7401317245) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-252560825158 : Rat) / 7401317245) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((126280412579 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((126280412579 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 11. -/
theorem ep_Q2_002_partial_11_0294_valid :
    mulPoly ep_Q2_002_coefficient_11_0294
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0295 : Poly :=
[
  term ((-120916196340434321438239455729888 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1)]
]

/-- Partial product 295 for generator 11. -/
def ep_Q2_002_partial_11_0295 : Poly :=
[
  term ((-241832392680868642876478911459776 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (12, 2), (13, 1), (14, 1)],
  term ((-241832392680868642876478911459776 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (12, 2), (13, 1), (15, 1)],
  term ((120916196340434321438239455729888 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((120916196340434321438239455729888 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 11. -/
theorem ep_Q2_002_partial_11_0295_valid :
    mulPoly ep_Q2_002_coefficient_11_0295
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0296 : Poly :=
[
  term ((463569169009928911465175144313029829402492 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 2), (15, 1)]
]

/-- Partial product 296 for generator 11. -/
def ep_Q2_002_partial_11_0296 : Poly :=
[
  term ((927138338019857822930350288626059658804984 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1)],
  term ((927138338019857822930350288626059658804984 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (12, 2), (15, 2)],
  term ((-463569169009928911465175144313029829402492 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((-463569169009928911465175144313029829402492 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 11. -/
theorem ep_Q2_002_partial_11_0296_valid :
    mulPoly ep_Q2_002_coefficient_11_0296
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0297 : Poly :=
[
  term ((-29788870339 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 11. -/
def ep_Q2_002_partial_11_0297 : Poly :=
[
  term ((-59577740678 : Rat) / 7401317245) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-59577740678 : Rat) / 7401317245) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((29788870339 : Rat) / 7401317245) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((29788870339 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 11. -/
theorem ep_Q2_002_partial_11_0297_valid :
    mulPoly ep_Q2_002_coefficient_11_0297
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0298 : Poly :=
[
  term ((-10210331395327462205195933462704 : Rat) / 97983883872014706756151952089) [(1, 1), (13, 1)]
]

/-- Partial product 298 for generator 11. -/
def ep_Q2_002_partial_11_0298 : Poly :=
[
  term ((-20420662790654924410391866925408 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-20420662790654924410391866925408 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((10210331395327462205195933462704 : Rat) / 97983883872014706756151952089) [(1, 1), (13, 1), (14, 2)],
  term ((10210331395327462205195933462704 : Rat) / 97983883872014706756151952089) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 11. -/
theorem ep_Q2_002_partial_11_0298_valid :
    mulPoly ep_Q2_002_coefficient_11_0298
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0299 : Poly :=
[
  term ((-7317596668202478952871847115184 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 299 for generator 11. -/
def ep_Q2_002_partial_11_0299 : Poly :=
[
  term ((-14635193336404957905743694230368 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-14635193336404957905743694230368 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((7317596668202478952871847115184 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((7317596668202478952871847115184 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 11. -/
theorem ep_Q2_002_partial_11_0299_valid :
    mulPoly ep_Q2_002_coefficient_11_0299
        ep_Q2_002_generator_11_0200_0299 =
      ep_Q2_002_partial_11_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_11_0200_0299 : List Poly :=
[
  ep_Q2_002_partial_11_0200,
  ep_Q2_002_partial_11_0201,
  ep_Q2_002_partial_11_0202,
  ep_Q2_002_partial_11_0203,
  ep_Q2_002_partial_11_0204,
  ep_Q2_002_partial_11_0205,
  ep_Q2_002_partial_11_0206,
  ep_Q2_002_partial_11_0207,
  ep_Q2_002_partial_11_0208,
  ep_Q2_002_partial_11_0209,
  ep_Q2_002_partial_11_0210,
  ep_Q2_002_partial_11_0211,
  ep_Q2_002_partial_11_0212,
  ep_Q2_002_partial_11_0213,
  ep_Q2_002_partial_11_0214,
  ep_Q2_002_partial_11_0215,
  ep_Q2_002_partial_11_0216,
  ep_Q2_002_partial_11_0217,
  ep_Q2_002_partial_11_0218,
  ep_Q2_002_partial_11_0219,
  ep_Q2_002_partial_11_0220,
  ep_Q2_002_partial_11_0221,
  ep_Q2_002_partial_11_0222,
  ep_Q2_002_partial_11_0223,
  ep_Q2_002_partial_11_0224,
  ep_Q2_002_partial_11_0225,
  ep_Q2_002_partial_11_0226,
  ep_Q2_002_partial_11_0227,
  ep_Q2_002_partial_11_0228,
  ep_Q2_002_partial_11_0229,
  ep_Q2_002_partial_11_0230,
  ep_Q2_002_partial_11_0231,
  ep_Q2_002_partial_11_0232,
  ep_Q2_002_partial_11_0233,
  ep_Q2_002_partial_11_0234,
  ep_Q2_002_partial_11_0235,
  ep_Q2_002_partial_11_0236,
  ep_Q2_002_partial_11_0237,
  ep_Q2_002_partial_11_0238,
  ep_Q2_002_partial_11_0239,
  ep_Q2_002_partial_11_0240,
  ep_Q2_002_partial_11_0241,
  ep_Q2_002_partial_11_0242,
  ep_Q2_002_partial_11_0243,
  ep_Q2_002_partial_11_0244,
  ep_Q2_002_partial_11_0245,
  ep_Q2_002_partial_11_0246,
  ep_Q2_002_partial_11_0247,
  ep_Q2_002_partial_11_0248,
  ep_Q2_002_partial_11_0249,
  ep_Q2_002_partial_11_0250,
  ep_Q2_002_partial_11_0251,
  ep_Q2_002_partial_11_0252,
  ep_Q2_002_partial_11_0253,
  ep_Q2_002_partial_11_0254,
  ep_Q2_002_partial_11_0255,
  ep_Q2_002_partial_11_0256,
  ep_Q2_002_partial_11_0257,
  ep_Q2_002_partial_11_0258,
  ep_Q2_002_partial_11_0259,
  ep_Q2_002_partial_11_0260,
  ep_Q2_002_partial_11_0261,
  ep_Q2_002_partial_11_0262,
  ep_Q2_002_partial_11_0263,
  ep_Q2_002_partial_11_0264,
  ep_Q2_002_partial_11_0265,
  ep_Q2_002_partial_11_0266,
  ep_Q2_002_partial_11_0267,
  ep_Q2_002_partial_11_0268,
  ep_Q2_002_partial_11_0269,
  ep_Q2_002_partial_11_0270,
  ep_Q2_002_partial_11_0271,
  ep_Q2_002_partial_11_0272,
  ep_Q2_002_partial_11_0273,
  ep_Q2_002_partial_11_0274,
  ep_Q2_002_partial_11_0275,
  ep_Q2_002_partial_11_0276,
  ep_Q2_002_partial_11_0277,
  ep_Q2_002_partial_11_0278,
  ep_Q2_002_partial_11_0279,
  ep_Q2_002_partial_11_0280,
  ep_Q2_002_partial_11_0281,
  ep_Q2_002_partial_11_0282,
  ep_Q2_002_partial_11_0283,
  ep_Q2_002_partial_11_0284,
  ep_Q2_002_partial_11_0285,
  ep_Q2_002_partial_11_0286,
  ep_Q2_002_partial_11_0287,
  ep_Q2_002_partial_11_0288,
  ep_Q2_002_partial_11_0289,
  ep_Q2_002_partial_11_0290,
  ep_Q2_002_partial_11_0291,
  ep_Q2_002_partial_11_0292,
  ep_Q2_002_partial_11_0293,
  ep_Q2_002_partial_11_0294,
  ep_Q2_002_partial_11_0295,
  ep_Q2_002_partial_11_0296,
  ep_Q2_002_partial_11_0297,
  ep_Q2_002_partial_11_0298,
  ep_Q2_002_partial_11_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_11_0200_0299 : Poly :=
[
  term ((-610800922265660480336992591079648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 1)],
  term ((26475351699120332558041036547072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1), (14, 2)],
  term ((-1284607426407307807622393741152191645453472 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1)],
  term ((-244948228376 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31393941556429422122331102125437621947328 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (4, 1), (14, 2), (15, 1)],
  term ((-182241416 : Rat) / 1057331035) [(1, 1), (2, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (12, 1), (14, 1)],
  term ((-7152265131106956413046019105936 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 2), (14, 1)],
  term ((4951818709625393821685005772928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1), (12, 1), (14, 1)],
  term ((1001724812659945557063593471232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1), (14, 1)],
  term ((-125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (11, 1), (14, 1)],
  term ((235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (13, 1), (14, 1)],
  term ((53467330736953118310101329251647969716224 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((2487323152 : Rat) / 211466207) [(1, 1), (2, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((13055818091682828716482270414560 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 1)],
  term ((8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (12, 1), (14, 2)],
  term ((-10140753239812864678954395175392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (12, 2), (14, 1)],
  term ((-28325791653890350382523939661534834746240 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2487323152 : Rat) / 211466207) [(1, 1), (2, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (13, 2), (14, 1)],
  term ((12772862812949708397016024821272 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((5994815846524323232979469781680 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (14, 2)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 2), (7, 1), (14, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 2), (14, 1), (15, 1)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (7, 1), (14, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((26727199601895975181716501662976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (9, 1), (14, 1)],
  term ((-5339945167802021207351224623552 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-38329624987092475305452561706096 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1)],
  term ((128691726895140762805673511767040 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((1841203549454860640532866318413508253758784 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((93883265632 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((80462067948130072935973071279552 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((10623609938792831508953599653504 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 2)],
  term ((-14484483144305169759537285909142754488336 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((18073603536 : Rat) / 7401317245) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41814068255187141279871942491840 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (8, 1), (14, 1)],
  term ((-1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (8, 1), (14, 2)],
  term ((-3593582557439692291540210162560 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 1)],
  term ((-1327940893227440847636054228864 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (12, 1), (14, 2)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (12, 2), (14, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((2126525542125103320420446425232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (14, 1)],
  term ((-12730846139891730095285749215888 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (14, 2)],
  term ((26918213796465180722490883227840 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-238739320306667637756466962373620 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1)],
  term ((95451877593622969216407900596376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 2)],
  term ((-62630984473600121515737208864416 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-145009425737503567769307809868387489308736 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21962661328 : Rat) / 7401317245) [(1, 1), (2, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((431540869516508529601170118042368 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 1)],
  term ((-178319778963020359882000684312704 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (13, 1), (14, 2)],
  term ((-18429220529679389883737329172301067217484 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1)],
  term ((153362734988 : Rat) / 7401317245) [(1, 1), (2, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((818004037517494687406953582565296337119368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (8, 1), (14, 2), (15, 1)],
  term ((-37915991136 : Rat) / 7401317245) [(1, 1), (2, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((247022923639257370452335177372256 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-6944788694923215714573049912032 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (9, 1), (12, 1), (14, 2)],
  term ((715938020518280404216931910048 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (9, 1), (12, 2), (14, 1)],
  term ((32508675763262631894328037249012251332288 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((703466192 : Rat) / 22496405) [(1, 1), (2, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1)],
  term ((-14730655892751816773690906656992 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (14, 1)],
  term ((-288788796214319549172783691939157369735328 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (9, 1), (14, 1), (15, 2)],
  term ((-258041730832 : Rat) / 7401317245) [(1, 1), (2, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((6299357054381502618787120085568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (14, 2)],
  term ((31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 2), (11, 1), (14, 1)],
  term ((-58647225192412125545659641250944 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 2), (13, 1), (14, 1)],
  term ((1713683577970808379391201839843529699126368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1)],
  term ((26601353664 : Rat) / 7401317245) [(1, 1), (2, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((375307226801173328166059889727576 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((-36609648349011791031099574927488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 2)],
  term ((137633359287518297120575803961584 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (12, 2), (14, 1)],
  term ((-146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (13, 2), (14, 1)],
  term ((116512541588252757541293572117936 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-5534767221225257422001453553072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((-717257263471860122003149990483104 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((81537782187916740938911981688832 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 2)],
  term ((-598576009763050197756071477090094679337456 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-252560825158 : Rat) / 7401317245) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-411636902701580853944878207823175020120688 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1)],
  term ((10918461476 : Rat) / 7401317245) [(1, 1), (2, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-241832392680868642876478911459776 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (12, 2), (13, 1), (14, 1)],
  term ((927138338019857822930350288626059658804984 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1)],
  term ((-59577740678 : Rat) / 7401317245) [(1, 1), (2, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-20420662790654924410391866925408 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-14635193336404957905743694230368 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((26475351699120332558041036547072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-610800922265660480336992591079648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((-31393941556429422122331102125437621947328 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 1), (4, 1), (14, 1), (15, 2)],
  term ((-182241416 : Rat) / 1057331035) [(1, 1), (3, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1284607426407307807622393741152191645453472 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((-244948228376 : Rat) / 7401317245) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-7152265131106956413046019105936 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (6, 1), (15, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1122103207187493978666649666891750158848128 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (7, 2), (15, 1)],
  term ((4951818709625393821685005772928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (12, 1), (15, 1)],
  term ((1001724812659945557063593471232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (8, 1), (15, 1)],
  term ((-125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((53467330736953118310101329251647969716224 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2)],
  term ((2487323152 : Rat) / 211466207) [(1, 1), (3, 1), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2)],
  term ((8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((13055818091682828716482270414560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-10140753239812864678954395175392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1)],
  term ((-28325791653890350382523939661534834746240 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((-2487323152 : Rat) / 211466207) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (13, 2), (15, 1)],
  term ((5994815846524323232979469781680 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((12772862812949708397016024821272 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 2), (7, 1), (15, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 2), (15, 2)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2)],
  term ((26727199601895975181716501662976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-5339945167802021207351224623552 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-38329624987092475305452561706096 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((128691726895140762805673511767040 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1841203549454860640532866318413508253758784 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((93883265632 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((10623609938792831508953599653504 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((80462067948130072935973071279552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-14484483144305169759537285909142754488336 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((18073603536 : Rat) / 7401317245) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1335633083546594076084791294976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-41814068255187141279871942491840 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1327940893227440847636054228864 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3593582557439692291540210162560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (12, 2), (15, 1)],
  term ((7067755291029709899442268666496 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-12730846139891730095285749215888 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((2126525542125103320420446425232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((26918213796465180722490883227840 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((95451877593622969216407900596376 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-238739320306667637756466962373620 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1)],
  term ((-62630984473600121515737208864416 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-145009425737503567769307809868387489308736 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2)],
  term ((-21962661328 : Rat) / 7401317245) [(1, 1), (3, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-178319778963020359882000684312704 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((431540869516508529601170118042368 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (13, 1), (15, 1)],
  term ((818004037517494687406953582565296337119368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((-37915991136 : Rat) / 7401317245) [(1, 1), (3, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18429220529679389883737329172301067217484 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((153362734988 : Rat) / 7401317245) [(1, 1), (3, 1), (8, 1), (15, 2), (16, 1)],
  term ((-25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((247022923639257370452335177372256 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (11, 1), (15, 2)],
  term ((-1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-6944788694923215714573049912032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((715938020518280404216931910048 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (9, 1), (12, 2), (15, 1)],
  term ((32508675763262631894328037249012251332288 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((703466192 : Rat) / 22496405) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (9, 1), (13, 2), (15, 1)],
  term ((6299357054381502618787120085568 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((-14730655892751816773690906656992 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-288788796214319549172783691939157369735328 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((-258041730832 : Rat) / 7401317245) [(1, 1), (3, 1), (9, 1), (15, 3), (16, 1)],
  term ((31142534824116101844172300576032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 2), (11, 1), (15, 1)],
  term ((-58647225192412125545659641250944 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 2), (13, 1), (15, 1)],
  term ((1713683577970808379391201839843529699126368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (9, 2), (15, 2)],
  term ((26601353664 : Rat) / 7401317245) [(1, 1), (3, 1), (9, 2), (15, 2), (16, 1)],
  term ((-36609648349011791031099574927488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((375307226801173328166059889727576 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (12, 1), (15, 1)],
  term ((137633359287518297120575803961584 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (12, 2), (15, 1)],
  term ((-146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2)],
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5534767221225257422001453553072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((116512541588252757541293572117936 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((81537782187916740938911981688832 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-717257263471860122003149990483104 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-411636902701580853944878207823175020120688 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((10918461476 : Rat) / 7401317245) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-598576009763050197756071477090094679337456 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-252560825158 : Rat) / 7401317245) [(1, 1), (3, 1), (12, 1), (15, 2), (16, 1)],
  term ((-241832392680868642876478911459776 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (12, 2), (13, 1), (15, 1)],
  term ((927138338019857822930350288626059658804984 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (12, 2), (15, 2)],
  term ((-59577740678 : Rat) / 7401317245) [(1, 1), (3, 1), (12, 2), (15, 2), (16, 1)],
  term ((-14635193336404957905743694230368 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-20420662790654924410391866925408 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-13237675849560166279020518273536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((305400461132830240168496295539824 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1), (14, 2)],
  term ((-13237675849560166279020518273536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1), (14, 3)],
  term ((305400461132830240168496295539824 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((15696970778214711061165551062718810973664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (14, 1), (15, 3)],
  term ((91120708 : Rat) / 1057331035) [(1, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((642303713203653903811196870576095822726736 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (14, 2), (15, 1)],
  term ((122474114188 : Rat) / 7401317245) [(1, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((15696970778214711061165551062718810973664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (4, 1), (14, 3), (15, 1)],
  term ((91120708 : Rat) / 1057331035) [(1, 1), (4, 1), (14, 3), (15, 1), (16, 1)],
  term ((642303713203653903811196870576095822726736 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 3)],
  term ((122474114188 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (12, 1), (14, 2)],
  term ((3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((3576132565553478206523009552968 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (14, 2)],
  term ((3576132565553478206523009552968 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (6, 1), (15, 2)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 2)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 2)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (7, 1), (15, 3)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2), (14, 2)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 2), (15, 2)],
  term ((-2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (12, 1), (14, 2)],
  term ((-2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-500862406329972778531796735616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (14, 2)],
  term ((-500862406329972778531796735616 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (15, 2)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 2)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (13, 1), (14, 2)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-26733665368476559155050664625823984858112 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26733665368476559155050664625823984858112 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (9, 1), (15, 3)],
  term ((-1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 2)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (15, 3)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-6527909045841414358241135207280 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (14, 2)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (14, 3)],
  term ((-6527909045841414358241135207280 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((5070376619906432339477197587696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2), (14, 2)],
  term ((5070376619906432339477197587696 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (12, 2), (15, 2)],
  term ((14162895826945175191261969830767417373120 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((14162895826945175191261969830767417373120 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((1243661576 : Rat) / 211466207) [(1, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 2), (14, 2)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((-2997407923262161616489734890840 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-6386431406474854198508012410636 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 2)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (14, 2), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2997407923262161616489734890840 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 3)],
  term ((-6386431406474854198508012410636 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (15, 2)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (5, 1), (15, 4)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (5, 1), (15, 4), (16, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1), (14, 2)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 2), (7, 1), (15, 2)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (14, 2), (15, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 2), (15, 3)],
  term ((-3602102152998840954066202590168 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (14, 2)],
  term ((-3602102152998840954066202590168 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((-13363599800947987590858250831488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((-13363599800947987590858250831488 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((2669972583901010603675612311776 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 2)],
  term ((2669972583901010603675612311776 : Rat) / 97983883872014706756151952089) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((19164812493546237652726280853048 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (14, 2)],
  term ((19164812493546237652726280853048 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((-64345863447570381402836755883520 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-64345863447570381402836755883520 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-920601774727430320266433159206754126879392 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-920601774727430320266433159206754126879392 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((-46941632816 : Rat) / 7401317245) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5311804969396415754476799826752 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-40231033974065036467986535639776 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((-5311804969396415754476799826752 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (14, 3)],
  term ((-40231033974065036467986535639776 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((7242241572152584879768642954571377244168 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((-9036801768 : Rat) / 7401317245) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((7242241572152584879768642954571377244168 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (6, 1), (15, 3)],
  term ((-9036801768 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((20907034127593570639935971245920 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (14, 2)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (14, 3)],
  term ((20907034127593570639935971245920 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (15, 2)],
  term ((663970446613720423818027114432 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((1796791278719846145770105081280 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 2)],
  term ((663970446613720423818027114432 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (14, 3)],
  term ((1796791278719846145770105081280 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2), (14, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 2), (15, 2)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3533877645514854949721134333248 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 3)],
  term ((6365423069945865047642874607944 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((-1063262771062551660210223212616 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 2)],
  term ((6365423069945865047642874607944 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (14, 3)],
  term ((-1063262771062551660210223212616 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (15, 2)],
  term ((-13459106898232590361245441613920 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((-13459106898232590361245441613920 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-47725938796811484608203950298188 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((119369660153333818878233481186810 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((-47725938796811484608203950298188 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (14, 3)],
  term ((119369660153333818878233481186810 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((31315492236800060757868604432208 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((31315492236800060757868604432208 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((72504712868751783884653904934193744654368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((10981330664 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((72504712868751783884653904934193744654368 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((10981330664 : Rat) / 7401317245) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((89159889481510179941000342156352 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-215770434758254264800585059021184 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((89159889481510179941000342156352 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (14, 3)],
  term ((-215770434758254264800585059021184 : Rat) / 1273790490336191187829975377157) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 1), (15, 3)],
  term ((18957995568 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((9214610264839694941868664586150533608742 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 2), (15, 1)],
  term ((-76681367494 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (14, 3), (15, 1)],
  term ((18957995568 : Rat) / 7401317245) [(1, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((9214610264839694941868664586150533608742 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (8, 1), (15, 3)],
  term ((-76681367494 : Rat) / 7401317245) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((3472394347461607857286524956016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (14, 2)],
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (12, 1), (14, 3)],
  term ((3472394347461607857286524956016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-357969010259140202108465955024 : Rat) / 97983883872014706756151952089) [(1, 1), (9, 1), (12, 2), (14, 2)],
  term ((-357969010259140202108465955024 : Rat) / 97983883872014706756151952089) [(1, 1), (9, 1), (12, 2), (15, 2)],
  term ((-16254337881631315947164018624506125666144 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-351733096 : Rat) / 22496405) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16254337881631315947164018624506125666144 : Rat) / 28655706755751543118854197224551620585) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-351733096 : Rat) / 22496405) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((-3149678527190751309393560042784 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((7365327946375908386845453328496 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 2)],
  term ((144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (9, 1), (14, 2), (15, 2)],
  term ((129020865416 : Rat) / 7401317245) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3149678527190751309393560042784 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (14, 3)],
  term ((7365327946375908386845453328496 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 1), (15, 2)],
  term ((144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (9, 1), (15, 4)],
  term ((129020865416 : Rat) / 7401317245) [(1, 1), (9, 1), (15, 4), (16, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (14, 2)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (11, 1), (15, 2)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1), (14, 2)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(1, 1), (9, 2), (13, 1), (15, 2)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 2), (14, 2), (15, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(1, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (9, 2), (15, 3)],
  term ((-13300676832 : Rat) / 7401317245) [(1, 1), (9, 2), (15, 3), (16, 1)],
  term ((18304824174505895515549787463744 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-187653613400586664083029944863788 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((18304824174505895515549787463744 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (14, 3)],
  term ((-187653613400586664083029944863788 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-68816679643759148560287901980792 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2), (14, 2)],
  term ((-68816679643759148560287901980792 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (12, 2), (15, 2)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 2), (14, 2)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((2767383610612628711000726776536 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-58256270794126378770646786058968 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 2)],
  term ((2767383610612628711000726776536 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (14, 3)],
  term ((-58256270794126378770646786058968 : Rat) / 1273790490336191187829975377157) [(1, 1), (11, 1), (15, 2)],
  term ((-40768891093958370469455990844416 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((358628631735930061001574995241552 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-40768891093958370469455990844416 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (14, 3)],
  term ((358628631735930061001574995241552 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((205818451350790426972439103911587510060344 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((-5459230738 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((299288004881525098878035738545047339668728 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((126280412579 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((205818451350790426972439103911587510060344 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (14, 3), (15, 1)],
  term ((-5459230738 : Rat) / 7401317245) [(1, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((299288004881525098878035738545047339668728 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 3)],
  term ((126280412579 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((120916196340434321438239455729888 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1), (14, 2)],
  term ((120916196340434321438239455729888 : Rat) / 1273790490336191187829975377157) [(1, 1), (12, 2), (13, 1), (15, 2)],
  term ((-463569169009928911465175144313029829402492 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 2), (14, 2), (15, 1)],
  term ((29788870339 : Rat) / 7401317245) [(1, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-463569169009928911465175144313029829402492 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 2), (15, 3)],
  term ((29788870339 : Rat) / 7401317245) [(1, 1), (12, 2), (15, 3), (16, 1)],
  term ((7317596668202478952871847115184 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((10210331395327462205195933462704 : Rat) / 97983883872014706756151952089) [(1, 1), (13, 1), (14, 2)],
  term ((7317596668202478952871847115184 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1), (14, 3)],
  term ((10210331395327462205195933462704 : Rat) / 97983883872014706756151952089) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 200 through 299. -/
theorem ep_Q2_002_block_11_0200_0299_valid :
    checkProductSumEq ep_Q2_002_partials_11_0200_0299
      ep_Q2_002_block_11_0200_0299 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
