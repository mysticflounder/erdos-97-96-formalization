/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YYYY, term block 16:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YYYYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R013:u=v:R013YYYY`. -/
def rs_R013_ueqv_R013YYYY_generator_16_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0100 : Poly :=
[
  term ((570482260383309653089141820303838443977579648735329985663674448 : Rat) / 1517118418223212912511148042412027372929266681577727117642728603) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0100 : Poly :=
[
  term ((1140964520766619306178283640607676887955159297470659971327348896 : Rat) / 1517118418223212912511148042412027372929266681577727117642728603) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-570482260383309653089141820303838443977579648735329985663674448 : Rat) / 1517118418223212912511148042412027372929266681577727117642728603) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0100_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0100
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0101 : Poly :=
[
  term ((35623136493309867297312946895314536587639740546591009850463944006 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 101 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0101 : Poly :=
[
  term ((71246272986619734594625893790629073175279481093182019700927888012 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-35623136493309867297312946895314536587639740546591009850463944006 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0101_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0101
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0102 : Poly :=
[
  term ((124883728532996719535217817339003662210856473127613391443373387196 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0102 : Poly :=
[
  term ((249767457065993439070435634678007324421712946255226782886746774392 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-124883728532996719535217817339003662210856473127613391443373387196 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0102_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0102
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0103 : Poly :=
[
  term ((154879288179375142381083188861000866899915407496043070540302901813 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 103 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0103 : Poly :=
[
  term ((309758576358750284762166377722001733799830814992086141080605803626 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-154879288179375142381083188861000866899915407496043070540302901813 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0103_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0103
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0104 : Poly :=
[
  term ((358320654151054252912956704177573828357259687131328446255084294383 : Rat) / 4107696504813477603287495825489780544802237699481173140978944982) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0104 : Poly :=
[
  term ((358320654151054252912956704177573828357259687131328446255084294383 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-358320654151054252912956704177573828357259687131328446255084294383 : Rat) / 4107696504813477603287495825489780544802237699481173140978944982) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0104_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0104
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0105 : Poly :=
[
  term ((23059067616061655206039107674784393299667907542641615316455646634 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 105 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0105 : Poly :=
[
  term ((46118135232123310412078215349568786599335815085283230632911293268 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-23059067616061655206039107674784393299667907542641615316455646634 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0105_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0105
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0106 : Poly :=
[
  term ((14771213808254359325663506527742927028863903954626535733957704 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 106 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0106 : Poly :=
[
  term ((29542427616508718651327013055485854057727807909253071467915408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-14771213808254359325663506527742927028863903954626535733957704 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0106_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0106
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0107 : Poly :=
[
  term ((-476119944211285083510496135498579717109774397702779127573181472 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 107 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0107 : Poly :=
[
  term ((-952239888422570167020992270997159434219548795405558255146362944 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((476119944211285083510496135498579717109774397702779127573181472 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0107_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0107
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0108 : Poly :=
[
  term ((-392773489479734975578351795080628887643738751050132956737978504 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0108 : Poly :=
[
  term ((-785546978959469951156703590161257775287477502100265913475957008 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((392773489479734975578351795080628887643738751050132956737978504 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0108_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0108
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0109 : Poly :=
[
  term ((-161503008946152047151311548574982333022950292703586875404 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 109 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0109 : Poly :=
[
  term ((-323006017892304094302623097149964666045900585407173750808 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((161503008946152047151311548574982333022950292703586875404 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0109_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0109
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0110 : Poly :=
[
  term ((-572906937333830797357800969017702076473086292643830692519766936 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 110 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0110 : Poly :=
[
  term ((-1145813874667661594715601938035404152946172585287661385039533872 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((572906937333830797357800969017702076473086292643830692519766936 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0110_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0110
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0111 : Poly :=
[
  term ((-60150836436007060407905278477128034348143173427412491012302272352 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0111 : Poly :=
[
  term ((-120301672872014120815810556954256068696286346854824982024604544704 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((60150836436007060407905278477128034348143173427412491012302272352 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0111_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0111
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0112 : Poly :=
[
  term ((-3297482013885340848753752883955842658579458345238723287383948960 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0112 : Poly :=
[
  term ((-6594964027770681697507505767911685317158916690477446574767897920 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((3297482013885340848753752883955842658579458345238723287383948960 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0112_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0112
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0113 : Poly :=
[
  term ((807515044730760235756557742874911665114751463517934377020 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 113 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0113 : Poly :=
[
  term ((1615030089461520471513115485749823330229502927035868754040 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-807515044730760235756557742874911665114751463517934377020 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0113_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0113
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0114 : Poly :=
[
  term ((25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 114 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0114 : Poly :=
[
  term ((50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0114_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0114
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0115 : Poly :=
[
  term ((1869409173420534829649723849690683470563163348138662264240651856 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 115 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0115 : Poly :=
[
  term ((3738818346841069659299447699381366941126326696277324528481303712 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1869409173420534829649723849690683470563163348138662264240651856 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0115_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0115
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0116 : Poly :=
[
  term ((-154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 116 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0116 : Poly :=
[
  term ((-309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0116_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0116
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0117 : Poly :=
[
  term ((-224029495069412306510472817287552304238382364223029555398668416 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0117 : Poly :=
[
  term ((-448058990138824613020945634575104608476764728446059110797336832 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((224029495069412306510472817287552304238382364223029555398668416 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0117_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0117
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0118 : Poly :=
[
  term ((46597377184576996021805044218636256427723143846023727004065561892 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 118 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0118 : Poly :=
[
  term ((93194754369153992043610088437272512855446287692047454008131123784 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-46597377184576996021805044218636256427723143846023727004065561892 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0118_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0118
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0119 : Poly :=
[
  term ((-3029772623133968563058162562083890334653942466271953100591211942 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0119 : Poly :=
[
  term ((-6059545246267937126116325124167780669307884932543906201182423884 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3029772623133968563058162562083890334653942466271953100591211942 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0119_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0119
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0120 : Poly :=
[
  term ((-14685911058247752427856204394400342202190680831559415777243136 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 120 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0120 : Poly :=
[
  term ((-29371822116495504855712408788800684404381361663118831554486272 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((14685911058247752427856204394400342202190680831559415777243136 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0120_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0120
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0121 : Poly :=
[
  term ((25951236647105460901188966446217539065010823212866866902128376 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 121 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0121 : Poly :=
[
  term ((51902473294210921802377932892435078130021646425733733804256752 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-25951236647105460901188966446217539065010823212866866902128376 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0121_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0121
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0122 : Poly :=
[
  term ((347042958920453151728738664774419790696551881759231022273523332 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0122 : Poly :=
[
  term ((694085917840906303457477329548839581393103763518462044547046664 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-347042958920453151728738664774419790696551881759231022273523332 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0122_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0122
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0123 : Poly :=
[
  term ((1410934921999786224274740417633596195408200224892432868052544 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 123 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0123 : Poly :=
[
  term ((2821869843999572448549480835267192390816400449784865736105088 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1410934921999786224274740417633596195408200224892432868052544 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0123_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0123
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0124 : Poly :=
[
  term ((21941936693845787620080480886014536246902109642031283440823593968 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 124 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0124 : Poly :=
[
  term ((43883873387691575240160961772029072493804219284062566881647187936 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-21941936693845787620080480886014536246902109642031283440823593968 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0124_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0124
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0125 : Poly :=
[
  term ((-809531466808440056645212265350489197265459669440894356091652360 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 125 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0125 : Poly :=
[
  term ((-1619062933616880113290424530700978394530919338881788712183304720 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((809531466808440056645212265350489197265459669440894356091652360 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0125_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0125
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0126 : Poly :=
[
  term ((-24138756365548409433319686935598293681928556069539495344236544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0126 : Poly :=
[
  term ((-48277512731096818866639373871196587363857112139078990688473088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((24138756365548409433319686935598293681928556069539495344236544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0126_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0126
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0127 : Poly :=
[
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0127 : Poly :=
[
  term ((-81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0127_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0127
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0128 : Poly :=
[
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 128 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0128 : Poly :=
[
  term ((81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0128_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0128
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0129 : Poly :=
[
  term ((559950270837449873667973301335264010599798830464641431756355936 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 129 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0129 : Poly :=
[
  term ((1119900541674899747335946602670528021199597660929282863512711872 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-559950270837449873667973301335264010599798830464641431756355936 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0129_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0129
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0130 : Poly :=
[
  term ((24747125528403096959824657173671742905468460040362760707859564792 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 130 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0130 : Poly :=
[
  term ((49494251056806193919649314347343485810936920080725521415719129584 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-24747125528403096959824657173671742905468460040362760707859564792 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0130_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0130
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0131 : Poly :=
[
  term ((-2210084001835458417765701943256533587853168995420610172532607368 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0131 : Poly :=
[
  term ((-4420168003670916835531403886513067175706337990841220345065214736 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((2210084001835458417765701943256533587853168995420610172532607368 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0131_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0131
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0132 : Poly :=
[
  term ((25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 132 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0132 : Poly :=
[
  term ((-25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0132_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0132
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0133 : Poly :=
[
  term ((-154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 133 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0133 : Poly :=
[
  term ((154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0133_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0133
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0134 : Poly :=
[
  term ((-224029495069412306510472817287552304238382364223029555398668416 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 134 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0134 : Poly :=
[
  term ((224029495069412306510472817287552304238382364223029555398668416 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-448058990138824613020945634575104608476764728446059110797336832 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0134_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0134
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0135 : Poly :=
[
  term ((-25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 135 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0135 : Poly :=
[
  term ((-50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0135_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0135
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0136 : Poly :=
[
  term ((154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 136 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0136 : Poly :=
[
  term ((309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (7, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0136_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0136
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0137 : Poly :=
[
  term ((224029495069412306510472817287552304238382364223029555398668416 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0137 : Poly :=
[
  term ((448058990138824613020945634575104608476764728446059110797336832 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-224029495069412306510472817287552304238382364223029555398668416 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0137_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0137
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0138 : Poly :=
[
  term ((133652254849371800985380992328682701090145680698979213639003872 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 138 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0138 : Poly :=
[
  term ((267304509698743601970761984657365402180291361397958427278007744 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-133652254849371800985380992328682701090145680698979213639003872 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0138_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0138
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0139 : Poly :=
[
  term ((64080240818718454576596813547969985733745734460715601301844800816 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 139 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0139 : Poly :=
[
  term ((128160481637436909153193627095939971467491468921431202603689601632 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-64080240818718454576596813547969985733745734460715601301844800816 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0139_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0139
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0140 : Poly :=
[
  term ((-108073101638828677766114783215726339029252551151122771397114560 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0140 : Poly :=
[
  term ((-216146203277657355532229566431452678058505102302245542794229120 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((108073101638828677766114783215726339029252551151122771397114560 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0140_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0140
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0141 : Poly :=
[
  term ((-62132076681264210542360577640995127003856491930699525104 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 141 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0141 : Poly :=
[
  term ((-124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((62132076681264210542360577640995127003856491930699525104 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0141_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0141
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0142 : Poly :=
[
  term ((16169723574680867911116018884767313262086401552017724589654648 : Rat) / 51602667286503840561603674911973720167662132026453303321181245) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 142 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0142 : Poly :=
[
  term ((32339447149361735822232037769534626524172803104035449179309296 : Rat) / 51602667286503840561603674911973720167662132026453303321181245) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-16169723574680867911116018884767313262086401552017724589654648 : Rat) / 51602667286503840561603674911973720167662132026453303321181245) [(2, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0142_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0142
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0143 : Poly :=
[
  term ((47534360771449172577178583988867377898170828194665274711682412664 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 143 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0143 : Poly :=
[
  term ((95068721542898345154357167977734755796341656389330549423364825328 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-47534360771449172577178583988867377898170828194665274711682412664 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0143_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0143
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0144 : Poly :=
[
  term ((-3703882008770587130485117035307219943211208178525877831666151292 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0144 : Poly :=
[
  term ((-7407764017541174260970234070614439886422416357051755663332302584 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3703882008770587130485117035307219943211208178525877831666151292 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0144_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0144
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0145 : Poly :=
[
  term ((124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (9, 2), (16, 1)]
]

/-- Partial product 145 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0145 : Poly :=
[
  term ((248528306725056842169442310563980508015425967722798100416 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (6, 1), (9, 2), (16, 1)],
  term ((-124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0145_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0145
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0146 : Poly :=
[
  term ((-50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 146 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0146 : Poly :=
[
  term ((-101788091213140733155671469595595565450167029871737317587195904 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0146_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0146
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0147 : Poly :=
[
  term ((-35734190024665145788799947253424388383221826525796198090096344 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 147 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0147 : Poly :=
[
  term ((-71468380049330291577599894506848776766443653051592396180192688 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((35734190024665145788799947253424388383221826525796198090096344 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0147_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0147
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0148 : Poly :=
[
  term ((19926507709150009806600758858987482088812325484535488830294096 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0148 : Poly :=
[
  term ((39853015418300019613201517717974964177624650969070977660588192 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-19926507709150009806600758858987482088812325484535488830294096 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0148_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0148
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0149 : Poly :=
[
  term ((309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0149 : Poly :=
[
  term ((618001199715870241666846799011619430720789891452500152722568544 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0149_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0149
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0150 : Poly :=
[
  term ((448058990138824613020945634575104608476764728446059110797336832 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 150 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0150 : Poly :=
[
  term ((896117980277649226041891269150209216953529456892118221594673664 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-448058990138824613020945634575104608476764728446059110797336832 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0150_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0150
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0151 : Poly :=
[
  term ((3671340018614621473517139002036826962506094267131769801411327396 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 151 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0151 : Poly :=
[
  term ((7342680037229242947034278004073653925012188534263539602822654792 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3671340018614621473517139002036826962506094267131769801411327396 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0151_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0151
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0152 : Poly :=
[
  term ((56780282284216355899969554868494606964326549521379212785410610 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 152 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0152 : Poly :=
[
  term ((113560564568432711799939109736989213928653099042758425570821220 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-56780282284216355899969554868494606964326549521379212785410610 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0152_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0152
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0153 : Poly :=
[
  term ((107843647678323455292106924801911376874886541247656677535192418 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 153 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0153 : Poly :=
[
  term ((215687295356646910584213849603822753749773082495313355070384836 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-107843647678323455292106924801911376874886541247656677535192418 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0153_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0153
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0154 : Poly :=
[
  term ((1016090293351375700358200376994082651691846072169539405710 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (16, 1)]
]

/-- Partial product 154 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0154 : Poly :=
[
  term ((2032180586702751400716400753988165303383692144339078811420 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (6, 1), (16, 1)],
  term ((-1016090293351375700358200376994082651691846072169539405710 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0154_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0154
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0155 : Poly :=
[
  term ((-14771213808254359325663506527742927028863903954626535733957704 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 155 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0155 : Poly :=
[
  term ((-29542427616508718651327013055485854057727807909253071467915408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((14771213808254359325663506527742927028863903954626535733957704 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0155_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0155
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0156 : Poly :=
[
  term ((476119944211285083510496135498579717109774397702779127573181472 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 156 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0156 : Poly :=
[
  term ((952239888422570167020992270997159434219548795405558255146362944 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-476119944211285083510496135498579717109774397702779127573181472 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0156_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0156
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0157 : Poly :=
[
  term ((392773489479734975578351795080628887643738751050132956737978504 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0157 : Poly :=
[
  term ((785546978959469951156703590161257775287477502100265913475957008 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-392773489479734975578351795080628887643738751050132956737978504 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0157_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0157
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0158 : Poly :=
[
  term ((572906937333830797357800969017702076473086292643830692519766936 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 158 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0158 : Poly :=
[
  term ((1145813874667661594715601938035404152946172585287661385039533872 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-572906937333830797357800969017702076473086292643830692519766936 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0158_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0158
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0159 : Poly :=
[
  term ((60150836436007060407905278477128034348143173427412491012302272352 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 159 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0159 : Poly :=
[
  term ((120301672872014120815810556954256068696286346854824982024604544704 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-60150836436007060407905278477128034348143173427412491012302272352 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0159_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0159
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0160 : Poly :=
[
  term ((3297482013885340848753752883955842658579458345238723287383948960 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0160 : Poly :=
[
  term ((6594964027770681697507505767911685317158916690477446574767897920 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3297482013885340848753752883955842658579458345238723287383948960 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0160_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0160
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0161 : Poly :=
[
  term ((-25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 161 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0161 : Poly :=
[
  term ((-50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0161_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0161
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0162 : Poly :=
[
  term ((-161755554262286292624732755436729104306724005330341040389080048 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0162 : Poly :=
[
  term ((-323511108524572585249465510873458208613448010660682080778160096 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((161755554262286292624732755436729104306724005330341040389080048 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0162_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0162
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0163 : Poly :=
[
  term ((-98605527188913259261602151390858530384283512418434218365444413688 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 163 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0163 : Poly :=
[
  term ((-197211054377826518523204302781717060768567024836868436730888827376 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((98605527188913259261602151390858530384283512418434218365444413688 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0163_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0163
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0164 : Poly :=
[
  term ((154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (13, 2), (16, 1)]
]

/-- Partial product 164 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0164 : Poly :=
[
  term ((309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((-154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0164_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0164
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0165 : Poly :=
[
  term ((504616357023729052302209728241046864761461719720102404341707092 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (15, 2), (16, 1)]
]

/-- Partial product 165 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0165 : Poly :=
[
  term ((1009232714047458104604419456482093729522923439440204808683414184 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-504616357023729052302209728241046864761461719720102404341707092 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0165_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0165
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0166 : Poly :=
[
  term ((-1410934921999786224274740417633596195408200224892432868052544 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 166 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0166 : Poly :=
[
  term ((-2821869843999572448549480835267192390816400449784865736105088 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((1410934921999786224274740417633596195408200224892432868052544 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0166_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0166
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0167 : Poly :=
[
  term ((-21941936693845787620080480886014536246902109642031283440823593968 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 167 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0167 : Poly :=
[
  term ((-43883873387691575240160961772029072493804219284062566881647187936 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((21941936693845787620080480886014536246902109642031283440823593968 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0167_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0167
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0168 : Poly :=
[
  term ((809531466808440056645212265350489197265459669440894356091652360 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 168 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0168 : Poly :=
[
  term ((1619062933616880113290424530700978394530919338881788712183304720 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-809531466808440056645212265350489197265459669440894356091652360 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0168_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0168
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0169 : Poly :=
[
  term ((-6169789115298247328589740531022045980538187140539292175987864 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 169 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0169 : Poly :=
[
  term ((-12339578230596494657179481062044091961076374281078584351975728 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((6169789115298247328589740531022045980538187140539292175987864 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0169_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0169
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0170 : Poly :=
[
  term ((9126074311910787936871910598295287984616452629305116348450247784 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 170 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0170 : Poly :=
[
  term ((18252148623821575873743821196590575969232905258610232696900495568 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-9126074311910787936871910598295287984616452629305116348450247784 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0170_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0170
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0171 : Poly :=
[
  term ((329727445203598720613036607761730367937470243955169025472176724 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 171 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0171 : Poly :=
[
  term ((659454890407197441226073215523460735874940487910338050944353448 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-329727445203598720613036607761730367937470243955169025472176724 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0171_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0171
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0172 : Poly :=
[
  term ((14685911058247752427856204394400342202190680831559415777243136 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (4, 2), (11, 1), (16, 1)]
]

/-- Partial product 172 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0172 : Poly :=
[
  term ((29371822116495504855712408788800684404381361663118831554486272 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((-14685911058247752427856204394400342202190680831559415777243136 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (4, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0172_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0172
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0173 : Poly :=
[
  term ((-25951236647105460901188966446217539065010823212866866902128376 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 2), (13, 1), (16, 1)]
]

/-- Partial product 173 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0173 : Poly :=
[
  term ((-51902473294210921802377932892435078130021646425733733804256752 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((25951236647105460901188966446217539065010823212866866902128376 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0173_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0173
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0174 : Poly :=
[
  term ((-347042958920453151728738664774419790696551881759231022273523332 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 174 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0174 : Poly :=
[
  term ((-694085917840906303457477329548839581393103763518462044547046664 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((347042958920453151728738664774419790696551881759231022273523332 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0174_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0174
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0175 : Poly :=
[
  term ((161503008946152047151311548574982333022950292703586875404 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 175 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0175 : Poly :=
[
  term ((323006017892304094302623097149964666045900585407173750808 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-161503008946152047151311548574982333022950292703586875404 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0175_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0175
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0176 : Poly :=
[
  term ((2191434896730877050807899232292948720356754504393833257646336 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 176 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0176 : Poly :=
[
  term ((-2191434896730877050807899232292948720356754504393833257646336 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((4382869793461754101615798464585897440713509008787666515292672 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(3, 1), (6, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0176_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0176
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0177 : Poly :=
[
  term ((-386250749822418901041779249382262144200493682157812595451605340 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 177 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0177 : Poly :=
[
  term ((386250749822418901041779249382262144200493682157812595451605340 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-772501499644837802083558498764524288400987364315625190903210680 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (6, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0177_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0177
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0178 : Poly :=
[
  term ((-364707918718216085006563595731665217383948356366284730153138908 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 178 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0178 : Poly :=
[
  term ((364707918718216085006563595731665217383948356366284730153138908 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-729415837436432170013127191463330434767896712732569460306277816 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0178_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0178
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0179 : Poly :=
[
  term ((-124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 179 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0179 : Poly :=
[
  term ((-248528306725056842169442310563980508015425967722798100416 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0179_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0179
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0180 : Poly :=
[
  term ((4238768308236105938454000756486754730664633920461192435096616224 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 180 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0180 : Poly :=
[
  term ((8477536616472211876908001512973509461329267840922384870193232448 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-4238768308236105938454000756486754730664633920461192435096616224 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0180_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0180
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0181 : Poly :=
[
  term ((-85674203879495968001057324408920770521820107453542061874768487204 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 181 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0181 : Poly :=
[
  term ((-171348407758991936002114648817841541043640214907084123749536974408 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((85674203879495968001057324408920770521820107453542061874768487204 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0181_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0181
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0182 : Poly :=
[
  term ((14621516334466243856355842397693434291594517965147430253416146072 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0182 : Poly :=
[
  term ((29243032668932487712711684795386868583189035930294860506832292144 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-14621516334466243856355842397693434291594517965147430253416146072 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0182_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0182
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0183 : Poly :=
[
  term ((-338587522170960103768748565355862305822109888632015649184 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 183 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0183 : Poly :=
[
  term ((-677175044341920207537497130711724611644219777264031298368 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((338587522170960103768748565355862305822109888632015649184 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0183_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0183
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0184 : Poly :=
[
  term ((-406795445878535921445448599878054232288785082955219202732 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 184 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0184 : Poly :=
[
  term ((-813590891757071842890897199756108464577570165910438405464 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((406795445878535921445448599878054232288785082955219202732 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0184_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0184
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0185 : Poly :=
[
  term ((-1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 185 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0185 : Poly :=
[
  term ((-2708700177367680830149988522846898446576879109056125193472 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0185_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0185
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0186 : Poly :=
[
  term ((-8207457689613898350390907657356356024336255703619611682057096 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 186 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0186 : Poly :=
[
  term ((-16414915379227796700781815314712712048672511407239223364114192 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((8207457689613898350390907657356356024336255703619611682057096 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0186_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0186
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0187 : Poly :=
[
  term ((-77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0187 : Poly :=
[
  term ((-154156744286316099423480499712872761105677369573482840960 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0187_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0187
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0188 : Poly :=
[
  term ((1298661529540810781743854416942475861256653375220286111401040292 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 188 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0188 : Poly :=
[
  term ((2597323059081621563487708833884951722513306750440572222802080584 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1298661529540810781743854416942475861256653375220286111401040292 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0188_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0188
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0189 : Poly :=
[
  term ((-374971591276734560737700674812779317322967573823994417134846311 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 189 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0189 : Poly :=
[
  term ((-749943182553469121475401349625558634645935147647988834269692622 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((374971591276734560737700674812779317322967573823994417134846311 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0189_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0189
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0190 : Poly :=
[
  term ((-56780282284216355899969554868494606964326549521379212785410610 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 190 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0190 : Poly :=
[
  term ((-113560564568432711799939109736989213928653099042758425570821220 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((56780282284216355899969554868494606964326549521379212785410610 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0190_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0190
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0191 : Poly :=
[
  term ((-493286906277213760414377007120955960947665172188357222400594456 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 191 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0191 : Poly :=
[
  term ((-986573812554427520828754014241911921895330344376714444801188912 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((493286906277213760414377007120955960947665172188357222400594456 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0191_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0191
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0192 : Poly :=
[
  term ((-36192434243602879403754624299651573845055471191039956939255887764 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 192 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0192 : Poly :=
[
  term ((-72384868487205758807509248599303147690110942382079913878511775528 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((36192434243602879403754624299651573845055471191039956939255887764 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0192_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0192
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0193 : Poly :=
[
  term ((-9845990317617894047149132127268337150101378996846786355581893819 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 193 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0193 : Poly :=
[
  term ((-19691980635235788094298264254536674300202757993693572711163787638 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((9845990317617894047149132127268337150101378996846786355581893819 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0193_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0193
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0194 : Poly :=
[
  term ((59783556617717974344452051624093107262972700726748881394329541529 : Rat) / 4107696504813477603287495825489780544802237699481173140978944982) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0194 : Poly :=
[
  term ((59783556617717974344452051624093107262972700726748881394329541529 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-59783556617717974344452051624093107262972700726748881394329541529 : Rat) / 4107696504813477603287495825489780544802237699481173140978944982) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0194_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0194
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0195 : Poly :=
[
  term ((5933792537636329812684103429258130771181528363282869462243581742 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 195 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0195 : Poly :=
[
  term ((11867585075272659625368206858516261542363056726565738924487163484 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-5933792537636329812684103429258130771181528363282869462243581742 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0195_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0195
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0196 : Poly :=
[
  term ((161503008946152047151311548574982333022950292703586875404 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (4, 1), (16, 1)]
]

/-- Partial product 196 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0196 : Poly :=
[
  term ((323006017892304094302623097149964666045900585407173750808 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-161503008946152047151311548574982333022950292703586875404 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0196_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0196
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0197 : Poly :=
[
  term ((-807515044730760235756557742874911665114751463517934377020 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (8, 1), (16, 1)]
]

/-- Partial product 197 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0197 : Poly :=
[
  term ((-1615030089461520471513115485749823330229502927035868754040 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((807515044730760235756557742874911665114751463517934377020 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0197_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0197
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0198 : Poly :=
[
  term ((-2969281419299602381073654426946347672573898376806602462740 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (16, 1)]
]

/-- Partial product 198 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0198 : Poly :=
[
  term ((-5938562838599204762147308853892695345147796753613204925480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (6, 1), (16, 1)],
  term ((2969281419299602381073654426946347672573898376806602462740 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0198_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0198
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013YYYY_coefficient_16_0199 : Poly :=
[
  term ((24138756365548409433319686935598293681928556069539495344236544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 199 for generator 16. -/
def rs_R013_ueqv_R013YYYY_partial_16_0199 : Poly :=
[
  term ((48277512731096818866639373871196587363857112139078990688473088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-24138756365548409433319686935598293681928556069539495344236544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 16. -/
theorem rs_R013_ueqv_R013YYYY_partial_16_0199_valid :
    mulPoly rs_R013_ueqv_R013YYYY_coefficient_16_0199
        rs_R013_ueqv_R013YYYY_generator_16_0100_0199 =
      rs_R013_ueqv_R013YYYY_partial_16_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YYYY_partials_16_0100_0199 : List Poly :=
[
  rs_R013_ueqv_R013YYYY_partial_16_0100,
  rs_R013_ueqv_R013YYYY_partial_16_0101,
  rs_R013_ueqv_R013YYYY_partial_16_0102,
  rs_R013_ueqv_R013YYYY_partial_16_0103,
  rs_R013_ueqv_R013YYYY_partial_16_0104,
  rs_R013_ueqv_R013YYYY_partial_16_0105,
  rs_R013_ueqv_R013YYYY_partial_16_0106,
  rs_R013_ueqv_R013YYYY_partial_16_0107,
  rs_R013_ueqv_R013YYYY_partial_16_0108,
  rs_R013_ueqv_R013YYYY_partial_16_0109,
  rs_R013_ueqv_R013YYYY_partial_16_0110,
  rs_R013_ueqv_R013YYYY_partial_16_0111,
  rs_R013_ueqv_R013YYYY_partial_16_0112,
  rs_R013_ueqv_R013YYYY_partial_16_0113,
  rs_R013_ueqv_R013YYYY_partial_16_0114,
  rs_R013_ueqv_R013YYYY_partial_16_0115,
  rs_R013_ueqv_R013YYYY_partial_16_0116,
  rs_R013_ueqv_R013YYYY_partial_16_0117,
  rs_R013_ueqv_R013YYYY_partial_16_0118,
  rs_R013_ueqv_R013YYYY_partial_16_0119,
  rs_R013_ueqv_R013YYYY_partial_16_0120,
  rs_R013_ueqv_R013YYYY_partial_16_0121,
  rs_R013_ueqv_R013YYYY_partial_16_0122,
  rs_R013_ueqv_R013YYYY_partial_16_0123,
  rs_R013_ueqv_R013YYYY_partial_16_0124,
  rs_R013_ueqv_R013YYYY_partial_16_0125,
  rs_R013_ueqv_R013YYYY_partial_16_0126,
  rs_R013_ueqv_R013YYYY_partial_16_0127,
  rs_R013_ueqv_R013YYYY_partial_16_0128,
  rs_R013_ueqv_R013YYYY_partial_16_0129,
  rs_R013_ueqv_R013YYYY_partial_16_0130,
  rs_R013_ueqv_R013YYYY_partial_16_0131,
  rs_R013_ueqv_R013YYYY_partial_16_0132,
  rs_R013_ueqv_R013YYYY_partial_16_0133,
  rs_R013_ueqv_R013YYYY_partial_16_0134,
  rs_R013_ueqv_R013YYYY_partial_16_0135,
  rs_R013_ueqv_R013YYYY_partial_16_0136,
  rs_R013_ueqv_R013YYYY_partial_16_0137,
  rs_R013_ueqv_R013YYYY_partial_16_0138,
  rs_R013_ueqv_R013YYYY_partial_16_0139,
  rs_R013_ueqv_R013YYYY_partial_16_0140,
  rs_R013_ueqv_R013YYYY_partial_16_0141,
  rs_R013_ueqv_R013YYYY_partial_16_0142,
  rs_R013_ueqv_R013YYYY_partial_16_0143,
  rs_R013_ueqv_R013YYYY_partial_16_0144,
  rs_R013_ueqv_R013YYYY_partial_16_0145,
  rs_R013_ueqv_R013YYYY_partial_16_0146,
  rs_R013_ueqv_R013YYYY_partial_16_0147,
  rs_R013_ueqv_R013YYYY_partial_16_0148,
  rs_R013_ueqv_R013YYYY_partial_16_0149,
  rs_R013_ueqv_R013YYYY_partial_16_0150,
  rs_R013_ueqv_R013YYYY_partial_16_0151,
  rs_R013_ueqv_R013YYYY_partial_16_0152,
  rs_R013_ueqv_R013YYYY_partial_16_0153,
  rs_R013_ueqv_R013YYYY_partial_16_0154,
  rs_R013_ueqv_R013YYYY_partial_16_0155,
  rs_R013_ueqv_R013YYYY_partial_16_0156,
  rs_R013_ueqv_R013YYYY_partial_16_0157,
  rs_R013_ueqv_R013YYYY_partial_16_0158,
  rs_R013_ueqv_R013YYYY_partial_16_0159,
  rs_R013_ueqv_R013YYYY_partial_16_0160,
  rs_R013_ueqv_R013YYYY_partial_16_0161,
  rs_R013_ueqv_R013YYYY_partial_16_0162,
  rs_R013_ueqv_R013YYYY_partial_16_0163,
  rs_R013_ueqv_R013YYYY_partial_16_0164,
  rs_R013_ueqv_R013YYYY_partial_16_0165,
  rs_R013_ueqv_R013YYYY_partial_16_0166,
  rs_R013_ueqv_R013YYYY_partial_16_0167,
  rs_R013_ueqv_R013YYYY_partial_16_0168,
  rs_R013_ueqv_R013YYYY_partial_16_0169,
  rs_R013_ueqv_R013YYYY_partial_16_0170,
  rs_R013_ueqv_R013YYYY_partial_16_0171,
  rs_R013_ueqv_R013YYYY_partial_16_0172,
  rs_R013_ueqv_R013YYYY_partial_16_0173,
  rs_R013_ueqv_R013YYYY_partial_16_0174,
  rs_R013_ueqv_R013YYYY_partial_16_0175,
  rs_R013_ueqv_R013YYYY_partial_16_0176,
  rs_R013_ueqv_R013YYYY_partial_16_0177,
  rs_R013_ueqv_R013YYYY_partial_16_0178,
  rs_R013_ueqv_R013YYYY_partial_16_0179,
  rs_R013_ueqv_R013YYYY_partial_16_0180,
  rs_R013_ueqv_R013YYYY_partial_16_0181,
  rs_R013_ueqv_R013YYYY_partial_16_0182,
  rs_R013_ueqv_R013YYYY_partial_16_0183,
  rs_R013_ueqv_R013YYYY_partial_16_0184,
  rs_R013_ueqv_R013YYYY_partial_16_0185,
  rs_R013_ueqv_R013YYYY_partial_16_0186,
  rs_R013_ueqv_R013YYYY_partial_16_0187,
  rs_R013_ueqv_R013YYYY_partial_16_0188,
  rs_R013_ueqv_R013YYYY_partial_16_0189,
  rs_R013_ueqv_R013YYYY_partial_16_0190,
  rs_R013_ueqv_R013YYYY_partial_16_0191,
  rs_R013_ueqv_R013YYYY_partial_16_0192,
  rs_R013_ueqv_R013YYYY_partial_16_0193,
  rs_R013_ueqv_R013YYYY_partial_16_0194,
  rs_R013_ueqv_R013YYYY_partial_16_0195,
  rs_R013_ueqv_R013YYYY_partial_16_0196,
  rs_R013_ueqv_R013YYYY_partial_16_0197,
  rs_R013_ueqv_R013YYYY_partial_16_0198,
  rs_R013_ueqv_R013YYYY_partial_16_0199
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YYYY_block_16_0100_0199 : Poly :=
[
  term ((1140964520766619306178283640607676887955159297470659971327348896 : Rat) / 1517118418223212912511148042412027372929266681577727117642728603) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((71246272986619734594625893790629073175279481093182019700927888012 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((249767457065993439070435634678007324421712946255226782886746774392 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((309758576358750284762166377722001733799830814992086141080605803626 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((358320654151054252912956704177573828357259687131328446255084294383 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((46118135232123310412078215349568786599335815085283230632911293268 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-570482260383309653089141820303838443977579648735329985663674448 : Rat) / 1517118418223212912511148042412027372929266681577727117642728603) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-35623136493309867297312946895314536587639740546591009850463944006 : Rat) / 7585592091116064562555740212060136864646333407888635588213643015) [(1, 1), (11, 1), (16, 1)],
  term ((-124883728532996719535217817339003662210856473127613391443373387196 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-154879288179375142381083188861000866899915407496043070540302901813 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(1, 1), (13, 1), (16, 1)],
  term ((-358320654151054252912956704177573828357259687131328446255084294383 : Rat) / 4107696504813477603287495825489780544802237699481173140978944982) [(1, 1), (15, 1), (16, 1)],
  term ((-23059067616061655206039107674784393299667907542641615316455646634 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(1, 1), (15, 3), (16, 1)],
  term ((29542427616508718651327013055485854057727807909253071467915408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-952239888422570167020992270997159434219548795405558255146362944 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-785546978959469951156703590161257775287477502100265913475957008 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-14771213808254359325663506527742927028863903954626535733957704 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((476119944211285083510496135498579717109774397702779127573181472 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((392773489479734975578351795080628887643738751050132956737978504 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-323006017892304094302623097149964666045900585407173750808 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((161503008946152047151311548574982333022950292703586875404 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-1145813874667661594715601938035404152946172585287661385039533872 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-120301672872014120815810556954256068696286346854824982024604544704 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-6594964027770681697507505767911685317158916690477446574767897920 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((1615030089461520471513115485749823330229502927035868754040 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((3738818346841069659299447699381366941126326696277324528481303712 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-448058990138824613020945634575104608476764728446059110797336832 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((93194754369153992043610088437272512855446287692047454008131123784 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-6059545246267937126116325124167780669307884932543906201182423884 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((572906937333830797357800969017702076473086292643830692519766936 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((60150836436007060407905278477128034348143173427412491012302272352 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((3297482013885340848753752883955842658579458345238723287383948960 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-807515044730760235756557742874911665114751463517934377020 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1869409173420534829649723849690683470563163348138662264240651856 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term ((154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((224029495069412306510472817287552304238382364223029555398668416 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46597377184576996021805044218636256427723143846023727004065561892 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((3029772623133968563058162562083890334653942466271953100591211942 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-29371822116495504855712408788800684404381361663118831554486272 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((51902473294210921802377932892435078130021646425733733804256752 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((694085917840906303457477329548839581393103763518462044547046664 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((14685911058247752427856204394400342202190680831559415777243136 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-25951236647105460901188966446217539065010823212866866902128376 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-347042958920453151728738664774419790696551881759231022273523332 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((2821869843999572448549480835267192390816400449784865736105088 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((43883873387691575240160961772029072493804219284062566881647187936 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1619062933616880113290424530700978394530919338881788712183304720 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-48277512731096818866639373871196587363857112139078990688473088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((81499884346733525208257272163391202209610406357489935968 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1410934921999786224274740417633596195408200224892432868052544 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-21941936693845787620080480886014536246902109642031283440823593968 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((809531466808440056645212265350489197265459669440894356091652360 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((24138756365548409433319686935598293681928556069539495344236544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40749942173366762604128636081695601104805203178744967984 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((1119900541674899747335946602670528021199597660929282863512711872 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((49494251056806193919649314347343485810936920080725521415719129584 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-4420168003670916835531403886513067175706337990841220345065214736 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-559950270837449873667973301335264010599798830464641431756355936 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-24747125528403096959824657173671742905468460040362760707859564792 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (5, 1), (13, 1), (16, 1)],
  term ((2210084001835458417765701943256533587853168995420610172532607368 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (6, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((448058990138824613020945634575104608476764728446059110797336832 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((267304509698743601970761984657365402180291361397958427278007744 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((128160481637436909153193627095939971467491468921431202603689601632 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-216146203277657355532229566431452678058505102302245542794229120 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((1559185887515439872000451983308297808321925594629802680389356528 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((31741073947609104238257959892495886884673951287397891487181822488 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2394578174157253984819920417775629194061344664276242035977878056 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((248528306725056842169442310563980508015425967722798100416 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (6, 1), (9, 2), (16, 1)],
  term ((-101788091213140733155671469595595565450167029871737317587195904 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-71468380049330291577599894506848776766443653051592396180192688 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((39853015418300019613201517717974964177624650969070977660588192 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((618001199715870241666846799011619430720789891452500152722568544 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((896117980277649226041891269150209216953529456892118221594673664 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((7342680037229242947034278004073653925012188534263539602822654792 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((113560564568432711799939109736989213928653099042758425570821220 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((215687295356646910584213849603822753749773082495313355070384836 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((2032180586702751400716400753988165303383692144339078811420 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (6, 1), (16, 1)],
  term ((50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-448058990138824613020945634575104608476764728446059110797336832 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-224029495069412306510472817287552304238382364223029555398668416 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-133652254849371800985380992328682701090145680698979213639003872 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-64080240818718454576596813547969985733745734460715601301844800816 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((108073101638828677766114783215726339029252551151122771397114560 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((62132076681264210542360577640995127003856491930699525104 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (8, 1), (16, 1)],
  term ((-16169723574680867911116018884767313262086401552017724589654648 : Rat) / 51602667286503840561603674911973720167662132026453303321181245) [(2, 1), (9, 1), (11, 1), (16, 1)],
  term ((-47534360771449172577178583988867377898170828194665274711682412664 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (9, 1), (13, 1), (16, 1)],
  term ((3703882008770587130485117035307219943211208178525877831666151292 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (9, 2), (16, 1)],
  term ((50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((35734190024665145788799947253424388383221826525796198090096344 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19926507709150009806600758858987482088812325484535488830294096 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-448058990138824613020945634575104608476764728446059110797336832 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3671340018614621473517139002036826962506094267131769801411327396 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-56780282284216355899969554868494606964326549521379212785410610 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (13, 2), (16, 1)],
  term ((-107843647678323455292106924801911376874886541247656677535192418 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(2, 1), (15, 2), (16, 1)],
  term ((-1016090293351375700358200376994082651691846072169539405710 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(2, 1), (16, 1)],
  term ((-29542427616508718651327013055485854057727807909253071467915408 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((952239888422570167020992270997159434219548795405558255146362944 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((785546978959469951156703590161257775287477502100265913475957008 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((14771213808254359325663506527742927028863903954626535733957704 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (5, 1), (11, 1), (16, 1)],
  term ((-476119944211285083510496135498579717109774397702779127573181472 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (5, 1), (13, 1), (16, 1)],
  term ((-392773489479734975578351795080628887643738751050132956737978504 : Rat) / 684616084135579600547915970914963424133706283246862190163157497) [(2, 2), (5, 1), (15, 1), (16, 1)],
  term ((1145813874667661594715601938035404152946172585287661385039533872 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((120301672872014120815810556954256068696286346854824982024604544704 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((6594964027770681697507505767911685317158916690477446574767897920 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-50894045606570366577835734797797782725083514935868658793597952 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-323511108524572585249465510873458208613448010660682080778160096 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-197211054377826518523204302781717060768567024836868436730888827376 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((309000599857935120833423399505809715360394945726250076361284272 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (6, 1), (13, 2), (16, 1)],
  term ((1009232714047458104604419456482093729522923439440204808683414184 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (6, 1), (15, 2), (16, 1)],
  term ((-572906937333830797357800969017702076473086292643830692519766936 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((-60150836436007060407905278477128034348143173427412491012302272352 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3297482013885340848753752883955842658579458345238723287383948960 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((25447022803285183288917867398898891362541757467934329396798976 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((161755554262286292624732755436729104306724005330341040389080048 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((98605527188913259261602151390858530384283512418434218365444413688 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-154500299928967560416711699752904857680197472863125038180642136 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(2, 2), (13, 2), (16, 1)],
  term ((-504616357023729052302209728241046864761461719720102404341707092 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(2, 2), (15, 2), (16, 1)],
  term ((-2821869843999572448549480835267192390816400449784865736105088 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(3, 1), (4, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-43883873387691575240160961772029072493804219284062566881647187936 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((1619062933616880113290424530700978394530919338881788712183304720 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-12339578230596494657179481062044091961076374281078584351975728 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((18252148623821575873743821196590575969232905258610232696900495568 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((659454890407197441226073215523460735874940487910338050944353448 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1410934921999786224274740417633596195408200224892432868052544 : Rat) / 10320533457300768112320734982394744033532426405290660664236249) [(3, 1), (4, 1), (8, 1), (11, 1), (16, 1)],
  term ((21941936693845787620080480886014536246902109642031283440823593968 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (8, 1), (13, 1), (16, 1)],
  term ((-809531466808440056645212265350489197265459669440894356091652360 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((6169789115298247328589740531022045980538187140539292175987864 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-9126074311910787936871910598295287984616452629305116348450247784 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-329727445203598720613036607761730367937470243955169025472176724 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 1), (15, 1), (16, 1)],
  term ((29371822116495504855712408788800684404381361663118831554486272 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((-51902473294210921802377932892435078130021646425733733804256752 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((-694085917840906303457477329548839581393103763518462044547046664 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-14685911058247752427856204394400342202190680831559415777243136 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((25951236647105460901188966446217539065010823212866866902128376 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (4, 2), (13, 1), (16, 1)],
  term ((347042958920453151728738664774419790696551881759231022273523332 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((323006017892304094302623097149964666045900585407173750808 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-161503008946152047151311548574982333022950292703586875404 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (5, 1), (16, 1)],
  term ((-248528306725056842169442310563980508015425967722798100416 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((8477536616472211876908001512973509461329267840922384870193232448 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-171348407758991936002114648817841541043640214907084123749536974408 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((29243032668932487712711684795386868583189035930294860506832292144 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-677175044341920207537497130711724611644219777264031298368 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-813590891757071842890897199756108464577570165910438405464 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-2708700177367680830149988522846898446576879109056125193472 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-16414915379227796700781815314712712048672511407239223364114192 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-154156744286316099423480499712872761105677369573482840960 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2597323059081621563487708833884951722513306750440572222802080584 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3765055957044461746732662042753843814272173019770701004151987462 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-113560564568432711799939109736989213928653099042758425570821220 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-986573812554427520828754014241911921895330344376714444801188912 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-72384868487205758807509248599303147690110942382079913878511775528 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-715027032793087747898388333524237487259343122649472596878228974 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((6683140504048465603273179468869419164484072120346129569386964493 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((11867585075272659625368206858516261542363056726565738924487163484 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((4382869793461754101615798464585897440713509008787666515292672 : Rat) / 361218671005526883931225724383816041173634924185173123248268715) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-772501499644837802083558498764524288400987364315625190903210680 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-729415837436432170013127191463330434767896712732569460306277816 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((124264153362528421084721155281990254007712983861399050208 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (8, 1), (9, 1), (16, 1)],
  term ((-4238768308236105938454000756486754730664633920461192435096616224 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (8, 1), (11, 1), (16, 1)],
  term ((85674203879495968001057324408920770521820107453542061874768487204 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (8, 1), (13, 1), (16, 1)],
  term ((-14621516334466243856355842397693434291594517965147430253416146072 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (8, 1), (15, 1), (16, 1)],
  term ((338587522170960103768748565355862305822109888632015649184 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((406795445878535921445448599878054232288785082955219202732 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (9, 1), (16, 1)],
  term ((1354350088683840415074994261423449223288439554528062596736 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term ((8207457689613898350390907657356356024336255703619611682057096 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((77078372143158049711740249856436380552838684786741420480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1298661529540810781743854416942475861256653375220286111401040292 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((374971591276734560737700674812779317322967573823994417134846311 : Rat) / 505706139407737637503716014137342457643088893859242372547576201) [(3, 1), (11, 1), (16, 1)],
  term ((56780282284216355899969554868494606964326549521379212785410610 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((493286906277213760414377007120955960947665172188357222400594456 : Rat) / 228205361378526533515971990304987808044568761082287396721052499) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((36192434243602879403754624299651573845055471191039956939255887764 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((9845990317617894047149132127268337150101378996846786355581893819 : Rat) / 6161544757220216404931243738234670817203356549221759711468417473) [(3, 1), (13, 1), (16, 1)],
  term ((-59783556617717974344452051624093107262972700726748881394329541529 : Rat) / 4107696504813477603287495825489780544802237699481173140978944982) [(3, 1), (15, 1), (16, 1)],
  term ((-5933792537636329812684103429258130771181528363282869462243581742 : Rat) / 2053848252406738801643747912744890272401118849740586570489472491) [(3, 1), (15, 3), (16, 1)],
  term ((323006017892304094302623097149964666045900585407173750808 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (4, 1), (6, 1), (16, 1)],
  term ((-161503008946152047151311548574982333022950292703586875404 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (4, 1), (16, 1)],
  term ((-1615030089461520471513115485749823330229502927035868754040 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (6, 1), (8, 1), (16, 1)],
  term ((-5938562838599204762147308853892695345147796753613204925480 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (6, 1), (16, 1)],
  term ((807515044730760235756557742874911665114751463517934377020 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (8, 1), (16, 1)],
  term ((2969281419299602381073654426946347672573898376806602462740 : Rat) / 443531456328194942297508916687212344042822055322130760421) [(3, 2), (16, 1)],
  term ((48277512731096818866639373871196587363857112139078990688473088 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-24138756365548409433319686935598293681928556069539495344236544 : Rat) / 2528530697038688187518580070686712288215444469296211862737881005) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 100 through 199. -/
theorem rs_R013_ueqv_R013YYYY_block_16_0100_0199_valid :
    checkProductSumEq rs_R013_ueqv_R013YYYY_partials_16_0100_0199
      rs_R013_ueqv_R013YYYY_block_16_0100_0199 = true := by
  native_decide

end R013UeqvR013YYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
