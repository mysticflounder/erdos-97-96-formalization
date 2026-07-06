/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 4:300-344

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_04_0300_0344 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0300 : Poly :=
[
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 300 for generator 4. -/
def ep_Q2_002_partial_04_0300 : Poly :=
[
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem ep_Q2_002_partial_04_0300_valid :
    mulPoly ep_Q2_002_coefficient_04_0300
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0301 : Poly :=
[
  term ((-71095103246 : Rat) / 7401317245) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 4. -/
def ep_Q2_002_partial_04_0301 : Poly :=
[
  term ((-71095103246 : Rat) / 7401317245) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-71095103246 : Rat) / 7401317245) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((71095103246 : Rat) / 7401317245) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((71095103246 : Rat) / 7401317245) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem ep_Q2_002_partial_04_0301_valid :
    mulPoly ep_Q2_002_coefficient_04_0301
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0302 : Poly :=
[
  term ((-25172761575071783770672941586584 : Rat) / 97983883872014706756151952089) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 302 for generator 4. -/
def ep_Q2_002_partial_04_0302 : Poly :=
[
  term ((-25172761575071783770672941586584 : Rat) / 97983883872014706756151952089) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((-25172761575071783770672941586584 : Rat) / 97983883872014706756151952089) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((25172761575071783770672941586584 : Rat) / 97983883872014706756151952089) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((25172761575071783770672941586584 : Rat) / 97983883872014706756151952089) [(8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem ep_Q2_002_partial_04_0302_valid :
    mulPoly ep_Q2_002_coefficient_04_0302
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0303 : Poly :=
[
  term ((6171825770447822578501211991770483885208 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 303 for generator 4. -/
def ep_Q2_002_partial_04_0303 : Poly :=
[
  term ((6171825770447822578501211991770483885208 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((6171825770447822578501211991770483885208 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-6171825770447822578501211991770483885208 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-6171825770447822578501211991770483885208 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem ep_Q2_002_partial_04_0303_valid :
    mulPoly ep_Q2_002_coefficient_04_0303
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0304 : Poly :=
[
  term ((160906864 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 4. -/
def ep_Q2_002_partial_04_0304 : Poly :=
[
  term ((160906864 : Rat) / 1480263449) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((160906864 : Rat) / 1480263449) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-160906864 : Rat) / 1480263449) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-160906864 : Rat) / 1480263449) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem ep_Q2_002_partial_04_0304_valid :
    mulPoly ep_Q2_002_coefficient_04_0304
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0305 : Poly :=
[
  term ((3642043970492357637458778212700 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

/-- Partial product 305 for generator 4. -/
def ep_Q2_002_partial_04_0305 : Poly :=
[
  term ((3642043970492357637458778212700 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 2)],
  term ((3642043970492357637458778212700 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 2)],
  term ((-3642043970492357637458778212700 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 2), (11, 2)],
  term ((-3642043970492357637458778212700 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem ep_Q2_002_partial_04_0305_valid :
    mulPoly ep_Q2_002_coefficient_04_0305
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0306 : Poly :=
[
  term ((-201017857804768110679694755739871964634520 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 306 for generator 4. -/
def ep_Q2_002_partial_04_0306 : Poly :=
[
  term ((-201017857804768110679694755739871964634520 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-201017857804768110679694755739871964634520 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((201017857804768110679694755739871964634520 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((201017857804768110679694755739871964634520 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem ep_Q2_002_partial_04_0306_valid :
    mulPoly ep_Q2_002_coefficient_04_0306
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0307 : Poly :=
[
  term ((34927955260 : Rat) / 1480263449) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 4. -/
def ep_Q2_002_partial_04_0307 : Poly :=
[
  term ((34927955260 : Rat) / 1480263449) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((34927955260 : Rat) / 1480263449) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34927955260 : Rat) / 1480263449) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-34927955260 : Rat) / 1480263449) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem ep_Q2_002_partial_04_0307_valid :
    mulPoly ep_Q2_002_coefficient_04_0307
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0308 : Poly :=
[
  term ((54849926413250237357597600963424 : Rat) / 115799135485108289802725034287) [(8, 1), (13, 2)]
]

/-- Partial product 308 for generator 4. -/
def ep_Q2_002_partial_04_0308 : Poly :=
[
  term ((54849926413250237357597600963424 : Rat) / 115799135485108289802725034287) [(2, 2), (8, 1), (13, 2)],
  term ((54849926413250237357597600963424 : Rat) / 115799135485108289802725034287) [(3, 2), (8, 1), (13, 2)],
  term ((-54849926413250237357597600963424 : Rat) / 115799135485108289802725034287) [(8, 1), (10, 2), (13, 2)],
  term ((-54849926413250237357597600963424 : Rat) / 115799135485108289802725034287) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem ep_Q2_002_partial_04_0308_valid :
    mulPoly ep_Q2_002_coefficient_04_0308
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0309 : Poly :=
[
  term ((781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 309 for generator 4. -/
def ep_Q2_002_partial_04_0309 : Poly :=
[
  term ((781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (15, 2)],
  term ((781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (15, 2)],
  term ((-781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 2), (15, 2)],
  term ((-781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem ep_Q2_002_partial_04_0309_valid :
    mulPoly ep_Q2_002_coefficient_04_0309
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0310 : Poly :=
[
  term ((41805008824 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 310 for generator 4. -/
def ep_Q2_002_partial_04_0310 : Poly :=
[
  term ((41805008824 : Rat) / 7401317245) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((41805008824 : Rat) / 7401317245) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-41805008824 : Rat) / 7401317245) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-41805008824 : Rat) / 7401317245) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 4. -/
theorem ep_Q2_002_partial_04_0310_valid :
    mulPoly ep_Q2_002_coefficient_04_0310
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0311 : Poly :=
[
  term ((48480463857166771381551923884848 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 311 for generator 4. -/
def ep_Q2_002_partial_04_0311 : Poly :=
[
  term ((48480463857166771381551923884848 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1)],
  term ((48480463857166771381551923884848 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1)],
  term ((-48480463857166771381551923884848 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 1)],
  term ((-48480463857166771381551923884848 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 4. -/
theorem ep_Q2_002_partial_04_0311_valid :
    mulPoly ep_Q2_002_coefficient_04_0311
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0312 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 312 for generator 4. -/
def ep_Q2_002_partial_04_0312 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 4. -/
theorem ep_Q2_002_partial_04_0312_valid :
    mulPoly ep_Q2_002_coefficient_04_0312
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0313 : Poly :=
[
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 313 for generator 4. -/
def ep_Q2_002_partial_04_0313 : Poly :=
[
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 4. -/
theorem ep_Q2_002_partial_04_0313_valid :
    mulPoly ep_Q2_002_coefficient_04_0313
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0314 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 314 for generator 4. -/
def ep_Q2_002_partial_04_0314 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 4. -/
theorem ep_Q2_002_partial_04_0314_valid :
    mulPoly ep_Q2_002_coefficient_04_0314
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0315 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 315 for generator 4. -/
def ep_Q2_002_partial_04_0315 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((32504690856 : Rat) / 7401317245) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(9, 1), (11, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 4. -/
theorem ep_Q2_002_partial_04_0315_valid :
    mulPoly ep_Q2_002_coefficient_04_0315
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0316 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 316 for generator 4. -/
def ep_Q2_002_partial_04_0316 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 4. -/
theorem ep_Q2_002_partial_04_0316_valid :
    mulPoly ep_Q2_002_coefficient_04_0316
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0317 : Poly :=
[
  term ((-91297792466851790775095146190016 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 317 for generator 4. -/
def ep_Q2_002_partial_04_0317 : Poly :=
[
  term ((-91297792466851790775095146190016 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1)],
  term ((-91297792466851790775095146190016 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1)],
  term ((91297792466851790775095146190016 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (13, 1)],
  term ((91297792466851790775095146190016 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 4. -/
theorem ep_Q2_002_partial_04_0317_valid :
    mulPoly ep_Q2_002_coefficient_04_0317
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0318 : Poly :=
[
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 318 for generator 4. -/
def ep_Q2_002_partial_04_0318 : Poly :=
[
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 4. -/
theorem ep_Q2_002_partial_04_0318_valid :
    mulPoly ep_Q2_002_coefficient_04_0318
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0319 : Poly :=
[
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 319 for generator 4. -/
def ep_Q2_002_partial_04_0319 : Poly :=
[
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 4. -/
theorem ep_Q2_002_partial_04_0319_valid :
    mulPoly ep_Q2_002_coefficient_04_0319
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0320 : Poly :=
[
  term ((-13300676832 : Rat) / 7401317245) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 4. -/
def ep_Q2_002_partial_04_0320 : Poly :=
[
  term ((-13300676832 : Rat) / 7401317245) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((13300676832 : Rat) / 7401317245) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((13300676832 : Rat) / 7401317245) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 4. -/
theorem ep_Q2_002_partial_04_0320_valid :
    mulPoly ep_Q2_002_coefficient_04_0320
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0321 : Poly :=
[
  term ((-916054843175492765834690427290197701471084 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 1)]
]

/-- Partial product 321 for generator 4. -/
def ep_Q2_002_partial_04_0321 : Poly :=
[
  term ((-916054843175492765834690427290197701471084 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (15, 1)],
  term ((-916054843175492765834690427290197701471084 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (15, 1)],
  term ((916054843175492765834690427290197701471084 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 2), (15, 1)],
  term ((916054843175492765834690427290197701471084 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 4. -/
theorem ep_Q2_002_partial_04_0321_valid :
    mulPoly ep_Q2_002_coefficient_04_0321
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0322 : Poly :=
[
  term ((-55782678687 : Rat) / 7401317245) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 4. -/
def ep_Q2_002_partial_04_0322 : Poly :=
[
  term ((-55782678687 : Rat) / 7401317245) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-55782678687 : Rat) / 7401317245) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((55782678687 : Rat) / 7401317245) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((55782678687 : Rat) / 7401317245) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 4. -/
theorem ep_Q2_002_partial_04_0322_valid :
    mulPoly ep_Q2_002_coefficient_04_0322
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0323 : Poly :=
[
  term ((-16849924788495108102592597501536 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 323 for generator 4. -/
def ep_Q2_002_partial_04_0323 : Poly :=
[
  term ((-16849924788495108102592597501536 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-16849924788495108102592597501536 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((16849924788495108102592597501536 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((16849924788495108102592597501536 : Rat) / 1273790490336191187829975377157) [(11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 4. -/
theorem ep_Q2_002_partial_04_0323_valid :
    mulPoly ep_Q2_002_coefficient_04_0323
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0324 : Poly :=
[
  term ((69992407336063524658559824583046908046276 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 324 for generator 4. -/
def ep_Q2_002_partial_04_0324 : Poly :=
[
  term ((69992407336063524658559824583046908046276 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((69992407336063524658559824583046908046276 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-69992407336063524658559824583046908046276 : Rat) / 269363643504064505317229453910785233499) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-69992407336063524658559824583046908046276 : Rat) / 269363643504064505317229453910785233499) [(11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 4. -/
theorem ep_Q2_002_partial_04_0324_valid :
    mulPoly ep_Q2_002_coefficient_04_0324
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0325 : Poly :=
[
  term ((5232948591 : Rat) / 1480263449) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 4. -/
def ep_Q2_002_partial_04_0325 : Poly :=
[
  term ((5232948591 : Rat) / 1480263449) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((5232948591 : Rat) / 1480263449) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5232948591 : Rat) / 1480263449) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5232948591 : Rat) / 1480263449) [(11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 4. -/
theorem ep_Q2_002_partial_04_0325_valid :
    mulPoly ep_Q2_002_coefficient_04_0325
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0326 : Poly :=
[
  term ((-313472932579957947925233745285632 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

/-- Partial product 326 for generator 4. -/
def ep_Q2_002_partial_04_0326 : Poly :=
[
  term ((-313472932579957947925233745285632 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1)],
  term ((-313472932579957947925233745285632 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1)],
  term ((313472932579957947925233745285632 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 1), (13, 1)],
  term ((313472932579957947925233745285632 : Rat) / 1273790490336191187829975377157) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 4. -/
theorem ep_Q2_002_partial_04_0326_valid :
    mulPoly ep_Q2_002_coefficient_04_0326
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0327 : Poly :=
[
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 327 for generator 4. -/
def ep_Q2_002_partial_04_0327 : Poly :=
[
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 4. -/
theorem ep_Q2_002_partial_04_0327_valid :
    mulPoly ep_Q2_002_coefficient_04_0327
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0328 : Poly :=
[
  term ((11433777361275135295131356186421372328129 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 1)]
]

/-- Partial product 328 for generator 4. -/
def ep_Q2_002_partial_04_0328 : Poly :=
[
  term ((11433777361275135295131356186421372328129 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (15, 1)],
  term ((11433777361275135295131356186421372328129 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (15, 1)],
  term ((-11433777361275135295131356186421372328129 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (11, 1), (15, 1)],
  term ((-11433777361275135295131356186421372328129 : Rat) / 1346818217520322526586147269553926167495) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 4. -/
theorem ep_Q2_002_partial_04_0328_valid :
    mulPoly ep_Q2_002_coefficient_04_0328
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0329 : Poly :=
[
  term ((-667466791111 : Rat) / 88815806940) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 329 for generator 4. -/
def ep_Q2_002_partial_04_0329 : Poly :=
[
  term ((-667466791111 : Rat) / 88815806940) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-667466791111 : Rat) / 88815806940) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((667466791111 : Rat) / 88815806940) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((667466791111 : Rat) / 88815806940) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 4. -/
theorem ep_Q2_002_partial_04_0329_valid :
    mulPoly ep_Q2_002_coefficient_04_0329
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0330 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 3)]
]

/-- Partial product 330 for generator 4. -/
def ep_Q2_002_partial_04_0330 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (15, 3)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (15, 3)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (11, 1), (15, 3)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 4. -/
theorem ep_Q2_002_partial_04_0330_valid :
    mulPoly ep_Q2_002_coefficient_04_0330
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0331 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 331 for generator 4. -/
def ep_Q2_002_partial_04_0331 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((158475703364 : Rat) / 22203951735) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((158475703364 : Rat) / 22203951735) [(11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 4. -/
theorem ep_Q2_002_partial_04_0331_valid :
    mulPoly ep_Q2_002_coefficient_04_0331
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0332 : Poly :=
[
  term ((90005468435085242133022362689682 : Rat) / 1273790490336191187829975377157) [(11, 2)]
]

/-- Partial product 332 for generator 4. -/
def ep_Q2_002_partial_04_0332 : Poly :=
[
  term ((90005468435085242133022362689682 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2)],
  term ((90005468435085242133022362689682 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2)],
  term ((-90005468435085242133022362689682 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 2)],
  term ((-90005468435085242133022362689682 : Rat) / 1273790490336191187829975377157) [(11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 4. -/
theorem ep_Q2_002_partial_04_0332_valid :
    mulPoly ep_Q2_002_coefficient_04_0332
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0333 : Poly :=
[
  term ((-27373392694851025780559708692488 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1)]
]

/-- Partial product 333 for generator 4. -/
def ep_Q2_002_partial_04_0333 : Poly :=
[
  term ((-27373392694851025780559708692488 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (12, 1)],
  term ((-27373392694851025780559708692488 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (12, 1)],
  term ((27373392694851025780559708692488 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 2), (12, 1)],
  term ((27373392694851025780559708692488 : Rat) / 1273790490336191187829975377157) [(11, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 4. -/
theorem ep_Q2_002_partial_04_0333_valid :
    mulPoly ep_Q2_002_coefficient_04_0333
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0334 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(11, 2), (15, 2)]
]

/-- Partial product 334 for generator 4. -/
def ep_Q2_002_partial_04_0334 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (15, 2)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (15, 2)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 2), (15, 2)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 4. -/
theorem ep_Q2_002_partial_04_0334_valid :
    mulPoly ep_Q2_002_coefficient_04_0334
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0335 : Poly :=
[
  term ((-585996407253540405212977727410089342799872 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 335 for generator 4. -/
def ep_Q2_002_partial_04_0335 : Poly :=
[
  term ((-585996407253540405212977727410089342799872 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-585996407253540405212977727410089342799872 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((585996407253540405212977727410089342799872 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((585996407253540405212977727410089342799872 : Rat) / 1346818217520322526586147269553926167495) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 4. -/
theorem ep_Q2_002_partial_04_0335_valid :
    mulPoly ep_Q2_002_coefficient_04_0335
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0336 : Poly :=
[
  term ((31500315664 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 4. -/
def ep_Q2_002_partial_04_0336 : Poly :=
[
  term ((31500315664 : Rat) / 7401317245) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((31500315664 : Rat) / 7401317245) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31500315664 : Rat) / 7401317245) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31500315664 : Rat) / 7401317245) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 4. -/
theorem ep_Q2_002_partial_04_0336_valid :
    mulPoly ep_Q2_002_coefficient_04_0336
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0337 : Poly :=
[
  term ((128808407735676375380376949983744 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)]
]

/-- Partial product 337 for generator 4. -/
def ep_Q2_002_partial_04_0337 : Poly :=
[
  term ((128808407735676375380376949983744 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1), (13, 2)],
  term ((128808407735676375380376949983744 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1), (13, 2)],
  term ((-128808407735676375380376949983744 : Rat) / 1273790490336191187829975377157) [(10, 2), (12, 1), (13, 2)],
  term ((-128808407735676375380376949983744 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 4. -/
theorem ep_Q2_002_partial_04_0337_valid :
    mulPoly ep_Q2_002_coefficient_04_0337
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0338 : Poly :=
[
  term ((1391133808436694183360994265278212848472 : Rat) / 103601401347717117429703636119532782115) [(12, 1), (15, 2)]
]

/-- Partial product 338 for generator 4. -/
def ep_Q2_002_partial_04_0338 : Poly :=
[
  term ((1391133808436694183360994265278212848472 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (12, 1), (15, 2)],
  term ((1391133808436694183360994265278212848472 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (12, 1), (15, 2)],
  term ((-1391133808436694183360994265278212848472 : Rat) / 103601401347717117429703636119532782115) [(10, 2), (12, 1), (15, 2)],
  term ((-1391133808436694183360994265278212848472 : Rat) / 103601401347717117429703636119532782115) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 4. -/
theorem ep_Q2_002_partial_04_0338_valid :
    mulPoly ep_Q2_002_coefficient_04_0338
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0339 : Poly :=
[
  term ((-34433157082 : Rat) / 7401317245) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 339 for generator 4. -/
def ep_Q2_002_partial_04_0339 : Poly :=
[
  term ((-34433157082 : Rat) / 7401317245) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-34433157082 : Rat) / 7401317245) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((34433157082 : Rat) / 7401317245) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((34433157082 : Rat) / 7401317245) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 4. -/
theorem ep_Q2_002_partial_04_0339_valid :
    mulPoly ep_Q2_002_coefficient_04_0339
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0340 : Poly :=
[
  term ((988648627184642432736247518746822741251788 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (15, 1)]
]

/-- Partial product 340 for generator 4. -/
def ep_Q2_002_partial_04_0340 : Poly :=
[
  term ((988648627184642432736247518746822741251788 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (13, 1), (15, 1)],
  term ((988648627184642432736247518746822741251788 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (13, 1), (15, 1)],
  term ((-988648627184642432736247518746822741251788 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (13, 1), (15, 1)],
  term ((-988648627184642432736247518746822741251788 : Rat) / 1346818217520322526586147269553926167495) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 4. -/
theorem ep_Q2_002_partial_04_0340_valid :
    mulPoly ep_Q2_002_coefficient_04_0340
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0341 : Poly :=
[
  term ((102494686169 : Rat) / 7401317245) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 4. -/
def ep_Q2_002_partial_04_0341 : Poly :=
[
  term ((102494686169 : Rat) / 7401317245) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((102494686169 : Rat) / 7401317245) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-102494686169 : Rat) / 7401317245) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-102494686169 : Rat) / 7401317245) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 4. -/
theorem ep_Q2_002_partial_04_0341_valid :
    mulPoly ep_Q2_002_coefficient_04_0341
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0342 : Poly :=
[
  term ((2429271261178649912055933855072 : Rat) / 11272482215364523786105976789) [(13, 2)]
]

/-- Partial product 342 for generator 4. -/
def ep_Q2_002_partial_04_0342 : Poly :=
[
  term ((2429271261178649912055933855072 : Rat) / 11272482215364523786105976789) [(2, 2), (13, 2)],
  term ((2429271261178649912055933855072 : Rat) / 11272482215364523786105976789) [(3, 2), (13, 2)],
  term ((-2429271261178649912055933855072 : Rat) / 11272482215364523786105976789) [(10, 2), (13, 2)],
  term ((-2429271261178649912055933855072 : Rat) / 11272482215364523786105976789) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 4. -/
theorem ep_Q2_002_partial_04_0342_valid :
    mulPoly ep_Q2_002_coefficient_04_0342
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0343 : Poly :=
[
  term ((-77813291273359217899923464903304046002030 : Rat) / 269363643504064505317229453910785233499) [(15, 2)]
]

/-- Partial product 343 for generator 4. -/
def ep_Q2_002_partial_04_0343 : Poly :=
[
  term ((-77813291273359217899923464903304046002030 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (15, 2)],
  term ((-77813291273359217899923464903304046002030 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (15, 2)],
  term ((77813291273359217899923464903304046002030 : Rat) / 269363643504064505317229453910785233499) [(10, 2), (15, 2)],
  term ((77813291273359217899923464903304046002030 : Rat) / 269363643504064505317229453910785233499) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 4. -/
theorem ep_Q2_002_partial_04_0343_valid :
    mulPoly ep_Q2_002_coefficient_04_0343
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0344 : Poly :=
[
  term ((-6973539639 : Rat) / 2960526898) [(15, 2), (16, 1)]
]

/-- Partial product 344 for generator 4. -/
def ep_Q2_002_partial_04_0344 : Poly :=
[
  term ((-6973539639 : Rat) / 2960526898) [(2, 2), (15, 2), (16, 1)],
  term ((-6973539639 : Rat) / 2960526898) [(3, 2), (15, 2), (16, 1)],
  term ((6973539639 : Rat) / 2960526898) [(10, 2), (15, 2), (16, 1)],
  term ((6973539639 : Rat) / 2960526898) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 4. -/
theorem ep_Q2_002_partial_04_0344_valid :
    mulPoly ep_Q2_002_coefficient_04_0344
        ep_Q2_002_generator_04_0300_0344 =
      ep_Q2_002_partial_04_0344 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_04_0300_0344 : List Poly :=
[
  ep_Q2_002_partial_04_0300,
  ep_Q2_002_partial_04_0301,
  ep_Q2_002_partial_04_0302,
  ep_Q2_002_partial_04_0303,
  ep_Q2_002_partial_04_0304,
  ep_Q2_002_partial_04_0305,
  ep_Q2_002_partial_04_0306,
  ep_Q2_002_partial_04_0307,
  ep_Q2_002_partial_04_0308,
  ep_Q2_002_partial_04_0309,
  ep_Q2_002_partial_04_0310,
  ep_Q2_002_partial_04_0311,
  ep_Q2_002_partial_04_0312,
  ep_Q2_002_partial_04_0313,
  ep_Q2_002_partial_04_0314,
  ep_Q2_002_partial_04_0315,
  ep_Q2_002_partial_04_0316,
  ep_Q2_002_partial_04_0317,
  ep_Q2_002_partial_04_0318,
  ep_Q2_002_partial_04_0319,
  ep_Q2_002_partial_04_0320,
  ep_Q2_002_partial_04_0321,
  ep_Q2_002_partial_04_0322,
  ep_Q2_002_partial_04_0323,
  ep_Q2_002_partial_04_0324,
  ep_Q2_002_partial_04_0325,
  ep_Q2_002_partial_04_0326,
  ep_Q2_002_partial_04_0327,
  ep_Q2_002_partial_04_0328,
  ep_Q2_002_partial_04_0329,
  ep_Q2_002_partial_04_0330,
  ep_Q2_002_partial_04_0331,
  ep_Q2_002_partial_04_0332,
  ep_Q2_002_partial_04_0333,
  ep_Q2_002_partial_04_0334,
  ep_Q2_002_partial_04_0335,
  ep_Q2_002_partial_04_0336,
  ep_Q2_002_partial_04_0337,
  ep_Q2_002_partial_04_0338,
  ep_Q2_002_partial_04_0339,
  ep_Q2_002_partial_04_0340,
  ep_Q2_002_partial_04_0341,
  ep_Q2_002_partial_04_0342,
  ep_Q2_002_partial_04_0343,
  ep_Q2_002_partial_04_0344
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_04_0300_0344 : Poly :=
[
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (9, 1), (15, 1)],
  term ((-71095103246 : Rat) / 7401317245) [(2, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-25172761575071783770672941586584 : Rat) / 97983883872014706756151952089) [(2, 2), (8, 1), (11, 1), (13, 1)],
  term ((6171825770447822578501211991770483885208 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (8, 1), (11, 1), (15, 1)],
  term ((160906864 : Rat) / 1480263449) [(2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3642043970492357637458778212700 : Rat) / 1273790490336191187829975377157) [(2, 2), (8, 1), (11, 2)],
  term ((-201017857804768110679694755739871964634520 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (8, 1), (13, 1), (15, 1)],
  term ((34927955260 : Rat) / 1480263449) [(2, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((54849926413250237357597600963424 : Rat) / 115799135485108289802725034287) [(2, 2), (8, 1), (13, 2)],
  term ((781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (8, 1), (15, 2)],
  term ((41805008824 : Rat) / 7401317245) [(2, 2), (8, 1), (15, 2), (16, 1)],
  term ((48480463857166771381551923884848 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-91297792466851790775095146190016 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-916054843175492765834690427290197701471084 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (9, 1), (15, 1)],
  term ((-55782678687 : Rat) / 7401317245) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16849924788495108102592597501536 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((69992407336063524658559824583046908046276 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((5232948591 : Rat) / 1480263449) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-313472932579957947925233745285632 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((11433777361275135295131356186421372328129 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (15, 1)],
  term ((-667466791111 : Rat) / 88815806940) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (11, 1), (15, 3)],
  term ((-158475703364 : Rat) / 22203951735) [(2, 2), (11, 1), (15, 3), (16, 1)],
  term ((90005468435085242133022362689682 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2)],
  term ((-27373392694851025780559708692488 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (12, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 2), (11, 2), (15, 2)],
  term ((-585996407253540405212977727410089342799872 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((31500315664 : Rat) / 7401317245) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((128808407735676375380376949983744 : Rat) / 1273790490336191187829975377157) [(2, 2), (12, 1), (13, 2)],
  term ((1391133808436694183360994265278212848472 : Rat) / 103601401347717117429703636119532782115) [(2, 2), (12, 1), (15, 2)],
  term ((-34433157082 : Rat) / 7401317245) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((988648627184642432736247518746822741251788 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (13, 1), (15, 1)],
  term ((102494686169 : Rat) / 7401317245) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((2429271261178649912055933855072 : Rat) / 11272482215364523786105976789) [(2, 2), (13, 2)],
  term ((-77813291273359217899923464903304046002030 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (15, 2)],
  term ((-6973539639 : Rat) / 2960526898) [(2, 2), (15, 2), (16, 1)],
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (9, 1), (15, 1)],
  term ((-71095103246 : Rat) / 7401317245) [(3, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-25172761575071783770672941586584 : Rat) / 97983883872014706756151952089) [(3, 2), (8, 1), (11, 1), (13, 1)],
  term ((6171825770447822578501211991770483885208 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (8, 1), (11, 1), (15, 1)],
  term ((160906864 : Rat) / 1480263449) [(3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3642043970492357637458778212700 : Rat) / 1273790490336191187829975377157) [(3, 2), (8, 1), (11, 2)],
  term ((-201017857804768110679694755739871964634520 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (8, 1), (13, 1), (15, 1)],
  term ((34927955260 : Rat) / 1480263449) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((54849926413250237357597600963424 : Rat) / 115799135485108289802725034287) [(3, 2), (8, 1), (13, 2)],
  term ((781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (8, 1), (15, 2)],
  term ((41805008824 : Rat) / 7401317245) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((48480463857166771381551923884848 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-91297792466851790775095146190016 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1)],
  term ((29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-13300676832 : Rat) / 7401317245) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-916054843175492765834690427290197701471084 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (9, 1), (15, 1)],
  term ((-55782678687 : Rat) / 7401317245) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-16849924788495108102592597501536 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((69992407336063524658559824583046908046276 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((5232948591 : Rat) / 1480263449) [(3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-313472932579957947925233745285632 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((11433777361275135295131356186421372328129 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (15, 1)],
  term ((-667466791111 : Rat) / 88815806940) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (11, 1), (15, 3)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 2), (11, 1), (15, 3), (16, 1)],
  term ((90005468435085242133022362689682 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2)],
  term ((-27373392694851025780559708692488 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (12, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 2), (11, 2), (15, 2)],
  term ((-585996407253540405212977727410089342799872 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((31500315664 : Rat) / 7401317245) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((128808407735676375380376949983744 : Rat) / 1273790490336191187829975377157) [(3, 2), (12, 1), (13, 2)],
  term ((1391133808436694183360994265278212848472 : Rat) / 103601401347717117429703636119532782115) [(3, 2), (12, 1), (15, 2)],
  term ((-34433157082 : Rat) / 7401317245) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((988648627184642432736247518746822741251788 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (13, 1), (15, 1)],
  term ((102494686169 : Rat) / 7401317245) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((2429271261178649912055933855072 : Rat) / 11272482215364523786105976789) [(3, 2), (13, 2)],
  term ((-77813291273359217899923464903304046002030 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (15, 2)],
  term ((-6973539639 : Rat) / 2960526898) [(3, 2), (15, 2), (16, 1)],
  term ((1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((71095103246 : Rat) / 7401317245) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((71095103246 : Rat) / 7401317245) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((25172761575071783770672941586584 : Rat) / 97983883872014706756151952089) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-6171825770447822578501211991770483885208 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-160906864 : Rat) / 1480263449) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3642043970492357637458778212700 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 2), (11, 2)],
  term ((201017857804768110679694755739871964634520 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-34927955260 : Rat) / 1480263449) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54849926413250237357597600963424 : Rat) / 115799135485108289802725034287) [(8, 1), (10, 2), (13, 2)],
  term ((-781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 2), (15, 2)],
  term ((-41805008824 : Rat) / 7401317245) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((201017857804768110679694755739871964634520 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-34927955260 : Rat) / 1480263449) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54849926413250237357597600963424 : Rat) / 115799135485108289802725034287) [(8, 1), (11, 2), (13, 2)],
  term ((-781190051557075007202419673669592000230468 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 2), (15, 2)],
  term ((-41805008824 : Rat) / 7401317245) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((25172761575071783770672941586584 : Rat) / 97983883872014706756151952089) [(8, 1), (11, 3), (13, 1)],
  term ((-6171825770447822578501211991770483885208 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 3), (15, 1)],
  term ((-160906864 : Rat) / 1480263449) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-3642043970492357637458778212700 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 4)],
  term ((-48480463857166771381551923884848 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 1), (13, 1), (15, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 2), (11, 1), (15, 2)],
  term ((-32504690856 : Rat) / 7401317245) [(9, 1), (10, 2), (11, 1), (15, 2), (16, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (11, 2), (15, 1)],
  term ((91297792466851790775095146190016 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (13, 1)],
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((13300676832 : Rat) / 7401317245) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((916054843175492765834690427290197701471084 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 2), (15, 1)],
  term ((55782678687 : Rat) / 7401317245) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((91297792466851790775095146190016 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 2), (13, 1)],
  term ((-29323612596206062772829820625472 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((856841788985404189695600919921764849563184 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 2), (14, 1), (15, 1)],
  term ((13300676832 : Rat) / 7401317245) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((916054843175492765834690427290197701471084 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 2), (15, 1)],
  term ((55782678687 : Rat) / 7401317245) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-48480463857166771381551923884848 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 3)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((15571267412058050922086150288016 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 3), (14, 1)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 3), (15, 2)],
  term ((-32504690856 : Rat) / 7401317245) [(9, 1), (11, 3), (15, 2), (16, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 4), (15, 1)],
  term ((16849924788495108102592597501536 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-69992407336063524658559824583046908046276 : Rat) / 269363643504064505317229453910785233499) [(10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-5232948591 : Rat) / 1480263449) [(10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((313472932579957947925233745285632 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 1), (13, 1)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 1), (13, 1), (15, 2)],
  term ((-11433777361275135295131356186421372328129 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (11, 1), (15, 1)],
  term ((667466791111 : Rat) / 88815806940) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (11, 1), (15, 3)],
  term ((158475703364 : Rat) / 22203951735) [(10, 2), (11, 1), (15, 3), (16, 1)],
  term ((-90005468435085242133022362689682 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 2)],
  term ((27373392694851025780559708692488 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 2), (12, 1)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(10, 2), (11, 2), (15, 2)],
  term ((585996407253540405212977727410089342799872 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (12, 1), (13, 1), (15, 1)],
  term ((-31500315664 : Rat) / 7401317245) [(10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128808407735676375380376949983744 : Rat) / 1273790490336191187829975377157) [(10, 2), (12, 1), (13, 2)],
  term ((-1391133808436694183360994265278212848472 : Rat) / 103601401347717117429703636119532782115) [(10, 2), (12, 1), (15, 2)],
  term ((34433157082 : Rat) / 7401317245) [(10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-988648627184642432736247518746822741251788 : Rat) / 1346818217520322526586147269553926167495) [(10, 2), (13, 1), (15, 1)],
  term ((-102494686169 : Rat) / 7401317245) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2429271261178649912055933855072 : Rat) / 11272482215364523786105976789) [(10, 2), (13, 2)],
  term ((77813291273359217899923464903304046002030 : Rat) / 269363643504064505317229453910785233499) [(10, 2), (15, 2)],
  term ((6973539639 : Rat) / 2960526898) [(10, 2), (15, 2), (16, 1)],
  term ((585996407253540405212977727410089342799872 : Rat) / 1346818217520322526586147269553926167495) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-31500315664 : Rat) / 7401317245) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128808407735676375380376949983744 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (13, 2)],
  term ((-1391133808436694183360994265278212848472 : Rat) / 103601401347717117429703636119532782115) [(11, 2), (12, 1), (15, 2)],
  term ((34433157082 : Rat) / 7401317245) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-988648627184642432736247518746822741251788 : Rat) / 1346818217520322526586147269553926167495) [(11, 2), (13, 1), (15, 1)],
  term ((-102494686169 : Rat) / 7401317245) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2429271261178649912055933855072 : Rat) / 11272482215364523786105976789) [(11, 2), (13, 2)],
  term ((77813291273359217899923464903304046002030 : Rat) / 269363643504064505317229453910785233499) [(11, 2), (15, 2)],
  term ((6973539639 : Rat) / 2960526898) [(11, 2), (15, 2), (16, 1)],
  term ((16849924788495108102592597501536 : Rat) / 1273790490336191187829975377157) [(11, 3), (12, 1), (13, 1)],
  term ((-69992407336063524658559824583046908046276 : Rat) / 269363643504064505317229453910785233499) [(11, 3), (12, 1), (15, 1)],
  term ((-5232948591 : Rat) / 1480263449) [(11, 3), (12, 1), (15, 1), (16, 1)],
  term ((313472932579957947925233745285632 : Rat) / 1273790490336191187829975377157) [(11, 3), (13, 1)],
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(11, 3), (13, 1), (15, 2)],
  term ((-11433777361275135295131356186421372328129 : Rat) / 1346818217520322526586147269553926167495) [(11, 3), (15, 1)],
  term ((667466791111 : Rat) / 88815806940) [(11, 3), (15, 1), (16, 1)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(11, 3), (15, 3)],
  term ((158475703364 : Rat) / 22203951735) [(11, 3), (15, 3), (16, 1)],
  term ((-90005468435085242133022362689682 : Rat) / 1273790490336191187829975377157) [(11, 4)],
  term ((27373392694851025780559708692488 : Rat) / 1273790490336191187829975377157) [(11, 4), (12, 1)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(11, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 344. -/
theorem ep_Q2_002_block_04_0300_0344_valid :
    checkProductSumEq ep_Q2_002_partials_04_0300_0344
      ep_Q2_002_block_04_0300_0344 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
