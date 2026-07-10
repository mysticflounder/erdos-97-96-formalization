/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 12:200-299

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 12 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_12_0200_0299 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0200 : Poly :=
[
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 200 for generator 12. -/
def ep_Q2_002_partial_12_0200 : Poly :=
[
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 12. -/
theorem ep_Q2_002_partial_12_0200_valid :
    mulPoly ep_Q2_002_coefficient_12_0200
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0201 : Poly :=
[
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 201 for generator 12. -/
def ep_Q2_002_partial_12_0201 : Poly :=
[
  term ((117530099766188738730213585768288 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (15, 2)],
  term ((117530099766188738730213585768288 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1), (15, 2)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 12. -/
theorem ep_Q2_002_partial_12_0201_valid :
    mulPoly ep_Q2_002_coefficient_12_0201
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0202 : Poly :=
[
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 202 for generator 12. -/
def ep_Q2_002_partial_12_0202 : Poly :=
[
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (12, 1), (13, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 12. -/
theorem ep_Q2_002_partial_12_0202_valid :
    mulPoly ep_Q2_002_coefficient_12_0202
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0203 : Poly :=
[
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 203 for generator 12. -/
def ep_Q2_002_partial_12_0203 : Poly :=
[
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 12. -/
theorem ep_Q2_002_partial_12_0203_valid :
    mulPoly ep_Q2_002_coefficient_12_0203
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0204 : Poly :=
[
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 12. -/
def ep_Q2_002_partial_12_0204 : Poly :=
[
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((112126330424 : Rat) / 7401317245) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 12. -/
theorem ep_Q2_002_partial_12_0204_valid :
    mulPoly ep_Q2_002_coefficient_12_0204
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0205 : Poly :=
[
  term ((-4954728557574226558156142236536 : Rat) / 97983883872014706756151952089) [(5, 1), (13, 1)]
]

/-- Partial product 205 for generator 12. -/
def ep_Q2_002_partial_12_0205 : Poly :=
[
  term ((-9909457115148453116312284473072 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((4954728557574226558156142236536 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (13, 1)],
  term ((-9909457115148453116312284473072 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 2), (13, 1)],
  term ((4954728557574226558156142236536 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 12. -/
theorem ep_Q2_002_partial_12_0205_valid :
    mulPoly ep_Q2_002_coefficient_12_0205
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0206 : Poly :=
[
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 206 for generator 12. -/
def ep_Q2_002_partial_12_0206 : Poly :=
[
  term ((-221331187933253564025651456986496 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1), (15, 2)],
  term ((-221331187933253564025651456986496 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 12. -/
theorem ep_Q2_002_partial_12_0206_valid :
    mulPoly ep_Q2_002_coefficient_12_0206
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0207 : Poly :=
[
  term ((-225539782531873041792954557673659835389655 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (15, 1)]
]

/-- Partial product 207 for generator 12. -/
def ep_Q2_002_partial_12_0207 : Poly :=
[
  term ((-451079565063746083585909115347319670779310 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((225539782531873041792954557673659835389655 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (15, 1)],
  term ((-451079565063746083585909115347319670779310 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 2), (15, 1)],
  term ((225539782531873041792954557673659835389655 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 12. -/
theorem ep_Q2_002_partial_12_0207_valid :
    mulPoly ep_Q2_002_coefficient_12_0207
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0208 : Poly :=
[
  term ((-126682923755 : Rat) / 17763161388) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 12. -/
def ep_Q2_002_partial_12_0208 : Poly :=
[
  term ((-126682923755 : Rat) / 8881580694) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((126682923755 : Rat) / 17763161388) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-126682923755 : Rat) / 8881580694) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((126682923755 : Rat) / 17763161388) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 12. -/
theorem ep_Q2_002_partial_12_0208_valid :
    mulPoly ep_Q2_002_coefficient_12_0208
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0209 : Poly :=
[
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (15, 3)]
]

/-- Partial product 209 for generator 12. -/
def ep_Q2_002_partial_12_0209 : Poly :=
[
  term ((955096054767820213715764753308696422106864 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (15, 3)],
  term ((955096054767820213715764753308696422106864 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 2), (15, 3)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 12. -/
theorem ep_Q2_002_partial_12_0209_valid :
    mulPoly ep_Q2_002_coefficient_12_0209
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0210 : Poly :=
[
  term ((15565557134 : Rat) / 4440790347) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 210 for generator 12. -/
def ep_Q2_002_partial_12_0210 : Poly :=
[
  term ((31131114268 : Rat) / 4440790347) [(2, 1), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((31131114268 : Rat) / 4440790347) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((-15565557134 : Rat) / 4440790347) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 12. -/
theorem ep_Q2_002_partial_12_0210_valid :
    mulPoly ep_Q2_002_coefficient_12_0210
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0211 : Poly :=
[
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(6, 1)]
]

/-- Partial product 211 for generator 12. -/
def ep_Q2_002_partial_12_0211 : Poly :=
[
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(2, 1), (4, 1), (6, 1)],
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(2, 2), (6, 1)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (6, 1)],
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(3, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 12. -/
theorem ep_Q2_002_partial_12_0211_valid :
    mulPoly ep_Q2_002_coefficient_12_0211
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0212 : Poly :=
[
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 212 for generator 12. -/
def ep_Q2_002_partial_12_0212 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (7, 1), (11, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (7, 1), (11, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 12. -/
theorem ep_Q2_002_partial_12_0212_valid :
    mulPoly ep_Q2_002_coefficient_12_0212
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0213 : Poly :=
[
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 213 for generator 12. -/
def ep_Q2_002_partial_12_0213 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 12. -/
theorem ep_Q2_002_partial_12_0213_valid :
    mulPoly ep_Q2_002_coefficient_12_0213
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0214 : Poly :=
[
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 214 for generator 12. -/
def ep_Q2_002_partial_12_0214 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 12. -/
theorem ep_Q2_002_partial_12_0214_valid :
    mulPoly ep_Q2_002_coefficient_12_0214
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0215 : Poly :=
[
  term ((88171245013 : Rat) / 14802634490) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 12. -/
def ep_Q2_002_partial_12_0215 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 12. -/
theorem ep_Q2_002_partial_12_0215_valid :
    mulPoly ep_Q2_002_coefficient_12_0215
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0216 : Poly :=
[
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 216 for generator 12. -/
def ep_Q2_002_partial_12_0216 : Poly :=
[
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 12. -/
theorem ep_Q2_002_partial_12_0216_valid :
    mulPoly ep_Q2_002_coefficient_12_0216
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0217 : Poly :=
[
  term ((143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 217 for generator 12. -/
def ep_Q2_002_partial_12_0217 : Poly :=
[
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 12. -/
theorem ep_Q2_002_partial_12_0217_valid :
    mulPoly ep_Q2_002_coefficient_12_0217
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0218 : Poly :=
[
  term ((61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 218 for generator 12. -/
def ep_Q2_002_partial_12_0218 : Poly :=
[
  term ((123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 12. -/
theorem ep_Q2_002_partial_12_0218_valid :
    mulPoly ep_Q2_002_coefficient_12_0218
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0219 : Poly :=
[
  term ((70368054424 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 12. -/
def ep_Q2_002_partial_12_0219 : Poly :=
[
  term ((140736108848 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70368054424 : Rat) / 7401317245) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((140736108848 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70368054424 : Rat) / 7401317245) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 12. -/
theorem ep_Q2_002_partial_12_0219_valid :
    mulPoly ep_Q2_002_coefficient_12_0219
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0220 : Poly :=
[
  term ((-406977091264339377684325965205047190976148 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 220 for generator 12. -/
def ep_Q2_002_partial_12_0220 : Poly :=
[
  term ((-813954182528678755368651930410094381952296 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((406977091264339377684325965205047190976148 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((-813954182528678755368651930410094381952296 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((406977091264339377684325965205047190976148 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 12. -/
theorem ep_Q2_002_partial_12_0220_valid :
    mulPoly ep_Q2_002_coefficient_12_0220
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0221 : Poly :=
[
  term ((-12548443744 : Rat) / 7401317245) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 12. -/
def ep_Q2_002_partial_12_0221 : Poly :=
[
  term ((-25096887488 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12548443744 : Rat) / 7401317245) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-25096887488 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12548443744 : Rat) / 7401317245) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 12. -/
theorem ep_Q2_002_partial_12_0221_valid :
    mulPoly ep_Q2_002_coefficient_12_0221
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0222 : Poly :=
[
  term ((-111816306053530842005492822755344 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 222 for generator 12. -/
def ep_Q2_002_partial_12_0222 : Poly :=
[
  term ((-223632612107061684010985645510688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((111816306053530842005492822755344 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-223632612107061684010985645510688 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((111816306053530842005492822755344 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 12. -/
theorem ep_Q2_002_partial_12_0222_valid :
    mulPoly ep_Q2_002_coefficient_12_0222
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0223 : Poly :=
[
  term ((1185303295548519608528173021440362540437602 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (15, 2)]
]

/-- Partial product 223 for generator 12. -/
def ep_Q2_002_partial_12_0223 : Poly :=
[
  term ((2370606591097039217056346042880725080875204 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-1185303295548519608528173021440362540437602 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (15, 2)],
  term ((2370606591097039217056346042880725080875204 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-1185303295548519608528173021440362540437602 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 12. -/
theorem ep_Q2_002_partial_12_0223_valid :
    mulPoly ep_Q2_002_coefficient_12_0223
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0224 : Poly :=
[
  term ((-12619833773 : Rat) / 14802634490) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 224 for generator 12. -/
def ep_Q2_002_partial_12_0224 : Poly :=
[
  term ((-12619833773 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((12619833773 : Rat) / 14802634490) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-12619833773 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((12619833773 : Rat) / 14802634490) [(3, 2), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 12. -/
theorem ep_Q2_002_partial_12_0224_valid :
    mulPoly ep_Q2_002_coefficient_12_0224
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0225 : Poly :=
[
  term ((-14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 225 for generator 12. -/
def ep_Q2_002_partial_12_0225 : Poly :=
[
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 12. -/
theorem ep_Q2_002_partial_12_0225_valid :
    mulPoly ep_Q2_002_coefficient_12_0225
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0226 : Poly :=
[
  term ((26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 226 for generator 12. -/
def ep_Q2_002_partial_12_0226 : Poly :=
[
  term ((53323790206862476260917094033792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((53323790206862476260917094033792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 12. -/
theorem ep_Q2_002_partial_12_0226_valid :
    mulPoly ep_Q2_002_coefficient_12_0226
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0227 : Poly :=
[
  term ((71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 227 for generator 12. -/
def ep_Q2_002_partial_12_0227 : Poly :=
[
  term ((143493232074946280623259186363914408714656 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((143493232074946280623259186363914408714656 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 12. -/
theorem ep_Q2_002_partial_12_0227_valid :
    mulPoly ep_Q2_002_coefficient_12_0227
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0228 : Poly :=
[
  term ((10981330664 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 12. -/
def ep_Q2_002_partial_12_0228 : Poly :=
[
  term ((21962661328 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((21962661328 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 12. -/
theorem ep_Q2_002_partial_12_0228_valid :
    mulPoly ep_Q2_002_coefficient_12_0228
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0229 : Poly :=
[
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 229 for generator 12. -/
def ep_Q2_002_partial_12_0229 : Poly :=
[
  term ((453089127865163734675508137847424 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((453089127865163734675508137847424 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 12. -/
theorem ep_Q2_002_partial_12_0229_valid :
    mulPoly ep_Q2_002_coefficient_12_0229
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0230 : Poly :=
[
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 230 for generator 12. -/
def ep_Q2_002_partial_12_0230 : Poly :=
[
  term ((-853251678587343666835905621355008 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-853251678587343666835905621355008 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 12. -/
theorem ep_Q2_002_partial_12_0230_valid :
    mulPoly ep_Q2_002_coefficient_12_0230
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0231 : Poly :=
[
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 231 for generator 12. -/
def ep_Q2_002_partial_12_0231 : Poly :=
[
  term ((-3665325266919308560444948551146631909122304 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((-3665325266919308560444948551146631909122304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 12. -/
theorem ep_Q2_002_partial_12_0231_valid :
    mulPoly ep_Q2_002_coefficient_12_0231
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0232 : Poly :=
[
  term ((-195028145136 : Rat) / 7401317245) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 232 for generator 12. -/
def ep_Q2_002_partial_12_0232 : Poly :=
[
  term ((-390056290272 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((195028145136 : Rat) / 7401317245) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-390056290272 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((195028145136 : Rat) / 7401317245) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 12. -/
theorem ep_Q2_002_partial_12_0232_valid :
    mulPoly ep_Q2_002_coefficient_12_0232
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0233 : Poly :=
[
  term ((300795346009224619064276785359192 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 233 for generator 12. -/
def ep_Q2_002_partial_12_0233 : Poly :=
[
  term ((601590692018449238128553570718384 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-300795346009224619064276785359192 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1)],
  term ((601590692018449238128553570718384 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-300795346009224619064276785359192 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 12. -/
theorem ep_Q2_002_partial_12_0233_valid :
    mulPoly ep_Q2_002_coefficient_12_0233
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0234 : Poly :=
[
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 234 for generator 12. -/
def ep_Q2_002_partial_12_0234 : Poly :=
[
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 12. -/
theorem ep_Q2_002_partial_12_0234_valid :
    mulPoly ep_Q2_002_coefficient_12_0234
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0235 : Poly :=
[
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 235 for generator 12. -/
def ep_Q2_002_partial_12_0235 : Poly :=
[
  term ((199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 12. -/
theorem ep_Q2_002_partial_12_0235_valid :
    mulPoly ep_Q2_002_coefficient_12_0235
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0236 : Poly :=
[
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 236 for generator 12. -/
def ep_Q2_002_partial_12_0236 : Poly :=
[
  term ((-271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (15, 2)],
  term ((-271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 12. -/
theorem ep_Q2_002_partial_12_0236_valid :
    mulPoly ep_Q2_002_coefficient_12_0236
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0237 : Poly :=
[
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 237 for generator 12. -/
def ep_Q2_002_partial_12_0237 : Poly :=
[
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 12. -/
theorem ep_Q2_002_partial_12_0237_valid :
    mulPoly ep_Q2_002_coefficient_12_0237
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0238 : Poly :=
[
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 238 for generator 12. -/
def ep_Q2_002_partial_12_0238 : Poly :=
[
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 12. -/
theorem ep_Q2_002_partial_12_0238_valid :
    mulPoly ep_Q2_002_coefficient_12_0238
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0239 : Poly :=
[
  term ((56063165212 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 12. -/
def ep_Q2_002_partial_12_0239 : Poly :=
[
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((112126330424 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 12. -/
theorem ep_Q2_002_partial_12_0239_valid :
    mulPoly ep_Q2_002_coefficient_12_0239
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0240 : Poly :=
[
  term ((-561078565176184575404712350632704 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 240 for generator 12. -/
def ep_Q2_002_partial_12_0240 : Poly :=
[
  term ((-1122157130352369150809424701265408 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((561078565176184575404712350632704 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1)],
  term ((-1122157130352369150809424701265408 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((561078565176184575404712350632704 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 12. -/
theorem ep_Q2_002_partial_12_0240_valid :
    mulPoly ep_Q2_002_coefficient_12_0240
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0241 : Poly :=
[
  term ((-1487464576979102144660415646795368648152448 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 241 for generator 12. -/
def ep_Q2_002_partial_12_0241 : Poly :=
[
  term ((-2974929153958204289320831293590737296304896 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((1487464576979102144660415646795368648152448 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-2974929153958204289320831293590737296304896 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((1487464576979102144660415646795368648152448 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 12. -/
theorem ep_Q2_002_partial_12_0241_valid :
    mulPoly ep_Q2_002_coefficient_12_0241
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0242 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 242 for generator 12. -/
def ep_Q2_002_partial_12_0242 : Poly :=
[
  term ((-224252660848 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((112126330424 : Rat) / 7401317245) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-224252660848 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((112126330424 : Rat) / 7401317245) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 12. -/
theorem ep_Q2_002_partial_12_0242_valid :
    mulPoly ep_Q2_002_coefficient_12_0242
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0243 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 243 for generator 12. -/
def ep_Q2_002_partial_12_0243 : Poly :=
[
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 12. -/
theorem ep_Q2_002_partial_12_0243_valid :
    mulPoly ep_Q2_002_coefficient_12_0243
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0244 : Poly :=
[
  term ((-1193794991360777041725985234226800387140744 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 244 for generator 12. -/
def ep_Q2_002_partial_12_0244 : Poly :=
[
  term ((-2387589982721554083451970468453600774281488 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((1193794991360777041725985234226800387140744 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 1)],
  term ((-2387589982721554083451970468453600774281488 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((1193794991360777041725985234226800387140744 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 12. -/
theorem ep_Q2_002_partial_12_0244_valid :
    mulPoly ep_Q2_002_coefficient_12_0244
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0245 : Poly :=
[
  term ((-677732390576 : Rat) / 22203951735) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 12. -/
def ep_Q2_002_partial_12_0245 : Poly :=
[
  term ((-1355464781152 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((677732390576 : Rat) / 22203951735) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1355464781152 : Rat) / 22203951735) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((677732390576 : Rat) / 22203951735) [(3, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 12. -/
theorem ep_Q2_002_partial_12_0245_valid :
    mulPoly ep_Q2_002_coefficient_12_0245
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0246 : Poly :=
[
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)]
]

/-- Partial product 246 for generator 12. -/
def ep_Q2_002_partial_12_0246 : Poly :=
[
  term ((-2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 3)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 3)],
  term ((-2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 12. -/
theorem ep_Q2_002_partial_12_0246_valid :
    mulPoly ep_Q2_002_coefficient_12_0246
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0247 : Poly :=
[
  term ((176342490026 : Rat) / 22203951735) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 247 for generator 12. -/
def ep_Q2_002_partial_12_0247 : Poly :=
[
  term ((352684980052 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-176342490026 : Rat) / 22203951735) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((352684980052 : Rat) / 22203951735) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((-176342490026 : Rat) / 22203951735) [(3, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 12. -/
theorem ep_Q2_002_partial_12_0247_valid :
    mulPoly ep_Q2_002_coefficient_12_0247
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0248 : Poly :=
[
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 248 for generator 12. -/
def ep_Q2_002_partial_12_0248 : Poly :=
[
  term ((814835034818481040455114621785376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (11, 1), (15, 1)],
  term ((814835034818481040455114621785376 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 12. -/
theorem ep_Q2_002_partial_12_0248_valid :
    mulPoly ep_Q2_002_coefficient_12_0248
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0249 : Poly :=
[
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 249 for generator 12. -/
def ep_Q2_002_partial_12_0249 : Poly :=
[
  term ((-1534486966188140497836179827262592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (13, 1), (15, 1)],
  term ((-1534486966188140497836179827262592 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 12. -/
theorem ep_Q2_002_partial_12_0249_valid :
    mulPoly ep_Q2_002_coefficient_12_0249
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0250 : Poly :=
[
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(7, 2), (15, 2)]
]

/-- Partial product 250 for generator 12. -/
def ep_Q2_002_partial_12_0250 : Poly :=
[
  term ((6391074025768633430273472365831926049237136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 2), (15, 2)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (15, 2)],
  term ((6391074025768633430273472365831926049237136 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 2), (15, 2)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 12. -/
theorem ep_Q2_002_partial_12_0250_valid :
    mulPoly ep_Q2_002_coefficient_12_0250
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0251 : Poly :=
[
  term ((-176342490026 : Rat) / 7401317245) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 251 for generator 12. -/
def ep_Q2_002_partial_12_0251 : Poly :=
[
  term ((-352684980052 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((176342490026 : Rat) / 7401317245) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((-352684980052 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((176342490026 : Rat) / 7401317245) [(3, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 12. -/
theorem ep_Q2_002_partial_12_0251_valid :
    mulPoly ep_Q2_002_coefficient_12_0251
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0252 : Poly :=
[
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 252 for generator 12. -/
def ep_Q2_002_partial_12_0252 : Poly :=
[
  term ((86787142909821121996005501427200 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((86787142909821121996005501427200 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)],
  term ((-43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 12. -/
theorem ep_Q2_002_partial_12_0252_valid :
    mulPoly ep_Q2_002_coefficient_12_0252
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0253 : Poly :=
[
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 253 for generator 12. -/
def ep_Q2_002_partial_12_0253 : Poly :=
[
  term ((-163436442883797717940765548902400 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((-163436442883797717940765548902400 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 12. -/
theorem ep_Q2_002_partial_12_0253_valid :
    mulPoly ep_Q2_002_coefficient_12_0253
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0254 : Poly :=
[
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 254 for generator 12. -/
def ep_Q2_002_partial_12_0254 : Poly :=
[
  term ((-3210885602608095167877929766547465057311984 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((-3210885602608095167877929766547465057311984 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 12. -/
theorem ep_Q2_002_partial_12_0254_valid :
    mulPoly ep_Q2_002_coefficient_12_0254
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0255 : Poly :=
[
  term ((-71095103246 : Rat) / 7401317245) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 255 for generator 12. -/
def ep_Q2_002_partial_12_0255 : Poly :=
[
  term ((-142190206492 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((71095103246 : Rat) / 7401317245) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-142190206492 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((71095103246 : Rat) / 7401317245) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 12. -/
theorem ep_Q2_002_partial_12_0255_valid :
    mulPoly ep_Q2_002_coefficient_12_0255
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0256 : Poly :=
[
  term ((-19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 256 for generator 12. -/
def ep_Q2_002_partial_12_0256 : Poly :=
[
  term ((-39301297778666436292606034499480 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1)],
  term ((19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((-39301297778666436292606034499480 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)],
  term ((19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 12. -/
theorem ep_Q2_002_partial_12_0256_valid :
    mulPoly ep_Q2_002_coefficient_12_0256
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0257 : Poly :=
[
  term ((-514187581300874424080352073152 : Rat) / 97983883872014706756151952089) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 257 for generator 12. -/
def ep_Q2_002_partial_12_0257 : Poly :=
[
  term ((-1028375162601748848160704146304 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((514187581300874424080352073152 : Rat) / 97983883872014706756151952089) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1028375162601748848160704146304 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((514187581300874424080352073152 : Rat) / 97983883872014706756151952089) [(3, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 12. -/
theorem ep_Q2_002_partial_12_0257_valid :
    mulPoly ep_Q2_002_coefficient_12_0257
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0258 : Poly :=
[
  term ((608493124566122798354408022527545855016664 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 258 for generator 12. -/
def ep_Q2_002_partial_12_0258 : Poly :=
[
  term ((1216986249132245596708816045055091710033328 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-608493124566122798354408022527545855016664 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((1216986249132245596708816045055091710033328 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((-608493124566122798354408022527545855016664 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 12. -/
theorem ep_Q2_002_partial_12_0258_valid :
    mulPoly ep_Q2_002_coefficient_12_0258
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0259 : Poly :=
[
  term ((30403021007 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 259 for generator 12. -/
def ep_Q2_002_partial_12_0259 : Poly :=
[
  term ((60806042014 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30403021007 : Rat) / 7401317245) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((60806042014 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30403021007 : Rat) / 7401317245) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 12. -/
theorem ep_Q2_002_partial_12_0259_valid :
    mulPoly ep_Q2_002_coefficient_12_0259
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0260 : Poly :=
[
  term ((37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

/-- Partial product 260 for generator 12. -/
def ep_Q2_002_partial_12_0260 : Poly :=
[
  term ((74011703742067365254813744792160 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (13, 2)],
  term ((-37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (13, 2)],
  term ((74011703742067365254813744792160 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (13, 2)],
  term ((-37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 12. -/
theorem ep_Q2_002_partial_12_0260_valid :
    mulPoly ep_Q2_002_coefficient_12_0260
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0261 : Poly :=
[
  term ((-144267912991341717449265218309498815705848 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 261 for generator 12. -/
def ep_Q2_002_partial_12_0261 : Poly :=
[
  term ((-288535825982683434898530436618997631411696 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((144267912991341717449265218309498815705848 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (15, 2)],
  term ((-288535825982683434898530436618997631411696 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((144267912991341717449265218309498815705848 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 12. -/
theorem ep_Q2_002_partial_12_0261_valid :
    mulPoly ep_Q2_002_coefficient_12_0261
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0262 : Poly :=
[
  term ((-588165974 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 262 for generator 12. -/
def ep_Q2_002_partial_12_0262 : Poly :=
[
  term ((-1176331948 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((588165974 : Rat) / 7401317245) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1176331948 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((588165974 : Rat) / 7401317245) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 12. -/
theorem ep_Q2_002_partial_12_0262_valid :
    mulPoly ep_Q2_002_coefficient_12_0262
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0263 : Poly :=
[
  term ((275214269923832660045978546864496 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 263 for generator 12. -/
def ep_Q2_002_partial_12_0263 : Poly :=
[
  term ((550428539847665320091957093728992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-275214269923832660045978546864496 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1)],
  term ((550428539847665320091957093728992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-275214269923832660045978546864496 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 12. -/
theorem ep_Q2_002_partial_12_0263_valid :
    mulPoly ep_Q2_002_coefficient_12_0263
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0264 : Poly :=
[
  term ((-231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 264 for generator 12. -/
def ep_Q2_002_partial_12_0264 : Poly :=
[
  term ((-462516931851547216866867660645000 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1)],
  term ((231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-462516931851547216866867660645000 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 12. -/
theorem ep_Q2_002_partial_12_0264_valid :
    mulPoly ep_Q2_002_coefficient_12_0264
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0265 : Poly :=
[
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 265 for generator 12. -/
def ep_Q2_002_partial_12_0265 : Poly :=
[
  term ((-151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((-151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 12. -/
theorem ep_Q2_002_partial_12_0265_valid :
    mulPoly ep_Q2_002_coefficient_12_0265
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0266 : Poly :=
[
  term ((435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 266 for generator 12. -/
def ep_Q2_002_partial_12_0266 : Poly :=
[
  term ((871005999055541002526863064340000 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((871005999055541002526863064340000 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 12. -/
theorem ep_Q2_002_partial_12_0266_valid :
    mulPoly ep_Q2_002_coefficient_12_0266
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0267 : Poly :=
[
  term ((203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 267 for generator 12. -/
def ep_Q2_002_partial_12_0267 : Poly :=
[
  term ((407747656598132104991157255311878857057168 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((407747656598132104991157255311878857057168 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 12. -/
theorem ep_Q2_002_partial_12_0267_valid :
    mulPoly ep_Q2_002_coefficient_12_0267
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0268 : Poly :=
[
  term ((152654436597 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 12. -/
def ep_Q2_002_partial_12_0268 : Poly :=
[
  term ((305308873194 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-152654436597 : Rat) / 7401317245) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((305308873194 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-152654436597 : Rat) / 7401317245) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 12. -/
theorem ep_Q2_002_partial_12_0268_valid :
    mulPoly ep_Q2_002_coefficient_12_0268
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0269 : Poly :=
[
  term ((-518280010138719216404393617501632 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 269 for generator 12. -/
def ep_Q2_002_partial_12_0269 : Poly :=
[
  term ((-1036560020277438432808787235003264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((518280010138719216404393617501632 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1)],
  term ((-1036560020277438432808787235003264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((518280010138719216404393617501632 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 12. -/
theorem ep_Q2_002_partial_12_0269_valid :
    mulPoly ep_Q2_002_coefficient_12_0269
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0270 : Poly :=
[
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 270 for generator 12. -/
def ep_Q2_002_partial_12_0270 : Poly :=
[
  term ((284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 12. -/
theorem ep_Q2_002_partial_12_0270_valid :
    mulPoly ep_Q2_002_coefficient_12_0270
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0271 : Poly :=
[
  term ((400542936468588719615144449199600501043708 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 1)]
]

/-- Partial product 271 for generator 12. -/
def ep_Q2_002_partial_12_0271 : Poly :=
[
  term ((801085872937177439230288898399201002087416 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-400542936468588719615144449199600501043708 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (15, 1)],
  term ((801085872937177439230288898399201002087416 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-400542936468588719615144449199600501043708 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 12. -/
theorem ep_Q2_002_partial_12_0271_valid :
    mulPoly ep_Q2_002_coefficient_12_0271
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0272 : Poly :=
[
  term ((-164929315381 : Rat) / 7401317245) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 12. -/
def ep_Q2_002_partial_12_0272 : Poly :=
[
  term ((-329858630762 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((164929315381 : Rat) / 7401317245) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-329858630762 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((164929315381 : Rat) / 7401317245) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 12. -/
theorem ep_Q2_002_partial_12_0272_valid :
    mulPoly ep_Q2_002_coefficient_12_0272
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0273 : Poly :=
[
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 3)]
]

/-- Partial product 273 for generator 12. -/
def ep_Q2_002_partial_12_0273 : Poly :=
[
  term ((1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (15, 3)],
  term ((1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 3)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 12. -/
theorem ep_Q2_002_partial_12_0273_valid :
    mulPoly ep_Q2_002_coefficient_12_0273
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0274 : Poly :=
[
  term ((65009381712 : Rat) / 7401317245) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 274 for generator 12. -/
def ep_Q2_002_partial_12_0274 : Poly :=
[
  term ((130018763424 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((130018763424 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-65009381712 : Rat) / 7401317245) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 12. -/
theorem ep_Q2_002_partial_12_0274_valid :
    mulPoly ep_Q2_002_coefficient_12_0274
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0275 : Poly :=
[
  term ((-35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 275 for generator 12. -/
def ep_Q2_002_partial_12_0275 : Poly :=
[
  term ((-71602532231651981957647299895776 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-71602532231651981957647299895776 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 12. -/
theorem ep_Q2_002_partial_12_0275_valid :
    mulPoly ep_Q2_002_coefficient_12_0275
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0276 : Poly :=
[
  term ((186804155213785597187067136859817099711324 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 276 for generator 12. -/
def ep_Q2_002_partial_12_0276 : Poly :=
[
  term ((373608310427571194374134273719634199422648 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-186804155213785597187067136859817099711324 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((373608310427571194374134273719634199422648 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-186804155213785597187067136859817099711324 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 12. -/
theorem ep_Q2_002_partial_12_0276_valid :
    mulPoly ep_Q2_002_coefficient_12_0276
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0277 : Poly :=
[
  term ((6274221872 : Rat) / 7401317245) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 12. -/
def ep_Q2_002_partial_12_0277 : Poly :=
[
  term ((12548443744 : Rat) / 7401317245) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12548443744 : Rat) / 7401317245) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 12. -/
theorem ep_Q2_002_partial_12_0277_valid :
    mulPoly ep_Q2_002_coefficient_12_0277
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0278 : Poly :=
[
  term ((18418949688113969000644912925574 : Rat) / 115799135485108289802725034287) [(11, 1), (13, 1)]
]

/-- Partial product 278 for generator 12. -/
def ep_Q2_002_partial_12_0278 : Poly :=
[
  term ((36837899376227938001289825851148 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-18418949688113969000644912925574 : Rat) / 115799135485108289802725034287) [(2, 2), (11, 1), (13, 1)],
  term ((36837899376227938001289825851148 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-18418949688113969000644912925574 : Rat) / 115799135485108289802725034287) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 12. -/
theorem ep_Q2_002_partial_12_0278_valid :
    mulPoly ep_Q2_002_coefficient_12_0278
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0279 : Poly :=
[
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 279 for generator 12. -/
def ep_Q2_002_partial_12_0279 : Poly :=
[
  term ((-199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((-199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 12. -/
theorem ep_Q2_002_partial_12_0279_valid :
    mulPoly ep_Q2_002_coefficient_12_0279
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0280 : Poly :=
[
  term ((-87002696437377562425376535139452872402362 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (15, 1)]
]

/-- Partial product 280 for generator 12. -/
def ep_Q2_002_partial_12_0280 : Poly :=
[
  term ((-174005392874755124850753070278905744804724 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((87002696437377562425376535139452872402362 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (11, 1), (15, 1)],
  term ((-174005392874755124850753070278905744804724 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((87002696437377562425376535139452872402362 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 12. -/
theorem ep_Q2_002_partial_12_0280_valid :
    mulPoly ep_Q2_002_coefficient_12_0280
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0281 : Poly :=
[
  term ((-1312579953 : Rat) / 1480263449) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 12. -/
def ep_Q2_002_partial_12_0281 : Poly :=
[
  term ((-2625159906 : Rat) / 1480263449) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1312579953 : Rat) / 1480263449) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2625159906 : Rat) / 1480263449) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((1312579953 : Rat) / 1480263449) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 12. -/
theorem ep_Q2_002_partial_12_0281_valid :
    mulPoly ep_Q2_002_coefficient_12_0281
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0282 : Poly :=
[
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 3)]
]

/-- Partial product 282 for generator 12. -/
def ep_Q2_002_partial_12_0282 : Poly :=
[
  term ((60329084463266493551152918921920 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (15, 3)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (15, 3)],
  term ((60329084463266493551152918921920 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 12. -/
theorem ep_Q2_002_partial_12_0282_valid :
    mulPoly ep_Q2_002_coefficient_12_0282
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0283 : Poly :=
[
  term ((-3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(11, 2)]
]

/-- Partial product 283 for generator 12. -/
def ep_Q2_002_partial_12_0283 : Poly :=
[
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 2)],
  term ((3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 2)],
  term ((3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 12. -/
theorem ep_Q2_002_partial_12_0283_valid :
    mulPoly ep_Q2_002_coefficient_12_0283
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0284 : Poly :=
[
  term ((-6284335703733637029648 : Rat) / 253528477699481291099) [(12, 1)]
]

/-- Partial product 284 for generator 12. -/
def ep_Q2_002_partial_12_0284 : Poly :=
[
  term ((-12568671407467274059296 : Rat) / 253528477699481291099) [(2, 1), (4, 1), (12, 1)],
  term ((6284335703733637029648 : Rat) / 253528477699481291099) [(2, 2), (12, 1)],
  term ((-12568671407467274059296 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (12, 1)],
  term ((6284335703733637029648 : Rat) / 253528477699481291099) [(3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 12. -/
theorem ep_Q2_002_partial_12_0284_valid :
    mulPoly ep_Q2_002_coefficient_12_0284
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0285 : Poly :=
[
  term ((-243283351447148454897464590521247784360016 : Rat) / 269363643504064505317229453910785233499) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 285 for generator 12. -/
def ep_Q2_002_partial_12_0285 : Poly :=
[
  term ((-486566702894296909794929181042495568720032 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((243283351447148454897464590521247784360016 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-486566702894296909794929181042495568720032 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((243283351447148454897464590521247784360016 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 12. -/
theorem ep_Q2_002_partial_12_0285_valid :
    mulPoly ep_Q2_002_coefficient_12_0285
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0286 : Poly :=
[
  term ((-384996092 : Rat) / 211466207) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 12. -/
def ep_Q2_002_partial_12_0286 : Poly :=
[
  term ((-769992184 : Rat) / 211466207) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((384996092 : Rat) / 211466207) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-769992184 : Rat) / 211466207) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((384996092 : Rat) / 211466207) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 12. -/
theorem ep_Q2_002_partial_12_0286_valid :
    mulPoly ep_Q2_002_coefficient_12_0286
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0287 : Poly :=
[
  term ((67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)]
]

/-- Partial product 287 for generator 12. -/
def ep_Q2_002_partial_12_0287 : Poly :=
[
  term ((134840977327407613163022096619392 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 2)],
  term ((-67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1), (13, 2)],
  term ((134840977327407613163022096619392 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((-67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 12. -/
theorem ep_Q2_002_partial_12_0287_valid :
    mulPoly ep_Q2_002_coefficient_12_0287
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0288 : Poly :=
[
  term ((-111890732474074762453161480452201904391584 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)]
]

/-- Partial product 288 for generator 12. -/
def ep_Q2_002_partial_12_0288 : Poly :=
[
  term ((-223781464948149524906322960904403808783168 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((111890732474074762453161480452201904391584 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (15, 2)],
  term ((-223781464948149524906322960904403808783168 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((111890732474074762453161480452201904391584 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 12. -/
theorem ep_Q2_002_partial_12_0288_valid :
    mulPoly ep_Q2_002_coefficient_12_0288
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0289 : Poly :=
[
  term ((27444197433 : Rat) / 7401317245) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 289 for generator 12. -/
def ep_Q2_002_partial_12_0289 : Poly :=
[
  term ((54888394866 : Rat) / 7401317245) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27444197433 : Rat) / 7401317245) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((54888394866 : Rat) / 7401317245) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-27444197433 : Rat) / 7401317245) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 12. -/
theorem ep_Q2_002_partial_12_0289_valid :
    mulPoly ep_Q2_002_coefficient_12_0289
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0290 : Poly :=
[
  term ((-935097312362255067116073959278069102051386 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (15, 1)]
]

/-- Partial product 290 for generator 12. -/
def ep_Q2_002_partial_12_0290 : Poly :=
[
  term ((-1870194624724510134232147918556138204102772 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((935097312362255067116073959278069102051386 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (13, 1), (15, 1)],
  term ((-1870194624724510134232147918556138204102772 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((935097312362255067116073959278069102051386 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 12. -/
theorem ep_Q2_002_partial_12_0290_valid :
    mulPoly ep_Q2_002_coefficient_12_0290
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0291 : Poly :=
[
  term ((-150873213738 : Rat) / 7401317245) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 291 for generator 12. -/
def ep_Q2_002_partial_12_0291 : Poly :=
[
  term ((-301746427476 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((150873213738 : Rat) / 7401317245) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-301746427476 : Rat) / 7401317245) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((150873213738 : Rat) / 7401317245) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 12. -/
theorem ep_Q2_002_partial_12_0291_valid :
    mulPoly ep_Q2_002_coefficient_12_0291
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0292 : Poly :=
[
  term ((1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (15, 3)]
]

/-- Partial product 292 for generator 12. -/
def ep_Q2_002_partial_12_0292 : Poly :=
[
  term ((3395624986543086195623681179429696820996736 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((-1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (13, 1), (15, 3)],
  term ((3395624986543086195623681179429696820996736 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((-1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 12. -/
theorem ep_Q2_002_partial_12_0292_valid :
    mulPoly ep_Q2_002_coefficient_12_0292
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0293 : Poly :=
[
  term ((112126330424 : Rat) / 7401317245) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 293 for generator 12. -/
def ep_Q2_002_partial_12_0293 : Poly :=
[
  term ((224252660848 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((224252660848 : Rat) / 7401317245) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 12. -/
theorem ep_Q2_002_partial_12_0293_valid :
    mulPoly ep_Q2_002_coefficient_12_0293
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0294 : Poly :=
[
  term ((-369129408616449825776431273975176 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

/-- Partial product 294 for generator 12. -/
def ep_Q2_002_partial_12_0294 : Poly :=
[
  term ((-738258817232899651552862547950352 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2)],
  term ((369129408616449825776431273975176 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 2)],
  term ((-738258817232899651552862547950352 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 2)],
  term ((369129408616449825776431273975176 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 12. -/
theorem ep_Q2_002_partial_12_0294_valid :
    mulPoly ep_Q2_002_coefficient_12_0294
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0295 : Poly :=
[
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(13, 2), (15, 2)]
]

/-- Partial product 295 for generator 12. -/
def ep_Q2_002_partial_12_0295 : Poly :=
[
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (15, 2)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 2), (15, 2)],
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 12. -/
theorem ep_Q2_002_partial_12_0295_valid :
    mulPoly ep_Q2_002_coefficient_12_0295
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0296 : Poly :=
[
  term ((-587431012454266497548593624747935737394797 : Rat) / 1346818217520322526586147269553926167495) [(15, 2)]
]

/-- Partial product 296 for generator 12. -/
def ep_Q2_002_partial_12_0296 : Poly :=
[
  term ((-1174862024908532995097187249495871474789594 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (15, 2)],
  term ((587431012454266497548593624747935737394797 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 2)],
  term ((-1174862024908532995097187249495871474789594 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (15, 2)],
  term ((587431012454266497548593624747935737394797 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 12. -/
theorem ep_Q2_002_partial_12_0296_valid :
    mulPoly ep_Q2_002_coefficient_12_0296
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0297 : Poly :=
[
  term ((-156820563437 : Rat) / 88815806940) [(15, 2), (16, 1)]
]

/-- Partial product 297 for generator 12. -/
def ep_Q2_002_partial_12_0297 : Poly :=
[
  term ((-156820563437 : Rat) / 44407903470) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((156820563437 : Rat) / 88815806940) [(2, 2), (15, 2), (16, 1)],
  term ((-156820563437 : Rat) / 44407903470) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((156820563437 : Rat) / 88815806940) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 12. -/
theorem ep_Q2_002_partial_12_0297_valid :
    mulPoly ep_Q2_002_coefficient_12_0297
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0298 : Poly :=
[
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(15, 4)]
]

/-- Partial product 298 for generator 12. -/
def ep_Q2_002_partial_12_0298 : Poly :=
[
  term ((-6444878423005462202791831729930177525567104 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (15, 4)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 4)],
  term ((-6444878423005462202791831729930177525567104 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (15, 4)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 12. -/
theorem ep_Q2_002_partial_12_0298_valid :
    mulPoly ep_Q2_002_coefficient_12_0298
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0299 : Poly :=
[
  term ((-316951406728 : Rat) / 22203951735) [(15, 4), (16, 1)]
]

/-- Partial product 299 for generator 12. -/
def ep_Q2_002_partial_12_0299 : Poly :=
[
  term ((-633902813456 : Rat) / 22203951735) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((316951406728 : Rat) / 22203951735) [(2, 2), (15, 4), (16, 1)],
  term ((-633902813456 : Rat) / 22203951735) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((316951406728 : Rat) / 22203951735) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 12. -/
theorem ep_Q2_002_partial_12_0299_valid :
    mulPoly ep_Q2_002_coefficient_12_0299
        ep_Q2_002_generator_12_0200_0299 =
      ep_Q2_002_partial_12_0299 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_12_0200_0299 : List Poly :=
[
  ep_Q2_002_partial_12_0200,
  ep_Q2_002_partial_12_0201,
  ep_Q2_002_partial_12_0202,
  ep_Q2_002_partial_12_0203,
  ep_Q2_002_partial_12_0204,
  ep_Q2_002_partial_12_0205,
  ep_Q2_002_partial_12_0206,
  ep_Q2_002_partial_12_0207,
  ep_Q2_002_partial_12_0208,
  ep_Q2_002_partial_12_0209,
  ep_Q2_002_partial_12_0210,
  ep_Q2_002_partial_12_0211,
  ep_Q2_002_partial_12_0212,
  ep_Q2_002_partial_12_0213,
  ep_Q2_002_partial_12_0214,
  ep_Q2_002_partial_12_0215,
  ep_Q2_002_partial_12_0216,
  ep_Q2_002_partial_12_0217,
  ep_Q2_002_partial_12_0218,
  ep_Q2_002_partial_12_0219,
  ep_Q2_002_partial_12_0220,
  ep_Q2_002_partial_12_0221,
  ep_Q2_002_partial_12_0222,
  ep_Q2_002_partial_12_0223,
  ep_Q2_002_partial_12_0224,
  ep_Q2_002_partial_12_0225,
  ep_Q2_002_partial_12_0226,
  ep_Q2_002_partial_12_0227,
  ep_Q2_002_partial_12_0228,
  ep_Q2_002_partial_12_0229,
  ep_Q2_002_partial_12_0230,
  ep_Q2_002_partial_12_0231,
  ep_Q2_002_partial_12_0232,
  ep_Q2_002_partial_12_0233,
  ep_Q2_002_partial_12_0234,
  ep_Q2_002_partial_12_0235,
  ep_Q2_002_partial_12_0236,
  ep_Q2_002_partial_12_0237,
  ep_Q2_002_partial_12_0238,
  ep_Q2_002_partial_12_0239,
  ep_Q2_002_partial_12_0240,
  ep_Q2_002_partial_12_0241,
  ep_Q2_002_partial_12_0242,
  ep_Q2_002_partial_12_0243,
  ep_Q2_002_partial_12_0244,
  ep_Q2_002_partial_12_0245,
  ep_Q2_002_partial_12_0246,
  ep_Q2_002_partial_12_0247,
  ep_Q2_002_partial_12_0248,
  ep_Q2_002_partial_12_0249,
  ep_Q2_002_partial_12_0250,
  ep_Q2_002_partial_12_0251,
  ep_Q2_002_partial_12_0252,
  ep_Q2_002_partial_12_0253,
  ep_Q2_002_partial_12_0254,
  ep_Q2_002_partial_12_0255,
  ep_Q2_002_partial_12_0256,
  ep_Q2_002_partial_12_0257,
  ep_Q2_002_partial_12_0258,
  ep_Q2_002_partial_12_0259,
  ep_Q2_002_partial_12_0260,
  ep_Q2_002_partial_12_0261,
  ep_Q2_002_partial_12_0262,
  ep_Q2_002_partial_12_0263,
  ep_Q2_002_partial_12_0264,
  ep_Q2_002_partial_12_0265,
  ep_Q2_002_partial_12_0266,
  ep_Q2_002_partial_12_0267,
  ep_Q2_002_partial_12_0268,
  ep_Q2_002_partial_12_0269,
  ep_Q2_002_partial_12_0270,
  ep_Q2_002_partial_12_0271,
  ep_Q2_002_partial_12_0272,
  ep_Q2_002_partial_12_0273,
  ep_Q2_002_partial_12_0274,
  ep_Q2_002_partial_12_0275,
  ep_Q2_002_partial_12_0276,
  ep_Q2_002_partial_12_0277,
  ep_Q2_002_partial_12_0278,
  ep_Q2_002_partial_12_0279,
  ep_Q2_002_partial_12_0280,
  ep_Q2_002_partial_12_0281,
  ep_Q2_002_partial_12_0282,
  ep_Q2_002_partial_12_0283,
  ep_Q2_002_partial_12_0284,
  ep_Q2_002_partial_12_0285,
  ep_Q2_002_partial_12_0286,
  ep_Q2_002_partial_12_0287,
  ep_Q2_002_partial_12_0288,
  ep_Q2_002_partial_12_0289,
  ep_Q2_002_partial_12_0290,
  ep_Q2_002_partial_12_0291,
  ep_Q2_002_partial_12_0292,
  ep_Q2_002_partial_12_0293,
  ep_Q2_002_partial_12_0294,
  ep_Q2_002_partial_12_0295,
  ep_Q2_002_partial_12_0296,
  ep_Q2_002_partial_12_0297,
  ep_Q2_002_partial_12_0298,
  ep_Q2_002_partial_12_0299
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_12_0200_0299 : Poly :=
[
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((117530099766188738730213585768288 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9909457115148453116312284473072 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((-221331187933253564025651456986496 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-451079565063746083585909115347319670779310 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((-126682923755 : Rat) / 8881580694) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((955096054767820213715764753308696422106864 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((31131114268 : Rat) / 4440790347) [(2, 1), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(2, 1), (4, 1), (6, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (7, 1), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((140736108848 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-813954182528678755368651930410094381952296 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-25096887488 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-223632612107061684010985645510688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((2370606591097039217056346042880725080875204 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-12619833773 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1)],
  term ((53323790206862476260917094033792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((143493232074946280623259186363914408714656 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((21962661328 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((453089127865163734675508137847424 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-853251678587343666835905621355008 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3665325266919308560444948551146631909122304 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-390056290272 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((601590692018449238128553570718384 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1122157130352369150809424701265408 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-2974929153958204289320831293590737296304896 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-224252660848 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-2387589982721554083451970468453600774281488 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-1355464781152 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 3)],
  term ((352684980052 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((814835034818481040455114621785376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-1534486966188140497836179827262592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((6391074025768633430273472365831926049237136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 2), (15, 2)],
  term ((-352684980052 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((86787142909821121996005501427200 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-163436442883797717940765548902400 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((-3210885602608095167877929766547465057311984 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((-142190206492 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39301297778666436292606034499480 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1028375162601748848160704146304 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((1216986249132245596708816045055091710033328 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((60806042014 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((74011703742067365254813744792160 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (13, 2)],
  term ((-288535825982683434898530436618997631411696 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((-1176331948 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((550428539847665320091957093728992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-462516931851547216866867660645000 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1)],
  term ((-151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((871005999055541002526863064340000 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((407747656598132104991157255311878857057168 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((305308873194 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1036560020277438432808787235003264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2)],
  term ((801085872937177439230288898399201002087416 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-329858630762 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((130018763424 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-71602532231651981957647299895776 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((373608310427571194374134273719634199422648 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36837899376227938001289825851148 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-174005392874755124850753070278905744804724 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-2625159906 : Rat) / 1480263449) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((60329084463266493551152918921920 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (15, 3)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 2)],
  term ((-12568671407467274059296 : Rat) / 253528477699481291099) [(2, 1), (4, 1), (12, 1)],
  term ((-486566702894296909794929181042495568720032 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-769992184 : Rat) / 211466207) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((134840977327407613163022096619392 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 2)],
  term ((-223781464948149524906322960904403808783168 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((54888394866 : Rat) / 7401317245) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1870194624724510134232147918556138204102772 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-301746427476 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((3395624986543086195623681179429696820996736 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((224252660848 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-738258817232899651552862547950352 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2)],
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (15, 2)],
  term ((-1174862024908532995097187249495871474789594 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (15, 2)],
  term ((-156820563437 : Rat) / 44407903470) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-6444878423005462202791831729930177525567104 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (15, 4)],
  term ((-633902813456 : Rat) / 22203951735) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (11, 1), (15, 2)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(2, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4954728557574226558156142236536 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (13, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (13, 1), (15, 2)],
  term ((225539782531873041792954557673659835389655 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (15, 1)],
  term ((126682923755 : Rat) / 17763161388) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (5, 1), (15, 3)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 2), (5, 1), (15, 3), (16, 1)],
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(2, 2), (6, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (7, 1), (11, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (7, 1), (13, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (7, 1), (15, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(2, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (9, 1), (11, 1)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (9, 1), (13, 1)],
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (6, 1), (9, 1), (15, 1)],
  term ((-70368054424 : Rat) / 7401317245) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((406977091264339377684325965205047190976148 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (11, 1), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((111816306053530842005492822755344 : Rat) / 1273790490336191187829975377157) [(2, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1185303295548519608528173021440362540437602 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (6, 1), (15, 2)],
  term ((12619833773 : Rat) / 14802634490) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (11, 1)],
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (8, 1), (13, 1)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (8, 1), (15, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(2, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (9, 1), (15, 2)],
  term ((195028145136 : Rat) / 7401317245) [(2, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-300795346009224619064276785359192 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (11, 1), (15, 2)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((561078565176184575404712350632704 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 1)],
  term ((1487464576979102144660415646795368648152448 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((112126330424 : Rat) / 7401317245) [(2, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((1193794991360777041725985234226800387140744 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 1)],
  term ((677732390576 : Rat) / 22203951735) [(2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 1), (15, 3)],
  term ((-176342490026 : Rat) / 22203951735) [(2, 2), (7, 1), (15, 3), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (11, 1), (15, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 2), (7, 2), (13, 1), (15, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (7, 2), (15, 2)],
  term ((176342490026 : Rat) / 7401317245) [(2, 2), (7, 2), (15, 2), (16, 1)],
  term ((-43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (9, 1), (11, 1)],
  term ((81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (9, 1), (13, 1)],
  term ((1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((71095103246 : Rat) / 7401317245) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((514187581300874424080352073152 : Rat) / 97983883872014706756151952089) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((-608493124566122798354408022527545855016664 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-30403021007 : Rat) / 7401317245) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (13, 2)],
  term ((144267912991341717449265218309498815705848 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (15, 2)],
  term ((588165974 : Rat) / 7401317245) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-275214269923832660045978546864496 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1)],
  term ((231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((-435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-152654436597 : Rat) / 7401317245) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((518280010138719216404393617501632 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((-400542936468588719615144449199600501043708 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (15, 1)],
  term ((164929315381 : Rat) / 7401317245) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (15, 3)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 2), (9, 1), (15, 3), (16, 1)],
  term ((35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-186804155213785597187067136859817099711324 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18418949688113969000644912925574 : Rat) / 115799135485108289802725034287) [(2, 2), (11, 1), (13, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((87002696437377562425376535139452872402362 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (11, 1), (15, 1)],
  term ((1312579953 : Rat) / 1480263449) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (15, 3)],
  term ((3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2)],
  term ((6284335703733637029648 : Rat) / 253528477699481291099) [(2, 2), (12, 1)],
  term ((243283351447148454897464590521247784360016 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((384996092 : Rat) / 211466207) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1), (13, 2)],
  term ((111890732474074762453161480452201904391584 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (15, 2)],
  term ((-27444197433 : Rat) / 7401317245) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((935097312362255067116073959278069102051386 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (13, 1), (15, 1)],
  term ((150873213738 : Rat) / 7401317245) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (13, 1), (15, 3)],
  term ((-112126330424 : Rat) / 7401317245) [(2, 2), (13, 1), (15, 3), (16, 1)],
  term ((369129408616449825776431273975176 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 2)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 2), (13, 2), (15, 2)],
  term ((587431012454266497548593624747935737394797 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 2)],
  term ((156820563437 : Rat) / 88815806940) [(2, 2), (15, 2), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (15, 4)],
  term ((316951406728 : Rat) / 22203951735) [(2, 2), (15, 4), (16, 1)],
  term ((-1069891365385373922720 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (6, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (7, 1), (13, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((140736108848 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-813954182528678755368651930410094381952296 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-25096887488 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-223632612107061684010985645510688 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((2370606591097039217056346042880725080875204 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-12619833773 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1)],
  term ((53323790206862476260917094033792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((143493232074946280623259186363914408714656 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((21962661328 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((453089127865163734675508137847424 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-853251678587343666835905621355008 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3665325266919308560444948551146631909122304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-390056290272 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((601590692018449238128553570718384 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1), (15, 2)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (12, 1), (13, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((112126330424 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1122157130352369150809424701265408 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-2974929153958204289320831293590737296304896 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2)],
  term ((-224252660848 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1)],
  term ((-2387589982721554083451970468453600774281488 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1355464781152 : Rat) / 22203951735) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 3)],
  term ((352684980052 : Rat) / 22203951735) [(3, 1), (5, 1), (7, 1), (15, 3), (16, 1)],
  term ((814835034818481040455114621785376 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 2), (11, 1), (15, 1)],
  term ((-1534486966188140497836179827262592 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1)],
  term ((6391074025768633430273472365831926049237136 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 2), (15, 2)],
  term ((-352684980052 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 2), (15, 2), (16, 1)],
  term ((86787142909821121996005501427200 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)],
  term ((-163436442883797717940765548902400 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((-3210885602608095167877929766547465057311984 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-142190206492 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39301297778666436292606034499480 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)],
  term ((-1028375162601748848160704146304 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((1216986249132245596708816045055091710033328 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((60806042014 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((74011703742067365254813744792160 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (13, 2)],
  term ((-288535825982683434898530436618997631411696 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((-1176331948 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((550428539847665320091957093728992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-462516931851547216866867660645000 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((-151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2)],
  term ((871005999055541002526863064340000 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((407747656598132104991157255311878857057168 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((305308873194 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1036560020277438432808787235003264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1), (15, 2)],
  term ((801085872937177439230288898399201002087416 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-329858630762 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 3)],
  term ((130018763424 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 3), (16, 1)],
  term ((-71602532231651981957647299895776 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((373608310427571194374134273719634199422648 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((36837899376227938001289825851148 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-174005392874755124850753070278905744804724 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-2625159906 : Rat) / 1480263449) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((60329084463266493551152918921920 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (15, 3)],
  term ((-7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 2)],
  term ((-12568671407467274059296 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (12, 1)],
  term ((-486566702894296909794929181042495568720032 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-769992184 : Rat) / 211466207) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((134840977327407613163022096619392 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((-223781464948149524906322960904403808783168 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((54888394866 : Rat) / 7401317245) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1870194624724510134232147918556138204102772 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-301746427476 : Rat) / 7401317245) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((3395624986543086195623681179429696820996736 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((224252660848 : Rat) / 7401317245) [(3, 1), (5, 1), (13, 1), (15, 3), (16, 1)],
  term ((-738258817232899651552862547950352 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 2)],
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((-1174862024908532995097187249495871474789594 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (15, 2)],
  term ((-156820563437 : Rat) / 44407903470) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-6444878423005462202791831729930177525567104 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (15, 4)],
  term ((-633902813456 : Rat) / 22203951735) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((117530099766188738730213585768288 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1), (15, 2)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (12, 1), (13, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((112126330424 : Rat) / 7401317245) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-9909457115148453116312284473072 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 2), (13, 1)],
  term ((-221331187933253564025651456986496 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (13, 1), (15, 2)],
  term ((-451079565063746083585909115347319670779310 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 2), (15, 1)],
  term ((-126682923755 : Rat) / 8881580694) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((955096054767820213715764753308696422106864 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 2), (15, 3)],
  term ((31131114268 : Rat) / 4440790347) [(3, 1), (5, 2), (15, 3), (16, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4954728557574226558156142236536 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (13, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((225539782531873041792954557673659835389655 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (15, 1)],
  term ((126682923755 : Rat) / 17763161388) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 1), (15, 3)],
  term ((-15565557134 : Rat) / 4440790347) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(3, 2), (6, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (7, 1), (11, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (7, 1), (13, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (7, 1), (15, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(3, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (9, 1), (11, 1)],
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (9, 1), (13, 1)],
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (6, 1), (9, 1), (15, 1)],
  term ((-70368054424 : Rat) / 7401317245) [(3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((406977091264339377684325965205047190976148 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (11, 1), (15, 1)],
  term ((12548443744 : Rat) / 7401317245) [(3, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((111816306053530842005492822755344 : Rat) / 1273790490336191187829975377157) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1185303295548519608528173021440362540437602 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (6, 1), (15, 2)],
  term ((12619833773 : Rat) / 14802634490) [(3, 2), (6, 1), (15, 2), (16, 1)],
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (8, 1), (11, 1)],
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (8, 1), (13, 1)],
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (8, 1), (15, 1)],
  term ((-10981330664 : Rat) / 7401317245) [(3, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (9, 1), (15, 2)],
  term ((195028145136 : Rat) / 7401317245) [(3, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-300795346009224619064276785359192 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (11, 1), (15, 2)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((561078565176184575404712350632704 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 1)],
  term ((1487464576979102144660415646795368648152448 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((112126330424 : Rat) / 7401317245) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((1193794991360777041725985234226800387140744 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 1)],
  term ((677732390576 : Rat) / 22203951735) [(3, 2), (7, 1), (15, 1), (16, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 1), (15, 3)],
  term ((-176342490026 : Rat) / 22203951735) [(3, 2), (7, 1), (15, 3), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (11, 1), (15, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 2), (7, 2), (13, 1), (15, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (7, 2), (15, 2)],
  term ((176342490026 : Rat) / 7401317245) [(3, 2), (7, 2), (15, 2), (16, 1)],
  term ((-43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (9, 1), (11, 1)],
  term ((81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (9, 1), (13, 1)],
  term ((1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((71095103246 : Rat) / 7401317245) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((514187581300874424080352073152 : Rat) / 97983883872014706756151952089) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-608493124566122798354408022527545855016664 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((-30403021007 : Rat) / 7401317245) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (13, 2)],
  term ((144267912991341717449265218309498815705848 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (15, 2)],
  term ((588165974 : Rat) / 7401317245) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-275214269923832660045978546864496 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1)],
  term ((231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-152654436597 : Rat) / 7401317245) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((518280010138719216404393617501632 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-400542936468588719615144449199600501043708 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (15, 1)],
  term ((164929315381 : Rat) / 7401317245) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (15, 3)],
  term ((-65009381712 : Rat) / 7401317245) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-186804155213785597187067136859817099711324 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6274221872 : Rat) / 7401317245) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18418949688113969000644912925574 : Rat) / 115799135485108289802725034287) [(3, 2), (11, 1), (13, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((87002696437377562425376535139452872402362 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (11, 1), (15, 1)],
  term ((1312579953 : Rat) / 1480263449) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (15, 3)],
  term ((3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2)],
  term ((6284335703733637029648 : Rat) / 253528477699481291099) [(3, 2), (12, 1)],
  term ((243283351447148454897464590521247784360016 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((384996092 : Rat) / 211466207) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1), (13, 2)],
  term ((111890732474074762453161480452201904391584 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (15, 2)],
  term ((-27444197433 : Rat) / 7401317245) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((935097312362255067116073959278069102051386 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (13, 1), (15, 1)],
  term ((150873213738 : Rat) / 7401317245) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (13, 1), (15, 3)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((369129408616449825776431273975176 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 2)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 2), (15, 2)],
  term ((587431012454266497548593624747935737394797 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 2)],
  term ((156820563437 : Rat) / 88815806940) [(3, 2), (15, 2), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 4)],
  term ((316951406728 : Rat) / 22203951735) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 200 through 299. -/
theorem ep_Q2_002_block_12_0200_0299_valid :
    checkProductSumEq ep_Q2_002_partials_12_0200_0299
      ep_Q2_002_block_12_0200_0299 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
