/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 4:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_04_0200_0299 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0200 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 200 for generator 4. -/
def ep_Q2_002_partial_04_0200 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 4. -/
theorem ep_Q2_002_partial_04_0200_valid :
    mulPoly ep_Q2_002_coefficient_04_0200
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0201 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 4. -/
def ep_Q2_002_partial_04_0201 : Poly :=
[
  term ((-75025117954 : Rat) / 7401317245) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((75025117954 : Rat) / 7401317245) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((75025117954 : Rat) / 7401317245) [(4, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 4. -/
theorem ep_Q2_002_partial_04_0201_valid :
    mulPoly ep_Q2_002_coefficient_04_0201
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0202 : Poly :=
[
  term ((307690003520847412603311954648672 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 202 for generator 4. -/
def ep_Q2_002_partial_04_0202 : Poly :=
[
  term ((307690003520847412603311954648672 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((307690003520847412603311954648672 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((-307690003520847412603311954648672 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 2), (11, 1), (13, 1)],
  term ((-307690003520847412603311954648672 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 4. -/
theorem ep_Q2_002_partial_04_0202_valid :
    mulPoly ep_Q2_002_coefficient_04_0202
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0203 : Poly :=
[
  term ((1113021419800617712979619347562101593791318 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 203 for generator 4. -/
def ep_Q2_002_partial_04_0203 : Poly :=
[
  term ((1113021419800617712979619347562101593791318 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((1113021419800617712979619347562101593791318 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-1113021419800617712979619347562101593791318 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1113021419800617712979619347562101593791318 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 4. -/
theorem ep_Q2_002_partial_04_0203_valid :
    mulPoly ep_Q2_002_coefficient_04_0203
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0204 : Poly :=
[
  term ((407143449239 : Rat) / 44407903470) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 4. -/
def ep_Q2_002_partial_04_0204 : Poly :=
[
  term ((407143449239 : Rat) / 44407903470) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((407143449239 : Rat) / 44407903470) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-407143449239 : Rat) / 44407903470) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-407143449239 : Rat) / 44407903470) [(4, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 4. -/
theorem ep_Q2_002_partial_04_0204_valid :
    mulPoly ep_Q2_002_coefficient_04_0204
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0205 : Poly :=
[
  term ((-58399056300306832721176881510972 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2)]
]

/-- Partial product 205 for generator 4. -/
def ep_Q2_002_partial_04_0205 : Poly :=
[
  term ((-58399056300306832721176881510972 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 2)],
  term ((-58399056300306832721176881510972 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 2)],
  term ((58399056300306832721176881510972 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 2), (11, 2)],
  term ((58399056300306832721176881510972 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 4. -/
theorem ep_Q2_002_partial_04_0205_valid :
    mulPoly ep_Q2_002_coefficient_04_0205
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0206 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 1)]
]

/-- Partial product 206 for generator 4. -/
def ep_Q2_002_partial_04_0206 : Poly :=
[
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 2), (12, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 2), (12, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 2), (11, 2), (12, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 4. -/
theorem ep_Q2_002_partial_04_0206_valid :
    mulPoly ep_Q2_002_coefficient_04_0206
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0207 : Poly :=
[
  term ((41009766427517769629857156697661061518048 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 207 for generator 4. -/
def ep_Q2_002_partial_04_0207 : Poly :=
[
  term ((41009766427517769629857156697661061518048 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((41009766427517769629857156697661061518048 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-41009766427517769629857156697661061518048 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (10, 2), (13, 1), (15, 1)],
  term ((-41009766427517769629857156697661061518048 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 4. -/
theorem ep_Q2_002_partial_04_0207_valid :
    mulPoly ep_Q2_002_coefficient_04_0207
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0208 : Poly :=
[
  term ((-112045214908 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 4. -/
def ep_Q2_002_partial_04_0208 : Poly :=
[
  term ((-112045214908 : Rat) / 7401317245) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-112045214908 : Rat) / 7401317245) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((112045214908 : Rat) / 7401317245) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((112045214908 : Rat) / 7401317245) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 4. -/
theorem ep_Q2_002_partial_04_0208_valid :
    mulPoly ep_Q2_002_coefficient_04_0208
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0209 : Poly :=
[
  term ((-372331817862806487571753209402816 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 209 for generator 4. -/
def ep_Q2_002_partial_04_0209 : Poly :=
[
  term ((-372331817862806487571753209402816 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (13, 2)],
  term ((-372331817862806487571753209402816 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (13, 2)],
  term ((372331817862806487571753209402816 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 2), (13, 2)],
  term ((372331817862806487571753209402816 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 4. -/
theorem ep_Q2_002_partial_04_0209_valid :
    mulPoly ep_Q2_002_coefficient_04_0209
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0210 : Poly :=
[
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 2)]
]

/-- Partial product 210 for generator 4. -/
def ep_Q2_002_partial_04_0210 : Poly :=
[
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (15, 2)],
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (15, 2)],
  term ((312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 2), (15, 2)],
  term ((312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 4. -/
theorem ep_Q2_002_partial_04_0210_valid :
    mulPoly ep_Q2_002_coefficient_04_0210
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0211 : Poly :=
[
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 211 for generator 4. -/
def ep_Q2_002_partial_04_0211 : Poly :=
[
  term ((5130926716 : Rat) / 7401317245) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((5130926716 : Rat) / 7401317245) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-5130926716 : Rat) / 7401317245) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-5130926716 : Rat) / 7401317245) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 4. -/
theorem ep_Q2_002_partial_04_0211_valid :
    mulPoly ep_Q2_002_coefficient_04_0211
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0212 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 212 for generator 4. -/
def ep_Q2_002_partial_04_0212 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 4. -/
theorem ep_Q2_002_partial_04_0212_valid :
    mulPoly ep_Q2_002_coefficient_04_0212
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0213 : Poly :=
[
  term ((-5009012637442093734102507186526125905265204 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 213 for generator 4. -/
def ep_Q2_002_partial_04_0213 : Poly :=
[
  term ((-5009012637442093734102507186526125905265204 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-5009012637442093734102507186526125905265204 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((5009012637442093734102507186526125905265204 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((5009012637442093734102507186526125905265204 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 4. -/
theorem ep_Q2_002_partial_04_0213_valid :
    mulPoly ep_Q2_002_coefficient_04_0213
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0214 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 4. -/
def ep_Q2_002_partial_04_0214 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 4. -/
theorem ep_Q2_002_partial_04_0214_valid :
    mulPoly ep_Q2_002_coefficient_04_0214
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0215 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (11, 2)]
]

/-- Partial product 215 for generator 4. -/
def ep_Q2_002_partial_04_0215 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 1), (11, 2)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (11, 2)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (10, 2), (11, 2)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 4. -/
theorem ep_Q2_002_partial_04_0215_valid :
    mulPoly ep_Q2_002_coefficient_04_0215
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0216 : Poly :=
[
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 216 for generator 4. -/
def ep_Q2_002_partial_04_0216 : Poly :=
[
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 4. -/
theorem ep_Q2_002_partial_04_0216_valid :
    mulPoly ep_Q2_002_coefficient_04_0216
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0217 : Poly :=
[
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 217 for generator 4. -/
def ep_Q2_002_partial_04_0217 : Poly :=
[
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (10, 2), (15, 2)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 4. -/
theorem ep_Q2_002_partial_04_0217_valid :
    mulPoly ep_Q2_002_coefficient_04_0217
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0218 : Poly :=
[
  term ((-15565557134 : Rat) / 4440790347) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 218 for generator 4. -/
def ep_Q2_002_partial_04_0218 : Poly :=
[
  term ((-15565557134 : Rat) / 4440790347) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-15565557134 : Rat) / 4440790347) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((15565557134 : Rat) / 4440790347) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((15565557134 : Rat) / 4440790347) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 4. -/
theorem ep_Q2_002_partial_04_0218_valid :
    mulPoly ep_Q2_002_coefficient_04_0218
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0219 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (11, 1)]
]

/-- Partial product 219 for generator 4. -/
def ep_Q2_002_partial_04_0219 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 2), (11, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 2), (11, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 2), (11, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 4. -/
theorem ep_Q2_002_partial_04_0219_valid :
    mulPoly ep_Q2_002_coefficient_04_0219
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0220 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (13, 1)]
]

/-- Partial product 220 for generator 4. -/
def ep_Q2_002_partial_04_0220 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 2), (13, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 2), (13, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 2), (13, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 4. -/
theorem ep_Q2_002_partial_04_0220_valid :
    mulPoly ep_Q2_002_coefficient_04_0220
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0221 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (15, 1)]
]

/-- Partial product 221 for generator 4. -/
def ep_Q2_002_partial_04_0221 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (5, 1), (7, 2), (15, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 1), (7, 2), (15, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (10, 2), (15, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 4. -/
theorem ep_Q2_002_partial_04_0221_valid :
    mulPoly ep_Q2_002_coefficient_04_0221
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0222 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 4. -/
def ep_Q2_002_partial_04_0222 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((381790635174 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(5, 1), (7, 2), (10, 2), (15, 1), (16, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(5, 1), (7, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 4. -/
theorem ep_Q2_002_partial_04_0222_valid :
    mulPoly ep_Q2_002_coefficient_04_0222
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0223 : Poly :=
[
  term ((30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 223 for generator 4. -/
def ep_Q2_002_partial_04_0223 : Poly :=
[
  term ((30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (11, 1)],
  term ((30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (11, 1)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 2), (11, 1)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 4. -/
theorem ep_Q2_002_partial_04_0223_valid :
    mulPoly ep_Q2_002_coefficient_04_0223
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0224 : Poly :=
[
  term ((-57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 224 for generator 4. -/
def ep_Q2_002_partial_04_0224 : Poly :=
[
  term ((-57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((-57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 2), (13, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 4. -/
theorem ep_Q2_002_partial_04_0224_valid :
    mulPoly ep_Q2_002_coefficient_04_0224
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0225 : Poly :=
[
  term ((65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 225 for generator 4. -/
def ep_Q2_002_partial_04_0225 : Poly :=
[
  term ((65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 4. -/
theorem ep_Q2_002_partial_04_0225_valid :
    mulPoly ep_Q2_002_coefficient_04_0225
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0226 : Poly :=
[
  term ((-18196285962 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 4. -/
def ep_Q2_002_partial_04_0226 : Poly :=
[
  term ((-18196285962 : Rat) / 7401317245) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-18196285962 : Rat) / 7401317245) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((18196285962 : Rat) / 7401317245) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((18196285962 : Rat) / 7401317245) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 4. -/
theorem ep_Q2_002_partial_04_0226_valid :
    mulPoly ep_Q2_002_coefficient_04_0226
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0227 : Poly :=
[
  term ((322253653885087385142809867376 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1)]
]

/-- Partial product 227 for generator 4. -/
def ep_Q2_002_partial_04_0227 : Poly :=
[
  term ((322253653885087385142809867376 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (11, 1)],
  term ((322253653885087385142809867376 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (11, 1)],
  term ((-322253653885087385142809867376 : Rat) / 97983883872014706756151952089) [(5, 1), (10, 2), (11, 1)],
  term ((-322253653885087385142809867376 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 4. -/
theorem ep_Q2_002_partial_04_0227_valid :
    mulPoly ep_Q2_002_coefficient_04_0227
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0228 : Poly :=
[
  term ((-1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 228 for generator 4. -/
def ep_Q2_002_partial_04_0228 : Poly :=
[
  term ((-1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((-1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (10, 2), (11, 1), (12, 1)],
  term ((1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 4. -/
theorem ep_Q2_002_partial_04_0228_valid :
    mulPoly ep_Q2_002_coefficient_04_0228
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0229 : Poly :=
[
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 229 for generator 4. -/
def ep_Q2_002_partial_04_0229 : Poly :=
[
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 4. -/
theorem ep_Q2_002_partial_04_0229_valid :
    mulPoly ep_Q2_002_coefficient_04_0229
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0230 : Poly :=
[
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 230 for generator 4. -/
def ep_Q2_002_partial_04_0230 : Poly :=
[
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 4. -/
theorem ep_Q2_002_partial_04_0230_valid :
    mulPoly ep_Q2_002_coefficient_04_0230
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0231 : Poly :=
[
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 231 for generator 4. -/
def ep_Q2_002_partial_04_0231 : Poly :=
[
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (11, 1), (15, 2)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 4. -/
theorem ep_Q2_002_partial_04_0231_valid :
    mulPoly ep_Q2_002_coefficient_04_0231
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0232 : Poly :=
[
  term ((7782778567 : Rat) / 4440790347) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 232 for generator 4. -/
def ep_Q2_002_partial_04_0232 : Poly :=
[
  term ((7782778567 : Rat) / 4440790347) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((7782778567 : Rat) / 4440790347) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-7782778567 : Rat) / 4440790347) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-7782778567 : Rat) / 4440790347) [(5, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 4. -/
theorem ep_Q2_002_partial_04_0232_valid :
    mulPoly ep_Q2_002_coefficient_04_0232
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0233 : Poly :=
[
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 233 for generator 4. -/
def ep_Q2_002_partial_04_0233 : Poly :=
[
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 4. -/
theorem ep_Q2_002_partial_04_0233_valid :
    mulPoly ep_Q2_002_coefficient_04_0233
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0234 : Poly :=
[
  term ((2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 234 for generator 4. -/
def ep_Q2_002_partial_04_0234 : Poly :=
[
  term ((2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((-2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 4. -/
theorem ep_Q2_002_partial_04_0234_valid :
    mulPoly ep_Q2_002_coefficient_04_0234
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0235 : Poly :=
[
  term ((101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 235 for generator 4. -/
def ep_Q2_002_partial_04_0235 : Poly :=
[
  term ((101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 4. -/
theorem ep_Q2_002_partial_04_0235_valid :
    mulPoly ep_Q2_002_coefficient_04_0235
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0236 : Poly :=
[
  term ((40423427124 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 4. -/
def ep_Q2_002_partial_04_0236 : Poly :=
[
  term ((40423427124 : Rat) / 7401317245) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((40423427124 : Rat) / 7401317245) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-40423427124 : Rat) / 7401317245) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-40423427124 : Rat) / 7401317245) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 4. -/
theorem ep_Q2_002_partial_04_0236_valid :
    mulPoly ep_Q2_002_coefficient_04_0236
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0237 : Poly :=
[
  term ((-606863979287940331689036806592 : Rat) / 97983883872014706756151952089) [(5, 1), (13, 1)]
]

/-- Partial product 237 for generator 4. -/
def ep_Q2_002_partial_04_0237 : Poly :=
[
  term ((-606863979287940331689036806592 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (13, 1)],
  term ((-606863979287940331689036806592 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (13, 1)],
  term ((606863979287940331689036806592 : Rat) / 97983883872014706756151952089) [(5, 1), (10, 2), (13, 1)],
  term ((606863979287940331689036806592 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 4. -/
theorem ep_Q2_002_partial_04_0237_valid :
    mulPoly ep_Q2_002_coefficient_04_0237
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0238 : Poly :=
[
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 238 for generator 4. -/
def ep_Q2_002_partial_04_0238 : Poly :=
[
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 4. -/
theorem ep_Q2_002_partial_04_0238_valid :
    mulPoly ep_Q2_002_coefficient_04_0238
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0239 : Poly :=
[
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 239 for generator 4. -/
def ep_Q2_002_partial_04_0239 : Poly :=
[
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 4. -/
theorem ep_Q2_002_partial_04_0239_valid :
    mulPoly ep_Q2_002_coefficient_04_0239
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0240 : Poly :=
[
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 4. -/
def ep_Q2_002_partial_04_0240 : Poly :=
[
  term ((-1243661576 : Rat) / 211466207) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1243661576 : Rat) / 211466207) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 4. -/
theorem ep_Q2_002_partial_04_0240_valid :
    mulPoly ep_Q2_002_coefficient_04_0240
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0241 : Poly :=
[
  term ((755812250780036920023480462312809619136788 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 1)]
]

/-- Partial product 241 for generator 4. -/
def ep_Q2_002_partial_04_0241 : Poly :=
[
  term ((755812250780036920023480462312809619136788 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (15, 1)],
  term ((755812250780036920023480462312809619136788 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 1)],
  term ((-755812250780036920023480462312809619136788 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (10, 2), (15, 1)],
  term ((-755812250780036920023480462312809619136788 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 4. -/
theorem ep_Q2_002_partial_04_0241_valid :
    mulPoly ep_Q2_002_coefficient_04_0241
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0242 : Poly :=
[
  term ((17699677089 : Rat) / 7401317245) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 4. -/
def ep_Q2_002_partial_04_0242 : Poly :=
[
  term ((17699677089 : Rat) / 7401317245) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((17699677089 : Rat) / 7401317245) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-17699677089 : Rat) / 7401317245) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-17699677089 : Rat) / 7401317245) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 4. -/
theorem ep_Q2_002_partial_04_0242_valid :
    mulPoly ep_Q2_002_coefficient_04_0242
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0243 : Poly :=
[
  term ((-17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 243 for generator 4. -/
def ep_Q2_002_partial_04_0243 : Poly :=
[
  term ((-17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((-17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 4. -/
theorem ep_Q2_002_partial_04_0243_valid :
    mulPoly ep_Q2_002_coefficient_04_0243
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0244 : Poly :=
[
  term ((32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 244 for generator 4. -/
def ep_Q2_002_partial_04_0244 : Poly :=
[
  term ((32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((-32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((-32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 4. -/
theorem ep_Q2_002_partial_04_0244_valid :
    mulPoly ep_Q2_002_coefficient_04_0244
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0245 : Poly :=
[
  term ((-726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 245 for generator 4. -/
def ep_Q2_002_partial_04_0245 : Poly :=
[
  term ((-726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 4. -/
theorem ep_Q2_002_partial_04_0245_valid :
    mulPoly ep_Q2_002_coefficient_04_0245
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0246 : Poly :=
[
  term ((154602244 : Rat) / 125446055) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 246 for generator 4. -/
def ep_Q2_002_partial_04_0246 : Poly :=
[
  term ((154602244 : Rat) / 125446055) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((154602244 : Rat) / 125446055) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-154602244 : Rat) / 125446055) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-154602244 : Rat) / 125446055) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 4. -/
theorem ep_Q2_002_partial_04_0246_valid :
    mulPoly ep_Q2_002_coefficient_04_0246
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0247 : Poly :=
[
  term ((307679144877473547241871287377408 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 247 for generator 4. -/
def ep_Q2_002_partial_04_0247 : Poly :=
[
  term ((307679144877473547241871287377408 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((307679144877473547241871287377408 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 1), (13, 1)],
  term ((-307679144877473547241871287377408 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 2), (11, 1), (13, 1)],
  term ((-307679144877473547241871287377408 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 4. -/
theorem ep_Q2_002_partial_04_0247_valid :
    mulPoly ep_Q2_002_coefficient_04_0247
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0248 : Poly :=
[
  term ((75313568130176267949405270755641080270096 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 248 for generator 4. -/
def ep_Q2_002_partial_04_0248 : Poly :=
[
  term ((75313568130176267949405270755641080270096 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((75313568130176267949405270755641080270096 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((-75313568130176267949405270755641080270096 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-75313568130176267949405270755641080270096 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 4. -/
theorem ep_Q2_002_partial_04_0248_valid :
    mulPoly ep_Q2_002_coefficient_04_0248
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0249 : Poly :=
[
  term ((92332945364 : Rat) / 7401317245) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 4. -/
def ep_Q2_002_partial_04_0249 : Poly :=
[
  term ((92332945364 : Rat) / 7401317245) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((92332945364 : Rat) / 7401317245) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92332945364 : Rat) / 7401317245) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-92332945364 : Rat) / 7401317245) [(6, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 4. -/
theorem ep_Q2_002_partial_04_0249_valid :
    mulPoly ep_Q2_002_coefficient_04_0249
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0250 : Poly :=
[
  term ((-101111712214249666654806983725152 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)]
]

/-- Partial product 250 for generator 4. -/
def ep_Q2_002_partial_04_0250 : Poly :=
[
  term ((-101111712214249666654806983725152 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 2)],
  term ((-101111712214249666654806983725152 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 2)],
  term ((101111712214249666654806983725152 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 2), (11, 2)],
  term ((101111712214249666654806983725152 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 4. -/
theorem ep_Q2_002_partial_04_0250_valid :
    mulPoly ep_Q2_002_coefficient_04_0250
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0251 : Poly :=
[
  term ((-1658176588570694137309903267731439783350144 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 251 for generator 4. -/
def ep_Q2_002_partial_04_0251 : Poly :=
[
  term ((-1658176588570694137309903267731439783350144 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1658176588570694137309903267731439783350144 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((1658176588570694137309903267731439783350144 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((1658176588570694137309903267731439783350144 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 4. -/
theorem ep_Q2_002_partial_04_0251_valid :
    mulPoly ep_Q2_002_coefficient_04_0251
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0252 : Poly :=
[
  term ((-121662923232 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 4. -/
def ep_Q2_002_partial_04_0252 : Poly :=
[
  term ((-121662923232 : Rat) / 7401317245) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-121662923232 : Rat) / 7401317245) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((121662923232 : Rat) / 7401317245) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((121662923232 : Rat) / 7401317245) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 4. -/
theorem ep_Q2_002_partial_04_0252_valid :
    mulPoly ep_Q2_002_coefficient_04_0252
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0253 : Poly :=
[
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (13, 2)]
]

/-- Partial product 253 for generator 4. -/
def ep_Q2_002_partial_04_0253 : Poly :=
[
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(2, 2), (6, 1), (13, 2)],
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(3, 2), (6, 1), (13, 2)],
  term ((16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 2), (13, 2)],
  term ((16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 4. -/
theorem ep_Q2_002_partial_04_0253_valid :
    mulPoly ep_Q2_002_coefficient_04_0253
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0254 : Poly :=
[
  term ((436066212744285907884204574125308610420624 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (15, 2)]
]

/-- Partial product 254 for generator 4. -/
def ep_Q2_002_partial_04_0254 : Poly :=
[
  term ((436066212744285907884204574125308610420624 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (15, 2)],
  term ((436066212744285907884204574125308610420624 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (15, 2)],
  term ((-436066212744285907884204574125308610420624 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 2), (15, 2)],
  term ((-436066212744285907884204574125308610420624 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 4. -/
theorem ep_Q2_002_partial_04_0254_valid :
    mulPoly ep_Q2_002_coefficient_04_0254
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0255 : Poly :=
[
  term ((28239112812 : Rat) / 7401317245) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 255 for generator 4. -/
def ep_Q2_002_partial_04_0255 : Poly :=
[
  term ((28239112812 : Rat) / 7401317245) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((28239112812 : Rat) / 7401317245) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-28239112812 : Rat) / 7401317245) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-28239112812 : Rat) / 7401317245) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 4. -/
theorem ep_Q2_002_partial_04_0255_valid :
    mulPoly ep_Q2_002_coefficient_04_0255
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0256 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 256 for generator 4. -/
def ep_Q2_002_partial_04_0256 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 4. -/
theorem ep_Q2_002_partial_04_0256_valid :
    mulPoly ep_Q2_002_coefficient_04_0256
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0257 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 257 for generator 4. -/
def ep_Q2_002_partial_04_0257 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 4. -/
theorem ep_Q2_002_partial_04_0257_valid :
    mulPoly ep_Q2_002_coefficient_04_0257
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0258 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 258 for generator 4. -/
def ep_Q2_002_partial_04_0258 : Poly :=
[
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 4. -/
theorem ep_Q2_002_partial_04_0258_valid :
    mulPoly ep_Q2_002_coefficient_04_0258
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0259 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 4. -/
def ep_Q2_002_partial_04_0259 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((10542029528 : Rat) / 7401317245) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 4. -/
theorem ep_Q2_002_partial_04_0259_valid :
    mulPoly ep_Q2_002_coefficient_04_0259
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0260 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 260 for generator 4. -/
def ep_Q2_002_partial_04_0260 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 4. -/
theorem ep_Q2_002_partial_04_0260_valid :
    mulPoly ep_Q2_002_coefficient_04_0260
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0261 : Poly :=
[
  term ((-836487117311006988106417069696468062279936 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 261 for generator 4. -/
def ep_Q2_002_partial_04_0261 : Poly :=
[
  term ((-836487117311006988106417069696468062279936 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-836487117311006988106417069696468062279936 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((836487117311006988106417069696468062279936 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((836487117311006988106417069696468062279936 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 4. -/
theorem ep_Q2_002_partial_04_0261_valid :
    mulPoly ep_Q2_002_coefficient_04_0261
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0262 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 4. -/
def ep_Q2_002_partial_04_0262 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((97514072568 : Rat) / 7401317245) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((97514072568 : Rat) / 7401317245) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 4. -/
theorem ep_Q2_002_partial_04_0262_valid :
    mulPoly ep_Q2_002_coefficient_04_0262
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0263 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 2)]
]

/-- Partial product 263 for generator 4. -/
def ep_Q2_002_partial_04_0263 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (11, 2)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (11, 2)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (11, 2)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 4. -/
theorem ep_Q2_002_partial_04_0263_valid :
    mulPoly ep_Q2_002_coefficient_04_0263
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0264 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 264 for generator 4. -/
def ep_Q2_002_partial_04_0264 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 4. -/
theorem ep_Q2_002_partial_04_0264_valid :
    mulPoly ep_Q2_002_coefficient_04_0264
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0265 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 265 for generator 4. -/
def ep_Q2_002_partial_04_0265 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 4. -/
theorem ep_Q2_002_partial_04_0265_valid :
    mulPoly ep_Q2_002_coefficient_04_0265
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0266 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 266 for generator 4. -/
def ep_Q2_002_partial_04_0266 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-65009381712 : Rat) / 7401317245) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((65009381712 : Rat) / 7401317245) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((65009381712 : Rat) / 7401317245) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 4. -/
theorem ep_Q2_002_partial_04_0266_valid :
    mulPoly ep_Q2_002_coefficient_04_0266
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0267 : Poly :=
[
  term ((-23675476781755697187964415367060 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 267 for generator 4. -/
def ep_Q2_002_partial_04_0267 : Poly :=
[
  term ((-23675476781755697187964415367060 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1)],
  term ((-23675476781755697187964415367060 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1)],
  term ((23675476781755697187964415367060 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1)],
  term ((23675476781755697187964415367060 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 4. -/
theorem ep_Q2_002_partial_04_0267_valid :
    mulPoly ep_Q2_002_coefficient_04_0267
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0268 : Poly :=
[
  term ((130362817080169096811597640651696 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 268 for generator 4. -/
def ep_Q2_002_partial_04_0268 : Poly :=
[
  term ((130362817080169096811597640651696 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((130362817080169096811597640651696 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((-130362817080169096811597640651696 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-130362817080169096811597640651696 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 4. -/
theorem ep_Q2_002_partial_04_0268_valid :
    mulPoly ep_Q2_002_coefficient_04_0268
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0269 : Poly :=
[
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 269 for generator 4. -/
def ep_Q2_002_partial_04_0269 : Poly :=
[
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 4. -/
theorem ep_Q2_002_partial_04_0269_valid :
    mulPoly ep_Q2_002_coefficient_04_0269
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0270 : Poly :=
[
  term ((-564483408805460109743086701089486216330028 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 270 for generator 4. -/
def ep_Q2_002_partial_04_0270 : Poly :=
[
  term ((-564483408805460109743086701089486216330028 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (11, 1), (15, 2)],
  term ((-564483408805460109743086701089486216330028 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((564483408805460109743086701089486216330028 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((564483408805460109743086701089486216330028 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 4. -/
theorem ep_Q2_002_partial_04_0270_valid :
    mulPoly ep_Q2_002_coefficient_04_0270
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0271 : Poly :=
[
  term ((88171245013 : Rat) / 22203951735) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 271 for generator 4. -/
def ep_Q2_002_partial_04_0271 : Poly :=
[
  term ((88171245013 : Rat) / 22203951735) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-88171245013 : Rat) / 22203951735) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-88171245013 : Rat) / 22203951735) [(7, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 4. -/
theorem ep_Q2_002_partial_04_0271_valid :
    mulPoly ep_Q2_002_coefficient_04_0271
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0272 : Poly :=
[
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 272 for generator 4. -/
def ep_Q2_002_partial_04_0272 : Poly :=
[
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 2), (15, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 4. -/
theorem ep_Q2_002_partial_04_0272_valid :
    mulPoly ep_Q2_002_coefficient_04_0272
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0273 : Poly :=
[
  term ((-245497597841568815176373543524032 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 273 for generator 4. -/
def ep_Q2_002_partial_04_0273 : Poly :=
[
  term ((-245497597841568815176373543524032 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-245497597841568815176373543524032 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((245497597841568815176373543524032 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((245497597841568815176373543524032 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 4. -/
theorem ep_Q2_002_partial_04_0273_valid :
    mulPoly ep_Q2_002_coefficient_04_0273
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0274 : Poly :=
[
  term ((607674543797071327851228218353518163385448 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 274 for generator 4. -/
def ep_Q2_002_partial_04_0274 : Poly :=
[
  term ((607674543797071327851228218353518163385448 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((607674543797071327851228218353518163385448 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-607674543797071327851228218353518163385448 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((-607674543797071327851228218353518163385448 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 4. -/
theorem ep_Q2_002_partial_04_0274_valid :
    mulPoly ep_Q2_002_coefficient_04_0274
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0275 : Poly :=
[
  term ((-67979945386 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 4. -/
def ep_Q2_002_partial_04_0275 : Poly :=
[
  term ((-67979945386 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-67979945386 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((67979945386 : Rat) / 7401317245) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((67979945386 : Rat) / 7401317245) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 4. -/
theorem ep_Q2_002_partial_04_0275_valid :
    mulPoly ep_Q2_002_coefficient_04_0275
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0276 : Poly :=
[
  term ((46272504585289627329890552580240 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 276 for generator 4. -/
def ep_Q2_002_partial_04_0276 : Poly :=
[
  term ((46272504585289627329890552580240 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1)],
  term ((46272504585289627329890552580240 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1)],
  term ((-46272504585289627329890552580240 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (13, 1)],
  term ((-46272504585289627329890552580240 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 4. -/
theorem ep_Q2_002_partial_04_0276_valid :
    mulPoly ep_Q2_002_coefficient_04_0276
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0277 : Poly :=
[
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 277 for generator 4. -/
def ep_Q2_002_partial_04_0277 : Poly :=
[
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 4. -/
theorem ep_Q2_002_partial_04_0277_valid :
    mulPoly ep_Q2_002_coefficient_04_0277
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0278 : Poly :=
[
  term ((-1513836041530084044270694491857579416446134 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 278 for generator 4. -/
def ep_Q2_002_partial_04_0278 : Poly :=
[
  term ((-1513836041530084044270694491857579416446134 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 1)],
  term ((-1513836041530084044270694491857579416446134 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 1)],
  term ((1513836041530084044270694491857579416446134 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (15, 1)],
  term ((1513836041530084044270694491857579416446134 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 4. -/
theorem ep_Q2_002_partial_04_0278_valid :
    mulPoly ep_Q2_002_coefficient_04_0278
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0279 : Poly :=
[
  term ((-172231024247 : Rat) / 44407903470) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 4. -/
def ep_Q2_002_partial_04_0279 : Poly :=
[
  term ((-172231024247 : Rat) / 44407903470) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-172231024247 : Rat) / 44407903470) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((172231024247 : Rat) / 44407903470) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((172231024247 : Rat) / 44407903470) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 4. -/
theorem ep_Q2_002_partial_04_0279_valid :
    mulPoly ep_Q2_002_coefficient_04_0279
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0280 : Poly :=
[
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)]
]

/-- Partial product 280 for generator 4. -/
def ep_Q2_002_partial_04_0280 : Poly :=
[
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 3)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 3)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (15, 3)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 4. -/
theorem ep_Q2_002_partial_04_0280_valid :
    mulPoly ep_Q2_002_coefficient_04_0280
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0281 : Poly :=
[
  term ((316951406728 : Rat) / 22203951735) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 281 for generator 4. -/
def ep_Q2_002_partial_04_0281 : Poly :=
[
  term ((316951406728 : Rat) / 22203951735) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((316951406728 : Rat) / 22203951735) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-316951406728 : Rat) / 22203951735) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-316951406728 : Rat) / 22203951735) [(7, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 4. -/
theorem ep_Q2_002_partial_04_0281_valid :
    mulPoly ep_Q2_002_coefficient_04_0281
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0282 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(7, 2)]
]

/-- Partial product 282 for generator 4. -/
def ep_Q2_002_partial_04_0282 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(2, 2), (7, 2)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 2), (7, 2)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(7, 2), (10, 2)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 4. -/
theorem ep_Q2_002_partial_04_0282_valid :
    mulPoly ep_Q2_002_coefficient_04_0282
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0283 : Poly :=
[
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 283 for generator 4. -/
def ep_Q2_002_partial_04_0283 : Poly :=
[
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (9, 1), (11, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (9, 1), (11, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 4. -/
theorem ep_Q2_002_partial_04_0283_valid :
    mulPoly ep_Q2_002_coefficient_04_0283
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0284 : Poly :=
[
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 284 for generator 4. -/
def ep_Q2_002_partial_04_0284 : Poly :=
[
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (9, 1), (13, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (9, 1), (13, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 2), (13, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 4. -/
theorem ep_Q2_002_partial_04_0284_valid :
    mulPoly ep_Q2_002_coefficient_04_0284
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0285 : Poly :=
[
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 285 for generator 4. -/
def ep_Q2_002_partial_04_0285 : Poly :=
[
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (9, 1), (15, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (9, 1), (15, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 4. -/
theorem ep_Q2_002_partial_04_0285_valid :
    mulPoly ep_Q2_002_coefficient_04_0285
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0286 : Poly :=
[
  term ((195028145136 : Rat) / 7401317245) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 4. -/
def ep_Q2_002_partial_04_0286 : Poly :=
[
  term ((195028145136 : Rat) / 7401317245) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((195028145136 : Rat) / 7401317245) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 4. -/
theorem ep_Q2_002_partial_04_0286_valid :
    mulPoly ep_Q2_002_coefficient_04_0286
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0287 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 287 for generator 4. -/
def ep_Q2_002_partial_04_0287 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (11, 1), (13, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (11, 1), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 4. -/
theorem ep_Q2_002_partial_04_0287_valid :
    mulPoly ep_Q2_002_coefficient_04_0287
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0288 : Poly :=
[
  term ((1741360234895305956840415293807309037966644 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 288 for generator 4. -/
def ep_Q2_002_partial_04_0288 : Poly :=
[
  term ((1741360234895305956840415293807309037966644 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (11, 1), (15, 1)],
  term ((1741360234895305956840415293807309037966644 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term ((-1741360234895305956840415293807309037966644 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((-1741360234895305956840415293807309037966644 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 4. -/
theorem ep_Q2_002_partial_04_0288_valid :
    mulPoly ep_Q2_002_coefficient_04_0288
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0289 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 4. -/
def ep_Q2_002_partial_04_0289 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(7, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(7, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 4. -/
theorem ep_Q2_002_partial_04_0289_valid :
    mulPoly ep_Q2_002_coefficient_04_0289
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0290 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 2)]
]

/-- Partial product 290 for generator 4. -/
def ep_Q2_002_partial_04_0290 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (11, 2)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (11, 2)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (11, 2)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 4. -/
theorem ep_Q2_002_partial_04_0290_valid :
    mulPoly ep_Q2_002_coefficient_04_0290
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0291 : Poly :=
[
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 291 for generator 4. -/
def ep_Q2_002_partial_04_0291 : Poly :=
[
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (13, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 4. -/
theorem ep_Q2_002_partial_04_0291_valid :
    mulPoly ep_Q2_002_coefficient_04_0291
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0292 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (15, 2)]
]

/-- Partial product 292 for generator 4. -/
def ep_Q2_002_partial_04_0292 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (15, 2)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (15, 2)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (10, 2), (15, 2)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 4. -/
theorem ep_Q2_002_partial_04_0292_valid :
    mulPoly ep_Q2_002_coefficient_04_0292
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0293 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 293 for generator 4. -/
def ep_Q2_002_partial_04_0293 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((-176342490026 : Rat) / 22203951735) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((176342490026 : Rat) / 22203951735) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((176342490026 : Rat) / 22203951735) [(7, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 4. -/
theorem ep_Q2_002_partial_04_0293_valid :
    mulPoly ep_Q2_002_coefficient_04_0293
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0294 : Poly :=
[
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 1)]
]

/-- Partial product 294 for generator 4. -/
def ep_Q2_002_partial_04_0294 : Poly :=
[
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 3), (11, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 3), (11, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 2), (11, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 4. -/
theorem ep_Q2_002_partial_04_0294_valid :
    mulPoly ep_Q2_002_coefficient_04_0294
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0295 : Poly :=
[
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(7, 3), (13, 1)]
]

/-- Partial product 295 for generator 4. -/
def ep_Q2_002_partial_04_0295 : Poly :=
[
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 3), (13, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 3), (13, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 2), (13, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 4. -/
theorem ep_Q2_002_partial_04_0295_valid :
    mulPoly ep_Q2_002_coefficient_04_0295
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0296 : Poly :=
[
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (15, 1)]
]

/-- Partial product 296 for generator 4. -/
def ep_Q2_002_partial_04_0296 : Poly :=
[
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 3), (15, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 3), (15, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (10, 2), (15, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 4. -/
theorem ep_Q2_002_partial_04_0296_valid :
    mulPoly ep_Q2_002_coefficient_04_0296
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0297 : Poly :=
[
  term ((176342490026 : Rat) / 7401317245) [(7, 3), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 4. -/
def ep_Q2_002_partial_04_0297 : Poly :=
[
  term ((176342490026 : Rat) / 7401317245) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((176342490026 : Rat) / 7401317245) [(3, 2), (7, 3), (15, 1), (16, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(7, 3), (10, 2), (15, 1), (16, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(7, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 4. -/
theorem ep_Q2_002_partial_04_0297_valid :
    mulPoly ep_Q2_002_coefficient_04_0297
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0298 : Poly :=
[
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 298 for generator 4. -/
def ep_Q2_002_partial_04_0298 : Poly :=
[
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((-43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 4. -/
theorem ep_Q2_002_partial_04_0298_valid :
    mulPoly ep_Q2_002_coefficient_04_0298
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0299 : Poly :=
[
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 299 for generator 4. -/
def ep_Q2_002_partial_04_0299 : Poly :=
[
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 4. -/
theorem ep_Q2_002_partial_04_0299_valid :
    mulPoly ep_Q2_002_coefficient_04_0299
        ep_Q2_002_generator_04_0200_0299 =
      ep_Q2_002_partial_04_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_04_0200_0299 : List Poly :=
[
  ep_Q2_002_partial_04_0200,
  ep_Q2_002_partial_04_0201,
  ep_Q2_002_partial_04_0202,
  ep_Q2_002_partial_04_0203,
  ep_Q2_002_partial_04_0204,
  ep_Q2_002_partial_04_0205,
  ep_Q2_002_partial_04_0206,
  ep_Q2_002_partial_04_0207,
  ep_Q2_002_partial_04_0208,
  ep_Q2_002_partial_04_0209,
  ep_Q2_002_partial_04_0210,
  ep_Q2_002_partial_04_0211,
  ep_Q2_002_partial_04_0212,
  ep_Q2_002_partial_04_0213,
  ep_Q2_002_partial_04_0214,
  ep_Q2_002_partial_04_0215,
  ep_Q2_002_partial_04_0216,
  ep_Q2_002_partial_04_0217,
  ep_Q2_002_partial_04_0218,
  ep_Q2_002_partial_04_0219,
  ep_Q2_002_partial_04_0220,
  ep_Q2_002_partial_04_0221,
  ep_Q2_002_partial_04_0222,
  ep_Q2_002_partial_04_0223,
  ep_Q2_002_partial_04_0224,
  ep_Q2_002_partial_04_0225,
  ep_Q2_002_partial_04_0226,
  ep_Q2_002_partial_04_0227,
  ep_Q2_002_partial_04_0228,
  ep_Q2_002_partial_04_0229,
  ep_Q2_002_partial_04_0230,
  ep_Q2_002_partial_04_0231,
  ep_Q2_002_partial_04_0232,
  ep_Q2_002_partial_04_0233,
  ep_Q2_002_partial_04_0234,
  ep_Q2_002_partial_04_0235,
  ep_Q2_002_partial_04_0236,
  ep_Q2_002_partial_04_0237,
  ep_Q2_002_partial_04_0238,
  ep_Q2_002_partial_04_0239,
  ep_Q2_002_partial_04_0240,
  ep_Q2_002_partial_04_0241,
  ep_Q2_002_partial_04_0242,
  ep_Q2_002_partial_04_0243,
  ep_Q2_002_partial_04_0244,
  ep_Q2_002_partial_04_0245,
  ep_Q2_002_partial_04_0246,
  ep_Q2_002_partial_04_0247,
  ep_Q2_002_partial_04_0248,
  ep_Q2_002_partial_04_0249,
  ep_Q2_002_partial_04_0250,
  ep_Q2_002_partial_04_0251,
  ep_Q2_002_partial_04_0252,
  ep_Q2_002_partial_04_0253,
  ep_Q2_002_partial_04_0254,
  ep_Q2_002_partial_04_0255,
  ep_Q2_002_partial_04_0256,
  ep_Q2_002_partial_04_0257,
  ep_Q2_002_partial_04_0258,
  ep_Q2_002_partial_04_0259,
  ep_Q2_002_partial_04_0260,
  ep_Q2_002_partial_04_0261,
  ep_Q2_002_partial_04_0262,
  ep_Q2_002_partial_04_0263,
  ep_Q2_002_partial_04_0264,
  ep_Q2_002_partial_04_0265,
  ep_Q2_002_partial_04_0266,
  ep_Q2_002_partial_04_0267,
  ep_Q2_002_partial_04_0268,
  ep_Q2_002_partial_04_0269,
  ep_Q2_002_partial_04_0270,
  ep_Q2_002_partial_04_0271,
  ep_Q2_002_partial_04_0272,
  ep_Q2_002_partial_04_0273,
  ep_Q2_002_partial_04_0274,
  ep_Q2_002_partial_04_0275,
  ep_Q2_002_partial_04_0276,
  ep_Q2_002_partial_04_0277,
  ep_Q2_002_partial_04_0278,
  ep_Q2_002_partial_04_0279,
  ep_Q2_002_partial_04_0280,
  ep_Q2_002_partial_04_0281,
  ep_Q2_002_partial_04_0282,
  ep_Q2_002_partial_04_0283,
  ep_Q2_002_partial_04_0284,
  ep_Q2_002_partial_04_0285,
  ep_Q2_002_partial_04_0286,
  ep_Q2_002_partial_04_0287,
  ep_Q2_002_partial_04_0288,
  ep_Q2_002_partial_04_0289,
  ep_Q2_002_partial_04_0290,
  ep_Q2_002_partial_04_0291,
  ep_Q2_002_partial_04_0292,
  ep_Q2_002_partial_04_0293,
  ep_Q2_002_partial_04_0294,
  ep_Q2_002_partial_04_0295,
  ep_Q2_002_partial_04_0296,
  ep_Q2_002_partial_04_0297,
  ep_Q2_002_partial_04_0298,
  ep_Q2_002_partial_04_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_04_0200_0299 : Poly :=
[
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((307690003520847412603311954648672 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((1113021419800617712979619347562101593791318 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((407143449239 : Rat) / 44407903470) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58399056300306832721176881510972 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 2)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 2), (12, 1)],
  term ((41009766427517769629857156697661061518048 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-112045214908 : Rat) / 7401317245) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-372331817862806487571753209402816 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (13, 2)],
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (15, 2)],
  term ((5130926716 : Rat) / 7401317245) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-5009012637442093734102507186526125905265204 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 1), (11, 2)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 2), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 2), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (5, 1), (7, 2), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (11, 1)],
  term ((-57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-18196285962 : Rat) / 7401317245) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((322253653885087385142809867376 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (11, 1)],
  term ((-1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (11, 1), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(2, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((40423427124 : Rat) / 7401317245) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-606863979287940331689036806592 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (13, 1)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(2, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((755812250780036920023480462312809619136788 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (15, 1)],
  term ((17699677089 : Rat) / 7401317245) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((-726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((154602244 : Rat) / 125446055) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((307679144877473547241871287377408 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 1), (13, 1)],
  term ((75313568130176267949405270755641080270096 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((92332945364 : Rat) / 7401317245) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-101111712214249666654806983725152 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (11, 2)],
  term ((-1658176588570694137309903267731439783350144 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-121662923232 : Rat) / 7401317245) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(2, 2), (6, 1), (13, 2)],
  term ((436066212744285907884204574125308610420624 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (15, 2)],
  term ((28239112812 : Rat) / 7401317245) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((10542029528 : Rat) / 7401317245) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-836487117311006988106417069696468062279936 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (11, 2)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-23675476781755697187964415367060 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1)],
  term ((130362817080169096811597640651696 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-564483408805460109743086701089486216330028 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (11, 1), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(2, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-245497597841568815176373543524032 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((607674543797071327851228218353518163385448 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-67979945386 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((46272504585289627329890552580240 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-1513836041530084044270694491857579416446134 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 1)],
  term ((-172231024247 : Rat) / 44407903470) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(2, 2), (7, 2)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (9, 1), (11, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (9, 1), (13, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (9, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(2, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (11, 1), (13, 1)],
  term ((1741360234895305956840415293807309037966644 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (11, 1), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(2, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (11, 2)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (13, 1), (15, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 3), (11, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 3), (13, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 3), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(2, 2), (7, 3), (15, 1), (16, 1)],
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((307690003520847412603311954648672 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((1113021419800617712979619347562101593791318 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((407143449239 : Rat) / 44407903470) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58399056300306832721176881510972 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 2)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 2), (12, 1)],
  term ((41009766427517769629857156697661061518048 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-112045214908 : Rat) / 7401317245) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-372331817862806487571753209402816 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (13, 2)],
  term ((-312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (15, 2)],
  term ((5130926716 : Rat) / 7401317245) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-5009012637442093734102507186526125905265204 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (11, 2)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 2), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 2), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 1), (7, 2), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (11, 1)],
  term ((-57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-18196285962 : Rat) / 7401317245) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((322253653885087385142809867376 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (11, 1)],
  term ((-1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (14, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(3, 2), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((40423427124 : Rat) / 7401317245) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-606863979287940331689036806592 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (13, 1)],
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1), (14, 1)],
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (14, 1), (15, 1)],
  term ((-1243661576 : Rat) / 211466207) [(3, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((755812250780036920023480462312809619136788 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 1)],
  term ((17699677089 : Rat) / 7401317245) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((-726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((154602244 : Rat) / 125446055) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((307679144877473547241871287377408 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 1), (13, 1)],
  term ((75313568130176267949405270755641080270096 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((92332945364 : Rat) / 7401317245) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-101111712214249666654806983725152 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (11, 2)],
  term ((-1658176588570694137309903267731439783350144 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-121662923232 : Rat) / 7401317245) [(3, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(3, 2), (6, 1), (13, 2)],
  term ((436066212744285907884204574125308610420624 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (15, 2)],
  term ((28239112812 : Rat) / 7401317245) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((10542029528 : Rat) / 7401317245) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-836487117311006988106417069696468062279936 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (11, 2)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-23675476781755697187964415367060 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1)],
  term ((130362817080169096811597640651696 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-564483408805460109743086701089486216330028 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(3, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-245497597841568815176373543524032 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((607674543797071327851228218353518163385448 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-67979945386 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((46272504585289627329890552580240 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-1513836041530084044270694491857579416446134 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 1)],
  term ((-172231024247 : Rat) / 44407903470) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 2), (7, 2)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (9, 1), (11, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (9, 1), (13, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (9, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(3, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (11, 1), (13, 1)],
  term ((1741360234895305956840415293807309037966644 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (11, 2)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 3), (11, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 3), (13, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 3), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(3, 2), (7, 3), (15, 1), (16, 1)],
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(4, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-307690003520847412603311954648672 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 2), (11, 1), (13, 1)],
  term ((-1113021419800617712979619347562101593791318 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 2), (11, 1), (15, 1)],
  term ((-407143449239 : Rat) / 44407903470) [(4, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((58399056300306832721176881510972 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 2), (11, 2)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 2), (11, 2), (12, 1)],
  term ((-41009766427517769629857156697661061518048 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (10, 2), (13, 1), (15, 1)],
  term ((112045214908 : Rat) / 7401317245) [(4, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((372331817862806487571753209402816 : Rat) / 1273790490336191187829975377157) [(4, 1), (10, 2), (13, 2)],
  term ((312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (10, 2), (15, 2)],
  term ((-5130926716 : Rat) / 7401317245) [(4, 1), (10, 2), (15, 2), (16, 1)],
  term ((-41009766427517769629857156697661061518048 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((112045214908 : Rat) / 7401317245) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((372331817862806487571753209402816 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (13, 2)],
  term ((312410497347748641989599332099367415058288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 2), (15, 2)],
  term ((-5130926716 : Rat) / 7401317245) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 3), (12, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(4, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-307690003520847412603311954648672 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 3), (13, 1)],
  term ((-1113021419800617712979619347562101593791318 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 3), (15, 1)],
  term ((-407143449239 : Rat) / 44407903470) [(4, 1), (11, 3), (15, 1), (16, 1)],
  term ((58399056300306832721176881510972 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 4)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 4), (12, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((5009012637442093734102507186526125905265204 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(5, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (10, 2), (11, 2)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (10, 2), (15, 2)],
  term ((15565557134 : Rat) / 4440790347) [(5, 1), (7, 1), (10, 2), (15, 2), (16, 1)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (7, 1), (11, 2), (15, 2)],
  term ((15565557134 : Rat) / 4440790347) [(5, 1), (7, 1), (11, 2), (15, 2), (16, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (11, 3), (13, 1)],
  term ((5009012637442093734102507186526125905265204 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (11, 3), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(5, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (11, 4)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 2), (11, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (10, 2), (13, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (10, 2), (15, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(5, 1), (7, 2), (10, 2), (15, 1), (16, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (11, 2), (13, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(5, 1), (7, 2), (11, 2), (15, 1), (16, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 2), (11, 3)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 2), (11, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (10, 2), (13, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((18196285962 : Rat) / 7401317245) [(5, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((57828674163216927526563555499392 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 2), (13, 1)],
  term ((-65966851794618827190909611645571823215096 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((18196285962 : Rat) / 7401317245) [(5, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-30707872248889513027858890535776 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 3)],
  term ((-322253653885087385142809867376 : Rat) / 97983883872014706756151952089) [(5, 1), (10, 2), (11, 1)],
  term ((1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (10, 2), (11, 1), (12, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 2), (11, 1), (14, 1)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (10, 2), (11, 1), (15, 2)],
  term ((-7782778567 : Rat) / 4440790347) [(5, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 2), (11, 2), (15, 1)],
  term ((-2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (10, 2), (12, 1), (13, 1)],
  term ((-101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (10, 2), (12, 1), (15, 1)],
  term ((-40423427124 : Rat) / 7401317245) [(5, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((606863979287940331689036806592 : Rat) / 97983883872014706756151952089) [(5, 1), (10, 2), (13, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (10, 2), (13, 1), (14, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (10, 2), (14, 1), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-755812250780036920023480462312809619136788 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (10, 2), (15, 1)],
  term ((-17699677089 : Rat) / 7401317245) [(5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2764969937252975950587047693952 : Rat) / 115799135485108289802725034287) [(5, 1), (11, 2), (12, 1), (13, 1)],
  term ((-101696986559422643318278068154007226498768 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-40423427124 : Rat) / 7401317245) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((606863979287940331689036806592 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 2), (13, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 2), (13, 1), (14, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-755812250780036920023480462312809619136788 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (11, 2), (15, 1)],
  term ((-17699677089 : Rat) / 7401317245) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-322253653885087385142809867376 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 3)],
  term ((1468239499414129716371400087456 : Rat) / 115799135485108289802725034287) [(5, 1), (11, 3), (12, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 3), (13, 1), (15, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 3), (14, 1)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (11, 3), (15, 2)],
  term ((-7782778567 : Rat) / 4440790347) [(5, 1), (11, 3), (15, 2), (16, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 4), (15, 1)],
  term ((17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 2), (11, 1)],
  term ((-32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (10, 2), (13, 1)],
  term ((726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (10, 2), (15, 1)],
  term ((-154602244 : Rat) / 125446055) [(6, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-32072379085056639224248912931904 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((726139826040505736777485596040620139392 : Rat) / 22827427415598686891290631687354680805) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-154602244 : Rat) / 125446055) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((17030902643248288897961462256912 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 3)],
  term ((-307679144877473547241871287377408 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 2), (11, 1), (13, 1)],
  term ((-75313568130176267949405270755641080270096 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (10, 2), (11, 1), (15, 1)],
  term ((-92332945364 : Rat) / 7401317245) [(6, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((101111712214249666654806983725152 : Rat) / 1273790490336191187829975377157) [(6, 1), (10, 2), (11, 2)],
  term ((1658176588570694137309903267731439783350144 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 2), (13, 1), (15, 1)],
  term ((121662923232 : Rat) / 7401317245) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (10, 2), (13, 2)],
  term ((-436066212744285907884204574125308610420624 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (10, 2), (15, 2)],
  term ((-28239112812 : Rat) / 7401317245) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((1658176588570694137309903267731439783350144 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((121662923232 : Rat) / 7401317245) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((16987342269530782929186435119616 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (13, 2)],
  term ((-436066212744285907884204574125308610420624 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 2), (15, 2)],
  term ((-28239112812 : Rat) / 7401317245) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-307679144877473547241871287377408 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 3), (13, 1)],
  term ((-75313568130176267949405270755641080270096 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (11, 3), (15, 1)],
  term ((-92332945364 : Rat) / 7401317245) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((101111712214249666654806983725152 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 4)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((-161950540168329432747153192898304917045536 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-10542029528 : Rat) / 7401317245) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 3)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (11, 1), (13, 1)],
  term ((836487117311006988106417069696468062279936 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(7, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (11, 2)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (10, 2), (13, 1), (15, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (10, 2), (15, 2)],
  term ((65009381712 : Rat) / 7401317245) [(7, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (11, 2), (15, 2)],
  term ((65009381712 : Rat) / 7401317245) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 3), (13, 1)],
  term ((836487117311006988106417069696468062279936 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (11, 3), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(7, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 4)],
  term ((23675476781755697187964415367060 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1)],
  term ((-130362817080169096811597640651696 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((564483408805460109743086701089486216330028 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (11, 1), (15, 2)],
  term ((-88171245013 : Rat) / 22203951735) [(7, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (11, 2), (15, 1)],
  term ((245497597841568815176373543524032 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-607674543797071327851228218353518163385448 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (12, 1), (15, 1)],
  term ((67979945386 : Rat) / 7401317245) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-46272504585289627329890552580240 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (13, 1)],
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(7, 1), (10, 2), (13, 1), (15, 2)],
  term ((1513836041530084044270694491857579416446134 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (15, 1)],
  term ((172231024247 : Rat) / 44407903470) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (10, 2), (15, 3)],
  term ((-316951406728 : Rat) / 22203951735) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((245497597841568815176373543524032 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (12, 1), (13, 1)],
  term ((-607674543797071327851228218353518163385448 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((67979945386 : Rat) / 7401317245) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-46272504585289627329890552580240 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (13, 1)],
  term ((-56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((1513836041530084044270694491857579416446134 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 2), (15, 1)],
  term ((172231024247 : Rat) / 44407903470) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 2), (15, 3)],
  term ((-316951406728 : Rat) / 22203951735) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((23675476781755697187964415367060 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 3)],
  term ((-130362817080169096811597640651696 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 3), (12, 1)],
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 3), (13, 1), (15, 1)],
  term ((564483408805460109743086701089486216330028 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (11, 3), (15, 2)],
  term ((-88171245013 : Rat) / 22203951735) [(7, 1), (11, 3), (15, 2), (16, 1)],
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 4), (15, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (10, 2), (13, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(7, 2), (9, 1), (11, 3)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(7, 2), (10, 2)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (11, 1), (13, 1)],
  term ((-1741360234895305956840415293807309037966644 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(7, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (11, 2)],
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (10, 2), (15, 2)],
  term ((176342490026 : Rat) / 22203951735) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(7, 2), (11, 2)],
  term ((255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (11, 2), (15, 2)],
  term ((176342490026 : Rat) / 22203951735) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 3), (13, 1)],
  term ((-1741360234895305956840415293807309037966644 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (11, 3), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 4)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 2), (11, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(7, 3), (10, 2), (13, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (10, 2), (15, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(7, 3), (10, 2), (15, 1), (16, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 2), (13, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(7, 3), (11, 2), (15, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(7, 3), (11, 2), (15, 1), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(7, 3), (11, 3)],
  term ((-43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 200 through 299. -/
theorem ep_Q2_002_block_04_0200_0299_valid :
    checkProductSumEq ep_Q2_002_partials_04_0200_0299
      ep_Q2_002_block_04_0200_0299 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
