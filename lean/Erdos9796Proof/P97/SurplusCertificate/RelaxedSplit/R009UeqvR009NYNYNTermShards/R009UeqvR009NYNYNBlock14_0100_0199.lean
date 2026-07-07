/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 14:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0100 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (9, 2)]
]

/-- Partial product 100 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0100 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (4, 1), (6, 1), (9, 2)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (5, 1), (7, 1), (9, 2)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (6, 2), (9, 2)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0100_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0100
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0101 : Poly :=
[
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (16, 1)]
]

/-- Partial product 101 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0101 : Poly :=
[
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (6, 1), (9, 2), (16, 1)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (6, 2), (9, 2), (16, 1)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0101_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0101
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0102 : Poly :=
[
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (10, 1)]
]

/-- Partial product 102 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0102 : Poly :=
[
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (4, 1), (6, 1), (10, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (5, 1), (7, 1), (10, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (6, 2), (10, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0102_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0102
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0103 : Poly :=
[
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 103 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0103 : Poly :=
[
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (5, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (6, 2), (10, 1), (11, 1), (13, 1)],
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (7, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0103_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0103
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0104 : Poly :=
[
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 104 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0104 : Poly :=
[
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (5, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0104_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0104
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0105 : Poly :=
[
  term ((-6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 105 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0105 : Poly :=
[
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (5, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0105_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0105
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0106 : Poly :=
[
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0106 : Poly :=
[
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0106_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0106
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0107 : Poly :=
[
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 107 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0107 : Poly :=
[
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (6, 2), (10, 1), (13, 1), (15, 1)],
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0107_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0107
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0108 : Poly :=
[
  term ((523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0108 : Poly :=
[
  term ((1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0108_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0108
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0109 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (13, 2)]
]

/-- Partial product 109 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0109 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 2)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 2)],
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (6, 2), (10, 1), (13, 2)],
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (7, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0109_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0109
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0110 : Poly :=
[
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 110 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0110 : Poly :=
[
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (6, 2), (10, 1), (13, 2), (16, 1)],
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0110_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0110
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0111 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 111 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0111 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (4, 1), (6, 1), (10, 1), (15, 2)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (5, 1), (7, 1), (10, 1), (15, 2)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (6, 2), (10, 1), (15, 2)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (7, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0111_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0111
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0112 : Poly :=
[
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 112 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0112 : Poly :=
[
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (7, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0112_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0112
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0113 : Poly :=
[
  term ((6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 113 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0113 : Poly :=
[
  term ((12905143960765312684 : Rat) / 1526147979273818985) [(2, 1), (4, 1), (6, 1), (10, 1), (16, 1)],
  term ((12905143960765312684 : Rat) / 1526147979273818985) [(2, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (6, 2), (10, 1), (16, 1)],
  term ((-6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0113_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0113
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0114 : Poly :=
[
  term ((995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 114 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0114 : Poly :=
[
  term ((995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((-995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0114_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0114
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0115 : Poly :=
[
  term ((39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 115 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0115 : Poly :=
[
  term ((78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0115_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0115
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0116 : Poly :=
[
  term ((-2804498684777944811937823763023156895718864951992937876256795837291500476639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 116 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0116 : Poly :=
[
  term ((-2804498684777944811937823763023156895718864951992937876256795837291500476639 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2804498684777944811937823763023156895718864951992937876256795837291500476639 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((2804498684777944811937823763023156895718864951992937876256795837291500476639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((2804498684777944811937823763023156895718864951992937876256795837291500476639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0116_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0116
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0117 : Poly :=
[
  term ((-13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0117 : Poly :=
[
  term ((-26307209962806111186576 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-26307209962806111186576 : Rat) / 4339258264657398321155) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0117_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0117
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0118 : Poly :=
[
  term ((7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (11, 2)]
]

/-- Partial product 118 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0118 : Poly :=
[
  term ((15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (4, 1), (6, 1), (11, 2)],
  term ((15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (5, 1), (7, 1), (11, 2)],
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (6, 2), (11, 2)],
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0118_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0118
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0119 : Poly :=
[
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 119 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0119 : Poly :=
[
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0119_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0119
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0120 : Poly :=
[
  term ((-54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (12, 1)]
]

/-- Partial product 120 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0120 : Poly :=
[
  term ((-54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (4, 1), (6, 1), (12, 1)],
  term ((-54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (5, 1), (7, 1), (12, 1)],
  term ((54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (6, 2), (12, 1)],
  term ((54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0120_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0120
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0121 : Poly :=
[
  term ((-904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 121 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0121 : Poly :=
[
  term ((-1809939744691845776614 : Rat) / 32049107564750198685) [(2, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((-1809939744691845776614 : Rat) / 32049107564750198685) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0121_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0121
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0122 : Poly :=
[
  term ((7198186174454180233721592947411664843961120851626567651045478727289289287024722505659 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 122 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0122 : Poly :=
[
  term ((7198186174454180233721592947411664843961120851626567651045478727289289287024722505659 : Rat) / 964681137357313250619405299853468210240945183746007577349402530478210238001824000) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((7198186174454180233721592947411664843961120851626567651045478727289289287024722505659 : Rat) / 964681137357313250619405299853468210240945183746007577349402530478210238001824000) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-7198186174454180233721592947411664843961120851626567651045478727289289287024722505659 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-7198186174454180233721592947411664843961120851626567651045478727289289287024722505659 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0122_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0122
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0123 : Poly :=
[
  term ((3467785353734246864030 : Rat) / 45869982019082263539) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 123 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0123 : Poly :=
[
  term ((6935570707468493728060 : Rat) / 45869982019082263539) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((6935570707468493728060 : Rat) / 45869982019082263539) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3467785353734246864030 : Rat) / 45869982019082263539) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3467785353734246864030 : Rat) / 45869982019082263539) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0123_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0123
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0124 : Poly :=
[
  term ((-150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (13, 2)]
]

/-- Partial product 124 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0124 : Poly :=
[
  term ((-301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (4, 1), (6, 1), (13, 2)],
  term ((-301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (5, 1), (7, 1), (13, 2)],
  term ((150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (6, 2), (13, 2)],
  term ((150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0124_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0124
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0125 : Poly :=
[
  term ((-89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 125 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0125 : Poly :=
[
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (6, 2), (13, 2), (16, 1)],
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0125_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0125
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0126 : Poly :=
[
  term ((-59147950813833053888608104242013521750310787028622564552295170806197634187846941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (15, 2)]
]

/-- Partial product 126 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0126 : Poly :=
[
  term ((-59147950813833053888608104242013521750310787028622564552295170806197634187846941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-59147950813833053888608104242013521750310787028622564552295170806197634187846941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((59147950813833053888608104242013521750310787028622564552295170806197634187846941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (6, 2), (15, 2)],
  term ((59147950813833053888608104242013521750310787028622564552295170806197634187846941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0126_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0126
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0127 : Poly :=
[
  term ((-1165136701556951259491 : Rat) / 32049107564750198685) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0127 : Poly :=
[
  term ((-2330273403113902518982 : Rat) / 32049107564750198685) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2330273403113902518982 : Rat) / 32049107564750198685) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((1165136701556951259491 : Rat) / 32049107564750198685) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((1165136701556951259491 : Rat) / 32049107564750198685) [(2, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0127_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0127
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0128 : Poly :=
[
  term ((2002978514198274202273 : Rat) / 64098215129500397370) [(2, 1), (16, 1)]
]

/-- Partial product 128 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0128 : Poly :=
[
  term ((2002978514198274202273 : Rat) / 32049107564750198685) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((2002978514198274202273 : Rat) / 32049107564750198685) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((-2002978514198274202273 : Rat) / 64098215129500397370) [(2, 1), (6, 2), (16, 1)],
  term ((-2002978514198274202273 : Rat) / 64098215129500397370) [(2, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0128_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0128
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0129 : Poly :=
[
  term ((-17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(2, 2)]
]

/-- Partial product 129 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0129 : Poly :=
[
  term ((-17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 168278350316134383996551211922348360133342343197734517325778922803559616000) [(2, 2), (4, 1), (6, 1)],
  term ((-17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 168278350316134383996551211922348360133342343197734517325778922803559616000) [(2, 2), (5, 1), (7, 1)],
  term ((17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(2, 2), (6, 2)],
  term ((17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(2, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0129_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0129
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0130 : Poly :=
[
  term ((-1157892799853546297 : Rat) / 330403170770620605) [(2, 2), (16, 1)]
]

/-- Partial product 130 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0130 : Poly :=
[
  term ((-2315785599707092594 : Rat) / 330403170770620605) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-2315785599707092594 : Rat) / 330403170770620605) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((1157892799853546297 : Rat) / 330403170770620605) [(2, 2), (6, 2), (16, 1)],
  term ((1157892799853546297 : Rat) / 330403170770620605) [(2, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0130_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0130
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0131 : Poly :=
[
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1)]
]

/-- Partial product 131 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0131 : Poly :=
[
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (6, 2)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (7, 2)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 2), (7, 1)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 2), (5, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0131_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0131
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0132 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 132 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0132 : Poly :=
[
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (6, 2), (11, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (7, 2), (11, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 2), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0132_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0132
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0133 : Poly :=
[
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 133 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0133 : Poly :=
[
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (6, 2), (15, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (7, 2), (15, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 2), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0133_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0133
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0134 : Poly :=
[
  term ((-9370698326362299829488753530631130849179331680840448000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1)]
]

/-- Partial product 134 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0134 : Poly :=
[
  term ((-18741396652724599658977507061262261698358663361680896000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (4, 1), (5, 1), (6, 1)],
  term ((9370698326362299829488753530631130849179331680840448000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (6, 2)],
  term ((9370698326362299829488753530631130849179331680840448000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (7, 2)],
  term ((-18741396652724599658977507061262261698358663361680896000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 2), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0134_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0134
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0135 : Poly :=
[
  term ((6875693987906591993170075419131135666887149230117683200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (8, 1)]
]

/-- Partial product 135 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0135 : Poly :=
[
  term ((13751387975813183986340150838262271333774298460235366400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (6, 1), (8, 1)],
  term ((-6875693987906591993170075419131135666887149230117683200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (6, 2), (8, 1)],
  term ((-6875693987906591993170075419131135666887149230117683200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (7, 2), (8, 1)],
  term ((13751387975813183986340150838262271333774298460235366400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 2), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0135_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0135
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0136 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(3, 1), (7, 1)]
]

/-- Partial product 136 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0136 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(3, 1), (5, 1), (7, 2)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(3, 1), (6, 2), (7, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(3, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0136_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0136
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0137 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (8, 1), (9, 1)]
]

/-- Partial product 137 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0137 : Poly :=
[
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (6, 2), (8, 1), (9, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (7, 2), (8, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0137_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0137
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0138 : Poly :=
[
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 138 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0138 : Poly :=
[
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (7, 2), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0138_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0138
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0139 : Poly :=
[
  term ((-1519831315013258376714118512045652869724175649996256966104441004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 139 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0139 : Poly :=
[
  term ((-3039662630026516753428237024091305739448351299992513932208882008 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1)],
  term ((-3039662630026516753428237024091305739448351299992513932208882008 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1)],
  term ((1519831315013258376714118512045652869724175649996256966104441004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (6, 2), (8, 1), (11, 1)],
  term ((1519831315013258376714118512045652869724175649996256966104441004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (7, 2), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0139_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0139
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0140 : Poly :=
[
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 140 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0140 : Poly :=
[
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0140_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0140
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0141 : Poly :=
[
  term ((-16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 141 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0141 : Poly :=
[
  term ((-16953416082580275643572419449435657933481 : Rat) / 131890583252159827227376227254552664285) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((-16953416082580275643572419449435657933481 : Rat) / 131890583252159827227376227254552664285) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (6, 2), (8, 1), (13, 1)],
  term ((16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (7, 2), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0141_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0141
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0142 : Poly :=
[
  term ((-4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 142 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0142 : Poly :=
[
  term ((-8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (7, 2), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0142_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0142
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0143 : Poly :=
[
  term ((-80852104118004438918766976736530945488840441922658025292535314575 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 143 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0143 : Poly :=
[
  term ((-80852104118004438918766976736530945488840441922658025292535314575 : Rat) / 1599581221919929813898394569742542465299187578133241491735507154) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((-80852104118004438918766976736530945488840441922658025292535314575 : Rat) / 1599581221919929813898394569742542465299187578133241491735507154) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((80852104118004438918766976736530945488840441922658025292535314575 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term ((80852104118004438918766976736530945488840441922658025292535314575 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (7, 2), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0143_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0143
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0144 : Poly :=
[
  term ((2166793211103048 : Rat) / 7342292683791569) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0144 : Poly :=
[
  term ((4333586422206096 : Rat) / 7342292683791569) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((4333586422206096 : Rat) / 7342292683791569) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2166793211103048 : Rat) / 7342292683791569) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-2166793211103048 : Rat) / 7342292683791569) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0144_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0144
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0145 : Poly :=
[
  term ((-1132816408282237921213256816734219505766 : Rat) / 40706970139555502230671675078565637125) [(3, 1), (9, 1)]
]

/-- Partial product 145 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0145 : Poly :=
[
  term ((-2265632816564475842426513633468439011532 : Rat) / 40706970139555502230671675078565637125) [(3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-2265632816564475842426513633468439011532 : Rat) / 40706970139555502230671675078565637125) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((1132816408282237921213256816734219505766 : Rat) / 40706970139555502230671675078565637125) [(3, 1), (6, 2), (9, 1)],
  term ((1132816408282237921213256816734219505766 : Rat) / 40706970139555502230671675078565637125) [(3, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0145_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0145
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0146 : Poly :=
[
  term ((-657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 146 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0146 : Poly :=
[
  term ((-657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (4, 1), (6, 1), (9, 1), (10, 1)],
  term ((-657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1)],
  term ((657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (6, 2), (9, 1), (10, 1)],
  term ((657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (7, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0146_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0146
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0147 : Poly :=
[
  term ((279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 147 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0147 : Poly :=
[
  term ((559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (4, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (7, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0147_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0147
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0148 : Poly :=
[
  term ((936657849993622213536 : Rat) / 4339258264657398321155) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 148 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0148 : Poly :=
[
  term ((1873315699987244427072 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((1873315699987244427072 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-936657849993622213536 : Rat) / 4339258264657398321155) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-936657849993622213536 : Rat) / 4339258264657398321155) [(3, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0148_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0148
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0149 : Poly :=
[
  term ((13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 149 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0149 : Poly :=
[
  term ((27529190067687589412871730581799460468714 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1)],
  term ((27529190067687589412871730581799460468714 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1)],
  term ((-13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((-13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (7, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0149_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0149
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0150 : Poly :=
[
  term ((-211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 150 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0150 : Poly :=
[
  term ((-422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0150_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0150
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0151 : Poly :=
[
  term ((181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 151 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0151 : Poly :=
[
  term ((181690192657766865785367309797072973832799 : Rat) / 949612199415550756037108836232779182852) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1)],
  term ((181690192657766865785367309797072973832799 : Rat) / 949612199415550756037108836232779182852) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((-181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (6, 2), (10, 1), (13, 1)],
  term ((-181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (7, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0151_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0151
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0152 : Poly :=
[
  term ((3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 152 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0152 : Poly :=
[
  term ((7500550714288572467756 : Rat) / 2603554958794438992693) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((7500550714288572467756 : Rat) / 2603554958794438992693) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0152_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0152
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0153 : Poly :=
[
  term ((31224099982334879915446565084921 : Rat) / 2802078426838206511495121931792) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 153 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0153 : Poly :=
[
  term ((31224099982334879915446565084921 : Rat) / 1401039213419103255747560965896) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1)],
  term ((31224099982334879915446565084921 : Rat) / 1401039213419103255747560965896) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term ((-31224099982334879915446565084921 : Rat) / 2802078426838206511495121931792) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term ((-31224099982334879915446565084921 : Rat) / 2802078426838206511495121931792) [(3, 1), (7, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0153_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0153
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0154 : Poly :=
[
  term ((-3326090605728462 : Rat) / 7342292683791569) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0154 : Poly :=
[
  term ((-6652181211456924 : Rat) / 7342292683791569) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6652181211456924 : Rat) / 7342292683791569) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3326090605728462 : Rat) / 7342292683791569) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((3326090605728462 : Rat) / 7342292683791569) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0154_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0154
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0155 : Poly :=
[
  term ((-738135021317161138317437655470065689972442152182263304204655432437244694352406293 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (11, 1)]
]

/-- Partial product 155 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0155 : Poly :=
[
  term ((-738135021317161138317437655470065689972442152182263304204655432437244694352406293 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-738135021317161138317437655470065689972442152182263304204655432437244694352406293 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((738135021317161138317437655470065689972442152182263304204655432437244694352406293 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (6, 2), (11, 1)],
  term ((738135021317161138317437655470065689972442152182263304204655432437244694352406293 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0155_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0155
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0156 : Poly :=
[
  term ((-13415468409052974251640502 : Rat) / 1262724155015302911456105) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 156 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0156 : Poly :=
[
  term ((-26830936818105948503281004 : Rat) / 1262724155015302911456105) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-26830936818105948503281004 : Rat) / 1262724155015302911456105) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((13415468409052974251640502 : Rat) / 1262724155015302911456105) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((13415468409052974251640502 : Rat) / 1262724155015302911456105) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0156_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0156
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0157 : Poly :=
[
  term ((134103603860077291616902966477158155580651906051516368087747143573826784946452924437 : Rat) / 128624151647641766749254039980462428032126024499467676979920337397094698400243200) [(3, 1), (13, 1)]
]

/-- Partial product 157 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0157 : Poly :=
[
  term ((134103603860077291616902966477158155580651906051516368087747143573826784946452924437 : Rat) / 64312075823820883374627019990231214016063012249733838489960168698547349200121600) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((134103603860077291616902966477158155580651906051516368087747143573826784946452924437 : Rat) / 64312075823820883374627019990231214016063012249733838489960168698547349200121600) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((-134103603860077291616902966477158155580651906051516368087747143573826784946452924437 : Rat) / 128624151647641766749254039980462428032126024499467676979920337397094698400243200) [(3, 1), (6, 2), (13, 1)],
  term ((-134103603860077291616902966477158155580651906051516368087747143573826784946452924437 : Rat) / 128624151647641766749254039980462428032126024499467676979920337397094698400243200) [(3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0157_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0157
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0158 : Poly :=
[
  term ((29295938985786968339811086 : Rat) / 1262724155015302911456105) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 158 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0158 : Poly :=
[
  term ((58591877971573936679622172 : Rat) / 1262724155015302911456105) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((58591877971573936679622172 : Rat) / 1262724155015302911456105) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-29295938985786968339811086 : Rat) / 1262724155015302911456105) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-29295938985786968339811086 : Rat) / 1262724155015302911456105) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0158_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0158
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0159 : Poly :=
[
  term ((1870371057760875194847555536247318274197820891152807385407358121724515501385053 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (15, 1)]
]

/-- Partial product 159 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0159 : Poly :=
[
  term ((1870371057760875194847555536247318274197820891152807385407358121724515501385053 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((1870371057760875194847555536247318274197820891152807385407358121724515501385053 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1870371057760875194847555536247318274197820891152807385407358121724515501385053 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (6, 2), (15, 1)],
  term ((-1870371057760875194847555536247318274197820891152807385407358121724515501385053 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0159_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0159
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0160 : Poly :=
[
  term ((-7607998852578432877 : Rat) / 64098215129500397370) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0160 : Poly :=
[
  term ((-7607998852578432877 : Rat) / 32049107564750198685) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-7607998852578432877 : Rat) / 32049107564750198685) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((7607998852578432877 : Rat) / 64098215129500397370) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((7607998852578432877 : Rat) / 64098215129500397370) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0160_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0160
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0161 : Poly :=
[
  term ((-16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(3, 2)]
]

/-- Partial product 161 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0161 : Poly :=
[
  term ((-16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 168278350316134383996551211922348360133342343197734517325778922803559616000) [(3, 2), (4, 1), (6, 1)],
  term ((-16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 168278350316134383996551211922348360133342343197734517325778922803559616000) [(3, 2), (5, 1), (7, 1)],
  term ((16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(3, 2), (6, 2)],
  term ((16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(3, 2), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0161_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0161
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0162 : Poly :=
[
  term ((-1157892799853546297 : Rat) / 330403170770620605) [(3, 2), (16, 1)]
]

/-- Partial product 162 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0162 : Poly :=
[
  term ((-2315785599707092594 : Rat) / 330403170770620605) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-2315785599707092594 : Rat) / 330403170770620605) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((1157892799853546297 : Rat) / 330403170770620605) [(3, 2), (6, 2), (16, 1)],
  term ((1157892799853546297 : Rat) / 330403170770620605) [(3, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0162_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0162
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0163 : Poly :=
[
  term ((304727429293340559979067507625630346656269166863564800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1)]
]

/-- Partial product 163 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0163 : Poly :=
[
  term ((609454858586681119958135015251260693312538333727129600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (7, 1)],
  term ((-304727429293340559979067507625630346656269166863564800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (6, 2)],
  term ((-304727429293340559979067507625630346656269166863564800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (7, 2)],
  term ((609454858586681119958135015251260693312538333727129600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 2), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0163_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0163
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0164 : Poly :=
[
  term ((3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (9, 1)]
]

/-- Partial product 164 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0164 : Poly :=
[
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 2), (9, 1)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (7, 2), (9, 1)],
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 2), (7, 1), (9, 1)],
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 2), (5, 1), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0164_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0164
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0165 : Poly :=
[
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 165 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0165 : Poly :=
[
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (6, 2), (9, 1), (11, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 2), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0165_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0165
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0166 : Poly :=
[
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 166 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0166 : Poly :=
[
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 2), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0166_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0166
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0167 : Poly :=
[
  term ((-282803703399396662571964231890743315672911258509167104000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 167 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0167 : Poly :=
[
  term ((-565607406798793325143928463781486631345822517018334208000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((282803703399396662571964231890743315672911258509167104000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (6, 2), (9, 1), (15, 1)],
  term ((282803703399396662571964231890743315672911258509167104000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((-565607406798793325143928463781486631345822517018334208000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 2), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0167_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0167
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0168 : Poly :=
[
  term ((-298699476768180240425044496729751155626717670165409382400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 168 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0168 : Poly :=
[
  term ((-597398953536360480850088993459502311253435340330818764800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1)],
  term ((298699476768180240425044496729751155626717670165409382400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (8, 1), (11, 1)],
  term ((298699476768180240425044496729751155626717670165409382400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (8, 1), (11, 1)],
  term ((-597398953536360480850088993459502311253435340330818764800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0168_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0168
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0169 : Poly :=
[
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 169 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0169 : Poly :=
[
  term ((2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (6, 2), (8, 1), (13, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 2), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0169_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0169
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0170 : Poly :=
[
  term ((46669207602519671886992850426976297941630574076788633600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 170 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0170 : Poly :=
[
  term ((93338415205039343773985700853952595883261148153577267200 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(4, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((-46669207602519671886992850426976297941630574076788633600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (6, 2), (8, 1), (15, 1)],
  term ((-46669207602519671886992850426976297941630574076788633600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (7, 2), (8, 1), (15, 1)],
  term ((93338415205039343773985700853952595883261148153577267200 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 2), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0170_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0170
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0171 : Poly :=
[
  term ((11070469634551853639504442301993990087338349141980774400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (9, 1)]
]

/-- Partial product 171 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0171 : Poly :=
[
  term ((22140939269103707279008884603987980174676698283961548800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (9, 1)],
  term ((-11070469634551853639504442301993990087338349141980774400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (9, 1)],
  term ((-11070469634551853639504442301993990087338349141980774400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (9, 1)],
  term ((22140939269103707279008884603987980174676698283961548800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0171_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0171
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0172 : Poly :=
[
  term ((-2225379553048743554549119844914530735858862272833740800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 172 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0172 : Poly :=
[
  term ((-4450759106097487109098239689829061471717724545667481600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1)],
  term ((2225379553048743554549119844914530735858862272833740800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (9, 1), (10, 1)],
  term ((2225379553048743554549119844914530735858862272833740800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (9, 1), (10, 1)],
  term ((-4450759106097487109098239689829061471717724545667481600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0172_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0172
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0173 : Poly :=
[
  term ((-2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (12, 1)]
]

/-- Partial product 173 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0173 : Poly :=
[
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (9, 1), (12, 1)],
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (9, 1), (12, 1)],
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0173_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0173
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0174 : Poly :=
[
  term ((-217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 174 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0174 : Poly :=
[
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (10, 1), (12, 1), (13, 1)],
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 1)],
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0174_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0174
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0175 : Poly :=
[
  term ((108609016113496072024327453405601638173505939839238144000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 175 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0175 : Poly :=
[
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-108609016113496072024327453405601638173505939839238144000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (10, 1), (12, 1), (15, 1)],
  term ((-108609016113496072024327453405601638173505939839238144000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1)],
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0175_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0175
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0176 : Poly :=
[
  term ((47151252864778024293449803752526215737837593857941504000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 176 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0176 : Poly :=
[
  term ((94302505729556048586899607505052431475675187715883008000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1)],
  term ((-47151252864778024293449803752526215737837593857941504000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (10, 1), (13, 1)],
  term ((-47151252864778024293449803752526215737837593857941504000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((94302505729556048586899607505052431475675187715883008000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0176_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0176
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0177 : Poly :=
[
  term ((-185933407252215311113055581894344751761358326342758400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 177 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0177 : Poly :=
[
  term ((-371866814504430622226111163788689503522716652685516800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((185933407252215311113055581894344751761358326342758400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 1), (6, 2), (10, 1), (15, 1)],
  term ((185933407252215311113055581894344751761358326342758400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 1), (7, 2), (10, 1), (15, 1)],
  term ((-371866814504430622226111163788689503522716652685516800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 2), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0177_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0177
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0178 : Poly :=
[
  term ((145469993927878976242656307423575516864504968966309632000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1)]
]

/-- Partial product 178 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0178 : Poly :=
[
  term ((290939987855757952485312614847151033729009937932619264000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((-145469993927878976242656307423575516864504968966309632000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (11, 1)],
  term ((-145469993927878976242656307423575516864504968966309632000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (11, 1)],
  term ((290939987855757952485312614847151033729009937932619264000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0178_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0178
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0179 : Poly :=
[
  term ((5364941393977508789035442212705952511686532046258176000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 179 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0179 : Poly :=
[
  term ((10729882787955017578070884425411905023373064092516352000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-5364941393977508789035442212705952511686532046258176000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((-5364941393977508789035442212705952511686532046258176000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (11, 1), (12, 1)],
  term ((10729882787955017578070884425411905023373064092516352000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0179_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0179
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0180 : Poly :=
[
  term ((2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 180 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0180 : Poly :=
[
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (7, 2), (12, 1), (13, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 2), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0180_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0180
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0181 : Poly :=
[
  term ((-1613026368701175366366283260686640225232393285270683443200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 181 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0181 : Poly :=
[
  term ((-3226052737402350732732566521373280450464786570541366886400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((1613026368701175366366283260686640225232393285270683443200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((1613026368701175366366283260686640225232393285270683443200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (7, 2), (12, 1), (15, 1)],
  term ((-3226052737402350732732566521373280450464786570541366886400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0181_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0181
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0182 : Poly :=
[
  term ((-152979961061564441318100693822186974687604132349335449600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (13, 1)]
]

/-- Partial product 182 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0182 : Poly :=
[
  term ((-305959922123128882636201387644373949375208264698670899200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((152979961061564441318100693822186974687604132349335449600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (6, 2), (13, 1)],
  term ((152979961061564441318100693822186974687604132349335449600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (7, 2), (13, 1)],
  term ((-305959922123128882636201387644373949375208264698670899200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0182_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0182
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0183 : Poly :=
[
  term ((31242012810059042826728079868033646577422709786912972800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (15, 1)]
]

/-- Partial product 183 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0183 : Poly :=
[
  term ((62484025620118085653456159736067293154845419573825945600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-31242012810059042826728079868033646577422709786912972800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (15, 1)],
  term ((-31242012810059042826728079868033646577422709786912972800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (15, 1)],
  term ((62484025620118085653456159736067293154845419573825945600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0183_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0183
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0184 : Poly :=
[
  term ((5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2)]
]

/-- Partial product 184 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0184 : Poly :=
[
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 2), (6, 1)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (6, 2)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 2)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 3), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0184_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0184
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0185 : Poly :=
[
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (8, 1)]
]

/-- Partial product 185 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0185 : Poly :=
[
  term ((-6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 2), (6, 1), (8, 1)],
  term ((3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (6, 2), (8, 1)],
  term ((3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 2), (8, 1)],
  term ((-6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 3), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0185_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0185
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0186 : Poly :=
[
  term ((-25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(6, 1)]
]

/-- Partial product 186 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0186 : Poly :=
[
  term ((-25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(4, 1), (6, 2)],
  term ((-25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(5, 1), (6, 1), (7, 1)],
  term ((25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(6, 1), (7, 2)],
  term ((25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0186_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0186
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0187 : Poly :=
[
  term ((-3149149553489948 : Rat) / 1048898954827367) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 187 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0187 : Poly :=
[
  term ((-6298299106979896 : Rat) / 1048898954827367) [(4, 1), (6, 2), (7, 1), (9, 1)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(5, 1), (6, 1), (7, 2), (9, 1)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(6, 1), (7, 3), (9, 1)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(6, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0187_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0187
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0188 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0188 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(4, 1), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 3), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0188_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0188
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0189 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 189 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0189 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 3), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0189_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0189
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0190 : Poly :=
[
  term ((-1574574776744974 : Rat) / 3146696864482101) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 190 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0190 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(4, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(6, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0190_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0190
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0191 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 191 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0191 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 2), (9, 1), (15, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0191_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0191
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0192 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0192 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(6, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0192_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0192
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0193 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (9, 2), (16, 1)]
]

/-- Partial product 193 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0193 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 2), (9, 2), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0193_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0193
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0194 : Poly :=
[
  term ((-2126542509396333451636 : Rat) / 32049107564750198685) [(6, 1), (16, 1)]
]

/-- Partial product 194 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0194 : Poly :=
[
  term ((-4253085018792666903272 : Rat) / 32049107564750198685) [(4, 1), (6, 2), (16, 1)],
  term ((-4253085018792666903272 : Rat) / 32049107564750198685) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(6, 1), (7, 2), (16, 1)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0194_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0194
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0195 : Poly :=
[
  term ((25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(6, 2)]
]

/-- Partial product 195 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0195 : Poly :=
[
  term ((25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(4, 1), (6, 3)],
  term ((25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(5, 1), (6, 2), (7, 1)],
  term ((-25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(6, 2), (7, 2)],
  term ((-25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(6, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0195_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0195
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0196 : Poly :=
[
  term ((1063271254698166725818 : Rat) / 32049107564750198685) [(6, 2), (16, 1)]
]

/-- Partial product 196 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0196 : Poly :=
[
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(4, 1), (6, 3), (16, 1)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-1063271254698166725818 : Rat) / 32049107564750198685) [(6, 2), (7, 2), (16, 1)],
  term ((-1063271254698166725818 : Rat) / 32049107564750198685) [(6, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0196_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0196
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0197 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 197 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0197 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0197_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0197
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0198 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 198 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0198 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 3), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0198_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0198
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0199 : Poly :=
[
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 199 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0199 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(7, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0199_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0199
        rs_R009_ueqv_R009NYNYN_generator_14_0100_0199 =
      rs_R009_ueqv_R009NYNYN_partial_14_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_14_0100_0199 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_14_0100,
  rs_R009_ueqv_R009NYNYN_partial_14_0101,
  rs_R009_ueqv_R009NYNYN_partial_14_0102,
  rs_R009_ueqv_R009NYNYN_partial_14_0103,
  rs_R009_ueqv_R009NYNYN_partial_14_0104,
  rs_R009_ueqv_R009NYNYN_partial_14_0105,
  rs_R009_ueqv_R009NYNYN_partial_14_0106,
  rs_R009_ueqv_R009NYNYN_partial_14_0107,
  rs_R009_ueqv_R009NYNYN_partial_14_0108,
  rs_R009_ueqv_R009NYNYN_partial_14_0109,
  rs_R009_ueqv_R009NYNYN_partial_14_0110,
  rs_R009_ueqv_R009NYNYN_partial_14_0111,
  rs_R009_ueqv_R009NYNYN_partial_14_0112,
  rs_R009_ueqv_R009NYNYN_partial_14_0113,
  rs_R009_ueqv_R009NYNYN_partial_14_0114,
  rs_R009_ueqv_R009NYNYN_partial_14_0115,
  rs_R009_ueqv_R009NYNYN_partial_14_0116,
  rs_R009_ueqv_R009NYNYN_partial_14_0117,
  rs_R009_ueqv_R009NYNYN_partial_14_0118,
  rs_R009_ueqv_R009NYNYN_partial_14_0119,
  rs_R009_ueqv_R009NYNYN_partial_14_0120,
  rs_R009_ueqv_R009NYNYN_partial_14_0121,
  rs_R009_ueqv_R009NYNYN_partial_14_0122,
  rs_R009_ueqv_R009NYNYN_partial_14_0123,
  rs_R009_ueqv_R009NYNYN_partial_14_0124,
  rs_R009_ueqv_R009NYNYN_partial_14_0125,
  rs_R009_ueqv_R009NYNYN_partial_14_0126,
  rs_R009_ueqv_R009NYNYN_partial_14_0127,
  rs_R009_ueqv_R009NYNYN_partial_14_0128,
  rs_R009_ueqv_R009NYNYN_partial_14_0129,
  rs_R009_ueqv_R009NYNYN_partial_14_0130,
  rs_R009_ueqv_R009NYNYN_partial_14_0131,
  rs_R009_ueqv_R009NYNYN_partial_14_0132,
  rs_R009_ueqv_R009NYNYN_partial_14_0133,
  rs_R009_ueqv_R009NYNYN_partial_14_0134,
  rs_R009_ueqv_R009NYNYN_partial_14_0135,
  rs_R009_ueqv_R009NYNYN_partial_14_0136,
  rs_R009_ueqv_R009NYNYN_partial_14_0137,
  rs_R009_ueqv_R009NYNYN_partial_14_0138,
  rs_R009_ueqv_R009NYNYN_partial_14_0139,
  rs_R009_ueqv_R009NYNYN_partial_14_0140,
  rs_R009_ueqv_R009NYNYN_partial_14_0141,
  rs_R009_ueqv_R009NYNYN_partial_14_0142,
  rs_R009_ueqv_R009NYNYN_partial_14_0143,
  rs_R009_ueqv_R009NYNYN_partial_14_0144,
  rs_R009_ueqv_R009NYNYN_partial_14_0145,
  rs_R009_ueqv_R009NYNYN_partial_14_0146,
  rs_R009_ueqv_R009NYNYN_partial_14_0147,
  rs_R009_ueqv_R009NYNYN_partial_14_0148,
  rs_R009_ueqv_R009NYNYN_partial_14_0149,
  rs_R009_ueqv_R009NYNYN_partial_14_0150,
  rs_R009_ueqv_R009NYNYN_partial_14_0151,
  rs_R009_ueqv_R009NYNYN_partial_14_0152,
  rs_R009_ueqv_R009NYNYN_partial_14_0153,
  rs_R009_ueqv_R009NYNYN_partial_14_0154,
  rs_R009_ueqv_R009NYNYN_partial_14_0155,
  rs_R009_ueqv_R009NYNYN_partial_14_0156,
  rs_R009_ueqv_R009NYNYN_partial_14_0157,
  rs_R009_ueqv_R009NYNYN_partial_14_0158,
  rs_R009_ueqv_R009NYNYN_partial_14_0159,
  rs_R009_ueqv_R009NYNYN_partial_14_0160,
  rs_R009_ueqv_R009NYNYN_partial_14_0161,
  rs_R009_ueqv_R009NYNYN_partial_14_0162,
  rs_R009_ueqv_R009NYNYN_partial_14_0163,
  rs_R009_ueqv_R009NYNYN_partial_14_0164,
  rs_R009_ueqv_R009NYNYN_partial_14_0165,
  rs_R009_ueqv_R009NYNYN_partial_14_0166,
  rs_R009_ueqv_R009NYNYN_partial_14_0167,
  rs_R009_ueqv_R009NYNYN_partial_14_0168,
  rs_R009_ueqv_R009NYNYN_partial_14_0169,
  rs_R009_ueqv_R009NYNYN_partial_14_0170,
  rs_R009_ueqv_R009NYNYN_partial_14_0171,
  rs_R009_ueqv_R009NYNYN_partial_14_0172,
  rs_R009_ueqv_R009NYNYN_partial_14_0173,
  rs_R009_ueqv_R009NYNYN_partial_14_0174,
  rs_R009_ueqv_R009NYNYN_partial_14_0175,
  rs_R009_ueqv_R009NYNYN_partial_14_0176,
  rs_R009_ueqv_R009NYNYN_partial_14_0177,
  rs_R009_ueqv_R009NYNYN_partial_14_0178,
  rs_R009_ueqv_R009NYNYN_partial_14_0179,
  rs_R009_ueqv_R009NYNYN_partial_14_0180,
  rs_R009_ueqv_R009NYNYN_partial_14_0181,
  rs_R009_ueqv_R009NYNYN_partial_14_0182,
  rs_R009_ueqv_R009NYNYN_partial_14_0183,
  rs_R009_ueqv_R009NYNYN_partial_14_0184,
  rs_R009_ueqv_R009NYNYN_partial_14_0185,
  rs_R009_ueqv_R009NYNYN_partial_14_0186,
  rs_R009_ueqv_R009NYNYN_partial_14_0187,
  rs_R009_ueqv_R009NYNYN_partial_14_0188,
  rs_R009_ueqv_R009NYNYN_partial_14_0189,
  rs_R009_ueqv_R009NYNYN_partial_14_0190,
  rs_R009_ueqv_R009NYNYN_partial_14_0191,
  rs_R009_ueqv_R009NYNYN_partial_14_0192,
  rs_R009_ueqv_R009NYNYN_partial_14_0193,
  rs_R009_ueqv_R009NYNYN_partial_14_0194,
  rs_R009_ueqv_R009NYNYN_partial_14_0195,
  rs_R009_ueqv_R009NYNYN_partial_14_0196,
  rs_R009_ueqv_R009NYNYN_partial_14_0197,
  rs_R009_ueqv_R009NYNYN_partial_14_0198,
  rs_R009_ueqv_R009NYNYN_partial_14_0199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_14_0100_0199 : Poly :=
[
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (4, 1), (6, 1), (9, 2)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (6, 1), (9, 2), (16, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (4, 1), (6, 1), (10, 1)],
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 2)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (4, 1), (6, 1), (10, 1), (15, 2)],
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((12905143960765312684 : Rat) / 1526147979273818985) [(2, 1), (4, 1), (6, 1), (10, 1), (16, 1)],
  term ((995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2804498684777944811937823763023156895718864951992937876256795837291500476639 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-26307209962806111186576 : Rat) / 4339258264657398321155) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (4, 1), (6, 1), (11, 2)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (4, 1), (6, 1), (12, 1)],
  term ((-1809939744691845776614 : Rat) / 32049107564750198685) [(2, 1), (4, 1), (6, 1), (12, 1), (16, 1)],
  term ((7198186174454180233721592947411664843961120851626567651045478727289289287024722505659 : Rat) / 964681137357313250619405299853468210240945183746007577349402530478210238001824000) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((6935570707468493728060 : Rat) / 45869982019082263539) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (4, 1), (6, 1), (13, 2)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-59147950813833053888608104242013521750310787028622564552295170806197634187846941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((-2330273403113902518982 : Rat) / 32049107564750198685) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((2002978514198274202273 : Rat) / 32049107564750198685) [(2, 1), (4, 1), (6, 1), (16, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(2, 1), (5, 1), (7, 1), (9, 2)],
  term ((1879777754871005800368 : Rat) / 4339258264657398321155) [(2, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 2086273003663731498934747898321547920876048989031217814493936031690348000) [(2, 1), (5, 1), (7, 1), (10, 1)],
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (5, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (5, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (5, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 453967935861652060829507118618756706000788134120951609822107409811795735) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((1046989015419425352728 : Rat) / 13017774793972194963465) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 2)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (5, 1), (7, 1), (10, 1), (15, 2)],
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((12905143960765312684 : Rat) / 1526147979273818985) [(2, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((78914028939959044597232 : Rat) / 4339258264657398321155) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2804498684777944811937823763023156895718864951992937876256795837291500476639 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-26307209962806111186576 : Rat) / 4339258264657398321155) [(2, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((15487774304173030283638147393596705311864 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (5, 1), (7, 1), (11, 2)],
  term ((-1420808663978934320448 : Rat) / 619894037808199760165) [(2, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (5, 1), (7, 1), (12, 1)],
  term ((-1809939744691845776614 : Rat) / 32049107564750198685) [(2, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((7198186174454180233721592947411664843961120851626567651045478727289289287024722505659 : Rat) / 964681137357313250619405299853468210240945183746007577349402530478210238001824000) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((6935570707468493728060 : Rat) / 45869982019082263539) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-301882962373918160325031058569543298499290246246665404104834077742 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (5, 1), (7, 1), (13, 2)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-59147950813833053888608104242013521750310787028622564552295170806197634187846941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (5, 1), (7, 1), (15, 2)],
  term ((-2330273403113902518982 : Rat) / 32049107564750198685) [(2, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((2002978514198274202273 : Rat) / 32049107564750198685) [(2, 1), (5, 1), (7, 1), (16, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (6, 2), (9, 2)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (6, 2), (9, 2), (16, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (6, 2), (10, 1)],
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (6, 2), (10, 1), (11, 1), (13, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (6, 2), (10, 1), (13, 1), (15, 1)],
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (6, 2), (10, 1), (13, 2)],
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (6, 2), (10, 1), (13, 2), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (6, 2), (10, 1), (15, 2)],
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (6, 2), (10, 1), (16, 1)],
  term ((-995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((-39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((2804498684777944811937823763023156895718864951992937876256795837291500476639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (6, 2), (11, 2)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (6, 2), (11, 2), (16, 1)],
  term ((54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (6, 2), (12, 1)],
  term ((904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((-7198186174454180233721592947411664843961120851626567651045478727289289287024722505659 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-3467785353734246864030 : Rat) / 45869982019082263539) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (6, 2), (13, 2)],
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (6, 2), (13, 2), (16, 1)],
  term ((59147950813833053888608104242013521750310787028622564552295170806197634187846941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (6, 2), (15, 2)],
  term ((1165136701556951259491 : Rat) / 32049107564750198685) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-2002978514198274202273 : Rat) / 64098215129500397370) [(2, 1), (6, 2), (16, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(2, 1), (7, 2), (9, 2)],
  term ((-939888877435502900184 : Rat) / 4339258264657398321155) [(2, 1), (7, 2), (9, 2), (16, 1)],
  term ((-1019898178972290171897400119670288132642053437579546564666613999360699421283 : Rat) / 4172546007327462997869495796643095841752097978062435628987872063380696000) [(2, 1), (7, 2), (10, 1)],
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (7, 2), (10, 1), (11, 1), (13, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((6557251471745938753952257438139679272942 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1)],
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((18417695491246389342597823149181200993203089191734528016782196467103201013 : Rat) / 907935871723304121659014237237513412001576268241903219644214819623591470) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-523494507709712676364 : Rat) / 13017774793972194963465) [(2, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (7, 2), (10, 1), (13, 2)],
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(2, 1), (7, 2), (10, 1), (15, 2)],
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6452571980382656342 : Rat) / 1526147979273818985) [(2, 1), (7, 2), (10, 1), (16, 1)],
  term ((-995111911362177661102667859247722883764650335293818204327787980041 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (7, 2), (11, 1), (13, 1)],
  term ((-39457014469979522298616 : Rat) / 4339258264657398321155) [(2, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((2804498684777944811937823763023156895718864951992937876256795837291500476639 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((13153604981403055593288 : Rat) / 4339258264657398321155) [(2, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7743887152086515141819073696798352655932 : Rat) / 122120910418666506692015025235696911375) [(2, 1), (7, 2), (11, 2)],
  term ((710404331989467160224 : Rat) / 619894037808199760165) [(2, 1), (7, 2), (11, 2), (16, 1)],
  term ((54358964859911981079809805002458872975897863499072635515716633063953340510789227 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (7, 2), (12, 1)],
  term ((904969872345922888307 : Rat) / 32049107564750198685) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((-7198186174454180233721592947411664843961120851626567651045478727289289287024722505659 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-3467785353734246864030 : Rat) / 45869982019082263539) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((150941481186959080162515529284771649249645123123332702052417038871 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (7, 2), (13, 2)],
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (7, 2), (13, 2), (16, 1)],
  term ((59147950813833053888608104242013521750310787028622564552295170806197634187846941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (7, 2), (15, 2)],
  term ((1165136701556951259491 : Rat) / 32049107564750198685) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((-2002978514198274202273 : Rat) / 64098215129500397370) [(2, 1), (7, 2), (16, 1)],
  term ((-17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 168278350316134383996551211922348360133342343197734517325778922803559616000) [(2, 2), (4, 1), (6, 1)],
  term ((-2315785599707092594 : Rat) / 330403170770620605) [(2, 2), (4, 1), (6, 1), (16, 1)],
  term ((-17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 168278350316134383996551211922348360133342343197734517325778922803559616000) [(2, 2), (5, 1), (7, 1)],
  term ((-2315785599707092594 : Rat) / 330403170770620605) [(2, 2), (5, 1), (7, 1), (16, 1)],
  term ((17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(2, 2), (6, 2)],
  term ((1157892799853546297 : Rat) / 330403170770620605) [(2, 2), (6, 2), (16, 1)],
  term ((17134511317086755677925508519583357497040028362904802533113725455453974052267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(2, 2), (7, 2)],
  term ((1157892799853546297 : Rat) / 330403170770620605) [(2, 2), (7, 2), (16, 1)],
  term ((-18741396652724599658977507061262261698358663361680896000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (4, 1), (5, 1), (6, 1)],
  term ((13751387975813183986340150838262271333774298460235366400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (6, 1), (8, 1)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (6, 2)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 1), (7, 2)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (5, 2), (7, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(3, 1), (4, 1), (6, 1), (7, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-3039662630026516753428237024091305739448351299992513932208882008 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-16953416082580275643572419449435657933481 : Rat) / 131890583252159827227376227254552664285) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1)],
  term ((-8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-80852104118004438918766976736530945488840441922658025292535314575 : Rat) / 1599581221919929813898394569742542465299187578133241491735507154) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1)],
  term ((4333586422206096 : Rat) / 7342292683791569) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2265632816564475842426513633468439011532 : Rat) / 40706970139555502230671675078565637125) [(3, 1), (4, 1), (6, 1), (9, 1)],
  term ((-657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (4, 1), (6, 1), (9, 1), (10, 1)],
  term ((559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (4, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((1873315699987244427072 : Rat) / 4339258264657398321155) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((27529190067687589412871730581799460468714 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1)],
  term ((-422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((181690192657766865785367309797072973832799 : Rat) / 949612199415550756037108836232779182852) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1)],
  term ((7500550714288572467756 : Rat) / 2603554958794438992693) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((31224099982334879915446565084921 : Rat) / 1401039213419103255747560965896) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1)],
  term ((-6652181211456924 : Rat) / 7342292683791569) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-738135021317161138317437655470065689972442152182263304204655432437244694352406293 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (4, 1), (6, 1), (11, 1)],
  term ((-26830936818105948503281004 : Rat) / 1262724155015302911456105) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((134103603860077291616902966477158155580651906051516368087747143573826784946452924437 : Rat) / 64312075823820883374627019990231214016063012249733838489960168698547349200121600) [(3, 1), (4, 1), (6, 1), (13, 1)],
  term ((58591877971573936679622172 : Rat) / 1262724155015302911456105) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((1870371057760875194847555536247318274197820891152807385407358121724515501385053 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (4, 1), (6, 1), (15, 1)],
  term ((-7607998852578432877 : Rat) / 32049107564750198685) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (6, 2), (11, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (6, 2), (15, 1)],
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 1), (7, 2), (11, 1)],
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 1), (7, 2), (15, 1)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 2), (5, 1), (6, 1)],
  term ((77617786371202384100628504234750470365835243724800 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (4, 2), (6, 1), (11, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (4, 2), (6, 1), (15, 1)],
  term ((9370698326362299829488753530631130849179331680840448000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 1), (6, 2)],
  term ((-6875693987906591993170075419131135666887149230117683200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (6, 2), (8, 1)],
  term ((61383100868391460691624219863627756944791 : Rat) / 1099088193767998560228135227121272202375) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1)],
  term ((-1879777754871005800368 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-3039662630026516753428237024091305739448351299992513932208882008 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1)],
  term ((1420808663978934320448 : Rat) / 619894037808199760165) [(3, 1), (5, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-16953416082580275643572419449435657933481 : Rat) / 131890583252159827227376227254552664285) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1)],
  term ((-8398469190729412326768 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-80852104118004438918766976736530945488840441922658025292535314575 : Rat) / 1599581221919929813898394569742542465299187578133241491735507154) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1)],
  term ((4333586422206096 : Rat) / 7342292683791569) [(3, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-2265632816564475842426513633468439011532 : Rat) / 40706970139555502230671675078565637125) [(3, 1), (5, 1), (7, 1), (9, 1)],
  term ((-657844257958645086149263147309980627304289 : Rat) / 7913434995129589633642573635273159857100) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1)],
  term ((559600726505610269652 : Rat) / 867851652931479664231) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((1873315699987244427072 : Rat) / 4339258264657398321155) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((27529190067687589412871730581799460468714 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1)],
  term ((-422967852730355108272 : Rat) / 123978807561639952033) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((181690192657766865785367309797072973832799 : Rat) / 949612199415550756037108836232779182852) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1)],
  term ((7500550714288572467756 : Rat) / 2603554958794438992693) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((31224099982334879915446565084921 : Rat) / 1401039213419103255747560965896) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1)],
  term ((-6652181211456924 : Rat) / 7342292683791569) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-738135021317161138317437655470065689972442152182263304204655432437244694352406293 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-26830936818105948503281004 : Rat) / 1262724155015302911456105) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((134103603860077291616902966477158155580651906051516368087747143573826784946452924437 : Rat) / 64312075823820883374627019990231214016063012249733838489960168698547349200121600) [(3, 1), (5, 1), (7, 1), (13, 1)],
  term ((58591877971573936679622172 : Rat) / 1262724155015302911456105) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((1870371057760875194847555536247318274197820891152807385407358121724515501385053 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-7607998852578432877 : Rat) / 32049107564750198685) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((43391423255896348349577398749374069881710225340213771232 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (7, 2)],
  term ((-6875693987906591993170075419131135666887149230117683200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 1), (7, 2), (8, 1)],
  term ((-18741396652724599658977507061262261698358663361680896000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(3, 1), (5, 2), (7, 1)],
  term ((13751387975813183986340150838262271333774298460235366400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(3, 1), (5, 2), (7, 1), (8, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(3, 1), (6, 2), (7, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (6, 2), (8, 1), (9, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((1519831315013258376714118512045652869724175649996256966104441004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (6, 2), (8, 1), (11, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (6, 2), (8, 1), (13, 1)],
  term ((4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (6, 2), (8, 1), (13, 1), (16, 1)],
  term ((80852104118004438918766976736530945488840441922658025292535314575 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (6, 2), (8, 1), (15, 1)],
  term ((-2166793211103048 : Rat) / 7342292683791569) [(3, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((1132816408282237921213256816734219505766 : Rat) / 40706970139555502230671675078565637125) [(3, 1), (6, 2), (9, 1)],
  term ((657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (6, 2), (9, 1), (10, 1)],
  term ((-279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-936657849993622213536 : Rat) / 4339258264657398321155) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (6, 2), (10, 1), (11, 1)],
  term ((211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (6, 2), (10, 1), (13, 1)],
  term ((-3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-31224099982334879915446565084921 : Rat) / 2802078426838206511495121931792) [(3, 1), (6, 2), (10, 1), (15, 1)],
  term ((3326090605728462 : Rat) / 7342292683791569) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((738135021317161138317437655470065689972442152182263304204655432437244694352406293 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (6, 2), (11, 1)],
  term ((13415468409052974251640502 : Rat) / 1262724155015302911456105) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-134103603860077291616902966477158155580651906051516368087747143573826784946452924437 : Rat) / 128624151647641766749254039980462428032126024499467676979920337397094698400243200) [(3, 1), (6, 2), (13, 1)],
  term ((-29295938985786968339811086 : Rat) / 1262724155015302911456105) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1870371057760875194847555536247318274197820891152807385407358121724515501385053 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (6, 2), (15, 1)],
  term ((7607998852578432877 : Rat) / 64098215129500397370) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-61383100868391460691624219863627756944791 : Rat) / 2198176387535997120456270454242544404750) [(3, 1), (7, 2), (8, 1), (9, 1)],
  term ((939888877435502900184 : Rat) / 4339258264657398321155) [(3, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((1519831315013258376714118512045652869724175649996256966104441004 : Rat) / 34299406372393745792878136016423515156901497292566177210440875) [(3, 1), (7, 2), (8, 1), (11, 1)],
  term ((-710404331989467160224 : Rat) / 619894037808199760165) [(3, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((16953416082580275643572419449435657933481 : Rat) / 263781166504319654454752454509105328570) [(3, 1), (7, 2), (8, 1), (13, 1)],
  term ((4199234595364706163384 : Rat) / 4339258264657398321155) [(3, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((80852104118004438918766976736530945488840441922658025292535314575 : Rat) / 3199162443839859627796789139485084930598375156266482983471014308) [(3, 1), (7, 2), (8, 1), (15, 1)],
  term ((-2166793211103048 : Rat) / 7342292683791569) [(3, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((1132816408282237921213256816734219505766 : Rat) / 40706970139555502230671675078565637125) [(3, 1), (7, 2), (9, 1)],
  term ((657844257958645086149263147309980627304289 : Rat) / 15826869990259179267285147270546319714200) [(3, 1), (7, 2), (9, 1), (10, 1)],
  term ((-279800363252805134826 : Rat) / 867851652931479664231) [(3, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-936657849993622213536 : Rat) / 4339258264657398321155) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-13764595033843794706435865290899730234357 : Rat) / 219817638753599712045627045424254440475) [(3, 1), (7, 2), (10, 1), (11, 1)],
  term ((211483926365177554136 : Rat) / 123978807561639952033) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-181690192657766865785367309797072973832799 : Rat) / 1899224398831101512074217672465558365704) [(3, 1), (7, 2), (10, 1), (13, 1)],
  term ((-3750275357144286233878 : Rat) / 2603554958794438992693) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-31224099982334879915446565084921 : Rat) / 2802078426838206511495121931792) [(3, 1), (7, 2), (10, 1), (15, 1)],
  term ((3326090605728462 : Rat) / 7342292683791569) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((738135021317161138317437655470065689972442152182263304204655432437244694352406293 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(3, 1), (7, 2), (11, 1)],
  term ((13415468409052974251640502 : Rat) / 1262724155015302911456105) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((-134103603860077291616902966477158155580651906051516368087747143573826784946452924437 : Rat) / 128624151647641766749254039980462428032126024499467676979920337397094698400243200) [(3, 1), (7, 2), (13, 1)],
  term ((-29295938985786968339811086 : Rat) / 1262724155015302911456105) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-1870371057760875194847555536247318274197820891152807385407358121724515501385053 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(3, 1), (7, 2), (15, 1)],
  term ((7607998852578432877 : Rat) / 64098215129500397370) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(3, 1), (7, 3)],
  term ((-16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 168278350316134383996551211922348360133342343197734517325778922803559616000) [(3, 2), (4, 1), (6, 1)],
  term ((-2315785599707092594 : Rat) / 330403170770620605) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 168278350316134383996551211922348360133342343197734517325778922803559616000) [(3, 2), (5, 1), (7, 1)],
  term ((-2315785599707092594 : Rat) / 330403170770620605) [(3, 2), (5, 1), (7, 1), (16, 1)],
  term ((16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(3, 2), (6, 2)],
  term ((1157892799853546297 : Rat) / 330403170770620605) [(3, 2), (6, 2), (16, 1)],
  term ((16124054229068589496285487621755797460943965361901212283106626384155691044267 : Rat) / 336556700632268767993102423844696720266684686395469034651557845607119232000) [(3, 2), (7, 2)],
  term ((1157892799853546297 : Rat) / 330403170770620605) [(3, 2), (7, 2), (16, 1)],
  term ((-597398953536360480850088993459502311253435340330818764800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1)],
  term ((2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (6, 1), (8, 1), (13, 1)],
  term ((93338415205039343773985700853952595883261148153577267200 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(4, 1), (5, 1), (6, 1), (8, 1), (15, 1)],
  term ((22140939269103707279008884603987980174676698283961548800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (9, 1)],
  term ((-4450759106097487109098239689829061471717724545667481600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1)],
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1)],
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((94302505729556048586899607505052431475675187715883008000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1)],
  term ((-371866814504430622226111163788689503522716652685516800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1)],
  term ((290939987855757952485312614847151033729009937932619264000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (11, 1)],
  term ((10729882787955017578070884425411905023373064092516352000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-3226052737402350732732566521373280450464786570541366886400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-305959922123128882636201387644373949375208264698670899200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(4, 1), (5, 1), (6, 1), (13, 1)],
  term ((62484025620118085653456159736067293154845419573825945600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(4, 1), (5, 1), (6, 1), (15, 1)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (6, 2), (9, 1)],
  term ((609454858586681119958135015251260693312538333727129600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (7, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1)],
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-565607406798793325143928463781486631345822517018334208000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 1), (7, 2), (9, 1)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 2), (6, 1)],
  term ((-6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 2), (6, 1), (8, 1)],
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (5, 2), (7, 1), (9, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-25619091800367959349855711397128760462582169663846823205469545726731901456758049 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(4, 1), (6, 2)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(4, 1), (6, 2), (7, 1), (9, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(4, 1), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (6, 2), (9, 1), (11, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (6, 2), (9, 1), (13, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(4, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((373406381980391721486396813928861624769874766764017753272 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (6, 2), (9, 1), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(4, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 2), (9, 2), (16, 1)],
  term ((-4253085018792666903272 : Rat) / 32049107564750198685) [(4, 1), (6, 2), (16, 1)],
  term ((25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(4, 1), (6, 3)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(4, 1), (6, 3), (16, 1)],
  term ((-304727429293340559979067507625630346656269166863564800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 1), (7, 2)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((282803703399396662571964231890743315672911258509167104000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 2), (5, 1), (6, 1), (9, 1)],
  term ((609454858586681119958135015251260693312538333727129600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(4, 2), (6, 1)],
  term ((155235572742404768201257008469500940731670487449600 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((-2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((-565607406798793325143928463781486631345822517018334208000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((-25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 4080749995166258811916366889116947733233551822545062045150138877986320688000) [(5, 1), (6, 1), (7, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((-4253085018792666903272 : Rat) / 32049107564750198685) [(5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(5, 1), (6, 1), (7, 2), (9, 1)],
  term ((25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(5, 1), (6, 2), (7, 1)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((298699476768180240425044496729751155626717670165409382400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (8, 1), (11, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (6, 2), (8, 1), (13, 1)],
  term ((-46669207602519671886992850426976297941630574076788633600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (6, 2), (8, 1), (15, 1)],
  term ((-11070469634551853639504442301993990087338349141980774400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (9, 1)],
  term ((2225379553048743554549119844914530735858862272833740800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (9, 1), (10, 1)],
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (9, 1), (12, 1)],
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (10, 1), (12, 1), (13, 1)],
  term ((-108609016113496072024327453405601638173505939839238144000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (10, 1), (12, 1), (15, 1)],
  term ((-47151252864778024293449803752526215737837593857941504000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (10, 1), (13, 1)],
  term ((185933407252215311113055581894344751761358326342758400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 1), (6, 2), (10, 1), (15, 1)],
  term ((-145469993927878976242656307423575516864504968966309632000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (11, 1)],
  term ((-5364941393977508789035442212705952511686532046258176000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (6, 2), (11, 1), (12, 1)],
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (6, 2), (12, 1), (13, 1)],
  term ((1613026368701175366366283260686640225232393285270683443200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (6, 2), (12, 1), (15, 1)],
  term ((152979961061564441318100693822186974687604132349335449600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (6, 2), (13, 1)],
  term ((-31242012810059042826728079868033646577422709786912972800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (6, 2), (15, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((298699476768180240425044496729751155626717670165409382400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (8, 1), (11, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1040762227689828611154732594496468689296585640244779212800 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (7, 2), (8, 1), (13, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (13, 1), (16, 1)],
  term ((-46669207602519671886992850426976297941630574076788633600 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 1), (7, 2), (8, 1), (15, 1)],
  term ((-11070469634551853639504442301993990087338349141980774400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (9, 1)],
  term ((2225379553048743554549119844914530735858862272833740800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (9, 1), (10, 1)],
  term ((2331483067018177213614679010203434628848959051005542400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (9, 1), (12, 1)],
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (10, 1), (12, 1), (13, 1)],
  term ((-108609016113496072024327453405601638173505939839238144000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (10, 1), (12, 1), (15, 1)],
  term ((-47151252864778024293449803752526215737837593857941504000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((185933407252215311113055581894344751761358326342758400 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 1), (7, 2), (10, 1), (15, 1)],
  term ((-145469993927878976242656307423575516864504968966309632000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (11, 1)],
  term ((-5364941393977508789035442212705952511686532046258176000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (7, 2), (11, 1), (12, 1)],
  term ((-2887916827645758128981754191069416102102243500568042496000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (7, 2), (12, 1), (13, 1)],
  term ((1613026368701175366366283260686640225232393285270683443200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (7, 2), (12, 1), (15, 1)],
  term ((152979961061564441318100693822186974687604132349335449600 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 1), (7, 2), (13, 1)],
  term ((-31242012810059042826728079868033646577422709786912972800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 1), (7, 2), (15, 1)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (6, 2)],
  term ((3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (6, 2), (8, 1)],
  term ((-597398953536360480850088993459502311253435340330818764800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (8, 1), (11, 1)],
  term ((2081524455379657222309465188992937378593171280489558425600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 2), (7, 1), (8, 1), (13, 1)],
  term ((93338415205039343773985700853952595883261148153577267200 : Rat) / 6466579531165902861643782618204799630014762045689020851) [(5, 2), (7, 1), (8, 1), (15, 1)],
  term ((22140939269103707279008884603987980174676698283961548800 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (9, 1)],
  term ((-4450759106097487109098239689829061471717724545667481600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (9, 1), (10, 1)],
  term ((-4662966134036354427229358020406869257697918102011084800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((-434436064453984288097309813622406552694023759356952576000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((217218032226992144048654906811203276347011879678476288000 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((94302505729556048586899607505052431475675187715883008000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (10, 1), (13, 1)],
  term ((-371866814504430622226111163788689503522716652685516800 : Rat) / 718508836796211429071531402022755514446084671743224539) [(5, 2), (7, 1), (10, 1), (15, 1)],
  term ((290939987855757952485312614847151033729009937932619264000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (11, 1)],
  term ((10729882787955017578070884425411905023373064092516352000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((5775833655291516257963508382138832204204487001136084992000 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-3226052737402350732732566521373280450464786570541366886400 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-305959922123128882636201387644373949375208264698670899200 : Rat) / 2155526510388634287214594206068266543338254015229673617) [(5, 2), (7, 1), (13, 1)],
  term ((62484025620118085653456159736067293154845419573825945600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(5, 2), (7, 1), (15, 1)],
  term ((-5485093727280130079623215137261346239812845003544166400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 2)],
  term ((3047274292933405599790675076256303466562691668635648000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 2), (7, 2), (8, 1)],
  term ((10970187454560260159246430274522692479625690007088332800 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 3), (7, 1)],
  term ((-6094548585866811199581350152512606933125383337271296000 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 3), (7, 1), (8, 1)],
  term ((25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(6, 1), (7, 2)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 1), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 1), (7, 2), (9, 2), (16, 1)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(6, 1), (7, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(6, 1), (7, 3), (9, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(6, 2), (7, 2)],
  term ((-1063271254698166725818 : Rat) / 32049107564750198685) [(6, 2), (7, 2), (16, 1)],
  term ((25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(6, 3)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(6, 3), (7, 1), (9, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(6, 3), (9, 1), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 3), (9, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(6, 3), (9, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 3), (9, 2), (16, 1)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(6, 3), (16, 1)],
  term ((-25618844558860482242808880414722442691301860974703726262467169691297189187958049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(6, 4)],
  term ((-1063271254698166725818 : Rat) / 32049107564750198685) [(6, 4), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 3), (8, 1), (9, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 3), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(7, 3), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 100 through 199. -/
theorem rs_R009_ueqv_R009NYNYN_block_14_0100_0199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_14_0100_0199
      rs_R009_ueqv_R009NYNYN_block_14_0100_0199 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
