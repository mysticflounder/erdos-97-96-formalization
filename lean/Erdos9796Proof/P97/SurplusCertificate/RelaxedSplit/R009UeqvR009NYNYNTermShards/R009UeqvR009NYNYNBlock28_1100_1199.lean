/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1100-1199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1100 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1100 : Poly :=
[
  term ((2436671832619908134423 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1100 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1100 : Poly :=
[
  term ((4873343665239816268846 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2436671832619908134423 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1100 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1100_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1100
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1100 := by
  native_decide

/-- Coefficient term 1101 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1101 : Poly :=
[
  term ((113786939695170375945020831 : Rat) / 3030537972036726987494652) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 1101 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1101 : Poly :=
[
  term ((113786939695170375945020831 : Rat) / 1515268986018363493747326) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-113786939695170375945020831 : Rat) / 3030537972036726987494652) [(2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1101 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1101_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1101
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1101 := by
  native_decide

/-- Coefficient term 1102 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1102 : Poly :=
[
  term ((-56401804282671232858219218719894578032711079203553595732474742541 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(2, 1), (13, 3), (15, 1)]
]

/-- Partial product 1102 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1102 : Poly :=
[
  term ((-56401804282671232858219218719894578032711079203553595732474742541 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((56401804282671232858219218719894578032711079203553595732474742541 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(2, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1102 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1102_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1102
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1102 := by
  native_decide

/-- Coefficient term 1103 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1103 : Poly :=
[
  term ((-4203476630192060293306 : Rat) / 13017774793972194963465) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1103 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1103 : Poly :=
[
  term ((-8406953260384120586612 : Rat) / 13017774793972194963465) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4203476630192060293306 : Rat) / 13017774793972194963465) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1103 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1103_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1103
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1103 := by
  native_decide

/-- Coefficient term 1104 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1104 : Poly :=
[
  term ((1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (13, 4)]
]

/-- Partial product 1104 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1104 : Poly :=
[
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (13, 4)],
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (13, 4), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1104 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1104_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1104
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1104 := by
  native_decide

/-- Coefficient term 1105 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1105 : Poly :=
[
  term ((57206102401341232775004203240325462080527749754123047868998102315350682157336879 : Rat) / 1044671998762562255850589923613938619707789266571535883558435552764498096128000) [(2, 1), (14, 1)]
]

/-- Partial product 1105 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1105 : Poly :=
[
  term ((-57206102401341232775004203240325462080527749754123047868998102315350682157336879 : Rat) / 1044671998762562255850589923613938619707789266571535883558435552764498096128000) [(2, 1), (14, 1)],
  term ((57206102401341232775004203240325462080527749754123047868998102315350682157336879 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(2, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1105 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1105_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1105
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1105 := by
  native_decide

/-- Coefficient term 1106 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1106 : Poly :=
[
  term ((-92768633928039542531 : Rat) / 1025571442072006357920) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 1106 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1106 : Poly :=
[
  term ((92768633928039542531 : Rat) / 1025571442072006357920) [(2, 1), (14, 1), (16, 1)],
  term ((-92768633928039542531 : Rat) / 512785721036003178960) [(2, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1106 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1106_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1106
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1106 := by
  native_decide

/-- Coefficient term 1107 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1107 : Poly :=
[
  term ((2017926438421471692804718642269730960052866804903204528849780525985442251341559563 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(2, 1), (15, 2)]
]

/-- Partial product 1107 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1107 : Poly :=
[
  term ((2017926438421471692804718642269730960052866804903204528849780525985442251341559563 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 1), (14, 1), (15, 2)],
  term ((-2017926438421471692804718642269730960052866804903204528849780525985442251341559563 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1107 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1107_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1107
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1107 := by
  native_decide

/-- Coefficient term 1108 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1108 : Poly :=
[
  term ((5631864707965615260079 : Rat) / 73255103005143311280) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 1108 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1108 : Poly :=
[
  term ((5631864707965615260079 : Rat) / 36627551502571655640) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5631864707965615260079 : Rat) / 73255103005143311280) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1108 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1108_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1108
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1108 := by
  native_decide

/-- Coefficient term 1109 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1109 : Poly :=
[
  term ((-2999006028614573543159 : Rat) / 48836735336762207520) [(2, 1), (16, 1)]
]

/-- Partial product 1109 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1109 : Poly :=
[
  term ((-2999006028614573543159 : Rat) / 24418367668381103760) [(2, 1), (14, 1), (16, 1)],
  term ((2999006028614573543159 : Rat) / 48836735336762207520) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1109 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1109_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1109
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1109 := by
  native_decide

/-- Coefficient term 1110 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1110 : Poly :=
[
  term ((594187641182828674863965226110097961315810263088389306697994519942842073034810763 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 2)]
]

/-- Partial product 1110 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1110 : Poly :=
[
  term ((-594187641182828674863965226110097961315810263088389306697994519942842073034810763 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 2)],
  term ((594187641182828674863965226110097961315810263088389306697994519942842073034810763 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1110 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1110_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1110
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1110 := by
  native_decide

/-- Coefficient term 1111 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1111 : Poly :=
[
  term ((6298299106979896 : Rat) / 1048898954827367) [(2, 2), (3, 1), (13, 1)]
]

/-- Partial product 1111 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1111 : Poly :=
[
  term ((-6298299106979896 : Rat) / 1048898954827367) [(2, 2), (3, 1), (13, 1)],
  term ((12596598213959792 : Rat) / 1048898954827367) [(2, 2), (3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1111 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1111_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1111
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1111 := by
  native_decide

/-- Coefficient term 1112 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1112 : Poly :=
[
  term ((-3149149553489948 : Rat) / 1048898954827367) [(2, 2), (3, 1), (15, 1)]
]

/-- Partial product 1112 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1112 : Poly :=
[
  term ((-6298299106979896 : Rat) / 1048898954827367) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(2, 2), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1112 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1112_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1112
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1112 := by
  native_decide

/-- Coefficient term 1113 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1113 : Poly :=
[
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1113 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1113 : Poly :=
[
  term ((22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-45780833228608074999769106881757461433058406794736435200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1113 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1113_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1113
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1113 := by
  native_decide

/-- Coefficient term 1114 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1114 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1114 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1114 : Poly :=
[
  term ((22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1114 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1114_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1114
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1114 := by
  native_decide

/-- Coefficient term 1115 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1115 : Poly :=
[
  term ((22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (13, 1)]
]

/-- Partial product 1115 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1115 : Poly :=
[
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (13, 1)],
  term ((45780833228608074999769106881757461433058406794736435200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1115 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1115_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1115
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1115 := by
  native_decide

/-- Coefficient term 1116 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1116 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (15, 1)]
]

/-- Partial product 1116 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1116 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1116 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1116_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1116
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1116 := by
  native_decide

/-- Coefficient term 1117 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1117 : Poly :=
[
  term ((-1609482418193252636710632663811785753505959613877452800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (11, 1)]
]

/-- Partial product 1117 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1117 : Poly :=
[
  term ((1609482418193252636710632663811785753505959613877452800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (11, 1)],
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1117 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1117_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1117
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1117 := by
  native_decide

/-- Coefficient term 1118 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1118 : Poly :=
[
  term ((18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 1118 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1118 : Poly :=
[
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((36342199934724380283596278252794865234691377816825856000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1118 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1118_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1118
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1118 := by
  native_decide

/-- Coefficient term 1119 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1119 : Poly :=
[
  term ((-9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 1119 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1119 : Poly :=
[
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1119 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1119_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1119
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1119 := by
  native_decide

/-- Coefficient term 1120 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1120 : Poly :=
[
  term ((-920896226401130686161906888493196955655452249172889600 : Rat) / 173433167502533793224162752212389262107675610420778337) [(2, 2), (5, 1), (13, 1)]
]

/-- Partial product 1120 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1120 : Poly :=
[
  term ((920896226401130686161906888493196955655452249172889600 : Rat) / 173433167502533793224162752212389262107675610420778337) [(2, 2), (5, 1), (13, 1)],
  term ((-1841792452802261372323813776986393911310904498345779200 : Rat) / 173433167502533793224162752212389262107675610420778337) [(2, 2), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1120 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1120_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1120
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1120 := by
  native_decide

/-- Coefficient term 1121 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1121 : Poly :=
[
  term ((3497224600527265820422018515305151943273438576508313600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (15, 1)]
]

/-- Partial product 1121 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1121 : Poly :=
[
  term ((6994449201054531640844037030610303886546877153016627200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-3497224600527265820422018515305151943273438576508313600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1121 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1121_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1121
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1121 := by
  native_decide

/-- Coefficient term 1122 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1122 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(2, 2), (7, 1), (13, 1)]
]

/-- Partial product 1122 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1122 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(2, 2), (7, 1), (13, 1)],
  term ((50386392855839168 : Rat) / 3146696864482101) [(2, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1122 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1122_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1122
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1122 := by
  native_decide

/-- Coefficient term 1123 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1123 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(2, 2), (7, 1), (15, 1)]
]

/-- Partial product 1123 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1123 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(2, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1123 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1123_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1123
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1123 := by
  native_decide

/-- Coefficient term 1124 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1124 : Poly :=
[
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 340616000598160244724040473195354762592007998209178418692887515378016000) [(2, 2), (8, 1)]
]

/-- Partial product 1124 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1124 : Poly :=
[
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 340616000598160244724040473195354762592007998209178418692887515378016000) [(2, 2), (8, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1124 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1124_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1124
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1124 := by
  native_decide

/-- Coefficient term 1125 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1125 : Poly :=
[
  term ((-10648088602948408924 : Rat) / 10683035854916732895) [(2, 2), (8, 1), (16, 1)]
]

/-- Partial product 1125 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1125 : Poly :=
[
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(2, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1125 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1125_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1125
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1125 := by
  native_decide

/-- Coefficient term 1126 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1126 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1126 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1126 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-415521500975212250826203828836216554791462 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1126 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1126_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1126
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1126 := by
  native_decide

/-- Coefficient term 1127 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1127 : Poly :=
[
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1127 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1127 : Poly :=
[
  term ((1413867376731274973664 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1127 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1127_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1127
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1127 := by
  native_decide

/-- Coefficient term 1128 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1128 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1128 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1128 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1128 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1128_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1128
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1128 := by
  native_decide

/-- Coefficient term 1129 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1129 : Poly :=
[
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1129 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1129 : Poly :=
[
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1129 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1129_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1129
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1129 := by
  native_decide

/-- Coefficient term 1130 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1130 : Poly :=
[
  term ((-273130920871422325454878675430830002993169 : Rat) / 4396352775071994240912540908485088809500) [(2, 2), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1130 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1130 : Poly :=
[
  term ((273130920871422325454878675430830002993169 : Rat) / 4396352775071994240912540908485088809500) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((-273130920871422325454878675430830002993169 : Rat) / 2198176387535997120456270454242544404750) [(2, 2), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1130 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1130_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1130
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1130 := by
  native_decide

/-- Coefficient term 1131 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1131 : Poly :=
[
  term ((2091069944162413861428 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1131 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1131 : Poly :=
[
  term ((4182139888324827722856 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2091069944162413861428 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1131 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1131_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1131
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1131 := by
  native_decide

/-- Coefficient term 1132 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1132 : Poly :=
[
  term ((513576756550936550888868970355299143187619 : Rat) / 13189058325215982722737622725455266428500) [(2, 2), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1132 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1132 : Poly :=
[
  term ((513576756550936550888868970355299143187619 : Rat) / 6594529162607991361368811362727633214250) [(2, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-513576756550936550888868970355299143187619 : Rat) / 13189058325215982722737622725455266428500) [(2, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1132 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1132_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1132
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1132 := by
  native_decide

/-- Coefficient term 1133 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1133 : Poly :=
[
  term ((-1310635105218320988276 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1133 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1133 : Poly :=
[
  term ((-2621270210436641976552 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1310635105218320988276 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1133 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1133_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1133
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1133 := by
  native_decide

/-- Coefficient term 1134 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1134 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 4396352775071994240912540908485088809500) [(2, 2), (9, 1), (11, 1)]
]

/-- Partial product 1134 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1134 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 4396352775071994240912540908485088809500) [(2, 2), (9, 1), (11, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1134 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1134_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1134
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1134 := by
  native_decide

/-- Coefficient term 1135 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1135 : Poly :=
[
  term ((469944438717751450092 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1135 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1135 : Poly :=
[
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-469944438717751450092 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1135 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1135_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1135
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1135 := by
  native_decide

/-- Coefficient term 1136 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1136 : Poly :=
[
  term ((-3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1136 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1136 : Poly :=
[
  term ((3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-7833803068741102637830075306656039288873812 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1136 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1136_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1136
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1136 := by
  native_decide

/-- Coefficient term 1137 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1137 : Poly :=
[
  term ((13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1137 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1137 : Poly :=
[
  term ((26655560707774604172864 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1137 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1137_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1137
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1137 := by
  native_decide

/-- Coefficient term 1138 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1138 : Poly :=
[
  term ((1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1138 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1138 : Poly :=
[
  term ((3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1138 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1138_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1138
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1138 := by
  native_decide

/-- Coefficient term 1139 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1139 : Poly :=
[
  term ((-6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1139 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1139 : Poly :=
[
  term ((-13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1139 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1139_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1139
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1139 := by
  native_decide

/-- Coefficient term 1140 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1140 : Poly :=
[
  term ((673270551989076737841078968079037792926926 : Rat) / 1978358748782397408410643408818289964275) [(2, 2), (9, 1), (13, 1)]
]

/-- Partial product 1140 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1140 : Poly :=
[
  term ((-673270551989076737841078968079037792926926 : Rat) / 1978358748782397408410643408818289964275) [(2, 2), (9, 1), (13, 1)],
  term ((1346541103978153475682157936158075585853852 : Rat) / 1978358748782397408410643408818289964275) [(2, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1140 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1140_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1140
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1140 := by
  native_decide

/-- Coefficient term 1141 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1141 : Poly :=
[
  term ((-2290892930780011531872 : Rat) / 867851652931479664231) [(2, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1141 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1141 : Poly :=
[
  term ((-4581785861560023063744 : Rat) / 867851652931479664231) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2290892930780011531872 : Rat) / 867851652931479664231) [(2, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1141 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1141_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1141
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1141 := by
  native_decide

/-- Coefficient term 1142 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1142 : Poly :=
[
  term ((-145278151340587786739123651173532601518873 : Rat) / 26378116650431965445475245450910532857000) [(2, 2), (9, 1), (15, 1)]
]

/-- Partial product 1142 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1142 : Poly :=
[
  term ((-145278151340587786739123651173532601518873 : Rat) / 13189058325215982722737622725455266428500) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 26378116650431965445475245450910532857000) [(2, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1142 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1142_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1142
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1142 := by
  native_decide

/-- Coefficient term 1143 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1143 : Poly :=
[
  term ((185373113891409044046 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1143 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1143 : Poly :=
[
  term ((370746227782818088092 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-185373113891409044046 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1143 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1143_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1143
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1143 := by
  native_decide

/-- Coefficient term 1144 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1144 : Poly :=
[
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 2), (10, 1)]
]

/-- Partial product 1144 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1144 : Poly :=
[
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 2), (10, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1144 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1144_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1144
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1144 := by
  native_decide

/-- Coefficient term 1145 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1145 : Poly :=
[
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1145 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1145 : Poly :=
[
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-52458011773967510031618059505117434183536 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1145 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1145_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1145
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1145 := by
  native_decide

/-- Coefficient term 1146 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1146 : Poly :=
[
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1146 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1146 : Poly :=
[
  term ((-1068655596849965797504 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1146 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1146_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1146
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1146 := by
  native_decide

/-- Coefficient term 1147 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1147 : Poly :=
[
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1147 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1147 : Poly :=
[
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1147 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1147_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1147
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1147 := by
  native_decide

/-- Coefficient term 1148 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1148 : Poly :=
[
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1148 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1148 : Poly :=
[
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1148 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1148_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1148
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1148 := by
  native_decide

/-- Coefficient term 1149 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1149 : Poly :=
[
  term ((35694332394147136908335762352989813553994 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1149 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1149 : Poly :=
[
  term ((-35694332394147136908335762352989813553994 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((71388664788294273816671524705979627107988 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1149 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1149_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1149
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1149 := by
  native_decide

/-- Coefficient term 1150 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1150 : Poly :=
[
  term ((-1580511465226792642608 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1150 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1150 : Poly :=
[
  term ((-3161022930453585285216 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1580511465226792642608 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1150 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1150_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1150
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1150 := by
  native_decide

/-- Coefficient term 1151 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1151 : Poly :=
[
  term ((-30591118440109919723670742495995842875694 : Rat) / 366362731255999520076045075707090734125) [(2, 2), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1151 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1151 : Poly :=
[
  term ((-61182236880219839447341484991991685751388 : Rat) / 366362731255999520076045075707090734125) [(2, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((30591118440109919723670742495995842875694 : Rat) / 366362731255999520076045075707090734125) [(2, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1151 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1151_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1151
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1151 := by
  native_decide

/-- Coefficient term 1152 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1152 : Poly :=
[
  term ((990628657022764908336 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1152 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1152 : Poly :=
[
  term ((1981257314045529816672 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-990628657022764908336 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1152 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1152_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1152
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1152 := by
  native_decide

/-- Coefficient term 1153 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1153 : Poly :=
[
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1153 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1153 : Poly :=
[
  term ((36835390982492778685195646298362401986406178383469056033564392934206402026 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1153 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1153_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1153
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1153 := by
  native_decide

/-- Coefficient term 1154 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1154 : Poly :=
[
  term ((-1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1154 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1154 : Poly :=
[
  term ((-2093978030838850705456 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1154 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1154_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1154
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1154 := by
  native_decide

/-- Coefficient term 1155 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1155 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 2), (10, 1), (12, 1), (13, 2)]
]

/-- Partial product 1155 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1155 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 2), (10, 1), (12, 1), (13, 2)],
  term ((114763001504190054808868916461224119038042 : Rat) / 1187015249269438445046386045290973978565) [(2, 2), (10, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1155 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1155_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1155
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1155 := by
  native_decide

/-- Coefficient term 1156 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1156 : Poly :=
[
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1156 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1156 : Poly :=
[
  term ((18950625794701781122592 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1156 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1156_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1156
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1156 := by
  native_decide

/-- Coefficient term 1157 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1157 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 2), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 1157 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1157 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 2), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1157 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1157_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1157
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1157 := by
  native_decide

/-- Coefficient term 1158 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1158 : Poly :=
[
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1158 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1158 : Poly :=
[
  term ((-2081612327941872 : Rat) / 7342292683791569) [(2, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1158 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1158_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1158
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1158 := by
  native_decide

/-- Coefficient term 1159 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1159 : Poly :=
[
  term ((-159890453419223161302852877636819707188893950076011430049372668939451478517 : Rat) / 1210581162297738828878685649650017882668768357655870959525619759498121960) [(2, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1159 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1159 : Poly :=
[
  term ((-159890453419223161302852877636819707188893950076011430049372668939451478517 : Rat) / 605290581148869414439342824825008941334384178827935479762809879749060980) [(2, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((159890453419223161302852877636819707188893950076011430049372668939451478517 : Rat) / 1210581162297738828878685649650017882668768357655870959525619759498121960) [(2, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1159 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1159_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1159
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1159 := by
  native_decide

/-- Coefficient term 1160 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1160 : Poly :=
[
  term ((-11017282537334514725096 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1160 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1160 : Poly :=
[
  term ((-22034565074669029450192 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11017282537334514725096 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1160 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1160_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1160
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1160 := by
  native_decide

/-- Coefficient term 1161 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1161 : Poly :=
[
  term ((75436106697828246589899857340324070120879 : Rat) / 527562333008639308909504909018210657140) [(2, 2), (10, 1), (13, 2)]
]

/-- Partial product 1161 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1161 : Poly :=
[
  term ((-75436106697828246589899857340324070120879 : Rat) / 527562333008639308909504909018210657140) [(2, 2), (10, 1), (13, 2)],
  term ((75436106697828246589899857340324070120879 : Rat) / 263781166504319654454752454509105328570) [(2, 2), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1161 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1161_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1161
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1161 := by
  native_decide

/-- Coefficient term 1162 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1162 : Poly :=
[
  term ((9342480224697323925828 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1162 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1162 : Poly :=
[
  term ((18684960449394647851656 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9342480224697323925828 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1162 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1162_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1162
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1162 := by
  native_decide

/-- Coefficient term 1163 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1163 : Poly :=
[
  term ((-8365090030717008544414051542794125266371203798849719033157671857 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 2), (10, 1), (15, 2)]
]

/-- Partial product 1163 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1163 : Poly :=
[
  term ((-8365090030717008544414051542794125266371203798849719033157671857 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 2), (10, 1), (14, 1), (15, 2)],
  term ((8365090030717008544414051542794125266371203798849719033157671857 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1163 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1163_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1163
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1163 := by
  native_decide

/-- Coefficient term 1164 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1164 : Poly :=
[
  term ((3586292146721196 : Rat) / 7342292683791569) [(2, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1164 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1164 : Poly :=
[
  term ((7172584293442392 : Rat) / 7342292683791569) [(2, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3586292146721196 : Rat) / 7342292683791569) [(2, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1164 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1164_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1164
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1164 := by
  native_decide

/-- Coefficient term 1165 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1165 : Poly :=
[
  term ((3226285990191328171 : Rat) / 1526147979273818985) [(2, 2), (10, 1), (16, 1)]
]

/-- Partial product 1165 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1165 : Poly :=
[
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((-3226285990191328171 : Rat) / 1526147979273818985) [(2, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1165 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1165_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1165
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1165 := by
  native_decide

/-- Coefficient term 1166 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1166 : Poly :=
[
  term ((-273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1166 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1166 : Poly :=
[
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-546010123283707123557216904387544999281666631321732310445611407494 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1166 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1166_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1166
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1166 := by
  native_decide

/-- Coefficient term 1167 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1167 : Poly :=
[
  term ((-10073651392747090324352 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1167 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1167 : Poly :=
[
  term ((-20147302785494180648704 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10073651392747090324352 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1167 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1167_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1167
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1167 := by
  native_decide

/-- Coefficient term 1168 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1168 : Poly :=
[
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1168 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1168 : Poly :=
[
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1168 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1168_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1168
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1168 := by
  native_decide

/-- Coefficient term 1169 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1169 : Poly :=
[
  term ((5036825696373545162176 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1169 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1169 : Poly :=
[
  term ((10073651392747090324352 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5036825696373545162176 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1169 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1169_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1169
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1169 := by
  native_decide

/-- Coefficient term 1170 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1170 : Poly :=
[
  term ((-6246905073399324825504438858413216606995608032268318175047844265950458115932199 : Rat) / 14091164729145679968147900961926208154264463683114337968878214000558139614400) [(2, 2), (11, 1), (13, 1)]
]

/-- Partial product 1170 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1170 : Poly :=
[
  term ((6246905073399324825504438858413216606995608032268318175047844265950458115932199 : Rat) / 14091164729145679968147900961926208154264463683114337968878214000558139614400) [(2, 2), (11, 1), (13, 1)],
  term ((-6246905073399324825504438858413216606995608032268318175047844265950458115932199 : Rat) / 7045582364572839984073950480963104077132231841557168984439107000279069807200) [(2, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1170 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1170_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1170
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1170 := by
  native_decide

/-- Coefficient term 1171 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1171 : Poly :=
[
  term ((-5699920297454560765803608 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1171 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1171 : Poly :=
[
  term ((-11399840594909121531607216 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5699920297454560765803608 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1171 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1171_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1171
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1171 := by
  native_decide

/-- Coefficient term 1172 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1172 : Poly :=
[
  term ((582933715480619764582106025508232058345816103676473390456921260599896794276925637 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 2), (11, 1), (15, 1)]
]

/-- Partial product 1172 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1172 : Poly :=
[
  term ((582933715480619764582106025508232058345816103676473390456921260599896794276925637 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-582933715480619764582106025508232058345816103676473390456921260599896794276925637 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1172 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1172_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1172
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1172 := by
  native_decide

/-- Coefficient term 1173 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1173 : Poly :=
[
  term ((11501618884258829662817098 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1173 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1173 : Poly :=
[
  term ((23003237768517659325634196 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11501618884258829662817098 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1173 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1173_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1173
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1173 := by
  native_decide

/-- Coefficient term 1174 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1174 : Poly :=
[
  term ((3871943576043257570909536848399176327966 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (11, 2)]
]

/-- Partial product 1174 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1174 : Poly :=
[
  term ((-3871943576043257570909536848399176327966 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (11, 2)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1174 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1174_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1174
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1174 := by
  native_decide

/-- Coefficient term 1175 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1175 : Poly :=
[
  term ((-355202165994733580112 : Rat) / 619894037808199760165) [(2, 2), (11, 2), (16, 1)]
]

/-- Partial product 1175 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1175 : Poly :=
[
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((355202165994733580112 : Rat) / 619894037808199760165) [(2, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1175 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1175_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1175
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1175 := by
  native_decide

/-- Coefficient term 1176 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1176 : Poly :=
[
  term ((3318313078603287576983877156303853635958595175401728724156056044139560223426901 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (12, 1)]
]

/-- Partial product 1176 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1176 : Poly :=
[
  term ((-3318313078603287576983877156303853635958595175401728724156056044139560223426901 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (12, 1)],
  term ((3318313078603287576983877156303853635958595175401728724156056044139560223426901 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1176 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1176_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1176
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1176 := by
  native_decide

/-- Coefficient term 1177 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1177 : Poly :=
[
  term ((-1049055638863849074459642576528492648446762762251854844700782880971707412069002395437 : Rat) / 137811591051044750088486471407638315748706454820858225335628932925458605428832000) [(2, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1177 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1177 : Poly :=
[
  term ((-1049055638863849074459642576528492648446762762251854844700782880971707412069002395437 : Rat) / 68905795525522375044243235703819157874353227410429112667814466462729302714416000) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1049055638863849074459642576528492648446762762251854844700782880971707412069002395437 : Rat) / 137811591051044750088486471407638315748706454820858225335628932925458605428832000) [(2, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1177 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1177_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1177
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1177 := by
  native_decide

/-- Coefficient term 1178 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1178 : Poly :=
[
  term ((-581260440891196284422141524 : Rat) / 3788172465045908734368315) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1178 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1178 : Poly :=
[
  term ((-1162520881782392568844283048 : Rat) / 3788172465045908734368315) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((581260440891196284422141524 : Rat) / 3788172465045908734368315) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1178 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1178_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1178
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1178 := by
  native_decide

/-- Coefficient term 1179 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1179 : Poly :=
[
  term ((302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 2), (12, 1), (13, 2)]
]

/-- Partial product 1179 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1179 : Poly :=
[
  term ((-302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 2), (12, 1), (13, 2)],
  term ((605872184835791303662719716414797725867559653636529948718236101244 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1179 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1179_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1179
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1179 := by
  native_decide

/-- Coefficient term 1180 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1180 : Poly :=
[
  term ((178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 2), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1180 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1180 : Poly :=
[
  term ((357275063159620119200192 : Rat) / 13017774793972194963465) [(2, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1180 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1180_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1180
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1180 := by
  native_decide

/-- Coefficient term 1181 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1181 : Poly :=
[
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (12, 1), (15, 2)]
]

/-- Partial product 1181 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1181 : Poly :=
[
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 2), (12, 1), (14, 1), (15, 2)],
  term ((-58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1181 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1181_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1181
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1181 := by
  native_decide

/-- Coefficient term 1182 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1182 : Poly :=
[
  term ((2348872156474817556622 : Rat) / 32049107564750198685) [(2, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1182 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1182 : Poly :=
[
  term ((4697744312949635113244 : Rat) / 32049107564750198685) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2348872156474817556622 : Rat) / 32049107564750198685) [(2, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1182 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1182_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1182
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1182 := by
  native_decide

/-- Coefficient term 1183 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1183 : Poly :=
[
  term ((33949042861169148751 : Rat) / 4578443937821456955) [(2, 2), (12, 1), (16, 1)]
]

/-- Partial product 1183 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1183 : Poly :=
[
  term ((67898085722338297502 : Rat) / 4578443937821456955) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-33949042861169148751 : Rat) / 4578443937821456955) [(2, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1183 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1183_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1183
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1183 := by
  native_decide

/-- Coefficient term 1184 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1184 : Poly :=
[
  term ((796498836796994305670707077525337832747246468392103154752555010903228506540317072409 : Rat) / 110249272840835800070789177126110652598965163856686580268503146340366884343065600) [(2, 2), (13, 1), (15, 1)]
]

/-- Partial product 1184 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1184 : Poly :=
[
  term ((796498836796994305670707077525337832747246468392103154752555010903228506540317072409 : Rat) / 55124636420417900035394588563055326299482581928343290134251573170183442171532800) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-796498836796994305670707077525337832747246468392103154752555010903228506540317072409 : Rat) / 110249272840835800070789177126110652598965163856686580268503146340366884343065600) [(2, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1184 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1184_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1184
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1184 := by
  native_decide

/-- Coefficient term 1185 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1185 : Poly :=
[
  term ((549568413709244266218085483 : Rat) / 3788172465045908734368315) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1185 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1185 : Poly :=
[
  term ((1099136827418488532436170966 : Rat) / 3788172465045908734368315) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-549568413709244266218085483 : Rat) / 3788172465045908734368315) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1185 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1185_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1185
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1185 := by
  native_decide

/-- Coefficient term 1186 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1186 : Poly :=
[
  term ((-615614566789194713101186999314455166569699987746744332143853084535941176105571332693 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(2, 2), (13, 2)]
]

/-- Partial product 1186 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1186 : Poly :=
[
  term ((615614566789194713101186999314455166569699987746744332143853084535941176105571332693 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(2, 2), (13, 2)],
  term ((-615614566789194713101186999314455166569699987746744332143853084535941176105571332693 : Rat) / 321560379119104416873135099951156070080315061248669192449800843492736746000608000) [(2, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1186 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1186_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1186
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1186 := by
  native_decide

/-- Coefficient term 1187 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1187 : Poly :=
[
  term ((-18801398207553422881229806 : Rat) / 1262724155015302911456105) [(2, 2), (13, 2), (16, 1)]
]

/-- Partial product 1187 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1187 : Poly :=
[
  term ((-37602796415106845762459612 : Rat) / 1262724155015302911456105) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((18801398207553422881229806 : Rat) / 1262724155015302911456105) [(2, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1187 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1187_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1187
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1187 := by
  native_decide

/-- Coefficient term 1188 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1188 : Poly :=
[
  term ((-58499166612828934998073640909404500756715250102358285244189137669737127648870941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 2), (15, 2)]
]

/-- Partial product 1188 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1188 : Poly :=
[
  term ((-58499166612828934998073640909404500756715250102358285244189137669737127648870941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 2), (14, 1), (15, 2)],
  term ((58499166612828934998073640909404500756715250102358285244189137669737127648870941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1188 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1188_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1188
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1188 := by
  native_decide

/-- Coefficient term 1189 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1189 : Poly :=
[
  term ((-1061185234023001449191 : Rat) / 64098215129500397370) [(2, 2), (15, 2), (16, 1)]
]

/-- Partial product 1189 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1189 : Poly :=
[
  term ((-1061185234023001449191 : Rat) / 32049107564750198685) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((1061185234023001449191 : Rat) / 64098215129500397370) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1189 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1189_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1189
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1189 := by
  native_decide

/-- Coefficient term 1190 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1190 : Poly :=
[
  term ((13121621472624120005293 : Rat) / 256392860518001589480) [(2, 2), (16, 1)]
]

/-- Partial product 1190 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1190 : Poly :=
[
  term ((13121621472624120005293 : Rat) / 128196430259000794740) [(2, 2), (14, 1), (16, 1)],
  term ((-13121621472624120005293 : Rat) / 256392860518001589480) [(2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1190 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1190_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1190
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1190 := by
  native_decide

/-- Coefficient term 1191 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1191 : Poly :=
[
  term ((-17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 673113401264537535986204847689393440533369372790938069303115691214238464000) [(2, 3)]
]

/-- Partial product 1191 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1191 : Poly :=
[
  term ((17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 673113401264537535986204847689393440533369372790938069303115691214238464000) [(2, 3)],
  term ((-17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(2, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1191 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1191_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1191
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1191 := by
  native_decide

/-- Coefficient term 1192 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1192 : Poly :=
[
  term ((-1157892799853546297 : Rat) / 660806341541241210) [(2, 3), (16, 1)]
]

/-- Partial product 1192 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1192 : Poly :=
[
  term ((-1157892799853546297 : Rat) / 330403170770620605) [(2, 3), (14, 1), (16, 1)],
  term ((1157892799853546297 : Rat) / 660806341541241210) [(2, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1192 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1192_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1192
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1192 := by
  native_decide

/-- Coefficient term 1193 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1193 : Poly :=
[
  term ((-157656694650458387768209900823532482809983190477702220800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1)]
]

/-- Partial product 1193 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1193 : Poly :=
[
  term ((157656694650458387768209900823532482809983190477702220800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1)],
  term ((-315313389300916775536419801647064965619966380955404441600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1193 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1193_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1193
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1193 := by
  native_decide

/-- Coefficient term 1194 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1194 : Poly :=
[
  term ((512637478365358335724586968737624170534157309738130278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1)]
]

/-- Partial product 1194 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1194 : Poly :=
[
  term ((-512637478365358335724586968737624170534157309738130278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1)],
  term ((1025274956730716671449173937475248341068314619476260556800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1194 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1194_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1194
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1194 := by
  native_decide

/-- Coefficient term 1195 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1195 : Poly :=
[
  term ((6994449201054531640844037030610303886546877153016627200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1)]
]

/-- Partial product 1195 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1195 : Poly :=
[
  term ((-6994449201054531640844037030610303886546877153016627200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1)],
  term ((13988898402109063281688074061220607773093754306033254400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1195 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1195_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1195
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1195 := by
  native_decide

/-- Coefficient term 1196 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1196 : Poly :=
[
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1)]
]

/-- Partial product 1196 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1196 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1196 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1196_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1196
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1196 := by
  native_decide

/-- Coefficient term 1197 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1197 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1)]
]

/-- Partial product 1197 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1197 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1197 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1197_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1197
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1197 := by
  native_decide

/-- Coefficient term 1198 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1198 : Poly :=
[
  term ((60856303022127600456481879373760341040803488677673164800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (12, 1)]
]

/-- Partial product 1198 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1198 : Poly :=
[
  term ((-60856303022127600456481879373760341040803488677673164800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (12, 1)],
  term ((121712606044255200912963758747520682081606977355346329600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1198 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1198_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1198
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1198 := by
  native_decide

/-- Coefficient term 1199 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1199 : Poly :=
[
  term ((-35495855592132789487363025042619146105822310319250636800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (14, 1)]
]

/-- Partial product 1199 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1199 : Poly :=
[
  term ((35495855592132789487363025042619146105822310319250636800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (14, 1)],
  term ((-70991711184265578974726050085238292211644620638501273600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1199 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1199_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1199
        rs_R009_ueqv_R009NYNYN_generator_28_1100_1199 =
      rs_R009_ueqv_R009NYNYN_partial_28_1199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1100_1199 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1100,
  rs_R009_ueqv_R009NYNYN_partial_28_1101,
  rs_R009_ueqv_R009NYNYN_partial_28_1102,
  rs_R009_ueqv_R009NYNYN_partial_28_1103,
  rs_R009_ueqv_R009NYNYN_partial_28_1104,
  rs_R009_ueqv_R009NYNYN_partial_28_1105,
  rs_R009_ueqv_R009NYNYN_partial_28_1106,
  rs_R009_ueqv_R009NYNYN_partial_28_1107,
  rs_R009_ueqv_R009NYNYN_partial_28_1108,
  rs_R009_ueqv_R009NYNYN_partial_28_1109,
  rs_R009_ueqv_R009NYNYN_partial_28_1110,
  rs_R009_ueqv_R009NYNYN_partial_28_1111,
  rs_R009_ueqv_R009NYNYN_partial_28_1112,
  rs_R009_ueqv_R009NYNYN_partial_28_1113,
  rs_R009_ueqv_R009NYNYN_partial_28_1114,
  rs_R009_ueqv_R009NYNYN_partial_28_1115,
  rs_R009_ueqv_R009NYNYN_partial_28_1116,
  rs_R009_ueqv_R009NYNYN_partial_28_1117,
  rs_R009_ueqv_R009NYNYN_partial_28_1118,
  rs_R009_ueqv_R009NYNYN_partial_28_1119,
  rs_R009_ueqv_R009NYNYN_partial_28_1120,
  rs_R009_ueqv_R009NYNYN_partial_28_1121,
  rs_R009_ueqv_R009NYNYN_partial_28_1122,
  rs_R009_ueqv_R009NYNYN_partial_28_1123,
  rs_R009_ueqv_R009NYNYN_partial_28_1124,
  rs_R009_ueqv_R009NYNYN_partial_28_1125,
  rs_R009_ueqv_R009NYNYN_partial_28_1126,
  rs_R009_ueqv_R009NYNYN_partial_28_1127,
  rs_R009_ueqv_R009NYNYN_partial_28_1128,
  rs_R009_ueqv_R009NYNYN_partial_28_1129,
  rs_R009_ueqv_R009NYNYN_partial_28_1130,
  rs_R009_ueqv_R009NYNYN_partial_28_1131,
  rs_R009_ueqv_R009NYNYN_partial_28_1132,
  rs_R009_ueqv_R009NYNYN_partial_28_1133,
  rs_R009_ueqv_R009NYNYN_partial_28_1134,
  rs_R009_ueqv_R009NYNYN_partial_28_1135,
  rs_R009_ueqv_R009NYNYN_partial_28_1136,
  rs_R009_ueqv_R009NYNYN_partial_28_1137,
  rs_R009_ueqv_R009NYNYN_partial_28_1138,
  rs_R009_ueqv_R009NYNYN_partial_28_1139,
  rs_R009_ueqv_R009NYNYN_partial_28_1140,
  rs_R009_ueqv_R009NYNYN_partial_28_1141,
  rs_R009_ueqv_R009NYNYN_partial_28_1142,
  rs_R009_ueqv_R009NYNYN_partial_28_1143,
  rs_R009_ueqv_R009NYNYN_partial_28_1144,
  rs_R009_ueqv_R009NYNYN_partial_28_1145,
  rs_R009_ueqv_R009NYNYN_partial_28_1146,
  rs_R009_ueqv_R009NYNYN_partial_28_1147,
  rs_R009_ueqv_R009NYNYN_partial_28_1148,
  rs_R009_ueqv_R009NYNYN_partial_28_1149,
  rs_R009_ueqv_R009NYNYN_partial_28_1150,
  rs_R009_ueqv_R009NYNYN_partial_28_1151,
  rs_R009_ueqv_R009NYNYN_partial_28_1152,
  rs_R009_ueqv_R009NYNYN_partial_28_1153,
  rs_R009_ueqv_R009NYNYN_partial_28_1154,
  rs_R009_ueqv_R009NYNYN_partial_28_1155,
  rs_R009_ueqv_R009NYNYN_partial_28_1156,
  rs_R009_ueqv_R009NYNYN_partial_28_1157,
  rs_R009_ueqv_R009NYNYN_partial_28_1158,
  rs_R009_ueqv_R009NYNYN_partial_28_1159,
  rs_R009_ueqv_R009NYNYN_partial_28_1160,
  rs_R009_ueqv_R009NYNYN_partial_28_1161,
  rs_R009_ueqv_R009NYNYN_partial_28_1162,
  rs_R009_ueqv_R009NYNYN_partial_28_1163,
  rs_R009_ueqv_R009NYNYN_partial_28_1164,
  rs_R009_ueqv_R009NYNYN_partial_28_1165,
  rs_R009_ueqv_R009NYNYN_partial_28_1166,
  rs_R009_ueqv_R009NYNYN_partial_28_1167,
  rs_R009_ueqv_R009NYNYN_partial_28_1168,
  rs_R009_ueqv_R009NYNYN_partial_28_1169,
  rs_R009_ueqv_R009NYNYN_partial_28_1170,
  rs_R009_ueqv_R009NYNYN_partial_28_1171,
  rs_R009_ueqv_R009NYNYN_partial_28_1172,
  rs_R009_ueqv_R009NYNYN_partial_28_1173,
  rs_R009_ueqv_R009NYNYN_partial_28_1174,
  rs_R009_ueqv_R009NYNYN_partial_28_1175,
  rs_R009_ueqv_R009NYNYN_partial_28_1176,
  rs_R009_ueqv_R009NYNYN_partial_28_1177,
  rs_R009_ueqv_R009NYNYN_partial_28_1178,
  rs_R009_ueqv_R009NYNYN_partial_28_1179,
  rs_R009_ueqv_R009NYNYN_partial_28_1180,
  rs_R009_ueqv_R009NYNYN_partial_28_1181,
  rs_R009_ueqv_R009NYNYN_partial_28_1182,
  rs_R009_ueqv_R009NYNYN_partial_28_1183,
  rs_R009_ueqv_R009NYNYN_partial_28_1184,
  rs_R009_ueqv_R009NYNYN_partial_28_1185,
  rs_R009_ueqv_R009NYNYN_partial_28_1186,
  rs_R009_ueqv_R009NYNYN_partial_28_1187,
  rs_R009_ueqv_R009NYNYN_partial_28_1188,
  rs_R009_ueqv_R009NYNYN_partial_28_1189,
  rs_R009_ueqv_R009NYNYN_partial_28_1190,
  rs_R009_ueqv_R009NYNYN_partial_28_1191,
  rs_R009_ueqv_R009NYNYN_partial_28_1192,
  rs_R009_ueqv_R009NYNYN_partial_28_1193,
  rs_R009_ueqv_R009NYNYN_partial_28_1194,
  rs_R009_ueqv_R009NYNYN_partial_28_1195,
  rs_R009_ueqv_R009NYNYN_partial_28_1196,
  rs_R009_ueqv_R009NYNYN_partial_28_1197,
  rs_R009_ueqv_R009NYNYN_partial_28_1198,
  rs_R009_ueqv_R009NYNYN_partial_28_1199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1100_1199 : Poly :=
[
  term ((4873343665239816268846 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((113786939695170375945020831 : Rat) / 1515268986018363493747326) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2436671832619908134423 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-113786939695170375945020831 : Rat) / 3030537972036726987494652) [(2, 1), (13, 2), (16, 1)],
  term ((-56401804282671232858219218719894578032711079203553595732474742541 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(2, 1), (13, 3), (14, 1), (15, 1)],
  term ((-8406953260384120586612 : Rat) / 13017774793972194963465) [(2, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((56401804282671232858219218719894578032711079203553595732474742541 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(2, 1), (13, 3), (15, 1)],
  term ((4203476630192060293306 : Rat) / 13017774793972194963465) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (13, 4)],
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (13, 4), (14, 1)],
  term ((-57206102401341232775004203240325462080527749754123047868998102315350682157336879 : Rat) / 1044671998762562255850589923613938619707789266571535883558435552764498096128000) [(2, 1), (14, 1)],
  term ((2017926438421471692804718642269730960052866804903204528849780525985442251341559563 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 1), (14, 1), (15, 2)],
  term ((5631864707965615260079 : Rat) / 36627551502571655640) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-125865484567884049270147 : Rat) / 1025571442072006357920) [(2, 1), (14, 1), (16, 1)],
  term ((57206102401341232775004203240325462080527749754123047868998102315350682157336879 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(2, 1), (14, 2)],
  term ((-92768633928039542531 : Rat) / 512785721036003178960) [(2, 1), (14, 2), (16, 1)],
  term ((-2017926438421471692804718642269730960052866804903204528849780525985442251341559563 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(2, 1), (15, 2)],
  term ((-5631864707965615260079 : Rat) / 73255103005143311280) [(2, 1), (15, 2), (16, 1)],
  term ((2999006028614573543159 : Rat) / 48836735336762207520) [(2, 1), (16, 1)],
  term ((-594187641182828674863965226110097961315810263088389306697994519942842073034810763 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 2)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(2, 2), (3, 1), (13, 1)],
  term ((12596598213959792 : Rat) / 1048898954827367) [(2, 2), (3, 1), (13, 1), (14, 1)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(2, 2), (3, 1), (14, 1), (15, 1)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(2, 2), (3, 1), (15, 1)],
  term ((22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-45780833228608074999769106881757461433058406794736435200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (13, 1)],
  term ((45780833228608074999769106881757461433058406794736435200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (14, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (10, 1), (15, 1)],
  term ((1609482418193252636710632663811785753505959613877452800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (11, 1)],
  term ((-3218964836386505273421265327623571507011919227754905600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (11, 1), (14, 1)],
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (13, 1)],
  term ((36342199934724380283596278252794865234691377816825856000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18171099967362190141798139126397432617345688908412928000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((9085549983681095070899069563198716308672844454206464000 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((920896226401130686161906888493196955655452249172889600 : Rat) / 173433167502533793224162752212389262107675610420778337) [(2, 2), (5, 1), (13, 1)],
  term ((-1841792452802261372323813776986393911310904498345779200 : Rat) / 173433167502533793224162752212389262107675610420778337) [(2, 2), (5, 1), (13, 1), (14, 1)],
  term ((6994449201054531640844037030610303886546877153016627200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (14, 1), (15, 1)],
  term ((-3497224600527265820422018515305151943273438576508313600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(2, 2), (5, 1), (15, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(2, 2), (7, 1), (13, 1)],
  term ((50386392855839168 : Rat) / 3146696864482101) [(2, 2), (7, 1), (13, 1), (14, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(2, 2), (7, 1), (15, 1)],
  term ((-2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 340616000598160244724040473195354762592007998209178418692887515378016000) [(2, 2), (8, 1)],
  term ((2194334436318995273751017636892269691691923178055833362526886120902359857 : Rat) / 170308000299080122362020236597677381296003999104589209346443757689008000) [(2, 2), (8, 1), (14, 1)],
  term ((-21296177205896817848 : Rat) / 10683035854916732895) [(2, 2), (8, 1), (14, 1), (16, 1)],
  term ((10648088602948408924 : Rat) / 10683035854916732895) [(2, 2), (8, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-415521500975212250826203828836216554791462 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((1413867376731274973664 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((273130920871422325454878675430830002993169 : Rat) / 4396352775071994240912540908485088809500) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((-273130920871422325454878675430830002993169 : Rat) / 2198176387535997120456270454242544404750) [(2, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((4182139888324827722856 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2091069944162413861428 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((513576756550936550888868970355299143187619 : Rat) / 6594529162607991361368811362727633214250) [(2, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-2621270210436641976552 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-513576756550936550888868970355299143187619 : Rat) / 13189058325215982722737622725455266428500) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((1310635105218320988276 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 4396352775071994240912540908485088809500) [(2, 2), (9, 1), (11, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-469944438717751450092 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-7833803068741102637830075306656039288873812 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((26655560707774604172864 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-673270551989076737841078968079037792926926 : Rat) / 1978358748782397408410643408818289964275) [(2, 2), (9, 1), (13, 1)],
  term ((1346541103978153475682157936158075585853852 : Rat) / 1978358748782397408410643408818289964275) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-4581785861560023063744 : Rat) / 867851652931479664231) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2290892930780011531872 : Rat) / 867851652931479664231) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 13189058325215982722737622725455266428500) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((370746227782818088092 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 26378116650431965445475245450910532857000) [(2, 2), (9, 1), (15, 1)],
  term ((-185373113891409044046 : Rat) / 4339258264657398321155) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 8345092014654925995738991593286191683504195956124871257975744126761392000) [(2, 2), (10, 1)],
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-52458011773967510031618059505117434183536 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1068655596849965797504 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-35694332394147136908335762352989813553994 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((71388664788294273816671524705979627107988 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3161022930453585285216 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1580511465226792642608 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-61182236880219839447341484991991685751388 : Rat) / 366362731255999520076045075707090734125) [(2, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1981257314045529816672 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((30591118440109919723670742495995842875694 : Rat) / 366362731255999520076045075707090734125) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-990628657022764908336 : Rat) / 619894037808199760165) [(2, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((36835390982492778685195646298362401986406178383469056033564392934206402026 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2093978030838850705456 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 2), (10, 1), (12, 1), (13, 2)],
  term ((114763001504190054808868916461224119038042 : Rat) / 1187015249269438445046386045290973978565) [(2, 2), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((18950625794701781122592 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 2), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2081612327941872 : Rat) / 7342292683791569) [(2, 2), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 2), (10, 1), (12, 1), (15, 2)],
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-159890453419223161302852877636819707188893950076011430049372668939451478517 : Rat) / 605290581148869414439342824825008941334384178827935479762809879749060980) [(2, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-22034565074669029450192 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((159890453419223161302852877636819707188893950076011430049372668939451478517 : Rat) / 1210581162297738828878685649650017882668768357655870959525619759498121960) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((11017282537334514725096 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75436106697828246589899857340324070120879 : Rat) / 527562333008639308909504909018210657140) [(2, 2), (10, 1), (13, 2)],
  term ((75436106697828246589899857340324070120879 : Rat) / 263781166504319654454752454509105328570) [(2, 2), (10, 1), (13, 2), (14, 1)],
  term ((18684960449394647851656 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9342480224697323925828 : Rat) / 4339258264657398321155) [(2, 2), (10, 1), (13, 2), (16, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 2), (10, 1), (14, 1)],
  term ((-8365090030717008544414051542794125266371203798849719033157671857 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 2), (10, 1), (14, 1), (15, 2)],
  term ((7172584293442392 : Rat) / 7342292683791569) [(2, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 2), (10, 1), (14, 1), (16, 1)],
  term ((8365090030717008544414051542794125266371203798849719033157671857 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 2), (10, 1), (15, 2)],
  term ((-3586292146721196 : Rat) / 7342292683791569) [(2, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3226285990191328171 : Rat) / 1526147979273818985) [(2, 2), (10, 1), (16, 1)],
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-546010123283707123557216904387544999281666631321732310445611407494 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-20147302785494180648704 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10073651392747090324352 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((10073651392747090324352 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-5036825696373545162176 : Rat) / 619894037808199760165) [(2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6246905073399324825504438858413216606995608032268318175047844265950458115932199 : Rat) / 14091164729145679968147900961926208154264463683114337968878214000558139614400) [(2, 2), (11, 1), (13, 1)],
  term ((-6246905073399324825504438858413216606995608032268318175047844265950458115932199 : Rat) / 7045582364572839984073950480963104077132231841557168984439107000279069807200) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-11399840594909121531607216 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5699920297454560765803608 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((582933715480619764582106025508232058345816103676473390456921260599896794276925637 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((23003237768517659325634196 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-582933715480619764582106025508232058345816103676473390456921260599896794276925637 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 2), (11, 1), (15, 1)],
  term ((-11501618884258829662817098 : Rat) / 1262724155015302911456105) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-3871943576043257570909536848399176327966 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (11, 2)],
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 2), (11, 2), (14, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 2), (11, 2), (14, 1), (16, 1)],
  term ((355202165994733580112 : Rat) / 619894037808199760165) [(2, 2), (11, 2), (16, 1)],
  term ((-3318313078603287576983877156303853635958595175401728724156056044139560223426901 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (12, 1)],
  term ((-1049055638863849074459642576528492648446762762251854844700782880971707412069002395437 : Rat) / 68905795525522375044243235703819157874353227410429112667814466462729302714416000) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1162520881782392568844283048 : Rat) / 3788172465045908734368315) [(2, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1049055638863849074459642576528492648446762762251854844700782880971707412069002395437 : Rat) / 137811591051044750088486471407638315748706454820858225335628932925458605428832000) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((581260440891196284422141524 : Rat) / 3788172465045908734368315) [(2, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 2), (12, 1), (13, 2)],
  term ((605872184835791303662719716414797725867559653636529948718236101244 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 2), (12, 1), (13, 2), (14, 1)],
  term ((357275063159620119200192 : Rat) / 13017774793972194963465) [(2, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 2), (12, 1), (13, 2), (16, 1)],
  term ((3318313078603287576983877156303853635958595175401728724156056044139560223426901 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 2), (12, 1), (14, 1)],
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 2), (12, 1), (14, 1), (15, 2)],
  term ((4697744312949635113244 : Rat) / 32049107564750198685) [(2, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((67898085722338297502 : Rat) / 4578443937821456955) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((-58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 2), (12, 1), (15, 2)],
  term ((-2348872156474817556622 : Rat) / 32049107564750198685) [(2, 2), (12, 1), (15, 2), (16, 1)],
  term ((-33949042861169148751 : Rat) / 4578443937821456955) [(2, 2), (12, 1), (16, 1)],
  term ((796498836796994305670707077525337832747246468392103154752555010903228506540317072409 : Rat) / 55124636420417900035394588563055326299482581928343290134251573170183442171532800) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((1099136827418488532436170966 : Rat) / 3788172465045908734368315) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-796498836796994305670707077525337832747246468392103154752555010903228506540317072409 : Rat) / 110249272840835800070789177126110652598965163856686580268503146340366884343065600) [(2, 2), (13, 1), (15, 1)],
  term ((-549568413709244266218085483 : Rat) / 3788172465045908734368315) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((615614566789194713101186999314455166569699987746744332143853084535941176105571332693 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(2, 2), (13, 2)],
  term ((-615614566789194713101186999314455166569699987746744332143853084535941176105571332693 : Rat) / 321560379119104416873135099951156070080315061248669192449800843492736746000608000) [(2, 2), (13, 2), (14, 1)],
  term ((-37602796415106845762459612 : Rat) / 1262724155015302911456105) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((18801398207553422881229806 : Rat) / 1262724155015302911456105) [(2, 2), (13, 2), (16, 1)],
  term ((594187641182828674863965226110097961315810263088389306697994519942842073034810763 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(2, 2), (14, 1)],
  term ((-58499166612828934998073640909404500756715250102358285244189137669737127648870941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 2), (14, 1), (15, 2)],
  term ((-1061185234023001449191 : Rat) / 32049107564750198685) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((13121621472624120005293 : Rat) / 128196430259000794740) [(2, 2), (14, 1), (16, 1)],
  term ((58499166612828934998073640909404500756715250102358285244189137669737127648870941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 2), (15, 2)],
  term ((1061185234023001449191 : Rat) / 64098215129500397370) [(2, 2), (15, 2), (16, 1)],
  term ((-13121621472624120005293 : Rat) / 256392860518001589480) [(2, 2), (16, 1)],
  term ((17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 673113401264537535986204847689393440533369372790938069303115691214238464000) [(2, 3)],
  term ((-17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(2, 3), (14, 1)],
  term ((-1157892799853546297 : Rat) / 330403170770620605) [(2, 3), (14, 1), (16, 1)],
  term ((1157892799853546297 : Rat) / 660806341541241210) [(2, 3), (16, 1)],
  term ((157656694650458387768209900823532482809983190477702220800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1)],
  term ((-512637478365358335724586968737624170534157309738130278400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1)],
  term ((-6994449201054531640844037030610303886546877153016627200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1)],
  term ((-22890416614304037499884553440878730716529203397368217600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (14, 1)],
  term ((8266294248533053906716935701000925093961453456691200000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 2)],
  term ((-60856303022127600456481879373760341040803488677673164800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (12, 1)],
  term ((121712606044255200912963758747520682081606977355346329600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1)],
  term ((353590270774283153645512320839289162391378976598503731200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (14, 1)],
  term ((-70991711184265578974726050085238292211644620638501273600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (8, 1), (14, 2)],
  term ((-315313389300916775536419801647064965619966380955404441600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1100 through 1199. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1100_1199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1100_1199
      rs_R009_ueqv_R009NYNYN_block_28_1100_1199 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
