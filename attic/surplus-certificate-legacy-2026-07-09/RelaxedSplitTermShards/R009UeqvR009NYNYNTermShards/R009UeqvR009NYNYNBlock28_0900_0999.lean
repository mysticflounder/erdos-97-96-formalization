/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:900-999

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0900 : Poly :=
[
  term ((-16123973139525122056 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 900 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0900 : Poly :=
[
  term ((-32247946279050244112 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((16123973139525122056 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0900_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0900
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0901 : Poly :=
[
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 901 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0901 : Poly :=
[
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0901_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0901
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0902 : Poly :=
[
  term ((58476728218128333355505465432437508354625961442790144204606946550362564943960881 : Rat) / 116044886004729129149453302039392302446883818566823959743702938828125855648000) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 902 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0902 : Poly :=
[
  term ((58476728218128333355505465432437508354625961442790144204606946550362564943960881 : Rat) / 58022443002364564574726651019696151223441909283411979871851469414062927824000) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-58476728218128333355505465432437508354625961442790144204606946550362564943960881 : Rat) / 116044886004729129149453302039392302446883818566823959743702938828125855648000) [(2, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0902_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0902
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0903 : Poly :=
[
  term ((9873490918280827907616683 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 903 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0903 : Poly :=
[
  term ((19746981836561655815233366 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9873490918280827907616683 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0903_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0903
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0904 : Poly :=
[
  term ((-117694492488224116897884962246862960285697056578356864043326998525081997271864857 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(2, 1), (8, 1), (13, 2)]
]

/-- Partial product 904 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0904 : Poly :=
[
  term ((117694492488224116897884962246862960285697056578356864043326998525081997271864857 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(2, 1), (8, 1), (13, 2)],
  term ((-117694492488224116897884962246862960285697056578356864043326998525081997271864857 : Rat) / 123297691380024699721294133416854321349814057227250457227684372504883721626000) [(2, 1), (8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0904_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0904
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0905 : Poly :=
[
  term ((-1486610379491321853003584 : Rat) / 180389165002186130208015) [(2, 1), (8, 1), (13, 2), (16, 1)]
]

/-- Partial product 905 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0905 : Poly :=
[
  term ((-2973220758982643706007168 : Rat) / 180389165002186130208015) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((1486610379491321853003584 : Rat) / 180389165002186130208015) [(2, 1), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0905_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0905
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0906 : Poly :=
[
  term ((-37463188373817467937596472322427429801292995167084459523207354429 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(2, 1), (8, 1), (15, 2)]
]

/-- Partial product 906 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0906 : Poly :=
[
  term ((-37463188373817467937596472322427429801292995167084459523207354429 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((37463188373817467937596472322427429801292995167084459523207354429 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(2, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0906_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0906
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0907 : Poly :=
[
  term ((50696390557791 : Rat) / 1048898954827367) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 907 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0907 : Poly :=
[
  term ((101392781115582 : Rat) / 1048898954827367) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-50696390557791 : Rat) / 1048898954827367) [(2, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0907_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0907
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0908 : Poly :=
[
  term ((-39757722457930941557 : Rat) / 64098215129500397370) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 908 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0908 : Poly :=
[
  term ((-39757722457930941557 : Rat) / 32049107564750198685) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((39757722457930941557 : Rat) / 64098215129500397370) [(2, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0908_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0908
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0909 : Poly :=
[
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (8, 2)]
]

/-- Partial product 909 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0909 : Poly :=
[
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (8, 2)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0909_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0909
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0910 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (13, 1)]
]

/-- Partial product 910 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0910 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (13, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0910_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0910
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0911 : Poly :=
[
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (15, 1)]
]

/-- Partial product 911 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0911 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0911_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0911
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0912 : Poly :=
[
  term ((65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (13, 1), (15, 1)]
]

/-- Partial product 912 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0912 : Poly :=
[
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0912_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0912
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0913 : Poly :=
[
  term ((-32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (15, 2)]
]

/-- Partial product 913 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0913 : Poly :=
[
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (14, 1), (15, 2)],
  term ((32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0913_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0913
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0914 : Poly :=
[
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (8, 2), (16, 1)]
]

/-- Partial product 914 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0914 : Poly :=
[
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (8, 2), (14, 1), (16, 1)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0914_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0914
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0915 : Poly :=
[
  term ((6111060914006031110211828123493703995770509217573018391210148396 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(2, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 915 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0915 : Poly :=
[
  term ((-6111060914006031110211828123493703995770509217573018391210148396 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((12222121828012062220423656246987407991541018435146036782420296792 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0915_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0915
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0916 : Poly :=
[
  term ((22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 916 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0916 : Poly :=
[
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((45671190677972704413695000643485550596477344010237007922471871272 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0916_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0916
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0917 : Poly :=
[
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 917 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0917 : Poly :=
[
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0917_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0917
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0918 : Poly :=
[
  term ((-11417797669493176103423750160871387649119336002559251980617967818 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 918 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0918 : Poly :=
[
  term ((11417797669493176103423750160871387649119336002559251980617967818 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0918_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0918
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0919 : Poly :=
[
  term ((-133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 919 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0919 : Poly :=
[
  term ((133581949606245724688 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0919_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0919
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0920 : Poly :=
[
  term ((-1834614938618477793248 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 920 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0920 : Poly :=
[
  term ((-3669229877236955586496 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1834614938618477793248 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0920_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0920
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0921 : Poly :=
[
  term ((-30274802631232102999051156877244780970342403 : Rat) / 118701524926943844504638604529097397856500) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 921 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0921 : Poly :=
[
  term ((30274802631232102999051156877244780970342403 : Rat) / 118701524926943844504638604529097397856500) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-30274802631232102999051156877244780970342403 : Rat) / 59350762463471922252319302264548698928250) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0921_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0921
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0922 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 922 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0922 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0922_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0922
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0923 : Poly :=
[
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 923 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0923 : Poly :=
[
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0923_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0923
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0924 : Poly :=
[
  term ((18575255211295021037356 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 924 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0924 : Poly :=
[
  term ((37150510422590042074712 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18575255211295021037356 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0924_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0924
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0925 : Poly :=
[
  term ((20142985893641688749877661797377407989061276942749176069735255882222087366 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 925 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0925 : Poly :=
[
  term ((40285971787283377499755323594754815978122553885498352139470511764444174732 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20142985893641688749877661797377407989061276942749176069735255882222087366 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0925_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0925
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0926 : Poly :=
[
  term ((-32335284058956526236 : Rat) / 88556291115457108595) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 926 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0926 : Poly :=
[
  term ((-64670568117913052472 : Rat) / 88556291115457108595) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32335284058956526236 : Rat) / 88556291115457108595) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0926_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0926
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0927 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 927 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0927 : Poly :=
[
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((2793547474910435620337797452357109501601422 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0927_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0927
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0928 : Poly :=
[
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 928 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0928 : Poly :=
[
  term ((-9505418205450486962784 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0928_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0928
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0929 : Poly :=
[
  term ((-1343831229432850867321608576714123139193 : Rat) / 16569168750271335078816108951576967875) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 929 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0929 : Poly :=
[
  term ((-2687662458865701734643217153428246278386 : Rat) / 16569168750271335078816108951576967875) [(2, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((1343831229432850867321608576714123139193 : Rat) / 16569168750271335078816108951576967875) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0929_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0929
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0930 : Poly :=
[
  term ((13717695455002213488 : Rat) / 21805317912851247845) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 930 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0930 : Poly :=
[
  term ((27435390910004426976 : Rat) / 21805317912851247845) [(2, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-13717695455002213488 : Rat) / 21805317912851247845) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0930_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0930
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0931 : Poly :=
[
  term ((321619962511436566027733994963335426415349427886628815976318596314142529605475279 : Rat) / 328793843680065865923451022444944856932837485939334552607158326679689924336000) [(2, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 931 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0931 : Poly :=
[
  term ((-321619962511436566027733994963335426415349427886628815976318596314142529605475279 : Rat) / 328793843680065865923451022444944856932837485939334552607158326679689924336000) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((321619962511436566027733994963335426415349427886628815976318596314142529605475279 : Rat) / 164396921840032932961725511222472428466418742969667276303579163339844962168000) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0931_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0931
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0932 : Poly :=
[
  term ((1514182081940201160777670547240748444166024 : Rat) / 29675381231735961126159651132274349464125) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 932 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0932 : Poly :=
[
  term ((-1514182081940201160777670547240748444166024 : Rat) / 29675381231735961126159651132274349464125) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((3028364163880402321555341094481496888332048 : Rat) / 29675381231735961126159651132274349464125) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0932_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0932
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0933 : Poly :=
[
  term ((-223296727331034332072 : Rat) / 1859682113424599280495) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 933 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0933 : Poly :=
[
  term ((223296727331034332072 : Rat) / 1859682113424599280495) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-446593454662068664144 : Rat) / 1859682113424599280495) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0933_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0933
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0934 : Poly :=
[
  term ((792342443856172660921864 : Rat) / 84181610334353527430407) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 934 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0934 : Poly :=
[
  term ((1584684887712345321843728 : Rat) / 84181610334353527430407) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-792342443856172660921864 : Rat) / 84181610334353527430407) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0934_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0934
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0935 : Poly :=
[
  term ((269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 935 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0935 : Poly :=
[
  term ((-269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0935_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0935
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0936 : Poly :=
[
  term ((520403081985468 : Rat) / 7342292683791569) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 936 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0936 : Poly :=
[
  term ((-520403081985468 : Rat) / 7342292683791569) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0936_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0936
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0937 : Poly :=
[
  term ((177753628858299967133381696651137480092796227905625126063493354850482955713 : Rat) / 5649378757389447868100533031700083452454252335727397811119558877657902480) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 937 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0937 : Poly :=
[
  term ((177753628858299967133381696651137480092796227905625126063493354850482955713 : Rat) / 2824689378694723934050266515850041726227126167863698905559779438828951240) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-177753628858299967133381696651137480092796227905625126063493354850482955713 : Rat) / 5649378757389447868100533031700083452454252335727397811119558877657902480) [(2, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0937_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0937
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0938 : Poly :=
[
  term ((-98160245361336473397 : Rat) / 123978807561639952033) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 938 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0938 : Poly :=
[
  term ((-196320490722672946794 : Rat) / 123978807561639952033) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((98160245361336473397 : Rat) / 123978807561639952033) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0938_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0938
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0939 : Poly :=
[
  term ((-11015337245871530644372254780497110746203588287975421096385367432341194114228491 : Rat) / 8288920428909223510675235859956593031920272754773139981693067059151846832000) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 939 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0939 : Poly :=
[
  term ((11015337245871530644372254780497110746203588287975421096385367432341194114228491 : Rat) / 8288920428909223510675235859956593031920272754773139981693067059151846832000) [(2, 1), (9, 1), (11, 1)],
  term ((-11015337245871530644372254780497110746203588287975421096385367432341194114228491 : Rat) / 4144460214454611755337617929978296515960136377386569990846533529575923416000) [(2, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0939_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0939
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0940 : Poly :=
[
  term ((21679068271904185357649957015363092919879434786883684667519384027067 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(2, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 940 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0940 : Poly :=
[
  term ((-21679068271904185357649957015363092919879434786883684667519384027067 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((21679068271904185357649957015363092919879434786883684667519384027067 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0940_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0940
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0941 : Poly :=
[
  term ((34736349784249714064957 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 941 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0941 : Poly :=
[
  term ((69472699568499428129914 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-34736349784249714064957 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0941_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0941
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0942 : Poly :=
[
  term ((32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 942 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0942 : Poly :=
[
  term ((32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0942_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0942
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0943 : Poly :=
[
  term ((-967153050889529045656 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 943 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0943 : Poly :=
[
  term ((-1934306101779058091312 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((967153050889529045656 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0943_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0943
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0944 : Poly :=
[
  term ((-32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 944 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0944 : Poly :=
[
  term ((32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((-65181104695659976368950852661160175790944298441446950316508824126 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0944_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0944
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0945 : Poly :=
[
  term ((1934306101779058091312 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 945 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0945 : Poly :=
[
  term ((3868612203558116182624 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1934306101779058091312 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0945_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0945
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0946 : Poly :=
[
  term ((-23910886654490830192590522720544787278064728300318419236833932953953 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(2, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 946 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0946 : Poly :=
[
  term ((23910886654490830192590522720544787278064728300318419236833932953953 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-23910886654490830192590522720544787278064728300318419236833932953953 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(2, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0946_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0946
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0947 : Poly :=
[
  term ((-29591778433159047972079 : Rat) / 8678516529314796642310) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 947 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0947 : Poly :=
[
  term ((29591778433159047972079 : Rat) / 8678516529314796642310) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-29591778433159047972079 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0947_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0947
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0948 : Poly :=
[
  term ((-52101332338786740904171289 : Rat) / 2525448310030605822912210) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 948 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0948 : Poly :=
[
  term ((-52101332338786740904171289 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((52101332338786740904171289 : Rat) / 2525448310030605822912210) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0948_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0948
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0949 : Poly :=
[
  term ((-2567807059625671714701481072778145275504236355848370844959993441558156720909411063 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(2, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 949 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0949 : Poly :=
[
  term ((2567807059625671714701481072778145275504236355848370844959993441558156720909411063 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-2567807059625671714701481072778145275504236355848370844959993441558156720909411063 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0949_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0949
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0950 : Poly :=
[
  term ((1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 950 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0950 : Poly :=
[
  term ((-1958450767185275659457518826664009822218453 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0950_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0950
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0951 : Poly :=
[
  term ((-6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 951 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0951 : Poly :=
[
  term ((6663890176943651043216 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0951_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0951
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0952 : Poly :=
[
  term ((39353282977332540557975581 : Rat) / 3788172465045908734368315) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 952 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0952 : Poly :=
[
  term ((78706565954665081115951162 : Rat) / 3788172465045908734368315) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-39353282977332540557975581 : Rat) / 3788172465045908734368315) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0952_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0952
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0953 : Poly :=
[
  term ((15900581221257629808687812529758486728767381251029689785642838271604890335387308201 : Rat) / 3760940106656192010212106432177263977547544576007826812278372438511540888896000) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 953 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0953 : Poly :=
[
  term ((15900581221257629808687812529758486728767381251029689785642838271604890335387308201 : Rat) / 1880470053328096005106053216088631988773772288003913406139186219255770444448000) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15900581221257629808687812529758486728767381251029689785642838271604890335387308201 : Rat) / 3760940106656192010212106432177263977547544576007826812278372438511540888896000) [(2, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0953_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0953
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0954 : Poly :=
[
  term ((1577169882092506321177744 : Rat) / 22153055351145665113265) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 954 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0954 : Poly :=
[
  term ((3154339764185012642355488 : Rat) / 22153055351145665113265) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1577169882092506321177744 : Rat) / 22153055351145665113265) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0954_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0954
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0955 : Poly :=
[
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(2, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 955 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0955 : Poly :=
[
  term ((-3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(2, 1), (9, 1), (12, 2), (13, 1)],
  term ((6948407091279567622585337464070887843396586 : Rat) / 3297264581303995680684405681363816607125) [(2, 1), (9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0955_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0955
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0956 : Poly :=
[
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 956 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0956 : Poly :=
[
  term ((-70928648098004089678176 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((35464324049002044839088 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0956_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0956
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0957 : Poly :=
[
  term ((-150942233381998976345189935257203699047703 : Rat) / 208248289345515516674804569349293680450) [(2, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 957 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0957 : Poly :=
[
  term ((-150942233381998976345189935257203699047703 : Rat) / 104124144672757758337402284674646840225) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((150942233381998976345189935257203699047703 : Rat) / 208248289345515516674804569349293680450) [(2, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0957_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0957
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0958 : Poly :=
[
  term ((256800549488891299608 : Rat) / 45676402785867350749) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 958 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0958 : Poly :=
[
  term ((513601098977782599216 : Rat) / 45676402785867350749) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-256800549488891299608 : Rat) / 45676402785867350749) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0958_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0958
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0959 : Poly :=
[
  term ((1277210864634329405353285148466071998669403018872525096021161165508941726858084678599 : Rat) / 428747172158805889164180133268208093440420081664892256599734457990315661334144000) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 959 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0959 : Poly :=
[
  term ((-1277210864634329405353285148466071998669403018872525096021161165508941726858084678599 : Rat) / 428747172158805889164180133268208093440420081664892256599734457990315661334144000) [(2, 1), (9, 1), (13, 1)],
  term ((1277210864634329405353285148466071998669403018872525096021161165508941726858084678599 : Rat) / 214373586079402944582090066634104046720210040832446128299867228995157830667072000) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0959_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0959
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0960 : Poly :=
[
  term ((-85448183485910413601899247619386323874415185659347840762244702381630858306478089 : Rat) / 197276306208039519554070613466966914159702491563600731564294996007813954601600) [(2, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 960 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0960 : Poly :=
[
  term ((85448183485910413601899247619386323874415185659347840762244702381630858306478089 : Rat) / 197276306208039519554070613466966914159702491563600731564294996007813954601600) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-85448183485910413601899247619386323874415185659347840762244702381630858306478089 : Rat) / 98638153104019759777035306733483457079851245781800365782147498003906977300800) [(2, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0960_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0960
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0961 : Poly :=
[
  term ((-6818684119266449903537992 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 961 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0961 : Poly :=
[
  term ((6818684119266449903537992 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13637368238532899807075984 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0961_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0961
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0962 : Poly :=
[
  term ((-587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 60529058114886941443934282482500894133438417882793547976280987974906098000) [(2, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 962 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0962 : Poly :=
[
  term ((-587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 30264529057443470721967141241250447066719208941396773988140493987453049000) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 60529058114886941443934282482500894133438417882793547976280987974906098000) [(2, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0962_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0962
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0963 : Poly :=
[
  term ((-122832533480902439169 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 963 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0963 : Poly :=
[
  term ((-245665066961804878338 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((122832533480902439169 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0963_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0963
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0964 : Poly :=
[
  term ((18403502639038855714929562 : Rat) / 420908051671767637152035) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 964 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0964 : Poly :=
[
  term ((36807005278077711429859124 : Rat) / 420908051671767637152035) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18403502639038855714929562 : Rat) / 420908051671767637152035) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0964_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0964
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0965 : Poly :=
[
  term ((2529376847556513213740882649187082465391301512801738440342144411213860651771 : Rat) / 90793587172330412165901423723751341200157626824190321964421481962359147000) [(2, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 965 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0965 : Poly :=
[
  term ((2529376847556513213740882649187082465391301512801738440342144411213860651771 : Rat) / 45396793586165206082950711861875670600078813412095160982210740981179573500) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2529376847556513213740882649187082465391301512801738440342144411213860651771 : Rat) / 90793587172330412165901423723751341200157626824190321964421481962359147000) [(2, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0965_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0965
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0966 : Poly :=
[
  term ((341916404291175964958 : Rat) / 1859682113424599280495) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 966 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0966 : Poly :=
[
  term ((683832808582351929916 : Rat) / 1859682113424599280495) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-341916404291175964958 : Rat) / 1859682113424599280495) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0966_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0966
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0967 : Poly :=
[
  term ((-40124413927308229725632498429178187339943 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (9, 1), (13, 3)]
]

/-- Partial product 967 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0967 : Poly :=
[
  term ((40124413927308229725632498429178187339943 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (9, 1), (13, 3)],
  term ((-40124413927308229725632498429178187339943 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0967_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0967
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0968 : Poly :=
[
  term ((-3312839258305634239384 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 3), (16, 1)]
]

/-- Partial product 968 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0968 : Poly :=
[
  term ((-6625678516611268478768 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((3312839258305634239384 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0968_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0968
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0969 : Poly :=
[
  term ((-58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 969 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0969 : Poly :=
[
  term ((58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0969_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0969
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0970 : Poly :=
[
  term ((-1169707052054176376051 : Rat) / 32049107564750198685) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 970 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0970 : Poly :=
[
  term ((1169707052054176376051 : Rat) / 32049107564750198685) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2339414104108352752102 : Rat) / 32049107564750198685) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0970_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0970
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0971 : Poly :=
[
  term ((-386618528666768036845853702925720199949437155226027783093442886237586985518832603977 : Rat) / 226983797025250176616330658789051343586104749116707665258682948347814173647488000) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 971 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0971 : Poly :=
[
  term ((-386618528666768036845853702925720199949437155226027783093442886237586985518832603977 : Rat) / 113491898512625088308165329394525671793052374558353832629341474173907086823744000) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((386618528666768036845853702925720199949437155226027783093442886237586985518832603977 : Rat) / 226983797025250176616330658789051343586104749116707665258682948347814173647488000) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0971_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0971
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0972 : Poly :=
[
  term ((-298506968105783672423747707 : Rat) / 7576344930091817468736630) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 972 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0972 : Poly :=
[
  term ((-298506968105783672423747707 : Rat) / 3788172465045908734368315) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((298506968105783672423747707 : Rat) / 7576344930091817468736630) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0972_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0972
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0973 : Poly :=
[
  term ((454172649941397322703169226714036371505101493248800838810809385905477135927110133 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(2, 1), (9, 2)]
]

/-- Partial product 973 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0973 : Poly :=
[
  term ((-454172649941397322703169226714036371505101493248800838810809385905477135927110133 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(2, 1), (9, 2)],
  term ((454172649941397322703169226714036371505101493248800838810809385905477135927110133 : Rat) / 1972763062080395195540706134669669141597024915636007315642949960078139546016000) [(2, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0973_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0973
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0974 : Poly :=
[
  term ((-1426693417885731035264472391514652665982413 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1)]
]

/-- Partial product 974 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0974 : Poly :=
[
  term ((1426693417885731035264472391514652665982413 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1)],
  term ((-1426693417885731035264472391514652665982413 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0974_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0974
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0975 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1), (12, 1)]
]

/-- Partial product 975 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0975 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1), (12, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 2), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0975_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0975
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0976 : Poly :=
[
  term ((-353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 976 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0976 : Poly :=
[
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0976_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0976
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0977 : Poly :=
[
  term ((-207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (10, 1), (14, 1)]
]

/-- Partial product 977 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0977 : Poly :=
[
  term ((207760750487606125413101914418108277395731 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (10, 1), (14, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0977_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0977
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0978 : Poly :=
[
  term ((176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 978 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0978 : Poly :=
[
  term ((-176733422091409371708 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0978_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0978
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0979 : Poly :=
[
  term ((2427257404745233260168 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 979 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0979 : Poly :=
[
  term ((4854514809490466520336 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-2427257404745233260168 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0979_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0979
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0980 : Poly :=
[
  term ((-403980388158713776443796461366553101555982708187704707196331482977048258866852701 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 2), (12, 1)]
]

/-- Partial product 980 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0980 : Poly :=
[
  term ((403980388158713776443796461366553101555982708187704707196331482977048258866852701 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 2), (12, 1)],
  term ((-403980388158713776443796461366553101555982708187704707196331482977048258866852701 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0980_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0980
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0981 : Poly :=
[
  term ((-2534619410383784285525266 : Rat) / 252544831003060582291221) [(2, 1), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 981 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0981 : Poly :=
[
  term ((-5069238820767568571050532 : Rat) / 252544831003060582291221) [(2, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((2534619410383784285525266 : Rat) / 252544831003060582291221) [(2, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0981_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0981
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0982 : Poly :=
[
  term ((-145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

/-- Partial product 982 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0982 : Poly :=
[
  term ((-145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0982_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0982
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0983 : Poly :=
[
  term ((123582075927606029364 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 983 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0983 : Poly :=
[
  term ((247164151855212058728 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0983_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0983
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0984 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (13, 2)]
]

/-- Partial product 984 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0984 : Poly :=
[
  term ((-145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (13, 2)],
  term ((145278151340587786739123651173532601518873 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0984_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0984
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0985 : Poly :=
[
  term ((-247164151855212058728 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 2), (16, 1)]
]

/-- Partial product 985 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0985 : Poly :=
[
  term ((-494328303710424117456 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((247164151855212058728 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0985_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0985
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0986 : Poly :=
[
  term ((85942762904147023751808429972592488049091969906872060706335603436212331060362889 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(2, 1), (9, 2), (14, 1)]
]

/-- Partial product 986 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0986 : Poly :=
[
  term ((-85942762904147023751808429972592488049091969906872060706335603436212331060362889 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(2, 1), (9, 2), (14, 1)],
  term ((85942762904147023751808429972592488049091969906872060706335603436212331060362889 : Rat) / 197276306208039519554070613466966914159702491563600731564294996007813954601600) [(2, 1), (9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0986_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0986
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0987 : Poly :=
[
  term ((6208785290316328380472624 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 987 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0987 : Poly :=
[
  term ((-6208785290316328380472624 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (14, 1), (16, 1)],
  term ((12417570580632656760945248 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0987_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0987
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0988 : Poly :=
[
  term ((8501243862674577881456008 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (16, 1)]
]

/-- Partial product 988 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0988 : Poly :=
[
  term ((17002487725349155762912016 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (14, 1), (16, 1)],
  term ((-8501243862674577881456008 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0988_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0988
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0989 : Poly :=
[
  term ((-58106342507755653130308725346454962332901298972836283345886076781998565465166711 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (10, 1)]
]

/-- Partial product 989 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0989 : Poly :=
[
  term ((58106342507755653130308725346454962332901298972836283345886076781998565465166711 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (10, 1)],
  term ((-58106342507755653130308725346454962332901298972836283345886076781998565465166711 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0989_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0989
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0990 : Poly :=
[
  term ((77088506021271746827134918446084686731647214027595131538653768022 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 990 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0990 : Poly :=
[
  term ((-77088506021271746827134918446084686731647214027595131538653768022 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((154177012042543493654269836892169373463294428055190263077307536044 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0990_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0990
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0991 : Poly :=
[
  term ((13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 991 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0991 : Poly :=
[
  term ((-13114502943491877507904514876279358545884 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0991_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0991
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0992 : Poly :=
[
  term ((267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 992 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0992 : Poly :=
[
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0992_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0992
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0993 : Poly :=
[
  term ((-5873599823743443743248 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 993 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0993 : Poly :=
[
  term ((-11747199647486887486496 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5873599823743443743248 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0993_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0993
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0994 : Poly :=
[
  term ((14297171268101709805588491019001173664277156940394241932796660974 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 994 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0994 : Poly :=
[
  term ((28594342536203419611176982038002347328554313880788483865593321948 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-14297171268101709805588491019001173664277156940394241932796660974 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0994_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0994
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0995 : Poly :=
[
  term ((732647758141359790384 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 995 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0995 : Poly :=
[
  term ((1465295516282719580768 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-732647758141359790384 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0995_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0995
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0996 : Poly :=
[
  term ((-17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 996 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0996 : Poly :=
[
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-34450362560783419843173414231676854389584 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0996_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0996
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0997 : Poly :=
[
  term ((3592281190170247726912 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 997 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0997 : Poly :=
[
  term ((7184562380340495453824 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0997_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0997
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0998 : Poly :=
[
  term ((-1500637434432007515703720439453381649496 : Rat) / 52337533036571360010863582243870104875) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 998 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0998 : Poly :=
[
  term ((-3001274868864015031407440878906763298992 : Rat) / 52337533036571360010863582243870104875) [(2, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((1500637434432007515703720439453381649496 : Rat) / 52337533036571360010863582243870104875) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0998_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0998
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_0999 : Poly :=
[
  term ((-10368364292952840768 : Rat) / 3115045416121606835) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 999 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_0999 : Poly :=
[
  term ((-20736728585905681536 : Rat) / 3115045416121606835) [(2, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((10368364292952840768 : Rat) / 3115045416121606835) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_0999_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_0999
        rs_R009_ueqv_R009NYNYN_generator_28_0900_0999 =
      rs_R009_ueqv_R009NYNYN_partial_28_0999 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_0900_0999 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_0900,
  rs_R009_ueqv_R009NYNYN_partial_28_0901,
  rs_R009_ueqv_R009NYNYN_partial_28_0902,
  rs_R009_ueqv_R009NYNYN_partial_28_0903,
  rs_R009_ueqv_R009NYNYN_partial_28_0904,
  rs_R009_ueqv_R009NYNYN_partial_28_0905,
  rs_R009_ueqv_R009NYNYN_partial_28_0906,
  rs_R009_ueqv_R009NYNYN_partial_28_0907,
  rs_R009_ueqv_R009NYNYN_partial_28_0908,
  rs_R009_ueqv_R009NYNYN_partial_28_0909,
  rs_R009_ueqv_R009NYNYN_partial_28_0910,
  rs_R009_ueqv_R009NYNYN_partial_28_0911,
  rs_R009_ueqv_R009NYNYN_partial_28_0912,
  rs_R009_ueqv_R009NYNYN_partial_28_0913,
  rs_R009_ueqv_R009NYNYN_partial_28_0914,
  rs_R009_ueqv_R009NYNYN_partial_28_0915,
  rs_R009_ueqv_R009NYNYN_partial_28_0916,
  rs_R009_ueqv_R009NYNYN_partial_28_0917,
  rs_R009_ueqv_R009NYNYN_partial_28_0918,
  rs_R009_ueqv_R009NYNYN_partial_28_0919,
  rs_R009_ueqv_R009NYNYN_partial_28_0920,
  rs_R009_ueqv_R009NYNYN_partial_28_0921,
  rs_R009_ueqv_R009NYNYN_partial_28_0922,
  rs_R009_ueqv_R009NYNYN_partial_28_0923,
  rs_R009_ueqv_R009NYNYN_partial_28_0924,
  rs_R009_ueqv_R009NYNYN_partial_28_0925,
  rs_R009_ueqv_R009NYNYN_partial_28_0926,
  rs_R009_ueqv_R009NYNYN_partial_28_0927,
  rs_R009_ueqv_R009NYNYN_partial_28_0928,
  rs_R009_ueqv_R009NYNYN_partial_28_0929,
  rs_R009_ueqv_R009NYNYN_partial_28_0930,
  rs_R009_ueqv_R009NYNYN_partial_28_0931,
  rs_R009_ueqv_R009NYNYN_partial_28_0932,
  rs_R009_ueqv_R009NYNYN_partial_28_0933,
  rs_R009_ueqv_R009NYNYN_partial_28_0934,
  rs_R009_ueqv_R009NYNYN_partial_28_0935,
  rs_R009_ueqv_R009NYNYN_partial_28_0936,
  rs_R009_ueqv_R009NYNYN_partial_28_0937,
  rs_R009_ueqv_R009NYNYN_partial_28_0938,
  rs_R009_ueqv_R009NYNYN_partial_28_0939,
  rs_R009_ueqv_R009NYNYN_partial_28_0940,
  rs_R009_ueqv_R009NYNYN_partial_28_0941,
  rs_R009_ueqv_R009NYNYN_partial_28_0942,
  rs_R009_ueqv_R009NYNYN_partial_28_0943,
  rs_R009_ueqv_R009NYNYN_partial_28_0944,
  rs_R009_ueqv_R009NYNYN_partial_28_0945,
  rs_R009_ueqv_R009NYNYN_partial_28_0946,
  rs_R009_ueqv_R009NYNYN_partial_28_0947,
  rs_R009_ueqv_R009NYNYN_partial_28_0948,
  rs_R009_ueqv_R009NYNYN_partial_28_0949,
  rs_R009_ueqv_R009NYNYN_partial_28_0950,
  rs_R009_ueqv_R009NYNYN_partial_28_0951,
  rs_R009_ueqv_R009NYNYN_partial_28_0952,
  rs_R009_ueqv_R009NYNYN_partial_28_0953,
  rs_R009_ueqv_R009NYNYN_partial_28_0954,
  rs_R009_ueqv_R009NYNYN_partial_28_0955,
  rs_R009_ueqv_R009NYNYN_partial_28_0956,
  rs_R009_ueqv_R009NYNYN_partial_28_0957,
  rs_R009_ueqv_R009NYNYN_partial_28_0958,
  rs_R009_ueqv_R009NYNYN_partial_28_0959,
  rs_R009_ueqv_R009NYNYN_partial_28_0960,
  rs_R009_ueqv_R009NYNYN_partial_28_0961,
  rs_R009_ueqv_R009NYNYN_partial_28_0962,
  rs_R009_ueqv_R009NYNYN_partial_28_0963,
  rs_R009_ueqv_R009NYNYN_partial_28_0964,
  rs_R009_ueqv_R009NYNYN_partial_28_0965,
  rs_R009_ueqv_R009NYNYN_partial_28_0966,
  rs_R009_ueqv_R009NYNYN_partial_28_0967,
  rs_R009_ueqv_R009NYNYN_partial_28_0968,
  rs_R009_ueqv_R009NYNYN_partial_28_0969,
  rs_R009_ueqv_R009NYNYN_partial_28_0970,
  rs_R009_ueqv_R009NYNYN_partial_28_0971,
  rs_R009_ueqv_R009NYNYN_partial_28_0972,
  rs_R009_ueqv_R009NYNYN_partial_28_0973,
  rs_R009_ueqv_R009NYNYN_partial_28_0974,
  rs_R009_ueqv_R009NYNYN_partial_28_0975,
  rs_R009_ueqv_R009NYNYN_partial_28_0976,
  rs_R009_ueqv_R009NYNYN_partial_28_0977,
  rs_R009_ueqv_R009NYNYN_partial_28_0978,
  rs_R009_ueqv_R009NYNYN_partial_28_0979,
  rs_R009_ueqv_R009NYNYN_partial_28_0980,
  rs_R009_ueqv_R009NYNYN_partial_28_0981,
  rs_R009_ueqv_R009NYNYN_partial_28_0982,
  rs_R009_ueqv_R009NYNYN_partial_28_0983,
  rs_R009_ueqv_R009NYNYN_partial_28_0984,
  rs_R009_ueqv_R009NYNYN_partial_28_0985,
  rs_R009_ueqv_R009NYNYN_partial_28_0986,
  rs_R009_ueqv_R009NYNYN_partial_28_0987,
  rs_R009_ueqv_R009NYNYN_partial_28_0988,
  rs_R009_ueqv_R009NYNYN_partial_28_0989,
  rs_R009_ueqv_R009NYNYN_partial_28_0990,
  rs_R009_ueqv_R009NYNYN_partial_28_0991,
  rs_R009_ueqv_R009NYNYN_partial_28_0992,
  rs_R009_ueqv_R009NYNYN_partial_28_0993,
  rs_R009_ueqv_R009NYNYN_partial_28_0994,
  rs_R009_ueqv_R009NYNYN_partial_28_0995,
  rs_R009_ueqv_R009NYNYN_partial_28_0996,
  rs_R009_ueqv_R009NYNYN_partial_28_0997,
  rs_R009_ueqv_R009NYNYN_partial_28_0998,
  rs_R009_ueqv_R009NYNYN_partial_28_0999
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_0900_0999 : Poly :=
[
  term ((-32247946279050244112 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((16123973139525122056 : Rat) / 10683035854916732895) [(2, 1), (8, 1), (12, 1), (16, 1)],
  term ((58728094883745278791127283647103500140611394343399114982026608400251231363160881 : Rat) / 58022443002364564574726651019696151223441909283411979871851469414062927824000) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((19746981836561655815233366 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-58476728218128333355505465432437508354625961442790144204606946550362564943960881 : Rat) / 116044886004729129149453302039392302446883818566823959743702938828125855648000) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-9873490918280827907616683 : Rat) / 1262724155015302911456105) [(2, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((117694492488224116897884962246862960285697056578356864043326998525081997271864857 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(2, 1), (8, 1), (13, 2)],
  term ((-117694492488224116897884962246862960285697056578356864043326998525081997271864857 : Rat) / 123297691380024699721294133416854321349814057227250457227684372504883721626000) [(2, 1), (8, 1), (13, 2), (14, 1)],
  term ((-2973220758982643706007168 : Rat) / 180389165002186130208015) [(2, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((1486610379491321853003584 : Rat) / 180389165002186130208015) [(2, 1), (8, 1), (13, 2), (16, 1)],
  term ((-37463188373817467937596472322427429801292995167084459523207354429 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((101392781115582 : Rat) / 1048898954827367) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39757722457930941557 : Rat) / 32049107564750198685) [(2, 1), (8, 1), (14, 1), (16, 1)],
  term ((37463188373817467937596472322427429801292995167084459523207354429 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(2, 1), (8, 1), (15, 2)],
  term ((-50696390557791 : Rat) / 1048898954827367) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((39757722457930941557 : Rat) / 64098215129500397370) [(2, 1), (8, 1), (16, 1)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (8, 2)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (13, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (13, 1), (14, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(2, 1), (8, 2), (11, 1), (15, 1)],
  term ((130735363238761993255125419850793485259753861097379430400 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (13, 1), (15, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (8, 2), (14, 1)],
  term ((-65367681619380996627562709925396742629876930548689715200 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (14, 1), (15, 2)],
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (8, 2), (14, 1), (16, 1)],
  term ((32683840809690498313781354962698371314938465274344857600 : Rat) / 15088685572720440010502159442477865803367778106607715319) [(2, 1), (8, 2), (15, 2)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (8, 2), (16, 1)],
  term ((-6111060914006031110211828123493703995770509217573018391210148396 : Rat) / 44099236764506244590843317735401662344587639376156513556281125) [(2, 1), (9, 1), (10, 1), (11, 1)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((45671190677972704413695000643485550596477344010237007922471871272 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((96972650465577611646389343889783243589906465048581509457560045362 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-3535647927630709861808 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-22835595338986352206847500321742775298238672005118503961235935636 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-267163899212491449376 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((1834614938618477793248 : Rat) / 619894037808199760165) [(2, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((30274802631232102999051156877244780970342403 : Rat) / 118701524926943844504638604529097397856500) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-15449042441347460687645231310249552901264798 : Rat) / 29675381231735961126159651132274349464125) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((7642182191027699660992 : Rat) / 2603554958794438992693) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-18575255211295021037356 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((40285971787283377499755323594754815978122553885498352139470511764444174732 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-64670568117913052472 : Rat) / 88556291115457108595) [(2, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20142985893641688749877661797377407989061276942749176069735255882222087366 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((32335284058956526236 : Rat) / 88556291115457108595) [(2, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((2793547474910435620337797452357109501601422 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-9505418205450486962784 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2687662458865701734643217153428246278386 : Rat) / 16569168750271335078816108951576967875) [(2, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((27435390910004426976 : Rat) / 21805317912851247845) [(2, 1), (9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1343831229432850867321608576714123139193 : Rat) / 16569168750271335078816108951576967875) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-13717695455002213488 : Rat) / 21805317912851247845) [(2, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-321619962511436566027733994963335426415349427886628815976318596314142529605475279 : Rat) / 328793843680065865923451022444944856932837485939334552607158326679689924336000) [(2, 1), (9, 1), (10, 1), (13, 1)],
  term ((3743804379602921828240463019528890756256048235511677721697408866396221588935351 : Rat) / 1964903448287246210697914476762618666929307684896421629126444183344760504000) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((23921891793542952139132808 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((3028364163880402321555341094481496888332048 : Rat) / 29675381231735961126159651132274349464125) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-446593454662068664144 : Rat) / 1859682113424599280495) [(2, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-792342443856172660921864 : Rat) / 84181610334353527430407) [(2, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((9868139077015647742487435997171916876831772985090797493636039812049121667 : Rat) / 201763527049623138146447608275002980444794726275978493254269959916353660) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1435754558946310959690 : Rat) / 867851652931479664231) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((269096805534175883143620889641396362815886978666900437238858376725 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-177753628858299967133381696651137480092796227905625126063493354850482955713 : Rat) / 5649378757389447868100533031700083452454252335727397811119558877657902480) [(2, 1), (9, 1), (10, 1), (15, 1)],
  term ((98160245361336473397 : Rat) / 123978807561639952033) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((11015337245871530644372254780497110746203588287975421096385367432341194114228491 : Rat) / 8288920428909223510675235859956593031920272754773139981693067059151846832000) [(2, 1), (9, 1), (11, 1)],
  term ((-21679068271904185357649957015363092919879434786883684667519384027067 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((21679068271904185357649957015363092919879434786883684667519384027067 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((69472699568499428129914 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-34736349784249714064957 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1934306101779058091312 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((967153050889529045656 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32590552347829988184475426330580087895472149220723475158254412063 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((-65181104695659976368950852661160175790944298441446950316508824126 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((3868612203558116182624 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1934306101779058091312 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-13860949444255379878341875125725334404746432741206854443291416281046715701722251 : Rat) / 5802244300236456457472665101969615122344190928341197987185146941406292782400) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-95591457153524198848467589 : Rat) / 2525448310030605822912210) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-23910886654490830192590522720544787278064728300318419236833932953953 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-29591778433159047972079 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((52101332338786740904171289 : Rat) / 2525448310030605822912210) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((2567807059625671714701481072778145275504236355848370844959993441558156720909411063 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-2714275413815122700232122361118473291185719222115503557572374133083940960299298327 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((16904828415827377695335746 : Rat) / 757634493009181746873663) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3916901534370551318915037653328019644436906 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-13327780353887302086432 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-39353282977332540557975581 : Rat) / 3788172465045908734368315) [(2, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((15900581221257629808687812529758486728767381251029689785642838271604890335387308201 : Rat) / 1880470053328096005106053216088631988773772288003913406139186219255770444448000) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3154339764185012642355488 : Rat) / 22153055351145665113265) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15900581221257629808687812529758486728767381251029689785642838271604890335387308201 : Rat) / 3760940106656192010212106432177263977547544576007826812278372438511540888896000) [(2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1577169882092506321177744 : Rat) / 22153055351145665113265) [(2, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(2, 1), (9, 1), (12, 2), (13, 1)],
  term ((6948407091279567622585337464070887843396586 : Rat) / 3297264581303995680684405681363816607125) [(2, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-70928648098004089678176 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((35464324049002044839088 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-150942233381998976345189935257203699047703 : Rat) / 104124144672757758337402284674646840225) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((513601098977782599216 : Rat) / 45676402785867350749) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((150942233381998976345189935257203699047703 : Rat) / 208248289345515516674804569349293680450) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-256800549488891299608 : Rat) / 45676402785867350749) [(2, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1277210864634329405353285148466071998669403018872525096021161165508941726858084678599 : Rat) / 428747172158805889164180133268208093440420081664892256599734457990315661334144000) [(2, 1), (9, 1), (13, 1)],
  term ((241776098356885656729532176037495024225811915403944073467553013311231869332551329761 : Rat) / 37830632837541696102721776464841890597684124852784610876447158057969028941248000) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 30264529057443470721967141241250447066719208941396773988140493987453049000) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-245665066961804878338 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((117239699953499584193115364 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85448183485910413601899247619386323874415185659347840762244702381630858306478089 : Rat) / 98638153104019759777035306733483457079851245781800365782147498003906977300800) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-13637368238532899807075984 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((587369320395290404648088987214622368472089302600377789926032141060168125307 : Rat) / 60529058114886941443934282482500894133438417882793547976280987974906098000) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((122832533480902439169 : Rat) / 4339258264657398321155) [(2, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18403502639038855714929562 : Rat) / 420908051671767637152035) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((2529376847556513213740882649187082465391301512801738440342144411213860651771 : Rat) / 45396793586165206082950711861875670600078813412095160982210740981179573500) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((683832808582351929916 : Rat) / 1859682113424599280495) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2529376847556513213740882649187082465391301512801738440342144411213860651771 : Rat) / 90793587172330412165901423723751341200157626824190321964421481962359147000) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-341916404291175964958 : Rat) / 1859682113424599280495) [(2, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((40124413927308229725632498429178187339943 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (9, 1), (13, 3)],
  term ((-40124413927308229725632498429178187339943 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (9, 1), (13, 3), (14, 1)],
  term ((-6625678516611268478768 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((3312839258305634239384 : Rat) / 13017774793972194963465) [(2, 1), (9, 1), (13, 3), (16, 1)],
  term ((-2063620546084086534727136154990829650599783460021253805826712587022810069695595046653 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-53416254753344026316965186 : Rat) / 1262724155015302911456105) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-58834409228655518647176519551789760035884507463017311548294997174337577293830941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-2339414104108352752102 : Rat) / 32049107564750198685) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((386618528666768036845853702925720199949437155226027783093442886237586985518832603977 : Rat) / 226983797025250176616330658789051343586104749116707665258682948347814173647488000) [(2, 1), (9, 1), (15, 1)],
  term ((298506968105783672423747707 : Rat) / 7576344930091817468736630) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-454172649941397322703169226714036371505101493248800838810809385905477135927110133 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032000) [(2, 1), (9, 2)],
  term ((1426693417885731035264472391514652665982413 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1), (12, 1)],
  term ((207760750487606125413101914418108277395731 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-706933688365637486832 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((-5499012921055318015644787651640502386533921 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (10, 1), (14, 1)],
  term ((4677781387399057148628 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-207760750487606125413101914418108277395731 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (10, 1), (14, 2)],
  term ((353466844182818743416 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((-2427257404745233260168 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (10, 1), (16, 1)],
  term ((403980388158713776443796461366553101555982708187704707196331482977048258866852701 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(2, 1), (9, 2), (12, 1)],
  term ((-403980388158713776443796461366553101555982708187704707196331482977048258866852701 : Rat) / 493190765520098798885176533667417285399256228909001828910737490019534886504000) [(2, 1), (9, 2), (12, 1), (14, 1)],
  term ((-5069238820767568571050532 : Rat) / 252544831003060582291221) [(2, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((2534619410383784285525266 : Rat) / 252544831003060582291221) [(2, 1), (9, 2), (12, 1), (16, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((247164151855212058728 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(2, 1), (9, 2), (13, 1), (15, 1)],
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(2, 1), (9, 2), (13, 2)],
  term ((145278151340587786739123651173532601518873 : Rat) / 9891793743911987042053217044091449821375) [(2, 1), (9, 2), (13, 2), (14, 1)],
  term ((-494328303710424117456 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 2), (14, 1), (16, 1)],
  term ((247164151855212058728 : Rat) / 4339258264657398321155) [(2, 1), (9, 2), (13, 2), (16, 1)],
  term ((3057354427582775493015884606384241407455205464305066909891421090551935078161961 : Rat) / 246595382760049399442588266833708642699628114454500914455368745009767443252000) [(2, 1), (9, 2), (14, 1)],
  term ((10793702435032827382439392 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (14, 1), (16, 1)],
  term ((85942762904147023751808429972592488049091969906872060706335603436212331060362889 : Rat) / 197276306208039519554070613466966914159702491563600731564294996007813954601600) [(2, 1), (9, 2), (14, 2)],
  term ((12417570580632656760945248 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (14, 2), (16, 1)],
  term ((-8501243862674577881456008 : Rat) / 1262724155015302911456105) [(2, 1), (9, 2), (16, 1)],
  term ((58106342507755653130308725346454962332901298972836283345886076781998565465166711 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (10, 1)],
  term ((-77088506021271746827134918446084686731647214027595131538653768022 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((42797746816920211462348648359471235775247117199843110076774800136 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12014363546699378935872 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((26229005886983755015809029752558717091768 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((534327798424982898752 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((5873599823743443743248 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((28594342536203419611176982038002347328554313880788483865593321948 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1465295516282719580768 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14297171268101709805588491019001173664277156940394241932796660974 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-732647758141359790384 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-34450362560783419843173414231676854389584 : Rat) / 157012599109714080032590746731610314625) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((7184562380340495453824 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3001274868864015031407440878906763298992 : Rat) / 52337533036571360010863582243870104875) [(2, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-20736728585905681536 : Rat) / 3115045416121606835) [(2, 1), (10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1500637434432007515703720439453381649496 : Rat) / 52337533036571360010863582243870104875) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((10368364292952840768 : Rat) / 3115045416121606835) [(2, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-58106342507755653130308725346454962332901298972836283345886076781998565465166711 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 900 through 999. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_0900_0999_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_0900_0999
      rs_R009_ueqv_R009NYNYN_block_28_0900_0999 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
