/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 5:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 5 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_05_0100_0199 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0100 : Poly :=
[
  term ((831652167821454348923098525929463676895048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 100 for generator 5. -/
def ep_Q2_002_partial_05_0100 : Poly :=
[
  term ((831652167821454348923098525929463676895048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (8, 1), (11, 1), (15, 1)],
  term ((831652167821454348923098525929463676895048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (8, 1), (11, 1), (15, 1)],
  term ((-831652167821454348923098525929463676895048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-831652167821454348923098525929463676895048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 5. -/
theorem ep_Q2_002_partial_05_0100_valid :
    mulPoly ep_Q2_002_coefficient_05_0100
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0101 : Poly :=
[
  term ((41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 5. -/
def ep_Q2_002_partial_05_0101 : Poly :=
[
  term ((41805008824 : Rat) / 7401317245) [(0, 1), (2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((41805008824 : Rat) / 7401317245) [(0, 1), (3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 5. -/
theorem ep_Q2_002_partial_05_0101_valid :
    mulPoly ep_Q2_002_coefficient_05_0101
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0102 : Poly :=
[
  term ((-30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2)]
]

/-- Partial product 102 for generator 5. -/
def ep_Q2_002_partial_05_0102 : Poly :=
[
  term ((-30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (8, 1), (11, 2)],
  term ((-30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (8, 1), (11, 2)],
  term ((30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2), (14, 2)],
  term ((30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 5. -/
theorem ep_Q2_002_partial_05_0102_valid :
    mulPoly ep_Q2_002_coefficient_05_0102
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0103 : Poly :=
[
  term ((-89876880476935414548839420437296 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 103 for generator 5. -/
def ep_Q2_002_partial_05_0103 : Poly :=
[
  term ((-89876880476935414548839420437296 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (8, 1), (13, 1), (15, 1)],
  term ((-89876880476935414548839420437296 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (8, 1), (13, 1), (15, 1)],
  term ((89876880476935414548839420437296 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((89876880476935414548839420437296 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 5. -/
theorem ep_Q2_002_partial_05_0103_valid :
    mulPoly ep_Q2_002_coefficient_05_0103
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0104 : Poly :=
[
  term ((409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 2)]
]

/-- Partial product 104 for generator 5. -/
def ep_Q2_002_partial_05_0104 : Poly :=
[
  term ((409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (8, 1), (15, 2)],
  term ((409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (8, 1), (15, 2)],
  term ((-409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 5. -/
theorem ep_Q2_002_partial_05_0104_valid :
    mulPoly ep_Q2_002_coefficient_05_0104
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0105 : Poly :=
[
  term ((-18957995568 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 5. -/
def ep_Q2_002_partial_05_0105 : Poly :=
[
  term ((-18957995568 : Rat) / 7401317245) [(0, 1), (2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-18957995568 : Rat) / 7401317245) [(0, 1), (3, 2), (8, 1), (15, 2), (16, 1)],
  term ((18957995568 : Rat) / 7401317245) [(0, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((18957995568 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 5. -/
theorem ep_Q2_002_partial_05_0105_valid :
    mulPoly ep_Q2_002_coefficient_05_0105
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0106 : Poly :=
[
  term ((-67670663375959196293167999891984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 106 for generator 5. -/
def ep_Q2_002_partial_05_0106 : Poly :=
[
  term ((-67670663375959196293167999891984 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-67670663375959196293167999891984 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((67670663375959196293167999891984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((67670663375959196293167999891984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 5. -/
theorem ep_Q2_002_partial_05_0106_valid :
    mulPoly ep_Q2_002_coefficient_05_0106
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0107 : Poly :=
[
  term ((153240585703350905316950174203632 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 107 for generator 5. -/
def ep_Q2_002_partial_05_0107 : Poly :=
[
  term ((153240585703350905316950174203632 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1), (12, 1)],
  term ((153240585703350905316950174203632 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-153240585703350905316950174203632 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-153240585703350905316950174203632 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 5. -/
theorem ep_Q2_002_partial_05_0107_valid :
    mulPoly ep_Q2_002_coefficient_05_0107
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0108 : Poly :=
[
  term ((-123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 108 for generator 5. -/
def ep_Q2_002_partial_05_0108 : Poly :=
[
  term ((-123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 5. -/
theorem ep_Q2_002_partial_05_0108_valid :
    mulPoly ep_Q2_002_coefficient_05_0108
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0109 : Poly :=
[
  term ((-288580720519965785405378285790144 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 109 for generator 5. -/
def ep_Q2_002_partial_05_0109 : Poly :=
[
  term ((-288580720519965785405378285790144 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-288580720519965785405378285790144 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((288580720519965785405378285790144 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((288580720519965785405378285790144 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 5. -/
theorem ep_Q2_002_partial_05_0109_valid :
    mulPoly ep_Q2_002_coefficient_05_0109
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0110 : Poly :=
[
  term ((-1092032002445146020239122670864715258073776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 110 for generator 5. -/
def ep_Q2_002_partial_05_0110 : Poly :=
[
  term ((-1092032002445146020239122670864715258073776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1092032002445146020239122670864715258073776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((1092032002445146020239122670864715258073776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((1092032002445146020239122670864715258073776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 5. -/
theorem ep_Q2_002_partial_05_0110_valid :
    mulPoly ep_Q2_002_coefficient_05_0110
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0111 : Poly :=
[
  term ((-126701519248 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 5. -/
def ep_Q2_002_partial_05_0111 : Poly :=
[
  term ((-126701519248 : Rat) / 7401317245) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126701519248 : Rat) / 7401317245) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((126701519248 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((126701519248 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 5. -/
theorem ep_Q2_002_partial_05_0111_valid :
    mulPoly ep_Q2_002_coefficient_05_0111
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0112 : Poly :=
[
  term ((127436531943974013639015935934528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 112 for generator 5. -/
def ep_Q2_002_partial_05_0112 : Poly :=
[
  term ((127436531943974013639015935934528 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((127436531943974013639015935934528 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((-127436531943974013639015935934528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-127436531943974013639015935934528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 5. -/
theorem ep_Q2_002_partial_05_0112_valid :
    mulPoly ep_Q2_002_coefficient_05_0112
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0113 : Poly :=
[
  term ((232595212820328484502089918147776 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 113 for generator 5. -/
def ep_Q2_002_partial_05_0113 : Poly :=
[
  term ((232595212820328484502089918147776 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (13, 1), (14, 1)],
  term ((232595212820328484502089918147776 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (13, 1), (14, 1)],
  term ((-232595212820328484502089918147776 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-232595212820328484502089918147776 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 5. -/
theorem ep_Q2_002_partial_05_0113_valid :
    mulPoly ep_Q2_002_coefficient_05_0113
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0114 : Poly :=
[
  term ((144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 114 for generator 5. -/
def ep_Q2_002_partial_05_0114 : Poly :=
[
  term ((144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1)],
  term ((144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((-144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 5. -/
theorem ep_Q2_002_partial_05_0114_valid :
    mulPoly ep_Q2_002_coefficient_05_0114
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0115 : Poly :=
[
  term ((129020865416 : Rat) / 7401317245) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 5. -/
def ep_Q2_002_partial_05_0115 : Poly :=
[
  term ((129020865416 : Rat) / 7401317245) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((129020865416 : Rat) / 7401317245) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-129020865416 : Rat) / 7401317245) [(0, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-129020865416 : Rat) / 7401317245) [(0, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 5. -/
theorem ep_Q2_002_partial_05_0115_valid :
    mulPoly ep_Q2_002_coefficient_05_0115
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0116 : Poly :=
[
  term ((329587248474110112372730627557386324550048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 116 for generator 5. -/
def ep_Q2_002_partial_05_0116 : Poly :=
[
  term ((329587248474110112372730627557386324550048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((329587248474110112372730627557386324550048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-329587248474110112372730627557386324550048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-329587248474110112372730627557386324550048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 5. -/
theorem ep_Q2_002_partial_05_0116_valid :
    mulPoly ep_Q2_002_coefficient_05_0116
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0117 : Poly :=
[
  term ((52344163524 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 5. -/
def ep_Q2_002_partial_05_0117 : Poly :=
[
  term ((52344163524 : Rat) / 7401317245) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((52344163524 : Rat) / 7401317245) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-52344163524 : Rat) / 7401317245) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-52344163524 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 5. -/
theorem ep_Q2_002_partial_05_0117_valid :
    mulPoly ep_Q2_002_coefficient_05_0117
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0118 : Poly :=
[
  term ((2936488668261891734355301313208 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 118 for generator 5. -/
def ep_Q2_002_partial_05_0118 : Poly :=
[
  term ((2936488668261891734355301313208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((2936488668261891734355301313208 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-2936488668261891734355301313208 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2936488668261891734355301313208 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 5. -/
theorem ep_Q2_002_partial_05_0118_valid :
    mulPoly ep_Q2_002_coefficient_05_0118
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0119 : Poly :=
[
  term ((-1139274210267573340165816523165458632954828 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 119 for generator 5. -/
def ep_Q2_002_partial_05_0119 : Poly :=
[
  term ((-1139274210267573340165816523165458632954828 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1139274210267573340165816523165458632954828 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((1139274210267573340165816523165458632954828 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1139274210267573340165816523165458632954828 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 5. -/
theorem ep_Q2_002_partial_05_0119_valid :
    mulPoly ep_Q2_002_coefficient_05_0119
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0120 : Poly :=
[
  term ((-3177893687 : Rat) / 1057331035) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 5. -/
def ep_Q2_002_partial_05_0120 : Poly :=
[
  term ((-3177893687 : Rat) / 1057331035) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3177893687 : Rat) / 1057331035) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3177893687 : Rat) / 1057331035) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3177893687 : Rat) / 1057331035) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 5. -/
theorem ep_Q2_002_partial_05_0120_valid :
    mulPoly ep_Q2_002_coefficient_05_0120
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0121 : Poly :=
[
  term ((-3102983718628203181503191187756 : Rat) / 11272482215364523786105976789) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 121 for generator 5. -/
def ep_Q2_002_partial_05_0121 : Poly :=
[
  term ((-3102983718628203181503191187756 : Rat) / 11272482215364523786105976789) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-3102983718628203181503191187756 : Rat) / 11272482215364523786105976789) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((3102983718628203181503191187756 : Rat) / 11272482215364523786105976789) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((3102983718628203181503191187756 : Rat) / 11272482215364523786105976789) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 5. -/
theorem ep_Q2_002_partial_05_0121_valid :
    mulPoly ep_Q2_002_coefficient_05_0121
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0122 : Poly :=
[
  term ((131351757683407942081484373886008 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 122 for generator 5. -/
def ep_Q2_002_partial_05_0122 : Poly :=
[
  term ((131351757683407942081484373886008 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (13, 1), (14, 1)],
  term ((131351757683407942081484373886008 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-131351757683407942081484373886008 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-131351757683407942081484373886008 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 5. -/
theorem ep_Q2_002_partial_05_0122_valid :
    mulPoly ep_Q2_002_coefficient_05_0122
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0123 : Poly :=
[
  term ((2533679351519144175315722592280229758568634 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 123 for generator 5. -/
def ep_Q2_002_partial_05_0123 : Poly :=
[
  term ((2533679351519144175315722592280229758568634 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((2533679351519144175315722592280229758568634 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-2533679351519144175315722592280229758568634 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2533679351519144175315722592280229758568634 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 5. -/
theorem ep_Q2_002_partial_05_0123_valid :
    mulPoly ep_Q2_002_coefficient_05_0123
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0124 : Poly :=
[
  term ((-88793118511 : Rat) / 14802634490) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 5. -/
def ep_Q2_002_partial_05_0124 : Poly :=
[
  term ((-88793118511 : Rat) / 14802634490) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-88793118511 : Rat) / 14802634490) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((88793118511 : Rat) / 14802634490) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((88793118511 : Rat) / 14802634490) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 5. -/
theorem ep_Q2_002_partial_05_0124_valid :
    mulPoly ep_Q2_002_coefficient_05_0124
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0125 : Poly :=
[
  term ((11965502253079737810983883427128 : Rat) / 97983883872014706756151952089) [(0, 1), (11, 2)]
]

/-- Partial product 125 for generator 5. -/
def ep_Q2_002_partial_05_0125 : Poly :=
[
  term ((11965502253079737810983883427128 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 2), (11, 2)],
  term ((11965502253079737810983883427128 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 2), (11, 2)],
  term ((-11965502253079737810983883427128 : Rat) / 97983883872014706756151952089) [(0, 1), (11, 2), (14, 2)],
  term ((-11965502253079737810983883427128 : Rat) / 97983883872014706756151952089) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 5. -/
theorem ep_Q2_002_partial_05_0125_valid :
    mulPoly ep_Q2_002_coefficient_05_0125
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0126 : Poly :=
[
  term ((-6338322651330666033389168191200 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1)]
]

/-- Partial product 126 for generator 5. -/
def ep_Q2_002_partial_05_0126 : Poly :=
[
  term ((-6338322651330666033389168191200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2), (12, 1)],
  term ((-6338322651330666033389168191200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2), (12, 1)],
  term ((6338322651330666033389168191200 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1), (14, 2)],
  term ((6338322651330666033389168191200 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 5. -/
theorem ep_Q2_002_partial_05_0126_valid :
    mulPoly ep_Q2_002_coefficient_05_0126
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0127 : Poly :=
[
  term ((8624085031561425102432 : Rat) / 253528477699481291099) [(0, 1), (12, 1)]
]

/-- Partial product 127 for generator 5. -/
def ep_Q2_002_partial_05_0127 : Poly :=
[
  term ((8624085031561425102432 : Rat) / 253528477699481291099) [(0, 1), (2, 2), (12, 1)],
  term ((8624085031561425102432 : Rat) / 253528477699481291099) [(0, 1), (3, 2), (12, 1)],
  term ((-8624085031561425102432 : Rat) / 253528477699481291099) [(0, 1), (12, 1), (14, 2)],
  term ((-8624085031561425102432 : Rat) / 253528477699481291099) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 5. -/
theorem ep_Q2_002_partial_05_0127_valid :
    mulPoly ep_Q2_002_coefficient_05_0127
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0128 : Poly :=
[
  term ((-160678170289940608721475943666926566002524 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 128 for generator 5. -/
def ep_Q2_002_partial_05_0128 : Poly :=
[
  term ((-160678170289940608721475943666926566002524 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-160678170289940608721475943666926566002524 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((160678170289940608721475943666926566002524 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((160678170289940608721475943666926566002524 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 5. -/
theorem ep_Q2_002_partial_05_0128_valid :
    mulPoly ep_Q2_002_coefficient_05_0128
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0129 : Poly :=
[
  term ((-3776808185 : Rat) / 1480263449) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 5. -/
def ep_Q2_002_partial_05_0129 : Poly :=
[
  term ((-3776808185 : Rat) / 1480263449) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3776808185 : Rat) / 1480263449) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3776808185 : Rat) / 1480263449) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3776808185 : Rat) / 1480263449) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 5. -/
theorem ep_Q2_002_partial_05_0129_valid :
    mulPoly ep_Q2_002_coefficient_05_0129
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0130 : Poly :=
[
  term ((1540748476605497386671363203424 : Rat) / 115799135485108289802725034287) [(0, 1), (12, 1), (13, 2)]
]

/-- Partial product 130 for generator 5. -/
def ep_Q2_002_partial_05_0130 : Poly :=
[
  term ((1540748476605497386671363203424 : Rat) / 115799135485108289802725034287) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((1540748476605497386671363203424 : Rat) / 115799135485108289802725034287) [(0, 1), (3, 2), (12, 1), (13, 2)],
  term ((-1540748476605497386671363203424 : Rat) / 115799135485108289802725034287) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((-1540748476605497386671363203424 : Rat) / 115799135485108289802725034287) [(0, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 5. -/
theorem ep_Q2_002_partial_05_0130_valid :
    mulPoly ep_Q2_002_coefficient_05_0130
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0131 : Poly :=
[
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (12, 1), (14, 1)]
]

/-- Partial product 131 for generator 5. -/
def ep_Q2_002_partial_05_0131 : Poly :=
[
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (2, 2), (12, 1), (14, 1)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (3, 2), (12, 1), (14, 1)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 5. -/
theorem ep_Q2_002_partial_05_0131_valid :
    mulPoly ep_Q2_002_coefficient_05_0131
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0132 : Poly :=
[
  term ((-112270380224586134856278149926667122141636 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 132 for generator 5. -/
def ep_Q2_002_partial_05_0132 : Poly :=
[
  term ((-112270380224586134856278149926667122141636 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((-112270380224586134856278149926667122141636 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((112270380224586134856278149926667122141636 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((112270380224586134856278149926667122141636 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 5. -/
theorem ep_Q2_002_partial_05_0132_valid :
    mulPoly ep_Q2_002_coefficient_05_0132
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0133 : Poly :=
[
  term ((7005830553 : Rat) / 1480263449) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 133 for generator 5. -/
def ep_Q2_002_partial_05_0133 : Poly :=
[
  term ((7005830553 : Rat) / 1480263449) [(0, 1), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((7005830553 : Rat) / 1480263449) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-7005830553 : Rat) / 1480263449) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7005830553 : Rat) / 1480263449) [(0, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 5. -/
theorem ep_Q2_002_partial_05_0133_valid :
    mulPoly ep_Q2_002_coefficient_05_0133
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0134 : Poly :=
[
  term ((1775897806906642497252522763511886966126468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 134 for generator 5. -/
def ep_Q2_002_partial_05_0134 : Poly :=
[
  term ((1775897806906642497252522763511886966126468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((1775897806906642497252522763511886966126468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1775897806906642497252522763511886966126468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1775897806906642497252522763511886966126468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 5. -/
theorem ep_Q2_002_partial_05_0134_valid :
    mulPoly ep_Q2_002_coefficient_05_0134
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0135 : Poly :=
[
  term ((-40474751441 : Rat) / 7401317245) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 5. -/
def ep_Q2_002_partial_05_0135 : Poly :=
[
  term ((-40474751441 : Rat) / 7401317245) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40474751441 : Rat) / 7401317245) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((40474751441 : Rat) / 7401317245) [(0, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((40474751441 : Rat) / 7401317245) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 5. -/
theorem ep_Q2_002_partial_05_0135_valid :
    mulPoly ep_Q2_002_coefficient_05_0135
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0136 : Poly :=
[
  term ((-66949502039620897803549118196989238420202 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 136 for generator 5. -/
def ep_Q2_002_partial_05_0136 : Poly :=
[
  term ((-66949502039620897803549118196989238420202 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-66949502039620897803549118196989238420202 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((66949502039620897803549118196989238420202 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((66949502039620897803549118196989238420202 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 5. -/
theorem ep_Q2_002_partial_05_0136_valid :
    mulPoly ep_Q2_002_coefficient_05_0136
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0137 : Poly :=
[
  term ((10180461029 : Rat) / 2960526898) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 5. -/
def ep_Q2_002_partial_05_0137 : Poly :=
[
  term ((10180461029 : Rat) / 2960526898) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((10180461029 : Rat) / 2960526898) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-10180461029 : Rat) / 2960526898) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-10180461029 : Rat) / 2960526898) [(0, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 5. -/
theorem ep_Q2_002_partial_05_0137_valid :
    mulPoly ep_Q2_002_coefficient_05_0137
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0138 : Poly :=
[
  term ((54269929024500907754626607810352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 138 for generator 5. -/
def ep_Q2_002_partial_05_0138 : Poly :=
[
  term ((54269929024500907754626607810352 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (13, 2)],
  term ((54269929024500907754626607810352 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (13, 2)],
  term ((-54269929024500907754626607810352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 2)],
  term ((-54269929024500907754626607810352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 5. -/
theorem ep_Q2_002_partial_05_0138_valid :
    mulPoly ep_Q2_002_coefficient_05_0138
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0139 : Poly :=
[
  term ((-247359958198155960380778080576736 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 139 for generator 5. -/
def ep_Q2_002_partial_05_0139 : Poly :=
[
  term ((-247359958198155960380778080576736 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (13, 2), (14, 1)],
  term ((-247359958198155960380778080576736 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (13, 2), (14, 1)],
  term ((247359958198155960380778080576736 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((247359958198155960380778080576736 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 5. -/
theorem ep_Q2_002_partial_05_0139_valid :
    mulPoly ep_Q2_002_coefficient_05_0139
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0140 : Poly :=
[
  term ((8384831320520626695636 : Rat) / 253528477699481291099) [(0, 1), (14, 1)]
]

/-- Partial product 140 for generator 5. -/
def ep_Q2_002_partial_05_0140 : Poly :=
[
  term ((8384831320520626695636 : Rat) / 253528477699481291099) [(0, 1), (2, 2), (14, 1)],
  term ((8384831320520626695636 : Rat) / 253528477699481291099) [(0, 1), (3, 2), (14, 1)],
  term ((-8384831320520626695636 : Rat) / 253528477699481291099) [(0, 1), (14, 1), (15, 2)],
  term ((-8384831320520626695636 : Rat) / 253528477699481291099) [(0, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 5. -/
theorem ep_Q2_002_partial_05_0140_valid :
    mulPoly ep_Q2_002_coefficient_05_0140
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0141 : Poly :=
[
  term ((71413882592230008843379340676424184334942 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (15, 2)]
]

/-- Partial product 141 for generator 5. -/
def ep_Q2_002_partial_05_0141 : Poly :=
[
  term ((71413882592230008843379340676424184334942 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (2, 2), (15, 2)],
  term ((71413882592230008843379340676424184334942 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (3, 2), (15, 2)],
  term ((-71413882592230008843379340676424184334942 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (14, 2), (15, 2)],
  term ((-71413882592230008843379340676424184334942 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 5. -/
theorem ep_Q2_002_partial_05_0141_valid :
    mulPoly ep_Q2_002_coefficient_05_0141
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0142 : Poly :=
[
  term ((-1551577493 : Rat) / 250892110) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 142 for generator 5. -/
def ep_Q2_002_partial_05_0142 : Poly :=
[
  term ((-1551577493 : Rat) / 250892110) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-1551577493 : Rat) / 250892110) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((1551577493 : Rat) / 250892110) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((1551577493 : Rat) / 250892110) [(0, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 5. -/
theorem ep_Q2_002_partial_05_0142_valid :
    mulPoly ep_Q2_002_coefficient_05_0142
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0143 : Poly :=
[
  term ((2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1)]
]

/-- Partial product 143 for generator 5. -/
def ep_Q2_002_partial_05_0143 : Poly :=
[
  term ((2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (2, 2), (11, 1)],
  term ((2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 2), (11, 1)],
  term ((-2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1), (14, 2)],
  term ((-2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 5. -/
theorem ep_Q2_002_partial_05_0143_valid :
    mulPoly ep_Q2_002_coefficient_05_0143
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0144 : Poly :=
[
  term ((-2707536438589440351893277608640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1)]
]

/-- Partial product 144 for generator 5. -/
def ep_Q2_002_partial_05_0144 : Poly :=
[
  term ((-2707536438589440351893277608640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (2, 2), (13, 1)],
  term ((-2707536438589440351893277608640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 2), (13, 1)],
  term ((2707536438589440351893277608640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1), (14, 2)],
  term ((2707536438589440351893277608640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 5. -/
theorem ep_Q2_002_partial_05_0144_valid :
    mulPoly ep_Q2_002_coefficient_05_0144
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0145 : Poly :=
[
  term ((2034121859792476304871123189120 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (15, 1)]
]

/-- Partial product 145 for generator 5. -/
def ep_Q2_002_partial_05_0145 : Poly :=
[
  term ((2034121859792476304871123189120 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (2, 2), (15, 1)],
  term ((2034121859792476304871123189120 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 2), (15, 1)],
  term ((-2034121859792476304871123189120 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((-2034121859792476304871123189120 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 5. -/
theorem ep_Q2_002_partial_05_0145_valid :
    mulPoly ep_Q2_002_coefficient_05_0145
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0146 : Poly :=
[
  term ((10243570116992397104464779402000 : Rat) / 115799135485108289802725034287) [(0, 2), (11, 1), (13, 1)]
]

/-- Partial product 146 for generator 5. -/
def ep_Q2_002_partial_05_0146 : Poly :=
[
  term ((10243570116992397104464779402000 : Rat) / 115799135485108289802725034287) [(0, 2), (2, 2), (11, 1), (13, 1)],
  term ((10243570116992397104464779402000 : Rat) / 115799135485108289802725034287) [(0, 2), (3, 2), (11, 1), (13, 1)],
  term ((-10243570116992397104464779402000 : Rat) / 115799135485108289802725034287) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-10243570116992397104464779402000 : Rat) / 115799135485108289802725034287) [(0, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 5. -/
theorem ep_Q2_002_partial_05_0146_valid :
    mulPoly ep_Q2_002_coefficient_05_0146
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0147 : Poly :=
[
  term ((-1235781605153867006504862113790510887465484 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 1)]
]

/-- Partial product 147 for generator 5. -/
def ep_Q2_002_partial_05_0147 : Poly :=
[
  term ((-1235781605153867006504862113790510887465484 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (2, 2), (11, 1), (15, 1)],
  term ((-1235781605153867006504862113790510887465484 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 2), (11, 1), (15, 1)],
  term ((1235781605153867006504862113790510887465484 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((1235781605153867006504862113790510887465484 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 5. -/
theorem ep_Q2_002_partial_05_0147_valid :
    mulPoly ep_Q2_002_coefficient_05_0147
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0148 : Poly :=
[
  term ((-5296248637 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 5. -/
def ep_Q2_002_partial_05_0148 : Poly :=
[
  term ((-5296248637 : Rat) / 7401317245) [(0, 2), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-5296248637 : Rat) / 7401317245) [(0, 2), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((5296248637 : Rat) / 7401317245) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((5296248637 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 5. -/
theorem ep_Q2_002_partial_05_0148_valid :
    mulPoly ep_Q2_002_coefficient_05_0148
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0149 : Poly :=
[
  term ((-39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2)]
]

/-- Partial product 149 for generator 5. -/
def ep_Q2_002_partial_05_0149 : Poly :=
[
  term ((-39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (2, 2), (11, 2)],
  term ((-39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 2), (11, 2)],
  term ((39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2), (14, 2)],
  term ((39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 5. -/
theorem ep_Q2_002_partial_05_0149_valid :
    mulPoly ep_Q2_002_coefficient_05_0149
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0150 : Poly :=
[
  term ((-384633538132227895282012090432460793350064 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (13, 1), (15, 1)]
]

/-- Partial product 150 for generator 5. -/
def ep_Q2_002_partial_05_0150 : Poly :=
[
  term ((-384633538132227895282012090432460793350064 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (2, 2), (13, 1), (15, 1)],
  term ((-384633538132227895282012090432460793350064 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 2), (13, 1), (15, 1)],
  term ((384633538132227895282012090432460793350064 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((384633538132227895282012090432460793350064 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 5. -/
theorem ep_Q2_002_partial_05_0150_valid :
    mulPoly ep_Q2_002_coefficient_05_0150
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0151 : Poly :=
[
  term ((-5156573816 : Rat) / 1057331035) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 5. -/
def ep_Q2_002_partial_05_0151 : Poly :=
[
  term ((-5156573816 : Rat) / 1057331035) [(0, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5156573816 : Rat) / 1057331035) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((5156573816 : Rat) / 1057331035) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5156573816 : Rat) / 1057331035) [(0, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 5. -/
theorem ep_Q2_002_partial_05_0151_valid :
    mulPoly ep_Q2_002_coefficient_05_0151
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0152 : Poly :=
[
  term ((-72087755965569949561605307229760 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2)]
]

/-- Partial product 152 for generator 5. -/
def ep_Q2_002_partial_05_0152 : Poly :=
[
  term ((-72087755965569949561605307229760 : Rat) / 1273790490336191187829975377157) [(0, 2), (2, 2), (13, 2)],
  term ((-72087755965569949561605307229760 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 2), (13, 2)],
  term ((72087755965569949561605307229760 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2), (14, 2)],
  term ((72087755965569949561605307229760 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 5. -/
theorem ep_Q2_002_partial_05_0152_valid :
    mulPoly ep_Q2_002_coefficient_05_0152
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0153 : Poly :=
[
  term ((-1172726081615471757478512463565702394468588 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)]
]

/-- Partial product 153 for generator 5. -/
def ep_Q2_002_partial_05_0153 : Poly :=
[
  term ((-1172726081615471757478512463565702394468588 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (2, 2), (15, 2)],
  term ((-1172726081615471757478512463565702394468588 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 2), (15, 2)],
  term ((1172726081615471757478512463565702394468588 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (14, 2), (15, 2)],
  term ((1172726081615471757478512463565702394468588 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 5. -/
theorem ep_Q2_002_partial_05_0153_valid :
    mulPoly ep_Q2_002_coefficient_05_0153
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0154 : Poly :=
[
  term ((-12079962499 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 5. -/
def ep_Q2_002_partial_05_0154 : Poly :=
[
  term ((-12079962499 : Rat) / 7401317245) [(0, 2), (2, 2), (15, 2), (16, 1)],
  term ((-12079962499 : Rat) / 7401317245) [(0, 2), (3, 2), (15, 2), (16, 1)],
  term ((12079962499 : Rat) / 7401317245) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((12079962499 : Rat) / 7401317245) [(0, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 5. -/
theorem ep_Q2_002_partial_05_0154_valid :
    mulPoly ep_Q2_002_coefficient_05_0154
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0155 : Poly :=
[
  term ((3169907838125355602680941902152 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1)]
]

/-- Partial product 155 for generator 5. -/
def ep_Q2_002_partial_05_0155 : Poly :=
[
  term ((3169907838125355602680941902152 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1)],
  term ((-3169907838125355602680941902152 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 2)],
  term ((-3169907838125355602680941902152 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (15, 2)],
  term ((3169907838125355602680941902152 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 5. -/
theorem ep_Q2_002_partial_05_0155_valid :
    mulPoly ep_Q2_002_coefficient_05_0155
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0156 : Poly :=
[
  term ((-4522903905718637406642463940232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 156 for generator 5. -/
def ep_Q2_002_partial_05_0156 : Poly :=
[
  term ((-4522903905718637406642463940232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((4522903905718637406642463940232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (14, 2)],
  term ((4522903905718637406642463940232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((-4522903905718637406642463940232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 5. -/
theorem ep_Q2_002_partial_05_0156_valid :
    mulPoly ep_Q2_002_coefficient_05_0156
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0157 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1)]
]

/-- Partial product 157 for generator 5. -/
def ep_Q2_002_partial_05_0157 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1), (12, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 2)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 5. -/
theorem ep_Q2_002_partial_05_0157_valid :
    mulPoly ep_Q2_002_coefficient_05_0157
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0158 : Poly :=
[
  term ((293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1)]
]

/-- Partial product 158 for generator 5. -/
def ep_Q2_002_partial_05_0158 : Poly :=
[
  term ((293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1), (5, 1), (7, 1)],
  term ((-293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (14, 2)],
  term ((-293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 5. -/
theorem ep_Q2_002_partial_05_0158_valid :
    mulPoly ep_Q2_002_coefficient_05_0158
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0159 : Poly :=
[
  term ((496493460617764432390921366960 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 159 for generator 5. -/
def ep_Q2_002_partial_05_0159 : Poly :=
[
  term ((496493460617764432390921366960 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((-496493460617764432390921366960 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((-496493460617764432390921366960 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((496493460617764432390921366960 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 5. -/
theorem ep_Q2_002_partial_05_0159_valid :
    mulPoly ep_Q2_002_coefficient_05_0159
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0160 : Poly :=
[
  term ((-2193844582441344353098670609552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1)]
]

/-- Partial product 160 for generator 5. -/
def ep_Q2_002_partial_05_0160 : Poly :=
[
  term ((-2193844582441344353098670609552 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((2193844582441344353098670609552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((2193844582441344353098670609552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-2193844582441344353098670609552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 5. -/
theorem ep_Q2_002_partial_05_0160_valid :
    mulPoly ep_Q2_002_coefficient_05_0160
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0161 : Poly :=
[
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1)]
]

/-- Partial product 161 for generator 5. -/
def ep_Q2_002_partial_05_0161 : Poly :=
[
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (6, 1), (8, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 2)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 5. -/
theorem ep_Q2_002_partial_05_0161_valid :
    mulPoly ep_Q2_002_coefficient_05_0161
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0162 : Poly :=
[
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1)]
]

/-- Partial product 162 for generator 5. -/
def ep_Q2_002_partial_05_0162 : Poly :=
[
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (6, 1), (12, 1)],
  term ((-220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 2)],
  term ((-220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 5. -/
theorem ep_Q2_002_partial_05_0162_valid :
    mulPoly ep_Q2_002_coefficient_05_0162
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0163 : Poly :=
[
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1)]
]

/-- Partial product 163 for generator 5. -/
def ep_Q2_002_partial_05_0163 : Poly :=
[
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (9, 1)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 2)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2)],
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 5. -/
theorem ep_Q2_002_partial_05_0163_valid :
    mulPoly ep_Q2_002_coefficient_05_0163
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0164 : Poly :=
[
  term ((48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1)]
]

/-- Partial product 164 for generator 5. -/
def ep_Q2_002_partial_05_0164 : Poly :=
[
  term ((48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (11, 1)],
  term ((-48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 2)],
  term ((-48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 5. -/
theorem ep_Q2_002_partial_05_0164_valid :
    mulPoly ep_Q2_002_coefficient_05_0164
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0165 : Poly :=
[
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1)]
]

/-- Partial product 165 for generator 5. -/
def ep_Q2_002_partial_05_0165 : Poly :=
[
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (13, 1)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 2)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 5. -/
theorem ep_Q2_002_partial_05_0165_valid :
    mulPoly ep_Q2_002_coefficient_05_0165
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0166 : Poly :=
[
  term ((-280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (15, 1)]
]

/-- Partial product 166 for generator 5. -/
def ep_Q2_002_partial_05_0166 : Poly :=
[
  term ((-280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1)],
  term ((280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1)],
  term ((280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((-280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 5. -/
theorem ep_Q2_002_partial_05_0166_valid :
    mulPoly ep_Q2_002_coefficient_05_0166
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0167 : Poly :=
[
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 5. -/
def ep_Q2_002_partial_05_0167 : Poly :=
[
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (3, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 5. -/
theorem ep_Q2_002_partial_05_0167_valid :
    mulPoly ep_Q2_002_coefficient_05_0167
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0168 : Poly :=
[
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2)]
]

/-- Partial product 168 for generator 5. -/
def ep_Q2_002_partial_05_0168 : Poly :=
[
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 2)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (14, 2)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (15, 2)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 5. -/
theorem ep_Q2_002_partial_05_0168_valid :
    mulPoly ep_Q2_002_coefficient_05_0168
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0169 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 169 for generator 5. -/
def ep_Q2_002_partial_05_0169 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 2)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 5. -/
theorem ep_Q2_002_partial_05_0169_valid :
    mulPoly ep_Q2_002_coefficient_05_0169
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0170 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 1)]
]

/-- Partial product 170 for generator 5. -/
def ep_Q2_002_partial_05_0170 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (8, 1), (14, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 3)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 5. -/
theorem ep_Q2_002_partial_05_0170_valid :
    mulPoly ep_Q2_002_coefficient_05_0170
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0171 : Poly :=
[
  term ((-11172681177833319044148020650560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 171 for generator 5. -/
def ep_Q2_002_partial_05_0171 : Poly :=
[
  term ((-11172681177833319044148020650560 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((11172681177833319044148020650560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((11172681177833319044148020650560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((-11172681177833319044148020650560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 5. -/
theorem ep_Q2_002_partial_05_0171_valid :
    mulPoly ep_Q2_002_coefficient_05_0171
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0172 : Poly :=
[
  term ((-16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (15, 1)]
]

/-- Partial product 172 for generator 5. -/
def ep_Q2_002_partial_05_0172 : Poly :=
[
  term ((-16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1)],
  term ((16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((-16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 5. -/
theorem ep_Q2_002_partial_05_0172_valid :
    mulPoly ep_Q2_002_coefficient_05_0172
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0173 : Poly :=
[
  term ((-516094866507150261866289815328 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 173 for generator 5. -/
def ep_Q2_002_partial_05_0173 : Poly :=
[
  term ((-516094866507150261866289815328 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((516094866507150261866289815328 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 2)],
  term ((516094866507150261866289815328 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-516094866507150261866289815328 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 5. -/
theorem ep_Q2_002_partial_05_0173_valid :
    mulPoly ep_Q2_002_coefficient_05_0173
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0174 : Poly :=
[
  term ((-110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 1)]
]

/-- Partial product 174 for generator 5. -/
def ep_Q2_002_partial_05_0174 : Poly :=
[
  term ((-110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (12, 1), (14, 1)],
  term ((110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 3)],
  term ((-110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 5. -/
theorem ep_Q2_002_partial_05_0174_valid :
    mulPoly ep_Q2_002_coefficient_05_0174
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0175 : Poly :=
[
  term ((35792000005711292123674637513472 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 175 for generator 5. -/
def ep_Q2_002_partial_05_0175 : Poly :=
[
  term ((35792000005711292123674637513472 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((-35792000005711292123674637513472 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-35792000005711292123674637513472 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((35792000005711292123674637513472 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 5. -/
theorem ep_Q2_002_partial_05_0175_valid :
    mulPoly ep_Q2_002_coefficient_05_0175
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0176 : Poly :=
[
  term ((1250244805279446163501611711928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 176 for generator 5. -/
def ep_Q2_002_partial_05_0176 : Poly :=
[
  term ((1250244805279446163501611711928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((-1250244805279446163501611711928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-1250244805279446163501611711928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 3)],
  term ((1250244805279446163501611711928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 5. -/
theorem ep_Q2_002_partial_05_0176_valid :
    mulPoly ep_Q2_002_coefficient_05_0176
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0177 : Poly :=
[
  term ((93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 177 for generator 5. -/
def ep_Q2_002_partial_05_0177 : Poly :=
[
  term ((93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((-93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (15, 4)],
  term ((93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 5. -/
theorem ep_Q2_002_partial_05_0177_valid :
    mulPoly ep_Q2_002_coefficient_05_0177
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0178 : Poly :=
[
  term ((12746693892 : Rat) / 7401317245) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 178 for generator 5. -/
def ep_Q2_002_partial_05_0178 : Poly :=
[
  term ((12746693892 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-12746693892 : Rat) / 7401317245) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((-12746693892 : Rat) / 7401317245) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((12746693892 : Rat) / 7401317245) [(1, 1), (3, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 5. -/
theorem ep_Q2_002_partial_05_0178_valid :
    mulPoly ep_Q2_002_coefficient_05_0178
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0179 : Poly :=
[
  term ((-3035774565090429975166664251648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1)]
]

/-- Partial product 179 for generator 5. -/
def ep_Q2_002_partial_05_0179 : Poly :=
[
  term ((-3035774565090429975166664251648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1)],
  term ((-3035774565090429975166664251648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1)],
  term ((3035774565090429975166664251648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 2)],
  term ((3035774565090429975166664251648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 5. -/
theorem ep_Q2_002_partial_05_0179_valid :
    mulPoly ep_Q2_002_coefficient_05_0179
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0180 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 1)]
]

/-- Partial product 180 for generator 5. -/
def ep_Q2_002_partial_05_0180 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (4, 1), (5, 1), (6, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (4, 1), (5, 1), (6, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 1), (14, 2)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 5. -/
theorem ep_Q2_002_partial_05_0180_valid :
    mulPoly ep_Q2_002_coefficient_05_0180
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0181 : Poly :=
[
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1)]
]

/-- Partial product 181 for generator 5. -/
def ep_Q2_002_partial_05_0181 : Poly :=
[
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1), (12, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1), (12, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 2)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 5. -/
theorem ep_Q2_002_partial_05_0181_valid :
    mulPoly ep_Q2_002_coefficient_05_0181
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0182 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 1)]
]

/-- Partial product 182 for generator 5. -/
def ep_Q2_002_partial_05_0182 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1), (14, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1), (14, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 1), (15, 2)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 5. -/
theorem ep_Q2_002_partial_05_0182_valid :
    mulPoly ep_Q2_002_coefficient_05_0182
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0183 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (7, 1)]
]

/-- Partial product 183 for generator 5. -/
def ep_Q2_002_partial_05_0183 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (6, 1), (7, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (6, 1), (7, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (7, 1), (14, 2)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 5. -/
theorem ep_Q2_002_partial_05_0183_valid :
    mulPoly ep_Q2_002_coefficient_05_0183
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0184 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1)]
]

/-- Partial product 184 for generator 5. -/
def ep_Q2_002_partial_05_0184 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (6, 1), (9, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (6, 1), (9, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1), (14, 2)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 5. -/
theorem ep_Q2_002_partial_05_0184_valid :
    mulPoly ep_Q2_002_coefficient_05_0184
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0185 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1)]
]

/-- Partial product 185 for generator 5. -/
def ep_Q2_002_partial_05_0185 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (6, 1), (11, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (6, 1), (11, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (14, 2)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 5. -/
theorem ep_Q2_002_partial_05_0185_valid :
    mulPoly ep_Q2_002_coefficient_05_0185
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0186 : Poly :=
[
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1)]
]

/-- Partial product 186 for generator 5. -/
def ep_Q2_002_partial_05_0186 : Poly :=
[
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (6, 1), (13, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (6, 1), (13, 1)],
  term ((180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 2)],
  term ((180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 5. -/
theorem ep_Q2_002_partial_05_0186_valid :
    mulPoly ep_Q2_002_coefficient_05_0186
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0187 : Poly :=
[
  term ((-544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 1), (15, 1)]
]

/-- Partial product 187 for generator 5. -/
def ep_Q2_002_partial_05_0187 : Poly :=
[
  term ((-544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (4, 1), (6, 1), (15, 1)],
  term ((-544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (4, 1), (6, 1), (15, 1)],
  term ((544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1)],
  term ((544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 5. -/
theorem ep_Q2_002_partial_05_0187_valid :
    mulPoly ep_Q2_002_coefficient_05_0187
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0188 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 5. -/
def ep_Q2_002_partial_05_0188 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 2), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 5. -/
theorem ep_Q2_002_partial_05_0188_valid :
    mulPoly ep_Q2_002_coefficient_05_0188
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0189 : Poly :=
[
  term ((-289763440048781996311981960496 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 189 for generator 5. -/
def ep_Q2_002_partial_05_0189 : Poly :=
[
  term ((-289763440048781996311981960496 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (4, 1), (7, 1)],
  term ((-289763440048781996311981960496 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (4, 1), (7, 1)],
  term ((289763440048781996311981960496 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (7, 1), (14, 2)],
  term ((289763440048781996311981960496 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 5. -/
theorem ep_Q2_002_partial_05_0189_valid :
    mulPoly ep_Q2_002_coefficient_05_0189
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0190 : Poly :=
[
  term ((-15788657520600529006276867057568 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 1)]
]

/-- Partial product 190 for generator 5. -/
def ep_Q2_002_partial_05_0190 : Poly :=
[
  term ((-15788657520600529006276867057568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1), (14, 1)],
  term ((-15788657520600529006276867057568 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (7, 1), (14, 1)],
  term ((15788657520600529006276867057568 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((15788657520600529006276867057568 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 5. -/
theorem ep_Q2_002_partial_05_0190_valid :
    mulPoly ep_Q2_002_coefficient_05_0190
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0191 : Poly :=
[
  term ((-7149457894376629228209691008672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 191 for generator 5. -/
def ep_Q2_002_partial_05_0191 : Poly :=
[
  term ((-7149457894376629228209691008672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((-7149457894376629228209691008672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((7149457894376629228209691008672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 2)],
  term ((7149457894376629228209691008672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 5. -/
theorem ep_Q2_002_partial_05_0191_valid :
    mulPoly ep_Q2_002_coefficient_05_0191
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0192 : Poly :=
[
  term ((2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1)]
]

/-- Partial product 192 for generator 5. -/
def ep_Q2_002_partial_05_0192 : Poly :=
[
  term ((2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (9, 1), (12, 1)],
  term ((2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (9, 1), (12, 1)],
  term ((-2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 2)],
  term ((-2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 5. -/
theorem ep_Q2_002_partial_05_0192_valid :
    mulPoly ep_Q2_002_coefficient_05_0192
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0193 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 1)]
]

/-- Partial product 193 for generator 5. -/
def ep_Q2_002_partial_05_0193 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (9, 1), (14, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (9, 1), (14, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 5. -/
theorem ep_Q2_002_partial_05_0193_valid :
    mulPoly ep_Q2_002_coefficient_05_0193
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0194 : Poly :=
[
  term ((-175629759843457334575856130076592 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 194 for generator 5. -/
def ep_Q2_002_partial_05_0194 : Poly :=
[
  term ((-175629759843457334575856130076592 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((-175629759843457334575856130076592 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((175629759843457334575856130076592 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 2)],
  term ((175629759843457334575856130076592 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 5. -/
theorem ep_Q2_002_partial_05_0194_valid :
    mulPoly ep_Q2_002_coefficient_05_0194
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0195 : Poly :=
[
  term ((46922556256577397796934279964928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1)]
]

/-- Partial product 195 for generator 5. -/
def ep_Q2_002_partial_05_0195 : Poly :=
[
  term ((46922556256577397796934279964928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1), (12, 1)],
  term ((46922556256577397796934279964928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1), (12, 1)],
  term ((-46922556256577397796934279964928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 2)],
  term ((-46922556256577397796934279964928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 5. -/
theorem ep_Q2_002_partial_05_0195_valid :
    mulPoly ep_Q2_002_coefficient_05_0195
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0196 : Poly :=
[
  term ((7662739408784951756120741070864 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 1)]
]

/-- Partial product 196 for generator 5. -/
def ep_Q2_002_partial_05_0196 : Poly :=
[
  term ((7662739408784951756120741070864 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1), (14, 1)],
  term ((7662739408784951756120741070864 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1), (14, 1)],
  term ((-7662739408784951756120741070864 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 1), (15, 2)],
  term ((-7662739408784951756120741070864 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 5. -/
theorem ep_Q2_002_partial_05_0196_valid :
    mulPoly ep_Q2_002_coefficient_05_0196
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0197 : Poly :=
[
  term ((-90603928466034994545790306761456 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 197 for generator 5. -/
def ep_Q2_002_partial_05_0197 : Poly :=
[
  term ((-90603928466034994545790306761456 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (12, 1), (13, 1)],
  term ((-90603928466034994545790306761456 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1)],
  term ((90603928466034994545790306761456 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((90603928466034994545790306761456 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 5. -/
theorem ep_Q2_002_partial_05_0197_valid :
    mulPoly ep_Q2_002_coefficient_05_0197
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0198 : Poly :=
[
  term ((-13180926155429499951545456812975297058608 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 198 for generator 5. -/
def ep_Q2_002_partial_05_0198 : Poly :=
[
  term ((-13180926155429499951545456812975297058608 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)],
  term ((-13180926155429499951545456812975297058608 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1)],
  term ((13180926155429499951545456812975297058608 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((13180926155429499951545456812975297058608 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 5. -/
theorem ep_Q2_002_partial_05_0198_valid :
    mulPoly ep_Q2_002_coefficient_05_0198
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 5. -/
def ep_Q2_002_coefficient_05_0199 : Poly :=
[
  term ((-32745408244 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 199 for generator 5. -/
def ep_Q2_002_partial_05_0199 : Poly :=
[
  term ((-32745408244 : Rat) / 7401317245) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32745408244 : Rat) / 7401317245) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((32745408244 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((32745408244 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 5. -/
theorem ep_Q2_002_partial_05_0199_valid :
    mulPoly ep_Q2_002_coefficient_05_0199
        ep_Q2_002_generator_05_0100_0199 =
      ep_Q2_002_partial_05_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_05_0100_0199 : List Poly :=
[
  ep_Q2_002_partial_05_0100,
  ep_Q2_002_partial_05_0101,
  ep_Q2_002_partial_05_0102,
  ep_Q2_002_partial_05_0103,
  ep_Q2_002_partial_05_0104,
  ep_Q2_002_partial_05_0105,
  ep_Q2_002_partial_05_0106,
  ep_Q2_002_partial_05_0107,
  ep_Q2_002_partial_05_0108,
  ep_Q2_002_partial_05_0109,
  ep_Q2_002_partial_05_0110,
  ep_Q2_002_partial_05_0111,
  ep_Q2_002_partial_05_0112,
  ep_Q2_002_partial_05_0113,
  ep_Q2_002_partial_05_0114,
  ep_Q2_002_partial_05_0115,
  ep_Q2_002_partial_05_0116,
  ep_Q2_002_partial_05_0117,
  ep_Q2_002_partial_05_0118,
  ep_Q2_002_partial_05_0119,
  ep_Q2_002_partial_05_0120,
  ep_Q2_002_partial_05_0121,
  ep_Q2_002_partial_05_0122,
  ep_Q2_002_partial_05_0123,
  ep_Q2_002_partial_05_0124,
  ep_Q2_002_partial_05_0125,
  ep_Q2_002_partial_05_0126,
  ep_Q2_002_partial_05_0127,
  ep_Q2_002_partial_05_0128,
  ep_Q2_002_partial_05_0129,
  ep_Q2_002_partial_05_0130,
  ep_Q2_002_partial_05_0131,
  ep_Q2_002_partial_05_0132,
  ep_Q2_002_partial_05_0133,
  ep_Q2_002_partial_05_0134,
  ep_Q2_002_partial_05_0135,
  ep_Q2_002_partial_05_0136,
  ep_Q2_002_partial_05_0137,
  ep_Q2_002_partial_05_0138,
  ep_Q2_002_partial_05_0139,
  ep_Q2_002_partial_05_0140,
  ep_Q2_002_partial_05_0141,
  ep_Q2_002_partial_05_0142,
  ep_Q2_002_partial_05_0143,
  ep_Q2_002_partial_05_0144,
  ep_Q2_002_partial_05_0145,
  ep_Q2_002_partial_05_0146,
  ep_Q2_002_partial_05_0147,
  ep_Q2_002_partial_05_0148,
  ep_Q2_002_partial_05_0149,
  ep_Q2_002_partial_05_0150,
  ep_Q2_002_partial_05_0151,
  ep_Q2_002_partial_05_0152,
  ep_Q2_002_partial_05_0153,
  ep_Q2_002_partial_05_0154,
  ep_Q2_002_partial_05_0155,
  ep_Q2_002_partial_05_0156,
  ep_Q2_002_partial_05_0157,
  ep_Q2_002_partial_05_0158,
  ep_Q2_002_partial_05_0159,
  ep_Q2_002_partial_05_0160,
  ep_Q2_002_partial_05_0161,
  ep_Q2_002_partial_05_0162,
  ep_Q2_002_partial_05_0163,
  ep_Q2_002_partial_05_0164,
  ep_Q2_002_partial_05_0165,
  ep_Q2_002_partial_05_0166,
  ep_Q2_002_partial_05_0167,
  ep_Q2_002_partial_05_0168,
  ep_Q2_002_partial_05_0169,
  ep_Q2_002_partial_05_0170,
  ep_Q2_002_partial_05_0171,
  ep_Q2_002_partial_05_0172,
  ep_Q2_002_partial_05_0173,
  ep_Q2_002_partial_05_0174,
  ep_Q2_002_partial_05_0175,
  ep_Q2_002_partial_05_0176,
  ep_Q2_002_partial_05_0177,
  ep_Q2_002_partial_05_0178,
  ep_Q2_002_partial_05_0179,
  ep_Q2_002_partial_05_0180,
  ep_Q2_002_partial_05_0181,
  ep_Q2_002_partial_05_0182,
  ep_Q2_002_partial_05_0183,
  ep_Q2_002_partial_05_0184,
  ep_Q2_002_partial_05_0185,
  ep_Q2_002_partial_05_0186,
  ep_Q2_002_partial_05_0187,
  ep_Q2_002_partial_05_0188,
  ep_Q2_002_partial_05_0189,
  ep_Q2_002_partial_05_0190,
  ep_Q2_002_partial_05_0191,
  ep_Q2_002_partial_05_0192,
  ep_Q2_002_partial_05_0193,
  ep_Q2_002_partial_05_0194,
  ep_Q2_002_partial_05_0195,
  ep_Q2_002_partial_05_0196,
  ep_Q2_002_partial_05_0197,
  ep_Q2_002_partial_05_0198,
  ep_Q2_002_partial_05_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_05_0100_0199 : Poly :=
[
  term ((831652167821454348923098525929463676895048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (8, 1), (11, 1), (15, 1)],
  term ((41805008824 : Rat) / 7401317245) [(0, 1), (2, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (8, 1), (11, 2)],
  term ((-89876880476935414548839420437296 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (8, 1), (13, 1), (15, 1)],
  term ((409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (8, 1), (15, 2)],
  term ((-18957995568 : Rat) / 7401317245) [(0, 1), (2, 2), (8, 1), (15, 2), (16, 1)],
  term ((-67670663375959196293167999891984 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((153240585703350905316950174203632 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-288580720519965785405378285790144 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1092032002445146020239122670864715258073776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1)],
  term ((-126701519248 : Rat) / 7401317245) [(0, 1), (2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((127436531943974013639015935934528 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((232595212820328484502089918147776 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (13, 1), (14, 1)],
  term ((144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1)],
  term ((129020865416 : Rat) / 7401317245) [(0, 1), (2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((329587248474110112372730627557386324550048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((52344163524 : Rat) / 7401317245) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((2936488668261891734355301313208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1139274210267573340165816523165458632954828 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3177893687 : Rat) / 1057331035) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3102983718628203181503191187756 : Rat) / 11272482215364523786105976789) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((131351757683407942081484373886008 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (13, 1), (14, 1)],
  term ((2533679351519144175315722592280229758568634 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-88793118511 : Rat) / 14802634490) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((11965502253079737810983883427128 : Rat) / 97983883872014706756151952089) [(0, 1), (2, 2), (11, 2)],
  term ((-6338322651330666033389168191200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2), (12, 1)],
  term ((8624085031561425102432 : Rat) / 253528477699481291099) [(0, 1), (2, 2), (12, 1)],
  term ((-160678170289940608721475943666926566002524 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3776808185 : Rat) / 1480263449) [(0, 1), (2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1540748476605497386671363203424 : Rat) / 115799135485108289802725034287) [(0, 1), (2, 2), (12, 1), (13, 2)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (2, 2), (12, 1), (14, 1)],
  term ((-112270380224586134856278149926667122141636 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (12, 1), (15, 2)],
  term ((7005830553 : Rat) / 1480263449) [(0, 1), (2, 2), (12, 1), (15, 2), (16, 1)],
  term ((1775897806906642497252522763511886966126468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-40474751441 : Rat) / 7401317245) [(0, 1), (2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66949502039620897803549118196989238420202 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((10180461029 : Rat) / 2960526898) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((54269929024500907754626607810352 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (13, 2)],
  term ((-247359958198155960380778080576736 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (13, 2), (14, 1)],
  term ((8384831320520626695636 : Rat) / 253528477699481291099) [(0, 1), (2, 2), (14, 1)],
  term ((71413882592230008843379340676424184334942 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (2, 2), (15, 2)],
  term ((-1551577493 : Rat) / 250892110) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((831652167821454348923098525929463676895048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (8, 1), (11, 1), (15, 1)],
  term ((41805008824 : Rat) / 7401317245) [(0, 1), (3, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (8, 1), (11, 2)],
  term ((-89876880476935414548839420437296 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (8, 1), (13, 1), (15, 1)],
  term ((409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (8, 1), (15, 2)],
  term ((-18957995568 : Rat) / 7401317245) [(0, 1), (3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-67670663375959196293167999891984 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((153240585703350905316950174203632 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1), (14, 1)],
  term ((-288580720519965785405378285790144 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-1092032002445146020239122670864715258073776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1)],
  term ((-126701519248 : Rat) / 7401317245) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((127436531943974013639015935934528 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((232595212820328484502089918147776 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (13, 1), (14, 1)],
  term ((144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1)],
  term ((129020865416 : Rat) / 7401317245) [(0, 1), (3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((329587248474110112372730627557386324550048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((52344163524 : Rat) / 7401317245) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((2936488668261891734355301313208 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-1139274210267573340165816523165458632954828 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-3177893687 : Rat) / 1057331035) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3102983718628203181503191187756 : Rat) / 11272482215364523786105976789) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((131351757683407942081484373886008 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (13, 1), (14, 1)],
  term ((2533679351519144175315722592280229758568634 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-88793118511 : Rat) / 14802634490) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((11965502253079737810983883427128 : Rat) / 97983883872014706756151952089) [(0, 1), (3, 2), (11, 2)],
  term ((-6338322651330666033389168191200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2), (12, 1)],
  term ((8624085031561425102432 : Rat) / 253528477699481291099) [(0, 1), (3, 2), (12, 1)],
  term ((-160678170289940608721475943666926566002524 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3776808185 : Rat) / 1480263449) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1540748476605497386671363203424 : Rat) / 115799135485108289802725034287) [(0, 1), (3, 2), (12, 1), (13, 2)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (3, 2), (12, 1), (14, 1)],
  term ((-112270380224586134856278149926667122141636 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (12, 1), (15, 2)],
  term ((7005830553 : Rat) / 1480263449) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((1775897806906642497252522763511886966126468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-40474751441 : Rat) / 7401317245) [(0, 1), (3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66949502039620897803549118196989238420202 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((10180461029 : Rat) / 2960526898) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((54269929024500907754626607810352 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (13, 2)],
  term ((-247359958198155960380778080576736 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (13, 2), (14, 1)],
  term ((8384831320520626695636 : Rat) / 253528477699481291099) [(0, 1), (3, 2), (14, 1)],
  term ((71413882592230008843379340676424184334942 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (3, 2), (15, 2)],
  term ((-1551577493 : Rat) / 250892110) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-831652167821454348923098525929463676895048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-831652167821454348923098525929463676895048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (11, 1), (15, 3)],
  term ((-41805008824 : Rat) / 7401317245) [(0, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2), (14, 2)],
  term ((30983962068450231303346308567828 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2), (15, 2)],
  term ((89876880476935414548839420437296 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((89876880476935414548839420437296 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 1), (15, 3)],
  term ((-409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((18957995568 : Rat) / 7401317245) [(0, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-409002018758747343703476791282648168559684 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 4)],
  term ((18957995568 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 4), (16, 1)],
  term ((-153240585703350905316950174203632 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-153240585703350905316950174203632 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((67670663375959196293167999891984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((123511461819628685226167588686128 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (14, 3)],
  term ((67670663375959196293167999891984 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((288580720519965785405378285790144 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((288580720519965785405378285790144 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1092032002445146020239122670864715258073776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((126701519248 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1092032002445146020239122670864715258073776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((126701519248 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-232595212820328484502089918147776 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-127436531943974013639015935934528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-232595212820328484502089918147776 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1), (14, 3)],
  term ((-127436531943974013639015935934528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((-129020865416 : Rat) / 7401317245) [(0, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-329587248474110112372730627557386324550048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-52344163524 : Rat) / 7401317245) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-144394398107159774586391845969578684867664 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (9, 1), (14, 3), (15, 1)],
  term ((-129020865416 : Rat) / 7401317245) [(0, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-329587248474110112372730627557386324550048 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 3)],
  term ((-52344163524 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-2936488668261891734355301313208 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-2936488668261891734355301313208 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1139274210267573340165816523165458632954828 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((3177893687 : Rat) / 1057331035) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1139274210267573340165816523165458632954828 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((3177893687 : Rat) / 1057331035) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-131351757683407942081484373886008 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3102983718628203181503191187756 : Rat) / 11272482215364523786105976789) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-131351757683407942081484373886008 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 3)],
  term ((3102983718628203181503191187756 : Rat) / 11272482215364523786105976789) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2533679351519144175315722592280229758568634 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((88793118511 : Rat) / 14802634490) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2533679351519144175315722592280229758568634 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (15, 3)],
  term ((88793118511 : Rat) / 14802634490) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((6338322651330666033389168191200 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1), (14, 2)],
  term ((6338322651330666033389168191200 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-11965502253079737810983883427128 : Rat) / 97983883872014706756151952089) [(0, 1), (11, 2), (14, 2)],
  term ((-11965502253079737810983883427128 : Rat) / 97983883872014706756151952089) [(0, 1), (11, 2), (15, 2)],
  term ((160678170289940608721475943666926566002524 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3776808185 : Rat) / 1480263449) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((160678170289940608721475943666926566002524 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((3776808185 : Rat) / 1480263449) [(0, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1540748476605497386671363203424 : Rat) / 115799135485108289802725034287) [(0, 1), (12, 1), (13, 2), (14, 2)],
  term ((-1540748476605497386671363203424 : Rat) / 115799135485108289802725034287) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8624085031561425102432 : Rat) / 253528477699481291099) [(0, 1), (12, 1), (14, 2)],
  term ((112270380224586134856278149926667122141636 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-7005830553 : Rat) / 1480263449) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (12, 1), (14, 3)],
  term ((-8624085031561425102432 : Rat) / 253528477699481291099) [(0, 1), (12, 1), (15, 2)],
  term ((112270380224586134856278149926667122141636 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (12, 1), (15, 4)],
  term ((-7005830553 : Rat) / 1480263449) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((-1775897806906642497252522763511886966126468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((40474751441 : Rat) / 7401317245) [(0, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((66949502039620897803549118196989238420202 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((-10180461029 : Rat) / 2960526898) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1775897806906642497252522763511886966126468 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((40474751441 : Rat) / 7401317245) [(0, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((66949502039620897803549118196989238420202 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (13, 1), (15, 3)],
  term ((-10180461029 : Rat) / 2960526898) [(0, 1), (13, 1), (15, 3), (16, 1)],
  term ((247359958198155960380778080576736 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((-54269929024500907754626607810352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 2)],
  term ((247359958198155960380778080576736 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 3)],
  term ((-54269929024500907754626607810352 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (15, 2)],
  term ((-8384831320520626695636 : Rat) / 253528477699481291099) [(0, 1), (14, 1), (15, 2)],
  term ((-71413882592230008843379340676424184334942 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (14, 2), (15, 2)],
  term ((1551577493 : Rat) / 250892110) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8384831320520626695636 : Rat) / 253528477699481291099) [(0, 1), (14, 3)],
  term ((-71413882592230008843379340676424184334942 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (15, 4)],
  term ((1551577493 : Rat) / 250892110) [(0, 1), (15, 4), (16, 1)],
  term ((2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (2, 2), (11, 1)],
  term ((-2707536438589440351893277608640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (2, 2), (13, 1)],
  term ((2034121859792476304871123189120 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (2, 2), (15, 1)],
  term ((2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 2), (11, 1)],
  term ((-2707536438589440351893277608640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 2), (13, 1)],
  term ((2034121859792476304871123189120 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (3, 2), (15, 1)],
  term ((-2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1), (14, 2)],
  term ((-2794367418875165877431952490080 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (11, 1), (15, 2)],
  term ((2707536438589440351893277608640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1), (14, 2)],
  term ((2707536438589440351893277608640 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (13, 1), (15, 2)],
  term ((-2034121859792476304871123189120 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (14, 2), (15, 1)],
  term ((-2034121859792476304871123189120 : Rat) / 1273790490336191187829975377157) [(0, 2), (1, 1), (15, 3)],
  term ((10243570116992397104464779402000 : Rat) / 115799135485108289802725034287) [(0, 2), (2, 2), (11, 1), (13, 1)],
  term ((-1235781605153867006504862113790510887465484 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (2, 2), (11, 1), (15, 1)],
  term ((-5296248637 : Rat) / 7401317245) [(0, 2), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (2, 2), (11, 2)],
  term ((-384633538132227895282012090432460793350064 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (2, 2), (13, 1), (15, 1)],
  term ((-5156573816 : Rat) / 1057331035) [(0, 2), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-72087755965569949561605307229760 : Rat) / 1273790490336191187829975377157) [(0, 2), (2, 2), (13, 2)],
  term ((-1172726081615471757478512463565702394468588 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (2, 2), (15, 2)],
  term ((-12079962499 : Rat) / 7401317245) [(0, 2), (2, 2), (15, 2), (16, 1)],
  term ((10243570116992397104464779402000 : Rat) / 115799135485108289802725034287) [(0, 2), (3, 2), (11, 1), (13, 1)],
  term ((-1235781605153867006504862113790510887465484 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 2), (11, 1), (15, 1)],
  term ((-5296248637 : Rat) / 7401317245) [(0, 2), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 2), (11, 2)],
  term ((-384633538132227895282012090432460793350064 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 2), (13, 1), (15, 1)],
  term ((-5156573816 : Rat) / 1057331035) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-72087755965569949561605307229760 : Rat) / 1273790490336191187829975377157) [(0, 2), (3, 2), (13, 2)],
  term ((-1172726081615471757478512463565702394468588 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (3, 2), (15, 2)],
  term ((-12079962499 : Rat) / 7401317245) [(0, 2), (3, 2), (15, 2), (16, 1)],
  term ((-10243570116992397104464779402000 : Rat) / 115799135485108289802725034287) [(0, 2), (11, 1), (13, 1), (14, 2)],
  term ((-10243570116992397104464779402000 : Rat) / 115799135485108289802725034287) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((1235781605153867006504862113790510887465484 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((5296248637 : Rat) / 7401317245) [(0, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1235781605153867006504862113790510887465484 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (11, 1), (15, 3)],
  term ((5296248637 : Rat) / 7401317245) [(0, 2), (11, 1), (15, 3), (16, 1)],
  term ((39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2), (14, 2)],
  term ((39507285890670079124849207105160 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2), (15, 2)],
  term ((384633538132227895282012090432460793350064 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((5156573816 : Rat) / 1057331035) [(0, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((384633538132227895282012090432460793350064 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (13, 1), (15, 3)],
  term ((5156573816 : Rat) / 1057331035) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((72087755965569949561605307229760 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2), (14, 2)],
  term ((72087755965569949561605307229760 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2), (15, 2)],
  term ((1172726081615471757478512463565702394468588 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (14, 2), (15, 2)],
  term ((12079962499 : Rat) / 7401317245) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((1172726081615471757478512463565702394468588 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 4)],
  term ((12079962499 : Rat) / 7401317245) [(0, 2), (15, 4), (16, 1)],
  term ((3169907838125355602680941902152 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1)],
  term ((-4522903905718637406642463940232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1), (12, 1)],
  term ((293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1), (5, 1), (7, 1)],
  term ((496493460617764432390921366960 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((-2193844582441344353098670609552 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (6, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (6, 1), (8, 1)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (6, 1), (12, 1)],
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (9, 1)],
  term ((48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (11, 1)],
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (13, 1)],
  term ((-280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1)],
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 2)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (8, 1), (14, 1)],
  term ((-11172681177833319044148020650560 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((-16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1)],
  term ((-516094866507150261866289815328 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((-110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (12, 1), (14, 1)],
  term ((35792000005711292123674637513472 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((1250244805279446163501611711928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (14, 1)],
  term ((93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((12746693892 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-3035774565090429975166664251648 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (4, 1), (5, 1), (6, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1), (12, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1), (14, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (6, 1), (7, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (6, 1), (9, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (6, 1), (11, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (6, 1), (13, 1)],
  term ((-544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (4, 1), (6, 1), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-289763440048781996311981960496 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (4, 1), (7, 1)],
  term ((-15788657520600529006276867057568 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1), (14, 1)],
  term ((-7149457894376629228209691008672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (9, 1), (12, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (9, 1), (14, 1)],
  term ((-175629759843457334575856130076592 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((46922556256577397796934279964928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1), (12, 1)],
  term ((7662739408784951756120741070864 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1), (14, 1)],
  term ((-90603928466034994545790306761456 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (12, 1), (13, 1)],
  term ((-13180926155429499951545456812975297058608 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)],
  term ((-32745408244 : Rat) / 7401317245) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1), (14, 2)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2)],
  term ((4522903905718637406642463940232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (14, 2)],
  term ((4522903905718637406642463940232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (15, 2)],
  term ((-293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (14, 2)],
  term ((-293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (15, 2)],
  term ((-496493460617764432390921366960 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (14, 2), (15, 1)],
  term ((-496493460617764432390921366960 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1), (14, 2)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2)],
  term ((-220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1), (14, 2)],
  term ((-220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((2193844582441344353098670609552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (14, 2)],
  term ((2193844582441344353098670609552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (14, 2)],
  term ((-4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (15, 2)],
  term ((-48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 2)],
  term ((-48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1), (15, 2)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 2)],
  term ((91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((38240081676 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (15, 3), (16, 1)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (14, 2)],
  term ((-7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (15, 2)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 2)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (14, 3)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (15, 2)],
  term ((11172681177833319044148020650560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (14, 2), (15, 1)],
  term ((11172681177833319044148020650560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (14, 2), (15, 1)],
  term ((16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (15, 3)],
  term ((110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 1), (15, 2)],
  term ((516094866507150261866289815328 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 2)],
  term ((110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (14, 3)],
  term ((516094866507150261866289815328 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((-35792000005711292123674637513472 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-35792000005711292123674637513472 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-1250244805279446163501611711928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-3169907838125355602680941902152 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 2)],
  term ((-93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-12746693892 : Rat) / 7401317245) [(1, 1), (3, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1250244805279446163501611711928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (14, 3)],
  term ((-3169907838125355602680941902152 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (15, 2)],
  term ((-93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (15, 4)],
  term ((-12746693892 : Rat) / 7401317245) [(1, 1), (3, 1), (15, 4), (16, 1)],
  term ((-3035774565090429975166664251648 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (4, 1), (5, 1), (6, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1), (12, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (5, 1), (14, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (6, 1), (7, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (6, 1), (9, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (6, 1), (11, 1)],
  term ((-180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (6, 1), (13, 1)],
  term ((-544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (4, 1), (6, 1), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 2), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-289763440048781996311981960496 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (4, 1), (7, 1)],
  term ((-15788657520600529006276867057568 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (7, 1), (14, 1)],
  term ((-7149457894376629228209691008672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (9, 1), (12, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (9, 1), (14, 1)],
  term ((-175629759843457334575856130076592 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((46922556256577397796934279964928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1), (12, 1)],
  term ((7662739408784951756120741070864 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1), (14, 1)],
  term ((-90603928466034994545790306761456 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1)],
  term ((-13180926155429499951545456812975297058608 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1)],
  term ((-32745408244 : Rat) / 7401317245) [(1, 1), (3, 2), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((3169907838125355602680941902152 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3)],
  term ((-4522903905718637406642463940232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1), (12, 1)],
  term ((293202872377776764955952026672 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3), (5, 1), (7, 1)],
  term ((496493460617764432390921366960 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3), (5, 1), (15, 1)],
  term ((-2193844582441344353098670609552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (6, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (6, 1), (8, 1)],
  term ((220762092223164194300239016832 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (6, 1), (12, 1)],
  term ((4005898748197656272029018390464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (9, 1)],
  term ((48769389318681786619077197253696 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (11, 1)],
  term ((-91841893218476257533281816908032 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (13, 1)],
  term ((-280525801796873494666662416722937539712032 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (7, 1), (15, 1)],
  term ((-38240081676 : Rat) / 7401317245) [(1, 1), (3, 3), (7, 1), (15, 1), (16, 1)],
  term ((7204204305997681908132405180336 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 2)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (8, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (8, 1), (14, 1)],
  term ((-11172681177833319044148020650560 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (9, 1), (15, 1)],
  term ((-16256463106227262206359065751232 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (11, 1), (15, 1)],
  term ((-516094866507150261866289815328 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (12, 1)],
  term ((-110381046111582097150119508416 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (12, 1), (14, 1)],
  term ((35792000005711292123674637513472 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((1250244805279446163501611711928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (14, 1)],
  term ((93226209297131402749771715400552367977904 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (15, 2)],
  term ((12746693892 : Rat) / 7401317245) [(1, 1), (3, 3), (15, 2), (16, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 1), (14, 2)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (4, 1), (5, 1), (6, 1), (15, 2)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1), (14, 2)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (12, 1), (15, 2)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 1), (15, 2)],
  term ((3035774565090429975166664251648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 2)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (14, 3)],
  term ((3035774565090429975166664251648 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (5, 1), (15, 2)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (7, 1), (14, 2)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (7, 1), (15, 2)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1), (14, 2)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (9, 1), (15, 2)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (14, 2)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (11, 1), (15, 2)],
  term ((180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1), (14, 2)],
  term ((180149908791437660116842499482816 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((544357765996229898177570592103339301401184 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (6, 1), (15, 3)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((15788657520600529006276867057568 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((289763440048781996311981960496 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (7, 1), (14, 2)],
  term ((15788657520600529006276867057568 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (14, 3)],
  term ((289763440048781996311981960496 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (7, 1), (15, 2)],
  term ((-2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1), (14, 2)],
  term ((-2475909354812696910842502886464 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((7149457894376629228209691008672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 2)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (14, 3)],
  term ((7149457894376629228209691008672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (9, 1), (15, 2)],
  term ((-46922556256577397796934279964928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 2)],
  term ((-46922556256577397796934279964928 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((-7662739408784951756120741070864 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 1), (15, 2)],
  term ((175629759843457334575856130076592 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 2)],
  term ((-7662739408784951756120741070864 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (14, 3)],
  term ((175629759843457334575856130076592 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (15, 2)],
  term ((90603928466034994545790306761456 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 2)],
  term ((90603928466034994545790306761456 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((13180926155429499951545456812975297058608 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1)],
  term ((32745408244 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((13180926155429499951545456812975297058608 : Rat) / 122438019774574775144195206323084197045) [(1, 1), (4, 1), (12, 1), (15, 3)],
  term ((32745408244 : Rat) / 7401317245) [(1, 1), (4, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 100 through 199. -/
theorem ep_Q2_002_block_05_0100_0199_valid :
    checkProductSumEq ep_Q2_002_partials_05_0100_0199
      ep_Q2_002_block_05_0100_0199 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
