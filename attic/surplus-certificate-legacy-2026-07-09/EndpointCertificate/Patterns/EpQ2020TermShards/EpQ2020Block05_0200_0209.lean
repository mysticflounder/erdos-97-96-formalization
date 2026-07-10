/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_020, term block 5:200-209

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_020`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2020TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_020`. -/
def ep_Q2_020_generator_05_0200_0209 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0200 : Poly :=
[
  term ((-294705188331674139 : Rat) / 28298395017400811) [(11, 2), (16, 1)]
]

/-- Partial product 200 for generator 5. -/
def ep_Q2_020_partial_05_0200 : Poly :=
[
  term ((-294705188331674139 : Rat) / 28298395017400811) [(2, 2), (11, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(3, 2), (11, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 2), (14, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem ep_Q2_020_partial_05_0200_valid :
    mulPoly ep_Q2_020_coefficient_05_0200
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0201 : Poly :=
[
  term ((399738981390682512 : Rat) / 28298395017400811) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 201 for generator 5. -/
def ep_Q2_020_partial_05_0201 : Poly :=
[
  term ((399738981390682512 : Rat) / 28298395017400811) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((399738981390682512 : Rat) / 28298395017400811) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-399738981390682512 : Rat) / 28298395017400811) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-399738981390682512 : Rat) / 28298395017400811) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem ep_Q2_020_partial_05_0201_valid :
    mulPoly ep_Q2_020_coefficient_05_0201
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0202 : Poly :=
[
  term ((-79844494932044226 : Rat) / 28298395017400811) [(12, 1), (16, 1)]
]

/-- Partial product 202 for generator 5. -/
def ep_Q2_020_partial_05_0202 : Poly :=
[
  term ((-79844494932044226 : Rat) / 28298395017400811) [(2, 2), (12, 1), (16, 1)],
  term ((-79844494932044226 : Rat) / 28298395017400811) [(3, 2), (12, 1), (16, 1)],
  term ((79844494932044226 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)],
  term ((79844494932044226 : Rat) / 28298395017400811) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem ep_Q2_020_partial_05_0202_valid :
    mulPoly ep_Q2_020_coefficient_05_0202
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0203 : Poly :=
[
  term ((-449975499998020827 : Rat) / 56596790034801622) [(12, 2), (16, 1)]
]

/-- Partial product 203 for generator 5. -/
def ep_Q2_020_partial_05_0203 : Poly :=
[
  term ((-449975499998020827 : Rat) / 56596790034801622) [(2, 2), (12, 2), (16, 1)],
  term ((-449975499998020827 : Rat) / 56596790034801622) [(3, 2), (12, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem ep_Q2_020_partial_05_0203_valid :
    mulPoly ep_Q2_020_coefficient_05_0203
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0204 : Poly :=
[
  term ((324296646286529856 : Rat) / 28298395017400811) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 5. -/
def ep_Q2_020_partial_05_0204 : Poly :=
[
  term ((324296646286529856 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((324296646286529856 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-324296646286529856 : Rat) / 28298395017400811) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-324296646286529856 : Rat) / 28298395017400811) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem ep_Q2_020_partial_05_0204_valid :
    mulPoly ep_Q2_020_coefficient_05_0204
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0205 : Poly :=
[
  term ((-81926921958152667 : Rat) / 56596790034801622) [(13, 2), (16, 1)]
]

/-- Partial product 205 for generator 5. -/
def ep_Q2_020_partial_05_0205 : Poly :=
[
  term ((-81926921958152667 : Rat) / 56596790034801622) [(2, 2), (13, 2), (16, 1)],
  term ((-81926921958152667 : Rat) / 56596790034801622) [(3, 2), (13, 2), (16, 1)],
  term ((81926921958152667 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)],
  term ((81926921958152667 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem ep_Q2_020_partial_05_0205_valid :
    mulPoly ep_Q2_020_coefficient_05_0205
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0206 : Poly :=
[
  term ((-2433276322008261573 : Rat) / 28298395017400811) [(14, 1), (16, 1)]
]

/-- Partial product 206 for generator 5. -/
def ep_Q2_020_partial_05_0206 : Poly :=
[
  term ((-2433276322008261573 : Rat) / 28298395017400811) [(2, 2), (14, 1), (16, 1)],
  term ((-2433276322008261573 : Rat) / 28298395017400811) [(3, 2), (14, 1), (16, 1)],
  term ((2433276322008261573 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((2433276322008261573 : Rat) / 28298395017400811) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem ep_Q2_020_partial_05_0206_valid :
    mulPoly ep_Q2_020_coefficient_05_0206
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0207 : Poly :=
[
  term ((1982757342199295817 : Rat) / 56596790034801622) [(14, 2), (16, 1)]
]

/-- Partial product 207 for generator 5. -/
def ep_Q2_020_partial_05_0207 : Poly :=
[
  term ((1982757342199295817 : Rat) / 56596790034801622) [(2, 2), (14, 2), (16, 1)],
  term ((1982757342199295817 : Rat) / 56596790034801622) [(3, 2), (14, 2), (16, 1)],
  term ((-1982757342199295817 : Rat) / 56596790034801622) [(14, 2), (15, 2), (16, 1)],
  term ((-1982757342199295817 : Rat) / 56596790034801622) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem ep_Q2_020_partial_05_0207_valid :
    mulPoly ep_Q2_020_coefficient_05_0207
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0208 : Poly :=
[
  term ((8594021754247755309 : Rat) / 113193580069603244) [(15, 2), (16, 1)]
]

/-- Partial product 208 for generator 5. -/
def ep_Q2_020_partial_05_0208 : Poly :=
[
  term ((8594021754247755309 : Rat) / 113193580069603244) [(2, 2), (15, 2), (16, 1)],
  term ((8594021754247755309 : Rat) / 113193580069603244) [(3, 2), (15, 2), (16, 1)],
  term ((-8594021754247755309 : Rat) / 113193580069603244) [(14, 2), (15, 2), (16, 1)],
  term ((-8594021754247755309 : Rat) / 113193580069603244) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem ep_Q2_020_partial_05_0208_valid :
    mulPoly ep_Q2_020_coefficient_05_0208
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def ep_Q2_020_coefficient_05_0209 : Poly :=
[
  term ((1684027671534470875 : Rat) / 56596790034801622) [(16, 1)]
]

/-- Partial product 209 for generator 5. -/
def ep_Q2_020_partial_05_0209 : Poly :=
[
  term ((1684027671534470875 : Rat) / 56596790034801622) [(2, 2), (16, 1)],
  term ((1684027671534470875 : Rat) / 56596790034801622) [(3, 2), (16, 1)],
  term ((-1684027671534470875 : Rat) / 56596790034801622) [(14, 2), (16, 1)],
  term ((-1684027671534470875 : Rat) / 56596790034801622) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem ep_Q2_020_partial_05_0209_valid :
    mulPoly ep_Q2_020_coefficient_05_0209
        ep_Q2_020_generator_05_0200_0209 =
      ep_Q2_020_partial_05_0209 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_020_partials_05_0200_0209 : List Poly :=
[
  ep_Q2_020_partial_05_0200,
  ep_Q2_020_partial_05_0201,
  ep_Q2_020_partial_05_0202,
  ep_Q2_020_partial_05_0203,
  ep_Q2_020_partial_05_0204,
  ep_Q2_020_partial_05_0205,
  ep_Q2_020_partial_05_0206,
  ep_Q2_020_partial_05_0207,
  ep_Q2_020_partial_05_0208,
  ep_Q2_020_partial_05_0209
]

/-- Sum of partial products in this block. -/
def ep_Q2_020_block_05_0200_0209 : Poly :=
[
  term ((-294705188331674139 : Rat) / 28298395017400811) [(2, 2), (11, 2), (16, 1)],
  term ((399738981390682512 : Rat) / 28298395017400811) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-79844494932044226 : Rat) / 28298395017400811) [(2, 2), (12, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 56596790034801622) [(2, 2), (12, 2), (16, 1)],
  term ((324296646286529856 : Rat) / 28298395017400811) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-81926921958152667 : Rat) / 56596790034801622) [(2, 2), (13, 2), (16, 1)],
  term ((-2433276322008261573 : Rat) / 28298395017400811) [(2, 2), (14, 1), (16, 1)],
  term ((1982757342199295817 : Rat) / 56596790034801622) [(2, 2), (14, 2), (16, 1)],
  term ((8594021754247755309 : Rat) / 113193580069603244) [(2, 2), (15, 2), (16, 1)],
  term ((1684027671534470875 : Rat) / 56596790034801622) [(2, 2), (16, 1)],
  term ((-294705188331674139 : Rat) / 28298395017400811) [(3, 2), (11, 2), (16, 1)],
  term ((399738981390682512 : Rat) / 28298395017400811) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-79844494932044226 : Rat) / 28298395017400811) [(3, 2), (12, 1), (16, 1)],
  term ((-449975499998020827 : Rat) / 56596790034801622) [(3, 2), (12, 2), (16, 1)],
  term ((324296646286529856 : Rat) / 28298395017400811) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-81926921958152667 : Rat) / 56596790034801622) [(3, 2), (13, 2), (16, 1)],
  term ((-2433276322008261573 : Rat) / 28298395017400811) [(3, 2), (14, 1), (16, 1)],
  term ((1982757342199295817 : Rat) / 56596790034801622) [(3, 2), (14, 2), (16, 1)],
  term ((8594021754247755309 : Rat) / 113193580069603244) [(3, 2), (15, 2), (16, 1)],
  term ((1684027671534470875 : Rat) / 56596790034801622) [(3, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 2), (14, 2), (16, 1)],
  term ((294705188331674139 : Rat) / 28298395017400811) [(11, 2), (15, 2), (16, 1)],
  term ((-399738981390682512 : Rat) / 28298395017400811) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((79844494932044226 : Rat) / 28298395017400811) [(12, 1), (14, 2), (16, 1)],
  term ((-399738981390682512 : Rat) / 28298395017400811) [(12, 1), (14, 3), (16, 1)],
  term ((79844494932044226 : Rat) / 28298395017400811) [(12, 1), (15, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(12, 2), (14, 2), (16, 1)],
  term ((449975499998020827 : Rat) / 56596790034801622) [(12, 2), (15, 2), (16, 1)],
  term ((-324296646286529856 : Rat) / 28298395017400811) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-324296646286529856 : Rat) / 28298395017400811) [(13, 1), (15, 3), (16, 1)],
  term ((81926921958152667 : Rat) / 56596790034801622) [(13, 2), (14, 2), (16, 1)],
  term ((81926921958152667 : Rat) / 56596790034801622) [(13, 2), (15, 2), (16, 1)],
  term ((2433276322008261573 : Rat) / 28298395017400811) [(14, 1), (15, 2), (16, 1)],
  term ((-12559536438646346943 : Rat) / 113193580069603244) [(14, 2), (15, 2), (16, 1)],
  term ((-1684027671534470875 : Rat) / 56596790034801622) [(14, 2), (16, 1)],
  term ((2433276322008261573 : Rat) / 28298395017400811) [(14, 3), (16, 1)],
  term ((-1982757342199295817 : Rat) / 56596790034801622) [(14, 4), (16, 1)],
  term ((-1684027671534470875 : Rat) / 56596790034801622) [(15, 2), (16, 1)],
  term ((-8594021754247755309 : Rat) / 113193580069603244) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 209. -/
theorem ep_Q2_020_block_05_0200_0209_valid :
    checkProductSumEq ep_Q2_020_partials_05_0200_0209
      ep_Q2_020_block_05_0200_0209 = true := by
  native_decide

end EpQ2020TermShards

end Patterns

end EndpointCertificate

end Problem97
