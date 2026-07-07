/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YYYY, term block 16:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YYYYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R013:u=v:R013YYYY`. -/
def rs_R013_ueqv_R013YYYY_generator_16_0000_0099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0000 : Poly :=
[
  term ((-11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0000 : Poly :=
[
  term ((-23910325903902240888779230684550316687763595788650589575663089408 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0000_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0000
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0001 : Poly :=
[
  term ((-27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 1 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0001 : Poly :=
[
  term ((-55570906409074052876964518549320322265620536555822592632964445056 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0001_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0001
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0002 : Poly :=
[
  term ((-212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0002 : Poly :=
[
  term ((-424862258351786081694760517630887438697930495154349146969122368 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0002_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0002
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0003 : Poly :=
[
  term ((5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0003 : Poly :=
[
  term ((11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0003_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0003
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0004 : Poly :=
[
  term ((13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0004 : Poly :=
[
  term ((27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0004_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0004
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0005 : Poly :=
[
  term ((106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0005 : Poly :=
[
  term ((212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0005_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0005
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0006 : Poly :=
[
  term ((-5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 6 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0006 : Poly :=
[
  term ((-11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0006_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0006
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0007 : Poly :=
[
  term ((-1494395368993890055548701917784394792985224736790661848478943088 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

/-- Partial product 7 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0007 : Poly :=
[
  term ((-2988790737987780111097403835568789585970449473581323696957886176 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((1494395368993890055548701917784394792985224736790661848478943088 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0007_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0007
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0008 : Poly :=
[
  term ((-13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 8 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0008 : Poly :=
[
  term ((-27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0008_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0008
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0009 : Poly :=
[
  term ((-3473181650567128304810282409332520141601283534738912039560277816 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

/-- Partial product 9 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0009 : Poly :=
[
  term ((-6946363301134256609620564818665040283202567069477824079120555632 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((3473181650567128304810282409332520141601283534738912039560277816 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0009_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0009
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0010 : Poly :=
[
  term ((-26553891146986630105922532351930464918620655947146821685570148 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 10 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0010 : Poly :=
[
  term ((-53107782293973260211845064703860929837241311894293643371140296 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((26553891146986630105922532351930464918620655947146821685570148 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0010_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0010
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0011 : Poly :=
[
  term ((-106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (15, 3), (16, 1)]
]

/-- Partial product 11 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0011 : Poly :=
[
  term ((-212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (15, 3), (16, 1)],
  term ((106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0011_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0011
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0012 : Poly :=
[
  term ((-1161660701952499553228841696845904414551449398975506114278046608 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 12 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0012 : Poly :=
[
  term ((-2323321403904999106457683393691808829102898797951012228556093216 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((1161660701952499553228841696845904414551449398975506114278046608 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0012_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0012
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0013 : Poly :=
[
  term ((-3675026414845455009604858959623287119217356957951021233253191192 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 13 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0013 : Poly :=
[
  term ((-7350052829690910019209717919246574238434713915902042466506382384 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((3675026414845455009604858959623287119217356957951021233253191192 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0013_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0013
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0014 : Poly :=
[
  term ((133189141651626150639965228643320716239396164804284938765417084 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0014 : Poly :=
[
  term ((266378283303252301279930457286641432478792329608569877530834168 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-133189141651626150639965228643320716239396164804284938765417084 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0014_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0014
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0015 : Poly :=
[
  term ((132292581646265786505535734237946972489002245305725018725952544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 15 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0015 : Poly :=
[
  term ((264585163292531573011071468475893944978004490611450037451905088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-132292581646265786505535734237946972489002245305725018725952544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0015_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0015
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0016 : Poly :=
[
  term ((16645276380062201438057888376633190036240887178888114476785480600 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0016 : Poly :=
[
  term ((33290552760124402876115776753266380072481774357776228953570961200 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-16645276380062201438057888376633190036240887178888114476785480600 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0016_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0016
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0017 : Poly :=
[
  term ((1185607549577004834414767602794816169474365848676873167338985924 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0017 : Poly :=
[
  term ((2371215099154009668829535205589632338948731697353746334677971848 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1185607549577004834414767602794816169474365848676873167338985924 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0017_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0017
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0018 : Poly :=
[
  term ((-3076125840876334274952283191062831920505648992484044447498562656 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0018 : Poly :=
[
  term ((-6152251681752668549904566382125663841011297984968088894997125312 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((3076125840876334274952283191062831920505648992484044447498562656 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0018_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0018
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0019 : Poly :=
[
  term ((-237312331108758253590248205818005360739530112886186814888792964000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0019 : Poly :=
[
  term ((-474624662217516507180496411636010721479060225772373629777585928000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((237312331108758253590248205818005360739530112886186814888792964000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0019_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0019
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0020 : Poly :=
[
  term ((1622331456578932620107940568053243766528959336015203444656057024 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0020 : Poly :=
[
  term ((3244662913157865240215881136106487533057918672030406889312114048 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1622331456578932620107940568053243766528959336015203444656057024 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0020_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0020
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0021 : Poly :=
[
  term ((77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 21 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0021 : Poly :=
[
  term ((154156744286316099423480499712872761105677369573482840960 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0021_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0021
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0022 : Poly :=
[
  term ((2342227094519600420468610358774204732062374548426972387690080032 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0022 : Poly :=
[
  term ((4684454189039200840937220717548409464124749096853944775380160064 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2342227094519600420468610358774204732062374548426972387690080032 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0022_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0022
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0023 : Poly :=
[
  term ((199069427601370440760329230618669123868458065620807646748394892912 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0023 : Poly :=
[
  term ((398138855202740881520658461237338247736916131241615293496789785824 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-199069427601370440760329230618669123868458065620807646748394892912 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0023_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0023
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0024 : Poly :=
[
  term ((-2080717782836137287971542696777056212643206032976511132509335376 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (15, 2), (16, 1)]
]

/-- Partial product 24 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0024 : Poly :=
[
  term ((-4161435565672274575943085393554112425286412065953022265018670752 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((2080717782836137287971542696777056212643206032976511132509335376 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0024_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0024
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0025 : Poly :=
[
  term ((-132292581646265786505535734237946972489002245305725018725952544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 25 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0025 : Poly :=
[
  term ((-264585163292531573011071468475893944978004490611450037451905088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((132292581646265786505535734237946972489002245305725018725952544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0025_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0025
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0026 : Poly :=
[
  term ((-16645276380062201438057888376633190036240887178888114476785480600 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0026 : Poly :=
[
  term ((-33290552760124402876115776753266380072481774357776228953570961200 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((16645276380062201438057888376633190036240887178888114476785480600 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0026_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0026
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0027 : Poly :=
[
  term ((-1185607549577004834414767602794816169474365848676873167338985924 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0027 : Poly :=
[
  term ((-2371215099154009668829535205589632338948731697353746334677971848 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1185607549577004834414767602794816169474365848676873167338985924 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0027_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0027
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0028 : Poly :=
[
  term ((3076125840876334274952283191062831920505648992484044447498562656 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0028 : Poly :=
[
  term ((6152251681752668549904566382125663841011297984968088894997125312 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3076125840876334274952283191062831920505648992484044447498562656 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0028_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0028
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0029 : Poly :=
[
  term ((237312331108758253590248205818005360739530112886186814888792964000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0029 : Poly :=
[
  term ((474624662217516507180496411636010721479060225772373629777585928000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-237312331108758253590248205818005360739530112886186814888792964000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0029_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0029
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0030 : Poly :=
[
  term ((-1622331456578932620107940568053243766528959336015203444656057024 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0030 : Poly :=
[
  term ((-3244662913157865240215881136106487533057918672030406889312114048 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((1622331456578932620107940568053243766528959336015203444656057024 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0030_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0030
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0031 : Poly :=
[
  term ((-75280443697133516849459979737102309140275019453303221894246944 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 31 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0031 : Poly :=
[
  term ((-150560887394267033698919959474204618280550038906606443788493888 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((75280443697133516849459979737102309140275019453303221894246944 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0031_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0031
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0032 : Poly :=
[
  term ((-19430452353551841535792910999173928150896418578415834146560319816 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 32 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0032 : Poly :=
[
  term ((-38860904707103683071585821998347856301792837156831668293120639632 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((19430452353551841535792910999173928150896418578415834146560319816 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0032_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0032
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0033 : Poly :=
[
  term ((-387536546575169045705716773763264562890085815230962726560725244 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0033 : Poly :=
[
  term ((-775073093150338091411433547526529125780171630461925453121450488 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((387536546575169045705716773763264562890085815230962726560725244 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0033_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0033
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0034 : Poly :=
[
  term ((-9452845307300657005463482541197951479737875237980079566993408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0034 : Poly :=
[
  term ((-18905690614601314010926965082395902959475750475960159133986816 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((9452845307300657005463482541197951479737875237980079566993408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0034_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0034
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0035 : Poly :=
[
  term ((-592049963068764780765657832565401891655779068239633285820440168 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0035 : Poly :=
[
  term ((-1184099926137529561531315665130803783311558136479266571640880336 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((592049963068764780765657832565401891655779068239633285820440168 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0035_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0035
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0036 : Poly :=
[
  term ((-158343383446566711773915709401358339832962466750308882634086068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0036 : Poly :=
[
  term ((-316686766893133423547831418802716679665924933500617765268172136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((158343383446566711773915709401358339832962466750308882634086068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0036_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0036
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0037 : Poly :=
[
  term ((-132292581646265786505535734237946972489002245305725018725952544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 37 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0037 : Poly :=
[
  term ((-264585163292531573011071468475893944978004490611450037451905088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((132292581646265786505535734237946972489002245305725018725952544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0037_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0037
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0038 : Poly :=
[
  term ((-18871545610026248506519215880152095826287075554984001130339563672 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0038 : Poly :=
[
  term ((-37743091220052497013038431760304191652574151109968002260679127344 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((18871545610026248506519215880152095826287075554984001130339563672 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0038_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0038
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0039 : Poly :=
[
  term ((9406584713491790971672092495440938762670693109793832148149806876 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0039 : Poly :=
[
  term ((18813169426983581943344184990881877525341386219587664296299613752 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-9406584713491790971672092495440938762670693109793832148149806876 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0039_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0039
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0040 : Poly :=
[
  term ((-18905690614601314010926965082395902959475750475960159133986816 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0040 : Poly :=
[
  term ((-37811381229202628021853930164791805918951500951920318267973632 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((18905690614601314010926965082395902959475750475960159133986816 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0040_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0040
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0041 : Poly :=
[
  term ((-1184099926137529561531315665130803783311558136479266571640880336 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 41 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0041 : Poly :=
[
  term ((-2368199852275059123062631330261607566623116272958533143281760672 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((1184099926137529561531315665130803783311558136479266571640880336 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0041_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0041
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0042 : Poly :=
[
  term ((-316686766893133423547831418802716679665924933500617765268172136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0042 : Poly :=
[
  term ((-633373533786266847095662837605433359331849867001235530536344272 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((316686766893133423547831418802716679665924933500617765268172136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0042_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0042
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0043 : Poly :=
[
  term ((5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 43 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0043 : Poly :=
[
  term ((11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0043_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0043
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0044 : Poly :=
[
  term ((13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 44 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0044 : Poly :=
[
  term ((27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0044_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0044
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0045 : Poly :=
[
  term ((106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0045 : Poly :=
[
  term ((212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0045_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0045
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0046 : Poly :=
[
  term ((3250796046653442602662041902050916589576048030289485948579915616 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 46 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0046 : Poly :=
[
  term ((6501592093306885205324083804101833179152096060578971897159831232 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3250796046653442602662041902050916589576048030289485948579915616 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0046_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0046
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0047 : Poly :=
[
  term ((112277791688341634617078039082034635641883905635585981464622962624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 47 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0047 : Poly :=
[
  term ((224555583376683269234156078164069271283767811271171962929245925248 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-112277791688341634617078039082034635641883905635585981464622962624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0047_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0047
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0048 : Poly :=
[
  term ((-1940978150342772181379010956276409345552407207380965304882898800 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0048 : Poly :=
[
  term ((-3881956300685544362758021912552818691104814414761930609765797600 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1940978150342772181379010956276409345552407207380965304882898800 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0048_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0048
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0049 : Poly :=
[
  term ((-27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 49 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0049 : Poly :=
[
  term ((-55570906409074052876964518549320322265620536555822592632964445056 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0049_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0049
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0050 : Poly :=
[
  term ((-212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0050 : Poly :=
[
  term ((-424862258351786081694760517630887438697930495154349146969122368 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0050_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0050
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0051 : Poly :=
[
  term ((-11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 51 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0051 : Poly :=
[
  term ((-23910325903902240888779230684550316687763595788650589575663089408 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (10, 1), (11, 2), (16, 1)],
  term ((11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0051_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0051
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0052 : Poly :=
[
  term ((3348194542213321610057117030875789810089565947334345506614 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 52 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0052 : Poly :=
[
  term ((6696389084426643220114234061751579620179131894668691013228 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((-3348194542213321610057117030875789810089565947334345506614 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0052_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0052
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0053 : Poly :=
[
  term ((6946363301134256609620564818665040283202567069477824079120555632 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 53 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0053 : Poly :=
[
  term ((13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6946363301134256609620564818665040283202567069477824079120555632 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0053_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0053
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0054 : Poly :=
[
  term ((22575680728686333981266835660661380920408342975802928257141805804 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 54 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0054 : Poly :=
[
  term ((45151361457372667962533671321322761840816685951605856514283611608 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-22575680728686333981266835660661380920408342975802928257141805804 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0054_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0054
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0055 : Poly :=
[
  term ((-1343234231376465096207599030239770136907127348673774634228176570676846 : Rat) / 3902931257128946422661616898168969559460966818693452894212095390434785) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0055 : Poly :=
[
  term ((-2686468462752930192415198060479540273814254697347549268456353141353692 : Rat) / 3902931257128946422661616898168969559460966818693452894212095390434785) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1343234231376465096207599030239770136907127348673774634228176570676846 : Rat) / 3902931257128946422661616898168969559460966818693452894212095390434785) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0055_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0055
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0056 : Poly :=
[
  term ((53107782293973260211845064703860929837241311894293643371140296 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 56 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0056 : Poly :=
[
  term ((106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-53107782293973260211845064703860929837241311894293643371140296 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0056_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0056
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0057 : Poly :=
[
  term ((2988790737987780111097403835568789585970449473581323696957886176 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 57 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0057 : Poly :=
[
  term ((5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2988790737987780111097403835568789585970449473581323696957886176 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0057_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0057
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0058 : Poly :=
[
  term ((9713569898460285361066562465598566154403960789139302015113130072 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 58 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0058 : Poly :=
[
  term ((19427139796920570722133124931197132308807921578278604030226260144 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-9713569898460285361066562465598566154403960789139302015113130072 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0058_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0058
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0059 : Poly :=
[
  term ((3350353919379642076782607405417887734671689619859029408376 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 59 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0059 : Poly :=
[
  term ((6700707838759284153565214810835775469343379239718058816752 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-3350353919379642076782607405417887734671689619859029408376 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0059_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0059
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0060 : Poly :=
[
  term ((-196073372472248422166783891744673146901570029998666925297794894028 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0060 : Poly :=
[
  term ((-392146744944496844333567783489346293803140059997333850595589788056 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((196073372472248422166783891744673146901570029998666925297794894028 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0060_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0060
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0061 : Poly :=
[
  term ((2240007916081715723873133474675489258663077993985095806808041258 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0061 : Poly :=
[
  term ((4480015832163431447746266949350978517326155987970191613616082516 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2240007916081715723873133474675489258663077993985095806808041258 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0061_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0061
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0062 : Poly :=
[
  term ((16348065639043375266180325940533091164330206336644218588209 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (16, 1)]
]

/-- Partial product 62 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0062 : Poly :=
[
  term ((32696131278086750532360651881066182328660412673288437176418 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (6, 1), (16, 1)],
  term ((-16348065639043375266180325940533091164330206336644218588209 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0062_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0062
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0063 : Poly :=
[
  term ((-3870837169650466900939288471764422740835461169431014531872367952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 63 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0063 : Poly :=
[
  term ((-7741674339300933801878576943528845481670922338862029063744735904 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((3870837169650466900939288471764422740835461169431014531872367952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0063_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0063
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0064 : Poly :=
[
  term ((-315730329698720330332589106649590924694969198270032895228408337536 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 64 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0064 : Poly :=
[
  term ((-631460659397440660665178213299181849389938396540065790456816675072 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((315730329698720330332589106649590924694969198270032895228408337536 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0064_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0064
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0065 : Poly :=
[
  term ((3190696622771367118178488860477216031902582229273433495507999096 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0065 : Poly :=
[
  term ((6381393245542734236356977720954432063805164458546866991015998192 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3190696622771367118178488860477216031902582229273433495507999096 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0065_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0065
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0066 : Poly :=
[
  term ((1161660701952499553228841696845904414551449398975506114278046608 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 2), (11, 1), (16, 1)]
]

/-- Partial product 66 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0066 : Poly :=
[
  term ((2323321403904999106457683393691808829102898797951012228556093216 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((-1161660701952499553228841696845904414551449398975506114278046608 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0066_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0066
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0067 : Poly :=
[
  term ((3675026414845455009604858959623287119217356957951021233253191192 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0067 : Poly :=
[
  term ((7350052829690910019209717919246574238434713915902042466506382384 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((-3675026414845455009604858959623287119217356957951021233253191192 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0067_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0067
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0068 : Poly :=
[
  term ((-133189141651626150639965228643320716239396164804284938765417084 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0068 : Poly :=
[
  term ((-266378283303252301279930457286641432478792329608569877530834168 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((133189141651626150639965228643320716239396164804284938765417084 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0068_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0068
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0069 : Poly :=
[
  term ((-1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (8, 1), (16, 1)]
]

/-- Partial product 69 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0069 : Poly :=
[
  term ((-2708700177367680830149988522846898446576879109056125193472 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term ((1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0069_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0069
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0070 : Poly :=
[
  term ((677175044341920207537497130711724611644219777264031298368 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

/-- Partial product 70 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0070 : Poly :=
[
  term ((1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (10, 1), (16, 1)],
  term ((-677175044341920207537497130711724611644219777264031298368 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0070_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0070
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0071 : Poly :=
[
  term ((77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 71 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0071 : Poly :=
[
  term ((154156744286316099423480499712872761105677369573482840960 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0071_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0071
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0072 : Poly :=
[
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 72 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0072 : Poly :=
[
  term ((-81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0072_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0072
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0073 : Poly :=
[
  term ((-677175044341920207537497130711724611644219777264031298368 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 73 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0073 : Poly :=
[
  term ((-1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((677175044341920207537497130711724611644219777264031298368 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0073_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0073
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0074 : Poly :=
[
  term ((1351293452599097948972515799204672272649748402645308598496 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 74 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0074 : Poly :=
[
  term ((2702586905198195897945031598409344545299496805290617196992 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term ((-1351293452599097948972515799204672272649748402645308598496 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0074_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0074
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0075 : Poly :=
[
  term ((-20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 75 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0075 : Poly :=
[
  term ((-41388005518033595497023200521512848168176293965310353277562880 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0075_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0075
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0076 : Poly :=
[
  term ((-37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 76 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0076 : Poly :=
[
  term ((-74182894091433433361099932874759298256423179648678083497904981248 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0076_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0076
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0077 : Poly :=
[
  term ((1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0077 : Poly :=
[
  term ((3945252282373702254197751574428171703099362369684997382784278912 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0077_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0077
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0078 : Poly :=
[
  term ((10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 78 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0078 : Poly :=
[
  term ((20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0078_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0078
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0079 : Poly :=
[
  term ((18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 79 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0079 : Poly :=
[
  term ((37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0079_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0079
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0080 : Poly :=
[
  term ((-986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0080 : Poly :=
[
  term ((-1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0080_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0080
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0081 : Poly :=
[
  term ((-10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 81 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0081 : Poly :=
[
  term ((-20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0081_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0081
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0082 : Poly :=
[
  term ((-147253333914502432182519146387997064246312894476996875196629248 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 82 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0082 : Poly :=
[
  term ((-294506667829004864365038292775994128492625788953993750393258496 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((147253333914502432182519146387997064246312894476996875196629248 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0082_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0082
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0083 : Poly :=
[
  term ((-18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 83 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0083 : Poly :=
[
  term ((-37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0083_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0083
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0084 : Poly :=
[
  term ((-3594261576888072078138733966284354134291818488425760136705858592 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 84 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0084 : Poly :=
[
  term ((-7188523153776144156277467932568708268583636976851520273411717184 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((3594261576888072078138733966284354134291818488425760136705858592 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0084_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0084
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0085 : Poly :=
[
  term ((-10662300762313572838747332043636710880367273743866010744332947504 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0085 : Poly :=
[
  term ((-21324601524627145677494664087273421760734547487732021488665895008 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((10662300762313572838747332043636710880367273743866010744332947504 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0085_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0085
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0086 : Poly :=
[
  term ((986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

/-- Partial product 86 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0086 : Poly :=
[
  term ((1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((-986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0086_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0086
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0087 : Poly :=
[
  term ((9452845307300657005463482541197951479737875237980079566993408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (4, 2), (11, 1), (16, 1)]
]

/-- Partial product 87 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0087 : Poly :=
[
  term ((18905690614601314010926965082395902959475750475960159133986816 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((-9452845307300657005463482541197951479737875237980079566993408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (4, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0087_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0087
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0088 : Poly :=
[
  term ((592049963068764780765657832565401891655779068239633285820440168 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 2), (13, 1), (16, 1)]
]

/-- Partial product 88 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0088 : Poly :=
[
  term ((1184099926137529561531315665130803783311558136479266571640880336 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((-592049963068764780765657832565401891655779068239633285820440168 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0088_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0088
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0089 : Poly :=
[
  term ((158343383446566711773915709401358339832962466750308882634086068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0089 : Poly :=
[
  term ((316686766893133423547831418802716679665924933500617765268172136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-158343383446566711773915709401358339832962466750308882634086068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0089_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0089
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0090 : Poly :=
[
  term ((11516678220375822535948664224522264437992920131647476064 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 90 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0090 : Poly :=
[
  term ((23033356440751645071897328449044528875985840263294952128 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-11516678220375822535948664224522264437992920131647476064 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0090_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0090
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0091 : Poly :=
[
  term ((3581374704585082301374932405024426698746282608223625757695142784 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 91 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0091 : Poly :=
[
  term ((7162749409170164602749864810048853397492565216447251515390285568 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3581374704585082301374932405024426698746282608223625757695142784 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0091_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0091
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0092 : Poly :=
[
  term ((187515804910097691341307663375169563349454001990973278925442281760 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 92 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0092 : Poly :=
[
  term ((375031609820195382682615326750339126698908003981946557850884563520 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-187515804910097691341307663375169563349454001990973278925442281760 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0092_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0092
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0093 : Poly :=
[
  term ((63252131595260311658741607026656495006531621505206097734249560704 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0093 : Poly :=
[
  term ((126504263190520623317483214053312990013063243010412195468499121408 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-63252131595260311658741607026656495006531621505206097734249560704 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0093_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0093
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0094 : Poly :=
[
  term ((-5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 94 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0094 : Poly :=
[
  term ((-11516678220375822535948664224522264437992920131647476064 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0094_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0094
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0095 : Poly :=
[
  term ((5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 95 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0095 : Poly :=
[
  term ((11516678220375822535948664224522264437992920131647476064 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0095_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0095
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0096 : Poly :=
[
  term ((1439584777546977816993583028065283054749115016455934508 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 96 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0096 : Poly :=
[
  term ((2879169555093955633987166056130566109498230032911869016 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1439584777546977816993583028065283054749115016455934508 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0096_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0096
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0097 : Poly :=
[
  term ((2720857290611030986975029998464564884021746531974112905290238096 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 97 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0097 : Poly :=
[
  term ((5441714581222061973950059996929129768043493063948225810580476192 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2720857290611030986975029998464564884021746531974112905290238096 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0097_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0097
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0098 : Poly :=
[
  term ((610052073332383339989451196958664040163433510703618891226800320 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 98 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0098 : Poly :=
[
  term ((1220104146664766679978902393917328080326867021407237782453600640 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-610052073332383339989451196958664040163433510703618891226800320 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0098_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0098
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0099 : Poly :=
[
  term ((-31228737393860709446643585012759514979165262382328418589320562952 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0099 : Poly :=
[
  term ((-62457474787721418893287170025519029958330524764656837178641125904 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((31228737393860709446643585012759514979165262382328418589320562952 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0099_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0099
        rs_R013_ueqv_R013YYYY_generator_16_0000_0099 =
      rs_R013_ueqv_R013YYYY_partial_16_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YYYY_partials_16_0000_0099 : List Poly :=
[
  rs_R013_ueqv_R013YYYY_partial_16_0000,
  rs_R013_ueqv_R013YYYY_partial_16_0001,
  rs_R013_ueqv_R013YYYY_partial_16_0002,
  rs_R013_ueqv_R013YYYY_partial_16_0003,
  rs_R013_ueqv_R013YYYY_partial_16_0004,
  rs_R013_ueqv_R013YYYY_partial_16_0005,
  rs_R013_ueqv_R013YYYY_partial_16_0006,
  rs_R013_ueqv_R013YYYY_partial_16_0007,
  rs_R013_ueqv_R013YYYY_partial_16_0008,
  rs_R013_ueqv_R013YYYY_partial_16_0009,
  rs_R013_ueqv_R013YYYY_partial_16_0010,
  rs_R013_ueqv_R013YYYY_partial_16_0011,
  rs_R013_ueqv_R013YYYY_partial_16_0012,
  rs_R013_ueqv_R013YYYY_partial_16_0013,
  rs_R013_ueqv_R013YYYY_partial_16_0014,
  rs_R013_ueqv_R013YYYY_partial_16_0015,
  rs_R013_ueqv_R013YYYY_partial_16_0016,
  rs_R013_ueqv_R013YYYY_partial_16_0017,
  rs_R013_ueqv_R013YYYY_partial_16_0018,
  rs_R013_ueqv_R013YYYY_partial_16_0019,
  rs_R013_ueqv_R013YYYY_partial_16_0020,
  rs_R013_ueqv_R013YYYY_partial_16_0021,
  rs_R013_ueqv_R013YYYY_partial_16_0022,
  rs_R013_ueqv_R013YYYY_partial_16_0023,
  rs_R013_ueqv_R013YYYY_partial_16_0024,
  rs_R013_ueqv_R013YYYY_partial_16_0025,
  rs_R013_ueqv_R013YYYY_partial_16_0026,
  rs_R013_ueqv_R013YYYY_partial_16_0027,
  rs_R013_ueqv_R013YYYY_partial_16_0028,
  rs_R013_ueqv_R013YYYY_partial_16_0029,
  rs_R013_ueqv_R013YYYY_partial_16_0030,
  rs_R013_ueqv_R013YYYY_partial_16_0031,
  rs_R013_ueqv_R013YYYY_partial_16_0032,
  rs_R013_ueqv_R013YYYY_partial_16_0033,
  rs_R013_ueqv_R013YYYY_partial_16_0034,
  rs_R013_ueqv_R013YYYY_partial_16_0035,
  rs_R013_ueqv_R013YYYY_partial_16_0036,
  rs_R013_ueqv_R013YYYY_partial_16_0037,
  rs_R013_ueqv_R013YYYY_partial_16_0038,
  rs_R013_ueqv_R013YYYY_partial_16_0039,
  rs_R013_ueqv_R013YYYY_partial_16_0040,
  rs_R013_ueqv_R013YYYY_partial_16_0041,
  rs_R013_ueqv_R013YYYY_partial_16_0042,
  rs_R013_ueqv_R013YYYY_partial_16_0043,
  rs_R013_ueqv_R013YYYY_partial_16_0044,
  rs_R013_ueqv_R013YYYY_partial_16_0045,
  rs_R013_ueqv_R013YYYY_partial_16_0046,
  rs_R013_ueqv_R013YYYY_partial_16_0047,
  rs_R013_ueqv_R013YYYY_partial_16_0048,
  rs_R013_ueqv_R013YYYY_partial_16_0049,
  rs_R013_ueqv_R013YYYY_partial_16_0050,
  rs_R013_ueqv_R013YYYY_partial_16_0051,
  rs_R013_ueqv_R013YYYY_partial_16_0052,
  rs_R013_ueqv_R013YYYY_partial_16_0053,
  rs_R013_ueqv_R013YYYY_partial_16_0054,
  rs_R013_ueqv_R013YYYY_partial_16_0055,
  rs_R013_ueqv_R013YYYY_partial_16_0056,
  rs_R013_ueqv_R013YYYY_partial_16_0057,
  rs_R013_ueqv_R013YYYY_partial_16_0058,
  rs_R013_ueqv_R013YYYY_partial_16_0059,
  rs_R013_ueqv_R013YYYY_partial_16_0060,
  rs_R013_ueqv_R013YYYY_partial_16_0061,
  rs_R013_ueqv_R013YYYY_partial_16_0062,
  rs_R013_ueqv_R013YYYY_partial_16_0063,
  rs_R013_ueqv_R013YYYY_partial_16_0064,
  rs_R013_ueqv_R013YYYY_partial_16_0065,
  rs_R013_ueqv_R013YYYY_partial_16_0066,
  rs_R013_ueqv_R013YYYY_partial_16_0067,
  rs_R013_ueqv_R013YYYY_partial_16_0068,
  rs_R013_ueqv_R013YYYY_partial_16_0069,
  rs_R013_ueqv_R013YYYY_partial_16_0070,
  rs_R013_ueqv_R013YYYY_partial_16_0071,
  rs_R013_ueqv_R013YYYY_partial_16_0072,
  rs_R013_ueqv_R013YYYY_partial_16_0073,
  rs_R013_ueqv_R013YYYY_partial_16_0074,
  rs_R013_ueqv_R013YYYY_partial_16_0075,
  rs_R013_ueqv_R013YYYY_partial_16_0076,
  rs_R013_ueqv_R013YYYY_partial_16_0077,
  rs_R013_ueqv_R013YYYY_partial_16_0078,
  rs_R013_ueqv_R013YYYY_partial_16_0079,
  rs_R013_ueqv_R013YYYY_partial_16_0080,
  rs_R013_ueqv_R013YYYY_partial_16_0081,
  rs_R013_ueqv_R013YYYY_partial_16_0082,
  rs_R013_ueqv_R013YYYY_partial_16_0083,
  rs_R013_ueqv_R013YYYY_partial_16_0084,
  rs_R013_ueqv_R013YYYY_partial_16_0085,
  rs_R013_ueqv_R013YYYY_partial_16_0086,
  rs_R013_ueqv_R013YYYY_partial_16_0087,
  rs_R013_ueqv_R013YYYY_partial_16_0088,
  rs_R013_ueqv_R013YYYY_partial_16_0089,
  rs_R013_ueqv_R013YYYY_partial_16_0090,
  rs_R013_ueqv_R013YYYY_partial_16_0091,
  rs_R013_ueqv_R013YYYY_partial_16_0092,
  rs_R013_ueqv_R013YYYY_partial_16_0093,
  rs_R013_ueqv_R013YYYY_partial_16_0094,
  rs_R013_ueqv_R013YYYY_partial_16_0095,
  rs_R013_ueqv_R013YYYY_partial_16_0096,
  rs_R013_ueqv_R013YYYY_partial_16_0097,
  rs_R013_ueqv_R013YYYY_partial_16_0098,
  rs_R013_ueqv_R013YYYY_partial_16_0099
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YYYY_block_16_0000_0099 : Poly :=
[
  term ((-23910325903902240888779230684550316687763595788650589575663089408 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-55570906409074052876964518549320322265620536555822592632964445056 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-424862258351786081694760517630887438697930495154349146969122368 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2988790737987780111097403835568789585970449473581323696957886176 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6946363301134256609620564818665040283202567069477824079120555632 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-53107782293973260211845064703860929837241311894293643371140296 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (6, 1), (15, 3), (16, 1)],
  term ((11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (8, 1), (13, 1), (16, 1)],
  term ((212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((1494395368993890055548701917784394792985224736790661848478943088 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (1, 1), (11, 1), (16, 1)],
  term ((13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((3473181650567128304810282409332520141601283534738912039560277816 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (13, 1), (16, 1)],
  term ((26553891146986630105922532351930464918620655947146821685570148 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (15, 1), (16, 1)],
  term ((106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (1, 1), (15, 3), (16, 1)],
  term ((-2323321403904999106457683393691808829102898797951012228556093216 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-7350052829690910019209717919246574238434713915902042466506382384 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((266378283303252301279930457286641432478792329608569877530834168 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1161660701952499553228841696845904414551449398975506114278046608 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((3675026414845455009604858959623287119217356957951021233253191192 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-133189141651626150639965228643320716239396164804284938765417084 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((264585163292531573011071468475893944978004490611450037451905088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((33290552760124402876115776753266380072481774357776228953570961200 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((2371215099154009668829535205589632338948731697353746334677971848 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-132292581646265786505535734237946972489002245305725018725952544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-16645276380062201438057888376633190036240887178888114476785480600 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-1185607549577004834414767602794816169474365848676873167338985924 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-6152251681752668549904566382125663841011297984968088894997125312 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-474624662217516507180496411636010721479060225772373629777585928000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3244662913157865240215881136106487533057918672030406889312114048 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((154156744286316099423480499712872761105677369573482840960 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((4684454189039200840937220717548409464124749096853944775380160064 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((398138855202740881520658461237338247736916131241615293496789785824 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4161435565672274575943085393554112425286412065953022265018670752 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((3076125840876334274952283191062831920505648992484044447498562656 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((237312331108758253590248205818005360739530112886186814888792964000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1622331456578932620107940568053243766528959336015203444656057024 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2342227094519600420468610358774204732062374548426972387690080032 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-199069427601370440760329230618669123868458065620807646748394892912 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((2080717782836137287971542696777056212643206032976511132509335376 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((-264585163292531573011071468475893944978004490611450037451905088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-33290552760124402876115776753266380072481774357776228953570961200 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-2371215099154009668829535205589632338948731697353746334677971848 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((132292581646265786505535734237946972489002245305725018725952544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((16645276380062201438057888376633190036240887178888114476785480600 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((1185607549577004834414767602794816169474365848676873167338985924 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((6152251681752668549904566382125663841011297984968088894997125312 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((474624662217516507180496411636010721479060225772373629777585928000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-3244662913157865240215881136106487533057918672030406889312114048 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-150560887394267033698919959474204618280550038906606443788493888 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-38860904707103683071585821998347856301792837156831668293120639632 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-775073093150338091411433547526529125780171630461925453121450488 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3076125840876334274952283191062831920505648992484044447498562656 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-237312331108758253590248205818005360739530112886186814888792964000 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((1622331456578932620107940568053243766528959336015203444656057024 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((75280443697133516849459979737102309140275019453303221894246944 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term ((19430452353551841535792910999173928150896418578415834146560319816 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term ((387536546575169045705716773763264562890085815230962726560725244 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-18905690614601314010926965082395902959475750475960159133986816 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1184099926137529561531315665130803783311558136479266571640880336 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-316686766893133423547831418802716679665924933500617765268172136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((9452845307300657005463482541197951479737875237980079566993408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((592049963068764780765657832565401891655779068239633285820440168 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((158343383446566711773915709401358339832962466750308882634086068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-264585163292531573011071468475893944978004490611450037451905088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-37743091220052497013038431760304191652574151109968002260679127344 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((18813169426983581943344184990881877525341386219587664296299613752 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((132292581646265786505535734237946972489002245305725018725952544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((18871545610026248506519215880152095826287075554984001130339563672 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((-9406584713491790971672092495440938762670693109793832148149806876 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-37811381229202628021853930164791805918951500951920318267973632 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2368199852275059123062631330261607566623116272958533143281760672 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-633373533786266847095662837605433359331849867001235530536344272 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((6501592093306885205324083804101833179152096060578971897159831232 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((224555583376683269234156078164069271283767811271171962929245925248 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3881956300685544362758021912552818691104814414761930609765797600 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-55570906409074052876964518549320322265620536555822592632964445056 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-424862258351786081694760517630887438697930495154349146969122368 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-23910325903902240888779230684550316687763595788650589575663089408 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (10, 1), (11, 2), (16, 1)],
  term ((6696389084426643220114234061751579620179131894668691013228 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (6, 1), (10, 1), (16, 1)],
  term ((13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((45151361457372667962533671321322761840816685951605856514283611608 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2686468462752930192415198060479540273814254697347549268456353141353692 : Rat) / 3902931257128946422661616898168969559460966818693452894212095390434785) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (11, 2), (15, 2), (16, 1)],
  term ((19427139796920570722133124931197132308807921578278604030226260144 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((6700707838759284153565214810835775469343379239718058816752 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-392146744944496844333567783489346293803140059997333850595589788056 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4480015832163431447746266949350978517326155987970191613616082516 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((32696131278086750532360651881066182328660412673288437176418 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (6, 1), (16, 1)],
  term ((18905690614601314010926965082395902959475750475960159133986816 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(0, 1), (7, 1), (11, 1), (16, 1)],
  term ((1184099926137529561531315665130803783311558136479266571640880336 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (7, 1), (13, 1), (16, 1)],
  term ((316686766893133423547831418802716679665924933500617765268172136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5977581475975560222194807671137579171940898947162647393915772352 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-13892726602268513219241129637330080566405134138955648158241111264 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-106215564587946520423690129407721859674482623788587286742280592 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3250796046653442602662041902050916589576048030289485948579915616 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term ((-112277791688341634617078039082034635641883905635585981464622962624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((1940978150342772181379010956276409345552407207380965304882898800 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((27785453204537026438482259274660161132810268277911296316482222528 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((212431129175893040847380258815443719348965247577174573484561184 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((11955162951951120444389615342275158343881797894325294787831544704 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-3348194542213321610057117030875789810089565947334345506614 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (10, 1), (16, 1)],
  term ((-6946363301134256609620564818665040283202567069477824079120555632 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-22575680728686333981266835660661380920408342975802928257141805804 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((1343234231376465096207599030239770136907127348673774634228176570676846 : Rat) / 3902931257128946422661616898168969559460966818693452894212095390434785) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-53107782293973260211845064703860929837241311894293643371140296 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2988790737987780111097403835568789585970449473581323696957886176 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-9713569898460285361066562465598566154403960789139302015113130072 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(0, 1), (11, 2), (16, 1)],
  term ((-3350353919379642076782607405417887734671689619859029408376 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (12, 1), (16, 1)],
  term ((196073372472248422166783891744673146901570029998666925297794894028 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2240007916081715723873133474675489258663077993985095806808041258 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(0, 1), (15, 2), (16, 1)],
  term ((-16348065639043375266180325940533091164330206336644218588209 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(0, 1), (16, 1)],
  term ((-7741674339300933801878576943528845481670922338862029063744735904 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((-631460659397440660665178213299181849389938396540065790456816675072 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((6381393245542734236356977720954432063805164458546866991015998192 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((3870837169650466900939288471764422740835461169431014531872367952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((315730329698720330332589106649590924694969198270032895228408337536 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-3190696622771367118178488860477216031902582229273433495507999096 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((2323321403904999106457683393691808829102898797951012228556093216 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((7350052829690910019209717919246574238434713915902042466506382384 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((-266378283303252301279930457286641432478792329608569877530834168 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-1161660701952499553228841696845904414551449398975506114278046608 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-3675026414845455009604858959623287119217356957951021233253191192 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((133189141651626150639965228643320716239396164804284938765417084 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-2708700177367680830149988522846898446576879109056125193472 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (8, 1), (16, 1)],
  term ((1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (10, 1), (16, 1)],
  term ((154156744286316099423480499712872761105677369573482840960 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((2702586905198195897945031598409344545299496805290617196992 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (6, 1), (16, 1)],
  term ((1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (8, 1), (16, 1)],
  term ((-677175044341920207537497130711724611644219777264031298368 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (10, 1), (16, 1)],
  term ((-77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((677175044341920207537497130711724611644219777264031298368 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-1351293452599097948972515799204672272649748402645308598496 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (3, 1), (16, 1)],
  term ((-41388005518033595497023200521512848168176293965310353277562880 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-74182894091433433361099932874759298256423179648678083497904981248 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((3945252282373702254197751574428171703099362369684997382784278912 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-294506667829004864365038292775994128492625788953993750393258496 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-7188523153776144156277467932568708268583636976851520273411717184 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-21324601524627145677494664087273421760734547487732021488665895008 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((20694002759016797748511600260756424084088146982655176638781440 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((37091447045716716680549966437379649128211589824339041748952490624 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1972626141186851127098875787214085851549681184842498691392139456 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((-10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (10, 1), (15, 1), (16, 1)],
  term ((10347001379508398874255800130378212042044073491327588319390720 : Rat) / 216731202603316130358735434630289624704180954511103873948961229) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((147253333914502432182519146387997064246312894476996875196629248 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((18545723522858358340274983218689824564105794912169520874476245312 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((3594261576888072078138733966284354134291818488425760136705858592 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((10662300762313572838747332043636710880367273743866010744332947504 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((-986313070593425563549437893607042925774840592421249345696069728 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 1), (15, 3), (16, 1)],
  term ((18905690614601314010926965082395902959475750475960159133986816 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((1184099926137529561531315665130803783311558136479266571640880336 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((316686766893133423547831418802716679665924933500617765268172136 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-9452845307300657005463482541197951479737875237980079566993408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-592049963068764780765657832565401891655779068239633285820440168 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-158343383446566711773915709401358339832962466750308882634086068 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((23033356440751645071897328449044528875985840263294952128 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((7162749409170164602749864810048853397492565216447251515390285568 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((375031609820195382682615326750339126698908003981946557850884563520 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((126504263190520623317483214053312990013063243010412195468499121408 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-11516678220375822535948664224522264437992920131647476064 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((11516678220375822535948664224522264437992920131647476064 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((2879169555093955633987166056130566109498230032911869016 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((5441714581222061973950059996929129768043493063948225810580476192 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((1220104146664766679978902393917328080326867021407237782453600640 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-62457474787721418893287170025519029958330524764656837178641125904 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-11516678220375822535948664224522264437992920131647476064 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (8, 1), (9, 1), (16, 1)],
  term ((-3581374704585082301374932405024426698746282608223625757695142784 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-187515804910097691341307663375169563349454001990973278925442281760 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-63252131595260311658741607026656495006531621505206097734249560704 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (9, 1), (10, 1), (16, 1)],
  term ((-5758339110187911267974332112261132218996460065823738032 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1439584777546977816993583028065283054749115016455934508 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(1, 1), (9, 1), (16, 1)],
  term ((-2720857290611030986975029998464564884021746531974112905290238096 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-610052073332383339989451196958664040163433510703618891226800320 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((31228737393860709446643585012759514979165262382328418589320562952 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 99. -/
theorem rs_R013_ueqv_R013YYYY_block_16_0000_0099_valid :
    checkProductSumEq rs_R013_ueqv_R013YYYY_partials_16_0000_0099
      rs_R013_ueqv_R013YYYY_block_16_0000_0099 = true := by
  native_decide

end R013UeqvR013YYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
