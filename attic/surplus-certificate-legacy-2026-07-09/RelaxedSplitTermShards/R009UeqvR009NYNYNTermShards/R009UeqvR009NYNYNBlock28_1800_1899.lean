/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1800-1899

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1800 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1800 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1800 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1800 : Poly :=
[
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1800 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1800_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1800
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1800 := by
  native_decide

/-- Coefficient term 1801 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1801 : Poly :=
[
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (14, 1)]
]

/-- Partial product 1801 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1801 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1801 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1801_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1801
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1801 := by
  native_decide

/-- Coefficient term 1802 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1802 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1802 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1802 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1802 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1802_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1802
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1802 := by
  native_decide

/-- Coefficient term 1803 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1803 : Poly :=
[
  term ((-1208921285421916659216 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 1803 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1803 : Poly :=
[
  term ((-2417842570843833318432 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((1208921285421916659216 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1803 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1803_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1803
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1803 := by
  native_decide

/-- Coefficient term 1804 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1804 : Poly :=
[
  term ((137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 1)]
]

/-- Partial product 1804 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1804 : Poly :=
[
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 1)],
  term ((274015048705898646498340335929151374733292939132102 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1804 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1804_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1804
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1804 := by
  native_decide

/-- Coefficient term 1805 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1805 : Poly :=
[
  term ((-481949880834952671652268149515992255158185167035995675797716310125792962827 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1805 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1805 : Poly :=
[
  term ((-481949880834952671652268149515992255158185167035995675797716310125792962827 : Rat) / 1271110220412625770322619932132518776802206775538664507501900747473028058) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((481949880834952671652268149515992255158185167035995675797716310125792962827 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1805 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1805_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1805
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1805 := by
  native_decide

/-- Coefficient term 1806 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1806 : Poly :=
[
  term ((13826160562285738664 : Rat) / 31368132033667939671) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1806 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1806 : Poly :=
[
  term ((27652321124571477328 : Rat) / 31368132033667939671) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13826160562285738664 : Rat) / 31368132033667939671) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1806 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1806_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1806
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1806 := by
  native_decide

/-- Coefficient term 1807 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1807 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (10, 1), (12, 1), (13, 2)]
]

/-- Partial product 1807 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1807 : Poly :=
[
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1807 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1807_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1807
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1807 := by
  native_decide

/-- Coefficient term 1808 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1808 : Poly :=
[
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1808 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1808 : Poly :=
[
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1808 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1808_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1808
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1808 := by
  native_decide

/-- Coefficient term 1809 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1809 : Poly :=
[
  term ((953789084266222497832391856858071392249530619604800072783410890629 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(8, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 1809 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1809 : Poly :=
[
  term ((953789084266222497832391856858071392249530619604800072783410890629 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-953789084266222497832391856858071392249530619604800072783410890629 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(8, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1809 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1809_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1809
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1809 := by
  native_decide

/-- Coefficient term 1810 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1810 : Poly :=
[
  term ((3756886615353168 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1810 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1810 : Poly :=
[
  term ((7513773230706336 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3756886615353168 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1810 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1810_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1810
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1810 := by
  native_decide

/-- Coefficient term 1811 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1811 : Poly :=
[
  term ((128933557170617993580729641760225898974522438165940703683298922595 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1811 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1811 : Poly :=
[
  term ((-128933557170617993580729641760225898974522438165940703683298922595 : Rat) / 2742139237577022538111533548130072797655750133942699700118012264) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((128933557170617993580729641760225898974522438165940703683298922595 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1811 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1811_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1811
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1811 := by
  native_decide

/-- Coefficient term 1812 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1812 : Poly :=
[
  term ((-475953391107612 : Rat) / 1048898954827367) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1812 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1812 : Poly :=
[
  term ((475953391107612 : Rat) / 1048898954827367) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-951906782215224 : Rat) / 1048898954827367) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1812 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1812_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1812
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1812 := by
  native_decide

/-- Coefficient term 1813 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1813 : Poly :=
[
  term ((2322675752223117226937495397302339407129645590647168273359997647893185832857 : Rat) / 4237034068042085901075399773775062589340689251795548358339669158243426860) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1813 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1813 : Poly :=
[
  term ((2322675752223117226937495397302339407129645590647168273359997647893185832857 : Rat) / 2118517034021042950537699886887531294670344625897774179169834579121713430) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2322675752223117226937495397302339407129645590647168273359997647893185832857 : Rat) / 4237034068042085901075399773775062589340689251795548358339669158243426860) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1813 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1813_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1813
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1813 := by
  native_decide

/-- Coefficient term 1814 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1814 : Poly :=
[
  term ((10064899077978349607936 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1814 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1814 : Poly :=
[
  term ((20129798155956699215872 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10064899077978349607936 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1814 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1814_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1814
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1814 := by
  native_decide

/-- Coefficient term 1815 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1815 : Poly :=
[
  term ((23358108100026922204777270509761631113345 : Rat) / 158268699902591792672851472705463197142) [(8, 1), (10, 1), (13, 2)]
]

/-- Partial product 1815 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1815 : Poly :=
[
  term ((-23358108100026922204777270509761631113345 : Rat) / 158268699902591792672851472705463197142) [(8, 1), (10, 1), (13, 2)],
  term ((23358108100026922204777270509761631113345 : Rat) / 79134349951295896336425736352731598571) [(8, 1), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1815 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1815_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1815
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1815 := by
  native_decide

/-- Coefficient term 1816 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1816 : Poly :=
[
  term ((70086593825018403868280479826335326238847 : Rat) / 1582686999025917926728514727054631971420) [(8, 1), (10, 1), (13, 2), (14, 1)]
]

/-- Partial product 1816 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1816 : Poly :=
[
  term ((-70086593825018403868280479826335326238847 : Rat) / 1582686999025917926728514727054631971420) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((70086593825018403868280479826335326238847 : Rat) / 791343499512958963364257363527315985710) [(8, 1), (10, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1816 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1816_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1816
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1816 := by
  native_decide

/-- Coefficient term 1817 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1817 : Poly :=
[
  term ((2893321008066104913068 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1817 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1817 : Poly :=
[
  term ((-2893321008066104913068 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5786642016132209826136 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1817 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1817_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1817
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1817 := by
  native_decide

/-- Coefficient term 1818 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1818 : Poly :=
[
  term ((1928542997629952200360 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1818 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1818 : Poly :=
[
  term ((3857085995259904400720 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1928542997629952200360 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1818 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1818_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1818
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1818 := by
  native_decide

/-- Coefficient term 1819 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1819 : Poly :=
[
  term ((20633282226743232809155300672767543307981154868904 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1), (14, 1)]
]

/-- Partial product 1819 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1819 : Poly :=
[
  term ((-20633282226743232809155300672767543307981154868904 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1), (14, 1)],
  term ((41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1819 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1819_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1819
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1819 := by
  native_decide

/-- Coefficient term 1820 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1820 : Poly :=
[
  term ((-2791258050432976591568149101486330426399311712952021369495929615653 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 1820 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1820 : Poly :=
[
  term ((-2791258050432976591568149101486330426399311712952021369495929615653 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((2791258050432976591568149101486330426399311712952021369495929615653 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1820 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1820_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1820
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1820 := by
  native_decide

/-- Coefficient term 1821 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1821 : Poly :=
[
  term ((-6540892175910312 : Rat) / 7342292683791569) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1821 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1821 : Poly :=
[
  term ((-13081784351820624 : Rat) / 7342292683791569) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((6540892175910312 : Rat) / 7342292683791569) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1821 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1821_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1821
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1821 := by
  native_decide

/-- Coefficient term 1822 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1822 : Poly :=
[
  term ((-7331855534132527407 : Rat) / 1424404780655564386) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 1822 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1822 : Poly :=
[
  term ((-7331855534132527407 : Rat) / 712202390327782193) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((7331855534132527407 : Rat) / 1424404780655564386) [(8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1822 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1822_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1822
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1822 := by
  native_decide

/-- Coefficient term 1823 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1823 : Poly :=
[
  term ((2330376069237146572013115802386669917732859146905775967222314407974556310412893113 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1823 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1823 : Poly :=
[
  term ((-2330376069237146572013115802386669917732859146905775967222314407974556310412893113 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((2330376069237146572013115802386669917732859146905775967222314407974556310412893113 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1823 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1823_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1823
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1823 := by
  native_decide

/-- Coefficient term 1824 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1824 : Poly :=
[
  term ((22840437580551364526521181490269113958132884171665929428493078502911 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1824 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1824 : Poly :=
[
  term ((-22840437580551364526521181490269113958132884171665929428493078502911 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((22840437580551364526521181490269113958132884171665929428493078502911 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1824 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1824_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1824
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1824 := by
  native_decide

/-- Coefficient term 1825 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1825 : Poly :=
[
  term ((140886563605106757599548 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1825 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1825 : Poly :=
[
  term ((-140886563605106757599548 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((281773127210213515199096 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1825 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1825_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1825
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1825 := by
  native_decide

/-- Coefficient term 1826 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1826 : Poly :=
[
  term ((1077908223384056850188027 : Rat) / 39875499632062197203877) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1826 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1826 : Poly :=
[
  term ((2155816446768113700376054 : Rat) / 39875499632062197203877) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1077908223384056850188027 : Rat) / 39875499632062197203877) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1826 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1826_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1826
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1826 := by
  native_decide

/-- Coefficient term 1827 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1827 : Poly :=
[
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1827 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1827 : Poly :=
[
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1827 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1827_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1827
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1827 := by
  native_decide

/-- Coefficient term 1828 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1828 : Poly :=
[
  term ((-11423328844091868 : Rat) / 7342292683791569) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1828 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1828 : Poly :=
[
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1828 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1828_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1828
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1828 := by
  native_decide

/-- Coefficient term 1829 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1829 : Poly :=
[
  term ((-1495525429913678976937492451364222073470723871868253552461132836582954194804117135263 : Rat) / 771744909885850600495524239882774568192756146996806061879522024382568190401459200) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1829 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1829 : Poly :=
[
  term ((-1495525429913678976937492451364222073470723871868253552461132836582954194804117135263 : Rat) / 385872454942925300247762119941387284096378073498403030939761012191284095200729600) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1495525429913678976937492451364222073470723871868253552461132836582954194804117135263 : Rat) / 771744909885850600495524239882774568192756146996806061879522024382568190401459200) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1829 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1829_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1829
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1829 := by
  native_decide

/-- Coefficient term 1830 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1830 : Poly :=
[
  term ((-30150654173219100218659154 : Rat) / 757634493009181746873663) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1830 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1830 : Poly :=
[
  term ((-60301308346438200437318308 : Rat) / 757634493009181746873663) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((30150654173219100218659154 : Rat) / 757634493009181746873663) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1830 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1830_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1830
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1830 := by
  native_decide

/-- Coefficient term 1831 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1831 : Poly :=
[
  term ((-944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1831 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1831 : Poly :=
[
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1831 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1831_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1831
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1831 := by
  native_decide

/-- Coefficient term 1832 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1832 : Poly :=
[
  term ((-77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1832 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1832 : Poly :=
[
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1832 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1832_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1832
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1832 := by
  native_decide

/-- Coefficient term 1833 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1833 : Poly :=
[
  term ((1452055495750916975764775275784254820252127003009230923297108945203623907319 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1833 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1833 : Poly :=
[
  term ((1452055495750916975764775275784254820252127003009230923297108945203623907319 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1452055495750916975764775275784254820252127003009230923297108945203623907319 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1833 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1833_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1833
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1833 := by
  native_decide

/-- Coefficient term 1834 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1834 : Poly :=
[
  term ((-20460602115555364635384 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1834 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1834 : Poly :=
[
  term ((-40921204231110729270768 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((20460602115555364635384 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1834 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1834_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1834
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1834 := by
  native_decide

/-- Coefficient term 1835 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1835 : Poly :=
[
  term ((-18456414677102517624320312023687209539034828708453125962423596987822842443097797524283 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1835 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1835 : Poly :=
[
  term ((18456414677102517624320312023687209539034828708453125962423596987822842443097797524283 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (11, 1), (13, 1)],
  term ((-18456414677102517624320312023687209539034828708453125962423596987822842443097797524283 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1835 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1835_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1835
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1835 := by
  native_decide

/-- Coefficient term 1836 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1836 : Poly :=
[
  term ((-544701710628467500451098989722573294817863418213503355668951496014667272478992189 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1836 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1836 : Poly :=
[
  term ((544701710628467500451098989722573294817863418213503355668951496014667272478992189 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-544701710628467500451098989722573294817863418213503355668951496014667272478992189 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1836 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1836_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1836
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1836 := by
  native_decide

/-- Coefficient term 1837 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1837 : Poly :=
[
  term ((-84816661439419142864154211 : Rat) / 7576344930091817468736630) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1837 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1837 : Poly :=
[
  term ((84816661439419142864154211 : Rat) / 7576344930091817468736630) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-84816661439419142864154211 : Rat) / 3788172465045908734368315) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1837 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1837_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1837
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1837 := by
  native_decide

/-- Coefficient term 1838 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1838 : Poly :=
[
  term ((13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1838 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1838 : Poly :=
[
  term ((13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1838 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1838_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1838
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1838 := by
  native_decide

/-- Coefficient term 1839 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1839 : Poly :=
[
  term ((1844313665735946520146 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1839 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1839 : Poly :=
[
  term ((3688627331471893040292 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1844313665735946520146 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1839 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1839_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1839
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1839 := by
  native_decide

/-- Coefficient term 1840 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1840 : Poly :=
[
  term ((-48023070325894096911336793 : Rat) / 1082334990013116781248090) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1840 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1840 : Poly :=
[
  term ((-48023070325894096911336793 : Rat) / 541167495006558390624045) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((48023070325894096911336793 : Rat) / 1082334990013116781248090) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1840 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1840_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1840
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1840 := by
  native_decide

/-- Coefficient term 1841 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1841 : Poly :=
[
  term ((607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1841 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1841 : Poly :=
[
  term ((607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1841 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1841_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1841
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1841 := by
  native_decide

/-- Coefficient term 1842 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1842 : Poly :=
[
  term ((38407320012911645237222 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1842 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1842 : Poly :=
[
  term ((76814640025823290474444 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-38407320012911645237222 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1842 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1842_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1842
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1842 := by
  native_decide

/-- Coefficient term 1843 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1843 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (11, 1), (13, 3)]
]

/-- Partial product 1843 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1843 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (11, 1), (13, 3)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1843 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1843_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1843
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1843 := by
  native_decide

/-- Coefficient term 1844 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1844 : Poly :=
[
  term ((65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1844 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1844 : Poly :=
[
  term ((-65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1844 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1844_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1844
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1844 := by
  native_decide

/-- Coefficient term 1845 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1845 : Poly :=
[
  term ((84928286750455957414 : Rat) / 4578443937821456955) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1845 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1845 : Poly :=
[
  term ((-84928286750455957414 : Rat) / 4578443937821456955) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((169856573500911914828 : Rat) / 4578443937821456955) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1845 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1845_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1845
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1845 := by
  native_decide

/-- Coefficient term 1846 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1846 : Poly :=
[
  term ((182324643502433503891450289129787984294019964236370823425779135179445511234881177241 : Rat) / 203090765759434368551453747337572254787567407104422647863032111679623208000384000) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1846 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1846 : Poly :=
[
  term ((182324643502433503891450289129787984294019964236370823425779135179445511234881177241 : Rat) / 101545382879717184275726873668786127393783703552211323931516055839811604000192000) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-182324643502433503891450289129787984294019964236370823425779135179445511234881177241 : Rat) / 203090765759434368551453747337572254787567407104422647863032111679623208000384000) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1846 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1846_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1846
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1846 := by
  native_decide

/-- Coefficient term 1847 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1847 : Poly :=
[
  term ((4489293366816804575774966 : Rat) / 199377498160310986019385) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1847 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1847 : Poly :=
[
  term ((8978586733633609151549932 : Rat) / 199377498160310986019385) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4489293366816804575774966 : Rat) / 199377498160310986019385) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1847 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1847_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1847
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1847 := by
  native_decide

/-- Coefficient term 1848 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1848 : Poly :=
[
  term ((92234639819187056421359338697900432890234011352069641432437217750331862581886477 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(8, 1), (11, 2)]
]

/-- Partial product 1848 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1848 : Poly :=
[
  term ((-92234639819187056421359338697900432890234011352069641432437217750331862581886477 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(8, 1), (11, 2)],
  term ((92234639819187056421359338697900432890234011352069641432437217750331862581886477 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1848 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1848_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1848
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1848 := by
  native_decide

/-- Coefficient term 1849 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1849 : Poly :=
[
  term ((45713888642553981033841790491863481674142972118476016100560369021 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(8, 1), (11, 2), (12, 1)]
]

/-- Partial product 1849 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1849 : Poly :=
[
  term ((-45713888642553981033841790491863481674142972118476016100560369021 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(8, 1), (11, 2), (12, 1)],
  term ((45713888642553981033841790491863481674142972118476016100560369021 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1849 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1849_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1849
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1849 := by
  native_decide

/-- Coefficient term 1850 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1850 : Poly :=
[
  term ((-257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 1), (14, 1)]
]

/-- Partial product 1850 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1850 : Poly :=
[
  term ((257775372127252552805278665810572362301966 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1850 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1850_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1850
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1850 := by
  native_decide

/-- Coefficient term 1851 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1851 : Poly :=
[
  term ((-2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1851 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1851 : Poly :=
[
  term ((2199157201372978808432 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1851 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1851_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1851
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1851 := by
  native_decide

/-- Coefficient term 1852 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1852 : Poly :=
[
  term ((2339813845829942871268 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1852 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1852 : Poly :=
[
  term ((4679627691659885742536 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-2339813845829942871268 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1852 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1852_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1852
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1852 := by
  native_decide

/-- Coefficient term 1853 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1853 : Poly :=
[
  term ((515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 2)]
]

/-- Partial product 1853 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1853 : Poly :=
[
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 2)],
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1853 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1853_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1853
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1853 := by
  native_decide

/-- Coefficient term 1854 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1854 : Poly :=
[
  term ((4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 2), (16, 1)]
]

/-- Partial product 1854 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1854 : Poly :=
[
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1854 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1854_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1854
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1854 := by
  native_decide

/-- Coefficient term 1855 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1855 : Poly :=
[
  term ((7434044414267422063483293160622842991657182859939581704151770724950143569 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 1855 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1855 : Poly :=
[
  term ((14868088828534844126966586321245685983314365719879163408303541449900287138 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-7434044414267422063483293160622842991657182859939581704151770724950143569 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1855 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1855_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1855
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1855 := by
  native_decide

/-- Coefficient term 1856 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1856 : Poly :=
[
  term ((-12884386176752936295208 : Rat) / 4339258264657398321155) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1856 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1856 : Poly :=
[
  term ((-25768772353505872590416 : Rat) / 4339258264657398321155) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12884386176752936295208 : Rat) / 4339258264657398321155) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1856 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1856_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1856
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1856 := by
  native_decide

/-- Coefficient term 1857 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1857 : Poly :=
[
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (11, 2), (13, 2)]
]

/-- Partial product 1857 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1857 : Poly :=
[
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (11, 2), (13, 2)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1857 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1857_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1857
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1857 := by
  native_decide

/-- Coefficient term 1858 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1858 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 1858 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1858 : Poly :=
[
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1858 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1858_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1858
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1858 := by
  native_decide

/-- Coefficient term 1859 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1859 : Poly :=
[
  term ((1768917364496725458994658525725901273702904837335146181495827241 : Rat) / 42578573427799132708400444710042984332705306983875254468133500) [(8, 1), (11, 2), (14, 1)]
]

/-- Partial product 1859 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1859 : Poly :=
[
  term ((-1768917364496725458994658525725901273702904837335146181495827241 : Rat) / 42578573427799132708400444710042984332705306983875254468133500) [(8, 1), (11, 2), (14, 1)],
  term ((1768917364496725458994658525725901273702904837335146181495827241 : Rat) / 21289286713899566354200222355021492166352653491937627234066750) [(8, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1859 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1859_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1859
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1859 := by
  native_decide

/-- Coefficient term 1860 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1860 : Poly :=
[
  term ((469099754568568061906 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1860 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1860 : Poly :=
[
  term ((-469099754568568061906 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((938199509137136123812 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1860 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1860_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1860
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1860 := by
  native_decide

/-- Coefficient term 1861 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1861 : Poly :=
[
  term ((1724472677753451261835628 : Rat) / 757634493009181746873663) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 1861 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1861 : Poly :=
[
  term ((3448945355506902523671256 : Rat) / 757634493009181746873663) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1724472677753451261835628 : Rat) / 757634493009181746873663) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1861 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1861_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1861
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1861 := by
  native_decide

/-- Coefficient term 1862 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1862 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 3), (13, 1)]
]

/-- Partial product 1862 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1862 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 3), (13, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1862 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1862_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1862
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1862 := by
  native_decide

/-- Coefficient term 1863 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1863 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (11, 3), (13, 1), (16, 1)]
]

/-- Partial product 1863 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1863 : Poly :=
[
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1863 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1863_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1863
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1863 := by
  native_decide

/-- Coefficient term 1864 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1864 : Poly :=
[
  term ((-54835671685597246628741636828887861170165719870576301322320443843888119421986609 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (12, 1)]
]

/-- Partial product 1864 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1864 : Poly :=
[
  term ((54835671685597246628741636828887861170165719870576301322320443843888119421986609 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (12, 1)],
  term ((-54835671685597246628741636828887861170165719870576301322320443843888119421986609 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1864 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1864_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1864
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1864 := by
  native_decide

/-- Coefficient term 1865 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1865 : Poly :=
[
  term ((510824695436063745992095358155856517326701412390734331419925884435 : Rat) / 992843517053749539661072491564336702599495738151667132801349268) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1865 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1865 : Poly :=
[
  term ((-510824695436063745992095358155856517326701412390734331419925884435 : Rat) / 992843517053749539661072491564336702599495738151667132801349268) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((510824695436063745992095358155856517326701412390734331419925884435 : Rat) / 496421758526874769830536245782168351299747869075833566400674634) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1865 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1865_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1865
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1865 := by
  native_decide

/-- Coefficient term 1866 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1866 : Poly :=
[
  term ((22846657688183736 : Rat) / 7342292683791569) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1866 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1866 : Poly :=
[
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45693315376367472 : Rat) / 7342292683791569) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1866 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1866_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1866
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1866 := by
  native_decide

/-- Coefficient term 1867 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1867 : Poly :=
[
  term ((-26469195250716392942003331374992758370274212439338725187426440856345999403168941 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1867 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1867 : Poly :=
[
  term ((-26469195250716392942003331374992758370274212439338725187426440856345999403168941 : Rat) / 184946537070037049581941200125281482024721085840875685841526558757325582439000) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((26469195250716392942003331374992758370274212439338725187426440856345999403168941 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1867 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1867_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1867
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1867 := by
  native_decide

/-- Coefficient term 1868 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1868 : Poly :=
[
  term ((-25436191324550374962881839 : Rat) / 3788172465045908734368315) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1868 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1868 : Poly :=
[
  term ((-50872382649100749925763678 : Rat) / 3788172465045908734368315) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((25436191324550374962881839 : Rat) / 3788172465045908734368315) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1868 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1868_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1868
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1868 := by
  native_decide

/-- Coefficient term 1869 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1869 : Poly :=
[
  term ((-639060419437402006964328396535439000559354878463206290952697703 : Rat) / 604789532770371354388708357514079940725773340015860757343284) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 1869 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1869 : Poly :=
[
  term ((639060419437402006964328396535439000559354878463206290952697703 : Rat) / 604789532770371354388708357514079940725773340015860757343284) [(8, 1), (12, 1), (13, 2)],
  term ((-639060419437402006964328396535439000559354878463206290952697703 : Rat) / 302394766385185677194354178757039970362886670007930378671642) [(8, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1869 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1869_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1869
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1869 := by
  native_decide

/-- Coefficient term 1870 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1870 : Poly :=
[
  term ((-97976927717472896789198442200697353766728556724507076818550136473 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(8, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1870 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1870 : Poly :=
[
  term ((97976927717472896789198442200697353766728556724507076818550136473 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-97976927717472896789198442200697353766728556724507076818550136473 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(8, 1), (12, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1870 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1870_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1870
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1870 := by
  native_decide

/-- Coefficient term 1871 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1871 : Poly :=
[
  term ((-28679447758451566254152 : Rat) / 4339258264657398321155) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1871 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1871 : Poly :=
[
  term ((28679447758451566254152 : Rat) / 4339258264657398321155) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-57358895516903132508304 : Rat) / 4339258264657398321155) [(8, 1), (12, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1871 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1871_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1871
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1871 := by
  native_decide

/-- Coefficient term 1872 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1872 : Poly :=
[
  term ((-13781041561067979508692 : Rat) / 867851652931479664231) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1872 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1872 : Poly :=
[
  term ((-27562083122135959017384 : Rat) / 867851652931479664231) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((13781041561067979508692 : Rat) / 867851652931479664231) [(8, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1872 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1872_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1872
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1872 := by
  native_decide

/-- Coefficient term 1873 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1873 : Poly :=
[
  term ((-36764412097019030707510587047093336841125473114082 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (12, 1), (14, 1)]
]

/-- Partial product 1873 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1873 : Poly :=
[
  term ((36764412097019030707510587047093336841125473114082 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (12, 1), (14, 1)],
  term ((-73528824194038061415021174094186673682250946228164 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1873 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1873_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1873
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1873 := by
  native_decide

/-- Coefficient term 1874 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1874 : Poly :=
[
  term ((60441770116071779310055830359566806040026171622468352907043530678818884414476941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1874 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1874 : Poly :=
[
  term ((60441770116071779310055830359566806040026171622468352907043530678818884414476941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-60441770116071779310055830359566806040026171622468352907043530678818884414476941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1874 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1874_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1874
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1874 := by
  native_decide

/-- Coefficient term 1875 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1875 : Poly :=
[
  term ((327091062446650963861 : Rat) / 4578443937821456955) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1875 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1875 : Poly :=
[
  term ((654182124893301927722 : Rat) / 4578443937821456955) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-327091062446650963861 : Rat) / 4578443937821456955) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1875 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1875_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1875
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1875 := by
  native_decide

/-- Coefficient term 1876 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1876 : Poly :=
[
  term ((-158594060071578422407 : Rat) / 9156887875642913910) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 1876 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1876 : Poly :=
[
  term ((-158594060071578422407 : Rat) / 4578443937821456955) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((158594060071578422407 : Rat) / 9156887875642913910) [(8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1876 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1876_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1876
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1876 := by
  native_decide

/-- Coefficient term 1877 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1877 : Poly :=
[
  term ((-274843295308124612710402402812497836456130738914475978125201370684625697381 : Rat) / 2781697338218308665246330531095397227834731985374957085991914708920464000) [(8, 1), (12, 2)]
]

/-- Partial product 1877 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1877 : Poly :=
[
  term ((274843295308124612710402402812497836456130738914475978125201370684625697381 : Rat) / 2781697338218308665246330531095397227834731985374957085991914708920464000) [(8, 1), (12, 2)],
  term ((-274843295308124612710402402812497836456130738914475978125201370684625697381 : Rat) / 1390848669109154332623165265547698613917365992687478542995957354460232000) [(8, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1877 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1877_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1877
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1877 := by
  native_decide

/-- Coefficient term 1878 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1878 : Poly :=
[
  term ((97976927717472896789198442200697353766728556724507076818550136473 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(8, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1878 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1878 : Poly :=
[
  term ((97976927717472896789198442200697353766728556724507076818550136473 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-97976927717472896789198442200697353766728556724507076818550136473 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(8, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1878 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1878_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1878
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1878 := by
  native_decide

/-- Coefficient term 1879 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1879 : Poly :=
[
  term ((28679447758451566254152 : Rat) / 4339258264657398321155) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1879 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1879 : Poly :=
[
  term ((57358895516903132508304 : Rat) / 4339258264657398321155) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28679447758451566254152 : Rat) / 4339258264657398321155) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1879 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1879_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1879
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1879 := by
  native_decide

/-- Coefficient term 1880 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1880 : Poly :=
[
  term ((-510824695436063745992095358155856517326701412390734331419925884435 : Rat) / 992843517053749539661072491564336702599495738151667132801349268) [(8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1880 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1880 : Poly :=
[
  term ((-510824695436063745992095358155856517326701412390734331419925884435 : Rat) / 496421758526874769830536245782168351299747869075833566400674634) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((510824695436063745992095358155856517326701412390734331419925884435 : Rat) / 992843517053749539661072491564336702599495738151667132801349268) [(8, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1880 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1880_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1880
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1880 := by
  native_decide

/-- Coefficient term 1881 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1881 : Poly :=
[
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1881 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1881 : Poly :=
[
  term ((-45693315376367472 : Rat) / 7342292683791569) [(8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((22846657688183736 : Rat) / 7342292683791569) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1881 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1881_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1881
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1881 := by
  native_decide

/-- Coefficient term 1882 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1882 : Poly :=
[
  term ((-6236691724236989984 : Rat) / 3561011951638910965) [(8, 1), (12, 2), (16, 1)]
]

/-- Partial product 1882 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1882 : Poly :=
[
  term ((-12473383448473979968 : Rat) / 3561011951638910965) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((6236691724236989984 : Rat) / 3561011951638910965) [(8, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1882 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1882_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1882
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1882 := by
  native_decide

/-- Coefficient term 1883 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1883 : Poly :=
[
  term ((-62552508430921425373921855772752876437386522140499741843289622253340762583680941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1883 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1883 : Poly :=
[
  term ((62552508430921425373921855772752876437386522140499741843289622253340762583680941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-62552508430921425373921855772752876437386522140499741843289622253340762583680941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1883 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1883_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1883
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1883 := by
  native_decide

/-- Coefficient term 1884 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1884 : Poly :=
[
  term ((-2355557833510525850377 : Rat) / 32049107564750198685) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1884 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1884 : Poly :=
[
  term ((2355557833510525850377 : Rat) / 32049107564750198685) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4711115667021051700754 : Rat) / 32049107564750198685) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1884 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1884_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1884
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1884 := by
  native_decide

/-- Coefficient term 1885 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1885 : Poly :=
[
  term ((2506489085412338328669881438338099196666029677411575322577893397531964219560316242783 : Rat) / 812363063037737474205814989350289019150269628417690591452128446718492832001536000) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1885 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1885 : Poly :=
[
  term ((2506489085412338328669881438338099196666029677411575322577893397531964219560316242783 : Rat) / 406181531518868737102907494675144509575134814208845295726064223359246416000768000) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2506489085412338328669881438338099196666029677411575322577893397531964219560316242783 : Rat) / 812363063037737474205814989350289019150269628417690591452128446718492832001536000) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1885 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1885_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1885
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1885 := by
  native_decide

/-- Coefficient term 1886 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1886 : Poly :=
[
  term ((11310895106922192706975817 : Rat) / 159501998528248788815508) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1886 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1886 : Poly :=
[
  term ((11310895106922192706975817 : Rat) / 79750999264124394407754) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11310895106922192706975817 : Rat) / 159501998528248788815508) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1886 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1886_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1886
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1886 := by
  native_decide

/-- Coefficient term 1887 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1887 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (13, 1), (15, 3)]
]

/-- Partial product 1887 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1887 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1887 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1887_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1887
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1887 := by
  native_decide

/-- Coefficient term 1888 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1888 : Poly :=
[
  term ((2020095442437435 : Rat) / 7342292683791569) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1888 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1888 : Poly :=
[
  term ((4040190884874870 : Rat) / 7342292683791569) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1888 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1888_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1888
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1888 := by
  native_decide

/-- Coefficient term 1889 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1889 : Poly :=
[
  term ((3911437276339225669053612922746848938229872422707121446655637498901135683519947871 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(8, 1), (13, 2)]
]

/-- Partial product 1889 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1889 : Poly :=
[
  term ((-3911437276339225669053612922746848938229872422707121446655637498901135683519947871 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(8, 1), (13, 2)],
  term ((3911437276339225669053612922746848938229872422707121446655637498901135683519947871 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1889 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1889_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1889
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1889 := by
  native_decide

/-- Coefficient term 1890 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1890 : Poly :=
[
  term ((417584799913313349768195229230314209107658863771641265526572870241646792317557841 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 1890 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1890 : Poly :=
[
  term ((-417584799913313349768195229230314209107658863771641265526572870241646792317557841 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (13, 2), (14, 1)],
  term ((417584799913313349768195229230314209107658863771641265526572870241646792317557841 : Rat) / 184946537070037049581941200125281482024721085840875685841526558757325582439000) [(8, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1890 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1890_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1890
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1890 := by
  native_decide

/-- Coefficient term 1891 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1891 : Poly :=
[
  term ((10288434462368028971553403 : Rat) / 541167495006558390624045) [(8, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1891 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1891 : Poly :=
[
  term ((-10288434462368028971553403 : Rat) / 541167495006558390624045) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((20576868924736057943106806 : Rat) / 541167495006558390624045) [(8, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1891 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1891_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1891
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1891 := by
  native_decide

/-- Coefficient term 1892 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1892 : Poly :=
[
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(8, 1), (13, 2), (15, 2)]
]

/-- Partial product 1892 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1892 : Poly :=
[
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1892 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1892_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1892
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1892 := by
  native_decide

/-- Coefficient term 1893 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1893 : Poly :=
[
  term ((-4534893515323182578033 : Rat) / 4339258264657398321155) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1893 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1893 : Poly :=
[
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4534893515323182578033 : Rat) / 4339258264657398321155) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1893 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1893_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1893
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1893 := by
  native_decide

/-- Coefficient term 1894 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1894 : Poly :=
[
  term ((155236136716352942665872067 : Rat) / 7576344930091817468736630) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 1894 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1894 : Poly :=
[
  term ((155236136716352942665872067 : Rat) / 3788172465045908734368315) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-155236136716352942665872067 : Rat) / 7576344930091817468736630) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1894 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1894_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1894
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1894 := by
  native_decide

/-- Coefficient term 1895 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1895 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (13, 3), (15, 1)]
]

/-- Partial product 1895 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1895 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (13, 3), (14, 1), (15, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1895 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1895_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1895
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1895 := by
  native_decide

/-- Coefficient term 1896 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1896 : Poly :=
[
  term ((1829651516096334465434077106476162947784574843422800396511268508292173420395151700243 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (14, 1)]
]

/-- Partial product 1896 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1896 : Poly :=
[
  term ((-1829651516096334465434077106476162947784574843422800396511268508292173420395151700243 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (14, 1)],
  term ((1829651516096334465434077106476162947784574843422800396511268508292173420395151700243 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1896 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1896_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1896
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1896 := by
  native_decide

/-- Coefficient term 1897 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1897 : Poly :=
[
  term ((3114746572412762020909519 : Rat) / 674954205313639184306100) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 1897 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1897 : Poly :=
[
  term ((-3114746572412762020909519 : Rat) / 674954205313639184306100) [(8, 1), (14, 1), (16, 1)],
  term ((3114746572412762020909519 : Rat) / 337477102656819592153050) [(8, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1897 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1897_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1897
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1897 := by
  native_decide

/-- Coefficient term 1898 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1898 : Poly :=
[
  term ((-58309833402946249047430151588076709184802513992725385791913299860857188347811331 : Rat) / 21763999974220046996887290075290387910578943053573664240800740682593710336000) [(8, 1), (15, 2)]
]

/-- Partial product 1898 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1898 : Poly :=
[
  term ((-58309833402946249047430151588076709184802513992725385791913299860857188347811331 : Rat) / 10881999987110023498443645037645193955289471526786832120400370341296855168000) [(8, 1), (14, 1), (15, 2)],
  term ((58309833402946249047430151588076709184802513992725385791913299860857188347811331 : Rat) / 21763999974220046996887290075290387910578943053573664240800740682593710336000) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1898 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1898_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1898
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1898 := by
  native_decide

/-- Coefficient term 1899 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1899 : Poly :=
[
  term ((-572415623999519466388 : Rat) / 10683035854916732895) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1899 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1899 : Poly :=
[
  term ((-1144831247999038932776 : Rat) / 10683035854916732895) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((572415623999519466388 : Rat) / 10683035854916732895) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1899 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1899_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1899
        rs_R009_ueqv_R009NYNYN_generator_28_1800_1899 =
      rs_R009_ueqv_R009NYNYN_partial_28_1899 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1800_1899 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1800,
  rs_R009_ueqv_R009NYNYN_partial_28_1801,
  rs_R009_ueqv_R009NYNYN_partial_28_1802,
  rs_R009_ueqv_R009NYNYN_partial_28_1803,
  rs_R009_ueqv_R009NYNYN_partial_28_1804,
  rs_R009_ueqv_R009NYNYN_partial_28_1805,
  rs_R009_ueqv_R009NYNYN_partial_28_1806,
  rs_R009_ueqv_R009NYNYN_partial_28_1807,
  rs_R009_ueqv_R009NYNYN_partial_28_1808,
  rs_R009_ueqv_R009NYNYN_partial_28_1809,
  rs_R009_ueqv_R009NYNYN_partial_28_1810,
  rs_R009_ueqv_R009NYNYN_partial_28_1811,
  rs_R009_ueqv_R009NYNYN_partial_28_1812,
  rs_R009_ueqv_R009NYNYN_partial_28_1813,
  rs_R009_ueqv_R009NYNYN_partial_28_1814,
  rs_R009_ueqv_R009NYNYN_partial_28_1815,
  rs_R009_ueqv_R009NYNYN_partial_28_1816,
  rs_R009_ueqv_R009NYNYN_partial_28_1817,
  rs_R009_ueqv_R009NYNYN_partial_28_1818,
  rs_R009_ueqv_R009NYNYN_partial_28_1819,
  rs_R009_ueqv_R009NYNYN_partial_28_1820,
  rs_R009_ueqv_R009NYNYN_partial_28_1821,
  rs_R009_ueqv_R009NYNYN_partial_28_1822,
  rs_R009_ueqv_R009NYNYN_partial_28_1823,
  rs_R009_ueqv_R009NYNYN_partial_28_1824,
  rs_R009_ueqv_R009NYNYN_partial_28_1825,
  rs_R009_ueqv_R009NYNYN_partial_28_1826,
  rs_R009_ueqv_R009NYNYN_partial_28_1827,
  rs_R009_ueqv_R009NYNYN_partial_28_1828,
  rs_R009_ueqv_R009NYNYN_partial_28_1829,
  rs_R009_ueqv_R009NYNYN_partial_28_1830,
  rs_R009_ueqv_R009NYNYN_partial_28_1831,
  rs_R009_ueqv_R009NYNYN_partial_28_1832,
  rs_R009_ueqv_R009NYNYN_partial_28_1833,
  rs_R009_ueqv_R009NYNYN_partial_28_1834,
  rs_R009_ueqv_R009NYNYN_partial_28_1835,
  rs_R009_ueqv_R009NYNYN_partial_28_1836,
  rs_R009_ueqv_R009NYNYN_partial_28_1837,
  rs_R009_ueqv_R009NYNYN_partial_28_1838,
  rs_R009_ueqv_R009NYNYN_partial_28_1839,
  rs_R009_ueqv_R009NYNYN_partial_28_1840,
  rs_R009_ueqv_R009NYNYN_partial_28_1841,
  rs_R009_ueqv_R009NYNYN_partial_28_1842,
  rs_R009_ueqv_R009NYNYN_partial_28_1843,
  rs_R009_ueqv_R009NYNYN_partial_28_1844,
  rs_R009_ueqv_R009NYNYN_partial_28_1845,
  rs_R009_ueqv_R009NYNYN_partial_28_1846,
  rs_R009_ueqv_R009NYNYN_partial_28_1847,
  rs_R009_ueqv_R009NYNYN_partial_28_1848,
  rs_R009_ueqv_R009NYNYN_partial_28_1849,
  rs_R009_ueqv_R009NYNYN_partial_28_1850,
  rs_R009_ueqv_R009NYNYN_partial_28_1851,
  rs_R009_ueqv_R009NYNYN_partial_28_1852,
  rs_R009_ueqv_R009NYNYN_partial_28_1853,
  rs_R009_ueqv_R009NYNYN_partial_28_1854,
  rs_R009_ueqv_R009NYNYN_partial_28_1855,
  rs_R009_ueqv_R009NYNYN_partial_28_1856,
  rs_R009_ueqv_R009NYNYN_partial_28_1857,
  rs_R009_ueqv_R009NYNYN_partial_28_1858,
  rs_R009_ueqv_R009NYNYN_partial_28_1859,
  rs_R009_ueqv_R009NYNYN_partial_28_1860,
  rs_R009_ueqv_R009NYNYN_partial_28_1861,
  rs_R009_ueqv_R009NYNYN_partial_28_1862,
  rs_R009_ueqv_R009NYNYN_partial_28_1863,
  rs_R009_ueqv_R009NYNYN_partial_28_1864,
  rs_R009_ueqv_R009NYNYN_partial_28_1865,
  rs_R009_ueqv_R009NYNYN_partial_28_1866,
  rs_R009_ueqv_R009NYNYN_partial_28_1867,
  rs_R009_ueqv_R009NYNYN_partial_28_1868,
  rs_R009_ueqv_R009NYNYN_partial_28_1869,
  rs_R009_ueqv_R009NYNYN_partial_28_1870,
  rs_R009_ueqv_R009NYNYN_partial_28_1871,
  rs_R009_ueqv_R009NYNYN_partial_28_1872,
  rs_R009_ueqv_R009NYNYN_partial_28_1873,
  rs_R009_ueqv_R009NYNYN_partial_28_1874,
  rs_R009_ueqv_R009NYNYN_partial_28_1875,
  rs_R009_ueqv_R009NYNYN_partial_28_1876,
  rs_R009_ueqv_R009NYNYN_partial_28_1877,
  rs_R009_ueqv_R009NYNYN_partial_28_1878,
  rs_R009_ueqv_R009NYNYN_partial_28_1879,
  rs_R009_ueqv_R009NYNYN_partial_28_1880,
  rs_R009_ueqv_R009NYNYN_partial_28_1881,
  rs_R009_ueqv_R009NYNYN_partial_28_1882,
  rs_R009_ueqv_R009NYNYN_partial_28_1883,
  rs_R009_ueqv_R009NYNYN_partial_28_1884,
  rs_R009_ueqv_R009NYNYN_partial_28_1885,
  rs_R009_ueqv_R009NYNYN_partial_28_1886,
  rs_R009_ueqv_R009NYNYN_partial_28_1887,
  rs_R009_ueqv_R009NYNYN_partial_28_1888,
  rs_R009_ueqv_R009NYNYN_partial_28_1889,
  rs_R009_ueqv_R009NYNYN_partial_28_1890,
  rs_R009_ueqv_R009NYNYN_partial_28_1891,
  rs_R009_ueqv_R009NYNYN_partial_28_1892,
  rs_R009_ueqv_R009NYNYN_partial_28_1893,
  rs_R009_ueqv_R009NYNYN_partial_28_1894,
  rs_R009_ueqv_R009NYNYN_partial_28_1895,
  rs_R009_ueqv_R009NYNYN_partial_28_1896,
  rs_R009_ueqv_R009NYNYN_partial_28_1897,
  rs_R009_ueqv_R009NYNYN_partial_28_1898,
  rs_R009_ueqv_R009NYNYN_partial_28_1899
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1800_1899 : Poly :=
[
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-609862617633560825504 : Rat) / 123978807561639952033) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (14, 2)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (14, 2), (16, 1)],
  term ((1208921285421916659216 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term ((-137007524352949323249170167964575687366646469566051 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 1)],
  term ((-481949880834952671652268149515992255158185167035995675797716310125792962827 : Rat) / 1271110220412625770322619932132518776802206775538664507501900747473028058) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((27652321124571477328 : Rat) / 31368132033667939671) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((481949880834952671652268149515992255158185167035995675797716310125792962827 : Rat) / 2542220440825251540645239864265037553604413551077329015003801494946056116) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-13826160562285738664 : Rat) / 31368132033667939671) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (10, 1), (12, 1), (13, 2)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((274015048705898646498340335929151374733292939132102 : Rat) / 36572061034282584137616066011116869300602424550113) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((953789084266222497832391856858071392249530619604800072783410890629 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((7513773230706336 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-953789084266222497832391856858071392249530619604800072783410890629 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-3756886615353168 : Rat) / 7342292683791569) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((8892257979727230693893145296998186705213684354438523913679746082269764872703 : Rat) / 8474068136084171802150799547550125178681378503591096716679338316486853720) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((22098800676600201293452 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((128933557170617993580729641760225898974522438165940703683298922595 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-951906782215224 : Rat) / 1048898954827367) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2322675752223117226937495397302339407129645590647168273359997647893185832857 : Rat) / 4237034068042085901075399773775062589340689251795548358339669158243426860) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-10064899077978349607936 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23358108100026922204777270509761631113345 : Rat) / 158268699902591792672851472705463197142) [(8, 1), (10, 1), (13, 2)],
  term ((56725081167931434318180704338413899432579 : Rat) / 226098142717988275246930675293518853060) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((2341729852604773870076 : Rat) / 619894037808199760165) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((70086593825018403868280479826335326238847 : Rat) / 791343499512958963364257363527315985710) [(8, 1), (10, 1), (13, 2), (14, 2)],
  term ((5786642016132209826136 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1928542997629952200360 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-20633282226743232809155300672767543307981154868904 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1), (14, 1)],
  term ((-2791258050432976591568149101486330426399311712952021369495929615653 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-13081784351820624 : Rat) / 7342292683791569) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7331855534132527407 : Rat) / 712202390327782193) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1), (14, 2)],
  term ((2791258050432976591568149101486330426399311712952021369495929615653 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (10, 1), (15, 2)],
  term ((6540892175910312 : Rat) / 7342292683791569) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((7331855534132527407 : Rat) / 1424404780655564386) [(8, 1), (10, 1), (16, 1)],
  term ((-2330376069237146572013115802386669917732859146905775967222314407974556310412893113 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((1823551398765937628585623281122279477877316231832138541747675556658466990334880401 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((163804572433884735074256662 : Rat) / 3788172465045908734368315) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((22840437580551364526521181490269113958132884171665929428493078502911 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((281773127210213515199096 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1077908223384056850188027 : Rat) / 39875499632062197203877) [(8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-199113937235330105248149723860065805689736084514946286331328700729280619598030780009 : Rat) / 55124636420417900035394588563055326299482581928343290134251573170183442171532800) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-59122561008242823199214272 : Rat) / 757634493009181746873663) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1495525429913678976937492451364222073470723871868253552461132836582954194804117135263 : Rat) / 771744909885850600495524239882774568192756146996806061879522024382568190401459200) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((30150654173219100218659154 : Rat) / 757634493009181746873663) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1452055495750916975764775275784254820252127003009230923297108945203623907319 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-40921204231110729270768 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1452055495750916975764775275784254820252127003009230923297108945203623907319 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((20460602115555364635384 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((18456414677102517624320312023687209539034828708453125962423596987822842443097797524283 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(8, 1), (11, 1), (13, 1)],
  term ((-2129279931972129931625592372956575950974622745957297726208861890543887403790681207429 : Rat) / 551246364204179000353945885630553262994825819283432901342515731701834421715328000) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3688627331471893040292 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-587506323123098213894560891 : Rat) / 7576344930091817468736630) [(8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-544701710628467500451098989722573294817863418213503355668951496014667272478992189 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-84816661439419142864154211 : Rat) / 3788172465045908734368315) [(8, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13681450482515846130564364059664745032652970856685680633592547136040249222621 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1844313665735946520146 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((48023070325894096911336793 : Rat) / 1082334990013116781248090) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((76814640025823290474444 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-607530170607256177327326459972902888652460477006899006549896507267 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-38407320012911645237222 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (11, 1), (13, 3)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (11, 1), (13, 3), (14, 1)],
  term ((321650454157266885785243777032926491656452898761473127575583552159713844011096557003 : Rat) / 406181531518868737102907494675144509575134814208845295726064223359246416000768000) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((5280214630511503574042474 : Rat) / 199377498160310986019385) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((65527747926774976656575691928343585519952894741040052423651018896972866247938941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((169856573500911914828 : Rat) / 4578443937821456955) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-182324643502433503891450289129787984294019964236370823425779135179445511234881177241 : Rat) / 203090765759434368551453747337572254787567407104422647863032111679623208000384000) [(8, 1), (11, 1), (15, 1)],
  term ((-4489293366816804575774966 : Rat) / 199377498160310986019385) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92234639819187056421359338697900432890234011352069641432437217750331862581886477 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(8, 1), (11, 2)],
  term ((-45713888642553981033841790491863481674142972118476016100560369021 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(8, 1), (11, 2), (12, 1)],
  term ((39371264352527335939780948429571340398194157231219885691702355841 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((6878784893032864550968 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 1), (14, 2)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-2339813845829942871268 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-515550744254505105610557331621144724603932 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 2)],
  term ((1031101488509010211221114663242289449207864 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 2), (12, 2), (14, 1)],
  term ((8796628805491915233728 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-4398314402745957616864 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (12, 2), (16, 1)],
  term ((14868088828534844126966586321245685983314365719879163408303541449900287138 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-25768772353505872590416 : Rat) / 4339258264657398321155) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7434044414267422063483293160622842991657182859939581704151770724950143569 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((12884386176752936295208 : Rat) / 4339258264657398321155) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (11, 2), (13, 2)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (11, 2), (13, 2), (14, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (13, 2), (16, 1)],
  term ((430438948078203486145722327871438080504940944194724530388913317469267620963442009 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (11, 2), (14, 1)],
  term ((14378058177365993192048714 : Rat) / 3788172465045908734368315) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((1768917364496725458994658525725901273702904837335146181495827241 : Rat) / 21289286713899566354200222355021492166352653491937627234066750) [(8, 1), (11, 2), (14, 2)],
  term ((938199509137136123812 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (14, 2), (16, 1)],
  term ((-1724472677753451261835628 : Rat) / 757634493009181746873663) [(8, 1), (11, 2), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 3), (13, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (11, 3), (13, 1), (14, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(8, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (11, 3), (13, 1), (16, 1)],
  term ((54835671685597246628741636828887861170165719870576301322320443843888119421986609 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (12, 1)],
  term ((-121625437748134790270680911150500107905461057498009365859063198879555581772705191 : Rat) / 184946537070037049581941200125281482024721085840875685841526558757325582439000) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8951408004436360329543434 : Rat) / 541167495006558390624045) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((510824695436063745992095358155856517326701412390734331419925884435 : Rat) / 496421758526874769830536245782168351299747869075833566400674634) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((45693315376367472 : Rat) / 7342292683791569) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((26469195250716392942003331374992758370274212439338725187426440856345999403168941 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((25436191324550374962881839 : Rat) / 3788172465045908734368315) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((639060419437402006964328396535439000559354878463206290952697703 : Rat) / 604789532770371354388708357514079940725773340015860757343284) [(8, 1), (12, 1), (13, 2)],
  term ((-185866240284508789164791464626425155822198639472974773515841337616 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-109130967852228228832768 : Rat) / 4339258264657398321155) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-97976927717472896789198442200697353766728556724507076818550136473 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((-57358895516903132508304 : Rat) / 4339258264657398321155) [(8, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((13781041561067979508692 : Rat) / 867851652931479664231) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-54540312368741880620227031354218554850144425323748723087376640110600872968482609 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (12, 1), (14, 1)],
  term ((60441770116071779310055830359566806040026171622468352907043530678818884414476941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((654182124893301927722 : Rat) / 4578443937821456955) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-158594060071578422407 : Rat) / 4578443937821456955) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-73528824194038061415021174094186673682250946228164 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (12, 1), (14, 2)],
  term ((-60441770116071779310055830359566806040026171622468352907043530678818884414476941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(8, 1), (12, 1), (15, 2)],
  term ((-327091062446650963861 : Rat) / 4578443937821456955) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((158594060071578422407 : Rat) / 9156887875642913910) [(8, 1), (12, 1), (16, 1)],
  term ((274843295308124612710402402812497836456130738914475978125201370684625697381 : Rat) / 2781697338218308665246330531095397227834731985374957085991914708920464000) [(8, 1), (12, 2)],
  term ((97976927717472896789198442200697353766728556724507076818550136473 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((57358895516903132508304 : Rat) / 4339258264657398321155) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97976927717472896789198442200697353766728556724507076818550136473 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-28679447758451566254152 : Rat) / 4339258264657398321155) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-274843295308124612710402402812497836456130738914475978125201370684625697381 : Rat) / 1390848669109154332623165265547698613917365992687478542995957354460232000) [(8, 1), (12, 2), (14, 1)],
  term ((-510824695436063745992095358155856517326701412390734331419925884435 : Rat) / 496421758526874769830536245782168351299747869075833566400674634) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-45693315376367472 : Rat) / 7342292683791569) [(8, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-12473383448473979968 : Rat) / 3561011951638910965) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((510824695436063745992095358155856517326701412390734331419925884435 : Rat) / 992843517053749539661072491564336702599495738151667132801349268) [(8, 1), (12, 2), (15, 2)],
  term ((22846657688183736 : Rat) / 7342292683791569) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((6236691724236989984 : Rat) / 3561011951638910965) [(8, 1), (12, 2), (16, 1)],
  term ((4063045705207387077674552897387281773933955894355770898606312357684095755692632778627 : Rat) / 406181531518868737102907494675144509575134814208845295726064223359246416000768000) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((85862326099148926165269719 : Rat) / 398754996320621972038770) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-62552508430921425373921855772752876437386522140499741843289622253340762583680941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4711115667021051700754 : Rat) / 32049107564750198685) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2506489085412338328669881438338099196666029677411575322577893397531964219560316242783 : Rat) / 812363063037737474205814989350289019150269628417690591452128446718492832001536000) [(8, 1), (13, 1), (15, 1)],
  term ((-11310895106922192706975817 : Rat) / 159501998528248788815508) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (13, 1), (15, 3)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3911437276339225669053612922746848938229872422707121446655637498901135683519947871 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(8, 1), (13, 2)],
  term ((747032692228657423326944001941864033933078989206852128183115339311516171416572169 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(8, 1), (13, 2), (14, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((27739031826592246621666082 : Rat) / 1262724155015302911456105) [(8, 1), (13, 2), (14, 1), (16, 1)],
  term ((417584799913313349768195229230314209107658863771641265526572870241646792317557841 : Rat) / 184946537070037049581941200125281482024721085840875685841526558757325582439000) [(8, 1), (13, 2), (14, 2)],
  term ((20576868924736057943106806 : Rat) / 541167495006558390624045) [(8, 1), (13, 2), (14, 2), (16, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 1778081226344891781902802571091395025733773619646630626589254960) [(8, 1), (13, 2), (15, 2)],
  term ((4534893515323182578033 : Rat) / 4339258264657398321155) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-155236136716352942665872067 : Rat) / 7576344930091817468736630) [(8, 1), (13, 2), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (13, 3), (14, 1), (15, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (13, 3), (15, 1)],
  term ((-1829651516096334465434077106476162947784574843422800396511268508292173420395151700243 : Rat) / 4812673314299278992421686454348963478666321677436744373568267787141947166599680000) [(8, 1), (14, 1)],
  term ((-58309833402946249047430151588076709184802513992725385791913299860857188347811331 : Rat) / 10881999987110023498443645037645193955289471526786832120400370341296855168000) [(8, 1), (14, 1), (15, 2)],
  term ((-1144831247999038932776 : Rat) / 10683035854916732895) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3114746572412762020909519 : Rat) / 674954205313639184306100) [(8, 1), (14, 1), (16, 1)],
  term ((1829651516096334465434077106476162947784574843422800396511268508292173420395151700243 : Rat) / 2406336657149639496210843227174481739333160838718372186784133893570973583299840000) [(8, 1), (14, 2)],
  term ((3114746572412762020909519 : Rat) / 337477102656819592153050) [(8, 1), (14, 2), (16, 1)],
  term ((58309833402946249047430151588076709184802513992725385791913299860857188347811331 : Rat) / 21763999974220046996887290075290387910578943053573664240800740682593710336000) [(8, 1), (15, 2)],
  term ((572415623999519466388 : Rat) / 10683035854916732895) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1800 through 1899. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1800_1899_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1800_1899
      rs_R009_ueqv_R009NYNYN_block_28_1800_1899 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
