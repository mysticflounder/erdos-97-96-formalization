/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 30:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0100 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 100 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0100 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0100_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0100
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0101 : Poly :=
[
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0101 : Poly :=
[
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0101_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0101
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0102 : Poly :=
[
  term ((-18305918589982468034911134172984037251286856461499761040270502 : Rat) / 664812614540295144585577654302537623285240794615424827481625) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 102 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0102 : Poly :=
[
  term ((-36611837179964936069822268345968074502573712922999522080541004 : Rat) / 664812614540295144585577654302537623285240794615424827481625) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((18305918589982468034911134172984037251286856461499761040270502 : Rat) / 664812614540295144585577654302537623285240794615424827481625) [(2, 1), (9, 1), (11, 1), (12, 2)],
  term ((-36611837179964936069822268345968074502573712922999522080541004 : Rat) / 664812614540295144585577654302537623285240794615424827481625) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((18305918589982468034911134172984037251286856461499761040270502 : Rat) / 664812614540295144585577654302537623285240794615424827481625) [(2, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0102_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0102
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0103 : Poly :=
[
  term ((190704192832503194584 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 103 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0103 : Poly :=
[
  term ((381408385665006389168 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-190704192832503194584 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((381408385665006389168 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-190704192832503194584 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0103_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0103
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0104 : Poly :=
[
  term ((-40124413927308229725632498429178187339943 : Rat) / 9496121994155507560371088362327791828520) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 104 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0104 : Poly :=
[
  term ((-40124413927308229725632498429178187339943 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((40124413927308229725632498429178187339943 : Rat) / 9496121994155507560371088362327791828520) [(2, 1), (9, 1), (12, 2), (13, 1)],
  term ((-40124413927308229725632498429178187339943 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((40124413927308229725632498429178187339943 : Rat) / 9496121994155507560371088362327791828520) [(2, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0104_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0104
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0105 : Poly :=
[
  term ((-828209814576408559846 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0105 : Poly :=
[
  term ((-1656419629152817119692 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((828209814576408559846 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1656419629152817119692 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((828209814576408559846 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0105_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0105
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0106 : Poly :=
[
  term ((-2014280409065476680032379354058861558255963514619029641173175260871257497921 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 106 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0106 : Poly :=
[
  term ((-2014280409065476680032379354058861558255963514619029641173175260871257497921 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2014280409065476680032379354058861558255963514619029641173175260871257497921 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-2014280409065476680032379354058861558255963514619029641173175260871257497921 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((2014280409065476680032379354058861558255963514619029641173175260871257497921 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0106_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0106
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0107 : Poly :=
[
  term ((6058005983380218330279 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 107 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0107 : Poly :=
[
  term ((12116011966760436660558 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6058005983380218330279 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((12116011966760436660558 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6058005983380218330279 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0107_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0107
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0108 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 79134349951295896336425736352731598571000) [(2, 1), (9, 2)]
]

/-- Partial product 108 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0108 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (12, 1), (14, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 79134349951295896336425736352731598571000) [(2, 1), (9, 2), (12, 2)],
  term ((145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 79134349951295896336425736352731598571000) [(2, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0108_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0108
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0109 : Poly :=
[
  term ((-61791037963803014682 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (16, 1)]
]

/-- Partial product 109 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0109 : Poly :=
[
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((61791037963803014682 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (12, 2), (16, 1)],
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((61791037963803014682 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0109_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0109
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0110 : Poly :=
[
  term ((537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 1472663296703810469836292634109327944147799286374977280819248963546128000) [(2, 1), (10, 1)]
]

/-- Partial product 110 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0110 : Poly :=
[
  term ((537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 736331648351905234918146317054663972073899643187488640409624481773064000) [(2, 1), (10, 1), (12, 1), (14, 1)],
  term ((-537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 1472663296703810469836292634109327944147799286374977280819248963546128000) [(2, 1), (10, 1), (12, 2)],
  term ((537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 736331648351905234918146317054663972073899643187488640409624481773064000) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 1472663296703810469836292634109327944147799286374977280819248963546128000) [(2, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0110_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0110
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0111 : Poly :=
[
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 111 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0111 : Poly :=
[
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0111_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0111
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0112 : Poly :=
[
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0112 : Poly :=
[
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0112_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0112
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0113 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 113 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0113 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (13, 2), (15, 2)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0113_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0113
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0114 : Poly :=
[
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0114 : Poly :=
[
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0114_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0114
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0115 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 115 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0115 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (10, 1), (12, 2), (15, 2)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (10, 1), (13, 1), (15, 3)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0115_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0115
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0116 : Poly :=
[
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0116 : Poly :=
[
  term ((2081612327941872 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((2081612327941872 : Rat) / 7342292683791569) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0116_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0116
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0117 : Poly :=
[
  term ((181300281555726190652 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 117 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0117 : Poly :=
[
  term ((362600563111452381304 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-181300281555726190652 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (12, 2), (16, 1)],
  term ((362600563111452381304 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-181300281555726190652 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0117_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0117
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0118 : Poly :=
[
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 118 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0118 : Poly :=
[
  term ((2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0118_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0118
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0119 : Poly :=
[
  term ((2799489730243137442256 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 119 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0119 : Poly :=
[
  term ((5598979460486274884512 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((5598979460486274884512 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0119_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0119
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0120 : Poly :=
[
  term ((-418381568628952414493833171745036372194006354951123901778373557765384600337 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 120 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0120 : Poly :=
[
  term ((-836763137257904828987666343490072744388012709902247803556747115530769200674 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((418381568628952414493833171745036372194006354951123901778373557765384600337 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-836763137257904828987666343490072744388012709902247803556747115530769200674 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((418381568628952414493833171745036372194006354951123901778373557765384600337 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(2, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0120_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0120
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0121 : Poly :=
[
  term ((-32166067711606838215428 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0121 : Poly :=
[
  term ((-64332135423213676430856 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32166067711606838215428 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-64332135423213676430856 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((32166067711606838215428 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0121_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0121
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0122 : Poly :=
[
  term ((5018551090797954002257788166957388682532145069072561127227840008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2)]
]

/-- Partial product 122 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0122 : Poly :=
[
  term ((10037102181595908004515576333914777365064290138145122254455680016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (12, 1), (14, 1)],
  term ((-5018551090797954002257788166957388682532145069072561127227840008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (12, 2)],
  term ((10037102181595908004515576333914777365064290138145122254455680016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5018551090797954002257788166957388682532145069072561127227840008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0122_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0122
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0123 : Poly :=
[
  term ((-473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 123 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0123 : Poly :=
[
  term ((-947205775985956213632 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (12, 2), (16, 1)],
  term ((-947205775985956213632 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0123_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0123
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0124 : Poly :=
[
  term ((-2404783045221411208858040754004225609994998566566164184745689662485926463947 : Rat) / 5007055208792955597443394955971715010102517573674922754785446476056835200) [(2, 1), (12, 1)]
]

/-- Partial product 124 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0124 : Poly :=
[
  term ((-2404783045221411208858040754004225609994998566566164184745689662485926463947 : Rat) / 2503527604396477798721697477985857505051258786837461377392723238028417600) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((2404783045221411208858040754004225609994998566566164184745689662485926463947 : Rat) / 5007055208792955597443394955971715010102517573674922754785446476056835200) [(2, 1), (12, 1), (13, 2)],
  term ((-2404783045221411208858040754004225609994998566566164184745689662485926463947 : Rat) / 2503527604396477798721697477985857505051258786837461377392723238028417600) [(2, 1), (12, 2), (14, 1)],
  term ((2404783045221411208858040754004225609994998566566164184745689662485926463947 : Rat) / 5007055208792955597443394955971715010102517573674922754785446476056835200) [(2, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0124_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0124
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0125 : Poly :=
[
  term ((-51108671803129118548 : Rat) / 6409821512950039737) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 125 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0125 : Poly :=
[
  term ((-102217343606258237096 : Rat) / 6409821512950039737) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((51108671803129118548 : Rat) / 6409821512950039737) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((-102217343606258237096 : Rat) / 6409821512950039737) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((51108671803129118548 : Rat) / 6409821512950039737) [(2, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0125_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0125
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0126 : Poly :=
[
  term ((717795589783917105547154019782767511401347943404307423640422166473 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 126 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0126 : Poly :=
[
  term ((717795589783917105547154019782767511401347943404307423640422166473 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-717795589783917105547154019782767511401347943404307423640422166473 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((717795589783917105547154019782767511401347943404307423640422166473 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(2, 1), (13, 2), (15, 2)],
  term ((-717795589783917105547154019782767511401347943404307423640422166473 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(2, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0126_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0126
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0127 : Poly :=
[
  term ((26441267875401086107769 : Rat) / 4339258264657398321155) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0127 : Poly :=
[
  term ((52882535750802172215538 : Rat) / 4339258264657398321155) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26441267875401086107769 : Rat) / 4339258264657398321155) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((52882535750802172215538 : Rat) / 4339258264657398321155) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-26441267875401086107769 : Rat) / 4339258264657398321155) [(2, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0127_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0127
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0128 : Poly :=
[
  term ((1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (13, 2)]
]

/-- Partial product 128 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0128 : Poly :=
[
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (12, 2), (13, 2)],
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (13, 3), (15, 1)],
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0128_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0128
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0129 : Poly :=
[
  term ((-58935306340725676667935865700211438645128478875627905269156911153158698816680941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (15, 2)]
]

/-- Partial product 129 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0129 : Poly :=
[
  term ((-58935306340725676667935865700211438645128478875627905269156911153158698816680941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((58935306340725676667935865700211438645128478875627905269156911153158698816680941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (12, 2), (15, 2)],
  term ((-58935306340725676667935865700211438645128478875627905269156911153158698816680941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (13, 1), (15, 3)],
  term ((58935306340725676667935865700211438645128478875627905269156911153158698816680941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0129_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0129
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0130 : Poly :=
[
  term ((-2343083130968338788277 : Rat) / 32049107564750198685) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 130 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0130 : Poly :=
[
  term ((-4686166261936677576554 : Rat) / 32049107564750198685) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2343083130968338788277 : Rat) / 32049107564750198685) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4686166261936677576554 : Rat) / 32049107564750198685) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((2343083130968338788277 : Rat) / 32049107564750198685) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0130_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0130
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0131 : Poly :=
[
  term ((2168767827966845611963 : Rat) / 42732143419666931580) [(2, 1), (16, 1)]
]

/-- Partial product 131 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0131 : Poly :=
[
  term ((2168767827966845611963 : Rat) / 21366071709833465790) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2168767827966845611963 : Rat) / 42732143419666931580) [(2, 1), (12, 2), (16, 1)],
  term ((2168767827966845611963 : Rat) / 21366071709833465790) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2168767827966845611963 : Rat) / 42732143419666931580) [(2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0131_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0131
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0132 : Poly :=
[
  term ((-329972689390869269945257561686066062842595842628006267895489945760431508988413 : Rat) / 155457142673000335692052071966359913646992450382669030291433862018526502400) [(2, 2)]
]

/-- Partial product 132 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0132 : Poly :=
[
  term ((-329972689390869269945257561686066062842595842628006267895489945760431508988413 : Rat) / 77728571336500167846026035983179956823496225191334515145716931009263251200) [(2, 2), (12, 1), (14, 1)],
  term ((329972689390869269945257561686066062842595842628006267895489945760431508988413 : Rat) / 155457142673000335692052071966359913646992450382669030291433862018526502400) [(2, 2), (12, 2)],
  term ((-329972689390869269945257561686066062842595842628006267895489945760431508988413 : Rat) / 77728571336500167846026035983179956823496225191334515145716931009263251200) [(2, 2), (13, 1), (15, 1)],
  term ((329972689390869269945257561686066062842595842628006267895489945760431508988413 : Rat) / 155457142673000335692052071966359913646992450382669030291433862018526502400) [(2, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0132_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0132
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0133 : Poly :=
[
  term ((-99504804932538997442 : Rat) / 2136607170983346579) [(2, 2), (16, 1)]
]

/-- Partial product 133 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0133 : Poly :=
[
  term ((-199009609865077994884 : Rat) / 2136607170983346579) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((99504804932538997442 : Rat) / 2136607170983346579) [(2, 2), (12, 2), (16, 1)],
  term ((-199009609865077994884 : Rat) / 2136607170983346579) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((99504804932538997442 : Rat) / 2136607170983346579) [(2, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0133_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0133
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0134 : Poly :=
[
  term ((-291233324874901319095424915121780214444140020777466214400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(3, 1), (5, 1)]
]

/-- Partial product 134 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0134 : Poly :=
[
  term ((-582466649749802638190849830243560428888280041554932428800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(3, 1), (5, 1), (12, 1), (14, 1)],
  term ((291233324874901319095424915121780214444140020777466214400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(3, 1), (5, 1), (12, 2)],
  term ((-582466649749802638190849830243560428888280041554932428800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((291233324874901319095424915121780214444140020777466214400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(3, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0134_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0134
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0135 : Poly :=
[
  term ((-3497224600527265820422018515305151943273438576508313600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1)]
]

/-- Partial product 135 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0135 : Poly :=
[
  term ((-6994449201054531640844037030610303886546877153016627200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1)],
  term ((3497224600527265820422018515305151943273438576508313600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (12, 2)],
  term ((-6994449201054531640844037030610303886546877153016627200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((3497224600527265820422018515305151943273438576508313600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0135_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0135
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0136 : Poly :=
[
  term ((94302505729556048586899607505052431475675187715883008000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1)]
]

/-- Partial product 136 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0136 : Poly :=
[
  term ((188605011459112097173799215010104862951350375431766016000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1)],
  term ((-94302505729556048586899607505052431475675187715883008000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (12, 2)],
  term ((188605011459112097173799215010104862951350375431766016000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-94302505729556048586899607505052431475675187715883008000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0136_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0136
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0137 : Poly :=
[
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1)]
]

/-- Partial product 137 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0137 : Poly :=
[
  term ((-868872128907968576194619627244813105388047518713905152000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2)],
  term ((-868872128907968576194619627244813105388047518713905152000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0137_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0137
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0138 : Poly :=
[
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1)]
]

/-- Partial product 138 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0138 : Poly :=
[
  term ((11551667310583032515927016764277664408408974002272169984000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((11551667310583032515927016764277664408408974002272169984000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 2), (14, 1)],
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0138_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0138
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0139 : Poly :=
[
  term ((50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1)]
]

/-- Partial product 139 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0139 : Poly :=
[
  term ((100772785711678336 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 2)],
  term ((100772785711678336 : Rat) / 3146696864482101) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0139_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0139
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0140 : Poly :=
[
  term ((3257302521583390609319189265066627186917803 : Rat) / 79134349951295896336425736352731598571000) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 140 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0140 : Poly :=
[
  term ((3257302521583390609319189265066627186917803 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-3257302521583390609319189265066627186917803 : Rat) / 79134349951295896336425736352731598571000) [(3, 1), (8, 1), (9, 1), (12, 2)],
  term ((3257302521583390609319189265066627186917803 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3257302521583390609319189265066627186917803 : Rat) / 79134349951295896336425736352731598571000) [(3, 1), (8, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0140_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0140
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0141 : Poly :=
[
  term ((-1385425832538930508302 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 141 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0141 : Poly :=
[
  term ((-2770851665077861016604 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((1385425832538930508302 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-2770851665077861016604 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1385425832538930508302 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0141_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0141
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0142 : Poly :=
[
  term ((40186690372718427427208269088312043742594590374000654029174855517 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 142 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0142 : Poly :=
[
  term ((80373380745436854854416538176624087485189180748001308058349711034 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-40186690372718427427208269088312043742594590374000654029174855517 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 2)],
  term ((80373380745436854854416538176624087485189180748001308058349711034 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-40186690372718427427208269088312043742594590374000654029174855517 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0142_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0142
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0143 : Poly :=
[
  term ((1047158378734308409672 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 143 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0143 : Poly :=
[
  term ((2094316757468616819344 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1047158378734308409672 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((2094316757468616819344 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1047158378734308409672 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0143_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0143
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0144 : Poly :=
[
  term ((-257668075325577617095682571051581928808343108885897959856829665801 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 144 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0144 : Poly :=
[
  term ((-257668075325577617095682571051581928808343108885897959856829665801 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((257668075325577617095682571051581928808343108885897959856829665801 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 1), (8, 1), (12, 2), (13, 1)],
  term ((-257668075325577617095682571051581928808343108885897959856829665801 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((257668075325577617095682571051581928808343108885897959856829665801 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 1), (8, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0144_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0144
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0145 : Poly :=
[
  term ((-18569412485813733118706 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 145 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0145 : Poly :=
[
  term ((-37138824971627466237412 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((18569412485813733118706 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-37138824971627466237412 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((18569412485813733118706 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0145_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0145
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0146 : Poly :=
[
  term ((-199135576592036659423962340346224187567795867571864296337360199421 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 146 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0146 : Poly :=
[
  term ((-199135576592036659423962340346224187567795867571864296337360199421 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((199135576592036659423962340346224187567795867571864296337360199421 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((-199135576592036659423962340346224187567795867571864296337360199421 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((199135576592036659423962340346224187567795867571864296337360199421 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(3, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0146_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0146
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0147 : Poly :=
[
  term ((101392781115582 : Rat) / 1048898954827367) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0147 : Poly :=
[
  term ((202785562231164 : Rat) / 1048898954827367) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101392781115582 : Rat) / 1048898954827367) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((202785562231164 : Rat) / 1048898954827367) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101392781115582 : Rat) / 1048898954827367) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0147_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0147
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0148 : Poly :=
[
  term ((1233852422723836467056138349865641569401207934716447842485297885518818601632059 : Rat) / 2785077264113499099586879248945415258725211645603775033848870531875020535552) [(3, 1), (9, 1)]
]

/-- Partial product 148 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0148 : Poly :=
[
  term ((1233852422723836467056138349865641569401207934716447842485297885518818601632059 : Rat) / 1392538632056749549793439624472707629362605822801887516924435265937510267776) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1233852422723836467056138349865641569401207934716447842485297885518818601632059 : Rat) / 2785077264113499099586879248945415258725211645603775033848870531875020535552) [(3, 1), (9, 1), (12, 2)],
  term ((1233852422723836467056138349865641569401207934716447842485297885518818601632059 : Rat) / 1392538632056749549793439624472707629362605822801887516924435265937510267776) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1233852422723836467056138349865641569401207934716447842485297885518818601632059 : Rat) / 2785077264113499099586879248945415258725211645603775033848870531875020535552) [(3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0148_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0148
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0149 : Poly :=
[
  term ((3963669082363458219760420246026723549719069 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 149 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0149 : Poly :=
[
  term ((3963669082363458219760420246026723549719069 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-3963669082363458219760420246026723549719069 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 1), (10, 1), (12, 2)],
  term ((3963669082363458219760420246026723549719069 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3963669082363458219760420246026723549719069 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0149_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0149
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0150 : Poly :=
[
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 150 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0150 : Poly :=
[
  term ((-2793547474910435620337797452357109501601422 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((-2793547474910435620337797452357109501601422 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0150_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0150
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0151 : Poly :=
[
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 151 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0151 : Poly :=
[
  term ((9505418205450486962784 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((9505418205450486962784 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0151_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0151
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0152 : Poly :=
[
  term ((-3371728294781064034692 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 152 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0152 : Poly :=
[
  term ((-6743456589562128069384 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3371728294781064034692 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-6743456589562128069384 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3371728294781064034692 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0152_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0152
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0153 : Poly :=
[
  term ((-3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 1)]
]

/-- Partial product 153 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0153 : Poly :=
[
  term ((-6948407091279567622585337464070887843396586 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 1), (13, 2)],
  term ((-6948407091279567622585337464070887843396586 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0153_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0153
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0154 : Poly :=
[
  term ((35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 154 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0154 : Poly :=
[
  term ((70928648098004089678176 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((70928648098004089678176 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0154_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0154
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0155 : Poly :=
[
  term ((-72424505318983731337813727 : Rat) / 7576344930091817468736630) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 155 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0155 : Poly :=
[
  term ((-72424505318983731337813727 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((72424505318983731337813727 : Rat) / 7576344930091817468736630) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((-72424505318983731337813727 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((72424505318983731337813727 : Rat) / 7576344930091817468736630) [(3, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0155_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0155
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0156 : Poly :=
[
  term ((-35491036135387963559770114566072562128933779722057784353961859418 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 156 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0156 : Poly :=
[
  term ((-70982072270775927119540229132145124257867559444115568707923718836 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((35491036135387963559770114566072562128933779722057784353961859418 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (12, 2)],
  term ((-70982072270775927119540229132145124257867559444115568707923718836 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((35491036135387963559770114566072562128933779722057784353961859418 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0156_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0156
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0157 : Poly :=
[
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 157 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0157 : Poly :=
[
  term ((34450362560783419843173414231676854389584 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((34450362560783419843173414231676854389584 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0157_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0157
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0158 : Poly :=
[
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 158 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0158 : Poly :=
[
  term ((-7184562380340495453824 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-7184562380340495453824 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0158_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0158
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0159 : Poly :=
[
  term ((2548482532785687465712 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 159 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0159 : Poly :=
[
  term ((5096965065571374931424 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2548482532785687465712 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((5096965065571374931424 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2548482532785687465712 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0159_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0159
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0160 : Poly :=
[
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 160 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0160 : Poly :=
[
  term ((771550671415912258681082857570897192444402 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 1), (13, 3)],
  term ((771550671415912258681082857570897192444402 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0160_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0160
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0161 : Poly :=
[
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 161 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0161 : Poly :=
[
  term ((127404894121038055617952 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((127404894121038055617952 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0161_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0161
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0162 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(3, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 162 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0162 : Poly :=
[
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(3, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0162_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0162
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0163 : Poly :=
[
  term ((1700851510399536 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0163 : Poly :=
[
  term ((3401703020799072 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3401703020799072 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0163_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0163
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0164 : Poly :=
[
  term ((-1094726890892043118375518634805037138927779 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 164 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0164 : Poly :=
[
  term ((-1094726890892043118375518634805037138927779 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((1094726890892043118375518634805037138927779 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (10, 1), (12, 2), (13, 1)],
  term ((-1094726890892043118375518634805037138927779 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (10, 1), (13, 2), (15, 1)],
  term ((1094726890892043118375518634805037138927779 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0164_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0164
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0165 : Poly :=
[
  term ((-45192613004146193738876 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 165 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0165 : Poly :=
[
  term ((-90385226008292387477752 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((45192613004146193738876 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-90385226008292387477752 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((45192613004146193738876 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0165_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0165
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0166 : Poly :=
[
  term ((-67174093353364035609855653956022405218251780876720003091265657929 : Rat) / 231264754976375394780490781167596501007111457079504793985856456) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 166 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0166 : Poly :=
[
  term ((-67174093353364035609855653956022405218251780876720003091265657929 : Rat) / 115632377488187697390245390583798250503555728539752396992928228) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((67174093353364035609855653956022405218251780876720003091265657929 : Rat) / 231264754976375394780490781167596501007111457079504793985856456) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term ((-67174093353364035609855653956022405218251780876720003091265657929 : Rat) / 115632377488187697390245390583798250503555728539752396992928228) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((67174093353364035609855653956022405218251780876720003091265657929 : Rat) / 231264754976375394780490781167596501007111457079504793985856456) [(3, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0166_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0166
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0167 : Poly :=
[
  term ((754115722451388 : Rat) / 7342292683791569) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0167 : Poly :=
[
  term ((1508231444902776 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-754115722451388 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1508231444902776 : Rat) / 7342292683791569) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-754115722451388 : Rat) / 7342292683791569) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0167_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0167
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0168 : Poly :=
[
  term ((7267094166397714870077795971200800843150546617520548469165984007845301244023350229 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1)]
]

/-- Partial product 168 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0168 : Poly :=
[
  term ((7267094166397714870077795971200800843150546617520548469165984007845301244023350229 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-7267094166397714870077795971200800843150546617520548469165984007845301244023350229 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1), (12, 2)],
  term ((7267094166397714870077795971200800843150546617520548469165984007845301244023350229 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7267094166397714870077795971200800843150546617520548469165984007845301244023350229 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0168_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0168
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0169 : Poly :=
[
  term ((-988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 169 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0169 : Poly :=
[
  term ((-1976522159204377063438149020304315863905456 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1976522159204377063438149020304315863905456 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0169_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0169
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0170 : Poly :=
[
  term ((-26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 170 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0170 : Poly :=
[
  term ((-53610612999765299204736 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-53610612999765299204736 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0170_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0170
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0171 : Poly :=
[
  term ((21101902402046005134870038 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 171 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0171 : Poly :=
[
  term ((42203804804092010269740076 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-21101902402046005134870038 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((42203804804092010269740076 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21101902402046005134870038 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0171_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0171
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0172 : Poly :=
[
  term ((959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 172 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0172 : Poly :=
[
  term ((1919082530258311708738182675806734919634326 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 1), (13, 3)],
  term ((1919082530258311708738182675806734919634326 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0172_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0172
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0173 : Poly :=
[
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 173 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0173 : Poly :=
[
  term ((316894943696178215242976 : Rat) / 4339258264657398321155) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term ((316894943696178215242976 : Rat) / 4339258264657398321155) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0173_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0173
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0174 : Poly :=
[
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 174 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0174 : Poly :=
[
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 21594346495919052487628326691524323281539032304798760138429346579) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 21594346495919052487628326691524323281539032304798760138429346579) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(3, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0174_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0174
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0175 : Poly :=
[
  term ((-97547919765736176 : Rat) / 7342292683791569) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 175 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0175 : Poly :=
[
  term ((-195095839531472352 : Rat) / 7342292683791569) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((97547919765736176 : Rat) / 7342292683791569) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-195095839531472352 : Rat) / 7342292683791569) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((97547919765736176 : Rat) / 7342292683791569) [(3, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0175_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0175
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0176 : Poly :=
[
  term ((1152811343019056646842147349685585379027514838435013730053290058653600390841088943319 : Rat) / 482340568678656625309702649926734105120472591873003788674701265239105119000912000) [(3, 1), (13, 1)]
]

/-- Partial product 176 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0176 : Poly :=
[
  term ((1152811343019056646842147349685585379027514838435013730053290058653600390841088943319 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1152811343019056646842147349685585379027514838435013730053290058653600390841088943319 : Rat) / 482340568678656625309702649926734105120472591873003788674701265239105119000912000) [(3, 1), (12, 2), (13, 1)],
  term ((1152811343019056646842147349685585379027514838435013730053290058653600390841088943319 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(3, 1), (13, 2), (15, 1)],
  term ((-1152811343019056646842147349685585379027514838435013730053290058653600390841088943319 : Rat) / 482340568678656625309702649926734105120472591873003788674701265239105119000912000) [(3, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0176_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0176
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0177 : Poly :=
[
  term ((69020286233386777190247083 : Rat) / 1082334990013116781248090) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 177 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0177 : Poly :=
[
  term ((69020286233386777190247083 : Rat) / 541167495006558390624045) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-69020286233386777190247083 : Rat) / 1082334990013116781248090) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((69020286233386777190247083 : Rat) / 541167495006558390624045) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-69020286233386777190247083 : Rat) / 1082334990013116781248090) [(3, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0177_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0177
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0178 : Poly :=
[
  term ((-200379267425711529916031946283036419937489027877924071485113761057152211146178493 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (15, 1)]
]

/-- Partial product 178 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0178 : Poly :=
[
  term ((-200379267425711529916031946283036419937489027877924071485113761057152211146178493 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((200379267425711529916031946283036419937489027877924071485113761057152211146178493 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (12, 2), (15, 1)],
  term ((-200379267425711529916031946283036419937489027877924071485113761057152211146178493 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (13, 1), (15, 2)],
  term ((200379267425711529916031946283036419937489027877924071485113761057152211146178493 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0178_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0178
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0179 : Poly :=
[
  term ((-2462692675964669093509 : Rat) / 32049107564750198685) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 179 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0179 : Poly :=
[
  term ((-4925385351929338187018 : Rat) / 32049107564750198685) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2462692675964669093509 : Rat) / 32049107564750198685) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4925385351929338187018 : Rat) / 32049107564750198685) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((2462692675964669093509 : Rat) / 32049107564750198685) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0179_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0179
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0180 : Poly :=
[
  term ((-368968529676595834409399138297440241804984065622162988188976908442947745756869 : Rat) / 2040374997583129405958183444558473866616775911272531022575069438993160344000) [(3, 2)]
]

/-- Partial product 180 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0180 : Poly :=
[
  term ((-368968529676595834409399138297440241804984065622162988188976908442947745756869 : Rat) / 1020187498791564702979091722279236933308387955636265511287534719496580172000) [(3, 2), (12, 1), (14, 1)],
  term ((368968529676595834409399138297440241804984065622162988188976908442947745756869 : Rat) / 2040374997583129405958183444558473866616775911272531022575069438993160344000) [(3, 2), (12, 2)],
  term ((-368968529676595834409399138297440241804984065622162988188976908442947745756869 : Rat) / 1020187498791564702979091722279236933308387955636265511287534719496580172000) [(3, 2), (13, 1), (15, 1)],
  term ((368968529676595834409399138297440241804984065622162988188976908442947745756869 : Rat) / 2040374997583129405958183444558473866616775911272531022575069438993160344000) [(3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0180_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0180
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0181 : Poly :=
[
  term ((-417318140534330736464 : Rat) / 32049107564750198685) [(3, 2), (16, 1)]
]

/-- Partial product 181 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0181 : Poly :=
[
  term ((-834636281068661472928 : Rat) / 32049107564750198685) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((417318140534330736464 : Rat) / 32049107564750198685) [(3, 2), (12, 2), (16, 1)],
  term ((-834636281068661472928 : Rat) / 32049107564750198685) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((417318140534330736464 : Rat) / 32049107564750198685) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0181_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0181
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0182 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 182 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0182 : Poly :=
[
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (12, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0182_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0182
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0183 : Poly :=
[
  term ((72306828147646046569735049146739786806288150090552422400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 183 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0183 : Poly :=
[
  term ((144613656295292093139470098293479573612576300181104844800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-72306828147646046569735049146739786806288150090552422400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((144613656295292093139470098293479573612576300181104844800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-72306828147646046569735049146739786806288150090552422400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0183_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0183
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0184 : Poly :=
[
  term ((1176851724045815923266907444040753438065027590830728140800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1)]
]

/-- Partial product 184 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0184 : Poly :=
[
  term ((2353703448091631846533814888081506876130055181661456281600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1176851724045815923266907444040753438065027590830728140800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 2)],
  term ((2353703448091631846533814888081506876130055181661456281600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1176851724045815923266907444040753438065027590830728140800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0184_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0184
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0185 : Poly :=
[
  term ((-208634125996628129986198199270873752328313428404463206400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 185 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0185 : Poly :=
[
  term ((-417268251993256259972396398541747504656626856808926412800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((208634125996628129986198199270873752328313428404463206400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 2)],
  term ((-417268251993256259972396398541747504656626856808926412800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((208634125996628129986198199270873752328313428404463206400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0185_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0185
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0186 : Poly :=
[
  term ((285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 186 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0186 : Poly :=
[
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (13, 2)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 2), (14, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0186_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0186
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0187 : Poly :=
[
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 187 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0187 : Poly :=
[
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0187_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0187
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0188 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 188 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0188 : Poly :=
[
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0188_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0188
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0189 : Poly :=
[
  term ((-135964628742162640276752963438097093949240913137606656000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1)]
]

/-- Partial product 189 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0189 : Poly :=
[
  term ((-271929257484325280553505926876194187898481826275213312000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((135964628742162640276752963438097093949240913137606656000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 2)],
  term ((-271929257484325280553505926876194187898481826275213312000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((135964628742162640276752963438097093949240913137606656000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0189_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0189
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0190 : Poly :=
[
  term ((-3316733985308758334089251306013260598745543714961269350400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 190 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0190 : Poly :=
[
  term ((-6633467970617516668178502612026521197491087429922538700800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((3316733985308758334089251306013260598745543714961269350400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6633467970617516668178502612026521197491087429922538700800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((3316733985308758334089251306013260598745543714961269350400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0190_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0190
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0191 : Poly :=
[
  term ((71469526277166700851249519157307416107216702398871142400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 1)]
]

/-- Partial product 191 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0191 : Poly :=
[
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-71469526277166700851249519157307416107216702398871142400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (12, 2), (13, 1)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 2), (15, 1)],
  term ((-71469526277166700851249519157307416107216702398871142400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0191_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0191
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0192 : Poly :=
[
  term ((271625112188429724011407614082350318180353300872677683200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (15, 1)]
]

/-- Partial product 192 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0192 : Poly :=
[
  term ((543250224376859448022815228164700636360706601745355366400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-271625112188429724011407614082350318180353300872677683200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 2), (15, 1)],
  term ((543250224376859448022815228164700636360706601745355366400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 1), (15, 2)],
  term ((-271625112188429724011407614082350318180353300872677683200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0192_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0192
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0193 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1)]
]

/-- Partial product 193 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0193 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 1), (12, 1), (14, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (12, 2)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 1), (13, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0193_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0193
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0194 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (8, 1)]
]

/-- Partial product 194 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0194 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1), (8, 1), (12, 2)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0194_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0194
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0195 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(7, 1), (15, 1)]
]

/-- Partial product 195 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0195 : Poly :=
[
  term ((-50386392855839168 : Rat) / 3146696864482101) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 2), (15, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(7, 1), (13, 1), (15, 2)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0195_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0195
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0196 : Poly :=
[
  term ((-2993635195052455382466169328300684935189905474376425964223140685453577491630028930101 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1)]
]

/-- Partial product 196 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0196 : Poly :=
[
  term ((-2993635195052455382466169328300684935189905474376425964223140685453577491630028930101 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(8, 1), (12, 1), (14, 1)],
  term ((2993635195052455382466169328300684935189905474376425964223140685453577491630028930101 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (12, 2)],
  term ((-2993635195052455382466169328300684935189905474376425964223140685453577491630028930101 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(8, 1), (13, 1), (15, 1)],
  term ((2993635195052455382466169328300684935189905474376425964223140685453577491630028930101 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0196_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0196
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0197 : Poly :=
[
  term ((319752715905494285879741167413523414000444 : Rat) / 1413113391987426720293316720584492831625) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 197 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0197 : Poly :=
[
  term ((639505431810988571759482334827046828000888 : Rat) / 1413113391987426720293316720584492831625) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-319752715905494285879741167413523414000444 : Rat) / 1413113391987426720293316720584492831625) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((639505431810988571759482334827046828000888 : Rat) / 1413113391987426720293316720584492831625) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-319752715905494285879741167413523414000444 : Rat) / 1413113391987426720293316720584492831625) [(8, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0197_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0197
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0198 : Poly :=
[
  term ((1436956058693257198784 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 198 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0198 : Poly :=
[
  term ((2873912117386514397568 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1436956058693257198784 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((2873912117386514397568 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1436956058693257198784 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0198_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0198
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NYNYN_coefficient_30_0199 : Poly :=
[
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 199 for generator 30. -/
def rs_R009_ueqv_R009NYNYN_partial_30_0199 : Poly :=
[
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 30. -/
theorem rs_R009_ueqv_R009NYNYN_partial_30_0199_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_30_0199
        rs_R009_ueqv_R009NYNYN_generator_30_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_30_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_30_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_30_0100,
  rs_R009_ueqv_R009NYNYN_partial_30_0101,
  rs_R009_ueqv_R009NYNYN_partial_30_0102,
  rs_R009_ueqv_R009NYNYN_partial_30_0103,
  rs_R009_ueqv_R009NYNYN_partial_30_0104,
  rs_R009_ueqv_R009NYNYN_partial_30_0105,
  rs_R009_ueqv_R009NYNYN_partial_30_0106,
  rs_R009_ueqv_R009NYNYN_partial_30_0107,
  rs_R009_ueqv_R009NYNYN_partial_30_0108,
  rs_R009_ueqv_R009NYNYN_partial_30_0109,
  rs_R009_ueqv_R009NYNYN_partial_30_0110,
  rs_R009_ueqv_R009NYNYN_partial_30_0111,
  rs_R009_ueqv_R009NYNYN_partial_30_0112,
  rs_R009_ueqv_R009NYNYN_partial_30_0113,
  rs_R009_ueqv_R009NYNYN_partial_30_0114,
  rs_R009_ueqv_R009NYNYN_partial_30_0115,
  rs_R009_ueqv_R009NYNYN_partial_30_0116,
  rs_R009_ueqv_R009NYNYN_partial_30_0117,
  rs_R009_ueqv_R009NYNYN_partial_30_0118,
  rs_R009_ueqv_R009NYNYN_partial_30_0119,
  rs_R009_ueqv_R009NYNYN_partial_30_0120,
  rs_R009_ueqv_R009NYNYN_partial_30_0121,
  rs_R009_ueqv_R009NYNYN_partial_30_0122,
  rs_R009_ueqv_R009NYNYN_partial_30_0123,
  rs_R009_ueqv_R009NYNYN_partial_30_0124,
  rs_R009_ueqv_R009NYNYN_partial_30_0125,
  rs_R009_ueqv_R009NYNYN_partial_30_0126,
  rs_R009_ueqv_R009NYNYN_partial_30_0127,
  rs_R009_ueqv_R009NYNYN_partial_30_0128,
  rs_R009_ueqv_R009NYNYN_partial_30_0129,
  rs_R009_ueqv_R009NYNYN_partial_30_0130,
  rs_R009_ueqv_R009NYNYN_partial_30_0131,
  rs_R009_ueqv_R009NYNYN_partial_30_0132,
  rs_R009_ueqv_R009NYNYN_partial_30_0133,
  rs_R009_ueqv_R009NYNYN_partial_30_0134,
  rs_R009_ueqv_R009NYNYN_partial_30_0135,
  rs_R009_ueqv_R009NYNYN_partial_30_0136,
  rs_R009_ueqv_R009NYNYN_partial_30_0137,
  rs_R009_ueqv_R009NYNYN_partial_30_0138,
  rs_R009_ueqv_R009NYNYN_partial_30_0139,
  rs_R009_ueqv_R009NYNYN_partial_30_0140,
  rs_R009_ueqv_R009NYNYN_partial_30_0141,
  rs_R009_ueqv_R009NYNYN_partial_30_0142,
  rs_R009_ueqv_R009NYNYN_partial_30_0143,
  rs_R009_ueqv_R009NYNYN_partial_30_0144,
  rs_R009_ueqv_R009NYNYN_partial_30_0145,
  rs_R009_ueqv_R009NYNYN_partial_30_0146,
  rs_R009_ueqv_R009NYNYN_partial_30_0147,
  rs_R009_ueqv_R009NYNYN_partial_30_0148,
  rs_R009_ueqv_R009NYNYN_partial_30_0149,
  rs_R009_ueqv_R009NYNYN_partial_30_0150,
  rs_R009_ueqv_R009NYNYN_partial_30_0151,
  rs_R009_ueqv_R009NYNYN_partial_30_0152,
  rs_R009_ueqv_R009NYNYN_partial_30_0153,
  rs_R009_ueqv_R009NYNYN_partial_30_0154,
  rs_R009_ueqv_R009NYNYN_partial_30_0155,
  rs_R009_ueqv_R009NYNYN_partial_30_0156,
  rs_R009_ueqv_R009NYNYN_partial_30_0157,
  rs_R009_ueqv_R009NYNYN_partial_30_0158,
  rs_R009_ueqv_R009NYNYN_partial_30_0159,
  rs_R009_ueqv_R009NYNYN_partial_30_0160,
  rs_R009_ueqv_R009NYNYN_partial_30_0161,
  rs_R009_ueqv_R009NYNYN_partial_30_0162,
  rs_R009_ueqv_R009NYNYN_partial_30_0163,
  rs_R009_ueqv_R009NYNYN_partial_30_0164,
  rs_R009_ueqv_R009NYNYN_partial_30_0165,
  rs_R009_ueqv_R009NYNYN_partial_30_0166,
  rs_R009_ueqv_R009NYNYN_partial_30_0167,
  rs_R009_ueqv_R009NYNYN_partial_30_0168,
  rs_R009_ueqv_R009NYNYN_partial_30_0169,
  rs_R009_ueqv_R009NYNYN_partial_30_0170,
  rs_R009_ueqv_R009NYNYN_partial_30_0171,
  rs_R009_ueqv_R009NYNYN_partial_30_0172,
  rs_R009_ueqv_R009NYNYN_partial_30_0173,
  rs_R009_ueqv_R009NYNYN_partial_30_0174,
  rs_R009_ueqv_R009NYNYN_partial_30_0175,
  rs_R009_ueqv_R009NYNYN_partial_30_0176,
  rs_R009_ueqv_R009NYNYN_partial_30_0177,
  rs_R009_ueqv_R009NYNYN_partial_30_0178,
  rs_R009_ueqv_R009NYNYN_partial_30_0179,
  rs_R009_ueqv_R009NYNYN_partial_30_0180,
  rs_R009_ueqv_R009NYNYN_partial_30_0181,
  rs_R009_ueqv_R009NYNYN_partial_30_0182,
  rs_R009_ueqv_R009NYNYN_partial_30_0183,
  rs_R009_ueqv_R009NYNYN_partial_30_0184,
  rs_R009_ueqv_R009NYNYN_partial_30_0185,
  rs_R009_ueqv_R009NYNYN_partial_30_0186,
  rs_R009_ueqv_R009NYNYN_partial_30_0187,
  rs_R009_ueqv_R009NYNYN_partial_30_0188,
  rs_R009_ueqv_R009NYNYN_partial_30_0189,
  rs_R009_ueqv_R009NYNYN_partial_30_0190,
  rs_R009_ueqv_R009NYNYN_partial_30_0191,
  rs_R009_ueqv_R009NYNYN_partial_30_0192,
  rs_R009_ueqv_R009NYNYN_partial_30_0193,
  rs_R009_ueqv_R009NYNYN_partial_30_0194,
  rs_R009_ueqv_R009NYNYN_partial_30_0195,
  rs_R009_ueqv_R009NYNYN_partial_30_0196,
  rs_R009_ueqv_R009NYNYN_partial_30_0197,
  rs_R009_ueqv_R009NYNYN_partial_30_0198,
  rs_R009_ueqv_R009NYNYN_partial_30_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_30_0100_0199 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36611837179964936069822268345968074502573712922999522080541004 : Rat) / 664812614540295144585577654302537623285240794615424827481625) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((381408385665006389168 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((18305918589982468034911134172984037251286856461499761040270502 : Rat) / 664812614540295144585577654302537623285240794615424827481625) [(2, 1), (9, 1), (11, 1), (12, 2)],
  term ((-190704192832503194584 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-36611837179964936069822268345968074502573712922999522080541004 : Rat) / 664812614540295144585577654302537623285240794615424827481625) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((381408385665006389168 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((18305918589982468034911134172984037251286856461499761040270502 : Rat) / 664812614540295144585577654302537623285240794615424827481625) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((-190704192832503194584 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-40124413927308229725632498429178187339943 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1656419629152817119692 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2014280409065476680032379354058861558255963514619029641173175260871257497921 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((12116011966760436660558 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((40124413927308229725632498429178187339943 : Rat) / 9496121994155507560371088362327791828520) [(2, 1), (9, 1), (12, 2), (13, 1)],
  term ((828209814576408559846 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((2014280409065476680032379354058861558255963514619029641173175260871257497921 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-6058005983380218330279 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2014280409065476680032379354058861558255963514619029641173175260871257497921 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((12116011966760436660558 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((12925032485617655840396521913297002078249599319302920641175391021351801369598 : Rat) / 79444388775789110645163745758282423550137923471166531718868796717064253625) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-19830437579293472110529 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((40124413927308229725632498429178187339943 : Rat) / 9496121994155507560371088362327791828520) [(2, 1), (9, 1), (13, 3)],
  term ((828209814576408559846 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 3), (16, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (12, 1), (14, 1)],
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 79134349951295896336425736352731598571000) [(2, 1), (9, 2), (12, 2)],
  term ((61791037963803014682 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (12, 2), (16, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 79134349951295896336425736352731598571000) [(2, 1), (9, 2), (13, 2)],
  term ((61791037963803014682 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 2), (16, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 736331648351905234918146317054663972073899643187488640409624481773064000) [(2, 1), (10, 1), (12, 1), (14, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((2081612327941872 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((362600563111452381304 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 1472663296703810469836292634109327944147799286374977280819248963546128000) [(2, 1), (10, 1), (12, 2)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (10, 1), (12, 2), (15, 2)],
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-181300281555726190652 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (12, 2), (16, 1)],
  term ((537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 736331648351905234918146317054663972073899643187488640409624481773064000) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((362600563111452381304 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (10, 1), (13, 1), (15, 3)],
  term ((2081612327941872 : Rat) / 7342292683791569) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-537311436400884381458273152559637341274792428617852335275523417040604462999 : Rat) / 1472663296703810469836292634109327944147799286374977280819248963546128000) [(2, 1), (10, 1), (13, 2)],
  term ((4142913866329004504140936481301966909028339898551010968224829018708113253 : Rat) / 259410249063801177616861210639289546286164648069115205612632805606740420) [(2, 1), (10, 1), (13, 2), (15, 2)],
  term ((155713860831079195864 : Rat) / 265668873346371325785) [(2, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-181300281555726190652 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (13, 2), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 3), (15, 1)],
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((5598979460486274884512 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-836763137257904828987666343490072744388012709902247803556747115530769200674 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-64332135423213676430856 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((418381568628952414493833171745036372194006354951123901778373557765384600337 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((32166067711606838215428 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-836763137257904828987666343490072744388012709902247803556747115530769200674 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-64332135423213676430856 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((14653304578201355403591362075470697804133871924394910184396459233818623815499 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((7553009434418622619988 : Rat) / 867851652931479664231) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (13, 3)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((10037102181595908004515576333914777365064290138145122254455680016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (12, 1), (14, 1)],
  term ((-947205775985956213632 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-5018551090797954002257788166957388682532145069072561127227840008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (12, 2)],
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (12, 2), (16, 1)],
  term ((10037102181595908004515576333914777365064290138145122254455680016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-947205775985956213632 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5018551090797954002257788166957388682532145069072561127227840008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 2)],
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 2), (16, 1)],
  term ((717795589783917105547154019782767511401347943404307423640422166473 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((52882535750802172215538 : Rat) / 4339258264657398321155) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2404783045221411208858040754004225609994998566566164184745689662485926463947 : Rat) / 2503527604396477798721697477985857505051258786837461377392723238028417600) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-102217343606258237096 : Rat) / 6409821512950039737) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2404783045221411208858040754004225609994998566566164184745689662485926463947 : Rat) / 5007055208792955597443394955971715010102517573674922754785446476056835200) [(2, 1), (12, 1), (13, 2)],
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((51108671803129118548 : Rat) / 6409821512950039737) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((-58935306340725676667935865700211438645128478875627905269156911153158698816680941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4686166261936677576554 : Rat) / 32049107564750198685) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((2168767827966845611963 : Rat) / 21366071709833465790) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-717795589783917105547154019782767511401347943404307423640422166473 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-26441267875401086107769 : Rat) / 4339258264657398321155) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (12, 2), (13, 2)],
  term ((-2404783045221411208858040754004225609994998566566164184745689662485926463947 : Rat) / 2503527604396477798721697477985857505051258786837461377392723238028417600) [(2, 1), (12, 2), (14, 1)],
  term ((-102217343606258237096 : Rat) / 6409821512950039737) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((58935306340725676667935865700211438645128478875627905269156911153158698816680941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (12, 2), (15, 2)],
  term ((2343083130968338788277 : Rat) / 32049107564750198685) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2168767827966845611963 : Rat) / 42732143419666931580) [(2, 1), (12, 2), (16, 1)],
  term ((2404783045221411208858040754004225609994998566566164184745689662485926463947 : Rat) / 5007055208792955597443394955971715010102517573674922754785446476056835200) [(2, 1), (12, 3)],
  term ((51108671803129118548 : Rat) / 6409821512950039737) [(2, 1), (12, 3), (16, 1)],
  term ((2168767827966845611963 : Rat) / 21366071709833465790) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-58935306340725676667935865700211438645128478875627905269156911153158698816680941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (13, 1), (15, 3)],
  term ((-4686166261936677576554 : Rat) / 32049107564750198685) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((8523827083407500552707055465857055122632374100044782691199255378615089308820256470059 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (13, 2), (15, 2)],
  term ((323116536707776972779717797 : Rat) / 3788172465045908734368315) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2168767827966845611963 : Rat) / 42732143419666931580) [(2, 1), (13, 2), (16, 1)],
  term ((-102007303915047209868601025232278246677912141465834612136931942319 : Rat) / 254011603763555968843257510155913575104824802806661518084179280) [(2, 1), (13, 3), (15, 1)],
  term ((-26441267875401086107769 : Rat) / 4339258264657398321155) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1426243082433130178455448125004549493324274241168 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (13, 4)],
  term ((-329972689390869269945257561686066062842595842628006267895489945760431508988413 : Rat) / 77728571336500167846026035983179956823496225191334515145716931009263251200) [(2, 2), (12, 1), (14, 1)],
  term ((-199009609865077994884 : Rat) / 2136607170983346579) [(2, 2), (12, 1), (14, 1), (16, 1)],
  term ((329972689390869269945257561686066062842595842628006267895489945760431508988413 : Rat) / 155457142673000335692052071966359913646992450382669030291433862018526502400) [(2, 2), (12, 2)],
  term ((99504804932538997442 : Rat) / 2136607170983346579) [(2, 2), (12, 2), (16, 1)],
  term ((-329972689390869269945257561686066062842595842628006267895489945760431508988413 : Rat) / 77728571336500167846026035983179956823496225191334515145716931009263251200) [(2, 2), (13, 1), (15, 1)],
  term ((-199009609865077994884 : Rat) / 2136607170983346579) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((329972689390869269945257561686066062842595842628006267895489945760431508988413 : Rat) / 155457142673000335692052071966359913646992450382669030291433862018526502400) [(2, 2), (13, 2)],
  term ((99504804932538997442 : Rat) / 2136607170983346579) [(2, 2), (13, 2), (16, 1)],
  term ((-6994449201054531640844037030610303886546877153016627200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1)],
  term ((3497224600527265820422018515305151943273438576508313600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (12, 2)],
  term ((-6994449201054531640844037030610303886546877153016627200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (13, 1), (15, 1)],
  term ((3497224600527265820422018515305151943273438576508313600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1), (13, 2)],
  term ((-868872128907968576194619627244813105388047518713905152000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 1), (13, 2)],
  term ((188605011459112097173799215010104862951350375431766016000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (12, 1), (14, 1)],
  term ((-94302505729556048586899607505052431475675187715883008000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (12, 2)],
  term ((-868872128907968576194619627244813105388047518713905152000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 2), (14, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (10, 1), (12, 3)],
  term ((188605011459112097173799215010104862951350375431766016000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((-94302505729556048586899607505052431475675187715883008000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (10, 1), (13, 2)],
  term ((11551667310583032515927016764277664408408974002272169984000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 1), (13, 2)],
  term ((-582466649749802638190849830243560428888280041554932428800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(3, 1), (5, 1), (12, 1), (14, 1)],
  term ((291233324874901319095424915121780214444140020777466214400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(3, 1), (5, 1), (12, 2)],
  term ((11551667310583032515927016764277664408408974002272169984000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 2), (14, 1)],
  term ((-5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(3, 1), (5, 1), (12, 3)],
  term ((-582466649749802638190849830243560428888280041554932428800 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((291233324874901319095424915121780214444140020777466214400 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(3, 1), (5, 1), (13, 2)],
  term ((100772785711678336 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (12, 2)],
  term ((100772785711678336 : Rat) / 3146696864482101) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(3, 1), (7, 1), (13, 2)],
  term ((3257302521583390609319189265066627186917803 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1)],
  term ((-2770851665077861016604 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3257302521583390609319189265066627186917803 : Rat) / 79134349951295896336425736352731598571000) [(3, 1), (8, 1), (9, 1), (12, 2)],
  term ((1385425832538930508302 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((3257302521583390609319189265066627186917803 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2770851665077861016604 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3257302521583390609319189265066627186917803 : Rat) / 79134349951295896336425736352731598571000) [(3, 1), (8, 1), (9, 1), (13, 2)],
  term ((1385425832538930508302 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((80373380745436854854416538176624087485189180748001308058349711034 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((2094316757468616819344 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-40186690372718427427208269088312043742594590374000654029174855517 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (12, 2)],
  term ((-1047158378734308409672 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((80373380745436854854416538176624087485189180748001308058349711034 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2094316757468616819344 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40186690372718427427208269088312043742594590374000654029174855517 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (8, 1), (11, 1), (13, 2)],
  term ((-1047158378734308409672 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-257668075325577617095682571051581928808343108885897959856829665801 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-37138824971627466237412 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-199135576592036659423962340346224187567795867571864296337360199421 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((202785562231164 : Rat) / 1048898954827367) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((257668075325577617095682571051581928808343108885897959856829665801 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 1), (8, 1), (12, 2), (13, 1)],
  term ((18569412485813733118706 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((199135576592036659423962340346224187567795867571864296337360199421 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((-101392781115582 : Rat) / 1048898954827367) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-199135576592036659423962340346224187567795867571864296337360199421 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((202785562231164 : Rat) / 1048898954827367) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1365759964893844999336906508864467003942776407822950174669909342001020372123 : Rat) / 7263486973786432973272113897900107296012610145935225757153718556988731760) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((-38397200131810937303302 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((257668075325577617095682571051581928808343108885897959856829665801 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(3, 1), (8, 1), (13, 3)],
  term ((18569412485813733118706 : Rat) / 13017774793972194963465) [(3, 1), (8, 1), (13, 3), (16, 1)],
  term ((-2793547474910435620337797452357109501601422 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((9505418205450486962784 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((3963669082363458219760420246026723549719069 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-6743456589562128069384 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3963669082363458219760420246026723549719069 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 1), (10, 1), (12, 2)],
  term ((-2793547474910435620337797452357109501601422 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1)],
  term ((9505418205450486962784 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((3371728294781064034692 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(3, 1), (9, 1), (10, 1), (12, 3)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (12, 3), (16, 1)],
  term ((3963669082363458219760420246026723549719069 : Rat) / 19783587487823974084106434088182899642750) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-6743456589562128069384 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3963669082363458219760420246026723549719069 : Rat) / 39567174975647948168212868176365799285500) [(3, 1), (9, 1), (10, 1), (13, 2)],
  term ((3371728294781064034692 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-6948407091279567622585337464070887843396586 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((70928648098004089678176 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 1), (13, 2)],
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((1233852422723836467056138349865641569401207934716447842485297885518818601632059 : Rat) / 1392538632056749549793439624472707629362605822801887516924435265937510267776) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-72424505318983731337813727 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1233852422723836467056138349865641569401207934716447842485297885518818601632059 : Rat) / 2785077264113499099586879248945415258725211645603775033848870531875020535552) [(3, 1), (9, 1), (12, 2)],
  term ((-6948407091279567622585337464070887843396586 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((70928648098004089678176 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((72424505318983731337813727 : Rat) / 7576344930091817468736630) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(3, 1), (9, 1), (12, 3)],
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (12, 3), (16, 1)],
  term ((1233852422723836467056138349865641569401207934716447842485297885518818601632059 : Rat) / 1392538632056749549793439624472707629362605822801887516924435265937510267776) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-72424505318983731337813727 : Rat) / 3788172465045908734368315) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1233852422723836467056138349865641569401207934716447842485297885518818601632059 : Rat) / 2785077264113499099586879248945415258725211645603775033848870531875020535552) [(3, 1), (9, 1), (13, 2)],
  term ((72424505318983731337813727 : Rat) / 7576344930091817468736630) [(3, 1), (9, 1), (13, 2), (16, 1)],
  term ((34450362560783419843173414231676854389584 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-7184562380340495453824 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-70982072270775927119540229132145124257867559444115568707923718836 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((5096965065571374931424 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((35491036135387963559770114566072562128933779722057784353961859418 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (12, 2)],
  term ((34450362560783419843173414231676854389584 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((-7184562380340495453824 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-2548482532785687465712 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(3, 1), (10, 1), (11, 1), (12, 3)],
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (12, 3), (16, 1)],
  term ((-70982072270775927119540229132145124257867559444115568707923718836 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((5096965065571374931424 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35491036135387963559770114566072562128933779722057784353961859418 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(3, 1), (10, 1), (11, 1), (13, 2)],
  term ((-2548482532785687465712 : Rat) / 619894037808199760165) [(3, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1094726890892043118375518634805037138927779 : Rat) / 2374030498538876890092772090581947957130) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-90385226008292387477752 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((3401703020799072 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1251434127900836305796836115684884489363177794597819016479467790523654713617 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((124389309905872334282992 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 1), (13, 3)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-67174093353364035609855653956022405218251780876720003091265657929 : Rat) / 115632377488187697390245390583798250503555728539752396992928228) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1508231444902776 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1094726890892043118375518634805037138927779 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (10, 1), (12, 2), (13, 1)],
  term ((771550671415912258681082857570897192444402 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((127404894121038055617952 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((45192613004146193738876 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((3401703020799072 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((67174093353364035609855653956022405218251780876720003091265657929 : Rat) / 231264754976375394780490781167596501007111457079504793985856456) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term ((-754115722451388 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(3, 1), (10, 1), (12, 3), (13, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (12, 3), (13, 1), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(3, 1), (10, 1), (12, 3), (15, 1)],
  term ((-1700851510399536 : Rat) / 7342292683791569) [(3, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-67174093353364035609855653956022405218251780876720003091265657929 : Rat) / 115632377488187697390245390583798250503555728539752396992928228) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((1508231444902776 : Rat) / 7342292683791569) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4338600239218925180087757427794498599015781254637445234393035847119034414763 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(3, 1), (10, 1), (13, 2), (15, 1)],
  term ((-91722261872462861630932 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1094726890892043118375518634805037138927779 : Rat) / 4748060997077753780185544181163895914260) [(3, 1), (10, 1), (13, 3)],
  term ((45192613004146193738876 : Rat) / 13017774793972194963465) [(3, 1), (10, 1), (13, 3), (16, 1)],
  term ((-1976522159204377063438149020304315863905456 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-53610612999765299204736 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((7267094166397714870077795971200800843150546617520548469165984007845301244023350229 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((42203804804092010269740076 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7267094166397714870077795971200800843150546617520548469165984007845301244023350229 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1), (12, 2)],
  term ((-1976522159204377063438149020304315863905456 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-53610612999765299204736 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-21101902402046005134870038 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(3, 1), (11, 1), (12, 3)],
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(3, 1), (11, 1), (12, 3), (16, 1)],
  term ((7267094166397714870077795971200800843150546617520548469165984007845301244023350229 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((42203804804092010269740076 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7267094166397714870077795971200800843150546617520548469165984007845301244023350229 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(3, 1), (11, 1), (13, 2)],
  term ((-21101902402046005134870038 : Rat) / 541167495006558390624045) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((1152811343019056646842147349685585379027514838435013730053290058653600390841088943319 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((69020286233386777190247083 : Rat) / 541167495006558390624045) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 21594346495919052487628326691524323281539032304798760138429346579) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-195095839531472352 : Rat) / 7342292683791569) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((171484018444677072085335056302005944788872562472629488421114587243193788341 : Rat) / 26154531284210406796761726998611497465065983035774989866294254063231030) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((374545276538129466578096 : Rat) / 4339258264657398321155) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 1), (13, 3)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 1), (13, 3), (16, 1)],
  term ((-200379267425711529916031946283036419937489027877924071485113761057152211146178493 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4925385351929338187018 : Rat) / 32049107564750198685) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1152811343019056646842147349685585379027514838435013730053290058653600390841088943319 : Rat) / 482340568678656625309702649926734105120472591873003788674701265239105119000912000) [(3, 1), (12, 2), (13, 1)],
  term ((1919082530258311708738182675806734919634326 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((316894943696178215242976 : Rat) / 4339258264657398321155) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-69020286233386777190247083 : Rat) / 1082334990013116781248090) [(3, 1), (12, 2), (13, 1), (16, 1)],
  term ((-73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 21594346495919052487628326691524323281539032304798760138429346579) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-195095839531472352 : Rat) / 7342292683791569) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((200379267425711529916031946283036419937489027877924071485113761057152211146178493 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (12, 2), (15, 1)],
  term ((2462692675964669093509 : Rat) / 32049107564750198685) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(3, 1), (12, 3), (13, 1)],
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(3, 1), (12, 3), (13, 1), (16, 1)],
  term ((73696396504239739499437838051508316488408836536787324382317341055713 : Rat) / 43188692991838104975256653383048646563078064609597520276858693158) [(3, 1), (12, 3), (15, 1)],
  term ((97547919765736176 : Rat) / 7342292683791569) [(3, 1), (12, 3), (15, 1), (16, 1)],
  term ((-200379267425711529916031946283036419937489027877924071485113761057152211146178493 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (13, 1), (15, 2)],
  term ((-4925385351929338187018 : Rat) / 32049107564750198685) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1730702628773185423528393577389924397973478298173233905347835523431701334633771368009 : Rat) / 220498545681671600141578354252221305197930327713373160537006292680733768686131200) [(3, 1), (13, 2), (15, 1)],
  term ((774229815240055362515399872 : Rat) / 3788172465045908734368315) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1152811343019056646842147349685585379027514838435013730053290058653600390841088943319 : Rat) / 482340568678656625309702649926734105120472591873003788674701265239105119000912000) [(3, 1), (13, 3)],
  term ((-69020286233386777190247083 : Rat) / 1082334990013116781248090) [(3, 1), (13, 3), (16, 1)],
  term ((-368968529676595834409399138297440241804984065622162988188976908442947745756869 : Rat) / 1020187498791564702979091722279236933308387955636265511287534719496580172000) [(3, 2), (12, 1), (14, 1)],
  term ((-834636281068661472928 : Rat) / 32049107564750198685) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((368968529676595834409399138297440241804984065622162988188976908442947745756869 : Rat) / 2040374997583129405958183444558473866616775911272531022575069438993160344000) [(3, 2), (12, 2)],
  term ((417318140534330736464 : Rat) / 32049107564750198685) [(3, 2), (12, 2), (16, 1)],
  term ((-368968529676595834409399138297440241804984065622162988188976908442947745756869 : Rat) / 1020187498791564702979091722279236933308387955636265511287534719496580172000) [(3, 2), (13, 1), (15, 1)],
  term ((-834636281068661472928 : Rat) / 32049107564750198685) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((368968529676595834409399138297440241804984065622162988188976908442947745756869 : Rat) / 2040374997583129405958183444558473866616775911272531022575069438993160344000) [(3, 2), (13, 2)],
  term ((417318140534330736464 : Rat) / 32049107564750198685) [(3, 2), (13, 2), (16, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (12, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1), (13, 2)],
  term ((144613656295292093139470098293479573612576300181104844800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-72306828147646046569735049146739786806288150090552422400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (12, 2), (15, 1)],
  term ((144613656295292093139470098293479573612576300181104844800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-72306828147646046569735049146739786806288150090552422400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (13, 2), (15, 1)],
  term ((-417268251993256259972396398541747504656626856808926412800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((208634125996628129986198199270873752328313428404463206400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (12, 2)],
  term ((-417268251993256259972396398541747504656626856808926412800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((208634125996628129986198199270873752328313428404463206400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (10, 1), (13, 2)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 1), (13, 2)],
  term ((2353703448091631846533814888081506876130055181661456281600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1176851724045815923266907444040753438065027590830728140800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (12, 2)],
  term ((571756210217333606809996153258459328857733619190969139200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 2), (14, 1)],
  term ((-285878105108666803404998076629229664428866809595484569600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1), (12, 3)],
  term ((2353703448091631846533814888081506876130055181661456281600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1176851724045815923266907444040753438065027590830728140800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (9, 1), (13, 2)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 3), (15, 1)],
  term ((11445208307152018749942276720439365358264601698684108800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((-271929257484325280553505926876194187898481826275213312000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((135964628742162640276752963438097093949240913137606656000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (12, 2)],
  term ((-271929257484325280553505926876194187898481826275213312000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((135964628742162640276752963438097093949240913137606656000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (11, 1), (13, 2)],
  term ((142939052554333401702499038314614832214433404797742284800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6633467970617516668178502612026521197491087429922538700800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((3316733985308758334089251306013260598745543714961269350400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((543250224376859448022815228164700636360706601745355366400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-71469526277166700851249519157307416107216702398871142400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (12, 2), (13, 1)],
  term ((-6633467970617516668178502612026521197491087429922538700800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-271625112188429724011407614082350318180353300872677683200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (12, 2), (15, 1)],
  term ((3316733985308758334089251306013260598745543714961269350400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 3), (15, 1)],
  term ((543250224376859448022815228164700636360706601745355366400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (13, 1), (15, 2)],
  term ((-671936284010955770331723803932436122326626497820290764800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 2), (15, 1)],
  term ((-71469526277166700851249519157307416107216702398871142400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (13, 3)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1), (8, 1), (12, 2)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1), (8, 1), (13, 2)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 1), (12, 1), (14, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (12, 2)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 1), (13, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (13, 2)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (12, 2), (15, 1)],
  term ((-50386392855839168 : Rat) / 3146696864482101) [(7, 1), (13, 1), (15, 2)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (13, 2), (15, 1)],
  term ((639505431810988571759482334827046828000888 : Rat) / 1413113391987426720293316720584492831625) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((2873912117386514397568 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-319752715905494285879741167413523414000444 : Rat) / 1413113391987426720293316720584492831625) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((-1436956058693257198784 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((639505431810988571759482334827046828000888 : Rat) / 1413113391987426720293316720584492831625) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((2873912117386514397568 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-319752715905494285879741167413523414000444 : Rat) / 1413113391987426720293316720584492831625) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-1436956058693257198784 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-194815516959804318196955220566773567336936 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (13, 3)],
  term ((-2993635195052455382466169328300684935189905474376425964223140685453577491630028930101 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(8, 1), (12, 1), (14, 1)],
  term ((2993635195052455382466169328300684935189905474376425964223140685453577491630028930101 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (12, 2)],
  term ((-2993635195052455382466169328300684935189905474376425964223140685453577491630028930101 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(8, 1), (13, 1), (15, 1)],
  term ((2993635195052455382466169328300684935189905474376425964223140685453577491630028930101 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NYNYN_block_30_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_30_0100_0199
      rs_R009_ueqv_R009NYNYN_block_30_0100_0199 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
