/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 10:100-164

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 10 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_10_0100_0164 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0100 : Poly :=
[
  term ((-1342836183452711756038806362812862815921824 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 100 for generator 10. -/
def ep_Q2_002_partial_10_0100 : Poly :=
[
  term ((-2685672366905423512077612725625725631843648 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((-2685672366905423512077612725625725631843648 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((1342836183452711756038806362812862815921824 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 2), (13, 1), (15, 1)],
  term ((1342836183452711756038806362812862815921824 : Rat) / 1346818217520322526586147269553926167495) [(4, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 10. -/
theorem ep_Q2_002_partial_10_0100_valid :
    mulPoly ep_Q2_002_coefficient_10_0100
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0101 : Poly :=
[
  term ((-56063165212 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 10. -/
def ep_Q2_002_partial_10_0101 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 10. -/
theorem ep_Q2_002_partial_10_0101_valid :
    mulPoly ep_Q2_002_coefficient_10_0101
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0102 : Poly :=
[
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 102 for generator 10. -/
def ep_Q2_002_partial_10_0102 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (13, 2)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 2)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (13, 2)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 10. -/
theorem ep_Q2_002_partial_10_0102_valid :
    mulPoly ep_Q2_002_coefficient_10_0102
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0103 : Poly :=
[
  term ((-2782100914238578539421191261345585522416424 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 2)]
]

/-- Partial product 103 for generator 10. -/
def ep_Q2_002_partial_10_0103 : Poly :=
[
  term ((-5564201828477157078842382522691171044832848 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (15, 2)],
  term ((-5564201828477157078842382522691171044832848 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((2782100914238578539421191261345585522416424 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 2), (15, 2)],
  term ((2782100914238578539421191261345585522416424 : Rat) / 1346818217520322526586147269553926167495) [(4, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 10. -/
theorem ep_Q2_002_partial_10_0103_valid :
    mulPoly ep_Q2_002_coefficient_10_0103
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0104 : Poly :=
[
  term ((-225075353862 : Rat) / 7401317245) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 104 for generator 10. -/
def ep_Q2_002_partial_10_0104 : Poly :=
[
  term ((-450150707724 : Rat) / 7401317245) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-450150707724 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((225075353862 : Rat) / 7401317245) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((225075353862 : Rat) / 7401317245) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 10. -/
theorem ep_Q2_002_partial_10_0104_valid :
    mulPoly ep_Q2_002_coefficient_10_0104
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0105 : Poly :=
[
  term ((-26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 105 for generator 10. -/
def ep_Q2_002_partial_10_0105 : Poly :=
[
  term ((-52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1)],
  term ((-52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (11, 1)],
  term ((26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(4, 2), (5, 1), (8, 1), (11, 1)],
  term ((26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(5, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 10. -/
theorem ep_Q2_002_partial_10_0105_valid :
    mulPoly ep_Q2_002_coefficient_10_0105
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0106 : Poly :=
[
  term ((49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 106 for generator 10. -/
def ep_Q2_002_partial_10_0106 : Poly :=
[
  term ((99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (13, 1)],
  term ((-49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(4, 2), (5, 1), (8, 1), (13, 1)],
  term ((-49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(5, 3), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 10. -/
theorem ep_Q2_002_partial_10_0106_valid :
    mulPoly ep_Q2_002_coefficient_10_0106
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0107 : Poly :=
[
  term ((368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 107 for generator 10. -/
def ep_Q2_002_partial_10_0107 : Poly :=
[
  term ((737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (8, 1), (15, 1)],
  term ((-368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((-368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(5, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 10. -/
theorem ep_Q2_002_partial_10_0107_valid :
    mulPoly ep_Q2_002_coefficient_10_0107
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0108 : Poly :=
[
  term ((27821842066 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 10. -/
def ep_Q2_002_partial_10_0108 : Poly :=
[
  term ((55643684132 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((55643684132 : Rat) / 7401317245) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-27821842066 : Rat) / 7401317245) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-27821842066 : Rat) / 7401317245) [(5, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 10. -/
theorem ep_Q2_002_partial_10_0108_valid :
    mulPoly ep_Q2_002_coefficient_10_0108
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0109 : Poly :=
[
  term ((-1739171571874405847618230776384 : Rat) / 115799135485108289802725034287) [(5, 1), (11, 1)]
]

/-- Partial product 109 for generator 10. -/
def ep_Q2_002_partial_10_0109 : Poly :=
[
  term ((-3478343143748811695236461552768 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-3478343143748811695236461552768 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (11, 1)],
  term ((1739171571874405847618230776384 : Rat) / 115799135485108289802725034287) [(4, 2), (5, 1), (11, 1)],
  term ((1739171571874405847618230776384 : Rat) / 115799135485108289802725034287) [(5, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 10. -/
theorem ep_Q2_002_partial_10_0109_valid :
    mulPoly ep_Q2_002_coefficient_10_0109
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0110 : Poly :=
[
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 110 for generator 10. -/
def ep_Q2_002_partial_10_0110 : Poly :=
[
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(4, 2), (5, 1), (11, 1), (12, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 10. -/
theorem ep_Q2_002_partial_10_0110_valid :
    mulPoly ep_Q2_002_coefficient_10_0110
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0111 : Poly :=
[
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 111 for generator 10. -/
def ep_Q2_002_partial_10_0111 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (12, 1), (13, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 10. -/
theorem ep_Q2_002_partial_10_0111_valid :
    mulPoly ep_Q2_002_coefficient_10_0111
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0112 : Poly :=
[
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 112 for generator 10. -/
def ep_Q2_002_partial_10_0112 : Poly :=
[
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 10. -/
theorem ep_Q2_002_partial_10_0112_valid :
    mulPoly ep_Q2_002_coefficient_10_0112
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0113 : Poly :=
[
  term ((-56063165212 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 10. -/
def ep_Q2_002_partial_10_0113 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(5, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 10. -/
theorem ep_Q2_002_partial_10_0113_valid :
    mulPoly ep_Q2_002_coefficient_10_0113
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0114 : Poly :=
[
  term ((3275185767632984608199002499328 : Rat) / 115799135485108289802725034287) [(5, 1), (13, 1)]
]

/-- Partial product 114 for generator 10. -/
def ep_Q2_002_partial_10_0114 : Poly :=
[
  term ((6550371535265969216398004998656 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((6550371535265969216398004998656 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (13, 1)],
  term ((-3275185767632984608199002499328 : Rat) / 115799135485108289802725034287) [(4, 2), (5, 1), (13, 1)],
  term ((-3275185767632984608199002499328 : Rat) / 115799135485108289802725034287) [(5, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 10. -/
theorem ep_Q2_002_partial_10_0114_valid :
    mulPoly ep_Q2_002_coefficient_10_0114
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0115 : Poly :=
[
  term ((59870259583037750037771155912066598279132 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (15, 1)]
]

/-- Partial product 115 for generator 10. -/
def ep_Q2_002_partial_10_0115 : Poly :=
[
  term ((119740519166075500075542311824133196558264 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((119740519166075500075542311824133196558264 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 2), (15, 1)],
  term ((-59870259583037750037771155912066598279132 : Rat) / 122438019774574775144195206323084197045) [(4, 2), (5, 1), (15, 1)],
  term ((-59870259583037750037771155912066598279132 : Rat) / 122438019774574775144195206323084197045) [(5, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 10. -/
theorem ep_Q2_002_partial_10_0115_valid :
    mulPoly ep_Q2_002_coefficient_10_0115
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0116 : Poly :=
[
  term ((91632147203 : Rat) / 22203951735) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 10. -/
def ep_Q2_002_partial_10_0116 : Poly :=
[
  term ((183264294406 : Rat) / 22203951735) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((183264294406 : Rat) / 22203951735) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-91632147203 : Rat) / 22203951735) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-91632147203 : Rat) / 22203951735) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 10. -/
theorem ep_Q2_002_partial_10_0116_valid :
    mulPoly ep_Q2_002_coefficient_10_0116
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0117 : Poly :=
[
  term ((534945682692686961360 : Rat) / 253528477699481291099) [(6, 1)]
]

/-- Partial product 117 for generator 10. -/
def ep_Q2_002_partial_10_0117 : Poly :=
[
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(2, 1), (4, 1), (6, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (6, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(4, 2), (6, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(5, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 10. -/
theorem ep_Q2_002_partial_10_0117_valid :
    mulPoly ep_Q2_002_coefficient_10_0117
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0118 : Poly :=
[
  term ((75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 118 for generator 10. -/
def ep_Q2_002_partial_10_0118 : Poly :=
[
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(5, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 10. -/
theorem ep_Q2_002_partial_10_0118_valid :
    mulPoly ep_Q2_002_coefficient_10_0118
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0119 : Poly :=
[
  term ((-143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 119 for generator 10. -/
def ep_Q2_002_partial_10_0119 : Poly :=
[
  term ((-286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(5, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 10. -/
theorem ep_Q2_002_partial_10_0119_valid :
    mulPoly ep_Q2_002_coefficient_10_0119
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0120 : Poly :=
[
  term ((-61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 120 for generator 10. -/
def ep_Q2_002_partial_10_0120 : Poly :=
[
  term ((-123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(5, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 10. -/
theorem ep_Q2_002_partial_10_0120_valid :
    mulPoly ep_Q2_002_coefficient_10_0120
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0121 : Poly :=
[
  term ((-70368054424 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 10. -/
def ep_Q2_002_partial_10_0121 : Poly :=
[
  term ((-140736108848 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-140736108848 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((70368054424 : Rat) / 7401317245) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((70368054424 : Rat) / 7401317245) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 10. -/
theorem ep_Q2_002_partial_10_0121_valid :
    mulPoly ep_Q2_002_coefficient_10_0121
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0122 : Poly :=
[
  term ((93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 122 for generator 10. -/
def ep_Q2_002_partial_10_0122 : Poly :=
[
  term ((186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(5, 2), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 10. -/
theorem ep_Q2_002_partial_10_0122_valid :
    mulPoly ep_Q2_002_coefficient_10_0122
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0123 : Poly :=
[
  term ((12548443744 : Rat) / 7401317245) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 10. -/
def ep_Q2_002_partial_10_0123 : Poly :=
[
  term ((25096887488 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((25096887488 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 10. -/
theorem ep_Q2_002_partial_10_0123_valid :
    mulPoly ep_Q2_002_coefficient_10_0123
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0124 : Poly :=
[
  term ((-195942992777175625386878469972528 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 124 for generator 10. -/
def ep_Q2_002_partial_10_0124 : Poly :=
[
  term ((-391885985554351250773756939945056 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-391885985554351250773756939945056 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((195942992777175625386878469972528 : Rat) / 1273790490336191187829975377157) [(4, 2), (7, 1), (11, 1)],
  term ((195942992777175625386878469972528 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 10. -/
theorem ep_Q2_002_partial_10_0124_valid :
    mulPoly ep_Q2_002_coefficient_10_0124
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0125 : Poly :=
[
  term ((363621948151149259041082856747616 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 125 for generator 10. -/
def ep_Q2_002_partial_10_0125 : Poly :=
[
  term ((727243896302298518082165713495232 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((727243896302298518082165713495232 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-363621948151149259041082856747616 : Rat) / 1273790490336191187829975377157) [(4, 2), (7, 1), (13, 1)],
  term ((-363621948151149259041082856747616 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 10. -/
theorem ep_Q2_002_partial_10_0125_valid :
    mulPoly ep_Q2_002_coefficient_10_0125
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0126 : Poly :=
[
  term ((1693478541543888761387686635415042213186632 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 126 for generator 10. -/
def ep_Q2_002_partial_10_0126 : Poly :=
[
  term ((3386957083087777522775373270830084426373264 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((3386957083087777522775373270830084426373264 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1693478541543888761387686635415042213186632 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (7, 1), (15, 1)],
  term ((-1693478541543888761387686635415042213186632 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 10. -/
theorem ep_Q2_002_partial_10_0126_valid :
    mulPoly ep_Q2_002_coefficient_10_0126
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0127 : Poly :=
[
  term ((170992711726 : Rat) / 7401317245) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 10. -/
def ep_Q2_002_partial_10_0127 : Poly :=
[
  term ((341985423452 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((341985423452 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-170992711726 : Rat) / 7401317245) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-170992711726 : Rat) / 7401317245) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 10. -/
theorem ep_Q2_002_partial_10_0127_valid :
    mulPoly ep_Q2_002_coefficient_10_0127
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0128 : Poly :=
[
  term ((-43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 128 for generator 10. -/
def ep_Q2_002_partial_10_0128 : Poly :=
[
  term ((-86787142909821121996005501427200 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((-86787142909821121996005501427200 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)],
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (9, 1), (11, 1)],
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 10. -/
theorem ep_Q2_002_partial_10_0128_valid :
    mulPoly ep_Q2_002_coefficient_10_0128
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0129 : Poly :=
[
  term ((81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 129 for generator 10. -/
def ep_Q2_002_partial_10_0129 : Poly :=
[
  term ((163436442883797717940765548902400 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((163436442883797717940765548902400 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 10. -/
theorem ep_Q2_002_partial_10_0129_valid :
    mulPoly ep_Q2_002_coefficient_10_0129
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0130 : Poly :=
[
  term ((1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 130 for generator 10. -/
def ep_Q2_002_partial_10_0130 : Poly :=
[
  term ((3210885602608095167877929766547465057311984 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((3210885602608095167877929766547465057311984 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 10. -/
theorem ep_Q2_002_partial_10_0130_valid :
    mulPoly ep_Q2_002_coefficient_10_0130
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0131 : Poly :=
[
  term ((71095103246 : Rat) / 7401317245) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 10. -/
def ep_Q2_002_partial_10_0131 : Poly :=
[
  term ((142190206492 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((142190206492 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-71095103246 : Rat) / 7401317245) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-71095103246 : Rat) / 7401317245) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 10. -/
theorem ep_Q2_002_partial_10_0131_valid :
    mulPoly ep_Q2_002_coefficient_10_0131
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0132 : Poly :=
[
  term ((19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 132 for generator 10. -/
def ep_Q2_002_partial_10_0132 : Poly :=
[
  term ((39301297778666436292606034499480 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1)],
  term ((39301297778666436292606034499480 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)],
  term ((-19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 10. -/
theorem ep_Q2_002_partial_10_0132_valid :
    mulPoly ep_Q2_002_coefficient_10_0132
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0133 : Poly :=
[
  term ((25563152217959856457857416027952 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 133 for generator 10. -/
def ep_Q2_002_partial_10_0133 : Poly :=
[
  term ((51126304435919712915714832055904 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((51126304435919712915714832055904 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((-25563152217959856457857416027952 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((-25563152217959856457857416027952 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 10. -/
theorem ep_Q2_002_partial_10_0133_valid :
    mulPoly ep_Q2_002_coefficient_10_0133
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0134 : Poly :=
[
  term ((-646083519584299607402587325268779551311384 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 134 for generator 10. -/
def ep_Q2_002_partial_10_0134 : Poly :=
[
  term ((-1292167039168599214805174650537559102622768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-1292167039168599214805174650537559102622768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((646083519584299607402587325268779551311384 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((646083519584299607402587325268779551311384 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 10. -/
theorem ep_Q2_002_partial_10_0134_valid :
    mulPoly ep_Q2_002_coefficient_10_0134
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0135 : Poly :=
[
  term ((-30403021007 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 10. -/
def ep_Q2_002_partial_10_0135 : Poly :=
[
  term ((-60806042014 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60806042014 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((30403021007 : Rat) / 7401317245) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((30403021007 : Rat) / 7401317245) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 10. -/
theorem ep_Q2_002_partial_10_0135_valid :
    mulPoly ep_Q2_002_coefficient_10_0135
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0136 : Poly :=
[
  term ((-37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

/-- Partial product 136 for generator 10. -/
def ep_Q2_002_partial_10_0136 : Poly :=
[
  term ((-74011703742067365254813744792160 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (13, 2)],
  term ((-74011703742067365254813744792160 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (13, 2)],
  term ((37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (13, 2)],
  term ((37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 10. -/
theorem ep_Q2_002_partial_10_0136_valid :
    mulPoly ep_Q2_002_coefficient_10_0136
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0137 : Poly :=
[
  term ((-8453973130296139235940971321610847174248 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 137 for generator 10. -/
def ep_Q2_002_partial_10_0137 : Poly :=
[
  term ((-16907946260592278471881942643221694348496 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((-16907946260592278471881942643221694348496 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((8453973130296139235940971321610847174248 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (8, 1), (15, 2)],
  term ((8453973130296139235940971321610847174248 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 10. -/
theorem ep_Q2_002_partial_10_0137_valid :
    mulPoly ep_Q2_002_coefficient_10_0137
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0138 : Poly :=
[
  term ((-2237739922 : Rat) / 1057331035) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 138 for generator 10. -/
def ep_Q2_002_partial_10_0138 : Poly :=
[
  term ((-4475479844 : Rat) / 1057331035) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4475479844 : Rat) / 1057331035) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((2237739922 : Rat) / 1057331035) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((2237739922 : Rat) / 1057331035) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 10. -/
theorem ep_Q2_002_partial_10_0138_valid :
    mulPoly ep_Q2_002_coefficient_10_0138
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0139 : Poly :=
[
  term ((-272853841329140500157920344940752 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 139 for generator 10. -/
def ep_Q2_002_partial_10_0139 : Poly :=
[
  term ((-545707682658281000315840689881504 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-545707682658281000315840689881504 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((272853841329140500157920344940752 : Rat) / 1273790490336191187829975377157) [(4, 2), (9, 1), (11, 1)],
  term ((272853841329140500157920344940752 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 10. -/
theorem ep_Q2_002_partial_10_0139_valid :
    mulPoly ep_Q2_002_coefficient_10_0139
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0140 : Poly :=
[
  term ((231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 140 for generator 10. -/
def ep_Q2_002_partial_10_0140 : Poly :=
[
  term ((462516931851547216866867660645000 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1)],
  term ((462516931851547216866867660645000 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((-231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((-231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 10. -/
theorem ep_Q2_002_partial_10_0140_valid :
    mulPoly ep_Q2_002_coefficient_10_0140
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0141 : Poly :=
[
  term ((-435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 141 for generator 10. -/
def ep_Q2_002_partial_10_0141 : Poly :=
[
  term ((-871005999055541002526863064340000 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-871005999055541002526863064340000 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 10. -/
theorem ep_Q2_002_partial_10_0141_valid :
    mulPoly ep_Q2_002_coefficient_10_0141
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0142 : Poly :=
[
  term ((-203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 142 for generator 10. -/
def ep_Q2_002_partial_10_0142 : Poly :=
[
  term ((-407747656598132104991157255311878857057168 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-407747656598132104991157255311878857057168 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 10. -/
theorem ep_Q2_002_partial_10_0142_valid :
    mulPoly ep_Q2_002_coefficient_10_0142
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0143 : Poly :=
[
  term ((-152654436597 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 10. -/
def ep_Q2_002_partial_10_0143 : Poly :=
[
  term ((-305308873194 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-305308873194 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((152654436597 : Rat) / 7401317245) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((152654436597 : Rat) / 7401317245) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 10. -/
theorem ep_Q2_002_partial_10_0143_valid :
    mulPoly ep_Q2_002_coefficient_10_0143
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0144 : Poly :=
[
  term ((513834881053198509077208190565184 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 144 for generator 10. -/
def ep_Q2_002_partial_10_0144 : Poly :=
[
  term ((1027669762106397018154416381130368 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((1027669762106397018154416381130368 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-513834881053198509077208190565184 : Rat) / 1273790490336191187829975377157) [(4, 2), (9, 1), (13, 1)],
  term ((-513834881053198509077208190565184 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 10. -/
theorem ep_Q2_002_partial_10_0144_valid :
    mulPoly ep_Q2_002_coefficient_10_0144
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0145 : Poly :=
[
  term ((-441030571510671077801932747424176730305092 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 1)]
]

/-- Partial product 145 for generator 10. -/
def ep_Q2_002_partial_10_0145 : Poly :=
[
  term ((-882061143021342155603865494848353460610184 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-882061143021342155603865494848353460610184 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((441030571510671077801932747424176730305092 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (9, 1), (15, 1)],
  term ((441030571510671077801932747424176730305092 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 10. -/
theorem ep_Q2_002_partial_10_0145_valid :
    mulPoly ep_Q2_002_coefficient_10_0145
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0146 : Poly :=
[
  term ((162293807999 : Rat) / 7401317245) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 10. -/
def ep_Q2_002_partial_10_0146 : Poly :=
[
  term ((324587615998 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((324587615998 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-162293807999 : Rat) / 7401317245) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-162293807999 : Rat) / 7401317245) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 10. -/
theorem ep_Q2_002_partial_10_0146_valid :
    mulPoly ep_Q2_002_coefficient_10_0146
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0147 : Poly :=
[
  term ((35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 147 for generator 10. -/
def ep_Q2_002_partial_10_0147 : Poly :=
[
  term ((71602532231651981957647299895776 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((71602532231651981957647299895776 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 10. -/
theorem ep_Q2_002_partial_10_0147_valid :
    mulPoly ep_Q2_002_coefficient_10_0147
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0148 : Poly :=
[
  term ((-320599918238010671138579880156723770336844 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 148 for generator 10. -/
def ep_Q2_002_partial_10_0148 : Poly :=
[
  term ((-641199836476021342277159760313447540673688 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-641199836476021342277159760313447540673688 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((320599918238010671138579880156723770336844 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((320599918238010671138579880156723770336844 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 10. -/
theorem ep_Q2_002_partial_10_0148_valid :
    mulPoly ep_Q2_002_coefficient_10_0148
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0149 : Poly :=
[
  term ((-6274221872 : Rat) / 7401317245) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 10. -/
def ep_Q2_002_partial_10_0149 : Poly :=
[
  term ((-12548443744 : Rat) / 7401317245) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6274221872 : Rat) / 7401317245) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6274221872 : Rat) / 7401317245) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 10. -/
theorem ep_Q2_002_partial_10_0149_valid :
    mulPoly ep_Q2_002_coefficient_10_0149
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0150 : Poly :=
[
  term ((-165324073513901229431784409478958 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

/-- Partial product 150 for generator 10. -/
def ep_Q2_002_partial_10_0150 : Poly :=
[
  term ((-330648147027802458863568818957916 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-330648147027802458863568818957916 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((165324073513901229431784409478958 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (13, 1)],
  term ((165324073513901229431784409478958 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 10. -/
theorem ep_Q2_002_partial_10_0150_valid :
    mulPoly ep_Q2_002_coefficient_10_0150
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0151 : Poly :=
[
  term ((92704632908033952037120501228824736535448 : Rat) / 269363643504064505317229453910785233499) [(11, 1), (15, 1)]
]

/-- Partial product 151 for generator 10. -/
def ep_Q2_002_partial_10_0151 : Poly :=
[
  term ((185409265816067904074241002457649473070896 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((185409265816067904074241002457649473070896 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-92704632908033952037120501228824736535448 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (11, 1), (15, 1)],
  term ((-92704632908033952037120501228824736535448 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 10. -/
theorem ep_Q2_002_partial_10_0151_valid :
    mulPoly ep_Q2_002_coefficient_10_0151
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0152 : Poly :=
[
  term ((1312579953 : Rat) / 1480263449) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 10. -/
def ep_Q2_002_partial_10_0152 : Poly :=
[
  term ((2625159906 : Rat) / 1480263449) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((2625159906 : Rat) / 1480263449) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1312579953 : Rat) / 1480263449) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1312579953 : Rat) / 1480263449) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 10. -/
theorem ep_Q2_002_partial_10_0152_valid :
    mulPoly ep_Q2_002_coefficient_10_0152
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0153 : Poly :=
[
  term ((3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(11, 2)]
]

/-- Partial product 153 for generator 10. -/
def ep_Q2_002_partial_10_0153 : Poly :=
[
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 2)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 2)],
  term ((-3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 2)],
  term ((-3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 10. -/
theorem ep_Q2_002_partial_10_0153_valid :
    mulPoly ep_Q2_002_coefficient_10_0153
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0154 : Poly :=
[
  term ((6284335703733637029648 : Rat) / 253528477699481291099) [(12, 1)]
]

/-- Partial product 154 for generator 10. -/
def ep_Q2_002_partial_10_0154 : Poly :=
[
  term ((12568671407467274059296 : Rat) / 253528477699481291099) [(2, 1), (4, 1), (12, 1)],
  term ((12568671407467274059296 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (12, 1)],
  term ((-6284335703733637029648 : Rat) / 253528477699481291099) [(4, 2), (12, 1)],
  term ((-6284335703733637029648 : Rat) / 253528477699481291099) [(5, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 10. -/
theorem ep_Q2_002_partial_10_0154_valid :
    mulPoly ep_Q2_002_coefficient_10_0154
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0155 : Poly :=
[
  term ((293675847036788015875408956549037634701584 : Rat) / 269363643504064505317229453910785233499) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 155 for generator 10. -/
def ep_Q2_002_partial_10_0155 : Poly :=
[
  term ((587351694073576031750817913098075269403168 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((587351694073576031750817913098075269403168 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-293675847036788015875408956549037634701584 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-293675847036788015875408956549037634701584 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 10. -/
theorem ep_Q2_002_partial_10_0155_valid :
    mulPoly ep_Q2_002_coefficient_10_0155
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0156 : Poly :=
[
  term ((384996092 : Rat) / 211466207) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 10. -/
def ep_Q2_002_partial_10_0156 : Poly :=
[
  term ((769992184 : Rat) / 211466207) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((769992184 : Rat) / 211466207) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384996092 : Rat) / 211466207) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384996092 : Rat) / 211466207) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 10. -/
theorem ep_Q2_002_partial_10_0156_valid :
    mulPoly ep_Q2_002_coefficient_10_0156
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0157 : Poly :=
[
  term ((-67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)]
]

/-- Partial product 157 for generator 10. -/
def ep_Q2_002_partial_10_0157 : Poly :=
[
  term ((-134840977327407613163022096619392 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 2)],
  term ((-134840977327407613163022096619392 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(4, 2), (12, 1), (13, 2)],
  term ((67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(5, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 10. -/
theorem ep_Q2_002_partial_10_0157_valid :
    mulPoly ep_Q2_002_coefficient_10_0157
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0158 : Poly :=
[
  term ((-143918165106253411123118044942417407127848 : Rat) / 269363643504064505317229453910785233499) [(12, 1), (15, 2)]
]

/-- Partial product 158 for generator 10. -/
def ep_Q2_002_partial_10_0158 : Poly :=
[
  term ((-287836330212506822246236089884834814255696 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-287836330212506822246236089884834814255696 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((143918165106253411123118044942417407127848 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (12, 1), (15, 2)],
  term ((143918165106253411123118044942417407127848 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 10. -/
theorem ep_Q2_002_partial_10_0158_valid :
    mulPoly ep_Q2_002_coefficient_10_0158
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0159 : Poly :=
[
  term ((6505476693 : Rat) / 1480263449) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 10. -/
def ep_Q2_002_partial_10_0159 : Poly :=
[
  term ((13010953386 : Rat) / 1480263449) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((13010953386 : Rat) / 1480263449) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6505476693 : Rat) / 1480263449) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6505476693 : Rat) / 1480263449) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 10. -/
theorem ep_Q2_002_partial_10_0159_valid :
    mulPoly ep_Q2_002_coefficient_10_0159
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0160 : Poly :=
[
  term ((94879670628986981174441308085187490089204 : Rat) / 122438019774574775144195206323084197045) [(13, 1), (15, 1)]
]

/-- Partial product 160 for generator 10. -/
def ep_Q2_002_partial_10_0160 : Poly :=
[
  term ((189759341257973962348882616170374980178408 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((189759341257973962348882616170374980178408 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-94879670628986981174441308085187490089204 : Rat) / 122438019774574775144195206323084197045) [(4, 2), (13, 1), (15, 1)],
  term ((-94879670628986981174441308085187490089204 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 10. -/
theorem ep_Q2_002_partial_10_0160_valid :
    mulPoly ep_Q2_002_coefficient_10_0160
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0161 : Poly :=
[
  term ((262103207619 : Rat) / 14802634490) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 10. -/
def ep_Q2_002_partial_10_0161 : Poly :=
[
  term ((262103207619 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((262103207619 : Rat) / 7401317245) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-262103207619 : Rat) / 14802634490) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-262103207619 : Rat) / 14802634490) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 10. -/
theorem ep_Q2_002_partial_10_0161_valid :
    mulPoly ep_Q2_002_coefficient_10_0161
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0162 : Poly :=
[
  term ((298915951841509271277904594010424 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

/-- Partial product 162 for generator 10. -/
def ep_Q2_002_partial_10_0162 : Poly :=
[
  term ((597831903683018542555809188020848 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2)],
  term ((597831903683018542555809188020848 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 2)],
  term ((-298915951841509271277904594010424 : Rat) / 1273790490336191187829975377157) [(4, 2), (13, 2)],
  term ((-298915951841509271277904594010424 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 10. -/
theorem ep_Q2_002_partial_10_0162_valid :
    mulPoly ep_Q2_002_coefficient_10_0162
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0163 : Poly :=
[
  term ((149705117447136844379474313843204783874058 : Rat) / 1346818217520322526586147269553926167495) [(15, 2)]
]

/-- Partial product 163 for generator 10. -/
def ep_Q2_002_partial_10_0163 : Poly :=
[
  term ((299410234894273688758948627686409567748116 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (15, 2)],
  term ((299410234894273688758948627686409567748116 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (15, 2)],
  term ((-149705117447136844379474313843204783874058 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (15, 2)],
  term ((-149705117447136844379474313843204783874058 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 10. -/
theorem ep_Q2_002_partial_10_0163_valid :
    mulPoly ep_Q2_002_coefficient_10_0163
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 10. -/
def ep_Q2_002_coefficient_10_0164 : Poly :=
[
  term ((-90997117691 : Rat) / 44407903470) [(15, 2), (16, 1)]
]

/-- Partial product 164 for generator 10. -/
def ep_Q2_002_partial_10_0164 : Poly :=
[
  term ((-90997117691 : Rat) / 22203951735) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-90997117691 : Rat) / 22203951735) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((90997117691 : Rat) / 44407903470) [(4, 2), (15, 2), (16, 1)],
  term ((90997117691 : Rat) / 44407903470) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 10. -/
theorem ep_Q2_002_partial_10_0164_valid :
    mulPoly ep_Q2_002_coefficient_10_0164
        ep_Q2_002_generator_10_0100_0164 =
      ep_Q2_002_partial_10_0164 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_10_0100_0164 : List Poly :=
[
  ep_Q2_002_partial_10_0100,
  ep_Q2_002_partial_10_0101,
  ep_Q2_002_partial_10_0102,
  ep_Q2_002_partial_10_0103,
  ep_Q2_002_partial_10_0104,
  ep_Q2_002_partial_10_0105,
  ep_Q2_002_partial_10_0106,
  ep_Q2_002_partial_10_0107,
  ep_Q2_002_partial_10_0108,
  ep_Q2_002_partial_10_0109,
  ep_Q2_002_partial_10_0110,
  ep_Q2_002_partial_10_0111,
  ep_Q2_002_partial_10_0112,
  ep_Q2_002_partial_10_0113,
  ep_Q2_002_partial_10_0114,
  ep_Q2_002_partial_10_0115,
  ep_Q2_002_partial_10_0116,
  ep_Q2_002_partial_10_0117,
  ep_Q2_002_partial_10_0118,
  ep_Q2_002_partial_10_0119,
  ep_Q2_002_partial_10_0120,
  ep_Q2_002_partial_10_0121,
  ep_Q2_002_partial_10_0122,
  ep_Q2_002_partial_10_0123,
  ep_Q2_002_partial_10_0124,
  ep_Q2_002_partial_10_0125,
  ep_Q2_002_partial_10_0126,
  ep_Q2_002_partial_10_0127,
  ep_Q2_002_partial_10_0128,
  ep_Q2_002_partial_10_0129,
  ep_Q2_002_partial_10_0130,
  ep_Q2_002_partial_10_0131,
  ep_Q2_002_partial_10_0132,
  ep_Q2_002_partial_10_0133,
  ep_Q2_002_partial_10_0134,
  ep_Q2_002_partial_10_0135,
  ep_Q2_002_partial_10_0136,
  ep_Q2_002_partial_10_0137,
  ep_Q2_002_partial_10_0138,
  ep_Q2_002_partial_10_0139,
  ep_Q2_002_partial_10_0140,
  ep_Q2_002_partial_10_0141,
  ep_Q2_002_partial_10_0142,
  ep_Q2_002_partial_10_0143,
  ep_Q2_002_partial_10_0144,
  ep_Q2_002_partial_10_0145,
  ep_Q2_002_partial_10_0146,
  ep_Q2_002_partial_10_0147,
  ep_Q2_002_partial_10_0148,
  ep_Q2_002_partial_10_0149,
  ep_Q2_002_partial_10_0150,
  ep_Q2_002_partial_10_0151,
  ep_Q2_002_partial_10_0152,
  ep_Q2_002_partial_10_0153,
  ep_Q2_002_partial_10_0154,
  ep_Q2_002_partial_10_0155,
  ep_Q2_002_partial_10_0156,
  ep_Q2_002_partial_10_0157,
  ep_Q2_002_partial_10_0158,
  ep_Q2_002_partial_10_0159,
  ep_Q2_002_partial_10_0160,
  ep_Q2_002_partial_10_0161,
  ep_Q2_002_partial_10_0162,
  ep_Q2_002_partial_10_0163,
  ep_Q2_002_partial_10_0164
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_10_0100_0164 : Poly :=
[
  term ((-52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (8, 1), (11, 1)],
  term ((99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (8, 1), (13, 1)],
  term ((737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1)],
  term ((55643684132 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3478343143748811695236461552768 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((6550371535265969216398004998656 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (13, 1)],
  term ((119740519166075500075542311824133196558264 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((183264294406 : Rat) / 22203951735) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(2, 1), (4, 1), (6, 1)],
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-140736108848 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((25096887488 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-391885985554351250773756939945056 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((727243896302298518082165713495232 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((3386957083087777522775373270830084426373264 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((341985423452 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-86787142909821121996005501427200 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (9, 1), (11, 1)],
  term ((163436442883797717940765548902400 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (9, 1), (13, 1)],
  term ((3210885602608095167877929766547465057311984 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1)],
  term ((142190206492 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((39301297778666436292606034499480 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (11, 1), (13, 1)],
  term ((51126304435919712915714832055904 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1292167039168599214805174650537559102622768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-60806042014 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74011703742067365254813744792160 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (13, 2)],
  term ((-16907946260592278471881942643221694348496 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((-4475479844 : Rat) / 1057331035) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-545707682658281000315840689881504 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((462516931851547216866867660645000 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1)],
  term ((-871005999055541002526863064340000 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-407747656598132104991157255311878857057168 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-305308873194 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1027669762106397018154416381130368 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-882061143021342155603865494848353460610184 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((324587615998 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((71602532231651981957647299895776 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-641199836476021342277159760313447540673688 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-330648147027802458863568818957916 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((185409265816067904074241002457649473070896 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((2625159906 : Rat) / 1480263449) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 2)],
  term ((12568671407467274059296 : Rat) / 253528477699481291099) [(2, 1), (4, 1), (12, 1)],
  term ((587351694073576031750817913098075269403168 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((769992184 : Rat) / 211466207) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-134840977327407613163022096619392 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 2)],
  term ((-287836330212506822246236089884834814255696 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((13010953386 : Rat) / 1480263449) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((189759341257973962348882616170374980178408 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((262103207619 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((597831903683018542555809188020848 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2)],
  term ((299410234894273688758948627686409567748116 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (15, 2)],
  term ((-90997117691 : Rat) / 22203951735) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-2685672366905423512077612725625725631843648 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (13, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(2, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 2), (13, 2)],
  term ((-5564201828477157078842382522691171044832848 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 2), (15, 2)],
  term ((-450150707724 : Rat) / 7401317245) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-2685672366905423512077612725625725631843648 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 2)],
  term ((-5564201828477157078842382522691171044832848 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((-450150707724 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((1069891365385373922720 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (6, 1)],
  term ((151950090576290750170434383076288 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1)],
  term ((-286150476522364170585500773322496 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1)],
  term ((-123764090852886036650527645981115726084352 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-140736108848 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((186995975799945789957973916650752 : Rat) / 268063527727966972480841957465) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((25096887488 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-391885985554351250773756939945056 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((727243896302298518082165713495232 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((3386957083087777522775373270830084426373264 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((341985423452 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-86787142909821121996005501427200 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1)],
  term ((163436442883797717940765548902400 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1)],
  term ((3210885602608095167877929766547465057311984 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1)],
  term ((142190206492 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((39301297778666436292606034499480 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (13, 1)],
  term ((51126304435919712915714832055904 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1292167039168599214805174650537559102622768 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((-60806042014 : Rat) / 7401317245) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74011703742067365254813744792160 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (8, 1), (13, 2)],
  term ((-16907946260592278471881942643221694348496 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (8, 1), (15, 2)],
  term ((-4475479844 : Rat) / 1057331035) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-545707682658281000315840689881504 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((462516931851547216866867660645000 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1)],
  term ((-871005999055541002526863064340000 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (12, 1), (13, 1)],
  term ((-407747656598132104991157255311878857057168 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1)],
  term ((-305308873194 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1027669762106397018154416381130368 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (9, 1), (13, 1)],
  term ((-882061143021342155603865494848353460610184 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((324587615998 : Rat) / 7401317245) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((71602532231651981957647299895776 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((-641199836476021342277159760313447540673688 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-330648147027802458863568818957916 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((185409265816067904074241002457649473070896 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((2625159906 : Rat) / 1480263449) [(3, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((7004432146695466982002749632016 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (11, 2)],
  term ((12568671407467274059296 : Rat) / 253528477699481291099) [(3, 1), (5, 1), (12, 1)],
  term ((587351694073576031750817913098075269403168 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((769992184 : Rat) / 211466207) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-134840977327407613163022096619392 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((-287836330212506822246236089884834814255696 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((13010953386 : Rat) / 1480263449) [(3, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((189759341257973962348882616170374980178408 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((262103207619 : Rat) / 7401317245) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((597831903683018542555809188020848 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (13, 2)],
  term ((299410234894273688758948627686409567748116 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (15, 2)],
  term ((-90997117691 : Rat) / 22203951735) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-52704263151602581200929394710976 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (11, 1)],
  term ((99251997536777696970088841217792 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (8, 1), (13, 1)],
  term ((737472830300905428892202002245131365886544 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (8, 1), (15, 1)],
  term ((55643684132 : Rat) / 7401317245) [(3, 1), (5, 2), (8, 1), (15, 1), (16, 1)],
  term ((-3478343143748811695236461552768 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (11, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (11, 1), (12, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 2), (12, 1), (13, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 2), (12, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((6550371535265969216398004998656 : Rat) / 115799135485108289802725034287) [(3, 1), (5, 2), (13, 1)],
  term ((119740519166075500075542311824133196558264 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (5, 2), (15, 1)],
  term ((183264294406 : Rat) / 22203951735) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((1342836183452711756038806362812862815921824 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 2), (13, 1), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 2), (13, 2)],
  term ((2782100914238578539421191261345585522416424 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 2), (15, 2)],
  term ((225075353862 : Rat) / 7401317245) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(4, 2), (5, 1), (8, 1), (11, 1)],
  term ((-49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(4, 2), (5, 1), (8, 1), (13, 1)],
  term ((-368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (5, 1), (8, 1), (15, 1)],
  term ((-27821842066 : Rat) / 7401317245) [(4, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((1739171571874405847618230776384 : Rat) / 115799135485108289802725034287) [(4, 2), (5, 1), (11, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(4, 2), (5, 1), (11, 1), (12, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 2), (5, 1), (12, 1), (13, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (5, 1), (12, 1), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3275185767632984608199002499328 : Rat) / 115799135485108289802725034287) [(4, 2), (5, 1), (13, 1)],
  term ((-59870259583037750037771155912066598279132 : Rat) / 122438019774574775144195206323084197045) [(4, 2), (5, 1), (15, 1)],
  term ((-91632147203 : Rat) / 22203951735) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(4, 2), (6, 1)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((70368054424 : Rat) / 7401317245) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((195942992777175625386878469972528 : Rat) / 1273790490336191187829975377157) [(4, 2), (7, 1), (11, 1)],
  term ((-363621948151149259041082856747616 : Rat) / 1273790490336191187829975377157) [(4, 2), (7, 1), (13, 1)],
  term ((-1693478541543888761387686635415042213186632 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (7, 1), (15, 1)],
  term ((-170992711726 : Rat) / 7401317245) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (9, 1), (11, 1)],
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (9, 1), (13, 1)],
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (8, 1), (9, 1), (15, 1)],
  term ((-71095103246 : Rat) / 7401317245) [(4, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (11, 1), (13, 1)],
  term ((-25563152217959856457857416027952 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (11, 1), (15, 1)],
  term ((646083519584299607402587325268779551311384 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (8, 1), (13, 1), (15, 1)],
  term ((30403021007 : Rat) / 7401317245) [(4, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(4, 2), (8, 1), (13, 2)],
  term ((8453973130296139235940971321610847174248 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (8, 1), (15, 2)],
  term ((2237739922 : Rat) / 1057331035) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((272853841329140500157920344940752 : Rat) / 1273790490336191187829975377157) [(4, 2), (9, 1), (11, 1)],
  term ((-231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((152654436597 : Rat) / 7401317245) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-513834881053198509077208190565184 : Rat) / 1273790490336191187829975377157) [(4, 2), (9, 1), (13, 1)],
  term ((441030571510671077801932747424176730305092 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (9, 1), (15, 1)],
  term ((-162293807999 : Rat) / 7401317245) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((320599918238010671138579880156723770336844 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((6274221872 : Rat) / 7401317245) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((165324073513901229431784409478958 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 1), (13, 1)],
  term ((-92704632908033952037120501228824736535448 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (11, 1), (15, 1)],
  term ((-1312579953 : Rat) / 1480263449) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(4, 2), (11, 2)],
  term ((-6284335703733637029648 : Rat) / 253528477699481291099) [(4, 2), (12, 1)],
  term ((-293675847036788015875408956549037634701584 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-384996092 : Rat) / 211466207) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(4, 2), (12, 1), (13, 2)],
  term ((143918165106253411123118044942417407127848 : Rat) / 269363643504064505317229453910785233499) [(4, 2), (12, 1), (15, 2)],
  term ((-6505476693 : Rat) / 1480263449) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-94879670628986981174441308085187490089204 : Rat) / 122438019774574775144195206323084197045) [(4, 2), (13, 1), (15, 1)],
  term ((-262103207619 : Rat) / 14802634490) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-298915951841509271277904594010424 : Rat) / 1273790490336191187829975377157) [(4, 2), (13, 2)],
  term ((-149705117447136844379474313843204783874058 : Rat) / 1346818217520322526586147269553926167495) [(4, 2), (15, 2)],
  term ((90997117691 : Rat) / 44407903470) [(4, 2), (15, 2), (16, 1)],
  term ((1342836183452711756038806362812862815921824 : Rat) / 1346818217520322526586147269553926167495) [(4, 3), (13, 1), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 3), (13, 2)],
  term ((2782100914238578539421191261345585522416424 : Rat) / 1346818217520322526586147269553926167495) [(4, 3), (15, 2)],
  term ((225075353862 : Rat) / 7401317245) [(4, 3), (15, 2), (16, 1)],
  term ((-534945682692686961360 : Rat) / 253528477699481291099) [(5, 2), (6, 1)],
  term ((-75975045288145375085217191538144 : Rat) / 1273790490336191187829975377157) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((143075238261182085292750386661248 : Rat) / 1273790490336191187829975377157) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((61882045426443018325263822990557863042176 : Rat) / 103601401347717117429703636119532782115) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((70368054424 : Rat) / 7401317245) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-93497987899972894978986958325376 : Rat) / 268063527727966972480841957465) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-12548443744 : Rat) / 7401317245) [(5, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((195942992777175625386878469972528 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (11, 1)],
  term ((-363621948151149259041082856747616 : Rat) / 1273790490336191187829975377157) [(5, 2), (7, 1), (13, 1)],
  term ((-1693478541543888761387686635415042213186632 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (7, 1), (15, 1)],
  term ((-170992711726 : Rat) / 7401317245) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((43393571454910560998002750713600 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (9, 1), (11, 1)],
  term ((-81718221441898858970382774451200 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (9, 1), (13, 1)],
  term ((-1605442801304047583938964883273732528655992 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (8, 1), (9, 1), (15, 1)],
  term ((-71095103246 : Rat) / 7401317245) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19650648889333218146303017249740 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (11, 1), (13, 1)],
  term ((-25563152217959856457857416027952 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (11, 1), (15, 1)],
  term ((646083519584299607402587325268779551311384 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (8, 1), (13, 1), (15, 1)],
  term ((30403021007 : Rat) / 7401317245) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((37005851871033682627406872396080 : Rat) / 1273790490336191187829975377157) [(5, 2), (8, 1), (13, 2)],
  term ((8453973130296139235940971321610847174248 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (8, 1), (15, 2)],
  term ((2237739922 : Rat) / 1057331035) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((272853841329140500157920344940752 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (11, 1)],
  term ((-231258465925773608433433830322500 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((435502999527770501263431532170000 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((203873828299066052495578627655939428528584 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((152654436597 : Rat) / 7401317245) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-513834881053198509077208190565184 : Rat) / 1273790490336191187829975377157) [(5, 2), (9, 1), (13, 1)],
  term ((441030571510671077801932747424176730305092 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (9, 1), (15, 1)],
  term ((-162293807999 : Rat) / 7401317245) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-35801266115825990978823649947888 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((320599918238010671138579880156723770336844 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((6274221872 : Rat) / 7401317245) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((165324073513901229431784409478958 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (13, 1)],
  term ((-92704632908033952037120501228824736535448 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (11, 1), (15, 1)],
  term ((-1312579953 : Rat) / 1480263449) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3502216073347733491001374816008 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 2)],
  term ((-6284335703733637029648 : Rat) / 253528477699481291099) [(5, 2), (12, 1)],
  term ((-293675847036788015875408956549037634701584 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-384996092 : Rat) / 211466207) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((67420488663703806581511048309696 : Rat) / 1273790490336191187829975377157) [(5, 2), (12, 1), (13, 2)],
  term ((143918165106253411123118044942417407127848 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (12, 1), (15, 2)],
  term ((-6505476693 : Rat) / 1480263449) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-94879670628986981174441308085187490089204 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (13, 1), (15, 1)],
  term ((-262103207619 : Rat) / 14802634490) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-298915951841509271277904594010424 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 2)],
  term ((-149705117447136844379474313843204783874058 : Rat) / 1346818217520322526586147269553926167495) [(5, 2), (15, 2)],
  term ((90997117691 : Rat) / 44407903470) [(5, 2), (15, 2), (16, 1)],
  term ((26352131575801290600464697355488 : Rat) / 1273790490336191187829975377157) [(5, 3), (8, 1), (11, 1)],
  term ((-49625998768388848485044420608896 : Rat) / 1273790490336191187829975377157) [(5, 3), (8, 1), (13, 1)],
  term ((-368736415150452714446101001122565682943272 : Rat) / 1346818217520322526586147269553926167495) [(5, 3), (8, 1), (15, 1)],
  term ((-27821842066 : Rat) / 7401317245) [(5, 3), (8, 1), (15, 1), (16, 1)],
  term ((1739171571874405847618230776384 : Rat) / 115799135485108289802725034287) [(5, 3), (11, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 3), (11, 1), (12, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 3), (12, 1), (13, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 3), (12, 1), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((-3275185767632984608199002499328 : Rat) / 115799135485108289802725034287) [(5, 3), (13, 1)],
  term ((-59870259583037750037771155912066598279132 : Rat) / 122438019774574775144195206323084197045) [(5, 3), (15, 1)],
  term ((-91632147203 : Rat) / 22203951735) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 100 through 164. -/
theorem ep_Q2_002_block_10_0100_0164_valid :
    checkProductSumEq ep_Q2_002_partials_10_0100_0164
      ep_Q2_002_block_10_0100_0164 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
