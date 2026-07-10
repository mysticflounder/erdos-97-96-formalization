/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 12:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 12 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_12_0100_0199 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0100 : Poly :=
[
  term ((-969017082424308822314139140158916329677168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 100 for generator 12. -/
def ep_Q2_002_partial_12_0100 : Poly :=
[
  term ((-1938034164848617644628278280317832659354336 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((969017082424308822314139140158916329677168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-1938034164848617644628278280317832659354336 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((969017082424308822314139140158916329677168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 12. -/
theorem ep_Q2_002_partial_12_0100_valid :
    mulPoly ep_Q2_002_coefficient_12_0100
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0101 : Poly :=
[
  term ((-93561253224 : Rat) / 7401317245) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 12. -/
def ep_Q2_002_partial_12_0101 : Poly :=
[
  term ((-187122506448 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((93561253224 : Rat) / 7401317245) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-187122506448 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((93561253224 : Rat) / 7401317245) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 12. -/
theorem ep_Q2_002_partial_12_0101_valid :
    mulPoly ep_Q2_002_coefficient_12_0101
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0102 : Poly :=
[
  term ((208401045147394773194660805580776 : Rat) / 1273790490336191187829975377157) [(1, 1), (13, 1)]
]

/-- Partial product 102 for generator 12. -/
def ep_Q2_002_partial_12_0102 : Poly :=
[
  term ((416802090294789546389321611161552 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-208401045147394773194660805580776 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (13, 1)],
  term ((416802090294789546389321611161552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-208401045147394773194660805580776 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 12. -/
theorem ep_Q2_002_partial_12_0102_valid :
    mulPoly ep_Q2_002_coefficient_12_0102
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0103 : Poly :=
[
  term ((-8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 103 for generator 12. -/
def ep_Q2_002_partial_12_0103 : Poly :=
[
  term ((-17752015743631584637682074955520 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((-17752015743631584637682074955520 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 12. -/
theorem ep_Q2_002_partial_12_0103_valid :
    mulPoly ep_Q2_002_coefficient_12_0103
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0104 : Poly :=
[
  term ((807774393822896713179188699157196382356296 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 1)]
]

/-- Partial product 104 for generator 12. -/
def ep_Q2_002_partial_12_0104 : Poly :=
[
  term ((1615548787645793426358377398314392764712592 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-807774393822896713179188699157196382356296 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 1)],
  term ((1615548787645793426358377398314392764712592 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-807774393822896713179188699157196382356296 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 12. -/
theorem ep_Q2_002_partial_12_0104_valid :
    mulPoly ep_Q2_002_coefficient_12_0104
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0105 : Poly :=
[
  term ((11019622004 : Rat) / 1057331035) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 12. -/
def ep_Q2_002_partial_12_0105 : Poly :=
[
  term ((22039244008 : Rat) / 1057331035) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-11019622004 : Rat) / 1057331035) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((22039244008 : Rat) / 1057331035) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-11019622004 : Rat) / 1057331035) [(1, 1), (3, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 12. -/
theorem ep_Q2_002_partial_12_0105_valid :
    mulPoly ep_Q2_002_coefficient_12_0105
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0106 : Poly :=
[
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)]
]

/-- Partial product 106 for generator 12. -/
def ep_Q2_002_partial_12_0106 : Poly :=
[
  term ((-745809674377051221998173723204418943823232 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 3)],
  term ((-745809674377051221998173723204418943823232 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 12. -/
theorem ep_Q2_002_partial_12_0106_valid :
    mulPoly ep_Q2_002_coefficient_12_0106
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0107 : Poly :=
[
  term ((-50986775568 : Rat) / 7401317245) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 107 for generator 12. -/
def ep_Q2_002_partial_12_0107 : Poly :=
[
  term ((-101973551136 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (15, 3), (16, 1)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 2), (15, 3), (16, 1)],
  term ((-101973551136 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (3, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 12. -/
theorem ep_Q2_002_partial_12_0107_valid :
    mulPoly ep_Q2_002_coefficient_12_0107
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0108 : Poly :=
[
  term ((6178152380164061239160817681408 : Rat) / 1273790490336191187829975377157) [(1, 2)]
]

/-- Partial product 108 for generator 12. -/
def ep_Q2_002_partial_12_0108 : Poly :=
[
  term ((12356304760328122478321635362816 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1)],
  term ((-6178152380164061239160817681408 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2)],
  term ((12356304760328122478321635362816 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1)],
  term ((-6178152380164061239160817681408 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 12. -/
theorem ep_Q2_002_partial_12_0108_valid :
    mulPoly ep_Q2_002_coefficient_12_0108
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0109 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (7, 1)]
]

/-- Partial product 109 for generator 12. -/
def ep_Q2_002_partial_12_0109 : Poly :=
[
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (4, 1), (7, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (3, 1), (7, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (7, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 12. -/
theorem ep_Q2_002_partial_12_0109_valid :
    mulPoly ep_Q2_002_coefficient_12_0109
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0110 : Poly :=
[
  term ((2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (15, 1)]
]

/-- Partial product 110 for generator 12. -/
def ep_Q2_002_partial_12_0110 : Poly :=
[
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (3, 1), (15, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (15, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 12. -/
theorem ep_Q2_002_partial_12_0110_valid :
    mulPoly ep_Q2_002_coefficient_12_0110
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0111 : Poly :=
[
  term ((-6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (4, 1)]
]

/-- Partial product 111 for generator 12. -/
def ep_Q2_002_partial_12_0111 : Poly :=
[
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (5, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 12. -/
theorem ep_Q2_002_partial_12_0111_valid :
    mulPoly ep_Q2_002_coefficient_12_0111
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0112 : Poly :=
[
  term ((-1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1)]
]

/-- Partial product 112 for generator 12. -/
def ep_Q2_002_partial_12_0112 : Poly :=
[
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (6, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (6, 1)],
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (6, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 12. -/
theorem ep_Q2_002_partial_12_0112_valid :
    mulPoly ep_Q2_002_coefficient_12_0112
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0113 : Poly :=
[
  term ((13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (15, 1)]
]

/-- Partial product 113 for generator 12. -/
def ep_Q2_002_partial_12_0113 : Poly :=
[
  term ((27595840003323798883906391414784 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (7, 1), (15, 1)],
  term ((27595840003323798883906391414784 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 12. -/
theorem ep_Q2_002_partial_12_0113_valid :
    mulPoly ep_Q2_002_coefficient_12_0113
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0114 : Poly :=
[
  term ((-1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1)]
]

/-- Partial product 114 for generator 12. -/
def ep_Q2_002_partial_12_0114 : Poly :=
[
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (8, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (8, 1)],
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (8, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 12. -/
theorem ep_Q2_002_partial_12_0114_valid :
    mulPoly ep_Q2_002_coefficient_12_0114
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0115 : Poly :=
[
  term ((-7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1)]
]

/-- Partial product 115 for generator 12. -/
def ep_Q2_002_partial_12_0115 : Poly :=
[
  term ((-14764142201124254450439772552704 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (12, 1)],
  term ((7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (12, 1)],
  term ((-14764142201124254450439772552704 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (12, 1)],
  term ((7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 12. -/
theorem ep_Q2_002_partial_12_0115_valid :
    mulPoly ep_Q2_002_coefficient_12_0115
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0116 : Poly :=
[
  term ((-4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (15, 2)]
]

/-- Partial product 116 for generator 12. -/
def ep_Q2_002_partial_12_0116 : Poly :=
[
  term ((-9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (15, 2)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (15, 2)],
  term ((-9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (15, 2)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 12. -/
theorem ep_Q2_002_partial_12_0116_valid :
    mulPoly ep_Q2_002_coefficient_12_0116
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0117 : Poly :=
[
  term ((68975106767233259681789283691332 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 117 for generator 12. -/
def ep_Q2_002_partial_12_0117 : Poly :=
[
  term ((137950213534466519363578567382664 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((-68975106767233259681789283691332 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((137950213534466519363578567382664 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (11, 1)],
  term ((-68975106767233259681789283691332 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 12. -/
theorem ep_Q2_002_partial_12_0117_valid :
    mulPoly ep_Q2_002_coefficient_12_0117
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0118 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1)]
]

/-- Partial product 118 for generator 12. -/
def ep_Q2_002_partial_12_0118 : Poly :=
[
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1), (12, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 12. -/
theorem ep_Q2_002_partial_12_0118_valid :
    mulPoly ep_Q2_002_coefficient_12_0118
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0119 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 1)]
]

/-- Partial product 119 for generator 12. -/
def ep_Q2_002_partial_12_0119 : Poly :=
[
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (12, 1), (13, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 12. -/
theorem ep_Q2_002_partial_12_0119_valid :
    mulPoly ep_Q2_002_coefficient_12_0119
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0120 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (15, 1)]
]

/-- Partial product 120 for generator 12. -/
def ep_Q2_002_partial_12_0120 : Poly :=
[
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 2), (12, 1), (15, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (4, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 12. -/
theorem ep_Q2_002_partial_12_0120_valid :
    mulPoly ep_Q2_002_coefficient_12_0120
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0121 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 12. -/
def ep_Q2_002_partial_12_0121 : Poly :=
[
  term ((150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(2, 2), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 3), (4, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 12. -/
theorem ep_Q2_002_partial_12_0121_valid :
    mulPoly ep_Q2_002_coefficient_12_0121
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0122 : Poly :=
[
  term ((-129893043135206985584403072758544 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 122 for generator 12. -/
def ep_Q2_002_partial_12_0122 : Poly :=
[
  term ((-259786086270413971168806145517088 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (13, 1)],
  term ((129893043135206985584403072758544 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (13, 1)],
  term ((-259786086270413971168806145517088 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((129893043135206985584403072758544 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 12. -/
theorem ep_Q2_002_partial_12_0122_valid :
    mulPoly ep_Q2_002_coefficient_12_0122
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0123 : Poly :=
[
  term ((-280387120039665934733755738045746155765010 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 123 for generator 12. -/
def ep_Q2_002_partial_12_0123 : Poly :=
[
  term ((-560774240079331869467511476091492311530020 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((280387120039665934733755738045746155765010 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-560774240079331869467511476091492311530020 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((280387120039665934733755738045746155765010 : Rat) / 269363643504064505317229453910785233499) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 12. -/
theorem ep_Q2_002_partial_12_0123_valid :
    mulPoly ep_Q2_002_coefficient_12_0123
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0124 : Poly :=
[
  term ((-98392276765 : Rat) / 8881580694) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 12. -/
def ep_Q2_002_partial_12_0124 : Poly :=
[
  term ((-98392276765 : Rat) / 4440790347) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((98392276765 : Rat) / 8881580694) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-98392276765 : Rat) / 4440790347) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((98392276765 : Rat) / 8881580694) [(3, 3), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 12. -/
theorem ep_Q2_002_partial_12_0124_valid :
    mulPoly ep_Q2_002_coefficient_12_0124
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0125 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (11, 1)]
]

/-- Partial product 125 for generator 12. -/
def ep_Q2_002_partial_12_0125 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 2), (7, 1), (11, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 12. -/
theorem ep_Q2_002_partial_12_0125_valid :
    mulPoly ep_Q2_002_coefficient_12_0125
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0126 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 1), (7, 1), (13, 1)]
]

/-- Partial product 126 for generator 12. -/
def ep_Q2_002_partial_12_0126 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 2), (7, 1), (13, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 12. -/
theorem ep_Q2_002_partial_12_0126_valid :
    mulPoly ep_Q2_002_coefficient_12_0126
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0127 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 127 for generator 12. -/
def ep_Q2_002_partial_12_0127 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 2), (7, 1), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 3), (5, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 12. -/
theorem ep_Q2_002_partial_12_0127_valid :
    mulPoly ep_Q2_002_coefficient_12_0127
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0128 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 12. -/
def ep_Q2_002_partial_12_0128 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((381790635174 : Rat) / 7401317245) [(3, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 12. -/
theorem ep_Q2_002_partial_12_0128_valid :
    mulPoly ep_Q2_002_coefficient_12_0128
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0129 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 129 for generator 12. -/
def ep_Q2_002_partial_12_0129 : Poly :=
[
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 2), (11, 1), (15, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 3), (5, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 12. -/
theorem ep_Q2_002_partial_12_0129_valid :
    mulPoly ep_Q2_002_coefficient_12_0129
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0130 : Poly :=
[
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 1), (15, 1)]
]

/-- Partial product 130 for generator 12. -/
def ep_Q2_002_partial_12_0130 : Poly :=
[
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 2), (13, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 3), (5, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 12. -/
theorem ep_Q2_002_partial_12_0130_valid :
    mulPoly ep_Q2_002_coefficient_12_0130
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0131 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 131 for generator 12. -/
def ep_Q2_002_partial_12_0131 : Poly :=
[
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (4, 1), (5, 1), (15, 2)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 2), (15, 2)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 3), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 12. -/
theorem ep_Q2_002_partial_12_0131_valid :
    mulPoly ep_Q2_002_coefficient_12_0131
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0132 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 132 for generator 12. -/
def ep_Q2_002_partial_12_0132 : Poly :=
[
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((7782778567 : Rat) / 4440790347) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-15565557134 : Rat) / 4440790347) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((7782778567 : Rat) / 4440790347) [(3, 3), (5, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 12. -/
theorem ep_Q2_002_partial_12_0132_valid :
    mulPoly ep_Q2_002_coefficient_12_0132
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0133 : Poly :=
[
  term ((-356630455128457974240 : Rat) / 253528477699481291099) [(3, 1), (7, 1)]
]

/-- Partial product 133 for generator 12. -/
def ep_Q2_002_partial_12_0133 : Poly :=
[
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (4, 1), (7, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(2, 2), (3, 1), (7, 1)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(3, 2), (5, 1), (7, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 12. -/
theorem ep_Q2_002_partial_12_0133_valid :
    mulPoly ep_Q2_002_coefficient_12_0133
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0134 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 134 for generator 12. -/
def ep_Q2_002_partial_12_0134 : Poly :=
[
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (11, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 12. -/
theorem ep_Q2_002_partial_12_0134_valid :
    mulPoly ep_Q2_002_coefficient_12_0134
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0135 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 135 for generator 12. -/
def ep_Q2_002_partial_12_0135 : Poly :=
[
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 12. -/
theorem ep_Q2_002_partial_12_0135_valid :
    mulPoly ep_Q2_002_coefficient_12_0135
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0136 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 136 for generator 12. -/
def ep_Q2_002_partial_12_0136 : Poly :=
[
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 12. -/
theorem ep_Q2_002_partial_12_0136_valid :
    mulPoly ep_Q2_002_coefficient_12_0136
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0137 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 12. -/
def ep_Q2_002_partial_12_0137 : Poly :=
[
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((195028145136 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 12. -/
theorem ep_Q2_002_partial_12_0137_valid :
    mulPoly ep_Q2_002_coefficient_12_0137
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0138 : Poly :=
[
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 138 for generator 12. -/
def ep_Q2_002_partial_12_0138 : Poly :=
[
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 12. -/
theorem ep_Q2_002_partial_12_0138_valid :
    mulPoly ep_Q2_002_coefficient_12_0138
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0139 : Poly :=
[
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 139 for generator 12. -/
def ep_Q2_002_partial_12_0139 : Poly :=
[
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 12. -/
theorem ep_Q2_002_partial_12_0139_valid :
    mulPoly ep_Q2_002_coefficient_12_0139
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0140 : Poly :=
[
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 140 for generator 12. -/
def ep_Q2_002_partial_12_0140 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 1), (15, 2)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 12. -/
theorem ep_Q2_002_partial_12_0140_valid :
    mulPoly ep_Q2_002_coefficient_12_0140
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0141 : Poly :=
[
  term ((-88171245013 : Rat) / 22203951735) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 141 for generator 12. -/
def ep_Q2_002_partial_12_0141 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-176342490026 : Rat) / 22203951735) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(3, 3), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 12. -/
theorem ep_Q2_002_partial_12_0141_valid :
    mulPoly ep_Q2_002_coefficient_12_0141
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0142 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (11, 1)]
]

/-- Partial product 142 for generator 12. -/
def ep_Q2_002_partial_12_0142 : Poly :=
[
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 2), (11, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 2), (11, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 2), (11, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 12. -/
theorem ep_Q2_002_partial_12_0142_valid :
    mulPoly ep_Q2_002_coefficient_12_0142
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0143 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 2), (13, 1)]
]

/-- Partial product 143 for generator 12. -/
def ep_Q2_002_partial_12_0143 : Poly :=
[
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 2), (13, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 2), (13, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 12. -/
theorem ep_Q2_002_partial_12_0143_valid :
    mulPoly ep_Q2_002_coefficient_12_0143
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0144 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 2), (15, 1)]
]

/-- Partial product 144 for generator 12. -/
def ep_Q2_002_partial_12_0144 : Poly :=
[
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 2), (15, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (7, 2), (15, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 12. -/
theorem ep_Q2_002_partial_12_0144_valid :
    mulPoly ep_Q2_002_coefficient_12_0144
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0145 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 12. -/
def ep_Q2_002_partial_12_0145 : Poly :=
[
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(2, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((176342490026 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 3), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 12. -/
theorem ep_Q2_002_partial_12_0145_valid :
    mulPoly ep_Q2_002_coefficient_12_0145
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0146 : Poly :=
[
  term ((14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 146 for generator 12. -/
def ep_Q2_002_partial_12_0146 : Poly :=
[
  term ((28325143136305918656698423084928 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (11, 1)],
  term ((28325143136305918656698423084928 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (11, 1)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 12. -/
theorem ep_Q2_002_partial_12_0146_valid :
    mulPoly ep_Q2_002_coefficient_12_0146
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0147 : Poly :=
[
  term ((-26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 147 for generator 12. -/
def ep_Q2_002_partial_12_0147 : Poly :=
[
  term ((-53341549026248487926225123237376 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (13, 1)],
  term ((-53341549026248487926225123237376 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 12. -/
theorem ep_Q2_002_partial_12_0147_valid :
    mulPoly ep_Q2_002_coefficient_12_0147
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0148 : Poly :=
[
  term ((-242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 148 for generator 12. -/
def ep_Q2_002_partial_12_0148 : Poly :=
[
  term ((-485851620504988298241459578694914751136608 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((-485851620504988298241459578694914751136608 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 12. -/
theorem ep_Q2_002_partial_12_0148_valid :
    mulPoly ep_Q2_002_coefficient_12_0148
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0149 : Poly :=
[
  term ((-15813044292 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 12. -/
def ep_Q2_002_partial_12_0149 : Poly :=
[
  term ((-31626088584 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((15813044292 : Rat) / 7401317245) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-31626088584 : Rat) / 7401317245) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((15813044292 : Rat) / 7401317245) [(3, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 12. -/
theorem ep_Q2_002_partial_12_0149_valid :
    mulPoly ep_Q2_002_coefficient_12_0149
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0150 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 150 for generator 12. -/
def ep_Q2_002_partial_12_0150 : Poly :=
[
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 3), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 12. -/
theorem ep_Q2_002_partial_12_0150_valid :
    mulPoly ep_Q2_002_coefficient_12_0150
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0151 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 151 for generator 12. -/
def ep_Q2_002_partial_12_0151 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 3), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 12. -/
theorem ep_Q2_002_partial_12_0151_valid :
    mulPoly ep_Q2_002_coefficient_12_0151
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0152 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 152 for generator 12. -/
def ep_Q2_002_partial_12_0152 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 12. -/
theorem ep_Q2_002_partial_12_0152_valid :
    mulPoly ep_Q2_002_coefficient_12_0152
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0153 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 153 for generator 12. -/
def ep_Q2_002_partial_12_0153 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((32504690856 : Rat) / 7401317245) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-65009381712 : Rat) / 7401317245) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((32504690856 : Rat) / 7401317245) [(3, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 12. -/
theorem ep_Q2_002_partial_12_0153_valid :
    mulPoly ep_Q2_002_coefficient_12_0153
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0154 : Poly :=
[
  term ((3182383316524602604011630325146 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1)]
]

/-- Partial product 154 for generator 12. -/
def ep_Q2_002_partial_12_0154 : Poly :=
[
  term ((6364766633049205208023260650292 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-3182383316524602604011630325146 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1)],
  term ((6364766633049205208023260650292 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1)],
  term ((-3182383316524602604011630325146 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 12. -/
theorem ep_Q2_002_partial_12_0154_valid :
    mulPoly ep_Q2_002_coefficient_12_0154
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0155 : Poly :=
[
  term ((2614881905480407996496227205160 : Rat) / 97983883872014706756151952089) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 155 for generator 12. -/
def ep_Q2_002_partial_12_0155 : Poly :=
[
  term ((5229763810960815992992454410320 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-2614881905480407996496227205160 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((5229763810960815992992454410320 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-2614881905480407996496227205160 : Rat) / 97983883872014706756151952089) [(3, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 12. -/
theorem ep_Q2_002_partial_12_0155_valid :
    mulPoly ep_Q2_002_coefficient_12_0155
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0156 : Poly :=
[
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 156 for generator 12. -/
def ep_Q2_002_partial_12_0156 : Poly :=
[
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1), (15, 2)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 12. -/
theorem ep_Q2_002_partial_12_0156_valid :
    mulPoly ep_Q2_002_coefficient_12_0156
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0157 : Poly :=
[
  term ((-4924312321664901499440569154720 : Rat) / 97983883872014706756151952089) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 157 for generator 12. -/
def ep_Q2_002_partial_12_0157 : Poly :=
[
  term ((-9848624643329802998881138309440 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((4924312321664901499440569154720 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((-9848624643329802998881138309440 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((4924312321664901499440569154720 : Rat) / 97983883872014706756151952089) [(3, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 12. -/
theorem ep_Q2_002_partial_12_0157_valid :
    mulPoly ep_Q2_002_coefficient_12_0157
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0158 : Poly :=
[
  term ((754415337143471495291306831166576597890964 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 158 for generator 12. -/
def ep_Q2_002_partial_12_0158 : Poly :=
[
  term ((1508830674286942990582613662333153195781928 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-754415337143471495291306831166576597890964 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((1508830674286942990582613662333153195781928 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-754415337143471495291306831166576597890964 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 12. -/
theorem ep_Q2_002_partial_12_0158_valid :
    mulPoly ep_Q2_002_coefficient_12_0158
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0159 : Poly :=
[
  term ((-254535079 : Rat) / 1057331035) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 159 for generator 12. -/
def ep_Q2_002_partial_12_0159 : Poly :=
[
  term ((-509070158 : Rat) / 1057331035) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((254535079 : Rat) / 1057331035) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-509070158 : Rat) / 1057331035) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((254535079 : Rat) / 1057331035) [(3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 12. -/
theorem ep_Q2_002_partial_12_0159_valid :
    mulPoly ep_Q2_002_coefficient_12_0159
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0160 : Poly :=
[
  term ((-5993023755672751273292387331432 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1)]
]

/-- Partial product 160 for generator 12. -/
def ep_Q2_002_partial_12_0160 : Poly :=
[
  term ((-11986047511345502546584774662864 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((5993023755672751273292387331432 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (13, 1)],
  term ((-11986047511345502546584774662864 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1)],
  term ((5993023755672751273292387331432 : Rat) / 1273790490336191187829975377157) [(3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 12. -/
theorem ep_Q2_002_partial_12_0160_valid :
    mulPoly ep_Q2_002_coefficient_12_0160
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0161 : Poly :=
[
  term ((28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 161 for generator 12. -/
def ep_Q2_002_partial_12_0161 : Poly :=
[
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 12. -/
theorem ep_Q2_002_partial_12_0161_valid :
    mulPoly ep_Q2_002_coefficient_12_0161
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0162 : Poly :=
[
  term ((1280211924632323511415011774140588048287907 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 1)]
]

/-- Partial product 162 for generator 12. -/
def ep_Q2_002_partial_12_0162 : Poly :=
[
  term ((2560423849264647022830023548281176096575814 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-1280211924632323511415011774140588048287907 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (15, 1)],
  term ((2560423849264647022830023548281176096575814 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 1)],
  term ((-1280211924632323511415011774140588048287907 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 12. -/
theorem ep_Q2_002_partial_12_0162_valid :
    mulPoly ep_Q2_002_coefficient_12_0162
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0163 : Poly :=
[
  term ((137584695229 : Rat) / 29605268980) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 12. -/
def ep_Q2_002_partial_12_0163 : Poly :=
[
  term ((137584695229 : Rat) / 14802634490) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-137584695229 : Rat) / 29605268980) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((137584695229 : Rat) / 14802634490) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-137584695229 : Rat) / 29605268980) [(3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 12. -/
theorem ep_Q2_002_partial_12_0163_valid :
    mulPoly ep_Q2_002_coefficient_12_0163
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0164 : Poly :=
[
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 3)]
]

/-- Partial product 164 for generator 12. -/
def ep_Q2_002_partial_12_0164 : Poly :=
[
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 3)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (15, 3)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 3)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 12. -/
theorem ep_Q2_002_partial_12_0164_valid :
    mulPoly ep_Q2_002_coefficient_12_0164
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0165 : Poly :=
[
  term ((158475703364 : Rat) / 22203951735) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 165 for generator 12. -/
def ep_Q2_002_partial_12_0165 : Poly :=
[
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-158475703364 : Rat) / 22203951735) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((316951406728 : Rat) / 22203951735) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 12. -/
theorem ep_Q2_002_partial_12_0165_valid :
    mulPoly ep_Q2_002_coefficient_12_0165
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0166 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 166 for generator 12. -/
def ep_Q2_002_partial_12_0166 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 2), (4, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 12. -/
theorem ep_Q2_002_partial_12_0166_valid :
    mulPoly ep_Q2_002_coefficient_12_0166
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0167 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 167 for generator 12. -/
def ep_Q2_002_partial_12_0167 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (5, 1), (13, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 2), (13, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 2), (4, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 12. -/
theorem ep_Q2_002_partial_12_0167_valid :
    mulPoly ep_Q2_002_coefficient_12_0167
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0168 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 168 for generator 12. -/
def ep_Q2_002_partial_12_0168 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 12. -/
theorem ep_Q2_002_partial_12_0168_valid :
    mulPoly ep_Q2_002_coefficient_12_0168
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0169 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 12. -/
def ep_Q2_002_partial_12_0169 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((381790635174 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 12. -/
theorem ep_Q2_002_partial_12_0169_valid :
    mulPoly ep_Q2_002_coefficient_12_0169
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0170 : Poly :=
[
  term ((-249307682408157608037896352320628 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 170 for generator 12. -/
def ep_Q2_002_partial_12_0170 : Poly :=
[
  term ((-498615364816315216075792704641256 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((249307682408157608037896352320628 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((-498615364816315216075792704641256 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((249307682408157608037896352320628 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 12. -/
theorem ep_Q2_002_partial_12_0170_valid :
    mulPoly ep_Q2_002_coefficient_12_0170
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0171 : Poly :=
[
  term ((469493054273386887219201811021776 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 171 for generator 12. -/
def ep_Q2_002_partial_12_0171 : Poly :=
[
  term ((938986108546773774438403622043552 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((-469493054273386887219201811021776 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((938986108546773774438403622043552 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((-469493054273386887219201811021776 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 12. -/
theorem ep_Q2_002_partial_12_0171_valid :
    mulPoly ep_Q2_002_coefficient_12_0171
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0172 : Poly :=
[
  term ((875670756771529110201145172702220135018798 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 172 for generator 12. -/
def ep_Q2_002_partial_12_0172 : Poly :=
[
  term ((1751341513543058220402290345404440270037596 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((-875670756771529110201145172702220135018798 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((1751341513543058220402290345404440270037596 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-875670756771529110201145172702220135018798 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 12. -/
theorem ep_Q2_002_partial_12_0172_valid :
    mulPoly ep_Q2_002_coefficient_12_0172
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0173 : Poly :=
[
  term ((367237807613 : Rat) / 14802634490) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 12. -/
def ep_Q2_002_partial_12_0173 : Poly :=
[
  term ((367237807613 : Rat) / 7401317245) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-367237807613 : Rat) / 14802634490) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((367237807613 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-367237807613 : Rat) / 14802634490) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 12. -/
theorem ep_Q2_002_partial_12_0173_valid :
    mulPoly ep_Q2_002_coefficient_12_0173
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0174 : Poly :=
[
  term ((-4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 174 for generator 12. -/
def ep_Q2_002_partial_12_0174 : Poly :=
[
  term ((-9532982489528714641716547620000 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 2), (9, 1), (11, 1)],
  term ((4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(2, 2), (4, 1), (9, 1), (11, 1)],
  term ((-9532982489528714641716547620000 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1)],
  term ((4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(3, 2), (4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 12. -/
theorem ep_Q2_002_partial_12_0174_valid :
    mulPoly ep_Q2_002_coefficient_12_0174
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0175 : Poly :=
[
  term ((8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 175 for generator 12. -/
def ep_Q2_002_partial_12_0175 : Poly :=
[
  term ((17952391286587577275165841040000 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((-8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((17952391286587577275165841040000 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((-8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(3, 2), (4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 12. -/
theorem ep_Q2_002_partial_12_0175_valid :
    mulPoly ep_Q2_002_coefficient_12_0175
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0176 : Poly :=
[
  term ((71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 176 for generator 12. -/
def ep_Q2_002_partial_12_0176 : Poly :=
[
  term ((143080304186968136566776420717611394434016 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((-71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((143080304186968136566776420717611394434016 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((-71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 12. -/
theorem ep_Q2_002_partial_12_0176_valid :
    mulPoly ep_Q2_002_coefficient_12_0176
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0177 : Poly :=
[
  term ((10062159336 : Rat) / 1480263449) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 177 for generator 12. -/
def ep_Q2_002_partial_12_0177 : Poly :=
[
  term ((20124318672 : Rat) / 1480263449) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10062159336 : Rat) / 1480263449) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((20124318672 : Rat) / 1480263449) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10062159336 : Rat) / 1480263449) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 12. -/
theorem ep_Q2_002_partial_12_0177_valid :
    mulPoly ep_Q2_002_coefficient_12_0177
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0178 : Poly :=
[
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 178 for generator 12. -/
def ep_Q2_002_partial_12_0178 : Poly :=
[
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 12. -/
theorem ep_Q2_002_partial_12_0178_valid :
    mulPoly ep_Q2_002_coefficient_12_0178
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0179 : Poly :=
[
  term ((-8798067870170935266051187307688 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 179 for generator 12. -/
def ep_Q2_002_partial_12_0179 : Poly :=
[
  term ((-17596135740341870532102374615376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((8798067870170935266051187307688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-17596135740341870532102374615376 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1)],
  term ((8798067870170935266051187307688 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 12. -/
theorem ep_Q2_002_partial_12_0179_valid :
    mulPoly ep_Q2_002_coefficient_12_0179
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0180 : Poly :=
[
  term ((24909688650647176295279299728870776973516 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 180 for generator 12. -/
def ep_Q2_002_partial_12_0180 : Poly :=
[
  term ((49819377301294352590558599457741553947032 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((-24909688650647176295279299728870776973516 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((49819377301294352590558599457741553947032 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((-24909688650647176295279299728870776973516 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 12. -/
theorem ep_Q2_002_partial_12_0180_valid :
    mulPoly ep_Q2_002_coefficient_12_0180
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0181 : Poly :=
[
  term ((7555141124 : Rat) / 1480263449) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 181 for generator 12. -/
def ep_Q2_002_partial_12_0181 : Poly :=
[
  term ((15110282248 : Rat) / 1480263449) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((15110282248 : Rat) / 1480263449) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 12. -/
theorem ep_Q2_002_partial_12_0181_valid :
    mulPoly ep_Q2_002_coefficient_12_0181
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0182 : Poly :=
[
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2)]
]

/-- Partial product 182 for generator 12. -/
def ep_Q2_002_partial_12_0182 : Poly :=
[
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 2)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 2)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 2)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 12. -/
theorem ep_Q2_002_partial_12_0182_valid :
    mulPoly ep_Q2_002_coefficient_12_0182
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0183 : Poly :=
[
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 183 for generator 12. -/
def ep_Q2_002_partial_12_0183 : Poly :=
[
  term ((-584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (12, 1), (13, 1), (15, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 12. -/
theorem ep_Q2_002_partial_12_0183_valid :
    mulPoly ep_Q2_002_coefficient_12_0183
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0184 : Poly :=
[
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 184 for generator 12. -/
def ep_Q2_002_partial_12_0184 : Poly :=
[
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (12, 1), (15, 2)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (12, 1), (15, 2)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 12. -/
theorem ep_Q2_002_partial_12_0184_valid :
    mulPoly ep_Q2_002_coefficient_12_0184
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0185 : Poly :=
[
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 185 for generator 12. -/
def ep_Q2_002_partial_12_0185 : Poly :=
[
  term ((-300100471816 : Rat) / 7401317245) [(2, 1), (4, 2), (12, 1), (15, 2), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-300100471816 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 12. -/
theorem ep_Q2_002_partial_12_0185_valid :
    mulPoly ep_Q2_002_coefficient_12_0185
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0186 : Poly :=
[
  term ((1835772210911047325330090009066059127579148 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 186 for generator 12. -/
def ep_Q2_002_partial_12_0186 : Poly :=
[
  term ((3671544421822094650660180018132118255158296 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((-1835772210911047325330090009066059127579148 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((3671544421822094650660180018132118255158296 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((-1835772210911047325330090009066059127579148 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 12. -/
theorem ep_Q2_002_partial_12_0186_valid :
    mulPoly ep_Q2_002_coefficient_12_0186
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0187 : Poly :=
[
  term ((93575724189 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 12. -/
def ep_Q2_002_partial_12_0187 : Poly :=
[
  term ((187151448378 : Rat) / 7401317245) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-93575724189 : Rat) / 7401317245) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((187151448378 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-93575724189 : Rat) / 7401317245) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 12. -/
theorem ep_Q2_002_partial_12_0187_valid :
    mulPoly ep_Q2_002_coefficient_12_0187
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0188 : Poly :=
[
  term ((167213155523536847365913978679456 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 188 for generator 12. -/
def ep_Q2_002_partial_12_0188 : Poly :=
[
  term ((334426311047073694731827957358912 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (13, 2)],
  term ((-167213155523536847365913978679456 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (13, 2)],
  term ((334426311047073694731827957358912 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 2)],
  term ((-167213155523536847365913978679456 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 12. -/
theorem ep_Q2_002_partial_12_0188_valid :
    mulPoly ep_Q2_002_coefficient_12_0188
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0189 : Poly :=
[
  term ((2185165880008690905848838290527650258599634 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 2)]
]

/-- Partial product 189 for generator 12. -/
def ep_Q2_002_partial_12_0189 : Poly :=
[
  term ((4370331760017381811697676581055300517199268 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (15, 2)],
  term ((-2185165880008690905848838290527650258599634 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (15, 2)],
  term ((4370331760017381811697676581055300517199268 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((-2185165880008690905848838290527650258599634 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 12. -/
theorem ep_Q2_002_partial_12_0189_valid :
    mulPoly ep_Q2_002_coefficient_12_0189
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0190 : Poly :=
[
  term ((1311538230337 : Rat) / 44407903470) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 190 for generator 12. -/
def ep_Q2_002_partial_12_0190 : Poly :=
[
  term ((1311538230337 : Rat) / 22203951735) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-1311538230337 : Rat) / 44407903470) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((1311538230337 : Rat) / 22203951735) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-1311538230337 : Rat) / 44407903470) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 12. -/
theorem ep_Q2_002_partial_12_0190_valid :
    mulPoly ep_Q2_002_coefficient_12_0190
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0191 : Poly :=
[
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 191 for generator 12. -/
def ep_Q2_002_partial_12_0191 : Poly :=
[
  term ((33162853602572616672085597726752 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((33162853602572616672085597726752 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (7, 1), (11, 1), (15, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 12. -/
theorem ep_Q2_002_partial_12_0191_valid :
    mulPoly ep_Q2_002_coefficient_12_0191
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0192 : Poly :=
[
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 192 for generator 12. -/
def ep_Q2_002_partial_12_0192 : Poly :=
[
  term ((-62451863800983100189204984877184 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-62451863800983100189204984877184 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 12. -/
theorem ep_Q2_002_partial_12_0192_valid :
    mulPoly ep_Q2_002_coefficient_12_0192
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0193 : Poly :=
[
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (7, 1), (15, 2)]
]

/-- Partial product 193 for generator 12. -/
def ep_Q2_002_partial_12_0193 : Poly :=
[
  term ((-1798864918700863612923282373934692107147696 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((-1798864918700863612923282373934692107147696 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 2), (7, 1), (15, 2)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 12. -/
theorem ep_Q2_002_partial_12_0193_valid :
    mulPoly ep_Q2_002_coefficient_12_0193
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0194 : Poly :=
[
  term ((-381790635174 : Rat) / 7401317245) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 194 for generator 12. -/
def ep_Q2_002_partial_12_0194 : Poly :=
[
  term ((-763581270348 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-763581270348 : Rat) / 7401317245) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((381790635174 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 12. -/
theorem ep_Q2_002_partial_12_0194_valid :
    mulPoly ep_Q2_002_coefficient_12_0194
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0195 : Poly :=
[
  term ((26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 195 for generator 12. -/
def ep_Q2_002_partial_12_0195 : Poly :=
[
  term ((52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1)],
  term ((-26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (11, 1)],
  term ((52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (11, 1)],
  term ((-26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 12. -/
theorem ep_Q2_002_partial_12_0195_valid :
    mulPoly ep_Q2_002_coefficient_12_0195
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0196 : Poly :=
[
  term ((-49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 196 for generator 12. -/
def ep_Q2_002_partial_12_0196 : Poly :=
[
  term ((-99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((-99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (13, 1)],
  term ((49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 12. -/
theorem ep_Q2_002_partial_12_0196_valid :
    mulPoly ep_Q2_002_coefficient_12_0196
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0197 : Poly :=
[
  term ((-368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 197 for generator 12. -/
def ep_Q2_002_partial_12_0197 : Poly :=
[
  term ((-737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((-737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (8, 1), (15, 1)],
  term ((368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 12. -/
theorem ep_Q2_002_partial_12_0197_valid :
    mulPoly ep_Q2_002_coefficient_12_0197
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0198 : Poly :=
[
  term ((-27821842066 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 12. -/
def ep_Q2_002_partial_12_0198 : Poly :=
[
  term ((-55643684132 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((27821842066 : Rat) / 7401317245) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-55643684132 : Rat) / 7401317245) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((27821842066 : Rat) / 7401317245) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 12. -/
theorem ep_Q2_002_partial_12_0198_valid :
    mulPoly ep_Q2_002_coefficient_12_0198
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 12. -/
def ep_Q2_002_coefficient_12_0199 : Poly :=
[
  term ((2631033371861246106934549024158 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1)]
]

/-- Partial product 199 for generator 12. -/
def ep_Q2_002_partial_12_0199 : Poly :=
[
  term ((5262066743722492213869098048316 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-2631033371861246106934549024158 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (11, 1)],
  term ((5262066743722492213869098048316 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 2), (11, 1)],
  term ((-2631033371861246106934549024158 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 12. -/
theorem ep_Q2_002_partial_12_0199_valid :
    mulPoly ep_Q2_002_coefficient_12_0199
        ep_Q2_002_generator_12_0100_0199 =
      ep_Q2_002_partial_12_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_12_0100_0199 : List Poly :=
[
  ep_Q2_002_partial_12_0100,
  ep_Q2_002_partial_12_0101,
  ep_Q2_002_partial_12_0102,
  ep_Q2_002_partial_12_0103,
  ep_Q2_002_partial_12_0104,
  ep_Q2_002_partial_12_0105,
  ep_Q2_002_partial_12_0106,
  ep_Q2_002_partial_12_0107,
  ep_Q2_002_partial_12_0108,
  ep_Q2_002_partial_12_0109,
  ep_Q2_002_partial_12_0110,
  ep_Q2_002_partial_12_0111,
  ep_Q2_002_partial_12_0112,
  ep_Q2_002_partial_12_0113,
  ep_Q2_002_partial_12_0114,
  ep_Q2_002_partial_12_0115,
  ep_Q2_002_partial_12_0116,
  ep_Q2_002_partial_12_0117,
  ep_Q2_002_partial_12_0118,
  ep_Q2_002_partial_12_0119,
  ep_Q2_002_partial_12_0120,
  ep_Q2_002_partial_12_0121,
  ep_Q2_002_partial_12_0122,
  ep_Q2_002_partial_12_0123,
  ep_Q2_002_partial_12_0124,
  ep_Q2_002_partial_12_0125,
  ep_Q2_002_partial_12_0126,
  ep_Q2_002_partial_12_0127,
  ep_Q2_002_partial_12_0128,
  ep_Q2_002_partial_12_0129,
  ep_Q2_002_partial_12_0130,
  ep_Q2_002_partial_12_0131,
  ep_Q2_002_partial_12_0132,
  ep_Q2_002_partial_12_0133,
  ep_Q2_002_partial_12_0134,
  ep_Q2_002_partial_12_0135,
  ep_Q2_002_partial_12_0136,
  ep_Q2_002_partial_12_0137,
  ep_Q2_002_partial_12_0138,
  ep_Q2_002_partial_12_0139,
  ep_Q2_002_partial_12_0140,
  ep_Q2_002_partial_12_0141,
  ep_Q2_002_partial_12_0142,
  ep_Q2_002_partial_12_0143,
  ep_Q2_002_partial_12_0144,
  ep_Q2_002_partial_12_0145,
  ep_Q2_002_partial_12_0146,
  ep_Q2_002_partial_12_0147,
  ep_Q2_002_partial_12_0148,
  ep_Q2_002_partial_12_0149,
  ep_Q2_002_partial_12_0150,
  ep_Q2_002_partial_12_0151,
  ep_Q2_002_partial_12_0152,
  ep_Q2_002_partial_12_0153,
  ep_Q2_002_partial_12_0154,
  ep_Q2_002_partial_12_0155,
  ep_Q2_002_partial_12_0156,
  ep_Q2_002_partial_12_0157,
  ep_Q2_002_partial_12_0158,
  ep_Q2_002_partial_12_0159,
  ep_Q2_002_partial_12_0160,
  ep_Q2_002_partial_12_0161,
  ep_Q2_002_partial_12_0162,
  ep_Q2_002_partial_12_0163,
  ep_Q2_002_partial_12_0164,
  ep_Q2_002_partial_12_0165,
  ep_Q2_002_partial_12_0166,
  ep_Q2_002_partial_12_0167,
  ep_Q2_002_partial_12_0168,
  ep_Q2_002_partial_12_0169,
  ep_Q2_002_partial_12_0170,
  ep_Q2_002_partial_12_0171,
  ep_Q2_002_partial_12_0172,
  ep_Q2_002_partial_12_0173,
  ep_Q2_002_partial_12_0174,
  ep_Q2_002_partial_12_0175,
  ep_Q2_002_partial_12_0176,
  ep_Q2_002_partial_12_0177,
  ep_Q2_002_partial_12_0178,
  ep_Q2_002_partial_12_0179,
  ep_Q2_002_partial_12_0180,
  ep_Q2_002_partial_12_0181,
  ep_Q2_002_partial_12_0182,
  ep_Q2_002_partial_12_0183,
  ep_Q2_002_partial_12_0184,
  ep_Q2_002_partial_12_0185,
  ep_Q2_002_partial_12_0186,
  ep_Q2_002_partial_12_0187,
  ep_Q2_002_partial_12_0188,
  ep_Q2_002_partial_12_0189,
  ep_Q2_002_partial_12_0190,
  ep_Q2_002_partial_12_0191,
  ep_Q2_002_partial_12_0192,
  ep_Q2_002_partial_12_0193,
  ep_Q2_002_partial_12_0194,
  ep_Q2_002_partial_12_0195,
  ep_Q2_002_partial_12_0196,
  ep_Q2_002_partial_12_0197,
  ep_Q2_002_partial_12_0198,
  ep_Q2_002_partial_12_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_12_0100_0199 : Poly :=
[
  term ((-1938034164848617644628278280317832659354336 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-187122506448 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((416802090294789546389321611161552 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-17752015743631584637682074955520 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 1), (4, 1), (13, 1), (15, 2)],
  term ((1615548787645793426358377398314392764712592 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((22039244008 : Rat) / 1057331035) [(1, 1), (2, 1), (4, 1), (15, 1), (16, 1)],
  term ((-745809674377051221998173723204418943823232 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 1), (4, 1), (15, 3)],
  term ((-101973551136 : Rat) / 7401317245) [(1, 1), (2, 1), (4, 1), (15, 3), (16, 1)],
  term ((969017082424308822314139140158916329677168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((93561253224 : Rat) / 7401317245) [(1, 1), (2, 2), (12, 1), (15, 1), (16, 1)],
  term ((-208401045147394773194660805580776 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (13, 1)],
  term ((8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (13, 1), (15, 2)],
  term ((-807774393822896713179188699157196382356296 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 1)],
  term ((-11019622004 : Rat) / 1057331035) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (15, 3)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (2, 2), (15, 3), (16, 1)],
  term ((-1938034164848617644628278280317832659354336 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-187122506448 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((416802090294789546389321611161552 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-17752015743631584637682074955520 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((1615548787645793426358377398314392764712592 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((22039244008 : Rat) / 1057331035) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-745809674377051221998173723204418943823232 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-101973551136 : Rat) / 7401317245) [(1, 1), (3, 1), (5, 1), (15, 3), (16, 1)],
  term ((969017082424308822314139140158916329677168 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((93561253224 : Rat) / 7401317245) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-208401045147394773194660805580776 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (13, 1)],
  term ((8876007871815792318841037477760 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (13, 1), (15, 2)],
  term ((-807774393822896713179188699157196382356296 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (15, 1)],
  term ((-11019622004 : Rat) / 1057331035) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (15, 3)],
  term ((50986775568 : Rat) / 7401317245) [(1, 1), (3, 2), (15, 3), (16, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (4, 1), (7, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((12356304760328122478321635362816 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1)],
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (6, 1)],
  term ((27595840003323798883906391414784 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (8, 1)],
  term ((-14764142201124254450439772552704 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (12, 1)],
  term ((-9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 1), (15, 2)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 1), (4, 2)],
  term ((-6178152380164061239160817681408 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (3, 1), (7, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (3, 1), (15, 1)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (4, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (6, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (7, 1), (15, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (8, 1)],
  term ((7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (12, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (2, 2), (15, 2)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (4, 1), (5, 1)],
  term ((12356304760328122478321635362816 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1)],
  term ((-3679740337410575686854633771648 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (6, 1)],
  term ((27595840003323798883906391414784 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-2002782623691807143310283279488 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (8, 1)],
  term ((-14764142201124254450439772552704 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (12, 1)],
  term ((-9198613334441266294635463804928 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 1), (5, 1), (15, 2)],
  term ((-6178152380164061239160817681408 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (4, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (7, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (5, 1), (15, 1)],
  term ((1839870168705287843427316885824 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (6, 1)],
  term ((-13797920001661899441953195707392 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (7, 1), (15, 1)],
  term ((1001391311845903571655141639744 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (8, 1)],
  term ((7382071100562127225219886276352 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (12, 1)],
  term ((4599306667220633147317731902464 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 2), (15, 2)],
  term ((6898960000830949720976597853696 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 3), (7, 1)],
  term ((-2299653333610316573658865951232 : Rat) / 1273790490336191187829975377157) [(1, 2), (3, 3), (15, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (4, 1), (5, 1), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(2, 1), (3, 1), (4, 1), (7, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (11, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (13, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 2), (11, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (7, 2), (13, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((28325143136305918656698423084928 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (11, 1)],
  term ((-53341549026248487926225123237376 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (8, 1), (13, 1)],
  term ((-485851620504988298241459578694914751136608 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1)],
  term ((-31626088584 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((6364766633049205208023260650292 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((5229763810960815992992454410320 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-9848624643329802998881138309440 : Rat) / 97983883872014706756151952089) [(2, 1), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((1508830674286942990582613662333153195781928 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-509070158 : Rat) / 1057331035) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11986047511345502546584774662864 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 1), (13, 1), (15, 2)],
  term ((2560423849264647022830023548281176096575814 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((137584695229 : Rat) / 14802634490) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 1), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (3, 1), (4, 1), (15, 3), (16, 1)],
  term ((137950213534466519363578567382664 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (11, 1), (12, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (12, 1), (13, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (4, 2), (12, 1), (15, 1)],
  term ((150050235908 : Rat) / 7401317245) [(2, 1), (3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-259786086270413971168806145517088 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (4, 2), (13, 1)],
  term ((-560774240079331869467511476091492311530020 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((-98392276765 : Rat) / 4440790347) [(2, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((33162853602572616672085597726752 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-62451863800983100189204984877184 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1798864918700863612923282373934692107147696 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2)],
  term ((-763581270348 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1)],
  term ((-99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((-737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((-55643684132 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((5262066743722492213869098048316 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (5, 1), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 2), (5, 1), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 2), (5, 1), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-498615364816315216075792704641256 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((938986108546773774438403622043552 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (7, 1), (13, 1)],
  term ((1751341513543058220402290345404440270037596 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((367237807613 : Rat) / 7401317245) [(2, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-9532982489528714641716547620000 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 2), (9, 1), (11, 1)],
  term ((17952391286587577275165841040000 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 2), (9, 1), (13, 1)],
  term ((143080304186968136566776420717611394434016 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (9, 1), (15, 1)],
  term ((20124318672 : Rat) / 1480263449) [(2, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-17596135740341870532102374615376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 1), (13, 1)],
  term ((49819377301294352590558599457741553947032 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((15110282248 : Rat) / 1480263449) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (11, 2)],
  term ((-584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (12, 1), (15, 2)],
  term ((-300100471816 : Rat) / 7401317245) [(2, 1), (4, 2), (12, 1), (15, 2), (16, 1)],
  term ((3671544421822094650660180018132118255158296 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((187151448378 : Rat) / 7401317245) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((334426311047073694731827957358912 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (13, 2)],
  term ((4370331760017381811697676581055300517199268 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (15, 2)],
  term ((1311538230337 : Rat) / 22203951735) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-68975106767233259681789283691332 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (12, 1), (13, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(2, 2), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((129893043135206985584403072758544 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (4, 1), (13, 1)],
  term ((280387120039665934733755738045746155765010 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((98392276765 : Rat) / 8881580694) [(2, 2), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 2), (3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(2, 2), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (3, 1), (5, 1), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(2, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(2, 2), (3, 1), (7, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(2, 2), (3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (11, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 1), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(2, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 2), (11, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (7, 2), (13, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (7, 2), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(2, 2), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (11, 1)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (8, 1), (13, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (8, 1), (15, 1)],
  term ((15813044292 : Rat) / 7401317245) [(2, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (9, 1), (11, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (9, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(2, 2), (3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3182383316524602604011630325146 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1)],
  term ((-2614881905480407996496227205160 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (11, 1), (15, 2)],
  term ((4924312321664901499440569154720 : Rat) / 97983883872014706756151952089) [(2, 2), (3, 1), (12, 1), (13, 1)],
  term ((-754415337143471495291306831166576597890964 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((254535079 : Rat) / 1057331035) [(2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((5993023755672751273292387331432 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (13, 1)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(2, 2), (3, 1), (13, 1), (15, 2)],
  term ((-1280211924632323511415011774140588048287907 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (15, 1)],
  term ((-137584695229 : Rat) / 29605268980) [(2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (3, 1), (15, 3)],
  term ((-158475703364 : Rat) / 22203951735) [(2, 2), (3, 1), (15, 3), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 2), (4, 1), (5, 1), (13, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(2, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((249307682408157608037896352320628 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((-469493054273386887219201811021776 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (7, 1), (13, 1)],
  term ((-875670756771529110201145172702220135018798 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((-367237807613 : Rat) / 14802634490) [(2, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(2, 2), (4, 1), (9, 1), (11, 1)],
  term ((-8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(2, 2), (4, 1), (9, 1), (13, 1)],
  term ((-71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (4, 1), (9, 1), (15, 1)],
  term ((-10062159336 : Rat) / 1480263449) [(2, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((8798067870170935266051187307688 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((-24909688650647176295279299728870776973516 : Rat) / 269363643504064505317229453910785233499) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(2, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (11, 2)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (12, 1), (15, 2)],
  term ((150050235908 : Rat) / 7401317245) [(2, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1835772210911047325330090009066059127579148 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((-93575724189 : Rat) / 7401317245) [(2, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-167213155523536847365913978679456 : Rat) / 1273790490336191187829975377157) [(2, 2), (4, 1), (13, 2)],
  term ((-2185165880008690905848838290527650258599634 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (4, 1), (15, 2)],
  term ((-1311538230337 : Rat) / 44407903470) [(2, 2), (4, 1), (15, 2), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 2), (5, 1), (7, 1), (15, 2)],
  term ((381790635174 : Rat) / 7401317245) [(2, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (11, 1)],
  term ((49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(2, 2), (5, 1), (8, 1), (13, 1)],
  term ((368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(2, 2), (5, 1), (8, 1), (15, 1)],
  term ((27821842066 : Rat) / 7401317245) [(2, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2631033371861246106934549024158 : Rat) / 97983883872014706756151952089) [(2, 2), (5, 1), (11, 1)],
  term ((-498615364816315216075792704641256 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((938986108546773774438403622043552 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1)],
  term ((1751341513543058220402290345404440270037596 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((367237807613 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-9532982489528714641716547620000 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 1)],
  term ((17952391286587577275165841040000 : Rat) / 97983883872014706756151952089) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1)],
  term ((143080304186968136566776420717611394434016 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1)],
  term ((20124318672 : Rat) / 1480263449) [(3, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-17596135740341870532102374615376 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1)],
  term ((49819377301294352590558599457741553947032 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((15110282248 : Rat) / 1480263449) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 2)],
  term ((-584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2)],
  term ((-300100471816 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((3671544421822094650660180018132118255158296 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((187151448378 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((334426311047073694731827957358912 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 2)],
  term ((4370331760017381811697676581055300517199268 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((1311538230337 : Rat) / 22203951735) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 2), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 2), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (5, 2), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((33162853602572616672085597726752 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (7, 1), (11, 1), (15, 1)],
  term ((-62451863800983100189204984877184 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (7, 1), (13, 1), (15, 1)],
  term ((-1798864918700863612923282373934692107147696 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 2), (7, 1), (15, 2)],
  term ((-763581270348 : Rat) / 7401317245) [(3, 1), (5, 2), (7, 1), (15, 2), (16, 1)],
  term ((52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (11, 1)],
  term ((-99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (13, 1)],
  term ((-737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (8, 1), (15, 1)],
  term ((-55643684132 : Rat) / 7401317245) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((5262066743722492213869098048316 : Rat) / 97983883872014706756151952089) [(3, 1), (5, 2), (11, 1)],
  term ((229148060941541215211813961131232 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (11, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((150050235908 : Rat) / 7401317245) [(3, 2), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-431528711723117496689119853929344 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (5, 1), (13, 1)],
  term ((-7750749726824034282876583908777864852306264 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((-1064647336586 : Rat) / 22203951735) [(3, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((249307682408157608037896352320628 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (7, 1), (11, 1)],
  term ((-469493054273386887219201811021776 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (7, 1), (13, 1)],
  term ((-875670756771529110201145172702220135018798 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((-367237807613 : Rat) / 14802634490) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((4766491244764357320858273810000 : Rat) / 97983883872014706756151952089) [(3, 2), (4, 1), (9, 1), (11, 1)],
  term ((-8976195643293788637582920520000 : Rat) / 97983883872014706756151952089) [(3, 2), (4, 1), (9, 1), (13, 1)],
  term ((-71540152093484068283388210358805697217008 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (4, 1), (9, 1), (15, 1)],
  term ((-10062159336 : Rat) / 1480263449) [(3, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((8798067870170935266051187307688 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((-24909688650647176295279299728870776973516 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-7555141124 : Rat) / 1480263449) [(3, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (11, 2)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (12, 1), (15, 2)],
  term ((150050235908 : Rat) / 7401317245) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1835772210911047325330090009066059127579148 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-93575724189 : Rat) / 7401317245) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-167213155523536847365913978679456 : Rat) / 1273790490336191187829975377157) [(3, 2), (4, 1), (13, 2)],
  term ((-2185165880008690905848838290527650258599634 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (4, 1), (15, 2)],
  term ((-1311538230337 : Rat) / 44407903470) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(3, 2), (5, 1), (7, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3583835052133529611842437220480 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((6749032554414125748815188124160 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((10958936057149522109456965117612794264185184 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (7, 1), (15, 2)],
  term ((969029415496 : Rat) / 22203951735) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 2), (11, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (7, 2), (13, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (7, 2), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(3, 2), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((179364687318602550566702339040 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (8, 1), (11, 1)],
  term ((-337777296169058131016427511680 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 1), (8, 1), (13, 1)],
  term ((-10646836850412325799578052506577188017576 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 1), (8, 1), (15, 1)],
  term ((-3804246518 : Rat) / 7401317245) [(3, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (9, 1), (11, 1), (15, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (9, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-27838667201146994182125876663762 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1)],
  term ((5229763810960815992992454410320 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (11, 1), (15, 2)],
  term ((-9848624643329802998881138309440 : Rat) / 97983883872014706756151952089) [(3, 2), (5, 1), (12, 1), (13, 1)],
  term ((1508830674286942990582613662333153195781928 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((-509070158 : Rat) / 1057331035) [(3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11986047511345502546584774662864 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1)],
  term ((56805481990332207609573858088320 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 1), (13, 1), (15, 2)],
  term ((2560423849264647022830023548281176096575814 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 1)],
  term ((137584695229 : Rat) / 14802634490) [(3, 2), (5, 1), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (5, 1), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 2), (7, 1), (11, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 2), (5, 2), (7, 1), (13, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (5, 2), (7, 1), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(3, 2), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 2), (11, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 2), (5, 2), (13, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (5, 2), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(3, 2), (5, 2), (15, 2), (16, 1)],
  term ((-68975106767233259681789283691332 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (11, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (11, 1), (12, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (12, 1), (13, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (4, 1), (12, 1), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(3, 3), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((129893043135206985584403072758544 : Rat) / 1273790490336191187829975377157) [(3, 3), (4, 1), (13, 1)],
  term ((280387120039665934733755738045746155765010 : Rat) / 269363643504064505317229453910785233499) [(3, 3), (4, 1), (15, 1)],
  term ((98392276765 : Rat) / 8881580694) [(3, 3), (4, 1), (15, 1), (16, 1)],
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (7, 1), (11, 1)],
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(3, 3), (5, 1), (7, 1), (13, 1)],
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(3, 3), (5, 1), (7, 1), (15, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(3, 3), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(3, 3), (5, 1), (11, 1), (15, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(3, 3), (5, 1), (13, 1), (15, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(3, 3), (5, 1), (15, 2)],
  term ((7782778567 : Rat) / 4440790347) [(3, 3), (5, 1), (15, 2), (16, 1)],
  term ((356630455128457974240 : Rat) / 253528477699481291099) [(3, 3), (7, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (9, 1), (11, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (9, 1), (13, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 1), (9, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(3, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (11, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 1), (13, 1), (15, 1)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 1), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(3, 3), (7, 1), (15, 2), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 2), (11, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(3, 3), (7, 2), (13, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (7, 2), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(3, 3), (7, 2), (15, 1), (16, 1)],
  term ((-14162571568152959328349211542464 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (11, 1)],
  term ((26670774513124243963112561618688 : Rat) / 1273790490336191187829975377157) [(3, 3), (8, 1), (13, 1)],
  term ((242925810252494149120729789347457375568304 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (8, 1), (15, 1)],
  term ((15813044292 : Rat) / 7401317245) [(3, 3), (8, 1), (15, 1), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(3, 3), (9, 1), (11, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(3, 3), (9, 1), (13, 1), (15, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (9, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(3, 3), (9, 1), (15, 2), (16, 1)],
  term ((-3182383316524602604011630325146 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1)],
  term ((-2614881905480407996496227205160 : Rat) / 97983883872014706756151952089) [(3, 3), (11, 1), (12, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(3, 3), (11, 1), (15, 2)],
  term ((4924312321664901499440569154720 : Rat) / 97983883872014706756151952089) [(3, 3), (12, 1), (13, 1)],
  term ((-754415337143471495291306831166576597890964 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (12, 1), (15, 1)],
  term ((254535079 : Rat) / 1057331035) [(3, 3), (12, 1), (15, 1), (16, 1)],
  term ((5993023755672751273292387331432 : Rat) / 1273790490336191187829975377157) [(3, 3), (13, 1)],
  term ((-28402740995166103804786929044160 : Rat) / 1273790490336191187829975377157) [(3, 3), (13, 1), (15, 2)],
  term ((-1280211924632323511415011774140588048287907 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (15, 1)],
  term ((-137584695229 : Rat) / 29605268980) [(3, 3), (15, 1), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 3), (15, 3)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 100 through 199. -/
theorem ep_Q2_002_block_12_0100_0199_valid :
    checkProductSumEq ep_Q2_002_partials_12_0100_0199
      ep_Q2_002_block_12_0100_0199 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
