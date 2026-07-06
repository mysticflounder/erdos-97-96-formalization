/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 23:100-132

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_23_0100_0132 : Poly :=
[
  term (2 : Rat) [(10, 1), (12, 1)],
  term (2 : Rat) [(11, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0100 : Poly :=
[
  term ((47109525476592869961315078233520 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 100 for generator 23. -/
def ep_Q2_002_partial_23_0100 : Poly :=
[
  term ((94219050953185739922630156467040 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-47109525476592869961315078233520 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-47109525476592869961315078233520 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 3)],
  term ((94219050953185739922630156467040 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 23. -/
theorem ep_Q2_002_partial_23_0100_valid :
    mulPoly ep_Q2_002_coefficient_23_0100
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0101 : Poly :=
[
  term ((-7485918609306003097914770981352726624336 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 101 for generator 23. -/
def ep_Q2_002_partial_23_0101 : Poly :=
[
  term ((-14971837218612006195829541962705453248672 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((7485918609306003097914770981352726624336 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((7485918609306003097914770981352726624336 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-14971837218612006195829541962705453248672 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 23. -/
theorem ep_Q2_002_partial_23_0101_valid :
    mulPoly ep_Q2_002_coefficient_23_0101
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0102 : Poly :=
[
  term ((253160212 : Rat) / 157474835) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 23. -/
def ep_Q2_002_partial_23_0102 : Poly :=
[
  term ((506320424 : Rat) / 157474835) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-253160212 : Rat) / 157474835) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-253160212 : Rat) / 157474835) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((506320424 : Rat) / 157474835) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 23. -/
theorem ep_Q2_002_partial_23_0102_valid :
    mulPoly ep_Q2_002_coefficient_23_0102
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0103 : Poly :=
[
  term ((-34448648463904465714919571836316 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

/-- Partial product 103 for generator 23. -/
def ep_Q2_002_partial_23_0103 : Poly :=
[
  term ((-68897296927808931429839143672632 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((34448648463904465714919571836316 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 2)],
  term ((34448648463904465714919571836316 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (13, 2)],
  term ((-68897296927808931429839143672632 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 23. -/
theorem ep_Q2_002_partial_23_0103_valid :
    mulPoly ep_Q2_002_coefficient_23_0103
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0104 : Poly :=
[
  term ((-128515145534756158798247237370122235495552 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 104 for generator 23. -/
def ep_Q2_002_partial_23_0104 : Poly :=
[
  term ((-257030291069512317596494474740244470991104 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-257030291069512317596494474740244470991104 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((128515145534756158798247237370122235495552 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((128515145534756158798247237370122235495552 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 23. -/
theorem ep_Q2_002_partial_23_0104_valid :
    mulPoly ep_Q2_002_coefficient_23_0104
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0105 : Poly :=
[
  term ((8987039524 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 23. -/
def ep_Q2_002_partial_23_0105 : Poly :=
[
  term ((17974079048 : Rat) / 7401317245) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17974079048 : Rat) / 7401317245) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8987039524 : Rat) / 7401317245) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8987039524 : Rat) / 7401317245) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 23. -/
theorem ep_Q2_002_partial_23_0105_valid :
    mulPoly ep_Q2_002_coefficient_23_0105
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0106 : Poly :=
[
  term ((33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

/-- Partial product 106 for generator 23. -/
def ep_Q2_002_partial_23_0106 : Poly :=
[
  term ((66904863640459691987887296173568 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((66904863640459691987887296173568 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 3)],
  term ((-33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(8, 1), (12, 2), (13, 2)],
  term ((-33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 23. -/
theorem ep_Q2_002_partial_23_0106_valid :
    mulPoly ep_Q2_002_coefficient_23_0106
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0107 : Poly :=
[
  term ((-652343533572763392531853512407526078599988 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 107 for generator 23. -/
def ep_Q2_002_partial_23_0107 : Poly :=
[
  term ((-1304687067145526785063707024815052157199976 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1304687067145526785063707024815052157199976 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((652343533572763392531853512407526078599988 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 2), (15, 2)],
  term ((652343533572763392531853512407526078599988 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 23. -/
theorem ep_Q2_002_partial_23_0107_valid :
    mulPoly ep_Q2_002_coefficient_23_0107
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0108 : Poly :=
[
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 108 for generator 23. -/
def ep_Q2_002_partial_23_0108 : Poly :=
[
  term ((-48641717828 : Rat) / 7401317245) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48641717828 : Rat) / 7401317245) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 23. -/
theorem ep_Q2_002_partial_23_0108_valid :
    mulPoly ep_Q2_002_coefficient_23_0108
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0109 : Poly :=
[
  term ((67956367631559342823679245789860 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 109 for generator 23. -/
def ep_Q2_002_partial_23_0109 : Poly :=
[
  term ((135912735263118685647358491579720 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-67956367631559342823679245789860 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 2)],
  term ((-67956367631559342823679245789860 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (13, 2)],
  term ((135912735263118685647358491579720 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 23. -/
theorem ep_Q2_002_partial_23_0109_valid :
    mulPoly ep_Q2_002_coefficient_23_0109
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0110 : Poly :=
[
  term ((-112441982951123534238031980648576 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 110 for generator 23. -/
def ep_Q2_002_partial_23_0110 : Poly :=
[
  term ((-224883965902247068476063961297152 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((112441982951123534238031980648576 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((112441982951123534238031980648576 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 3)],
  term ((-224883965902247068476063961297152 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 23. -/
theorem ep_Q2_002_partial_23_0110_valid :
    mulPoly ep_Q2_002_coefficient_23_0110
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0111 : Poly :=
[
  term ((211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 111 for generator 23. -/
def ep_Q2_002_partial_23_0111 : Poly :=
[
  term ((423498622219366607453746496553984 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((423498622219366607453746496553984 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 3)],
  term ((-211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 23. -/
theorem ep_Q2_002_partial_23_0111_valid :
    mulPoly ep_Q2_002_coefficient_23_0111
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0112 : Poly :=
[
  term ((707490864426618520767330604574751290873664 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 112 for generator 23. -/
def ep_Q2_002_partial_23_0112 : Poly :=
[
  term ((1414981728853237041534661209149502581747328 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((1414981728853237041534661209149502581747328 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-707490864426618520767330604574751290873664 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-707490864426618520767330604574751290873664 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 23. -/
theorem ep_Q2_002_partial_23_0112_valid :
    mulPoly ep_Q2_002_coefficient_23_0112
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0113 : Poly :=
[
  term ((91681691232 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 23. -/
def ep_Q2_002_partial_23_0113 : Poly :=
[
  term ((183363382464 : Rat) / 7401317245) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((183363382464 : Rat) / 7401317245) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-91681691232 : Rat) / 7401317245) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-91681691232 : Rat) / 7401317245) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 23. -/
theorem ep_Q2_002_partial_23_0113_valid :
    mulPoly ep_Q2_002_coefficient_23_0113
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0114 : Poly :=
[
  term ((-127974566561619747764373394047120 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 114 for generator 23. -/
def ep_Q2_002_partial_23_0114 : Poly :=
[
  term ((-255949133123239495528746788094240 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-255949133123239495528746788094240 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (13, 2)],
  term ((127974566561619747764373394047120 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 2), (13, 1)],
  term ((127974566561619747764373394047120 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 23. -/
theorem ep_Q2_002_partial_23_0114_valid :
    mulPoly ep_Q2_002_coefficient_23_0114
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0115 : Poly :=
[
  term ((287472383592396316885470800646812147063724 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 1)]
]

/-- Partial product 115 for generator 23. -/
def ep_Q2_002_partial_23_0115 : Poly :=
[
  term ((574944767184792633770941601293624294127448 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((574944767184792633770941601293624294127448 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-287472383592396316885470800646812147063724 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 2), (15, 1)],
  term ((-287472383592396316885470800646812147063724 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 23. -/
theorem ep_Q2_002_partial_23_0115_valid :
    mulPoly ep_Q2_002_coefficient_23_0115
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0116 : Poly :=
[
  term ((-35210407088 : Rat) / 7401317245) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 23. -/
def ep_Q2_002_partial_23_0116 : Poly :=
[
  term ((-70420814176 : Rat) / 7401317245) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70420814176 : Rat) / 7401317245) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35210407088 : Rat) / 7401317245) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((35210407088 : Rat) / 7401317245) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 23. -/
theorem ep_Q2_002_partial_23_0116_valid :
    mulPoly ep_Q2_002_coefficient_23_0116
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0117 : Poly :=
[
  term ((3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 117 for generator 23. -/
def ep_Q2_002_partial_23_0117 : Poly :=
[
  term ((7114035477592481068539286221312 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 1), (13, 3)],
  term ((-3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 3), (13, 1)],
  term ((7114035477592481068539286221312 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 23. -/
theorem ep_Q2_002_partial_23_0117_valid :
    mulPoly ep_Q2_002_coefficient_23_0117
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0118 : Poly :=
[
  term ((-35264942264064355868076963771351956833656 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 118 for generator 23. -/
def ep_Q2_002_partial_23_0118 : Poly :=
[
  term ((-70529884528128711736153927542703913667312 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((35264942264064355868076963771351956833656 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((35264942264064355868076963771351956833656 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 3), (15, 1)],
  term ((-70529884528128711736153927542703913667312 : Rat) / 1346818217520322526586147269553926167495) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 23. -/
theorem ep_Q2_002_partial_23_0118_valid :
    mulPoly ep_Q2_002_coefficient_23_0118
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0119 : Poly :=
[
  term ((14389252022 : Rat) / 7401317245) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 23. -/
def ep_Q2_002_partial_23_0119 : Poly :=
[
  term ((28778504044 : Rat) / 7401317245) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14389252022 : Rat) / 7401317245) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14389252022 : Rat) / 7401317245) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((28778504044 : Rat) / 7401317245) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 23. -/
theorem ep_Q2_002_partial_23_0119_valid :
    mulPoly ep_Q2_002_coefficient_23_0119
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0120 : Poly :=
[
  term ((220874567183291216551370372687448 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

/-- Partial product 120 for generator 23. -/
def ep_Q2_002_partial_23_0120 : Poly :=
[
  term ((441749134366582433102740745374896 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-220874567183291216551370372687448 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1)],
  term ((-220874567183291216551370372687448 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 3)],
  term ((441749134366582433102740745374896 : Rat) / 1273790490336191187829975377157) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 23. -/
theorem ep_Q2_002_partial_23_0120_valid :
    mulPoly ep_Q2_002_coefficient_23_0120
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0121 : Poly :=
[
  term ((486553468825087338980122874938042945822086 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 1)]
]

/-- Partial product 121 for generator 23. -/
def ep_Q2_002_partial_23_0121 : Poly :=
[
  term ((973106937650174677960245749876085891644172 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-486553468825087338980122874938042945822086 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 2), (15, 1)],
  term ((-486553468825087338980122874938042945822086 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (13, 2), (15, 1)],
  term ((973106937650174677960245749876085891644172 : Rat) / 1346818217520322526586147269553926167495) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 23. -/
theorem ep_Q2_002_partial_23_0121_valid :
    mulPoly ep_Q2_002_coefficient_23_0121
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0122 : Poly :=
[
  term ((164320952911 : Rat) / 14802634490) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 23. -/
def ep_Q2_002_partial_23_0122 : Poly :=
[
  term ((164320952911 : Rat) / 7401317245) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-164320952911 : Rat) / 14802634490) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-164320952911 : Rat) / 14802634490) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((164320952911 : Rat) / 7401317245) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 23. -/
theorem ep_Q2_002_partial_23_0122_valid :
    mulPoly ep_Q2_002_coefficient_23_0122
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0123 : Poly :=
[
  term ((-107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(11, 2)]
]

/-- Partial product 123 for generator 23. -/
def ep_Q2_002_partial_23_0123 : Poly :=
[
  term ((-215906549724040290247603645673184 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 2), (12, 1)],
  term ((107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2)],
  term ((107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(11, 2), (13, 2)],
  term ((-215906549724040290247603645673184 : Rat) / 1273790490336191187829975377157) [(11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 23. -/
theorem ep_Q2_002_partial_23_0123_valid :
    mulPoly ep_Q2_002_coefficient_23_0123
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0124 : Poly :=
[
  term ((-1888828472907748520661604488768 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 1)]
]

/-- Partial product 124 for generator 23. -/
def ep_Q2_002_partial_23_0124 : Poly :=
[
  term ((-3777656945815497041323208977536 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 2), (12, 2)],
  term ((1888828472907748520661604488768 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 1), (13, 2)],
  term ((1888828472907748520661604488768 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 3)],
  term ((-3777656945815497041323208977536 : Rat) / 115799135485108289802725034287) [(11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 23. -/
theorem ep_Q2_002_partial_23_0124_valid :
    mulPoly ep_Q2_002_coefficient_23_0124
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0125 : Poly :=
[
  term ((122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 125 for generator 23. -/
def ep_Q2_002_partial_23_0125 : Poly :=
[
  term ((245396459281069090015310326955904 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((245396459281069090015310326955904 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 3), (15, 1)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 23. -/
theorem ep_Q2_002_partial_23_0125_valid :
    mulPoly ep_Q2_002_coefficient_23_0125
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0126 : Poly :=
[
  term ((112657757516566903261406901770562917404584 : Rat) / 269363643504064505317229453910785233499) [(12, 1), (15, 2)]
]

/-- Partial product 126 for generator 23. -/
def ep_Q2_002_partial_23_0126 : Poly :=
[
  term ((225315515033133806522813803541125834809168 : Rat) / 269363643504064505317229453910785233499) [(10, 1), (12, 2), (15, 2)],
  term ((225315515033133806522813803541125834809168 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-112657757516566903261406901770562917404584 : Rat) / 269363643504064505317229453910785233499) [(12, 1), (13, 2), (15, 2)],
  term ((-112657757516566903261406901770562917404584 : Rat) / 269363643504064505317229453910785233499) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 23. -/
theorem ep_Q2_002_partial_23_0126_valid :
    mulPoly ep_Q2_002_coefficient_23_0126
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0127 : Poly :=
[
  term ((11619879158 : Rat) / 1480263449) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 23. -/
def ep_Q2_002_partial_23_0127 : Poly :=
[
  term ((23239758316 : Rat) / 1480263449) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((23239758316 : Rat) / 1480263449) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11619879158 : Rat) / 1480263449) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-11619879158 : Rat) / 1480263449) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 23. -/
theorem ep_Q2_002_partial_23_0127_valid :
    mulPoly ep_Q2_002_coefficient_23_0127
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0128 : Poly :=
[
  term ((-93556494199155904520133862036376126168616 : Rat) / 1346818217520322526586147269553926167495) [(13, 1), (15, 1)]
]

/-- Partial product 128 for generator 23. -/
def ep_Q2_002_partial_23_0128 : Poly :=
[
  term ((-187112988398311809040267724072752252337232 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-187112988398311809040267724072752252337232 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (13, 2), (15, 1)],
  term ((93556494199155904520133862036376126168616 : Rat) / 1346818217520322526586147269553926167495) [(12, 2), (13, 1), (15, 1)],
  term ((93556494199155904520133862036376126168616 : Rat) / 1346818217520322526586147269553926167495) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 23. -/
theorem ep_Q2_002_partial_23_0128_valid :
    mulPoly ep_Q2_002_coefficient_23_0128
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0129 : Poly :=
[
  term ((1325944112 : Rat) / 7401317245) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 23. -/
def ep_Q2_002_partial_23_0129 : Poly :=
[
  term ((2651888224 : Rat) / 7401317245) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2651888224 : Rat) / 7401317245) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1325944112 : Rat) / 7401317245) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1325944112 : Rat) / 7401317245) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 23. -/
theorem ep_Q2_002_partial_23_0129_valid :
    mulPoly ep_Q2_002_coefficient_23_0129
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0130 : Poly :=
[
  term ((21295156284307415503376186378400 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

/-- Partial product 130 for generator 23. -/
def ep_Q2_002_partial_23_0130 : Poly :=
[
  term ((42590312568614831006752372756800 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 1), (13, 2)],
  term ((42590312568614831006752372756800 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 3)],
  term ((-21295156284307415503376186378400 : Rat) / 1273790490336191187829975377157) [(12, 2), (13, 2)],
  term ((-21295156284307415503376186378400 : Rat) / 1273790490336191187829975377157) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 23. -/
theorem ep_Q2_002_partial_23_0130_valid :
    mulPoly ep_Q2_002_coefficient_23_0130
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0131 : Poly :=
[
  term ((161956428522391577719394895532280509571766 : Rat) / 1346818217520322526586147269553926167495) [(15, 2)]
]

/-- Partial product 131 for generator 23. -/
def ep_Q2_002_partial_23_0131 : Poly :=
[
  term ((323912857044783155438789791064561019143532 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (12, 1), (15, 2)],
  term ((323912857044783155438789791064561019143532 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (13, 1), (15, 2)],
  term ((-161956428522391577719394895532280509571766 : Rat) / 1346818217520322526586147269553926167495) [(12, 2), (15, 2)],
  term ((-161956428522391577719394895532280509571766 : Rat) / 1346818217520322526586147269553926167495) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 23. -/
theorem ep_Q2_002_partial_23_0131_valid :
    mulPoly ep_Q2_002_coefficient_23_0131
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 23. -/
def ep_Q2_002_coefficient_23_0132 : Poly :=
[
  term ((57035734191 : Rat) / 14802634490) [(15, 2), (16, 1)]
]

/-- Partial product 132 for generator 23. -/
def ep_Q2_002_partial_23_0132 : Poly :=
[
  term ((57035734191 : Rat) / 7401317245) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((57035734191 : Rat) / 7401317245) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57035734191 : Rat) / 14802634490) [(12, 2), (15, 2), (16, 1)],
  term ((-57035734191 : Rat) / 14802634490) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 23. -/
theorem ep_Q2_002_partial_23_0132_valid :
    mulPoly ep_Q2_002_coefficient_23_0132
        ep_Q2_002_generator_23_0100_0132 =
      ep_Q2_002_partial_23_0132 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_23_0100_0132 : List Poly :=
[
  ep_Q2_002_partial_23_0100,
  ep_Q2_002_partial_23_0101,
  ep_Q2_002_partial_23_0102,
  ep_Q2_002_partial_23_0103,
  ep_Q2_002_partial_23_0104,
  ep_Q2_002_partial_23_0105,
  ep_Q2_002_partial_23_0106,
  ep_Q2_002_partial_23_0107,
  ep_Q2_002_partial_23_0108,
  ep_Q2_002_partial_23_0109,
  ep_Q2_002_partial_23_0110,
  ep_Q2_002_partial_23_0111,
  ep_Q2_002_partial_23_0112,
  ep_Q2_002_partial_23_0113,
  ep_Q2_002_partial_23_0114,
  ep_Q2_002_partial_23_0115,
  ep_Q2_002_partial_23_0116,
  ep_Q2_002_partial_23_0117,
  ep_Q2_002_partial_23_0118,
  ep_Q2_002_partial_23_0119,
  ep_Q2_002_partial_23_0120,
  ep_Q2_002_partial_23_0121,
  ep_Q2_002_partial_23_0122,
  ep_Q2_002_partial_23_0123,
  ep_Q2_002_partial_23_0124,
  ep_Q2_002_partial_23_0125,
  ep_Q2_002_partial_23_0126,
  ep_Q2_002_partial_23_0127,
  ep_Q2_002_partial_23_0128,
  ep_Q2_002_partial_23_0129,
  ep_Q2_002_partial_23_0130,
  ep_Q2_002_partial_23_0131,
  ep_Q2_002_partial_23_0132
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_23_0100_0132 : Poly :=
[
  term ((94219050953185739922630156467040 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-14971837218612006195829541962705453248672 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((506320424 : Rat) / 157474835) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-68897296927808931429839143672632 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((-257030291069512317596494474740244470991104 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((17974079048 : Rat) / 7401317245) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((66904863640459691987887296173568 : Rat) / 1273790490336191187829975377157) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-1304687067145526785063707024815052157199976 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-48641717828 : Rat) / 7401317245) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-47109525476592869961315078233520 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((7485918609306003097914770981352726624336 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-253160212 : Rat) / 157474835) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1304687067145526785063707024815052157199976 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-48641717828 : Rat) / 7401317245) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8618898506169984364136341943939425486608 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((6075549084 : Rat) / 7401317245) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((19795338163866822026572217940048 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 3)],
  term ((34448648463904465714919571836316 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 2)],
  term ((-14971837218612006195829541962705453248672 : Rat) / 28655706755751543118854197224551620585) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((506320424 : Rat) / 157474835) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((128667699417090205637549728303356 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (13, 2)],
  term ((-68897296927808931429839143672632 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 3), (13, 1)],
  term ((128515145534756158798247237370122235495552 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-8987039524 : Rat) / 7401317245) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(8, 1), (12, 2), (13, 2)],
  term ((652343533572763392531853512407526078599988 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 2), (15, 2)],
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((652343533572763392531853512407526078599988 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 2), (15, 2)],
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((128515145534756158798247237370122235495552 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 3), (15, 1)],
  term ((-8987039524 : Rat) / 7401317245) [(8, 1), (13, 3), (15, 1), (16, 1)],
  term ((-33452431820229845993943648086784 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 4)],
  term ((135912735263118685647358491579720 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-224883965902247068476063961297152 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-255949133123239495528746788094240 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((574944767184792633770941601293624294127448 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-70420814176 : Rat) / 7401317245) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((423498622219366607453746496553984 : Rat) / 1273790490336191187829975377157) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((1414981728853237041534661209149502581747328 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((183363382464 : Rat) / 7401317245) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1414981728853237041534661209149502581747328 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((183363382464 : Rat) / 7401317245) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((535940605170490141691778477202560 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-67956367631559342823679245789860 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 2)],
  term ((112441982951123534238031980648576 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 3)],
  term ((574944767184792633770941601293624294127448 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-70420814176 : Rat) / 7401317245) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-323905500754798838352426033884100 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (13, 2)],
  term ((-224883965902247068476063961297152 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 2), (12, 1), (13, 1)],
  term ((135912735263118685647358491579720 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 2), (13, 1)],
  term ((-707490864426618520767330604574751290873664 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-91681691232 : Rat) / 7401317245) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 3)],
  term ((127974566561619747764373394047120 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 2), (13, 1)],
  term ((-287472383592396316885470800646812147063724 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 2), (15, 1)],
  term ((35210407088 : Rat) / 7401317245) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-211749311109683303726873248276992 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 3), (13, 1)],
  term ((-707490864426618520767330604574751290873664 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 3), (15, 1)],
  term ((-91681691232 : Rat) / 7401317245) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-287472383592396316885470800646812147063724 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (13, 2), (15, 1)],
  term ((35210407088 : Rat) / 7401317245) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((127974566561619747764373394047120 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 3)],
  term ((441749134366582433102740745374896 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((973106937650174677960245749876085891644172 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((164320952911 : Rat) / 7401317245) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7114035477592481068539286221312 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-70529884528128711736153927542703913667312 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((28778504044 : Rat) / 7401317245) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-215906549724040290247603645673184 : Rat) / 1273790490336191187829975377157) [(10, 1), (11, 2), (12, 1)],
  term ((-3777656945815497041323208977536 : Rat) / 115799135485108289802725034287) [(10, 1), (11, 2), (12, 2)],
  term ((-187112988398311809040267724072752252337232 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((2651888224 : Rat) / 7401317245) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((42590312568614831006752372756800 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 1), (13, 2)],
  term ((323912857044783155438789791064561019143532 : Rat) / 1346818217520322526586147269553926167495) [(10, 1), (12, 1), (15, 2)],
  term ((57035734191 : Rat) / 7401317245) [(10, 1), (12, 1), (15, 2), (16, 1)],
  term ((245396459281069090015310326955904 : Rat) / 1273790490336191187829975377157) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((225315515033133806522813803541125834809168 : Rat) / 269363643504064505317229453910785233499) [(10, 1), (12, 2), (15, 2)],
  term ((23239758316 : Rat) / 1480263449) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((225315515033133806522813803541125834809168 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((23239758316 : Rat) / 1480263449) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((294730234541052492720473197617826332514296 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-14389252022 : Rat) / 7401317245) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 1), (13, 3)],
  term ((-220874567183291216551370372687448 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1)],
  term ((-486553468825087338980122874938042945822086 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 2), (15, 1)],
  term ((-164320952911 : Rat) / 14802634490) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3557017738796240534269643110656 : Rat) / 115799135485108289802725034287) [(11, 1), (12, 3), (13, 1)],
  term ((35264942264064355868076963771351956833656 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 3), (15, 1)],
  term ((-14389252022 : Rat) / 7401317245) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((323912857044783155438789791064561019143532 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (13, 1), (15, 2)],
  term ((57035734191 : Rat) / 7401317245) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-673666457223399148020390599010795198159318 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (13, 2), (15, 1)],
  term ((-159017176463 : Rat) / 14802634490) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-178284254614676385544617999930648 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 3)],
  term ((-70529884528128711736153927542703913667312 : Rat) / 1346818217520322526586147269553926167495) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((28778504044 : Rat) / 7401317245) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9002863950500229589200890710080 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 1), (13, 2)],
  term ((107953274862020145123801822836592 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2)],
  term ((1888828472907748520661604488768 : Rat) / 115799135485108289802725034287) [(11, 2), (12, 3)],
  term ((973106937650174677960245749876085891644172 : Rat) / 1346818217520322526586147269553926167495) [(11, 2), (13, 1), (15, 1)],
  term ((164320952911 : Rat) / 7401317245) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((549702409228602578226542568211488 : Rat) / 1273790490336191187829975377157) [(11, 2), (13, 2)],
  term ((-3777656945815497041323208977536 : Rat) / 115799135485108289802725034287) [(11, 3), (12, 1), (13, 1)],
  term ((-215906549724040290247603645673184 : Rat) / 1273790490336191187829975377157) [(11, 3), (13, 1)],
  term ((-112657757516566903261406901770562917404584 : Rat) / 269363643504064505317229453910785233499) [(12, 1), (13, 2), (15, 2)],
  term ((-11619879158 : Rat) / 1480263449) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 3), (15, 1)],
  term ((93556494199155904520133862036376126168616 : Rat) / 1346818217520322526586147269553926167495) [(12, 2), (13, 1), (15, 1)],
  term ((-1325944112 : Rat) / 7401317245) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21295156284307415503376186378400 : Rat) / 1273790490336191187829975377157) [(12, 2), (13, 2)],
  term ((-161956428522391577719394895532280509571766 : Rat) / 1346818217520322526586147269553926167495) [(12, 2), (15, 2)],
  term ((-57035734191 : Rat) / 14802634490) [(12, 2), (15, 2), (16, 1)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(12, 3), (13, 1), (15, 1)],
  term ((-112657757516566903261406901770562917404584 : Rat) / 269363643504064505317229453910785233499) [(12, 3), (15, 2)],
  term ((-11619879158 : Rat) / 1480263449) [(12, 3), (15, 2), (16, 1)],
  term ((-161956428522391577719394895532280509571766 : Rat) / 1346818217520322526586147269553926167495) [(13, 2), (15, 2)],
  term ((-57035734191 : Rat) / 14802634490) [(13, 2), (15, 2), (16, 1)],
  term ((93556494199155904520133862036376126168616 : Rat) / 1346818217520322526586147269553926167495) [(13, 3), (15, 1)],
  term ((-1325944112 : Rat) / 7401317245) [(13, 3), (15, 1), (16, 1)],
  term ((-21295156284307415503376186378400 : Rat) / 1273790490336191187829975377157) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 100 through 132. -/
theorem ep_Q2_002_block_23_0100_0132_valid :
    checkProductSumEq ep_Q2_002_partials_23_0100_0132
      ep_Q2_002_block_23_0100_0132 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
