/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0100 : Poly :=
[
  term ((25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 100 for generator 9. -/
def ep_Q2_002_partial_09_0100 : Poly :=
[
  term ((50501076374897323053093218908800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 9. -/
theorem ep_Q2_002_partial_09_0100_valid :
    mulPoly ep_Q2_002_coefficient_09_0100
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0101 : Poly :=
[
  term ((-73669153064128627263542319572208 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 101 for generator 9. -/
def ep_Q2_002_partial_09_0101 : Poly :=
[
  term ((-147338306128257254527084639144416 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((73669153064128627263542319572208 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 9. -/
theorem ep_Q2_002_partial_09_0101_valid :
    mulPoly ep_Q2_002_coefficient_09_0101
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0102 : Poly :=
[
  term ((11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 102 for generator 9. -/
def ep_Q2_002_partial_09_0102 : Poly :=
[
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 9. -/
theorem ep_Q2_002_partial_09_0102_valid :
    mulPoly ep_Q2_002_coefficient_09_0102
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0103 : Poly :=
[
  term ((-47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 103 for generator 9. -/
def ep_Q2_002_partial_09_0103 : Poly :=
[
  term ((-95102984241484859831569410009600 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 9. -/
theorem ep_Q2_002_partial_09_0103_valid :
    mulPoly ep_Q2_002_coefficient_09_0103
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0104 : Poly :=
[
  term ((1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 104 for generator 9. -/
def ep_Q2_002_partial_09_0104 : Poly :=
[
  term ((3126378296085979937560778491909406058975552 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 9. -/
theorem ep_Q2_002_partial_09_0104_valid :
    mulPoly ep_Q2_002_coefficient_09_0104
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0105 : Poly :=
[
  term ((26204186168 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 9. -/
def ep_Q2_002_partial_09_0105 : Poly :=
[
  term ((52408372336 : Rat) / 7401317245) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 9. -/
theorem ep_Q2_002_partial_09_0105_valid :
    mulPoly ep_Q2_002_coefficient_09_0105
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0106 : Poly :=
[
  term ((-390797287010747492195097311488675757371944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 106 for generator 9. -/
def ep_Q2_002_partial_09_0106 : Poly :=
[
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((390797287010747492195097311488675757371944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 9. -/
theorem ep_Q2_002_partial_09_0106_valid :
    mulPoly ep_Q2_002_coefficient_09_0106
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0107 : Poly :=
[
  term ((-6551046542 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 9. -/
def ep_Q2_002_partial_09_0107 : Poly :=
[
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((6551046542 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 9. -/
theorem ep_Q2_002_partial_09_0107_valid :
    mulPoly ep_Q2_002_coefficient_09_0107
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0108 : Poly :=
[
  term ((29851365069418804999795840747104 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 108 for generator 9. -/
def ep_Q2_002_partial_09_0108 : Poly :=
[
  term ((59702730138837609999591681494208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (13, 1)],
  term ((-29851365069418804999795840747104 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 9. -/
theorem ep_Q2_002_partial_09_0108_valid :
    mulPoly ep_Q2_002_coefficient_09_0108
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0109 : Poly :=
[
  term ((138732811374767565549654448307136 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 109 for generator 9. -/
def ep_Q2_002_partial_09_0109 : Poly :=
[
  term ((277465622749535131099308896614272 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-138732811374767565549654448307136 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 9. -/
theorem ep_Q2_002_partial_09_0109_valid :
    mulPoly ep_Q2_002_coefficient_09_0109
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0110 : Poly :=
[
  term ((-862483521444097669070965620082430234840136 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 110 for generator 9. -/
def ep_Q2_002_partial_09_0110 : Poly :=
[
  term ((-1724967042888195338141931240164860469680272 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((862483521444097669070965620082430234840136 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 9. -/
theorem ep_Q2_002_partial_09_0110_valid :
    mulPoly ep_Q2_002_coefficient_09_0110
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0111 : Poly :=
[
  term ((3332662086 : Rat) / 1057331035) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 9. -/
def ep_Q2_002_partial_09_0111 : Poly :=
[
  term ((6665324172 : Rat) / 1057331035) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3332662086 : Rat) / 1057331035) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 9. -/
theorem ep_Q2_002_partial_09_0111_valid :
    mulPoly ep_Q2_002_coefficient_09_0111
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0112 : Poly :=
[
  term ((134839357888841877400110010140717387617136 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 112 for generator 9. -/
def ep_Q2_002_partial_09_0112 : Poly :=
[
  term ((269678715777683754800220020281434775234272 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((-134839357888841877400110010140717387617136 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 9. -/
theorem ep_Q2_002_partial_09_0112_valid :
    mulPoly ep_Q2_002_coefficient_09_0112
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0113 : Poly :=
[
  term ((14113816278 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 9. -/
def ep_Q2_002_partial_09_0113 : Poly :=
[
  term ((28227632556 : Rat) / 7401317245) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-14113816278 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 9. -/
theorem ep_Q2_002_partial_09_0113_valid :
    mulPoly ep_Q2_002_coefficient_09_0113
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0114 : Poly :=
[
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 114 for generator 9. -/
def ep_Q2_002_partial_09_0114 : Poly :=
[
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 9. -/
theorem ep_Q2_002_partial_09_0114_valid :
    mulPoly ep_Q2_002_coefficient_09_0114
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0115 : Poly :=
[
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 115 for generator 9. -/
def ep_Q2_002_partial_09_0115 : Poly :=
[
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 9. -/
theorem ep_Q2_002_partial_09_0115_valid :
    mulPoly ep_Q2_002_coefficient_09_0115
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0116 : Poly :=
[
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 9. -/
def ep_Q2_002_partial_09_0116 : Poly :=
[
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 9. -/
theorem ep_Q2_002_partial_09_0116_valid :
    mulPoly ep_Q2_002_coefficient_09_0116
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0117 : Poly :=
[
  term ((-128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 117 for generator 9. -/
def ep_Q2_002_partial_09_0117 : Poly :=
[
  term ((-256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (11, 1), (13, 1)],
  term ((128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 9. -/
theorem ep_Q2_002_partial_09_0117_valid :
    mulPoly ep_Q2_002_coefficient_09_0117
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0118 : Poly :=
[
  term ((52843833016831496471410057731776286425712 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 118 for generator 9. -/
def ep_Q2_002_partial_09_0118 : Poly :=
[
  term ((105687666033662992942820115463552572851424 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-52843833016831496471410057731776286425712 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 9. -/
theorem ep_Q2_002_partial_09_0118_valid :
    mulPoly ep_Q2_002_coefficient_09_0118
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0119 : Poly :=
[
  term ((-22025102804 : Rat) / 7401317245) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 9. -/
def ep_Q2_002_partial_09_0119 : Poly :=
[
  term ((-44050205608 : Rat) / 7401317245) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((22025102804 : Rat) / 7401317245) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 9. -/
theorem ep_Q2_002_partial_09_0119_valid :
    mulPoly ep_Q2_002_coefficient_09_0119
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0120 : Poly :=
[
  term ((68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2)]
]

/-- Partial product 120 for generator 9. -/
def ep_Q2_002_partial_09_0120 : Poly :=
[
  term ((136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (11, 2)],
  term ((-68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 9. -/
theorem ep_Q2_002_partial_09_0120_valid :
    mulPoly ep_Q2_002_coefficient_09_0120
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0121 : Poly :=
[
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2), (12, 1)]
]

/-- Partial product 121 for generator 9. -/
def ep_Q2_002_partial_09_0121 : Poly :=
[
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (11, 2), (12, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 9. -/
theorem ep_Q2_002_partial_09_0121_valid :
    mulPoly ep_Q2_002_coefficient_09_0121
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0122 : Poly :=
[
  term ((393507379978528651222376048947776 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 122 for generator 9. -/
def ep_Q2_002_partial_09_0122 : Poly :=
[
  term ((787014759957057302444752097895552 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-393507379978528651222376048947776 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 9. -/
theorem ep_Q2_002_partial_09_0122_valid :
    mulPoly ep_Q2_002_coefficient_09_0122
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0123 : Poly :=
[
  term ((-2645748672875994348905890522160728519259616 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (15, 2)]
]

/-- Partial product 123 for generator 9. -/
def ep_Q2_002_partial_09_0123 : Poly :=
[
  term ((-5291497345751988697811781044321457038519232 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((2645748672875994348905890522160728519259616 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 9. -/
theorem ep_Q2_002_partial_09_0123_valid :
    mulPoly ep_Q2_002_coefficient_09_0123
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0124 : Poly :=
[
  term ((63763222772 : Rat) / 7401317245) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 9. -/
def ep_Q2_002_partial_09_0124 : Poly :=
[
  term ((127526445544 : Rat) / 7401317245) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-63763222772 : Rat) / 7401317245) [(0, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 9. -/
theorem ep_Q2_002_partial_09_0124_valid :
    mulPoly ep_Q2_002_coefficient_09_0124
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0125 : Poly :=
[
  term ((15851511698494771946378687887512 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 125 for generator 9. -/
def ep_Q2_002_partial_09_0125 : Poly :=
[
  term ((31703023396989543892757375775024 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((-15851511698494771946378687887512 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 9. -/
theorem ep_Q2_002_partial_09_0125_valid :
    mulPoly ep_Q2_002_coefficient_09_0125
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0126 : Poly :=
[
  term ((6312634546862165381636652363600 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 126 for generator 9. -/
def ep_Q2_002_partial_09_0126 : Poly :=
[
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-6312634546862165381636652363600 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 9. -/
theorem ep_Q2_002_partial_09_0126_valid :
    mulPoly ep_Q2_002_coefficient_09_0126
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0127 : Poly :=
[
  term ((109096784523906455760732814613040 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 127 for generator 9. -/
def ep_Q2_002_partial_09_0127 : Poly :=
[
  term ((218193569047812911521465629226080 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-109096784523906455760732814613040 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 9. -/
theorem ep_Q2_002_partial_09_0127_valid :
    mulPoly ep_Q2_002_coefficient_09_0127
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0128 : Poly :=
[
  term ((-11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 128 for generator 9. -/
def ep_Q2_002_partial_09_0128 : Poly :=
[
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 9. -/
theorem ep_Q2_002_partial_09_0128_valid :
    mulPoly ep_Q2_002_coefficient_09_0128
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0129 : Poly :=
[
  term ((390797287010747492195097311488675757371944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 129 for generator 9. -/
def ep_Q2_002_partial_09_0129 : Poly :=
[
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-390797287010747492195097311488675757371944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 9. -/
theorem ep_Q2_002_partial_09_0129_valid :
    mulPoly ep_Q2_002_coefficient_09_0129
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0130 : Poly :=
[
  term ((6551046542 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 9. -/
def ep_Q2_002_partial_09_0130 : Poly :=
[
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6551046542 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 9. -/
theorem ep_Q2_002_partial_09_0130_valid :
    mulPoly ep_Q2_002_coefficient_09_0130
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0131 : Poly :=
[
  term ((-29851365069418804999795840747104 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 131 for generator 9. -/
def ep_Q2_002_partial_09_0131 : Poly :=
[
  term ((-59702730138837609999591681494208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((29851365069418804999795840747104 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 9. -/
theorem ep_Q2_002_partial_09_0131_valid :
    mulPoly ep_Q2_002_coefficient_09_0131
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0132 : Poly :=
[
  term ((-205449676009897520605388198719680 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 132 for generator 9. -/
def ep_Q2_002_partial_09_0132 : Poly :=
[
  term ((-410899352019795041210776397439360 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((205449676009897520605388198719680 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 9. -/
theorem ep_Q2_002_partial_09_0132_valid :
    mulPoly ep_Q2_002_coefficient_09_0132
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0133 : Poly :=
[
  term ((2113207259508935893271823617364918038928576 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 133 for generator 9. -/
def ep_Q2_002_partial_09_0133 : Poly :=
[
  term ((4226414519017871786543647234729836077857152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-2113207259508935893271823617364918038928576 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 9. -/
theorem ep_Q2_002_partial_09_0133_valid :
    mulPoly ep_Q2_002_coefficient_09_0133
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0134 : Poly :=
[
  term ((-13510487412 : Rat) / 7401317245) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 9. -/
def ep_Q2_002_partial_09_0134 : Poly :=
[
  term ((-27020974824 : Rat) / 7401317245) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((13510487412 : Rat) / 7401317245) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 9. -/
theorem ep_Q2_002_partial_09_0134_valid :
    mulPoly ep_Q2_002_coefficient_09_0134
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0135 : Poly :=
[
  term ((-134839357888841877400110010140717387617136 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 135 for generator 9. -/
def ep_Q2_002_partial_09_0135 : Poly :=
[
  term ((-269678715777683754800220020281434775234272 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((134839357888841877400110010140717387617136 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 9. -/
theorem ep_Q2_002_partial_09_0135_valid :
    mulPoly ep_Q2_002_coefficient_09_0135
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0136 : Poly :=
[
  term ((-14113816278 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 136 for generator 9. -/
def ep_Q2_002_partial_09_0136 : Poly :=
[
  term ((-28227632556 : Rat) / 7401317245) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((14113816278 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 9. -/
theorem ep_Q2_002_partial_09_0136_valid :
    mulPoly ep_Q2_002_coefficient_09_0136
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0137 : Poly :=
[
  term ((6312634546862165381636652363600 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 137 for generator 9. -/
def ep_Q2_002_partial_09_0137 : Poly :=
[
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6312634546862165381636652363600 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 9. -/
theorem ep_Q2_002_partial_09_0137_valid :
    mulPoly ep_Q2_002_coefficient_09_0137
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0138 : Poly :=
[
  term ((-6312634546862165381636652363600 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 138 for generator 9. -/
def ep_Q2_002_partial_09_0138 : Poly :=
[
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((6312634546862165381636652363600 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 9. -/
theorem ep_Q2_002_partial_09_0138_valid :
    mulPoly ep_Q2_002_coefficient_09_0138
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0139 : Poly :=
[
  term ((49930696427425756085982546986544 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 139 for generator 9. -/
def ep_Q2_002_partial_09_0139 : Poly :=
[
  term ((99861392854851512171965093973088 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-49930696427425756085982546986544 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 9. -/
theorem ep_Q2_002_partial_09_0139_valid :
    mulPoly ep_Q2_002_coefficient_09_0139
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0140 : Poly :=
[
  term ((-34079184728930984139603859099032 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 140 for generator 9. -/
def ep_Q2_002_partial_09_0140 : Poly :=
[
  term ((-68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((34079184728930984139603859099032 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 9. -/
theorem ep_Q2_002_partial_09_0140_valid :
    mulPoly ep_Q2_002_coefficient_09_0140
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0141 : Poly :=
[
  term ((-11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 141 for generator 9. -/
def ep_Q2_002_partial_09_0141 : Poly :=
[
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 9. -/
theorem ep_Q2_002_partial_09_0141_valid :
    mulPoly ep_Q2_002_coefficient_09_0141
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0142 : Poly :=
[
  term ((390797287010747492195097311488675757371944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 142 for generator 9. -/
def ep_Q2_002_partial_09_0142 : Poly :=
[
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-390797287010747492195097311488675757371944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 9. -/
theorem ep_Q2_002_partial_09_0142_valid :
    mulPoly ep_Q2_002_coefficient_09_0142
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0143 : Poly :=
[
  term ((6551046542 : Rat) / 7401317245) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 143 for generator 9. -/
def ep_Q2_002_partial_09_0143 : Poly :=
[
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6551046542 : Rat) / 7401317245) [(0, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 9. -/
theorem ep_Q2_002_partial_09_0143_valid :
    mulPoly ep_Q2_002_coefficient_09_0143
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0144 : Poly :=
[
  term ((-490216910399185672629337287620724622251624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 144 for generator 9. -/
def ep_Q2_002_partial_09_0144 : Poly :=
[
  term ((-980433820798371345258674575241449244503248 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((490216910399185672629337287620724622251624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 9. -/
theorem ep_Q2_002_partial_09_0144_valid :
    mulPoly ep_Q2_002_coefficient_09_0144
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0145 : Poly :=
[
  term ((-6551046542 : Rat) / 7401317245) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 9. -/
def ep_Q2_002_partial_09_0145 : Poly :=
[
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6551046542 : Rat) / 7401317245) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 9. -/
theorem ep_Q2_002_partial_09_0145_valid :
    mulPoly ep_Q2_002_coefficient_09_0145
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0146 : Poly :=
[
  term ((64177486914896760308698084366944 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 146 for generator 9. -/
def ep_Q2_002_partial_09_0146 : Poly :=
[
  term ((128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((-64177486914896760308698084366944 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 9. -/
theorem ep_Q2_002_partial_09_0146_valid :
    mulPoly ep_Q2_002_coefficient_09_0146
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0147 : Poly :=
[
  term ((11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 147 for generator 9. -/
def ep_Q2_002_partial_09_0147 : Poly :=
[
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (13, 2), (14, 1)],
  term ((-11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 9. -/
theorem ep_Q2_002_partial_09_0147_valid :
    mulPoly ep_Q2_002_coefficient_09_0147
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0148 : Poly :=
[
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (14, 1)]
]

/-- Partial product 148 for generator 9. -/
def ep_Q2_002_partial_09_0148 : Poly :=
[
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (14, 1)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 9. -/
theorem ep_Q2_002_partial_09_0148_valid :
    mulPoly ep_Q2_002_coefficient_09_0148
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0149 : Poly :=
[
  term ((53254141336705845563406690479581048033104 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 149 for generator 9. -/
def ep_Q2_002_partial_09_0149 : Poly :=
[
  term ((106508282673411691126813380959162096066208 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-53254141336705845563406690479581048033104 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 9. -/
theorem ep_Q2_002_partial_09_0149_valid :
    mulPoly ep_Q2_002_coefficient_09_0149
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0150 : Poly :=
[
  term ((-5025273536 : Rat) / 1480263449) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 150 for generator 9. -/
def ep_Q2_002_partial_09_0150 : Poly :=
[
  term ((-10050547072 : Rat) / 1480263449) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((5025273536 : Rat) / 1480263449) [(0, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 9. -/
theorem ep_Q2_002_partial_09_0150_valid :
    mulPoly ep_Q2_002_coefficient_09_0150
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0151 : Poly :=
[
  term ((-401110064572371105217143462538622627782656 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

/-- Partial product 151 for generator 9. -/
def ep_Q2_002_partial_09_0151 : Poly :=
[
  term ((-802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (15, 2)],
  term ((401110064572371105217143462538622627782656 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 9. -/
theorem ep_Q2_002_partial_09_0151_valid :
    mulPoly ep_Q2_002_coefficient_09_0151
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0152 : Poly :=
[
  term ((11012551402 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 152 for generator 9. -/
def ep_Q2_002_partial_09_0152 : Poly :=
[
  term ((22025102804 : Rat) / 7401317245) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-11012551402 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 9. -/
theorem ep_Q2_002_partial_09_0152_valid :
    mulPoly ep_Q2_002_coefficient_09_0152
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0153 : Poly :=
[
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1)]
]

/-- Partial product 153 for generator 9. -/
def ep_Q2_002_partial_09_0153 : Poly :=
[
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1)],
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 9. -/
theorem ep_Q2_002_partial_09_0153_valid :
    mulPoly ep_Q2_002_coefficient_09_0153
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0154 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1)]
]

/-- Partial product 154 for generator 9. -/
def ep_Q2_002_partial_09_0154 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 9. -/
theorem ep_Q2_002_partial_09_0154_valid :
    mulPoly ep_Q2_002_coefficient_09_0154
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0155 : Poly :=
[
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1)]
]

/-- Partial product 155 for generator 9. -/
def ep_Q2_002_partial_09_0155 : Poly :=
[
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 9. -/
theorem ep_Q2_002_partial_09_0155_valid :
    mulPoly ep_Q2_002_coefficient_09_0155
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0156 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (12, 1)]
]

/-- Partial product 156 for generator 9. -/
def ep_Q2_002_partial_09_0156 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (12, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 9. -/
theorem ep_Q2_002_partial_09_0156_valid :
    mulPoly ep_Q2_002_coefficient_09_0156
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0157 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 157 for generator 9. -/
def ep_Q2_002_partial_09_0157 : Poly :=
[
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 9. -/
theorem ep_Q2_002_partial_09_0157_valid :
    mulPoly ep_Q2_002_coefficient_09_0157
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0158 : Poly :=
[
  term ((711470458559495974939851948368 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (15, 1)]
]

/-- Partial product 158 for generator 9. -/
def ep_Q2_002_partial_09_0158 : Poly :=
[
  term ((-711470458559495974939851948368 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((1422940917118991949879703896736 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 9. -/
theorem ep_Q2_002_partial_09_0158_valid :
    mulPoly ep_Q2_002_coefficient_09_0158
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0159 : Poly :=
[
  term ((-1776440243234785473095314705896 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1)]
]

/-- Partial product 159 for generator 9. -/
def ep_Q2_002_partial_09_0159 : Poly :=
[
  term ((1776440243234785473095314705896 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1)],
  term ((-3552880486469570946190629411792 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 9. -/
theorem ep_Q2_002_partial_09_0159_valid :
    mulPoly ep_Q2_002_coefficient_09_0159
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0160 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1)]
]

/-- Partial product 160 for generator 9. -/
def ep_Q2_002_partial_09_0160 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 9. -/
theorem ep_Q2_002_partial_09_0160_valid :
    mulPoly ep_Q2_002_coefficient_09_0160
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0161 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1)]
]

/-- Partial product 161 for generator 9. -/
def ep_Q2_002_partial_09_0161 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 9. -/
theorem ep_Q2_002_partial_09_0161_valid :
    mulPoly ep_Q2_002_coefficient_09_0161
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0162 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 162 for generator 9. -/
def ep_Q2_002_partial_09_0162 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 9. -/
theorem ep_Q2_002_partial_09_0162_valid :
    mulPoly ep_Q2_002_coefficient_09_0162
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0163 : Poly :=
[
  term ((-570069264790368612198931143899047440555264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 163 for generator 9. -/
def ep_Q2_002_partial_09_0163 : Poly :=
[
  term ((570069264790368612198931143899047440555264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1140138529580737224397862287798094881110528 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 9. -/
theorem ep_Q2_002_partial_09_0163_valid :
    mulPoly ep_Q2_002_coefficient_09_0163
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0164 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 9. -/
def ep_Q2_002_partial_09_0164 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 9. -/
theorem ep_Q2_002_partial_09_0164_valid :
    mulPoly ep_Q2_002_coefficient_09_0164
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0165 : Poly :=
[
  term ((7957945419684274987233865773888 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 2)]
]

/-- Partial product 165 for generator 9. -/
def ep_Q2_002_partial_09_0165 : Poly :=
[
  term ((-7957945419684274987233865773888 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 2)],
  term ((15915890839368549974467731547776 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 9. -/
theorem ep_Q2_002_partial_09_0165_valid :
    mulPoly ep_Q2_002_coefficient_09_0165
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0166 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1)]
]

/-- Partial product 166 for generator 9. -/
def ep_Q2_002_partial_09_0166 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 9. -/
theorem ep_Q2_002_partial_09_0166_valid :
    mulPoly ep_Q2_002_coefficient_09_0166
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0167 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1)]
]

/-- Partial product 167 for generator 9. -/
def ep_Q2_002_partial_09_0167 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 9. -/
theorem ep_Q2_002_partial_09_0167_valid :
    mulPoly ep_Q2_002_coefficient_09_0167
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0168 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 168 for generator 9. -/
def ep_Q2_002_partial_09_0168 : Poly :=
[
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 9. -/
theorem ep_Q2_002_partial_09_0168_valid :
    mulPoly ep_Q2_002_coefficient_09_0168
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0169 : Poly :=
[
  term ((-405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (5, 1), (12, 1)]
]

/-- Partial product 169 for generator 9. -/
def ep_Q2_002_partial_09_0169 : Poly :=
[
  term ((405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (5, 1), (12, 1)],
  term ((-811427640791136329432340613824 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (5, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 9. -/
theorem ep_Q2_002_partial_09_0169_valid :
    mulPoly ep_Q2_002_coefficient_09_0169
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0170 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 170 for generator 9. -/
def ep_Q2_002_partial_09_0170 : Poly :=
[
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 9. -/
theorem ep_Q2_002_partial_09_0170_valid :
    mulPoly ep_Q2_002_coefficient_09_0170
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0171 : Poly :=
[
  term ((184255032320996870227513347034904348866048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (15, 2)]
]

/-- Partial product 171 for generator 9. -/
def ep_Q2_002_partial_09_0171 : Poly :=
[
  term ((-184255032320996870227513347034904348866048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((368510064641993740455026694069808697732096 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 9. -/
theorem ep_Q2_002_partial_09_0171_valid :
    mulPoly ep_Q2_002_coefficient_09_0171
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0172 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 172 for generator 9. -/
def ep_Q2_002_partial_09_0172 : Poly :=
[
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 9. -/
theorem ep_Q2_002_partial_09_0172_valid :
    mulPoly ep_Q2_002_coefficient_09_0172
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0173 : Poly :=
[
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 2), (7, 1)]
]

/-- Partial product 173 for generator 9. -/
def ep_Q2_002_partial_09_0173 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 2), (7, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 9. -/
theorem ep_Q2_002_partial_09_0173_valid :
    mulPoly ep_Q2_002_coefficient_09_0173
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0174 : Poly :=
[
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 2), (15, 1)]
]

/-- Partial product 174 for generator 9. -/
def ep_Q2_002_partial_09_0174 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 9. -/
theorem ep_Q2_002_partial_09_0174_valid :
    mulPoly ep_Q2_002_coefficient_09_0174
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0175 : Poly :=
[
  term ((613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (15, 1)]
]

/-- Partial product 175 for generator 9. -/
def ep_Q2_002_partial_09_0175 : Poly :=
[
  term ((-613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 9. -/
theorem ep_Q2_002_partial_09_0175_valid :
    mulPoly ep_Q2_002_coefficient_09_0175
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0176 : Poly :=
[
  term ((361741570445535644005850830520 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1)]
]

/-- Partial product 176 for generator 9. -/
def ep_Q2_002_partial_09_0176 : Poly :=
[
  term ((-361741570445535644005850830520 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1)],
  term ((723483140891071288011701661040 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 9. -/
theorem ep_Q2_002_partial_09_0176_valid :
    mulPoly ep_Q2_002_coefficient_09_0176
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0177 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (8, 1)]
]

/-- Partial product 177 for generator 9. -/
def ep_Q2_002_partial_09_0177 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (8, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 9. -/
theorem ep_Q2_002_partial_09_0177_valid :
    mulPoly ep_Q2_002_coefficient_09_0177
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0178 : Poly :=
[
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 178 for generator 9. -/
def ep_Q2_002_partial_09_0178 : Poly :=
[
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 9. -/
theorem ep_Q2_002_partial_09_0178_valid :
    mulPoly ep_Q2_002_coefficient_09_0178
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0179 : Poly :=
[
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 179 for generator 9. -/
def ep_Q2_002_partial_09_0179 : Poly :=
[
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 9. -/
theorem ep_Q2_002_partial_09_0179_valid :
    mulPoly ep_Q2_002_coefficient_09_0179
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0180 : Poly :=
[
  term ((405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (7, 1), (12, 1)]
]

/-- Partial product 180 for generator 9. -/
def ep_Q2_002_partial_09_0180 : Poly :=
[
  term ((-405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (7, 1), (12, 1)],
  term ((811427640791136329432340613824 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (7, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 9. -/
theorem ep_Q2_002_partial_09_0180_valid :
    mulPoly ep_Q2_002_coefficient_09_0180
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0181 : Poly :=
[
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 181 for generator 9. -/
def ep_Q2_002_partial_09_0181 : Poly :=
[
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((244911715249270020088751511754752 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 9. -/
theorem ep_Q2_002_partial_09_0181_valid :
    mulPoly ep_Q2_002_coefficient_09_0181
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0182 : Poly :=
[
  term ((374599184999484183833781402644770343468256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (7, 1), (15, 2)]
]

/-- Partial product 182 for generator 9. -/
def ep_Q2_002_partial_09_0182 : Poly :=
[
  term ((-374599184999484183833781402644770343468256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((749198369998968367667562805289540686936512 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 9. -/
theorem ep_Q2_002_partial_09_0182_valid :
    mulPoly ep_Q2_002_coefficient_09_0182
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0183 : Poly :=
[
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 183 for generator 9. -/
def ep_Q2_002_partial_09_0183 : Poly :=
[
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((101973551136 : Rat) / 7401317245) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 9. -/
theorem ep_Q2_002_partial_09_0183_valid :
    mulPoly ep_Q2_002_coefficient_09_0183
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0184 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (9, 1)]
]

/-- Partial product 184 for generator 9. -/
def ep_Q2_002_partial_09_0184 : Poly :=
[
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 9. -/
theorem ep_Q2_002_partial_09_0184_valid :
    mulPoly ep_Q2_002_coefficient_09_0184
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0185 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (11, 1)]
]

/-- Partial product 185 for generator 9. -/
def ep_Q2_002_partial_09_0185 : Poly :=
[
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 9. -/
theorem ep_Q2_002_partial_09_0185_valid :
    mulPoly ep_Q2_002_coefficient_09_0185
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0186 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (13, 1)]
]

/-- Partial product 186 for generator 9. -/
def ep_Q2_002_partial_09_0186 : Poly :=
[
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 9. -/
theorem ep_Q2_002_partial_09_0186_valid :
    mulPoly ep_Q2_002_coefficient_09_0186
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0187 : Poly :=
[
  term ((41985934307947924453405539359472848489888 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (7, 2), (15, 1)]
]

/-- Partial product 187 for generator 9. -/
def ep_Q2_002_partial_09_0187 : Poly :=
[
  term ((-41985934307947924453405539359472848489888 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((83971868615895848906811078718945696979776 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 2), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 9. -/
theorem ep_Q2_002_partial_09_0187_valid :
    mulPoly ep_Q2_002_coefficient_09_0187
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0188 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 9. -/
def ep_Q2_002_partial_09_0188 : Poly :=
[
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (2, 2), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 9. -/
theorem ep_Q2_002_partial_09_0188_valid :
    mulPoly ep_Q2_002_coefficient_09_0188
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0189 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 3)]
]

/-- Partial product 189 for generator 9. -/
def ep_Q2_002_partial_09_0189 : Poly :=
[
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 3)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 9. -/
theorem ep_Q2_002_partial_09_0189_valid :
    mulPoly ep_Q2_002_coefficient_09_0189
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0190 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

/-- Partial product 190 for generator 9. -/
def ep_Q2_002_partial_09_0190 : Poly :=
[
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 9. -/
theorem ep_Q2_002_partial_09_0190_valid :
    mulPoly ep_Q2_002_coefficient_09_0190
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0191 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (15, 2)]
]

/-- Partial product 191 for generator 9. -/
def ep_Q2_002_partial_09_0191 : Poly :=
[
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 9. -/
theorem ep_Q2_002_partial_09_0191_valid :
    mulPoly ep_Q2_002_coefficient_09_0191
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0192 : Poly :=
[
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (15, 2)]
]

/-- Partial product 192 for generator 9. -/
def ep_Q2_002_partial_09_0192 : Poly :=
[
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 9. -/
theorem ep_Q2_002_partial_09_0192_valid :
    mulPoly ep_Q2_002_coefficient_09_0192
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0193 : Poly :=
[
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (12, 1), (15, 1)]
]

/-- Partial product 193 for generator 9. -/
def ep_Q2_002_partial_09_0193 : Poly :=
[
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((1252951825237464718032818647488 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 9. -/
theorem ep_Q2_002_partial_09_0193_valid :
    mulPoly ep_Q2_002_coefficient_09_0193
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0194 : Poly :=
[
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (15, 2)]
]

/-- Partial product 194 for generator 9. -/
def ep_Q2_002_partial_09_0194 : Poly :=
[
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 9. -/
theorem ep_Q2_002_partial_09_0194_valid :
    mulPoly ep_Q2_002_coefficient_09_0194
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0195 : Poly :=
[
  term ((-5409403201519578932274990536504 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 195 for generator 9. -/
def ep_Q2_002_partial_09_0195 : Poly :=
[
  term ((5409403201519578932274990536504 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (15, 1)],
  term ((-10818806403039157864549981073008 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 9. -/
theorem ep_Q2_002_partial_09_0195_valid :
    mulPoly ep_Q2_002_coefficient_09_0195
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0196 : Poly :=
[
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (15, 3)]
]

/-- Partial product 196 for generator 9. -/
def ep_Q2_002_partial_09_0196 : Poly :=
[
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (15, 3)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 9. -/
theorem ep_Q2_002_partial_09_0196_valid :
    mulPoly ep_Q2_002_coefficient_09_0196
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0197 : Poly :=
[
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (15, 3), (16, 1)]
]

/-- Partial product 197 for generator 9. -/
def ep_Q2_002_partial_09_0197 : Poly :=
[
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (2, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 9. -/
theorem ep_Q2_002_partial_09_0197_valid :
    mulPoly ep_Q2_002_coefficient_09_0197
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0198 : Poly :=
[
  term ((1776440243234785473095314705896 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 198 for generator 9. -/
def ep_Q2_002_partial_09_0198 : Poly :=
[
  term ((3552880486469570946190629411792 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((-1776440243234785473095314705896 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 9. -/
theorem ep_Q2_002_partial_09_0198_valid :
    mulPoly ep_Q2_002_coefficient_09_0198
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0199 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (4, 1), (5, 1), (7, 1)]
]

/-- Partial product 199 for generator 9. -/
def ep_Q2_002_partial_09_0199 : Poly :=
[
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (7, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (4, 1), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 9. -/
theorem ep_Q2_002_partial_09_0199_valid :
    mulPoly ep_Q2_002_coefficient_09_0199
        ep_Q2_002_generator_09_0100_0199 =
      ep_Q2_002_partial_09_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_0100_0199 : List Poly :=
[
  ep_Q2_002_partial_09_0100,
  ep_Q2_002_partial_09_0101,
  ep_Q2_002_partial_09_0102,
  ep_Q2_002_partial_09_0103,
  ep_Q2_002_partial_09_0104,
  ep_Q2_002_partial_09_0105,
  ep_Q2_002_partial_09_0106,
  ep_Q2_002_partial_09_0107,
  ep_Q2_002_partial_09_0108,
  ep_Q2_002_partial_09_0109,
  ep_Q2_002_partial_09_0110,
  ep_Q2_002_partial_09_0111,
  ep_Q2_002_partial_09_0112,
  ep_Q2_002_partial_09_0113,
  ep_Q2_002_partial_09_0114,
  ep_Q2_002_partial_09_0115,
  ep_Q2_002_partial_09_0116,
  ep_Q2_002_partial_09_0117,
  ep_Q2_002_partial_09_0118,
  ep_Q2_002_partial_09_0119,
  ep_Q2_002_partial_09_0120,
  ep_Q2_002_partial_09_0121,
  ep_Q2_002_partial_09_0122,
  ep_Q2_002_partial_09_0123,
  ep_Q2_002_partial_09_0124,
  ep_Q2_002_partial_09_0125,
  ep_Q2_002_partial_09_0126,
  ep_Q2_002_partial_09_0127,
  ep_Q2_002_partial_09_0128,
  ep_Q2_002_partial_09_0129,
  ep_Q2_002_partial_09_0130,
  ep_Q2_002_partial_09_0131,
  ep_Q2_002_partial_09_0132,
  ep_Q2_002_partial_09_0133,
  ep_Q2_002_partial_09_0134,
  ep_Q2_002_partial_09_0135,
  ep_Q2_002_partial_09_0136,
  ep_Q2_002_partial_09_0137,
  ep_Q2_002_partial_09_0138,
  ep_Q2_002_partial_09_0139,
  ep_Q2_002_partial_09_0140,
  ep_Q2_002_partial_09_0141,
  ep_Q2_002_partial_09_0142,
  ep_Q2_002_partial_09_0143,
  ep_Q2_002_partial_09_0144,
  ep_Q2_002_partial_09_0145,
  ep_Q2_002_partial_09_0146,
  ep_Q2_002_partial_09_0147,
  ep_Q2_002_partial_09_0148,
  ep_Q2_002_partial_09_0149,
  ep_Q2_002_partial_09_0150,
  ep_Q2_002_partial_09_0151,
  ep_Q2_002_partial_09_0152,
  ep_Q2_002_partial_09_0153,
  ep_Q2_002_partial_09_0154,
  ep_Q2_002_partial_09_0155,
  ep_Q2_002_partial_09_0156,
  ep_Q2_002_partial_09_0157,
  ep_Q2_002_partial_09_0158,
  ep_Q2_002_partial_09_0159,
  ep_Q2_002_partial_09_0160,
  ep_Q2_002_partial_09_0161,
  ep_Q2_002_partial_09_0162,
  ep_Q2_002_partial_09_0163,
  ep_Q2_002_partial_09_0164,
  ep_Q2_002_partial_09_0165,
  ep_Q2_002_partial_09_0166,
  ep_Q2_002_partial_09_0167,
  ep_Q2_002_partial_09_0168,
  ep_Q2_002_partial_09_0169,
  ep_Q2_002_partial_09_0170,
  ep_Q2_002_partial_09_0171,
  ep_Q2_002_partial_09_0172,
  ep_Q2_002_partial_09_0173,
  ep_Q2_002_partial_09_0174,
  ep_Q2_002_partial_09_0175,
  ep_Q2_002_partial_09_0176,
  ep_Q2_002_partial_09_0177,
  ep_Q2_002_partial_09_0178,
  ep_Q2_002_partial_09_0179,
  ep_Q2_002_partial_09_0180,
  ep_Q2_002_partial_09_0181,
  ep_Q2_002_partial_09_0182,
  ep_Q2_002_partial_09_0183,
  ep_Q2_002_partial_09_0184,
  ep_Q2_002_partial_09_0185,
  ep_Q2_002_partial_09_0186,
  ep_Q2_002_partial_09_0187,
  ep_Q2_002_partial_09_0188,
  ep_Q2_002_partial_09_0189,
  ep_Q2_002_partial_09_0190,
  ep_Q2_002_partial_09_0191,
  ep_Q2_002_partial_09_0192,
  ep_Q2_002_partial_09_0193,
  ep_Q2_002_partial_09_0194,
  ep_Q2_002_partial_09_0195,
  ep_Q2_002_partial_09_0196,
  ep_Q2_002_partial_09_0197,
  ep_Q2_002_partial_09_0198,
  ep_Q2_002_partial_09_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_0100_0199 : Poly :=
[
  term ((50501076374897323053093218908800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-147338306128257254527084639144416 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-95102984241484859831569410009600 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((3126378296085979937560778491909406058975552 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((52408372336 : Rat) / 7401317245) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((59702730138837609999591681494208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (13, 1)],
  term ((277465622749535131099308896614272 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-1724967042888195338141931240164860469680272 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1)],
  term ((6665324172 : Rat) / 1057331035) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((269678715777683754800220020281434775234272 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (5, 1), (15, 1)],
  term ((28227632556 : Rat) / 7401317245) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (11, 1), (13, 1)],
  term ((105687666033662992942820115463552572851424 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-44050205608 : Rat) / 7401317245) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (11, 2)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (11, 2), (12, 1)],
  term ((787014759957057302444752097895552 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-5291497345751988697811781044321457038519232 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (6, 1), (15, 2)],
  term ((127526445544 : Rat) / 7401317245) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((31703023396989543892757375775024 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (11, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((218193569047812911521465629226080 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-59702730138837609999591681494208 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (13, 1)],
  term ((-410899352019795041210776397439360 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((4226414519017871786543647234729836077857152 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-27020974824 : Rat) / 7401317245) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-269678715777683754800220020281434775234272 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (7, 1), (15, 1)],
  term ((-28227632556 : Rat) / 7401317245) [(0, 1), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((99861392854851512171965093973088 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (11, 1), (15, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-980433820798371345258674575241449244503248 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (13, 1), (15, 1)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 1), (13, 2), (14, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (2, 1), (14, 1)],
  term ((106508282673411691126813380959162096066208 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-10050547072 : Rat) / 1480263449) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 1), (15, 2)],
  term ((22025102804 : Rat) / 7401317245) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((73669153064128627263542319572208 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1), (14, 1)],
  term ((-11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((390797287010747492195097311488675757371944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((6551046542 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-29851365069418804999795840747104 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)],
  term ((-138732811374767565549654448307136 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((862483521444097669070965620082430234840136 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-3332662086 : Rat) / 1057331035) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-134839357888841877400110010140717387617136 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)],
  term ((-14113816278 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-52843833016831496471410057731776286425712 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((22025102804 : Rat) / 7401317245) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2), (12, 1)],
  term ((-393507379978528651222376048947776 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((2645748672875994348905890522160728519259616 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (15, 2)],
  term ((-63763222772 : Rat) / 7401317245) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-15851511698494771946378687887512 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)],
  term ((-6312634546862165381636652363600 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-109096784523906455760732814613040 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-390797287010747492195097311488675757371944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-6551046542 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((29851365069418804999795840747104 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)],
  term ((205449676009897520605388198719680 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((-2113207259508935893271823617364918038928576 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((13510487412 : Rat) / 7401317245) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((134839357888841877400110010140717387617136 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)],
  term ((14113816278 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6312634546862165381636652363600 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((6312634546862165381636652363600 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-49930696427425756085982546986544 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((34079184728930984139603859099032 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (15, 1)],
  term ((11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-390797287010747492195097311488675757371944 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)],
  term ((-6551046542 : Rat) / 7401317245) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((490216910399185672629337287620724622251624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((6551046542 : Rat) / 7401317245) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64177486914896760308698084366944 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 1), (15, 1)],
  term ((-11887873030185607478946176251200 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2), (14, 1)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(0, 1), (14, 1)],
  term ((-53254141336705845563406690479581048033104 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (14, 1), (15, 2)],
  term ((5025273536 : Rat) / 1480263449) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((401110064572371105217143462538622627782656 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)],
  term ((-11012551402 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)],
  term ((3552880486469570946190629411792 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (3, 1), (4, 1)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (7, 1)],
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (5, 1), (12, 1)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (7, 1), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-711470458559495974939851948368 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((1776440243234785473095314705896 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (9, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (11, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 1), (13, 1)],
  term ((570069264790368612198931143899047440555264 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-7957945419684274987233865773888 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (7, 2)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (8, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (9, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1)],
  term ((405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (5, 1), (12, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-184255032320996870227513347034904348866048 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (5, 1), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 1), (5, 2), (7, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (5, 2), (15, 1)],
  term ((-613290056235095947809105628608 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-361741570445535644005850830520 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (8, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-405713820395568164716170306912 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (7, 1), (12, 1)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-374599184999484183833781402644770343468256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (9, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((-41985934307947924453405539359472848489888 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (2, 1), (7, 2), (15, 1), (16, 1)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (7, 3)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((5409403201519578932274990536504 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (15, 1)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (15, 3)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (5, 1), (12, 1)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1), (12, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (12, 1), (15, 1)],
  term ((1422940917118991949879703896736 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-3552880486469570946190629411792 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1)],
  term ((16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 1), (9, 1)],
  term ((195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 1), (11, 1)],
  term ((-367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 1), (13, 1)],
  term ((-1140138529580737224397862287798094881110528 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1)],
  term ((-152960326704 : Rat) / 7401317245) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((15915890839368549974467731547776 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (8, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (9, 1), (15, 1)],
  term ((-65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1)],
  term ((-811427640791136329432340613824 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (13, 1), (15, 1)],
  term ((368510064641993740455026694069808697732096 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (5, 1), (15, 2)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 2), (5, 1), (15, 2), (16, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 2), (7, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 2), (15, 1)],
  term ((1226580112470191895618211257216 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((723483140891071288011701661040 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (8, 1)],
  term ((-10682396661860416725410715707904 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1)],
  term ((-130051704849818097650872526009856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1)],
  term ((811427640791136329432340613824 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (7, 1), (12, 1)],
  term ((244911715249270020088751511754752 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((749198369998968367667562805289540686936512 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (7, 1), (15, 2)],
  term ((101973551136 : Rat) / 7401317245) [(1, 1), (2, 2), (7, 1), (15, 2), (16, 1)],
  term ((-16023594992790625088116073561856 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 2), (9, 1)],
  term ((-195077557274727146476308789014784 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 2), (11, 1)],
  term ((367367572873905030133127267632128 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 2), (13, 1)],
  term ((83971868615895848906811078718945696979776 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 2), (7, 2), (15, 1)],
  term ((152960326704 : Rat) / 7401317245) [(1, 1), (2, 2), (7, 2), (15, 1), (16, 1)],
  term ((-28816817223990727632529620721344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 3)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (8, 1), (15, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (9, 1), (15, 2)],
  term ((65025852424909048825436263004928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (11, 1), (15, 2)],
  term ((1252951825237464718032818647488 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((-10818806403039157864549981073008 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (15, 1)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 3)],
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (2, 2), (15, 3), (16, 1)],
  term ((-1776440243234785473095314705896 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (4, 1), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 100 through 199. -/
theorem ep_Q2_002_block_09_0100_0199_valid :
    checkProductSumEq ep_Q2_002_partials_09_0100_0199
      ep_Q2_002_block_09_0100_0199 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
