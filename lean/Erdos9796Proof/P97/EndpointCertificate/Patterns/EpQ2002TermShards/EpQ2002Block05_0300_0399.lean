/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 5:300-399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_05_0300_0399 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0300 : Poly :=
[
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 300 for generator 5. -/
def ep_Q2_002_partial_05_0300 : Poly :=
[
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 5. -/
theorem ep_Q2_002_partial_05_0300_valid :
    mulPoly ep_Q2_002_coefficient_05_0300
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0301 : Poly :=
[
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 5. -/
def ep_Q2_002_partial_05_0301 : Poly :=
[
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 5. -/
theorem ep_Q2_002_partial_05_0301_valid :
    mulPoly ep_Q2_002_coefficient_05_0301
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0302 : Poly :=
[
  term ((-120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (15, 1)]
]

/-- Partial product 302 for generator 5. -/
def ep_Q2_002_partial_05_0302 : Poly :=
[
  term ((-120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 2), (13, 2), (15, 1)],
  term ((-120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 5. -/
theorem ep_Q2_002_partial_05_0302_valid :
    mulPoly ep_Q2_002_coefficient_05_0302
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0303 : Poly :=
[
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 5. -/
def ep_Q2_002_partial_05_0303 : Poly :=
[
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 5. -/
theorem ep_Q2_002_partial_05_0303_valid :
    mulPoly ep_Q2_002_coefficient_05_0303
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0304 : Poly :=
[
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3)]
]

/-- Partial product 304 for generator 5. -/
def ep_Q2_002_partial_05_0304 : Poly :=
[
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (13, 3)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (13, 3)],
  term ((-137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3), (14, 2)],
  term ((-137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 5. -/
theorem ep_Q2_002_partial_05_0304_valid :
    mulPoly ep_Q2_002_coefficient_05_0304
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0305 : Poly :=
[
  term ((-100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 305 for generator 5. -/
def ep_Q2_002_partial_05_0305 : Poly :=
[
  term ((-100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 1), (15, 3)],
  term ((100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 5. -/
theorem ep_Q2_002_partial_05_0305_valid :
    mulPoly ep_Q2_002_coefficient_05_0305
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0306 : Poly :=
[
  term ((-5881401385 : Rat) / 2960526898) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 5. -/
def ep_Q2_002_partial_05_0306 : Poly :=
[
  term ((-5881401385 : Rat) / 2960526898) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5881401385 : Rat) / 2960526898) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((5881401385 : Rat) / 2960526898) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((5881401385 : Rat) / 2960526898) [(1, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 5. -/
theorem ep_Q2_002_partial_05_0306_valid :
    mulPoly ep_Q2_002_coefficient_05_0306
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0307 : Poly :=
[
  term ((1026091316886027179583078042880377711434159 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 1)]
]

/-- Partial product 307 for generator 5. -/
def ep_Q2_002_partial_05_0307 : Poly :=
[
  term ((1026091316886027179583078042880377711434159 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 1)],
  term ((1026091316886027179583078042880377711434159 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (15, 1)],
  term ((-1026091316886027179583078042880377711434159 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (14, 2), (15, 1)],
  term ((-1026091316886027179583078042880377711434159 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 5. -/
theorem ep_Q2_002_partial_05_0307_valid :
    mulPoly ep_Q2_002_coefficient_05_0307
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0308 : Poly :=
[
  term ((-57787613977 : Rat) / 29605268980) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 5. -/
def ep_Q2_002_partial_05_0308 : Poly :=
[
  term ((-57787613977 : Rat) / 29605268980) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-57787613977 : Rat) / 29605268980) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((57787613977 : Rat) / 29605268980) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((57787613977 : Rat) / 29605268980) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 5. -/
theorem ep_Q2_002_partial_05_0308_valid :
    mulPoly ep_Q2_002_coefficient_05_0308
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0309 : Poly :=
[
  term ((-4495258574255534628732723792624 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 309 for generator 5. -/
def ep_Q2_002_partial_05_0309 : Poly :=
[
  term ((-4495258574255534628732723792624 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2)],
  term ((-4495258574255534628732723792624 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2)],
  term ((4495258574255534628732723792624 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 2)],
  term ((4495258574255534628732723792624 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 5. -/
theorem ep_Q2_002_partial_05_0309_valid :
    mulPoly ep_Q2_002_coefficient_05_0309
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0310 : Poly :=
[
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1)]
]

/-- Partial product 310 for generator 5. -/
def ep_Q2_002_partial_05_0310 : Poly :=
[
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (3, 1), (7, 1)],
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (14, 2)],
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 5. -/
theorem ep_Q2_002_partial_05_0310_valid :
    mulPoly ep_Q2_002_coefficient_05_0310
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0311 : Poly :=
[
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (15, 1)]
]

/-- Partial product 311 for generator 5. -/
def ep_Q2_002_partial_05_0311 : Poly :=
[
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (3, 1), (15, 1)],
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (15, 3)],
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 5. -/
theorem ep_Q2_002_partial_05_0311_valid :
    mulPoly ep_Q2_002_coefficient_05_0311
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0312 : Poly :=
[
  term ((1109977711005891002085429067968 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1)]
]

/-- Partial product 312 for generator 5. -/
def ep_Q2_002_partial_05_0312 : Poly :=
[
  term ((1109977711005891002085429067968 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 2), (4, 1)],
  term ((1109977711005891002085429067968 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 2), (4, 1)],
  term ((-1109977711005891002085429067968 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1), (14, 2)],
  term ((-1109977711005891002085429067968 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 5. -/
theorem ep_Q2_002_partial_05_0312_valid :
    mulPoly ep_Q2_002_coefficient_05_0312
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0313 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1)]
]

/-- Partial product 313 for generator 5. -/
def ep_Q2_002_partial_05_0313 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1), (6, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1), (6, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (14, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 5. -/
theorem ep_Q2_002_partial_05_0313_valid :
    mulPoly ep_Q2_002_coefficient_05_0313
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0314 : Poly :=
[
  term ((-3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1)]
]

/-- Partial product 314 for generator 5. -/
def ep_Q2_002_partial_05_0314 : Poly :=
[
  term ((-3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1), (12, 1)],
  term ((-3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1), (12, 1)],
  term ((3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1), (14, 2)],
  term ((3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 5. -/
theorem ep_Q2_002_partial_05_0314_valid :
    mulPoly ep_Q2_002_coefficient_05_0314
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0315 : Poly :=
[
  term ((-541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 1)]
]

/-- Partial product 315 for generator 5. -/
def ep_Q2_002_partial_05_0315 : Poly :=
[
  term ((-541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1), (14, 1)],
  term ((-541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1), (14, 1)],
  term ((541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 1), (15, 2)],
  term ((541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 5. -/
theorem ep_Q2_002_partial_05_0315_valid :
    mulPoly ep_Q2_002_coefficient_05_0315
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0316 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1)]
]

/-- Partial product 316 for generator 5. -/
def ep_Q2_002_partial_05_0316 : Poly :=
[
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (7, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (7, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (14, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 5. -/
theorem ep_Q2_002_partial_05_0316_valid :
    mulPoly ep_Q2_002_coefficient_05_0316
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0317 : Poly :=
[
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1)]
]

/-- Partial product 317 for generator 5. -/
def ep_Q2_002_partial_05_0317 : Poly :=
[
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (9, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (9, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1), (14, 2)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 5. -/
theorem ep_Q2_002_partial_05_0317_valid :
    mulPoly ep_Q2_002_coefficient_05_0317
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0318 : Poly :=
[
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1)]
]

/-- Partial product 318 for generator 5. -/
def ep_Q2_002_partial_05_0318 : Poly :=
[
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (13, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (13, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1), (14, 2)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 5. -/
theorem ep_Q2_002_partial_05_0318_valid :
    mulPoly ep_Q2_002_coefficient_05_0318
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0319 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (15, 1)]
]

/-- Partial product 319 for generator 5. -/
def ep_Q2_002_partial_05_0319 : Poly :=
[
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (15, 1)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (14, 2), (15, 1)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 5. -/
theorem ep_Q2_002_partial_05_0319_valid :
    mulPoly ep_Q2_002_coefficient_05_0319
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0320 : Poly :=
[
  term ((1060495600273047773658490769376 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1)]
]

/-- Partial product 320 for generator 5. -/
def ep_Q2_002_partial_05_0320 : Poly :=
[
  term ((1060495600273047773658490769376 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (6, 1)],
  term ((1060495600273047773658490769376 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (6, 1)],
  term ((-1060495600273047773658490769376 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (14, 2)],
  term ((-1060495600273047773658490769376 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 5. -/
theorem ep_Q2_002_partial_05_0320_valid :
    mulPoly ep_Q2_002_coefficient_05_0320
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0321 : Poly :=
[
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1)]
]

/-- Partial product 321 for generator 5. -/
def ep_Q2_002_partial_05_0321 : Poly :=
[
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (6, 1), (12, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (6, 1), (12, 1)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1), (14, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 5. -/
theorem ep_Q2_002_partial_05_0321_valid :
    mulPoly ep_Q2_002_coefficient_05_0321
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0322 : Poly :=
[
  term ((-4128594793993218388928306040 : Rat) / 867114016566501829700459753) [(1, 2), (8, 1)]
]

/-- Partial product 322 for generator 5. -/
def ep_Q2_002_partial_05_0322 : Poly :=
[
  term ((-4128594793993218388928306040 : Rat) / 867114016566501829700459753) [(1, 2), (2, 2), (8, 1)],
  term ((-4128594793993218388928306040 : Rat) / 867114016566501829700459753) [(1, 2), (3, 2), (8, 1)],
  term ((4128594793993218388928306040 : Rat) / 867114016566501829700459753) [(1, 2), (8, 1), (14, 2)],
  term ((4128594793993218388928306040 : Rat) / 867114016566501829700459753) [(1, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 5. -/
theorem ep_Q2_002_partial_05_0322_valid :
    mulPoly ep_Q2_002_coefficient_05_0322
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0323 : Poly :=
[
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1)]
]

/-- Partial product 323 for generator 5. -/
def ep_Q2_002_partial_05_0323 : Poly :=
[
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (8, 1), (12, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (8, 1), (12, 1)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1), (14, 2)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 5. -/
theorem ep_Q2_002_partial_05_0323_valid :
    mulPoly ep_Q2_002_coefficient_05_0323
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0324 : Poly :=
[
  term ((3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 1)]
]

/-- Partial product 324 for generator 5. -/
def ep_Q2_002_partial_05_0324 : Poly :=
[
  term ((3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (8, 1), (14, 1)],
  term ((3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (8, 1), (14, 1)],
  term ((-3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 1), (15, 2)],
  term ((-3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 5. -/
theorem ep_Q2_002_partial_05_0324_valid :
    mulPoly ep_Q2_002_coefficient_05_0324
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0325 : Poly :=
[
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1)]
]

/-- Partial product 325 for generator 5. -/
def ep_Q2_002_partial_05_0325 : Poly :=
[
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 2), (9, 1), (13, 1)],
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 2), (9, 1), (13, 1)],
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 5. -/
theorem ep_Q2_002_partial_05_0325_valid :
    mulPoly ep_Q2_002_coefficient_05_0325
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0326 : Poly :=
[
  term ((8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (15, 1)]
]

/-- Partial product 326 for generator 5. -/
def ep_Q2_002_partial_05_0326 : Poly :=
[
  term ((8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (9, 1), (15, 1)],
  term ((8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (9, 1), (15, 1)],
  term ((-8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((-8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 5. -/
theorem ep_Q2_002_partial_05_0326_valid :
    mulPoly ep_Q2_002_coefficient_05_0326
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0327 : Poly :=
[
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2)]
]

/-- Partial product 327 for generator 5. -/
def ep_Q2_002_partial_05_0327 : Poly :=
[
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (9, 2)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (9, 2)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (14, 2)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 5. -/
theorem ep_Q2_002_partial_05_0327_valid :
    mulPoly ep_Q2_002_coefficient_05_0327
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0328 : Poly :=
[
  term ((320344863560614972197858325584 : Rat) / 115799135485108289802725034287) [(1, 2), (12, 1)]
]

/-- Partial product 328 for generator 5. -/
def ep_Q2_002_partial_05_0328 : Poly :=
[
  term ((320344863560614972197858325584 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 2), (12, 1)],
  term ((320344863560614972197858325584 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 2), (12, 1)],
  term ((-320344863560614972197858325584 : Rat) / 115799135485108289802725034287) [(1, 2), (12, 1), (14, 2)],
  term ((-320344863560614972197858325584 : Rat) / 115799135485108289802725034287) [(1, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 5. -/
theorem ep_Q2_002_partial_05_0328_valid :
    mulPoly ep_Q2_002_coefficient_05_0328
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0329 : Poly :=
[
  term ((-1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 1)]
]

/-- Partial product 329 for generator 5. -/
def ep_Q2_002_partial_05_0329 : Poly :=
[
  term ((-1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (12, 1), (14, 1)],
  term ((-1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (12, 1), (14, 1)],
  term ((1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 5. -/
theorem ep_Q2_002_partial_05_0329_valid :
    mulPoly ep_Q2_002_coefficient_05_0329
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0330 : Poly :=
[
  term ((4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2)]
]

/-- Partial product 330 for generator 5. -/
def ep_Q2_002_partial_05_0330 : Poly :=
[
  term ((4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (12, 2)],
  term ((4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (12, 2)],
  term ((-4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2), (14, 2)],
  term ((-4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 5. -/
theorem ep_Q2_002_partial_05_0330_valid :
    mulPoly ep_Q2_002_coefficient_05_0330
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0331 : Poly :=
[
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (15, 1)]
]

/-- Partial product 331 for generator 5. -/
def ep_Q2_002_partial_05_0331 : Poly :=
[
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (13, 1), (15, 1)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (13, 1), (15, 1)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 5. -/
theorem ep_Q2_002_partial_05_0331_valid :
    mulPoly ep_Q2_002_coefficient_05_0331
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0332 : Poly :=
[
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2)]
]

/-- Partial product 332 for generator 5. -/
def ep_Q2_002_partial_05_0332 : Poly :=
[
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (13, 2)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (13, 2)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2), (14, 2)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 5. -/
theorem ep_Q2_002_partial_05_0332_valid :
    mulPoly ep_Q2_002_coefficient_05_0332
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0333 : Poly :=
[
  term ((-195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1)]
]

/-- Partial product 333 for generator 5. -/
def ep_Q2_002_partial_05_0333 : Poly :=
[
  term ((-195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (14, 1)],
  term ((-195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (14, 1)],
  term ((195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1), (15, 2)],
  term ((195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 5. -/
theorem ep_Q2_002_partial_05_0333_valid :
    mulPoly ep_Q2_002_coefficient_05_0333
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0334 : Poly :=
[
  term ((63945655983629659286815367324214 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 334 for generator 5. -/
def ep_Q2_002_partial_05_0334 : Poly :=
[
  term ((63945655983629659286815367324214 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((-63945655983629659286815367324214 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((-63945655983629659286815367324214 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((63945655983629659286815367324214 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 5. -/
theorem ep_Q2_002_partial_05_0334_valid :
    mulPoly ep_Q2_002_coefficient_05_0334
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0335 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1)]
]

/-- Partial product 335 for generator 5. -/
def ep_Q2_002_partial_05_0335 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 2)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 5. -/
theorem ep_Q2_002_partial_05_0335_valid :
    mulPoly ep_Q2_002_coefficient_05_0335
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0336 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 336 for generator 5. -/
def ep_Q2_002_partial_05_0336 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 5. -/
theorem ep_Q2_002_partial_05_0336_valid :
    mulPoly ep_Q2_002_coefficient_05_0336
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0337 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 337 for generator 5. -/
def ep_Q2_002_partial_05_0337 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 3)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 5. -/
theorem ep_Q2_002_partial_05_0337_valid :
    mulPoly ep_Q2_002_coefficient_05_0337
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0338 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 5. -/
def ep_Q2_002_partial_05_0338 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(2, 2), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 3), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 5. -/
theorem ep_Q2_002_partial_05_0338_valid :
    mulPoly ep_Q2_002_coefficient_05_0338
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0339 : Poly :=
[
  term ((-120421645435372327705536241289688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 339 for generator 5. -/
def ep_Q2_002_partial_05_0339 : Poly :=
[
  term ((-120421645435372327705536241289688 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (13, 1)],
  term ((120421645435372327705536241289688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((120421645435372327705536241289688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-120421645435372327705536241289688 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 5. -/
theorem ep_Q2_002_partial_05_0339_valid :
    mulPoly ep_Q2_002_coefficient_05_0339
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0340 : Poly :=
[
  term ((-830328021925683426222201599199224816094723 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 340 for generator 5. -/
def ep_Q2_002_partial_05_0340 : Poly :=
[
  term ((-830328021925683426222201599199224816094723 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((830328021925683426222201599199224816094723 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((830328021925683426222201599199224816094723 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 3)],
  term ((-830328021925683426222201599199224816094723 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 5. -/
theorem ep_Q2_002_partial_05_0340_valid :
    mulPoly ep_Q2_002_coefficient_05_0340
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0341 : Poly :=
[
  term ((-763782557303 : Rat) / 88815806940) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 5. -/
def ep_Q2_002_partial_05_0341 : Poly :=
[
  term ((-763782557303 : Rat) / 88815806940) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((763782557303 : Rat) / 88815806940) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((763782557303 : Rat) / 88815806940) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-763782557303 : Rat) / 88815806940) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 5. -/
theorem ep_Q2_002_partial_05_0341_valid :
    mulPoly ep_Q2_002_coefficient_05_0341
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0342 : Poly :=
[
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1)]
]

/-- Partial product 342 for generator 5. -/
def ep_Q2_002_partial_05_0342 : Poly :=
[
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 2)],
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 5. -/
theorem ep_Q2_002_partial_05_0342_valid :
    mulPoly ep_Q2_002_coefficient_05_0342
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0343 : Poly :=
[
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 343 for generator 5. -/
def ep_Q2_002_partial_05_0343 : Poly :=
[
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 5. -/
theorem ep_Q2_002_partial_05_0343_valid :
    mulPoly ep_Q2_002_coefficient_05_0343
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0344 : Poly :=
[
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 344 for generator 5. -/
def ep_Q2_002_partial_05_0344 : Poly :=
[
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 3), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 5. -/
theorem ep_Q2_002_partial_05_0344_valid :
    mulPoly ep_Q2_002_coefficient_05_0344
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0345 : Poly :=
[
  term ((190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 5. -/
def ep_Q2_002_partial_05_0345 : Poly :=
[
  term ((190895317587 : Rat) / 14802634490) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((190895317587 : Rat) / 14802634490) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 5. -/
theorem ep_Q2_002_partial_05_0345_valid :
    mulPoly ep_Q2_002_coefficient_05_0345
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0346 : Poly :=
[
  term ((-7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 346 for generator 5. -/
def ep_Q2_002_partial_05_0346 : Poly :=
[
  term ((-7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((-7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 5. -/
theorem ep_Q2_002_partial_05_0346_valid :
    mulPoly ep_Q2_002_coefficient_05_0346
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0347 : Poly :=
[
  term ((13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 347 for generator 5. -/
def ep_Q2_002_partial_05_0347 : Poly :=
[
  term ((13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 5. -/
theorem ep_Q2_002_partial_05_0347_valid :
    mulPoly ep_Q2_002_coefficient_05_0347
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0348 : Poly :=
[
  term ((-8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 348 for generator 5. -/
def ep_Q2_002_partial_05_0348 : Poly :=
[
  term ((-8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (15, 4)],
  term ((-8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 3), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 5. -/
theorem ep_Q2_002_partial_05_0348_valid :
    mulPoly ep_Q2_002_coefficient_05_0348
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0349 : Poly :=
[
  term ((44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 349 for generator 5. -/
def ep_Q2_002_partial_05_0349 : Poly :=
[
  term ((44451007625 : Rat) / 8881580694) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((-44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((44451007625 : Rat) / 8881580694) [(3, 3), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 5. -/
theorem ep_Q2_002_partial_05_0349_valid :
    mulPoly ep_Q2_002_coefficient_05_0349
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0350 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 350 for generator 5. -/
def ep_Q2_002_partial_05_0350 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 3), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 5. -/
theorem ep_Q2_002_partial_05_0350_valid :
    mulPoly ep_Q2_002_coefficient_05_0350
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0351 : Poly :=
[
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1)]
]

/-- Partial product 351 for generator 5. -/
def ep_Q2_002_partial_05_0351 : Poly :=
[
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 3), (6, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 5. -/
theorem ep_Q2_002_partial_05_0351_valid :
    mulPoly ep_Q2_002_coefficient_05_0351
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0352 : Poly :=
[
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 352 for generator 5. -/
def ep_Q2_002_partial_05_0352 : Poly :=
[
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 2)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 3), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 5. -/
theorem ep_Q2_002_partial_05_0352_valid :
    mulPoly ep_Q2_002_coefficient_05_0352
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0353 : Poly :=
[
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 353 for generator 5. -/
def ep_Q2_002_partial_05_0353 : Poly :=
[
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 5. -/
theorem ep_Q2_002_partial_05_0353_valid :
    mulPoly ep_Q2_002_coefficient_05_0353
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0354 : Poly :=
[
  term ((-10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 354 for generator 5. -/
def ep_Q2_002_partial_05_0354 : Poly :=
[
  term ((-10542029528 : Rat) / 7401317245) [(2, 2), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 3), (6, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 5. -/
theorem ep_Q2_002_partial_05_0354_valid :
    mulPoly ep_Q2_002_coefficient_05_0354
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0355 : Poly :=
[
  term ((31016982424271492251215029006604 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 355 for generator 5. -/
def ep_Q2_002_partial_05_0355 : Poly :=
[
  term ((31016982424271492251215029006604 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((-31016982424271492251215029006604 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-31016982424271492251215029006604 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((31016982424271492251215029006604 : Rat) / 1273790490336191187829975377157) [(3, 3), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 5. -/
theorem ep_Q2_002_partial_05_0355_valid :
    mulPoly ep_Q2_002_coefficient_05_0355
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0356 : Poly :=
[
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 356 for generator 5. -/
def ep_Q2_002_partial_05_0356 : Poly :=
[
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 2)],
  term ((3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 3), (6, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 5. -/
theorem ep_Q2_002_partial_05_0356_valid :
    mulPoly ep_Q2_002_coefficient_05_0356
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0357 : Poly :=
[
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 357 for generator 5. -/
def ep_Q2_002_partial_05_0357 : Poly :=
[
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 3), (6, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 5. -/
theorem ep_Q2_002_partial_05_0357_valid :
    mulPoly ep_Q2_002_coefficient_05_0357
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0358 : Poly :=
[
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 358 for generator 5. -/
def ep_Q2_002_partial_05_0358 : Poly :=
[
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 5. -/
theorem ep_Q2_002_partial_05_0358_valid :
    mulPoly ep_Q2_002_coefficient_05_0358
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0359 : Poly :=
[
  term ((37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 5. -/
def ep_Q2_002_partial_05_0359 : Poly :=
[
  term ((37861474304 : Rat) / 7401317245) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 3), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 5. -/
theorem ep_Q2_002_partial_05_0359_valid :
    mulPoly ep_Q2_002_coefficient_05_0359
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0360 : Poly :=
[
  term ((-58410786511080617211344768939568 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 360 for generator 5. -/
def ep_Q2_002_partial_05_0360 : Poly :=
[
  term ((-58410786511080617211344768939568 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((58410786511080617211344768939568 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((58410786511080617211344768939568 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-58410786511080617211344768939568 : Rat) / 1273790490336191187829975377157) [(3, 3), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 5. -/
theorem ep_Q2_002_partial_05_0360_valid :
    mulPoly ep_Q2_002_coefficient_05_0360
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0361 : Poly :=
[
  term ((848491136015874845316691070859713630033422 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 361 for generator 5. -/
def ep_Q2_002_partial_05_0361 : Poly :=
[
  term ((848491136015874845316691070859713630033422 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((-848491136015874845316691070859713630033422 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-848491136015874845316691070859713630033422 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)],
  term ((848491136015874845316691070859713630033422 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 5. -/
theorem ep_Q2_002_partial_05_0361_valid :
    mulPoly ep_Q2_002_coefficient_05_0361
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0362 : Poly :=
[
  term ((29651713151 : Rat) / 44407903470) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 5. -/
def ep_Q2_002_partial_05_0362 : Poly :=
[
  term ((29651713151 : Rat) / 44407903470) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-29651713151 : Rat) / 44407903470) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-29651713151 : Rat) / 44407903470) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((29651713151 : Rat) / 44407903470) [(3, 3), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 5. -/
theorem ep_Q2_002_partial_05_0362_valid :
    mulPoly ep_Q2_002_coefficient_05_0362
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0363 : Poly :=
[
  term ((267472841346343480680 : Rat) / 253528477699481291099) [(3, 1), (7, 1)]
]

/-- Partial product 363 for generator 5. -/
def ep_Q2_002_partial_05_0363 : Poly :=
[
  term ((267472841346343480680 : Rat) / 253528477699481291099) [(2, 2), (3, 1), (7, 1)],
  term ((-267472841346343480680 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 2)],
  term ((-267472841346343480680 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (15, 2)],
  term ((267472841346343480680 : Rat) / 253528477699481291099) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 5. -/
theorem ep_Q2_002_partial_05_0363_valid :
    mulPoly ep_Q2_002_coefficient_05_0363
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0364 : Poly :=
[
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 364 for generator 5. -/
def ep_Q2_002_partial_05_0364 : Poly :=
[
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 5. -/
theorem ep_Q2_002_partial_05_0364_valid :
    mulPoly ep_Q2_002_coefficient_05_0364
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0365 : Poly :=
[
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 365 for generator 5. -/
def ep_Q2_002_partial_05_0365 : Poly :=
[
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 5. -/
theorem ep_Q2_002_partial_05_0365_valid :
    mulPoly ep_Q2_002_coefficient_05_0365
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0366 : Poly :=
[
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 366 for generator 5. -/
def ep_Q2_002_partial_05_0366 : Poly :=
[
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 5. -/
theorem ep_Q2_002_partial_05_0366_valid :
    mulPoly ep_Q2_002_coefficient_05_0366
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0367 : Poly :=
[
  term ((48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 5. -/
def ep_Q2_002_partial_05_0367 : Poly :=
[
  term ((48757036284 : Rat) / 7401317245) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((48757036284 : Rat) / 7401317245) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 5. -/
theorem ep_Q2_002_partial_05_0367_valid :
    mulPoly ep_Q2_002_coefficient_05_0367
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0368 : Poly :=
[
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 368 for generator 5. -/
def ep_Q2_002_partial_05_0368 : Poly :=
[
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (15, 3)],
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 5. -/
theorem ep_Q2_002_partial_05_0368_valid :
    mulPoly ep_Q2_002_coefficient_05_0368
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0369 : Poly :=
[
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 369 for generator 5. -/
def ep_Q2_002_partial_05_0369 : Poly :=
[
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 5. -/
theorem ep_Q2_002_partial_05_0369_valid :
    mulPoly ep_Q2_002_coefficient_05_0369
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0370 : Poly :=
[
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 370 for generator 5. -/
def ep_Q2_002_partial_05_0370 : Poly :=
[
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((-178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 3)],
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(3, 3), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 5. -/
theorem ep_Q2_002_partial_05_0370_valid :
    mulPoly ep_Q2_002_coefficient_05_0370
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0371 : Poly :=
[
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 371 for generator 5. -/
def ep_Q2_002_partial_05_0371 : Poly :=
[
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 1), (15, 2)],
  term ((-266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((-266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (15, 4)],
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 5. -/
theorem ep_Q2_002_partial_05_0371_valid :
    mulPoly ep_Q2_002_coefficient_05_0371
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0372 : Poly :=
[
  term ((-88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 372 for generator 5. -/
def ep_Q2_002_partial_05_0372 : Poly :=
[
  term ((-88171245013 : Rat) / 44407903470) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((-88171245013 : Rat) / 44407903470) [(3, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 5. -/
theorem ep_Q2_002_partial_05_0372_valid :
    mulPoly ep_Q2_002_coefficient_05_0372
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0373 : Poly :=
[
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1)]
]

/-- Partial product 373 for generator 5. -/
def ep_Q2_002_partial_05_0373 : Poly :=
[
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 2), (11, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (14, 2)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (15, 2)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 5. -/
theorem ep_Q2_002_partial_05_0373_valid :
    mulPoly ep_Q2_002_coefficient_05_0373
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0374 : Poly :=
[
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1)]
]

/-- Partial product 374 for generator 5. -/
def ep_Q2_002_partial_05_0374 : Poly :=
[
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 2), (13, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (14, 2)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 5. -/
theorem ep_Q2_002_partial_05_0374_valid :
    mulPoly ep_Q2_002_coefficient_05_0374
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0375 : Poly :=
[
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (15, 1)]
]

/-- Partial product 375 for generator 5. -/
def ep_Q2_002_partial_05_0375 : Poly :=
[
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 2), (15, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (14, 2), (15, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (15, 3)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 5. -/
theorem ep_Q2_002_partial_05_0375_valid :
    mulPoly ep_Q2_002_coefficient_05_0375
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0376 : Poly :=
[
  term ((88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 5. -/
def ep_Q2_002_partial_05_0376 : Poly :=
[
  term ((88171245013 : Rat) / 14802634490) [(2, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((88171245013 : Rat) / 14802634490) [(3, 3), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 5. -/
theorem ep_Q2_002_partial_05_0376_valid :
    mulPoly ep_Q2_002_coefficient_05_0376
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0377 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 377 for generator 5. -/
def ep_Q2_002_partial_05_0377 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (11, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 2)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 5. -/
theorem ep_Q2_002_partial_05_0377_valid :
    mulPoly ep_Q2_002_coefficient_05_0377
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0378 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 378 for generator 5. -/
def ep_Q2_002_partial_05_0378 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 3)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 5. -/
theorem ep_Q2_002_partial_05_0378_valid :
    mulPoly ep_Q2_002_coefficient_05_0378
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0379 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 379 for generator 5. -/
def ep_Q2_002_partial_05_0379 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (13, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 2)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 5. -/
theorem ep_Q2_002_partial_05_0379_valid :
    mulPoly ep_Q2_002_coefficient_05_0379
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0380 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 380 for generator 5. -/
def ep_Q2_002_partial_05_0380 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 3)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 5. -/
theorem ep_Q2_002_partial_05_0380_valid :
    mulPoly ep_Q2_002_coefficient_05_0380
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0381 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 381 for generator 5. -/
def ep_Q2_002_partial_05_0381 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 3), (15, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 5. -/
theorem ep_Q2_002_partial_05_0381_valid :
    mulPoly ep_Q2_002_coefficient_05_0381
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0382 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 382 for generator 5. -/
def ep_Q2_002_partial_05_0382 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 3), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 5. -/
theorem ep_Q2_002_partial_05_0382_valid :
    mulPoly ep_Q2_002_coefficient_05_0382
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0383 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 383 for generator 5. -/
def ep_Q2_002_partial_05_0383 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 3)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 5. -/
theorem ep_Q2_002_partial_05_0383_valid :
    mulPoly ep_Q2_002_coefficient_05_0383
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0384 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 384 for generator 5. -/
def ep_Q2_002_partial_05_0384 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 5. -/
theorem ep_Q2_002_partial_05_0384_valid :
    mulPoly ep_Q2_002_coefficient_05_0384
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0385 : Poly :=
[
  term ((157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 385 for generator 5. -/
def ep_Q2_002_partial_05_0385 : Poly :=
[
  term ((157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 3), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 5. -/
theorem ep_Q2_002_partial_05_0385_valid :
    mulPoly ep_Q2_002_coefficient_05_0385
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0386 : Poly :=
[
  term ((-297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 386 for generator 5. -/
def ep_Q2_002_partial_05_0386 : Poly :=
[
  term ((-297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 5. -/
theorem ep_Q2_002_partial_05_0386_valid :
    mulPoly ep_Q2_002_coefficient_05_0386
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0387 : Poly :=
[
  term ((-1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 387 for generator 5. -/
def ep_Q2_002_partial_05_0387 : Poly :=
[
  term ((-1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (15, 4)],
  term ((-1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 5. -/
theorem ep_Q2_002_partial_05_0387_valid :
    mulPoly ep_Q2_002_coefficient_05_0387
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0388 : Poly :=
[
  term ((-131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 388 for generator 5. -/
def ep_Q2_002_partial_05_0388 : Poly :=
[
  term ((-131972534012 : Rat) / 7401317245) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((-131972534012 : Rat) / 7401317245) [(3, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 5. -/
theorem ep_Q2_002_partial_05_0388_valid :
    mulPoly ep_Q2_002_coefficient_05_0388
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0389 : Poly :=
[
  term ((-44816746130795412663894105498054 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1)]
]

/-- Partial product 389 for generator 5. -/
def ep_Q2_002_partial_05_0389 : Poly :=
[
  term ((-44816746130795412663894105498054 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1)],
  term ((44816746130795412663894105498054 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2)],
  term ((44816746130795412663894105498054 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 2)],
  term ((-44816746130795412663894105498054 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 5. -/
theorem ep_Q2_002_partial_05_0389_valid :
    mulPoly ep_Q2_002_coefficient_05_0389
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0390 : Poly :=
[
  term ((7296645136956510519131032405656 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 390 for generator 5. -/
def ep_Q2_002_partial_05_0390 : Poly :=
[
  term ((7296645136956510519131032405656 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-7296645136956510519131032405656 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-7296645136956510519131032405656 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((7296645136956510519131032405656 : Rat) / 97983883872014706756151952089) [(3, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 5. -/
theorem ep_Q2_002_partial_05_0390_valid :
    mulPoly ep_Q2_002_coefficient_05_0390
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0391 : Poly :=
[
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 391 for generator 5. -/
def ep_Q2_002_partial_05_0391 : Poly :=
[
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 3)],
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 3), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 5. -/
theorem ep_Q2_002_partial_05_0391_valid :
    mulPoly ep_Q2_002_coefficient_05_0391
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0392 : Poly :=
[
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 392 for generator 5. -/
def ep_Q2_002_partial_05_0392 : Poly :=
[
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 5. -/
theorem ep_Q2_002_partial_05_0392_valid :
    mulPoly ep_Q2_002_coefficient_05_0392
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0393 : Poly :=
[
  term ((-17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 393 for generator 5. -/
def ep_Q2_002_partial_05_0393 : Poly :=
[
  term ((-17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 3)],
  term ((-17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 5. -/
theorem ep_Q2_002_partial_05_0393_valid :
    mulPoly ep_Q2_002_coefficient_05_0393
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0394 : Poly :=
[
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 394 for generator 5. -/
def ep_Q2_002_partial_05_0394 : Poly :=
[
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1), (15, 2)],
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 4)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 5. -/
theorem ep_Q2_002_partial_05_0394_valid :
    mulPoly ep_Q2_002_coefficient_05_0394
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0395 : Poly :=
[
  term ((-13740949248769215673016641568352 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 395 for generator 5. -/
def ep_Q2_002_partial_05_0395 : Poly :=
[
  term ((-13740949248769215673016641568352 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((13740949248769215673016641568352 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((13740949248769215673016641568352 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13740949248769215673016641568352 : Rat) / 97983883872014706756151952089) [(3, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 5. -/
theorem ep_Q2_002_partial_05_0395_valid :
    mulPoly ep_Q2_002_coefficient_05_0395
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0396 : Poly :=
[
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 396 for generator 5. -/
def ep_Q2_002_partial_05_0396 : Poly :=
[
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 3)],
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 3), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 5. -/
theorem ep_Q2_002_partial_05_0396_valid :
    mulPoly ep_Q2_002_coefficient_05_0396
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0397 : Poly :=
[
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 397 for generator 5. -/
def ep_Q2_002_partial_05_0397 : Poly :=
[
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 3), (15, 1)],
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 5. -/
theorem ep_Q2_002_partial_05_0397_valid :
    mulPoly ep_Q2_002_coefficient_05_0397
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0398 : Poly :=
[
  term ((-18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 5. -/
def ep_Q2_002_partial_05_0398 : Poly :=
[
  term ((-18930737152 : Rat) / 7401317245) [(2, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-18930737152 : Rat) / 7401317245) [(3, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 5. -/
theorem ep_Q2_002_partial_05_0398_valid :
    mulPoly ep_Q2_002_coefficient_05_0398
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0399 : Poly :=
[
  term ((109596737890487345658696872821649423072772 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 399 for generator 5. -/
def ep_Q2_002_partial_05_0399 : Poly :=
[
  term ((109596737890487345658696872821649423072772 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-109596737890487345658696872821649423072772 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-109596737890487345658696872821649423072772 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 3)],
  term ((109596737890487345658696872821649423072772 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 5. -/
theorem ep_Q2_002_partial_05_0399_valid :
    mulPoly ep_Q2_002_coefficient_05_0399
        ep_Q2_002_generator_05_0300_0399 =
      ep_Q2_002_partial_05_0399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_05_0300_0399 : List Poly :=
[
  ep_Q2_002_partial_05_0300,
  ep_Q2_002_partial_05_0301,
  ep_Q2_002_partial_05_0302,
  ep_Q2_002_partial_05_0303,
  ep_Q2_002_partial_05_0304,
  ep_Q2_002_partial_05_0305,
  ep_Q2_002_partial_05_0306,
  ep_Q2_002_partial_05_0307,
  ep_Q2_002_partial_05_0308,
  ep_Q2_002_partial_05_0309,
  ep_Q2_002_partial_05_0310,
  ep_Q2_002_partial_05_0311,
  ep_Q2_002_partial_05_0312,
  ep_Q2_002_partial_05_0313,
  ep_Q2_002_partial_05_0314,
  ep_Q2_002_partial_05_0315,
  ep_Q2_002_partial_05_0316,
  ep_Q2_002_partial_05_0317,
  ep_Q2_002_partial_05_0318,
  ep_Q2_002_partial_05_0319,
  ep_Q2_002_partial_05_0320,
  ep_Q2_002_partial_05_0321,
  ep_Q2_002_partial_05_0322,
  ep_Q2_002_partial_05_0323,
  ep_Q2_002_partial_05_0324,
  ep_Q2_002_partial_05_0325,
  ep_Q2_002_partial_05_0326,
  ep_Q2_002_partial_05_0327,
  ep_Q2_002_partial_05_0328,
  ep_Q2_002_partial_05_0329,
  ep_Q2_002_partial_05_0330,
  ep_Q2_002_partial_05_0331,
  ep_Q2_002_partial_05_0332,
  ep_Q2_002_partial_05_0333,
  ep_Q2_002_partial_05_0334,
  ep_Q2_002_partial_05_0335,
  ep_Q2_002_partial_05_0336,
  ep_Q2_002_partial_05_0337,
  ep_Q2_002_partial_05_0338,
  ep_Q2_002_partial_05_0339,
  ep_Q2_002_partial_05_0340,
  ep_Q2_002_partial_05_0341,
  ep_Q2_002_partial_05_0342,
  ep_Q2_002_partial_05_0343,
  ep_Q2_002_partial_05_0344,
  ep_Q2_002_partial_05_0345,
  ep_Q2_002_partial_05_0346,
  ep_Q2_002_partial_05_0347,
  ep_Q2_002_partial_05_0348,
  ep_Q2_002_partial_05_0349,
  ep_Q2_002_partial_05_0350,
  ep_Q2_002_partial_05_0351,
  ep_Q2_002_partial_05_0352,
  ep_Q2_002_partial_05_0353,
  ep_Q2_002_partial_05_0354,
  ep_Q2_002_partial_05_0355,
  ep_Q2_002_partial_05_0356,
  ep_Q2_002_partial_05_0357,
  ep_Q2_002_partial_05_0358,
  ep_Q2_002_partial_05_0359,
  ep_Q2_002_partial_05_0360,
  ep_Q2_002_partial_05_0361,
  ep_Q2_002_partial_05_0362,
  ep_Q2_002_partial_05_0363,
  ep_Q2_002_partial_05_0364,
  ep_Q2_002_partial_05_0365,
  ep_Q2_002_partial_05_0366,
  ep_Q2_002_partial_05_0367,
  ep_Q2_002_partial_05_0368,
  ep_Q2_002_partial_05_0369,
  ep_Q2_002_partial_05_0370,
  ep_Q2_002_partial_05_0371,
  ep_Q2_002_partial_05_0372,
  ep_Q2_002_partial_05_0373,
  ep_Q2_002_partial_05_0374,
  ep_Q2_002_partial_05_0375,
  ep_Q2_002_partial_05_0376,
  ep_Q2_002_partial_05_0377,
  ep_Q2_002_partial_05_0378,
  ep_Q2_002_partial_05_0379,
  ep_Q2_002_partial_05_0380,
  ep_Q2_002_partial_05_0381,
  ep_Q2_002_partial_05_0382,
  ep_Q2_002_partial_05_0383,
  ep_Q2_002_partial_05_0384,
  ep_Q2_002_partial_05_0385,
  ep_Q2_002_partial_05_0386,
  ep_Q2_002_partial_05_0387,
  ep_Q2_002_partial_05_0388,
  ep_Q2_002_partial_05_0389,
  ep_Q2_002_partial_05_0390,
  ep_Q2_002_partial_05_0391,
  ep_Q2_002_partial_05_0392,
  ep_Q2_002_partial_05_0393,
  ep_Q2_002_partial_05_0394,
  ep_Q2_002_partial_05_0395,
  ep_Q2_002_partial_05_0396,
  ep_Q2_002_partial_05_0397,
  ep_Q2_002_partial_05_0398,
  ep_Q2_002_partial_05_0399
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_05_0300_0399 : Poly :=
[
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (2, 2), (13, 1), (15, 2), (16, 1)],
  term ((-120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 2), (13, 2), (15, 1)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (2, 2), (13, 2), (15, 1), (16, 1)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (13, 3)],
  term ((-100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (2, 2), (14, 1), (15, 1)],
  term ((-5881401385 : Rat) / 2960526898) [(1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((1026091316886027179583078042880377711434159 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 1)],
  term ((-57787613977 : Rat) / 29605268980) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((-120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 2), (13, 2), (15, 1)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (13, 3)],
  term ((-100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-5881401385 : Rat) / 2960526898) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((1026091316886027179583078042880377711434159 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (15, 1)],
  term ((-57787613977 : Rat) / 29605268980) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1420364357134502249943571117790138865478632 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (13, 1), (15, 4)],
  term ((10904829414 : Rat) / 7401317245) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (14, 2), (15, 1)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((120892891915001709065289637182742555728264 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (13, 2), (15, 3)],
  term ((-10904829414 : Rat) / 7401317245) [(1, 1), (13, 2), (15, 3), (16, 1)],
  term ((-137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3), (14, 2)],
  term ((-137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 3), (15, 2)],
  term ((100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 1), (15, 3)],
  term ((5881401385 : Rat) / 2960526898) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1026091316886027179583078042880377711434159 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (14, 2), (15, 1)],
  term ((57787613977 : Rat) / 29605268980) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((100581346290142236004765994274477286946506 : Rat) / 269363643504064505317229453910785233499) [(1, 1), (14, 3), (15, 1)],
  term ((5881401385 : Rat) / 2960526898) [(1, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1026091316886027179583078042880377711434159 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)],
  term ((57787613977 : Rat) / 29605268980) [(1, 1), (15, 3), (16, 1)],
  term ((-4495258574255534628732723792624 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2)],
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (3, 1), (7, 1)],
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (3, 1), (15, 1)],
  term ((1109977711005891002085429067968 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 2), (4, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1), (6, 1)],
  term ((-3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1), (12, 1)],
  term ((-541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1), (14, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (7, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (9, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (13, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (5, 1), (15, 1)],
  term ((1060495600273047773658490769376 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (6, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (6, 1), (12, 1)],
  term ((-4128594793993218388928306040 : Rat) / 867114016566501829700459753) [(1, 2), (2, 2), (8, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (8, 1), (12, 1)],
  term ((3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (8, 1), (14, 1)],
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 2), (9, 1), (13, 1)],
  term ((8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (9, 1), (15, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (9, 2)],
  term ((320344863560614972197858325584 : Rat) / 115799135485108289802725034287) [(1, 2), (2, 2), (12, 1)],
  term ((-1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (12, 1), (14, 1)],
  term ((4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (12, 2)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (13, 1), (15, 1)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (13, 2)],
  term ((-195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (14, 1)],
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (14, 2)],
  term ((3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((-1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (15, 3)],
  term ((-4495258574255534628732723792624 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2)],
  term ((1109977711005891002085429067968 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 2), (4, 1)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1), (6, 1)],
  term ((-3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1), (12, 1)],
  term ((-541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1), (14, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (7, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (9, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (13, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (15, 1)],
  term ((1060495600273047773658490769376 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (6, 1)],
  term ((-2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (6, 1), (12, 1)],
  term ((-4128594793993218388928306040 : Rat) / 867114016566501829700459753) [(1, 2), (3, 2), (8, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (8, 1), (12, 1)],
  term ((3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (8, 1), (14, 1)],
  term ((-894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 2), (9, 1), (13, 1)],
  term ((8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (9, 1), (15, 1)],
  term ((1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (9, 2)],
  term ((320344863560614972197858325584 : Rat) / 115799135485108289802725034287) [(1, 2), (3, 2), (12, 1)],
  term ((-1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (12, 1), (14, 1)],
  term ((4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (12, 2)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (13, 1), (15, 1)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (13, 2)],
  term ((-195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (14, 1)],
  term ((-3449480000415474860488298926848 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 3), (7, 1)],
  term ((1149826666805158286829432975616 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 3), (15, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (14, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (6, 1), (15, 2)],
  term ((3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1), (14, 2)],
  term ((3212545670806846696497704624640 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (12, 1), (15, 2)],
  term ((541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 1), (15, 2)],
  term ((-1109977711005891002085429067968 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1), (14, 2)],
  term ((541988872697937812825337610432 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1), (14, 3)],
  term ((-1109977711005891002085429067968 : Rat) / 115799135485108289802725034287) [(1, 2), (4, 1), (15, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (14, 2)],
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (7, 1), (15, 2)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1), (14, 2)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (9, 1), (15, 2)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1), (14, 2)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (14, 2), (15, 1)],
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (15, 3)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1), (14, 2)],
  term ((2329274535292929713893119729792 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((-1060495600273047773658490769376 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (14, 2)],
  term ((-1060495600273047773658490769376 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (15, 2)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1), (14, 2)],
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (12, 1), (15, 2)],
  term ((-3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 1), (15, 2)],
  term ((4128594793993218388928306040 : Rat) / 867114016566501829700459753) [(1, 2), (8, 1), (14, 2)],
  term ((-3375676293686756161120359955344 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (14, 3)],
  term ((4128594793993218388928306040 : Rat) / 867114016566501829700459753) [(1, 2), (8, 1), (15, 2)],
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((894307417736433359406516471552 : Rat) / 115799135485108289802725034287) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((-8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((-8736019116107410831467570368064 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (15, 3)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (14, 2)],
  term ((-1101362478993356122004110819008 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 2), (15, 2)],
  term ((1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-320344863560614972197858325584 : Rat) / 115799135485108289802725034287) [(1, 2), (12, 1), (14, 2)],
  term ((1294708131128726881421360431872 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (14, 3)],
  term ((-320344863560614972197858325584 : Rat) / 115799135485108289802725034287) [(1, 2), (12, 1), (15, 2)],
  term ((-4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2), (14, 2)],
  term ((-4541478691107050186997783568032 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 2), (15, 2)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 1), (15, 3)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2), (14, 2)],
  term ((-5178035599552539612580698544128 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2), (15, 2)],
  term ((195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 1), (15, 2)],
  term ((4495258574255534628732723792624 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 2)],
  term ((195738239736971419849208500768 : Rat) / 1273790490336191187829975377157) [(1, 2), (14, 3)],
  term ((4495258574255534628732723792624 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)],
  term ((63945655983629659286815367324214 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(2, 2), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-120421645435372327705536241289688 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (13, 1)],
  term ((-830328021925683426222201599199224816094723 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-763782557303 : Rat) / 88815806940) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((190895317587 : Rat) / 14802634490) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((44451007625 : Rat) / 8881580694) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(2, 2), (3, 1), (6, 1), (7, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (6, 1), (8, 1), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(2, 2), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((31016982424271492251215029006604 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (6, 1), (11, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((37861474304 : Rat) / 7401317245) [(2, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-58410786511080617211344768939568 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (6, 1), (13, 1)],
  term ((848491136015874845316691070859713630033422 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (6, 1), (15, 1)],
  term ((29651713151 : Rat) / 44407903470) [(2, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((267472841346343480680 : Rat) / 253528477699481291099) [(2, 2), (3, 1), (7, 1)],
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((48757036284 : Rat) / 7401317245) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(2, 2), (3, 1), (7, 1), (14, 1)],
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 1), (15, 2)],
  term ((-88171245013 : Rat) / 44407903470) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 2), (11, 1)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 2), (13, 1)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 2), (15, 1)],
  term ((88171245013 : Rat) / 14802634490) [(2, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (11, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (11, 1), (14, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (13, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (13, 1), (14, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(2, 2), (3, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-131972534012 : Rat) / 7401317245) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-44816746130795412663894105498054 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1)],
  term ((7296645136956510519131032405656 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1), (14, 1)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1), (15, 2)],
  term ((-13740949248769215673016641568352 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-18930737152 : Rat) / 7401317245) [(2, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((109596737890487345658696872821649423072772 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 2)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((-63945655983629659286815367324214 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 2)],
  term ((-63945655983629659286815367324214 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 3)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((120421645435372327705536241289688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (14, 2)],
  term ((120421645435372327705536241289688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((830328021925683426222201599199224816094723 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (14, 2), (15, 1)],
  term ((763782557303 : Rat) / 88815806940) [(3, 1), (4, 1), (14, 2), (15, 1), (16, 1)],
  term ((830328021925683426222201599199224816094723 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 3)],
  term ((763782557303 : Rat) / 88815806940) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (14, 2)],
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (14, 2)],
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1)],
  term ((-190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((-190895317587 : Rat) / 14802634490) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((-13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((-13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((-44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (14, 2), (15, 2), (16, 1)],
  term ((8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (5, 1), (15, 4)],
  term ((-44451007625 : Rat) / 8881580694) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (14, 2)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 2)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((10542029528 : Rat) / 7401317245) [(3, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 2)],
  term ((3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-31016982424271492251215029006604 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-31016982424271492251215029006604 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((-5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((-5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-37861474304 : Rat) / 7401317245) [(3, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((58410786511080617211344768939568 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((58410786511080617211344768939568 : Rat) / 1273790490336191187829975377157) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-848491136015874845316691070859713630033422 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-29651713151 : Rat) / 44407903470) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-848491136015874845316691070859713630033422 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (6, 1), (15, 3)],
  term ((-29651713151 : Rat) / 44407903470) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((-48757036284 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1)],
  term ((-33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (15, 3)],
  term ((63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-267472841346343480680 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 2)],
  term ((-266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-178315227564228987120 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (14, 3)],
  term ((-267472841346343480680 : Rat) / 253528477699481291099) [(3, 1), (7, 1), (15, 2)],
  term ((-266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (15, 4)],
  term ((88171245013 : Rat) / 44407903470) [(3, 1), (7, 1), (15, 4), (16, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (14, 2)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1), (15, 2)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (14, 2)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (14, 2), (15, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (15, 3)],
  term ((-88171245013 : Rat) / 14802634490) [(3, 1), (7, 2), (15, 3), (16, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 2)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (14, 3)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 2)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (14, 3)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 1), (15, 3)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 2), (15, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (14, 3), (15, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (14, 3), (15, 1), (16, 1)],
  term ((-80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 3)],
  term ((-5271014764 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((-157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (15, 3)],
  term ((297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (15, 4)],
  term ((131972534012 : Rat) / 7401317245) [(3, 1), (9, 1), (15, 4), (16, 1)],
  term ((-1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-7296645136956510519131032405656 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (14, 3)],
  term ((-7296645136956510519131032405656 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((44816746130795412663894105498054 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2)],
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 3)],
  term ((44816746130795412663894105498054 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 2)],
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 4)],
  term ((2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((13740949248769215673016641568352 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (14, 3)],
  term ((13740949248769215673016641568352 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-109596737890487345658696872821649423072772 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (14, 3), (15, 1)],
  term ((18930737152 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-109596737890487345658696872821649423072772 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 3)],
  term ((63945655983629659286815367324214 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (11, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (11, 1), (12, 1)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (12, 1), (13, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (4, 1), (12, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(3, 3), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-120421645435372327705536241289688 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (13, 1)],
  term ((-830328021925683426222201599199224816094723 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (4, 1), (15, 1)],
  term ((-763782557303 : Rat) / 88815806940) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (7, 1), (11, 1)],
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (7, 1), (13, 1)],
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(3, 3), (5, 1), (7, 1), (15, 1)],
  term ((190895317587 : Rat) / 14802634490) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7019516817645246303062557296420 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (11, 1), (15, 1)],
  term ((13219064725186485786810505130640 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (13, 1), (15, 1)],
  term ((-8371690909232972417029948945071511200474 : Rat) / 24487603954914955028839041264616839409) [(3, 3), (5, 1), (15, 2)],
  term ((44451007625 : Rat) / 8881580694) [(3, 3), (5, 1), (15, 2), (16, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 3), (6, 1), (7, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 3), (6, 1), (8, 1), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 3), (6, 1), (8, 1), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (6, 1), (8, 1), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(3, 3), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((31016982424271492251215029006604 : Rat) / 1273790490336191187829975377157) [(3, 3), (6, 1), (11, 1)],
  term ((-3121175487650735015089870133664 : Rat) / 97983883872014706756151952089) [(3, 3), (6, 1), (11, 1), (12, 1)],
  term ((5877757951402876115717381609088 : Rat) / 97983883872014706756151952089) [(3, 3), (6, 1), (12, 1), (13, 1)],
  term ((429879066168656099755073305563284783212128 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (6, 1), (12, 1), (15, 1)],
  term ((37861474304 : Rat) / 7401317245) [(3, 3), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-58410786511080617211344768939568 : Rat) / 1273790490336191187829975377157) [(3, 3), (6, 1), (13, 1)],
  term ((848491136015874845316691070859713630033422 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (6, 1), (15, 1)],
  term ((29651713151 : Rat) / 44407903470) [(3, 3), (6, 1), (15, 1), (16, 1)],
  term ((267472841346343480680 : Rat) / 253528477699481291099) [(3, 3), (7, 1)],
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (9, 1), (11, 1)],
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (9, 1), (13, 1)],
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 1), (9, 1), (15, 1)],
  term ((48757036284 : Rat) / 7401317245) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((33951459784103376685629775907724 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (11, 1), (15, 1)],
  term ((-63936956924505854076507492802608 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (13, 1), (15, 1)],
  term ((178315227564228987120 : Rat) / 253528477699481291099) [(3, 3), (7, 1), (14, 1)],
  term ((266294751073693059594728015242996918718214 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 1), (15, 2)],
  term ((-88171245013 : Rat) / 44407903470) [(3, 3), (7, 1), (15, 2), (16, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 2), (11, 1)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 2), (13, 1)],
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 2), (15, 1)],
  term ((88171245013 : Rat) / 14802634490) [(3, 3), (7, 2), (15, 1), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (11, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (11, 1), (14, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (13, 1)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (13, 1), (14, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (8, 1), (14, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 3), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (8, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((157961442892735225093066578051120 : Rat) / 1273790490336191187829975377157) [(3, 3), (9, 1), (11, 1), (15, 1)],
  term ((-297470978691007200059749139663040 : Rat) / 1273790490336191187829975377157) [(3, 3), (9, 1), (13, 1), (15, 1)],
  term ((-1173007272529310736612699267313867716596544 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (9, 1), (15, 2)],
  term ((-131972534012 : Rat) / 7401317245) [(3, 3), (9, 1), (15, 2), (16, 1)],
  term ((-44816746130795412663894105498054 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1)],
  term ((7296645136956510519131032405656 : Rat) / 97983883872014706756151952089) [(3, 3), (11, 1), (12, 1)],
  term ((1560587743825367507544935066832 : Rat) / 97983883872014706756151952089) [(3, 3), (11, 1), (12, 1), (14, 1)],
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1), (13, 1), (15, 1)],
  term ((-17676193410307871887626550730106 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1), (14, 1)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1), (15, 2)],
  term ((-13740949248769215673016641568352 : Rat) / 97983883872014706756151952089) [(3, 3), (12, 1), (13, 1)],
  term ((-2938878975701438057858690804544 : Rat) / 97983883872014706756151952089) [(3, 3), (12, 1), (13, 1), (14, 1)],
  term ((-214939533084328049877536652781642391606064 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (12, 1), (14, 1), (15, 1)],
  term ((-18930737152 : Rat) / 7401317245) [(3, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((109596737890487345658696872821649423072772 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 300 through 399. -/
theorem ep_Q2_002_block_05_0300_0399_valid :
    checkProductSumEq ep_Q2_002_partials_05_0300_0399
      ep_Q2_002_block_05_0300_0399 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
