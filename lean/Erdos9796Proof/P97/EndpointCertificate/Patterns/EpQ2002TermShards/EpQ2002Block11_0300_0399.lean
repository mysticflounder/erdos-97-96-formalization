/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 11:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_11_0300_0399 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0300 : Poly :=
[
  term ((-1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 300 for generator 11. -/
def ep_Q2_002_partial_11_0300 : Poly :=
[
  term ((-2840728714269004499887142235580277730957264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2840728714269004499887142235580277730957264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 11. -/
theorem ep_Q2_002_partial_11_0300_valid :
    mulPoly ep_Q2_002_coefficient_11_0300
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0301 : Poly :=
[
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 11. -/
def ep_Q2_002_partial_11_0301 : Poly :=
[
  term ((21809658828 : Rat) / 7401317245) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((21809658828 : Rat) / 7401317245) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 11. -/
theorem ep_Q2_002_partial_11_0301_valid :
    mulPoly ep_Q2_002_coefficient_11_0301
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0302 : Poly :=
[
  term ((120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 302 for generator 11. -/
def ep_Q2_002_partial_11_0302 : Poly :=
[
  term ((241785783830003418130579274365485111456528 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1)],
  term ((241785783830003418130579274365485111456528 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((-120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 11. -/
theorem ep_Q2_002_partial_11_0302_valid :
    mulPoly ep_Q2_002_coefficient_11_0302
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0303 : Poly :=
[
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 11. -/
def ep_Q2_002_partial_11_0303 : Poly :=
[
  term ((-21809658828 : Rat) / 7401317245) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21809658828 : Rat) / 7401317245) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 11. -/
theorem ep_Q2_002_partial_11_0303_valid :
    mulPoly ep_Q2_002_coefficient_11_0303
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0304 : Poly :=
[
  term ((-137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3)]
]

/-- Partial product 304 for generator 11. -/
def ep_Q2_002_partial_11_0304 : Poly :=
[
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 3), (14, 1)],
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 3), (15, 1)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3), (14, 2)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 11. -/
theorem ep_Q2_002_partial_11_0304_valid :
    mulPoly ep_Q2_002_coefficient_11_0304
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0305 : Poly :=
[
  term ((100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 305 for generator 11. -/
def ep_Q2_002_partial_11_0305 : Poly :=
[
  term ((201162692580284472009531988548954573893012 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((201162692580284472009531988548954573893012 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 1), (15, 3)],
  term ((-100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 11. -/
theorem ep_Q2_002_partial_11_0305_valid :
    mulPoly ep_Q2_002_coefficient_11_0305
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0306 : Poly :=
[
  term ((5881401385 : Rat) / 2960526898) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 11. -/
def ep_Q2_002_partial_11_0306 : Poly :=
[
  term ((5881401385 : Rat) / 1480263449) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((5881401385 : Rat) / 1480263449) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5881401385 : Rat) / 2960526898) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5881401385 : Rat) / 2960526898) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 11. -/
theorem ep_Q2_002_partial_11_0306_valid :
    mulPoly ep_Q2_002_coefficient_11_0306
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0307 : Poly :=
[
  term ((-3232759902897889077433335485381722239507 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (15, 1)]
]

/-- Partial product 307 for generator 11. -/
def ep_Q2_002_partial_11_0307 : Poly :=
[
  term ((-6465519805795778154866670970763444479014 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-6465519805795778154866670970763444479014 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (3, 1), (15, 2)],
  term ((3232759902897889077433335485381722239507 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (14, 2), (15, 1)],
  term ((3232759902897889077433335485381722239507 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 11. -/
theorem ep_Q2_002_partial_11_0307_valid :
    mulPoly ep_Q2_002_coefficient_11_0307
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0308 : Poly :=
[
  term ((-5393834741 : Rat) / 845864828) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 11. -/
def ep_Q2_002_partial_11_0308 : Poly :=
[
  term ((-5393834741 : Rat) / 422932414) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5393834741 : Rat) / 422932414) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((5393834741 : Rat) / 845864828) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((5393834741 : Rat) / 845864828) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 11. -/
theorem ep_Q2_002_partial_11_0308_valid :
    mulPoly ep_Q2_002_coefficient_11_0308
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0309 : Poly :=
[
  term ((-4402298369893479283828487937376 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 309 for generator 11. -/
def ep_Q2_002_partial_11_0309 : Poly :=
[
  term ((-8804596739786958567656975874752 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (14, 1)],
  term ((-8804596739786958567656975874752 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (15, 1)],
  term ((4402298369893479283828487937376 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 2)],
  term ((4402298369893479283828487937376 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 11. -/
theorem ep_Q2_002_partial_11_0309_valid :
    mulPoly ep_Q2_002_coefficient_11_0309
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0310 : Poly :=
[
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1)]
]

/-- Partial product 310 for generator 11. -/
def ep_Q2_002_partial_11_0310 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (14, 2)],
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 11. -/
theorem ep_Q2_002_partial_11_0310_valid :
    mulPoly ep_Q2_002_coefficient_11_0310
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0311 : Poly :=
[
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (15, 1)]
]

/-- Partial product 311 for generator 11. -/
def ep_Q2_002_partial_11_0311 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (15, 3)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 11. -/
theorem ep_Q2_002_partial_11_0311_valid :
    mulPoly ep_Q2_002_coefficient_11_0311
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0312 : Poly :=
[
  term ((-11756645648773299630332430139648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)]
]

/-- Partial product 312 for generator 11. -/
def ep_Q2_002_partial_11_0312 : Poly :=
[
  term ((-23513291297546599260664860279296 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (14, 1)],
  term ((-23513291297546599260664860279296 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((11756645648773299630332430139648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 2)],
  term ((11756645648773299630332430139648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 11. -/
theorem ep_Q2_002_partial_11_0312_valid :
    mulPoly ep_Q2_002_coefficient_11_0312
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0313 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1)]
]

/-- Partial product 313 for generator 11. -/
def ep_Q2_002_partial_11_0313 : Poly :=
[
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (6, 1), (14, 1)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (14, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 11. -/
theorem ep_Q2_002_partial_11_0313_valid :
    mulPoly ep_Q2_002_coefficient_11_0313
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0314 : Poly :=
[
  term ((3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1)]
]

/-- Partial product 314 for generator 11. -/
def ep_Q2_002_partial_11_0314 : Poly :=
[
  term ((6425091341613693392995409249280 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (12, 1), (14, 1)],
  term ((6425091341613693392995409249280 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1), (14, 2)],
  term ((-3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 11. -/
theorem ep_Q2_002_partial_11_0314_valid :
    mulPoly ep_Q2_002_coefficient_11_0314
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0315 : Poly :=
[
  term ((541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 1)]
]

/-- Partial product 315 for generator 11. -/
def ep_Q2_002_partial_11_0315 : Poly :=
[
  term ((1083977745395875625650675220864 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (14, 2)],
  term ((1083977745395875625650675220864 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 1), (15, 2)],
  term ((-541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 11. -/
theorem ep_Q2_002_partial_11_0315_valid :
    mulPoly ep_Q2_002_coefficient_11_0315
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0316 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1)]
]

/-- Partial product 316 for generator 11. -/
def ep_Q2_002_partial_11_0316 : Poly :=
[
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (7, 1), (14, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (14, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 11. -/
theorem ep_Q2_002_partial_11_0316_valid :
    mulPoly ep_Q2_002_coefficient_11_0316
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0317 : Poly :=
[
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1)]
]

/-- Partial product 317 for generator 11. -/
def ep_Q2_002_partial_11_0317 : Poly :=
[
  term ((8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (9, 1), (14, 1)],
  term ((8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1), (14, 2)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 11. -/
theorem ep_Q2_002_partial_11_0317_valid :
    mulPoly ep_Q2_002_coefficient_11_0317
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0318 : Poly :=
[
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1)]
]

/-- Partial product 318 for generator 11. -/
def ep_Q2_002_partial_11_0318 : Poly :=
[
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1), (14, 2)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 11. -/
theorem ep_Q2_002_partial_11_0318_valid :
    mulPoly ep_Q2_002_coefficient_11_0318
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0319 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (15, 1)]
]

/-- Partial product 319 for generator 11. -/
def ep_Q2_002_partial_11_0319 : Poly :=
[
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (15, 2)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (14, 2), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 11. -/
theorem ep_Q2_002_partial_11_0319_valid :
    mulPoly ep_Q2_002_coefficient_11_0319
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0320 : Poly :=
[
  term ((1268778935019881940234628960416 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1)]
]

/-- Partial product 320 for generator 11. -/
def ep_Q2_002_partial_11_0320 : Poly :=
[
  term ((2537557870039763880469257920832 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((2537557870039763880469257920832 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-1268778935019881940234628960416 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (14, 2)],
  term ((-1268778935019881940234628960416 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 11. -/
theorem ep_Q2_002_partial_11_0320_valid :
    mulPoly ep_Q2_002_coefficient_11_0320
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0321 : Poly :=
[
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1)]
]

/-- Partial product 321 for generator 11. -/
def ep_Q2_002_partial_11_0321 : Poly :=
[
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (12, 1), (14, 1)],
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1), (14, 2)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 11. -/
theorem ep_Q2_002_partial_11_0321_valid :
    mulPoly ep_Q2_002_coefficient_11_0321
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0322 : Poly :=
[
  term ((772044595670761740453662974824 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1)]
]

/-- Partial product 322 for generator 11. -/
def ep_Q2_002_partial_11_0322 : Poly :=
[
  term ((1544089191341523480907325949648 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 1), (8, 1), (14, 1)],
  term ((1544089191341523480907325949648 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((-772044595670761740453662974824 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1), (14, 2)],
  term ((-772044595670761740453662974824 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 11. -/
theorem ep_Q2_002_partial_11_0322_valid :
    mulPoly ep_Q2_002_coefficient_11_0322
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0323 : Poly :=
[
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1)]
]

/-- Partial product 323 for generator 11. -/
def ep_Q2_002_partial_11_0323 : Poly :=
[
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (8, 1), (12, 1), (14, 1)],
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1), (14, 2)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 11. -/
theorem ep_Q2_002_partial_11_0323_valid :
    mulPoly ep_Q2_002_coefficient_11_0323
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0324 : Poly :=
[
  term ((-3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 1)]
]

/-- Partial product 324 for generator 11. -/
def ep_Q2_002_partial_11_0324 : Poly :=
[
  term ((-6751352587373512322240719910688 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (8, 1), (14, 2)],
  term ((-6751352587373512322240719910688 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 1), (15, 2)],
  term ((3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 11. -/
theorem ep_Q2_002_partial_11_0324_valid :
    mulPoly ep_Q2_002_coefficient_11_0324
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0325 : Poly :=
[
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1)]
]

/-- Partial product 325 for generator 11. -/
def ep_Q2_002_partial_11_0325 : Poly :=
[
  term ((1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 11. -/
theorem ep_Q2_002_partial_11_0325_valid :
    mulPoly ep_Q2_002_coefficient_11_0325
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0326 : Poly :=
[
  term ((-8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (15, 1)]
]

/-- Partial product 326 for generator 11. -/
def ep_Q2_002_partial_11_0326 : Poly :=
[
  term ((-17472038232214821662935140736128 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-17472038232214821662935140736128 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (9, 1), (15, 2)],
  term ((8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 11. -/
theorem ep_Q2_002_partial_11_0326_valid :
    mulPoly ep_Q2_002_coefficient_11_0326
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0327 : Poly :=
[
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2)]
]

/-- Partial product 327 for generator 11. -/
def ep_Q2_002_partial_11_0327 : Poly :=
[
  term ((-2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (9, 2), (14, 1)],
  term ((-2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (9, 2), (15, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (14, 2)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 11. -/
theorem ep_Q2_002_partial_11_0327_valid :
    mulPoly ep_Q2_002_coefficient_11_0327
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0328 : Poly :=
[
  term ((-13153883552965025107779371990544 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

/-- Partial product 328 for generator 11. -/
def ep_Q2_002_partial_11_0328 : Poly :=
[
  term ((-26307767105930050215558743981088 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (12, 1), (14, 1)],
  term ((-26307767105930050215558743981088 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((13153883552965025107779371990544 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 2)],
  term ((13153883552965025107779371990544 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 11. -/
theorem ep_Q2_002_partial_11_0328_valid :
    mulPoly ep_Q2_002_coefficient_11_0328
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0329 : Poly :=
[
  term ((1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 1)]
]

/-- Partial product 329 for generator 11. -/
def ep_Q2_002_partial_11_0329 : Poly :=
[
  term ((2589416262257453762842720863744 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (12, 1), (14, 2)],
  term ((2589416262257453762842720863744 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 11. -/
theorem ep_Q2_002_partial_11_0329_valid :
    mulPoly ep_Q2_002_coefficient_11_0329
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0330 : Poly :=
[
  term ((-4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2)]
]

/-- Partial product 330 for generator 11. -/
def ep_Q2_002_partial_11_0330 : Poly :=
[
  term ((-9082957382214100373995567136064 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (12, 2), (14, 1)],
  term ((-9082957382214100373995567136064 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (12, 2), (15, 1)],
  term ((4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2), (14, 2)],
  term ((4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 11. -/
theorem ep_Q2_002_partial_11_0330_valid :
    mulPoly ep_Q2_002_coefficient_11_0330
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0331 : Poly :=
[
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (15, 1)]
]

/-- Partial product 331 for generator 11. -/
def ep_Q2_002_partial_11_0331 : Poly :=
[
  term ((10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 11. -/
theorem ep_Q2_002_partial_11_0331_valid :
    mulPoly ep_Q2_002_coefficient_11_0331
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0332 : Poly :=
[
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2)]
]

/-- Partial product 332 for generator 11. -/
def ep_Q2_002_partial_11_0332 : Poly :=
[
  term ((-10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (13, 2), (14, 1)],
  term ((-10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (13, 2), (15, 1)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2), (14, 2)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 11. -/
theorem ep_Q2_002_partial_11_0332_valid :
    mulPoly ep_Q2_002_coefficient_11_0332
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0333 : Poly :=
[
  term ((195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1)]
]

/-- Partial product 333 for generator 11. -/
def ep_Q2_002_partial_11_0333 : Poly :=
[
  term ((391476479473942839698417001536 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (14, 2)],
  term ((391476479473942839698417001536 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1), (15, 2)],
  term ((-195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 11. -/
theorem ep_Q2_002_partial_11_0333_valid :
    mulPoly ep_Q2_002_coefficient_11_0333
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0334 : Poly :=
[
  term ((-5029450783603600394973916367118 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 334 for generator 11. -/
def ep_Q2_002_partial_11_0334 : Poly :=
[
  term ((-10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((5029450783603600394973916367118 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((5029450783603600394973916367118 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 11. -/
theorem ep_Q2_002_partial_11_0334_valid :
    mulPoly ep_Q2_002_coefficient_11_0334
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0335 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1)]
]

/-- Partial product 335 for generator 11. -/
def ep_Q2_002_partial_11_0335 : Poly :=
[
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 2)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 11. -/
theorem ep_Q2_002_partial_11_0335_valid :
    mulPoly ep_Q2_002_coefficient_11_0335
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0336 : Poly :=
[
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 336 for generator 11. -/
def ep_Q2_002_partial_11_0336 : Poly :=
[
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 11. -/
theorem ep_Q2_002_partial_11_0336_valid :
    mulPoly ep_Q2_002_coefficient_11_0336
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0337 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 337 for generator 11. -/
def ep_Q2_002_partial_11_0337 : Poly :=
[
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 3)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 11. -/
theorem ep_Q2_002_partial_11_0337_valid :
    mulPoly ep_Q2_002_coefficient_11_0337
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0338 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 11. -/
def ep_Q2_002_partial_11_0338 : Poly :=
[
  term ((-150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 11. -/
theorem ep_Q2_002_partial_11_0338_valid :
    mulPoly ep_Q2_002_coefficient_11_0338
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0339 : Poly :=
[
  term ((9471397699834657878866831468856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 339 for generator 11. -/
def ep_Q2_002_partial_11_0339 : Poly :=
[
  term ((18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1)],
  term ((-9471397699834657878866831468856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((-9471397699834657878866831468856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 11. -/
theorem ep_Q2_002_partial_11_0339_valid :
    mulPoly ep_Q2_002_coefficient_11_0339
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0340 : Poly :=
[
  term ((43969813713280480572813622386885074056179 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 340 for generator 11. -/
def ep_Q2_002_partial_11_0340 : Poly :=
[
  term ((87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-43969813713280480572813622386885074056179 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-43969813713280480572813622386885074056179 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (15, 3)],
  term ((87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 11. -/
theorem ep_Q2_002_partial_11_0340_valid :
    mulPoly ep_Q2_002_coefficient_11_0340
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0341 : Poly :=
[
  term ((220140210347 : Rat) / 88815806940) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 11. -/
def ep_Q2_002_partial_11_0341 : Poly :=
[
  term ((220140210347 : Rat) / 44407903470) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-220140210347 : Rat) / 88815806940) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-220140210347 : Rat) / 88815806940) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((220140210347 : Rat) / 44407903470) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 11. -/
theorem ep_Q2_002_partial_11_0341_valid :
    mulPoly ep_Q2_002_coefficient_11_0341
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0342 : Poly :=
[
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1)]
]

/-- Partial product 342 for generator 11. -/
def ep_Q2_002_partial_11_0342 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 2)],
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 11. -/
theorem ep_Q2_002_partial_11_0342_valid :
    mulPoly ep_Q2_002_coefficient_11_0342
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0343 : Poly :=
[
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 343 for generator 11. -/
def ep_Q2_002_partial_11_0343 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 11. -/
theorem ep_Q2_002_partial_11_0343_valid :
    mulPoly ep_Q2_002_coefficient_11_0343
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0344 : Poly :=
[
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 344 for generator 11. -/
def ep_Q2_002_partial_11_0344 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 11. -/
theorem ep_Q2_002_partial_11_0344_valid :
    mulPoly ep_Q2_002_coefficient_11_0344
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0345 : Poly :=
[
  term ((-190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 11. -/
def ep_Q2_002_partial_11_0345 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 11. -/
theorem ep_Q2_002_partial_11_0345_valid :
    mulPoly ep_Q2_002_coefficient_11_0345
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0346 : Poly :=
[
  term ((7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 346 for generator 11. -/
def ep_Q2_002_partial_11_0346 : Poly :=
[
  term ((14039033635290492606125114592840 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((-7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((14039033635290492606125114592840 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 11. -/
theorem ep_Q2_002_partial_11_0346_valid :
    mulPoly ep_Q2_002_coefficient_11_0346
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0347 : Poly :=
[
  term ((-13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 347 for generator 11. -/
def ep_Q2_002_partial_11_0347 : Poly :=
[
  term ((-26438129450372971573621010261280 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((-26438129450372971573621010261280 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 11. -/
theorem ep_Q2_002_partial_11_0347_valid :
    mulPoly ep_Q2_002_coefficient_11_0347
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0348 : Poly :=
[
  term ((8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 348 for generator 11. -/
def ep_Q2_002_partial_11_0348 : Poly :=
[
  term ((16743381818465944834059897890143022400948 : Rat) / 24487603954914955028839041264616839409) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((-8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (15, 4)],
  term ((16743381818465944834059897890143022400948 : Rat) / 24487603954914955028839041264616839409) [(3, 2), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 11. -/
theorem ep_Q2_002_partial_11_0348_valid :
    mulPoly ep_Q2_002_coefficient_11_0348
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0349 : Poly :=
[
  term ((-44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 349 for generator 11. -/
def ep_Q2_002_partial_11_0349 : Poly :=
[
  term ((-44451007625 : Rat) / 4440790347) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-44451007625 : Rat) / 4440790347) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 11. -/
theorem ep_Q2_002_partial_11_0349_valid :
    mulPoly ep_Q2_002_coefficient_11_0349
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0350 : Poly :=
[
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 350 for generator 11. -/
def ep_Q2_002_partial_11_0350 : Poly :=
[
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(3, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 11. -/
theorem ep_Q2_002_partial_11_0350_valid :
    mulPoly ep_Q2_002_coefficient_11_0350
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0351 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 351 for generator 11. -/
def ep_Q2_002_partial_11_0351 : Poly :=
[
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 11. -/
theorem ep_Q2_002_partial_11_0351_valid :
    mulPoly ep_Q2_002_coefficient_11_0351
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0352 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 352 for generator 11. -/
def ep_Q2_002_partial_11_0352 : Poly :=
[
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 2)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 11. -/
theorem ep_Q2_002_partial_11_0352_valid :
    mulPoly ep_Q2_002_coefficient_11_0352
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0353 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 353 for generator 11. -/
def ep_Q2_002_partial_11_0353 : Poly :=
[
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 11. -/
theorem ep_Q2_002_partial_11_0353_valid :
    mulPoly ep_Q2_002_coefficient_11_0353
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0354 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 11. -/
def ep_Q2_002_partial_11_0354 : Poly :=
[
  term ((21084059056 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((21084059056 : Rat) / 7401317245) [(3, 2), (6, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 11. -/
theorem ep_Q2_002_partial_11_0354_valid :
    mulPoly ep_Q2_002_coefficient_11_0354
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0355 : Poly :=
[
  term ((-39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 355 for generator 11. -/
def ep_Q2_002_partial_11_0355 : Poly :=
[
  term ((-79375582433919990598582347827640 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-79375582433919990598582347827640 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 11. -/
theorem ep_Q2_002_partial_11_0355_valid :
    mulPoly ep_Q2_002_coefficient_11_0355
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0356 : Poly :=
[
  term ((3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 356 for generator 11. -/
def ep_Q2_002_partial_11_0356 : Poly :=
[
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 2)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 11. -/
theorem ep_Q2_002_partial_11_0356_valid :
    mulPoly ep_Q2_002_coefficient_11_0356
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0357 : Poly :=
[
  term ((-5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 357 for generator 11. -/
def ep_Q2_002_partial_11_0357 : Poly :=
[
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 11. -/
theorem ep_Q2_002_partial_11_0357_valid :
    mulPoly ep_Q2_002_coefficient_11_0357
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0358 : Poly :=
[
  term ((-429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 358 for generator 11. -/
def ep_Q2_002_partial_11_0358 : Poly :=
[
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 11. -/
theorem ep_Q2_002_partial_11_0358_valid :
    mulPoly ep_Q2_002_coefficient_11_0358
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0359 : Poly :=
[
  term ((-37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 11. -/
def ep_Q2_002_partial_11_0359 : Poly :=
[
  term ((-75722948608 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-75722948608 : Rat) / 7401317245) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 11. -/
theorem ep_Q2_002_partial_11_0359_valid :
    mulPoly ep_Q2_002_coefficient_11_0359
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0360 : Poly :=
[
  term ((74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 360 for generator 11. -/
def ep_Q2_002_partial_11_0360 : Poly :=
[
  term ((149479086531393230675728096262880 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((-74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((149479086531393230675728096262880 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 11. -/
theorem ep_Q2_002_partial_11_0360_valid :
    mulPoly ep_Q2_002_coefficient_11_0360
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0361 : Poly :=
[
  term ((-1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 361 for generator 11. -/
def ep_Q2_002_partial_11_0361 : Poly :=
[
  term ((-2216386721525246256067896947494769494733276 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)],
  term ((-2216386721525246256067896947494769494733276 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 11. -/
theorem ep_Q2_002_partial_11_0361_valid :
    mulPoly ep_Q2_002_coefficient_11_0361
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0362 : Poly :=
[
  term ((-38687265959 : Rat) / 44407903470) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 11. -/
def ep_Q2_002_partial_11_0362 : Poly :=
[
  term ((-38687265959 : Rat) / 22203951735) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((38687265959 : Rat) / 44407903470) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((38687265959 : Rat) / 44407903470) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-38687265959 : Rat) / 22203951735) [(3, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 11. -/
theorem ep_Q2_002_partial_11_0362_valid :
    mulPoly ep_Q2_002_coefficient_11_0362
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0363 : Poly :=
[
  term ((-624103296474801454920 : Rat) / 253528477699481291099) [(3, 1), (7, 1)]
]

/-- Partial product 363 for generator 11. -/
def ep_Q2_002_partial_11_0363 : Poly :=
[
  term ((-1248206592949602909840 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((624103296474801454920 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 2)],
  term ((624103296474801454920 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (15, 2)],
  term ((-1248206592949602909840 : Rat) / 253528477699481291099) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 11. -/
theorem ep_Q2_002_partial_11_0363_valid :
    mulPoly ep_Q2_002_coefficient_11_0363
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0364 : Poly :=
[
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 364 for generator 11. -/
def ep_Q2_002_partial_11_0364 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 11. -/
theorem ep_Q2_002_partial_11_0364_valid :
    mulPoly ep_Q2_002_coefficient_11_0364
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0365 : Poly :=
[
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 365 for generator 11. -/
def ep_Q2_002_partial_11_0365 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 11. -/
theorem ep_Q2_002_partial_11_0365_valid :
    mulPoly ep_Q2_002_coefficient_11_0365
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0366 : Poly :=
[
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 366 for generator 11. -/
def ep_Q2_002_partial_11_0366 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 11. -/
theorem ep_Q2_002_partial_11_0366_valid :
    mulPoly ep_Q2_002_coefficient_11_0366
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0367 : Poly :=
[
  term ((-48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 11. -/
def ep_Q2_002_partial_11_0367 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 11. -/
theorem ep_Q2_002_partial_11_0367_valid :
    mulPoly ep_Q2_002_coefficient_11_0367
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0368 : Poly :=
[
  term ((-33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 368 for generator 11. -/
def ep_Q2_002_partial_11_0368 : Poly :=
[
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (15, 3)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 11. -/
theorem ep_Q2_002_partial_11_0368_valid :
    mulPoly ep_Q2_002_coefficient_11_0368
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0369 : Poly :=
[
  term ((63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 369 for generator 11. -/
def ep_Q2_002_partial_11_0369 : Poly :=
[
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 11. -/
theorem ep_Q2_002_partial_11_0369_valid :
    mulPoly ep_Q2_002_coefficient_11_0369
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0370 : Poly :=
[
  term ((-178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 370 for generator 11. -/
def ep_Q2_002_partial_11_0370 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 3)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 11. -/
theorem ep_Q2_002_partial_11_0370_valid :
    mulPoly ep_Q2_002_coefficient_11_0370
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0371 : Poly :=
[
  term ((-266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 371 for generator 11. -/
def ep_Q2_002_partial_11_0371 : Poly :=
[
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (15, 4)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 11. -/
theorem ep_Q2_002_partial_11_0371_valid :
    mulPoly ep_Q2_002_coefficient_11_0371
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0372 : Poly :=
[
  term ((88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 372 for generator 11. -/
def ep_Q2_002_partial_11_0372 : Poly :=
[
  term ((88171245013 : Rat) / 22203951735) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(3, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 11. -/
theorem ep_Q2_002_partial_11_0372_valid :
    mulPoly ep_Q2_002_coefficient_11_0372
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0373 : Poly :=
[
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1)]
]

/-- Partial product 373 for generator 11. -/
def ep_Q2_002_partial_11_0373 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (14, 2)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (15, 2)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 11. -/
theorem ep_Q2_002_partial_11_0373_valid :
    mulPoly ep_Q2_002_coefficient_11_0373
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0374 : Poly :=
[
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1)]
]

/-- Partial product 374 for generator 11. -/
def ep_Q2_002_partial_11_0374 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (14, 2)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 11. -/
theorem ep_Q2_002_partial_11_0374_valid :
    mulPoly ep_Q2_002_coefficient_11_0374
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0375 : Poly :=
[
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (15, 1)]
]

/-- Partial product 375 for generator 11. -/
def ep_Q2_002_partial_11_0375 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (14, 2), (15, 1)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (15, 3)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 11. -/
theorem ep_Q2_002_partial_11_0375_valid :
    mulPoly ep_Q2_002_coefficient_11_0375
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0376 : Poly :=
[
  term ((-88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 11. -/
def ep_Q2_002_partial_11_0376 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 11. -/
theorem ep_Q2_002_partial_11_0376_valid :
    mulPoly ep_Q2_002_coefficient_11_0376
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0377 : Poly :=
[
  term ((14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 377 for generator 11. -/
def ep_Q2_002_partial_11_0377 : Poly :=
[
  term ((28325143136305918656698423084928 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 2)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((28325143136305918656698423084928 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 11. -/
theorem ep_Q2_002_partial_11_0377_valid :
    mulPoly ep_Q2_002_coefficient_11_0377
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0378 : Poly :=
[
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 378 for generator 11. -/
def ep_Q2_002_partial_11_0378 : Poly :=
[
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 2)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 3)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 11. -/
theorem ep_Q2_002_partial_11_0378_valid :
    mulPoly ep_Q2_002_coefficient_11_0378
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0379 : Poly :=
[
  term ((-26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 379 for generator 11. -/
def ep_Q2_002_partial_11_0379 : Poly :=
[
  term ((-53341549026248487926225123237376 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 2)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-53341549026248487926225123237376 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 11. -/
theorem ep_Q2_002_partial_11_0379_valid :
    mulPoly ep_Q2_002_coefficient_11_0379
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0380 : Poly :=
[
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 380 for generator 11. -/
def ep_Q2_002_partial_11_0380 : Poly :=
[
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 2)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 3)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 11. -/
theorem ep_Q2_002_partial_11_0380_valid :
    mulPoly ep_Q2_002_coefficient_11_0380
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0381 : Poly :=
[
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 381 for generator 11. -/
def ep_Q2_002_partial_11_0381 : Poly :=
[
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (8, 1), (14, 2), (15, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 3), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 11. -/
theorem ep_Q2_002_partial_11_0381_valid :
    mulPoly ep_Q2_002_coefficient_11_0381
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0382 : Poly :=
[
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 11. -/
def ep_Q2_002_partial_11_0382 : Poly :=
[
  term ((-10542029528 : Rat) / 7401317245) [(2, 1), (3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 11. -/
theorem ep_Q2_002_partial_11_0382_valid :
    mulPoly ep_Q2_002_coefficient_11_0382
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0383 : Poly :=
[
  term ((-242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 383 for generator 11. -/
def ep_Q2_002_partial_11_0383 : Poly :=
[
  term ((-485851620504988298241459578694914751136608 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 3)],
  term ((-485851620504988298241459578694914751136608 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 11. -/
theorem ep_Q2_002_partial_11_0383_valid :
    mulPoly ep_Q2_002_coefficient_11_0383
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0384 : Poly :=
[
  term ((-15813044292 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 11. -/
def ep_Q2_002_partial_11_0384 : Poly :=
[
  term ((-31626088584 : Rat) / 7401317245) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((15813044292 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((15813044292 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-31626088584 : Rat) / 7401317245) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 11. -/
theorem ep_Q2_002_partial_11_0384_valid :
    mulPoly ep_Q2_002_coefficient_11_0384
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0385 : Poly :=
[
  term ((-157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 385 for generator 11. -/
def ep_Q2_002_partial_11_0385 : Poly :=
[
  term ((-315922885785470450186133156102240 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-315922885785470450186133156102240 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 11. -/
theorem ep_Q2_002_partial_11_0385_valid :
    mulPoly ep_Q2_002_coefficient_11_0385
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0386 : Poly :=
[
  term ((297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 386 for generator 11. -/
def ep_Q2_002_partial_11_0386 : Poly :=
[
  term ((594941957382014400119498279326080 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((594941957382014400119498279326080 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 11. -/
theorem ep_Q2_002_partial_11_0386_valid :
    mulPoly ep_Q2_002_coefficient_11_0386
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0387 : Poly :=
[
  term ((1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 387 for generator 11. -/
def ep_Q2_002_partial_11_0387 : Poly :=
[
  term ((2346014545058621473225398534627735433193088 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (15, 4)],
  term ((2346014545058621473225398534627735433193088 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 11. -/
theorem ep_Q2_002_partial_11_0387_valid :
    mulPoly ep_Q2_002_coefficient_11_0387
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0388 : Poly :=
[
  term ((131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 388 for generator 11. -/
def ep_Q2_002_partial_11_0388 : Poly :=
[
  term ((263945068024 : Rat) / 7401317245) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((263945068024 : Rat) / 7401317245) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 11. -/
theorem ep_Q2_002_partial_11_0388_valid :
    mulPoly ep_Q2_002_coefficient_11_0388
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0389 : Poly :=
[
  term ((82430057415871499357576393664894 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1)]
]

/-- Partial product 389 for generator 11. -/
def ep_Q2_002_partial_11_0389 : Poly :=
[
  term ((164860114831742998715152787329788 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((-82430057415871499357576393664894 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2)],
  term ((-82430057415871499357576393664894 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 2)],
  term ((164860114831742998715152787329788 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 11. -/
theorem ep_Q2_002_partial_11_0389_valid :
    mulPoly ep_Q2_002_coefficient_11_0389
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0390 : Poly :=
[
  term ((-10417820624607245534220902539320 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 390 for generator 11. -/
def ep_Q2_002_partial_11_0390 : Poly :=
[
  term ((-20835641249214491068441805078640 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((10417820624607245534220902539320 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((10417820624607245534220902539320 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-20835641249214491068441805078640 : Rat) / 97983883872014706756151952089) [(3, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 11. -/
theorem ep_Q2_002_partial_11_0390_valid :
    mulPoly ep_Q2_002_coefficient_11_0390
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0391 : Poly :=
[
  term ((-1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 391 for generator 11. -/
def ep_Q2_002_partial_11_0391 : Poly :=
[
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 2)],
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 3)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 11. -/
theorem ep_Q2_002_partial_11_0391_valid :
    mulPoly ep_Q2_002_coefficient_11_0391
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0392 : Poly :=
[
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 392 for generator 11. -/
def ep_Q2_002_partial_11_0392 : Poly :=
[
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 11. -/
theorem ep_Q2_002_partial_11_0392_valid :
    mulPoly ep_Q2_002_coefficient_11_0392
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0393 : Poly :=
[
  term ((17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 393 for generator 11. -/
def ep_Q2_002_partial_11_0393 : Poly :=
[
  term ((35352386820615743775253101460212 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((-17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 3)],
  term ((35352386820615743775253101460212 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 11. -/
theorem ep_Q2_002_partial_11_0393_valid :
    mulPoly ep_Q2_002_coefficient_11_0393
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0394 : Poly :=
[
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 394 for generator 11. -/
def ep_Q2_002_partial_11_0394 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 4)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 11. -/
theorem ep_Q2_002_partial_11_0394_valid :
    mulPoly ep_Q2_002_coefficient_11_0394
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0395 : Poly :=
[
  term ((19618707200172091788734023177440 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 395 for generator 11. -/
def ep_Q2_002_partial_11_0395 : Poly :=
[
  term ((39237414400344183577468046354880 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-19618707200172091788734023177440 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-19618707200172091788734023177440 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((39237414400344183577468046354880 : Rat) / 97983883872014706756151952089) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 11. -/
theorem ep_Q2_002_partial_11_0395_valid :
    mulPoly ep_Q2_002_coefficient_11_0395
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0396 : Poly :=
[
  term ((2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 396 for generator 11. -/
def ep_Q2_002_partial_11_0396 : Poly :=
[
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 3)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 11. -/
theorem ep_Q2_002_partial_11_0396_valid :
    mulPoly ep_Q2_002_coefficient_11_0396
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0397 : Poly :=
[
  term ((214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 397 for generator 11. -/
def ep_Q2_002_partial_11_0397 : Poly :=
[
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 3), (15, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 11. -/
theorem ep_Q2_002_partial_11_0397_valid :
    mulPoly ep_Q2_002_coefficient_11_0397
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0398 : Poly :=
[
  term ((18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 11. -/
def ep_Q2_002_partial_11_0398 : Poly :=
[
  term ((37861474304 : Rat) / 7401317245) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 11. -/
theorem ep_Q2_002_partial_11_0398_valid :
    mulPoly ep_Q2_002_coefficient_11_0398
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0399 : Poly :=
[
  term ((320282328278168754096376432741635360139356 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 399 for generator 11. -/
def ep_Q2_002_partial_11_0399 : Poly :=
[
  term ((640564656556337508192752865483270720278712 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-320282328278168754096376432741635360139356 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-320282328278168754096376432741635360139356 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 3)],
  term ((640564656556337508192752865483270720278712 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 11. -/
theorem ep_Q2_002_partial_11_0399_valid :
    mulPoly ep_Q2_002_coefficient_11_0399
        ep_Q2_002_generator_11_0300_0399 =
      ep_Q2_002_partial_11_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_11_0300_0399 : List Poly :=
[
  ep_Q2_002_partial_11_0300,
  ep_Q2_002_partial_11_0301,
  ep_Q2_002_partial_11_0302,
  ep_Q2_002_partial_11_0303,
  ep_Q2_002_partial_11_0304,
  ep_Q2_002_partial_11_0305,
  ep_Q2_002_partial_11_0306,
  ep_Q2_002_partial_11_0307,
  ep_Q2_002_partial_11_0308,
  ep_Q2_002_partial_11_0309,
  ep_Q2_002_partial_11_0310,
  ep_Q2_002_partial_11_0311,
  ep_Q2_002_partial_11_0312,
  ep_Q2_002_partial_11_0313,
  ep_Q2_002_partial_11_0314,
  ep_Q2_002_partial_11_0315,
  ep_Q2_002_partial_11_0316,
  ep_Q2_002_partial_11_0317,
  ep_Q2_002_partial_11_0318,
  ep_Q2_002_partial_11_0319,
  ep_Q2_002_partial_11_0320,
  ep_Q2_002_partial_11_0321,
  ep_Q2_002_partial_11_0322,
  ep_Q2_002_partial_11_0323,
  ep_Q2_002_partial_11_0324,
  ep_Q2_002_partial_11_0325,
  ep_Q2_002_partial_11_0326,
  ep_Q2_002_partial_11_0327,
  ep_Q2_002_partial_11_0328,
  ep_Q2_002_partial_11_0329,
  ep_Q2_002_partial_11_0330,
  ep_Q2_002_partial_11_0331,
  ep_Q2_002_partial_11_0332,
  ep_Q2_002_partial_11_0333,
  ep_Q2_002_partial_11_0334,
  ep_Q2_002_partial_11_0335,
  ep_Q2_002_partial_11_0336,
  ep_Q2_002_partial_11_0337,
  ep_Q2_002_partial_11_0338,
  ep_Q2_002_partial_11_0339,
  ep_Q2_002_partial_11_0340,
  ep_Q2_002_partial_11_0341,
  ep_Q2_002_partial_11_0342,
  ep_Q2_002_partial_11_0343,
  ep_Q2_002_partial_11_0344,
  ep_Q2_002_partial_11_0345,
  ep_Q2_002_partial_11_0346,
  ep_Q2_002_partial_11_0347,
  ep_Q2_002_partial_11_0348,
  ep_Q2_002_partial_11_0349,
  ep_Q2_002_partial_11_0350,
  ep_Q2_002_partial_11_0351,
  ep_Q2_002_partial_11_0352,
  ep_Q2_002_partial_11_0353,
  ep_Q2_002_partial_11_0354,
  ep_Q2_002_partial_11_0355,
  ep_Q2_002_partial_11_0356,
  ep_Q2_002_partial_11_0357,
  ep_Q2_002_partial_11_0358,
  ep_Q2_002_partial_11_0359,
  ep_Q2_002_partial_11_0360,
  ep_Q2_002_partial_11_0361,
  ep_Q2_002_partial_11_0362,
  ep_Q2_002_partial_11_0363,
  ep_Q2_002_partial_11_0364,
  ep_Q2_002_partial_11_0365,
  ep_Q2_002_partial_11_0366,
  ep_Q2_002_partial_11_0367,
  ep_Q2_002_partial_11_0368,
  ep_Q2_002_partial_11_0369,
  ep_Q2_002_partial_11_0370,
  ep_Q2_002_partial_11_0371,
  ep_Q2_002_partial_11_0372,
  ep_Q2_002_partial_11_0373,
  ep_Q2_002_partial_11_0374,
  ep_Q2_002_partial_11_0375,
  ep_Q2_002_partial_11_0376,
  ep_Q2_002_partial_11_0377,
  ep_Q2_002_partial_11_0378,
  ep_Q2_002_partial_11_0379,
  ep_Q2_002_partial_11_0380,
  ep_Q2_002_partial_11_0381,
  ep_Q2_002_partial_11_0382,
  ep_Q2_002_partial_11_0383,
  ep_Q2_002_partial_11_0384,
  ep_Q2_002_partial_11_0385,
  ep_Q2_002_partial_11_0386,
  ep_Q2_002_partial_11_0387,
  ep_Q2_002_partial_11_0388,
  ep_Q2_002_partial_11_0389,
  ep_Q2_002_partial_11_0390,
  ep_Q2_002_partial_11_0391,
  ep_Q2_002_partial_11_0392,
  ep_Q2_002_partial_11_0393,
  ep_Q2_002_partial_11_0394,
  ep_Q2_002_partial_11_0395,
  ep_Q2_002_partial_11_0396,
  ep_Q2_002_partial_11_0397,
  ep_Q2_002_partial_11_0398,
  ep_Q2_002_partial_11_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_11_0300_0399 : Poly :=
[
  term ((-2840728714269004499887142235580277730957264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2)],
  term ((21809658828 : Rat) / 7401317245) [(1, 1), (2, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((241785783830003418130579274365485111456528 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1)],
  term ((-21809658828 : Rat) / 7401317245) [(1, 1), (2, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 3), (14, 1)],
  term ((-6465519805795778154866670970763444479014 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((-5393834741 : Rat) / 422932414) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((201162692580284472009531988548954573893012 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((5881401385 : Rat) / 1480263449) [(1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2840728714269004499887142235580277730957264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((21809658828 : Rat) / 7401317245) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((241785783830003418130579274365485111456528 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((-21809658828 : Rat) / 7401317245) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 3), (15, 1)],
  term ((201162692580284472009531988548954573893012 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((5881401385 : Rat) / 1480263449) [(1, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6465519805795778154866670970763444479014 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (3, 1), (15, 2)],
  term ((-5393834741 : Rat) / 422932414) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (15, 4)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((-120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (15, 3)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3), (14, 2)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3), (15, 2)],
  term ((-100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 1), (15, 3)],
  term ((-5881401385 : Rat) / 2960526898) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((3232759902897889077433335485381722239507 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (14, 2), (15, 1)],
  term ((5393834741 : Rat) / 845864828) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 3), (15, 1)],
  term ((-5881401385 : Rat) / 2960526898) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((3232759902897889077433335485381722239507 : Rat) / 20720280269543423485940727223906556423) [(1, 1), (15, 3)],
  term ((5393834741 : Rat) / 845864828) [(1, 1), (15, 3), (16, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (6, 1), (14, 1)],
  term ((6425091341613693392995409249280 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (12, 1), (14, 1)],
  term ((-23513291297546599260664860279296 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (14, 1)],
  term ((1083977745395875625650675220864 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (14, 2)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (7, 1), (14, 1)],
  term ((8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (9, 1), (14, 1)],
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (13, 1), (14, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (12, 1), (14, 1)],
  term ((2537557870039763880469257920832 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (8, 1), (12, 1), (14, 1)],
  term ((1544089191341523480907325949648 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 1), (8, 1), (14, 1)],
  term ((-6751352587373512322240719910688 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (8, 1), (14, 2)],
  term ((1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-17472038232214821662935140736128 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (9, 2), (14, 1)],
  term ((-26307767105930050215558743981088 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (12, 1), (14, 1)],
  term ((2589416262257453762842720863744 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (12, 1), (14, 2)],
  term ((-9082957382214100373995567136064 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (12, 2), (14, 1)],
  term ((10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (13, 2), (14, 1)],
  term ((-8804596739786958567656975874752 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (14, 1)],
  term ((391476479473942839698417001536 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (14, 2)],
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (6, 1), (15, 1)],
  term ((6425091341613693392995409249280 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((1083977745395875625650675220864 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-23513291297546599260664860279296 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (15, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-8844617435843772499370251939584 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (15, 2)],
  term ((4658549070585859427786239459584 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((2537557870039763880469257920832 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (14, 2)],
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (8, 1), (12, 1), (15, 1)],
  term ((-6751352587373512322240719910688 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((1544089191341523480907325949648 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((1788614835472866718813032943104 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-17472038232214821662935140736128 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (9, 1), (15, 2)],
  term ((-2202724957986712244008221638016 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (9, 2), (15, 1)],
  term ((2589416262257453762842720863744 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-26307767105930050215558743981088 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-9082957382214100373995567136064 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (12, 2), (15, 1)],
  term ((10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-10356071199105079225161397088256 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (13, 2), (15, 1)],
  term ((391476479473942839698417001536 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((-8804596739786958567656975874752 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (15, 1)],
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (15, 3)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (7, 1), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (15, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (14, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (15, 2)],
  term ((-3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1), (14, 2)],
  term ((-3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1), (15, 2)],
  term ((-541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 1), (15, 2)],
  term ((11756645648773299630332430139648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 2)],
  term ((-541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 3)],
  term ((11756645648773299630332430139648 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (15, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (14, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (15, 2)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1), (14, 2)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1), (15, 2)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1), (14, 2)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (14, 2), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (15, 3)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1), (14, 2)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((-1268778935019881940234628960416 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (14, 2)],
  term ((-1268778935019881940234628960416 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (15, 2)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1), (14, 2)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 1), (15, 2)],
  term ((-772044595670761740453662974824 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1), (14, 2)],
  term ((3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 3)],
  term ((-772044595670761740453662974824 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1), (15, 2)],
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (15, 3)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (14, 2)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (15, 2)],
  term ((-1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((13153883552965025107779371990544 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 2)],
  term ((-1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 3)],
  term ((13153883552965025107779371990544 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (15, 2)],
  term ((4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2), (14, 2)],
  term ((4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2), (15, 2)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (15, 3)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2), (14, 2)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2), (15, 2)],
  term ((-195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1), (15, 2)],
  term ((4402298369893479283828487937376 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 2)],
  term ((-195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 3)],
  term ((4402298369893479283828487937376 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((-10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (14, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1), (14, 1)],
  term ((87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1)],
  term ((220140210347 : Rat) / 44407903470) [(2, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1), (14, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (7, 1), (13, 1), (14, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((14039033635290492606125114592840 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-26438129450372971573621010261280 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((16743381818465944834059897890143022400948 : Rat) / 24487603954914955028839041264616839409) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-44451007625 : Rat) / 4440790347) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((21084059056 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-79375582433919990598582347827640 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-75722948608 : Rat) / 7401317245) [(2, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((149479086531393230675728096262880 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-2216386721525246256067896947494769494733276 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-38687265959 : Rat) / 22203951735) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1248206592949602909840 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (7, 1), (14, 1)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(2, 1), (3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (7, 1), (14, 2)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 2), (11, 1), (14, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (7, 2), (13, 1), (14, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(2, 1), (3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((28325143136305918656698423084928 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (11, 1), (14, 2)],
  term ((-53341549026248487926225123237376 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (8, 1), (13, 1), (14, 2)],
  term ((-485851620504988298241459578694914751136608 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-31626088584 : Rat) / 7401317245) [(2, 1), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(2, 1), (3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-315922885785470450186133156102240 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((594941957382014400119498279326080 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((2346014545058621473225398534627735433193088 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((263945068024 : Rat) / 7401317245) [(2, 1), (3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20835641249214491068441805078640 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 2)],
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((164860114831742998715152787329788 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 1), (15, 2)],
  term ((35352386820615743775253101460212 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (11, 1), (14, 2)],
  term ((39237414400344183577468046354880 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (12, 1), (13, 1), (14, 2)],
  term ((640564656556337508192752865483270720278712 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((37861474304 : Rat) / 7401317245) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 2)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((5029450783603600394973916367118 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((5029450783603600394973916367118 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 3)],
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9471397699834657878866831468856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((-9471397699834657878866831468856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-43969813713280480572813622386885074056179 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((-220140210347 : Rat) / 88815806940) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43969813713280480572813622386885074056179 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (15, 3)],
  term ((-220140210347 : Rat) / 88815806940) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 2)],
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((-7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((-8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (15, 4)],
  term ((44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 2)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 2)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((39687791216959995299291173913820 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((-74739543265696615337864048131440 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((38687265959 : Rat) / 44407903470) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((1108193360762623128033948473747384747366638 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)],
  term ((38687265959 : Rat) / 44407903470) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (15, 3)],
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((624103296474801454920 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 2)],
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((-88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 3)],
  term ((624103296474801454920 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (15, 2)],
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (15, 4)],
  term ((-88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (14, 2)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (15, 2)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (14, 2)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (14, 2), (15, 1)],
  term ((88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (15, 3)],
  term ((88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 2)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 3)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 2)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 3)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((15813044292 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 3), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 3)],
  term ((15813044292 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((-297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (15, 4)],
  term ((-131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((10417820624607245534220902539320 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 3)],
  term ((10417820624607245534220902539320 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-82430057415871499357576393664894 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 3)],
  term ((-82430057415871499357576393664894 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 2)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 4)],
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-19618707200172091788734023177440 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 3)],
  term ((-19618707200172091788734023177440 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-320282328278168754096376432741635360139356 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 3), (15, 1)],
  term ((-18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-320282328278168754096376432741635360139356 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 3)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10058901567207200789947832734236 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (12, 1), (15, 2)],
  term ((-150050235908 : Rat) / 7401317245) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((18942795399669315757733662937712 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((87939627426560961145627244773770148112358 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (4, 1), (15, 2)],
  term ((220140210347 : Rat) / 44407903470) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((14039033635290492606125114592840 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((-26438129450372971573621010261280 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((16743381818465944834059897890143022400948 : Rat) / 24487603954914955028839041264616839409) [(3, 2), (5, 1), (15, 3)],
  term ((-44451007625 : Rat) / 4440790347) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((-18883428757537279104465615389952 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((35561032684165658617483415491584 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((323901080336658865494306385796609834091072 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (8, 1), (15, 2)],
  term ((21084059056 : Rat) / 7401317245) [(3, 2), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((6242350975301470030179740267328 : Rat) / 97983883872014706756151952089) [(3, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-79375582433919990598582347827640 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((-11755515902805752231434763218176 : Rat) / 97983883872014706756151952089) [(3, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-859758132337312199510146611126569566424256 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (12, 1), (15, 2)],
  term ((-75722948608 : Rat) / 7401317245) [(3, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((149479086531393230675728096262880 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-2216386721525246256067896947494769494733276 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (15, 2)],
  term ((-38687265959 : Rat) / 22203951735) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((-1248206592949602909840 : Rat) / 253528477699481291099) [(3, 2), (7, 1), (15, 1)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 3)],
  term ((88171245013 : Rat) / 22203951735) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (15, 2)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((28325143136305918656698423084928 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-53341549026248487926225123237376 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (14, 1), (15, 2)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-485851620504988298241459578694914751136608 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (15, 2)],
  term ((-31626088584 : Rat) / 7401317245) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-315922885785470450186133156102240 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((594941957382014400119498279326080 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((2346014545058621473225398534627735433193088 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (15, 3)],
  term ((263945068024 : Rat) / 7401317245) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20835641249214491068441805078640 : Rat) / 97983883872014706756151952089) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((35352386820615743775253101460212 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((164860114831742998715152787329788 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (15, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (15, 3)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((39237414400344183577468046354880 : Rat) / 97983883872014706756151952089) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((37861474304 : Rat) / 7401317245) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((640564656556337508192752865483270720278712 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 300 through 399. -/
theorem ep_Q2_002_block_11_0300_0399_valid :
    checkProductSumEq ep_Q2_002_partials_11_0300_0399
      ep_Q2_002_block_11_0300_0399 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
