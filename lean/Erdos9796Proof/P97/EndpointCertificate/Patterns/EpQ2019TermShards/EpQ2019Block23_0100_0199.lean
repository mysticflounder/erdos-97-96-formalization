/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 23:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_23_0100_0199 : Poly :=
[
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0100 : Poly :=
[
  term ((382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 23. -/
def ep_Q2_019_partial_23_0100 : Poly :=
[
  term ((765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 23. -/
theorem ep_Q2_019_partial_23_0100_valid :
    mulPoly ep_Q2_019_coefficient_23_0100
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0101 : Poly :=
[
  term ((-720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 101 for generator 23. -/
def ep_Q2_019_partial_23_0101 : Poly :=
[
  term ((-1441130114941631249262935854914341994448 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1441130114941631249262935854914341994448 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 23. -/
theorem ep_Q2_019_partial_23_0101_valid :
    mulPoly ep_Q2_019_coefficient_23_0101
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0102 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 23. -/
def ep_Q2_019_partial_23_0102 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 23. -/
theorem ep_Q2_019_partial_23_0102_valid :
    mulPoly ep_Q2_019_coefficient_23_0102
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0103 : Poly :=
[
  term ((-932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 23. -/
def ep_Q2_019_partial_23_0103 : Poly :=
[
  term ((-1864833718227385979939373956618291795488 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1864833718227385979939373956618291795488 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 23. -/
theorem ep_Q2_019_partial_23_0103_valid :
    mulPoly ep_Q2_019_coefficient_23_0103
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0104 : Poly :=
[
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 104 for generator 23. -/
def ep_Q2_019_partial_23_0104 : Poly :=
[
  term ((1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 23. -/
theorem ep_Q2_019_partial_23_0104_valid :
    mulPoly ep_Q2_019_coefficient_23_0104
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0105 : Poly :=
[
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 23. -/
def ep_Q2_019_partial_23_0105 : Poly :=
[
  term ((-13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 23. -/
theorem ep_Q2_019_partial_23_0105_valid :
    mulPoly ep_Q2_019_coefficient_23_0105
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0106 : Poly :=
[
  term ((1862120133705482853442141281527625647380 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 23. -/
def ep_Q2_019_partial_23_0106 : Poly :=
[
  term ((3724240267410965706884282563055251294760 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((3724240267410965706884282563055251294760 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1862120133705482853442141281527625647380 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1862120133705482853442141281527625647380 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 23. -/
theorem ep_Q2_019_partial_23_0106_valid :
    mulPoly ep_Q2_019_coefficient_23_0106
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0107 : Poly :=
[
  term ((19206546135168388861158692279781805888282 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 23. -/
def ep_Q2_019_partial_23_0107 : Poly :=
[
  term ((38413092270336777722317384559563611776564 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((38413092270336777722317384559563611776564 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-19206546135168388861158692279781805888282 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19206546135168388861158692279781805888282 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 23. -/
theorem ep_Q2_019_partial_23_0107_valid :
    mulPoly ep_Q2_019_coefficient_23_0107
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0108 : Poly :=
[
  term ((15565876592472530412607344065160680856 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (16, 1)]
]

/-- Partial product 108 for generator 23. -/
def ep_Q2_019_partial_23_0108 : Poly :=
[
  term ((31131753184945060825214688130321361712 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((31131753184945060825214688130321361712 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15565876592472530412607344065160680856 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((-15565876592472530412607344065160680856 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 23. -/
theorem ep_Q2_019_partial_23_0108_valid :
    mulPoly ep_Q2_019_coefficient_23_0108
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0109 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 109 for generator 23. -/
def ep_Q2_019_partial_23_0109 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 23. -/
theorem ep_Q2_019_partial_23_0109_valid :
    mulPoly ep_Q2_019_coefficient_23_0109
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0110 : Poly :=
[
  term ((-273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 110 for generator 23. -/
def ep_Q2_019_partial_23_0110 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 23. -/
theorem ep_Q2_019_partial_23_0110_valid :
    mulPoly ep_Q2_019_coefficient_23_0110
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0111 : Poly :=
[
  term ((2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 23. -/
def ep_Q2_019_partial_23_0111 : Poly :=
[
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 23. -/
theorem ep_Q2_019_partial_23_0111_valid :
    mulPoly ep_Q2_019_coefficient_23_0111
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0112 : Poly :=
[
  term ((-68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 23. -/
def ep_Q2_019_partial_23_0112 : Poly :=
[
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 23. -/
theorem ep_Q2_019_partial_23_0112_valid :
    mulPoly ep_Q2_019_coefficient_23_0112
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0113 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 113 for generator 23. -/
def ep_Q2_019_partial_23_0113 : Poly :=
[
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 23. -/
theorem ep_Q2_019_partial_23_0113_valid :
    mulPoly ep_Q2_019_coefficient_23_0113
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0114 : Poly :=
[
  term ((-973009972387472517216814927034449016272 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 23. -/
def ep_Q2_019_partial_23_0114 : Poly :=
[
  term ((-1946019944774945034433629854068898032544 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1946019944774945034433629854068898032544 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((973009972387472517216814927034449016272 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((973009972387472517216814927034449016272 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 23. -/
theorem ep_Q2_019_partial_23_0114_valid :
    mulPoly ep_Q2_019_coefficient_23_0114
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0115 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 23. -/
def ep_Q2_019_partial_23_0115 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 23. -/
theorem ep_Q2_019_partial_23_0115_valid :
    mulPoly ep_Q2_019_coefficient_23_0115
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0116 : Poly :=
[
  term ((6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 116 for generator 23. -/
def ep_Q2_019_partial_23_0116 : Poly :=
[
  term ((13395691091101430223044179219949328432 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((13395691091101430223044179219949328432 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 23. -/
theorem ep_Q2_019_partial_23_0116_valid :
    mulPoly ep_Q2_019_coefficient_23_0116
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0117 : Poly :=
[
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 23. -/
def ep_Q2_019_partial_23_0117 : Poly :=
[
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 23. -/
theorem ep_Q2_019_partial_23_0117_valid :
    mulPoly ep_Q2_019_coefficient_23_0117
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0118 : Poly :=
[
  term ((-645025072871534759082745821959534076 : Rat) / 178848327779385700564491211899333649) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 118 for generator 23. -/
def ep_Q2_019_partial_23_0118 : Poly :=
[
  term ((-1290050145743069518165491643919068152 : Rat) / 178848327779385700564491211899333649) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-1290050145743069518165491643919068152 : Rat) / 178848327779385700564491211899333649) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((645025072871534759082745821959534076 : Rat) / 178848327779385700564491211899333649) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((645025072871534759082745821959534076 : Rat) / 178848327779385700564491211899333649) [(4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 23. -/
theorem ep_Q2_019_partial_23_0118_valid :
    mulPoly ep_Q2_019_coefficient_23_0118
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0119 : Poly :=
[
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 23. -/
def ep_Q2_019_partial_23_0119 : Poly :=
[
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 23. -/
theorem ep_Q2_019_partial_23_0119_valid :
    mulPoly ep_Q2_019_coefficient_23_0119
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0120 : Poly :=
[
  term ((-27025204005239713386443896043061245551748 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (16, 1)]
]

/-- Partial product 120 for generator 23. -/
def ep_Q2_019_partial_23_0120 : Poly :=
[
  term ((-54050408010479426772887792086122491103496 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-54050408010479426772887792086122491103496 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((27025204005239713386443896043061245551748 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (14, 2), (16, 1)],
  term ((27025204005239713386443896043061245551748 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 23. -/
theorem ep_Q2_019_partial_23_0120_valid :
    mulPoly ep_Q2_019_coefficient_23_0120
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0121 : Poly :=
[
  term ((-70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 121 for generator 23. -/
def ep_Q2_019_partial_23_0121 : Poly :=
[
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 23. -/
theorem ep_Q2_019_partial_23_0121_valid :
    mulPoly ep_Q2_019_coefficient_23_0121
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0122 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 122 for generator 23. -/
def ep_Q2_019_partial_23_0122 : Poly :=
[
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 23. -/
theorem ep_Q2_019_partial_23_0122_valid :
    mulPoly ep_Q2_019_coefficient_23_0122
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0123 : Poly :=
[
  term ((508241545232579852516713263101133752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 123 for generator 23. -/
def ep_Q2_019_partial_23_0123 : Poly :=
[
  term ((1016483090465159705033426526202267504 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((1016483090465159705033426526202267504 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-508241545232579852516713263101133752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-508241545232579852516713263101133752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 23. -/
theorem ep_Q2_019_partial_23_0123_valid :
    mulPoly ep_Q2_019_coefficient_23_0123
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0124 : Poly :=
[
  term ((140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 23. -/
def ep_Q2_019_partial_23_0124 : Poly :=
[
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 23. -/
theorem ep_Q2_019_partial_23_0124_valid :
    mulPoly ep_Q2_019_coefficient_23_0124
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0125 : Poly :=
[
  term ((-13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 125 for generator 23. -/
def ep_Q2_019_partial_23_0125 : Poly :=
[
  term ((-27168199822743881407514729462329212736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-27168199822743881407514729462329212736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 23. -/
theorem ep_Q2_019_partial_23_0125_valid :
    mulPoly ep_Q2_019_coefficient_23_0125
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0126 : Poly :=
[
  term ((-3909173154792011910637107772311233416 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 126 for generator 23. -/
def ep_Q2_019_partial_23_0126 : Poly :=
[
  term ((-7818346309584023821274215544622466832 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-7818346309584023821274215544622466832 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3909173154792011910637107772311233416 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((3909173154792011910637107772311233416 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 23. -/
theorem ep_Q2_019_partial_23_0126_valid :
    mulPoly ep_Q2_019_coefficient_23_0126
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0127 : Poly :=
[
  term ((-281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 23. -/
def ep_Q2_019_partial_23_0127 : Poly :=
[
  term ((-563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 23. -/
theorem ep_Q2_019_partial_23_0127_valid :
    mulPoly ep_Q2_019_coefficient_23_0127
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0128 : Poly :=
[
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 128 for generator 23. -/
def ep_Q2_019_partial_23_0128 : Poly :=
[
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 23. -/
theorem ep_Q2_019_partial_23_0128_valid :
    mulPoly ep_Q2_019_coefficient_23_0128
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0129 : Poly :=
[
  term ((-3267737933605728492264899535411131136 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 129 for generator 23. -/
def ep_Q2_019_partial_23_0129 : Poly :=
[
  term ((-6535475867211456984529799070822262272 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3267737933605728492264899535411131136 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((3267737933605728492264899535411131136 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6535475867211456984529799070822262272 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 23. -/
theorem ep_Q2_019_partial_23_0129_valid :
    mulPoly ep_Q2_019_coefficient_23_0129
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0130 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 23. -/
def ep_Q2_019_partial_23_0130 : Poly :=
[
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 23. -/
theorem ep_Q2_019_partial_23_0130_valid :
    mulPoly ep_Q2_019_coefficient_23_0130
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0131 : Poly :=
[
  term ((3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 131 for generator 23. -/
def ep_Q2_019_partial_23_0131 : Poly :=
[
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 23. -/
theorem ep_Q2_019_partial_23_0131_valid :
    mulPoly ep_Q2_019_coefficient_23_0131
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0132 : Poly :=
[
  term ((-1834237919483261606914782575180078530276 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 23. -/
def ep_Q2_019_partial_23_0132 : Poly :=
[
  term ((-3668475838966523213829565150360157060552 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3668475838966523213829565150360157060552 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((1834237919483261606914782575180078530276 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((1834237919483261606914782575180078530276 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 23. -/
theorem ep_Q2_019_partial_23_0132_valid :
    mulPoly ep_Q2_019_coefficient_23_0132
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0133 : Poly :=
[
  term ((-2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 133 for generator 23. -/
def ep_Q2_019_partial_23_0133 : Poly :=
[
  term ((-4266165096867061381656339776783429568 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4266165096867061381656339776783429568 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 23. -/
theorem ep_Q2_019_partial_23_0133_valid :
    mulPoly ep_Q2_019_coefficient_23_0133
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0134 : Poly :=
[
  term ((1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 134 for generator 23. -/
def ep_Q2_019_partial_23_0134 : Poly :=
[
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 23. -/
theorem ep_Q2_019_partial_23_0134_valid :
    mulPoly ep_Q2_019_coefficient_23_0134
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0135 : Poly :=
[
  term ((7187276551780592674399242064371423792 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 135 for generator 23. -/
def ep_Q2_019_partial_23_0135 : Poly :=
[
  term ((14374553103561185348798484128742847584 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((14374553103561185348798484128742847584 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7187276551780592674399242064371423792 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-7187276551780592674399242064371423792 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 23. -/
theorem ep_Q2_019_partial_23_0135_valid :
    mulPoly ep_Q2_019_coefficient_23_0135
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0136 : Poly :=
[
  term ((-6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 136 for generator 23. -/
def ep_Q2_019_partial_23_0136 : Poly :=
[
  term ((-13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 23. -/
theorem ep_Q2_019_partial_23_0136_valid :
    mulPoly ep_Q2_019_coefficient_23_0136
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0137 : Poly :=
[
  term ((36876271424823951171342213946584236352 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 137 for generator 23. -/
def ep_Q2_019_partial_23_0137 : Poly :=
[
  term ((73752542849647902342684427893168472704 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((73752542849647902342684427893168472704 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36876271424823951171342213946584236352 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-36876271424823951171342213946584236352 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 23. -/
theorem ep_Q2_019_partial_23_0137_valid :
    mulPoly ep_Q2_019_coefficient_23_0137
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0138 : Poly :=
[
  term ((-6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (16, 1)]
]

/-- Partial product 138 for generator 23. -/
def ep_Q2_019_partial_23_0138 : Poly :=
[
  term ((-12568004337360569948837175642739682304 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-12568004337360569948837175642739682304 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (14, 2), (16, 1)],
  term ((6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 23. -/
theorem ep_Q2_019_partial_23_0138_valid :
    mulPoly ep_Q2_019_coefficient_23_0138
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0139 : Poly :=
[
  term ((887504388702050349615120514004950485792 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 139 for generator 23. -/
def ep_Q2_019_partial_23_0139 : Poly :=
[
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-887504388702050349615120514004950485792 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-887504388702050349615120514004950485792 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 23. -/
theorem ep_Q2_019_partial_23_0139_valid :
    mulPoly ep_Q2_019_coefficient_23_0139
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0140 : Poly :=
[
  term ((-126782022460846563181029064609042716231 : Rat) / 5155040035994058428035334931216087530) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 23. -/
def ep_Q2_019_partial_23_0140 : Poly :=
[
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 5155040035994058428035334931216087530) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 5155040035994058428035334931216087530) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 23. -/
theorem ep_Q2_019_partial_23_0140_valid :
    mulPoly ep_Q2_019_coefficient_23_0140
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0141 : Poly :=
[
  term ((-16922905169502105158858008857650477460 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 141 for generator 23. -/
def ep_Q2_019_partial_23_0141 : Poly :=
[
  term ((-33845810339004210317716017715300954920 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-33845810339004210317716017715300954920 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16922905169502105158858008857650477460 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((16922905169502105158858008857650477460 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 23. -/
theorem ep_Q2_019_partial_23_0141_valid :
    mulPoly ep_Q2_019_coefficient_23_0141
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0142 : Poly :=
[
  term ((-2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 142 for generator 23. -/
def ep_Q2_019_partial_23_0142 : Poly :=
[
  term ((-4319568273781145974427467457773246416 : Rat) / 894241638896928502822456059496668245) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-4319568273781145974427467457773246416 : Rat) / 894241638896928502822456059496668245) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(6, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 23. -/
theorem ep_Q2_019_partial_23_0142_valid :
    mulPoly ep_Q2_019_coefficient_23_0142
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0143 : Poly :=
[
  term ((6878685233105954662560597275538454509181 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (16, 1)]
]

/-- Partial product 143 for generator 23. -/
def ep_Q2_019_partial_23_0143 : Poly :=
[
  term ((6878685233105954662560597275538454509181 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((6878685233105954662560597275538454509181 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6878685233105954662560597275538454509181 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (14, 2), (16, 1)],
  term ((-6878685233105954662560597275538454509181 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 23. -/
theorem ep_Q2_019_partial_23_0143_valid :
    mulPoly ep_Q2_019_coefficient_23_0143
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0144 : Poly :=
[
  term ((-16969914485941911892132325463572398704 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (16, 1)]
]

/-- Partial product 144 for generator 23. -/
def ep_Q2_019_partial_23_0144 : Poly :=
[
  term ((-33939828971883823784264650927144797408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-33939828971883823784264650927144797408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((16969914485941911892132325463572398704 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (14, 2), (16, 1)],
  term ((16969914485941911892132325463572398704 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 23. -/
theorem ep_Q2_019_partial_23_0144_valid :
    mulPoly ep_Q2_019_coefficient_23_0144
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0145 : Poly :=
[
  term ((-385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 145 for generator 23. -/
def ep_Q2_019_partial_23_0145 : Poly :=
[
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 23. -/
theorem ep_Q2_019_partial_23_0145_valid :
    mulPoly ep_Q2_019_coefficient_23_0145
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0146 : Poly :=
[
  term ((-1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 23. -/
def ep_Q2_019_partial_23_0146 : Poly :=
[
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 23. -/
theorem ep_Q2_019_partial_23_0146_valid :
    mulPoly ep_Q2_019_coefficient_23_0146
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0147 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 147 for generator 23. -/
def ep_Q2_019_partial_23_0147 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 23. -/
theorem ep_Q2_019_partial_23_0147_valid :
    mulPoly ep_Q2_019_coefficient_23_0147
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0148 : Poly :=
[
  term ((989865042058012597243001037344307135536 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 148 for generator 23. -/
def ep_Q2_019_partial_23_0148 : Poly :=
[
  term ((1979730084116025194486002074688614271072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1979730084116025194486002074688614271072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-989865042058012597243001037344307135536 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-989865042058012597243001037344307135536 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 23. -/
theorem ep_Q2_019_partial_23_0148_valid :
    mulPoly ep_Q2_019_coefficient_23_0148
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0149 : Poly :=
[
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 23. -/
def ep_Q2_019_partial_23_0149 : Poly :=
[
  term ((-261817513850340863123825131756093824 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-261817513850340863123825131756093824 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 23. -/
theorem ep_Q2_019_partial_23_0149_valid :
    mulPoly ep_Q2_019_coefficient_23_0149
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0150 : Poly :=
[
  term ((5708780558187003275467077906148055838938 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 150 for generator 23. -/
def ep_Q2_019_partial_23_0150 : Poly :=
[
  term ((11417561116374006550934155812296111677876 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((11417561116374006550934155812296111677876 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5708780558187003275467077906148055838938 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5708780558187003275467077906148055838938 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 23. -/
theorem ep_Q2_019_partial_23_0150_valid :
    mulPoly ep_Q2_019_coefficient_23_0150
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0151 : Poly :=
[
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 151 for generator 23. -/
def ep_Q2_019_partial_23_0151 : Poly :=
[
  term ((1275568726505004929728451025583807488 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1275568726505004929728451025583807488 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 23. -/
theorem ep_Q2_019_partial_23_0151_valid :
    mulPoly ep_Q2_019_coefficient_23_0151
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0152 : Poly :=
[
  term ((-39372931123919240970663571141014869051 : Rat) / 357696655558771401128982423798667298) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 152 for generator 23. -/
def ep_Q2_019_partial_23_0152 : Poly :=
[
  term ((-39372931123919240970663571141014869051 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-39372931123919240970663571141014869051 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((39372931123919240970663571141014869051 : Rat) / 357696655558771401128982423798667298) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((39372931123919240970663571141014869051 : Rat) / 357696655558771401128982423798667298) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 23. -/
theorem ep_Q2_019_partial_23_0152_valid :
    mulPoly ep_Q2_019_coefficient_23_0152
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0153 : Poly :=
[
  term ((770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 153 for generator 23. -/
def ep_Q2_019_partial_23_0153 : Poly :=
[
  term ((1540127941080574199406953939251593054592 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1540127941080574199406953939251593054592 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 23. -/
theorem ep_Q2_019_partial_23_0153_valid :
    mulPoly ep_Q2_019_coefficient_23_0153
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0154 : Poly :=
[
  term ((3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 23. -/
def ep_Q2_019_partial_23_0154 : Poly :=
[
  term ((7379916461549714182853227262361079319168 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((7379916461549714182853227262361079319168 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 23. -/
theorem ep_Q2_019_partial_23_0154_valid :
    mulPoly ep_Q2_019_coefficient_23_0154
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0155 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 155 for generator 23. -/
def ep_Q2_019_partial_23_0155 : Poly :=
[
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 23. -/
theorem ep_Q2_019_partial_23_0155_valid :
    mulPoly ep_Q2_019_coefficient_23_0155
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0156 : Poly :=
[
  term ((-699307874501574421004024145287647431112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 156 for generator 23. -/
def ep_Q2_019_partial_23_0156 : Poly :=
[
  term ((-1398615749003148842008048290575294862224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((699307874501574421004024145287647431112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((699307874501574421004024145287647431112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1398615749003148842008048290575294862224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 23. -/
theorem ep_Q2_019_partial_23_0156_valid :
    mulPoly ep_Q2_019_coefficient_23_0156
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0157 : Poly :=
[
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 23. -/
def ep_Q2_019_partial_23_0157 : Poly :=
[
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 23. -/
theorem ep_Q2_019_partial_23_0157_valid :
    mulPoly ep_Q2_019_coefficient_23_0157
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0158 : Poly :=
[
  term ((-572262500176446665843254217175755811161 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 158 for generator 23. -/
def ep_Q2_019_partial_23_0158 : Poly :=
[
  term ((-1144525000352893331686508434351511622322 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((572262500176446665843254217175755811161 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((572262500176446665843254217175755811161 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-1144525000352893331686508434351511622322 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 23. -/
theorem ep_Q2_019_partial_23_0158_valid :
    mulPoly ep_Q2_019_coefficient_23_0158
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0159 : Poly :=
[
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 23. -/
def ep_Q2_019_partial_23_0159 : Poly :=
[
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 23. -/
theorem ep_Q2_019_partial_23_0159_valid :
    mulPoly ep_Q2_019_coefficient_23_0159
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0160 : Poly :=
[
  term ((22941734485132404909299684080480025636587 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 160 for generator 23. -/
def ep_Q2_019_partial_23_0160 : Poly :=
[
  term ((22941734485132404909299684080480025636587 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-22941734485132404909299684080480025636587 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-22941734485132404909299684080480025636587 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((22941734485132404909299684080480025636587 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 23. -/
theorem ep_Q2_019_partial_23_0160_valid :
    mulPoly ep_Q2_019_coefficient_23_0160
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0161 : Poly :=
[
  term ((820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 23. -/
def ep_Q2_019_partial_23_0161 : Poly :=
[
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 23. -/
theorem ep_Q2_019_partial_23_0161_valid :
    mulPoly ep_Q2_019_coefficient_23_0161
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0162 : Poly :=
[
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 162 for generator 23. -/
def ep_Q2_019_partial_23_0162 : Poly :=
[
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 23. -/
theorem ep_Q2_019_partial_23_0162_valid :
    mulPoly ep_Q2_019_coefficient_23_0162
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0163 : Poly :=
[
  term ((90522427261185478528282478513355014544 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 163 for generator 23. -/
def ep_Q2_019_partial_23_0163 : Poly :=
[
  term ((181044854522370957056564957026710029088 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((181044854522370957056564957026710029088 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-90522427261185478528282478513355014544 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-90522427261185478528282478513355014544 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 23. -/
theorem ep_Q2_019_partial_23_0163_valid :
    mulPoly ep_Q2_019_coefficient_23_0163
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0164 : Poly :=
[
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 23. -/
def ep_Q2_019_partial_23_0164 : Poly :=
[
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 23. -/
theorem ep_Q2_019_partial_23_0164_valid :
    mulPoly ep_Q2_019_coefficient_23_0164
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0165 : Poly :=
[
  term ((5542400072730437466800905368360327939413 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 23. -/
def ep_Q2_019_partial_23_0165 : Poly :=
[
  term ((5542400072730437466800905368360327939413 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5542400072730437466800905368360327939413 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5542400072730437466800905368360327939413 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5542400072730437466800905368360327939413 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 23. -/
theorem ep_Q2_019_partial_23_0165_valid :
    mulPoly ep_Q2_019_coefficient_23_0165
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0166 : Poly :=
[
  term ((-20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (16, 1)]
]

/-- Partial product 166 for generator 23. -/
def ep_Q2_019_partial_23_0166 : Poly :=
[
  term ((-41405617891401181202163245536515799152 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-41405617891401181202163245536515799152 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (14, 2), (16, 1)],
  term ((20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 23. -/
theorem ep_Q2_019_partial_23_0166_valid :
    mulPoly ep_Q2_019_coefficient_23_0166
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0167 : Poly :=
[
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 23. -/
def ep_Q2_019_partial_23_0167 : Poly :=
[
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 23. -/
theorem ep_Q2_019_partial_23_0167_valid :
    mulPoly ep_Q2_019_coefficient_23_0167
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0168 : Poly :=
[
  term ((11953632798886420536443640575270792496 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 168 for generator 23. -/
def ep_Q2_019_partial_23_0168 : Poly :=
[
  term ((23907265597772841072887281150541584992 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((23907265597772841072887281150541584992 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11953632798886420536443640575270792496 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-11953632798886420536443640575270792496 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 23. -/
theorem ep_Q2_019_partial_23_0168_valid :
    mulPoly ep_Q2_019_coefficient_23_0168
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0169 : Poly :=
[
  term ((9261976117016909527453657606422385920 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 169 for generator 23. -/
def ep_Q2_019_partial_23_0169 : Poly :=
[
  term ((18523952234033819054907315212844771840 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((18523952234033819054907315212844771840 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9261976117016909527453657606422385920 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9261976117016909527453657606422385920 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 23. -/
theorem ep_Q2_019_partial_23_0169_valid :
    mulPoly ep_Q2_019_coefficient_23_0169
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0170 : Poly :=
[
  term ((-37887307094580135223293831176386583688 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (16, 1)]
]

/-- Partial product 170 for generator 23. -/
def ep_Q2_019_partial_23_0170 : Poly :=
[
  term ((-75774614189160270446587662352773167376 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-75774614189160270446587662352773167376 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((37887307094580135223293831176386583688 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 2), (16, 1)],
  term ((37887307094580135223293831176386583688 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 23. -/
theorem ep_Q2_019_partial_23_0170_valid :
    mulPoly ep_Q2_019_coefficient_23_0170
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0171 : Poly :=
[
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (16, 1)]
]

/-- Partial product 171 for generator 23. -/
def ep_Q2_019_partial_23_0171 : Poly :=
[
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (14, 2), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 23. -/
theorem ep_Q2_019_partial_23_0171_valid :
    mulPoly ep_Q2_019_coefficient_23_0171
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0172 : Poly :=
[
  term ((36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 172 for generator 23. -/
def ep_Q2_019_partial_23_0172 : Poly :=
[
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 23. -/
theorem ep_Q2_019_partial_23_0172_valid :
    mulPoly ep_Q2_019_coefficient_23_0172
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0173 : Poly :=
[
  term ((-88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 23. -/
def ep_Q2_019_partial_23_0173 : Poly :=
[
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 23. -/
theorem ep_Q2_019_partial_23_0173_valid :
    mulPoly ep_Q2_019_coefficient_23_0173
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0174 : Poly :=
[
  term ((2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 174 for generator 23. -/
def ep_Q2_019_partial_23_0174 : Poly :=
[
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 3), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 23. -/
theorem ep_Q2_019_partial_23_0174_valid :
    mulPoly ep_Q2_019_coefficient_23_0174
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0175 : Poly :=
[
  term ((-22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 175 for generator 23. -/
def ep_Q2_019_partial_23_0175 : Poly :=
[
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 23. -/
theorem ep_Q2_019_partial_23_0175_valid :
    mulPoly ep_Q2_019_coefficient_23_0175
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0176 : Poly :=
[
  term ((-137704638354420476895038451114953812933177 : Rat) / 1577442251014181878978812488952122784180) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 176 for generator 23. -/
def ep_Q2_019_partial_23_0176 : Poly :=
[
  term ((-137704638354420476895038451114953812933177 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((137704638354420476895038451114953812933177 : Rat) / 1577442251014181878978812488952122784180) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((137704638354420476895038451114953812933177 : Rat) / 1577442251014181878978812488952122784180) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-137704638354420476895038451114953812933177 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 23. -/
theorem ep_Q2_019_partial_23_0176_valid :
    mulPoly ep_Q2_019_coefficient_23_0176
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0177 : Poly :=
[
  term ((-666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 177 for generator 23. -/
def ep_Q2_019_partial_23_0177 : Poly :=
[
  term ((-1333623252704792885752937921439927872 : Rat) / 894241638896928502822456059496668245) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1333623252704792885752937921439927872 : Rat) / 894241638896928502822456059496668245) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 23. -/
theorem ep_Q2_019_partial_23_0177_valid :
    mulPoly ep_Q2_019_coefficient_23_0177
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0178 : Poly :=
[
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 23. -/
def ep_Q2_019_partial_23_0178 : Poly :=
[
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 23. -/
theorem ep_Q2_019_partial_23_0178_valid :
    mulPoly ep_Q2_019_coefficient_23_0178
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0179 : Poly :=
[
  term ((105400159401054711835849728245524939076762 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 23. -/
def ep_Q2_019_partial_23_0179 : Poly :=
[
  term ((210800318802109423671699456491049878153524 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((210800318802109423671699456491049878153524 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-105400159401054711835849728245524939076762 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-105400159401054711835849728245524939076762 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 23. -/
theorem ep_Q2_019_partial_23_0179_valid :
    mulPoly ep_Q2_019_coefficient_23_0179
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0180 : Poly :=
[
  term ((4526414175843532265226034977869453043736 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 180 for generator 23. -/
def ep_Q2_019_partial_23_0180 : Poly :=
[
  term ((9052828351687064530452069955738906087472 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((9052828351687064530452069955738906087472 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4526414175843532265226034977869453043736 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4526414175843532265226034977869453043736 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 23. -/
theorem ep_Q2_019_partial_23_0180_valid :
    mulPoly ep_Q2_019_coefficient_23_0180
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0181 : Poly :=
[
  term ((1756036115118218935988300381806982433138 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 181 for generator 23. -/
def ep_Q2_019_partial_23_0181 : Poly :=
[
  term ((3512072230236437871976600763613964866276 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3512072230236437871976600763613964866276 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1756036115118218935988300381806982433138 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1756036115118218935988300381806982433138 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 23. -/
theorem ep_Q2_019_partial_23_0181_valid :
    mulPoly ep_Q2_019_coefficient_23_0181
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0182 : Poly :=
[
  term ((161187988193368746060246513346166461893104 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 23. -/
def ep_Q2_019_partial_23_0182 : Poly :=
[
  term ((322375976386737492120493026692332923786208 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((322375976386737492120493026692332923786208 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-161187988193368746060246513346166461893104 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-161187988193368746060246513346166461893104 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 23. -/
theorem ep_Q2_019_partial_23_0182_valid :
    mulPoly ep_Q2_019_coefficient_23_0182
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0183 : Poly :=
[
  term ((-212034201419328828646288346066085322665467 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 183 for generator 23. -/
def ep_Q2_019_partial_23_0183 : Poly :=
[
  term ((-212034201419328828646288346066085322665467 : Rat) / 5126687315796091106681140589094399048585) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-212034201419328828646288346066085322665467 : Rat) / 5126687315796091106681140589094399048585) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((212034201419328828646288346066085322665467 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((212034201419328828646288346066085322665467 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 23. -/
theorem ep_Q2_019_partial_23_0183_valid :
    mulPoly ep_Q2_019_coefficient_23_0183
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0184 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 184 for generator 23. -/
def ep_Q2_019_partial_23_0184 : Poly :=
[
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 23. -/
theorem ep_Q2_019_partial_23_0184_valid :
    mulPoly ep_Q2_019_coefficient_23_0184
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0185 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 185 for generator 23. -/
def ep_Q2_019_partial_23_0185 : Poly :=
[
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 23. -/
theorem ep_Q2_019_partial_23_0185_valid :
    mulPoly ep_Q2_019_coefficient_23_0185
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0186 : Poly :=
[
  term ((-73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 186 for generator 23. -/
def ep_Q2_019_partial_23_0186 : Poly :=
[
  term ((-146132692739310698100437428979757543776 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-146132692739310698100437428979757543776 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 23. -/
theorem ep_Q2_019_partial_23_0186_valid :
    mulPoly ep_Q2_019_coefficient_23_0186
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0187 : Poly :=
[
  term ((176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 23. -/
def ep_Q2_019_partial_23_0187 : Poly :=
[
  term ((352874712533416159174420244317149824 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((352874712533416159174420244317149824 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 23. -/
theorem ep_Q2_019_partial_23_0187_valid :
    mulPoly ep_Q2_019_coefficient_23_0187
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0188 : Poly :=
[
  term ((-5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 188 for generator 23. -/
def ep_Q2_019_partial_23_0188 : Poly :=
[
  term ((-11438278161650401462784110085744359896052 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-11438278161650401462784110085744359896052 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 23. -/
theorem ep_Q2_019_partial_23_0188_valid :
    mulPoly ep_Q2_019_coefficient_23_0188
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0189 : Poly :=
[
  term ((45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 189 for generator 23. -/
def ep_Q2_019_partial_23_0189 : Poly :=
[
  term ((91977294821483111616697615503723520 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((91977294821483111616697615503723520 : Rat) / 178848327779385700564491211899333649) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 23. -/
theorem ep_Q2_019_partial_23_0189_valid :
    mulPoly ep_Q2_019_coefficient_23_0189
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0190 : Poly :=
[
  term ((-459293372740949506682799627534350745811 : Rat) / 7511629766734199423708630899772013258) [(9, 2), (16, 1)]
]

/-- Partial product 190 for generator 23. -/
def ep_Q2_019_partial_23_0190 : Poly :=
[
  term ((-459293372740949506682799627534350745811 : Rat) / 3755814883367099711854315449886006629) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-459293372740949506682799627534350745811 : Rat) / 3755814883367099711854315449886006629) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((459293372740949506682799627534350745811 : Rat) / 7511629766734199423708630899772013258) [(9, 2), (14, 2), (16, 1)],
  term ((459293372740949506682799627534350745811 : Rat) / 7511629766734199423708630899772013258) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 23. -/
theorem ep_Q2_019_partial_23_0190_valid :
    mulPoly ep_Q2_019_coefficient_23_0190
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0191 : Poly :=
[
  term ((333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 191 for generator 23. -/
def ep_Q2_019_partial_23_0191 : Poly :=
[
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 23. -/
theorem ep_Q2_019_partial_23_0191_valid :
    mulPoly ep_Q2_019_coefficient_23_0191
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0192 : Poly :=
[
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 23. -/
def ep_Q2_019_partial_23_0192 : Poly :=
[
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 23. -/
theorem ep_Q2_019_partial_23_0192_valid :
    mulPoly ep_Q2_019_coefficient_23_0192
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0193 : Poly :=
[
  term ((-35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 193 for generator 23. -/
def ep_Q2_019_partial_23_0193 : Poly :=
[
  term ((-71993771621685388687753524388111740793142 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-71993771621685388687753524388111740793142 : Rat) / 1708895771932030368893713529698133016195) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 23. -/
theorem ep_Q2_019_partial_23_0193_valid :
    mulPoly ep_Q2_019_coefficient_23_0193
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0194 : Poly :=
[
  term ((-250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 194 for generator 23. -/
def ep_Q2_019_partial_23_0194 : Poly :=
[
  term ((-500978328575697800624745247218685589064 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-500978328575697800624745247218685589064 : Rat) / 6259691472278499519757192416476677715) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 23. -/
theorem ep_Q2_019_partial_23_0194_valid :
    mulPoly ep_Q2_019_coefficient_23_0194
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0195 : Poly :=
[
  term ((-371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 195 for generator 23. -/
def ep_Q2_019_partial_23_0195 : Poly :=
[
  term ((-743279695789397473964392001619474154204 : Rat) / 43817840305949496638300346915336744005) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-743279695789397473964392001619474154204 : Rat) / 43817840305949496638300346915336744005) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 23. -/
theorem ep_Q2_019_partial_23_0195_valid :
    mulPoly ep_Q2_019_coefficient_23_0195
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0196 : Poly :=
[
  term ((-4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 196 for generator 23. -/
def ep_Q2_019_partial_23_0196 : Poly :=
[
  term ((-9963585765575093641321955850426851072952 : Rat) / 113926384795468691259580901979875534413) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-9963585765575093641321955850426851072952 : Rat) / 113926384795468691259580901979875534413) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 23. -/
theorem ep_Q2_019_partial_23_0196_valid :
    mulPoly ep_Q2_019_coefficient_23_0196
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0197 : Poly :=
[
  term ((64653415275349169876060420365762002888848 : Rat) / 5126687315796091106681140589094399048585) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 23. -/
def ep_Q2_019_partial_23_0197 : Poly :=
[
  term ((129306830550698339752120840731524005777696 : Rat) / 5126687315796091106681140589094399048585) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64653415275349169876060420365762002888848 : Rat) / 5126687315796091106681140589094399048585) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64653415275349169876060420365762002888848 : Rat) / 5126687315796091106681140589094399048585) [(11, 1), (15, 3), (16, 1)],
  term ((129306830550698339752120840731524005777696 : Rat) / 5126687315796091106681140589094399048585) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 23. -/
theorem ep_Q2_019_partial_23_0197_valid :
    mulPoly ep_Q2_019_coefficient_23_0197
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0198 : Poly :=
[
  term ((8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(11, 2), (16, 1)]
]

/-- Partial product 198 for generator 23. -/
def ep_Q2_019_partial_23_0198 : Poly :=
[
  term ((8283816416500533411716906462210063468753 : Rat) / 1577442251014181878978812488952122784180) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(11, 2), (14, 2), (16, 1)],
  term ((-8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(11, 2), (15, 2), (16, 1)],
  term ((8283816416500533411716906462210063468753 : Rat) / 1577442251014181878978812488952122784180) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 23. -/
theorem ep_Q2_019_partial_23_0198_valid :
    mulPoly ep_Q2_019_coefficient_23_0198
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 23. -/
def ep_Q2_019_coefficient_23_0199 : Poly :=
[
  term ((-421031412126333982688892587865646842 : Rat) / 52602449346878147224850356440980485) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 199 for generator 23. -/
def ep_Q2_019_partial_23_0199 : Poly :=
[
  term ((-842062824252667965377785175731293684 : Rat) / 52602449346878147224850356440980485) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-842062824252667965377785175731293684 : Rat) / 52602449346878147224850356440980485) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((421031412126333982688892587865646842 : Rat) / 52602449346878147224850356440980485) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((421031412126333982688892587865646842 : Rat) / 52602449346878147224850356440980485) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 23. -/
theorem ep_Q2_019_partial_23_0199_valid :
    mulPoly ep_Q2_019_coefficient_23_0199
        ep_Q2_019_generator_23_0100_0199 =
      ep_Q2_019_partial_23_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_23_0100_0199 : List Poly :=
[
  ep_Q2_019_partial_23_0100,
  ep_Q2_019_partial_23_0101,
  ep_Q2_019_partial_23_0102,
  ep_Q2_019_partial_23_0103,
  ep_Q2_019_partial_23_0104,
  ep_Q2_019_partial_23_0105,
  ep_Q2_019_partial_23_0106,
  ep_Q2_019_partial_23_0107,
  ep_Q2_019_partial_23_0108,
  ep_Q2_019_partial_23_0109,
  ep_Q2_019_partial_23_0110,
  ep_Q2_019_partial_23_0111,
  ep_Q2_019_partial_23_0112,
  ep_Q2_019_partial_23_0113,
  ep_Q2_019_partial_23_0114,
  ep_Q2_019_partial_23_0115,
  ep_Q2_019_partial_23_0116,
  ep_Q2_019_partial_23_0117,
  ep_Q2_019_partial_23_0118,
  ep_Q2_019_partial_23_0119,
  ep_Q2_019_partial_23_0120,
  ep_Q2_019_partial_23_0121,
  ep_Q2_019_partial_23_0122,
  ep_Q2_019_partial_23_0123,
  ep_Q2_019_partial_23_0124,
  ep_Q2_019_partial_23_0125,
  ep_Q2_019_partial_23_0126,
  ep_Q2_019_partial_23_0127,
  ep_Q2_019_partial_23_0128,
  ep_Q2_019_partial_23_0129,
  ep_Q2_019_partial_23_0130,
  ep_Q2_019_partial_23_0131,
  ep_Q2_019_partial_23_0132,
  ep_Q2_019_partial_23_0133,
  ep_Q2_019_partial_23_0134,
  ep_Q2_019_partial_23_0135,
  ep_Q2_019_partial_23_0136,
  ep_Q2_019_partial_23_0137,
  ep_Q2_019_partial_23_0138,
  ep_Q2_019_partial_23_0139,
  ep_Q2_019_partial_23_0140,
  ep_Q2_019_partial_23_0141,
  ep_Q2_019_partial_23_0142,
  ep_Q2_019_partial_23_0143,
  ep_Q2_019_partial_23_0144,
  ep_Q2_019_partial_23_0145,
  ep_Q2_019_partial_23_0146,
  ep_Q2_019_partial_23_0147,
  ep_Q2_019_partial_23_0148,
  ep_Q2_019_partial_23_0149,
  ep_Q2_019_partial_23_0150,
  ep_Q2_019_partial_23_0151,
  ep_Q2_019_partial_23_0152,
  ep_Q2_019_partial_23_0153,
  ep_Q2_019_partial_23_0154,
  ep_Q2_019_partial_23_0155,
  ep_Q2_019_partial_23_0156,
  ep_Q2_019_partial_23_0157,
  ep_Q2_019_partial_23_0158,
  ep_Q2_019_partial_23_0159,
  ep_Q2_019_partial_23_0160,
  ep_Q2_019_partial_23_0161,
  ep_Q2_019_partial_23_0162,
  ep_Q2_019_partial_23_0163,
  ep_Q2_019_partial_23_0164,
  ep_Q2_019_partial_23_0165,
  ep_Q2_019_partial_23_0166,
  ep_Q2_019_partial_23_0167,
  ep_Q2_019_partial_23_0168,
  ep_Q2_019_partial_23_0169,
  ep_Q2_019_partial_23_0170,
  ep_Q2_019_partial_23_0171,
  ep_Q2_019_partial_23_0172,
  ep_Q2_019_partial_23_0173,
  ep_Q2_019_partial_23_0174,
  ep_Q2_019_partial_23_0175,
  ep_Q2_019_partial_23_0176,
  ep_Q2_019_partial_23_0177,
  ep_Q2_019_partial_23_0178,
  ep_Q2_019_partial_23_0179,
  ep_Q2_019_partial_23_0180,
  ep_Q2_019_partial_23_0181,
  ep_Q2_019_partial_23_0182,
  ep_Q2_019_partial_23_0183,
  ep_Q2_019_partial_23_0184,
  ep_Q2_019_partial_23_0185,
  ep_Q2_019_partial_23_0186,
  ep_Q2_019_partial_23_0187,
  ep_Q2_019_partial_23_0188,
  ep_Q2_019_partial_23_0189,
  ep_Q2_019_partial_23_0190,
  ep_Q2_019_partial_23_0191,
  ep_Q2_019_partial_23_0192,
  ep_Q2_019_partial_23_0193,
  ep_Q2_019_partial_23_0194,
  ep_Q2_019_partial_23_0195,
  ep_Q2_019_partial_23_0196,
  ep_Q2_019_partial_23_0197,
  ep_Q2_019_partial_23_0198,
  ep_Q2_019_partial_23_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_23_0100_0199 : Poly :=
[
  term ((765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1441130114941631249262935854914341994448 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1441130114941631249262935854914341994448 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-382610830373649922246507388739311456 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((765221660747299844493014777478622912 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((720565057470815624631467927457170997224 : Rat) / 10658393587933661344451435736162991785) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1864833718227385979939373956618291795488 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1864833718227385979939373956618291795488 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((932416859113692989969686978309145897744 : Rat) / 43817840305949496638300346915336744005) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((38413092270336777722317384559563611776564 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3724240267410965706884282563055251294760 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13186944741524962222824492593523072 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3724240267410965706884282563055251294760 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((38218249395931508370166599886101741909428 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((1427420325313328587185235703017361664 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1862120133705482853442141281527625647380 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-19206546135168388861158692279781805888282 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1862120133705482853442141281527625647380 : Rat) / 341779154386406073778742705939626603239) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-19206546135168388861158692279781805888282 : Rat) / 1708895771932030368893713529698133016195) [(3, 1), (15, 3), (16, 1)],
  term ((31131753184945060825214688130321361712 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (10, 1), (14, 1), (16, 1)],
  term ((31131753184945060825214688130321361712 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15565876592472530412607344065160680856 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (14, 2), (16, 1)],
  term ((-15565876592472530412607344065160680856 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((273509910113158489039161024807461184 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((1231717551840415254687808022195392128 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1946019944774945034433629854068898032544 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1946019944774945034433629854068898032544 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((973009972387472517216814927034449016272 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((973009972387472517216814927034449016272 : Rat) / 43817840305949496638300346915336744005) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(4, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((13395691091101430223044179219949328432 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-54050408010479426772887792086122491103496 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1290050145743069518165491643919068152 : Rat) / 178848327779385700564491211899333649) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((13395691091101430223044179219949328432 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1290050145743069518165491643919068152 : Rat) / 178848327779385700564491211899333649) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-54050408010479426772887792086122491103496 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2463435103680830509375616044390784256 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6697845545550715111522089609974664216 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((645025072871534759082745821959534076 : Rat) / 178848327779385700564491211899333649) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((27025204005239713386443896043061245551748 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (14, 2), (16, 1)],
  term ((645025072871534759082745821959534076 : Rat) / 178848327779385700564491211899333649) [(4, 1), (14, 3), (16, 1)],
  term ((27025204005239713386443896043061245551748 : Rat) / 394360562753545469744703122238030696045) [(4, 1), (15, 2), (16, 1)],
  term ((-136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (15, 4), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (14, 2), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((1016483090465159705033426526202267504 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((1016483090465159705033426526202267504 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-508241545232579852516713263101133752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-508241545232579852516713263101133752 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27168199822743881407514729462329212736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7818346309584023821274215544622466832 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-27168199822743881407514729462329212736 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7818346309584023821274215544622466832 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-140989980926472313614339214534370944 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3909173154792011910637107772311233416 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((3909173154792011910637107772311233416 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-563959923705889254457356858137483776 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((281979961852944627228678429068741888 : Rat) / 368217145428147030573952495086863395) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6535475867211456984529799070822262272 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3668475838966523213829565150360157060552 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((1435241142297297356383185270293639401592 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((6792049955685970351878682365582303184 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((3267737933605728492264899535411131136 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2776383383092159335441247577192918260424 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((13584099911371940703757364731164606368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6535475867211456984529799070822262272 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3396024977842985175939341182791151592 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((1834237919483261606914782575180078530276 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((1834237919483261606914782575180078530276 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (15, 3), (16, 1)],
  term ((-4266165096867061381656339776783429568 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4266165096867061381656339776783429568 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1066541274216765345414084944195857392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((2133082548433530690828169888391714784 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((14374553103561185348798484128742847584 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((14374553103561185348798484128742847584 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7187276551780592674399242064371423792 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-7187276551780592674399242064371423792 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((73752542849647902342684427893168472704 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((73752542849647902342684427893168472704 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((6812384141683000736655498901809748416 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13624768283366001473310997803619496832 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-36876271424823951171342213946584236352 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-36876271424823951171342213946584236352 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-12568004337360569948837175642739682304 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-12568004337360569948837175642739682304 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (14, 2), (16, 1)],
  term ((6284002168680284974418587821369841152 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33845810339004210317716017715300954920 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((6878685233105954662560597275538454509181 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-4319568273781145974427467457773246416 : Rat) / 894241638896928502822456059496668245) [(6, 1), (10, 1), (14, 2), (16, 1)],
  term ((-33845810339004210317716017715300954920 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-887504388702050349615120514004950485792 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-887504388702050349615120514004950485792 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4319568273781145974427467457773246416 : Rat) / 894241638896928502822456059496668245) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 5155040035994058428035334931216087530) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((6878685233105954662560597275538454509181 : Rat) / 131453520917848489914901040746010232015) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((126782022460846563181029064609042716231 : Rat) / 5155040035994058428035334931216087530) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((1775008777404100699230241028009900971584 : Rat) / 43817840305949496638300346915336744005) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-126782022460846563181029064609042716231 : Rat) / 2577520017997029214017667465608043765) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((16922905169502105158858008857650477460 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((16922905169502105158858008857650477460 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6878685233105954662560597275538454509181 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (14, 2), (16, 1)],
  term ((2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(6, 1), (14, 3), (16, 1)],
  term ((-6878685233105954662560597275538454509181 : Rat) / 262907041835696979829802081492020464030) [(6, 1), (15, 2), (16, 1)],
  term ((-33939828971883823784264650927144797408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-33939828971883823784264650927144797408 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((16969914485941911892132325463572398704 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (14, 2), (16, 1)],
  term ((16969914485941911892132325463572398704 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (15, 2), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1979730084116025194486002074688614271072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-261817513850340863123825131756093824 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1275568726505004929728451025583807488 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39372931123919240970663571141014869051 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((11417561116374006550934155812296111677876 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (10, 1), (14, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1979730084116025194486002074688614271072 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((385031985270143549851738484812898263648 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((372202927091476847558671053356849666272 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((11417561116374006550934155812296111677876 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1844979115387428545713306815590269829792 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39372931123919240970663571141014869051 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((1996771793841524132350992487634742920864 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-989865042058012597243001037344307135536 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (9, 1), (12, 1), (14, 3), (16, 1)],
  term ((-989865042058012597243001037344307135536 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5708780558187003275467077906148055838938 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((39372931123919240970663571141014869051 : Rat) / 357696655558771401128982423798667298) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-5708780558187003275467077906148055838938 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (9, 1), (14, 3), (16, 1)],
  term ((39372931123919240970663571141014869051 : Rat) / 357696655558771401128982423798667298) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (9, 1), (15, 4), (16, 1)],
  term ((1540127941080574199406953939251593054592 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((7379916461549714182853227262361079319168 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1540127941080574199406953939251593054592 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7379916461549714182853227262361079319168 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-770063970540287099703476969625796527296 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-3689958230774857091426613631180539659584 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1398615749003148842008048290575294862224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((22941734485132404909299684080480025636587 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1144525000352893331686508434351511622322 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((181044854522370957056564957026710029088 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((5542400072730437466800905368360327939413 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((699307874501574421004024145287647431112 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1641059460678950934234966148844767104 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((142159058145265415508733781665912160168 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((181044854522370957056564957026710029088 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((575130477816043781351316757611874523033 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((-22941734485132404909299684080480025636587 : Rat) / 262907041835696979829802081492020464030) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((572262500176446665843254217175755811161 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 1), (14, 3), (16, 1)],
  term ((-177544228697979259617334476654282629563 : Rat) / 2682724916690785508467368178490004735) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 1), (15, 4), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1398615749003148842008048290575294862224 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(7, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1144525000352893331686508434351511622322 : Rat) / 26290704183569697982980208149202046403) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((22941734485132404909299684080480025636587 : Rat) / 131453520917848489914901040746010232015) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(7, 1), (11, 2), (15, 3), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-820529730339475467117483074422383552 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-90522427261185478528282478513355014544 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((2881323508471038710947138684692679296 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((-90522427261185478528282478513355014544 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5542400072730437466800905368360327939413 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-68285181895169416858631915145683616 : Rat) / 1251938294455699903951438483295335543) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-5542400072730437466800905368360327939413 : Rat) / 525814083671393959659604162984040928060) [(7, 1), (15, 3), (16, 1)],
  term ((-41405617891401181202163245536515799152 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-41405617891401181202163245536515799152 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (14, 2), (16, 1)],
  term ((20702808945700590601081622768257899576 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (15, 2), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((23907265597772841072887281150541584992 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-75774614189160270446587662352773167376 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((18523952234033819054907315212844771840 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (10, 1), (14, 2), (16, 1)],
  term ((23907265597772841072887281150541584992 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((18523952234033819054907315212844771840 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-75774614189160270446587662352773167376 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2190301347999157890171030550949670144 : Rat) / 368217145428147030573952495086863395) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-11953632798886420536443640575270792496 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (14, 2), (16, 1)],
  term ((-11953632798886420536443640575270792496 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-9261976117016909527453657606422385920 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((37887307094580135223293831176386583688 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 2), (16, 1)],
  term ((-9261976117016909527453657606422385920 : Rat) / 1251938294455699903951438483295335543) [(8, 1), (14, 3), (16, 1)],
  term ((37887307094580135223293831176386583688 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (15, 2), (16, 1)],
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (14, 2), (16, 1)],
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (15, 2), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-137704638354420476895038451114953812933177 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1333623252704792885752937921439927872 : Rat) / 894241638896928502822456059496668245) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((210800318802109423671699456491049878153524 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3512072230236437871976600763613964866276 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((9052828351687064530452069955738906087472 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-212034201419328828646288346066085322665467 : Rat) / 5126687315796091106681140589094399048585) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((322375976386737492120493026692332923786208 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1333623252704792885752937921439927872 : Rat) / 894241638896928502822456059496668245) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((13128475685431607473879729190758136832 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36533173184827674525109357244939385944 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((203676350031068027139303131828286697894444 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((9052828351687064530452069955738906087472 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3512072230236437871976600763613964866276 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((88218678133354039793605061079287456 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((185990705026969734321486144459665920339291 : Rat) / 1025337463159218221336228117818879809717) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((137704638354420476895038451114953812933177 : Rat) / 1577442251014181878978812488952122784180) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2859569540412600365696027521436089974013 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 1), (14, 3), (16, 1)],
  term ((134574784704307269292906640032865468209919 : Rat) / 2929535609026337775246366050911085170620) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((22994323705370777904174403875930880 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 1), (15, 4), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-137704638354420476895038451114953812933177 : Rat) / 788721125507090939489406244476061392090) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 1), (11, 2), (15, 3), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-105400159401054711835849728245524939076762 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-105400159401054711835849728245524939076762 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4526414175843532265226034977869453043736 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1756036115118218935988300381806982433138 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4526414175843532265226034977869453043736 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1756036115118218935988300381806982433138 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-161187988193368746060246513346166461893104 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((212034201419328828646288346066085322665467 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-161187988193368746060246513346166461893104 : Rat) / 1708895771932030368893713529698133016195) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((212034201419328828646288346066085322665467 : Rat) / 10253374631592182213362281178188798097170) [(9, 1), (15, 3), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-146132692739310698100437428979757543776 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((352874712533416159174420244317149824 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((91977294821483111616697615503723520 : Rat) / 178848327779385700564491211899333649) [(9, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-459293372740949506682799627534350745811 : Rat) / 3755814883367099711854315449886006629) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-11438278161650401462784110085744359896052 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-146132692739310698100437428979757543776 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-189932980288682341750181538064450156992 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11438278161650401462784110085744359896052 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-459293372740949506682799627534350745811 : Rat) / 3755814883367099711854315449886006629) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-180905174051439705742428991813676654992 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((384806206552832509728804959549340411520 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((370824122995384756423294349946718214944 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((73066346369655349050218714489878771888 : Rat) / 8763568061189899327660069383067348801) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-176437356266708079587210122158574912 : Rat) / 1251938294455699903951438483295335543) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((459293372740949506682799627534350745811 : Rat) / 7511629766734199423708630899772013258) [(9, 2), (14, 2), (16, 1)],
  term ((5719139080825200731392055042872179948026 : Rat) / 394360562753545469744703122238030696045) [(9, 2), (14, 3), (16, 1)],
  term ((459293372740949506682799627534350745811 : Rat) / 7511629766734199423708630899772013258) [(9, 2), (15, 2), (16, 1)],
  term ((-45988647410741555808348807751861760 : Rat) / 178848327779385700564491211899333649) [(9, 2), (15, 4), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-71993771621685388687753524388111740793142 : Rat) / 1708895771932030368893713529698133016195) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-743279695789397473964392001619474154204 : Rat) / 43817840305949496638300346915336744005) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-500978328575697800624745247218685589064 : Rat) / 6259691472278499519757192416476677715) [(10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((129306830550698339752120840731524005777696 : Rat) / 5126687315796091106681140589094399048585) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9963585765575093641321955850426851072952 : Rat) / 113926384795468691259580901979875534413) [(10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((8283816416500533411716906462210063468753 : Rat) / 1577442251014181878978812488952122784180) [(10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-842062824252667965377785175731293684 : Rat) / 52602449346878147224850356440980485) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-333405813176198221438234480359981968 : Rat) / 894241638896928502822456059496668245) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-842062824252667965377785175731293684 : Rat) / 52602449346878147224850356440980485) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3282118921357901868469932297689534208 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((35996885810842694343876762194055870396571 : Rat) / 1708895771932030368893713529698133016195) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((250489164287848900312372623609342794532 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((371639847894698736982196000809737077102 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-64653415275349169876060420365762002888848 : Rat) / 5126687315796091106681140589094399048585) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((4981792882787546820660977925213425536476 : Rat) / 113926384795468691259580901979875534413) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-64653415275349169876060420365762002888848 : Rat) / 5126687315796091106681140589094399048585) [(11, 1), (15, 3), (16, 1)],
  term ((666811626352396442876468960719963936 : Rat) / 894241638896928502822456059496668245) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6564237842715803736939864595379068416 : Rat) / 6259691472278499519757192416476677715) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-71993771621685388687753524388111740793142 : Rat) / 1708895771932030368893713529698133016195) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-500978328575697800624745247218685589064 : Rat) / 6259691472278499519757192416476677715) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-743279695789397473964392001619474154204 : Rat) / 43817840305949496638300346915336744005) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9963585765575093641321955850426851072952 : Rat) / 113926384795468691259580901979875534413) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8283816416500533411716906462210063468753 : Rat) / 3154884502028363757957624977904245568360) [(11, 2), (14, 2), (16, 1)],
  term ((308921676997026594554882313947820407042593 : Rat) / 13671166175456242951149708237585064129560) [(11, 2), (15, 2), (16, 1)],
  term ((8283816416500533411716906462210063468753 : Rat) / 1577442251014181878978812488952122784180) [(11, 3), (15, 1), (16, 1)],
  term ((421031412126333982688892587865646842 : Rat) / 52602449346878147224850356440980485) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((421031412126333982688892587865646842 : Rat) / 52602449346878147224850356440980485) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 100 through 199. -/
theorem ep_Q2_019_block_23_0100_0199_valid :
    checkProductSumEq ep_Q2_019_partials_23_0100_0199
      ep_Q2_019_block_23_0100_0199 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
