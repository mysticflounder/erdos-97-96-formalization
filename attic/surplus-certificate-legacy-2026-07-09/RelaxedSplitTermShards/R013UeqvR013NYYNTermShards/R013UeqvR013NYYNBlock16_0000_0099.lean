/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NYYN, term block 16:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NYYNTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R013:u=v:R013NYYN`. -/
def rs_R013_ueqv_R013NYYN_generator_16_0000_0099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0000 : Poly :=
[
  term ((-9370879208723264715433846093098148346085195577588851104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0000 : Poly :=
[
  term ((-18741758417446529430867692186196296692170391155177702208 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((9370879208723264715433846093098148346085195577588851104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0000_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0000
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0001 : Poly :=
[
  term ((758124840259701400628174665416341200852100501023510470272 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0001 : Poly :=
[
  term ((1516249680519402801256349330832682401704201002047020940544 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-758124840259701400628174665416341200852100501023510470272 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0001_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0001
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0002 : Poly :=
[
  term ((-884079038370884410999860614613296763066243124701910329448 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0002 : Poly :=
[
  term ((-1768158076741768821999721229226593526132486249403820658896 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((884079038370884410999860614613296763066243124701910329448 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0002_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0002
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0003 : Poly :=
[
  term ((-3490197694513259782349956313132804890026268302141535645288 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0003 : Poly :=
[
  term ((-6980395389026519564699912626265609780052536604283071290576 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((3490197694513259782349956313132804890026268302141535645288 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0003_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0003
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0004 : Poly :=
[
  term ((23267951362805142142430927012478694405629431995392 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0004 : Poly :=
[
  term ((46535902725610284284861854024957388811258863990784 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-23267951362805142142430927012478694405629431995392 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0004_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0004
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0005 : Poly :=
[
  term ((139508375831861346975058859266093406523592218538384973984 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0005 : Poly :=
[
  term ((279016751663722693950117718532186813047184437076769947968 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-139508375831861346975058859266093406523592218538384973984 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0005_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0005
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0006 : Poly :=
[
  term ((-58269497629456203383695798147831256543710284707380713184 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0006 : Poly :=
[
  term ((-116538995258912406767391596295662513087420569414761426368 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((58269497629456203383695798147831256543710284707380713184 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0006_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0006
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0007 : Poly :=
[
  term ((18278990790514414670379048681369550760313210096158064512 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0007 : Poly :=
[
  term ((36557981581028829340758097362739101520626420192316129024 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-18278990790514414670379048681369550760313210096158064512 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0007_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0007
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0008 : Poly :=
[
  term ((-1587054088579161602881111813158424684237301557261285248 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (2, 1), (5, 2), (16, 1)]
]

/-- Partial product 8 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0008 : Poly :=
[
  term ((-3174108177158323205762223626316849368474603114522570496 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (2, 1), (5, 2), (6, 1), (16, 1)],
  term ((1587054088579161602881111813158424684237301557261285248 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (2, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0008_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0008
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0009 : Poly :=
[
  term ((2395348090186710010077976512929816365805338483712 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0009 : Poly :=
[
  term ((4790696180373420020155953025859632731610676967424 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2395348090186710010077976512929816365805338483712 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0009_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0009
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0010 : Poly :=
[
  term ((-10303034249895526634871023211607635207164251230592 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0010 : Poly :=
[
  term ((-20606068499791053269742046423215270414328502461184 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((10303034249895526634871023211607635207164251230592 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0010_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0010
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0011 : Poly :=
[
  term ((314851748965450615668901123188379330631155061584736 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0011 : Poly :=
[
  term ((629703497930901231337802246376758661262310123169472 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-314851748965450615668901123188379330631155061584736 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0011_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0011
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0012 : Poly :=
[
  term ((-1105891170603883368062067985949746053058870639942182010048 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0012 : Poly :=
[
  term ((-2211782341207766736124135971899492106117741279884364020096 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1105891170603883368062067985949746053058870639942182010048 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0012_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0012
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0013 : Poly :=
[
  term ((1583148718515425506055860612576451546743681410900524047184 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0013 : Poly :=
[
  term ((3166297437030851012111721225152903093487362821801048094368 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1583148718515425506055860612576451546743681410900524047184 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0013_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0013
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0014 : Poly :=
[
  term ((2789334272004376504100949316981141746289123940564129697968 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0014 : Poly :=
[
  term ((5578668544008753008201898633962283492578247881128259395936 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2789334272004376504100949316981141746289123940564129697968 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0014_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0014
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0015 : Poly :=
[
  term ((1587054088579161602881111813158424684237301557261285248 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 15 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0015 : Poly :=
[
  term ((3174108177158323205762223626316849368474603114522570496 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-1587054088579161602881111813158424684237301557261285248 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0015_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0015
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0016 : Poly :=
[
  term ((-139508375831861346975058859266093406523592218538384973984 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0016 : Poly :=
[
  term ((-279016751663722693950117718532186813047184437076769947968 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((139508375831861346975058859266093406523592218538384973984 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0016_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0016
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0017 : Poly :=
[
  term ((58269497629456203383695798147831256543710284707380713184 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0017 : Poly :=
[
  term ((116538995258912406767391596295662513087420569414761426368 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-58269497629456203383695798147831256543710284707380713184 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0017_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0017
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0018 : Poly :=
[
  term ((78318892700304714812116876884327148011951042070086032704 : Rat) / 7792080197214304916331339474573562704896940052538359825) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0018 : Poly :=
[
  term ((156637785400609429624233753768654296023902084140172065408 : Rat) / 7792080197214304916331339474573562704896940052538359825) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-78318892700304714812116876884327148011951042070086032704 : Rat) / 7792080197214304916331339474573562704896940052538359825) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0018_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0018
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0019 : Poly :=
[
  term ((-23267951362805142142430927012478694405629431995392 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 19 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0019 : Poly :=
[
  term ((-46535902725610284284861854024957388811258863990784 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((23267951362805142142430927012478694405629431995392 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (3, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0019_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0019
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0020 : Poly :=
[
  term ((9370879208723264715433846093098148346085195577588851104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 20 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0020 : Poly :=
[
  term ((18741758417446529430867692186196296692170391155177702208 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-9370879208723264715433846093098148346085195577588851104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0020_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0020
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0021 : Poly :=
[
  term ((-2395348090186710010077976512929816365805338483712 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0021 : Poly :=
[
  term ((-4790696180373420020155953025859632731610676967424 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((2395348090186710010077976512929816365805338483712 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0021_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0021
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0022 : Poly :=
[
  term ((10303034249895526634871023211607635207164251230592 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 22 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0022 : Poly :=
[
  term ((20606068499791053269742046423215270414328502461184 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-10303034249895526634871023211607635207164251230592 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0022_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0022
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0023 : Poly :=
[
  term ((-314851748965450615668901123188379330631155061584736 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0023 : Poly :=
[
  term ((-629703497930901231337802246376758661262310123169472 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((314851748965450615668901123188379330631155061584736 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0023_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0023
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0024 : Poly :=
[
  term ((-758124840259701400628174665416341200852100501023510470272 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0024 : Poly :=
[
  term ((-1516249680519402801256349330832682401704201002047020940544 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((758124840259701400628174665416341200852100501023510470272 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0024_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0024
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0025 : Poly :=
[
  term ((884079038370884410999860614613296763066243124701910329448 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0025 : Poly :=
[
  term ((1768158076741768821999721229226593526132486249403820658896 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-884079038370884410999860614613296763066243124701910329448 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0025_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0025
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0026 : Poly :=
[
  term ((3490197694513259782349956313132804890026268302141535645288 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0026 : Poly :=
[
  term ((6980395389026519564699912626265609780052536604283071290576 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3490197694513259782349956313132804890026268302141535645288 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0026_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0026
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0027 : Poly :=
[
  term ((-9770440712274272218911460592450865443936437192972355488 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 27 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0027 : Poly :=
[
  term ((-19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((9770440712274272218911460592450865443936437192972355488 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0027_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0027
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0028 : Poly :=
[
  term ((30834893037723885990643436108356996564800806417216101952 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 28 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0028 : Poly :=
[
  term ((61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-30834893037723885990643436108356996564800806417216101952 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0028_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0028
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0029 : Poly :=
[
  term ((-693803713493304973801467662338907729407417608704658901664 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0029 : Poly :=
[
  term ((-1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((693803713493304973801467662338907729407417608704658901664 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0029_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0029
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0030 : Poly :=
[
  term ((-2751538409339363010567019641985773212023168176045174272 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (4, 1), (5, 2), (16, 1)]
]

/-- Partial product 30 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0030 : Poly :=
[
  term ((-5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (4, 1), (5, 2), (6, 1), (16, 1)],
  term ((2751538409339363010567019641985773212023168176045174272 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (4, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0030_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0030
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0031 : Poly :=
[
  term ((-23267951362805142142430927012478694405629431995392 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 31 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0031 : Poly :=
[
  term ((-46535902725610284284861854024957388811258863990784 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((23267951362805142142430927012478694405629431995392 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0031_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0031
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0032 : Poly :=
[
  term ((-139508375831861346975058859266093406523592218538384973984 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0032 : Poly :=
[
  term ((-279016751663722693950117718532186813047184437076769947968 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((139508375831861346975058859266093406523592218538384973984 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0032_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0032
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0033 : Poly :=
[
  term ((165734612045345661459656031415799161907959774962783837024 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 33 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0033 : Poly :=
[
  term ((331469224090691322919312062831598323815919549925567674048 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-165734612045345661459656031415799161907959774962783837024 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0033_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0033
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0034 : Poly :=
[
  term ((-18278990790514414670379048681369550760313210096158064512 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0034 : Poly :=
[
  term ((-36557981581028829340758097362739101520626420192316129024 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((18278990790514414670379048681369550760313210096158064512 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0034_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0034
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0035 : Poly :=
[
  term ((1587054088579161602881111813158424684237301557261285248 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (5, 2), (16, 1)]
]

/-- Partial product 35 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0035 : Poly :=
[
  term ((3174108177158323205762223626316849368474603114522570496 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((-1587054088579161602881111813158424684237301557261285248 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0035_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0035
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0036 : Poly :=
[
  term ((-2395348090186710010077976512929816365805338483712 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0036 : Poly :=
[
  term ((-4790696180373420020155953025859632731610676967424 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((2395348090186710010077976512929816365805338483712 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0036_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0036
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0037 : Poly :=
[
  term ((10303034249895526634871023211607635207164251230592 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 37 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0037 : Poly :=
[
  term ((20606068499791053269742046423215270414328502461184 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-10303034249895526634871023211607635207164251230592 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0037_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0037
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0038 : Poly :=
[
  term ((-314851748965450615668901123188379330631155061584736 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0038 : Poly :=
[
  term ((-629703497930901231337802246376758661262310123169472 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((314851748965450615668901123188379330631155061584736 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0038_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0038
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0039 : Poly :=
[
  term ((19506474265496189233291606258832245259525618182784 : Rat) / 29440651750971435056206958695923725930400098937525) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 39 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0039 : Poly :=
[
  term ((39012948530992378466583212517664490519051236365568 : Rat) / 29440651750971435056206958695923725930400098937525) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19506474265496189233291606258832245259525618182784 : Rat) / 29440651750971435056206958695923725930400098937525) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0039_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0039
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0040 : Poly :=
[
  term ((1105891170603883368062067985949746053058870639942182010048 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0040 : Poly :=
[
  term ((2211782341207766736124135971899492106117741279884364020096 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1105891170603883368062067985949746053058870639942182010048 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0040_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0040
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0041 : Poly :=
[
  term ((-4589584491899669734590083173377255402588048656500702574512 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0041 : Poly :=
[
  term ((-9179168983799339469180166346754510805176097313001405149024 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((4589584491899669734590083173377255402588048656500702574512 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0041_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0041
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0042 : Poly :=
[
  term ((-2789334272004376504100949316981141746289123940564129697968 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 42 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0042 : Poly :=
[
  term ((-5578668544008753008201898633962283492578247881128259395936 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((2789334272004376504100949316981141746289123940564129697968 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0042_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0042
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0043 : Poly :=
[
  term ((-4298659365357178488286942365636413980838711866244575296 : Rat) / 222630862777551569038038270702101791568484001501095995) [(1, 1), (2, 1), (5, 1), (16, 1)]
]

/-- Partial product 43 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0043 : Poly :=
[
  term ((-8597318730714356976573884731272827961677423732489150592 : Rat) / 222630862777551569038038270702101791568484001501095995) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term ((4298659365357178488286942365636413980838711866244575296 : Rat) / 222630862777551569038038270702101791568484001501095995) [(1, 1), (2, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0043_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0043
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0044 : Poly :=
[
  term ((30490009896782397317656015311423586683291530720804685472 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0044 : Poly :=
[
  term ((60980019793564794635312030622847173366583061441609370944 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((-30490009896782397317656015311423586683291530720804685472 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0044_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0044
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0045 : Poly :=
[
  term ((-47875811360817061829365454882900643898230966575776352944 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0045 : Poly :=
[
  term ((-95751622721634123658730909765801287796461933151552705888 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((47875811360817061829365454882900643898230966575776352944 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (2, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0045_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0045
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0046 : Poly :=
[
  term ((-1534839820503964907700276057720903501891990842597546038448 : Rat) / 70128721774928744246982055271162064344072460472845238425) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0046 : Poly :=
[
  term ((-3069679641007929815400552115441807003783981685195092076896 : Rat) / 70128721774928744246982055271162064344072460472845238425) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((1534839820503964907700276057720903501891990842597546038448 : Rat) / 70128721774928744246982055271162064344072460472845238425) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0046_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0046
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0047 : Poly :=
[
  term ((9370879208723264715433846093098148346085195577588851104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (2, 2), (5, 1), (16, 1)]
]

/-- Partial product 47 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0047 : Poly :=
[
  term ((18741758417446529430867692186196296692170391155177702208 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (2, 2), (5, 1), (6, 1), (16, 1)],
  term ((-9370879208723264715433846093098148346085195577588851104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (2, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0047_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0047
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0048 : Poly :=
[
  term ((-758124840259701400628174665416341200852100501023510470272 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(1, 1), (2, 2), (11, 1), (16, 1)]
]

/-- Partial product 48 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0048 : Poly :=
[
  term ((-1516249680519402801256349330832682401704201002047020940544 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((758124840259701400628174665416341200852100501023510470272 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(1, 1), (2, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0048_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0048
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0049 : Poly :=
[
  term ((884079038370884410999860614613296763066243124701910329448 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(1, 1), (2, 2), (13, 1), (16, 1)]
]

/-- Partial product 49 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0049 : Poly :=
[
  term ((1768158076741768821999721229226593526132486249403820658896 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((-884079038370884410999860614613296763066243124701910329448 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(1, 1), (2, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0049_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0049
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0050 : Poly :=
[
  term ((3490197694513259782349956313132804890026268302141535645288 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0050 : Poly :=
[
  term ((6980395389026519564699912626265609780052536604283071290576 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-3490197694513259782349956313132804890026268302141535645288 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (2, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0050_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0050
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0051 : Poly :=
[
  term ((-5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 51 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0051 : Poly :=
[
  term ((-11006153637357452042268078567943092848092672704180697088 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0051_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0051
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0052 : Poly :=
[
  term ((-19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 52 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0052 : Poly :=
[
  term ((-39081762849097088875645842369803461775745748771889421952 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0052_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0052
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0053 : Poly :=
[
  term ((61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 53 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0053 : Poly :=
[
  term ((123339572150895543962573744433427986259203225668864407808 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0053_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0053
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0054 : Poly :=
[
  term ((-1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0054 : Poly :=
[
  term ((-2775214853973219895205870649355630917629670434818635606656 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0054_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0054
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0055 : Poly :=
[
  term ((2751538409339363010567019641985773212023168176045174272 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 2), (5, 1), (16, 1)]
]

/-- Partial product 55 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0055 : Poly :=
[
  term ((5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 2), (5, 1), (6, 1), (16, 1)],
  term ((-2751538409339363010567019641985773212023168176045174272 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 2), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0055_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0055
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0056 : Poly :=
[
  term ((9770440712274272218911460592450865443936437192972355488 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 2), (11, 1), (16, 1)]
]

/-- Partial product 56 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0056 : Poly :=
[
  term ((19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((-9770440712274272218911460592450865443936437192972355488 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0056_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0056
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0057 : Poly :=
[
  term ((-30834893037723885990643436108356996564800806417216101952 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 2), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0057 : Poly :=
[
  term ((-61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((30834893037723885990643436108356996564800806417216101952 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0057_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0057
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0058 : Poly :=
[
  term ((693803713493304973801467662338907729407417608704658901664 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 2), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0058 : Poly :=
[
  term ((1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-693803713493304973801467662338907729407417608704658901664 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0058_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0058
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0059 : Poly :=
[
  term ((5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 59 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0059 : Poly :=
[
  term ((11006153637357452042268078567943092848092672704180697088 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0059_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0059
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0060 : Poly :=
[
  term ((-232165004843899021576278480253645391753021350071834689984 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 60 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0060 : Poly :=
[
  term ((-464330009687798043152556960507290783506042700143669379968 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((232165004843899021576278480253645391753021350071834689984 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0060_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0060
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0061 : Poly :=
[
  term ((12687980077862650913485863062512734943678795542430021024 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 61 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0061 : Poly :=
[
  term ((25375960155725301826971726125025469887357591084860042048 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-12687980077862650913485863062512734943678795542430021024 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0061_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0061
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0062 : Poly :=
[
  term ((19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 62 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0062 : Poly :=
[
  term ((39081762849097088875645842369803461775745748771889421952 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0062_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0062
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0063 : Poly :=
[
  term ((-61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 63 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0063 : Poly :=
[
  term ((-123339572150895543962573744433427986259203225668864407808 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0063_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0063
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0064 : Poly :=
[
  term ((1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0064 : Poly :=
[
  term ((2775214853973219895205870649355630917629670434818635606656 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0064_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0064
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0065 : Poly :=
[
  term ((-74499671629120591053582810750805111900689753553288592752 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 65 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0065 : Poly :=
[
  term ((-148999343258241182107165621501610223801379507106577185504 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((74499671629120591053582810750805111900689753553288592752 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0065_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0065
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0066 : Poly :=
[
  term ((-67734782532330189617209135486711352664005646450578501792 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 66 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0066 : Poly :=
[
  term ((-135469565064660379234418270973422705328011292901157003584 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((67734782532330189617209135486711352664005646450578501792 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(1, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0066_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0066
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0067 : Poly :=
[
  term ((-5563991597997592835783883895503442747721267837669865824032 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0067 : Poly :=
[
  term ((-11127983195995185671567767791006885495442535675339731648064 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((5563991597997592835783883895503442747721267837669865824032 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0067_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0067
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0068 : Poly :=
[
  term ((-75980623243572375489667355695923776104995860078165155054112 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0068 : Poly :=
[
  term ((-151961246487144750979334711391847552209991720156330310108224 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((75980623243572375489667355695923776104995860078165155054112 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0068_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0068
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0069 : Poly :=
[
  term ((243406279089638925527019879164485077335640308892949277944 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 69 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0069 : Poly :=
[
  term ((486812558179277851054039758328970154671280617785898555888 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((-243406279089638925527019879164485077335640308892949277944 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0069_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0069
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0070 : Poly :=
[
  term ((477643952061110626333085128081487528048164274268037258968 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0070 : Poly :=
[
  term ((955287904122221252666170256162975056096328548536074517936 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-477643952061110626333085128081487528048164274268037258968 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0070_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0070
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0071 : Poly :=
[
  term ((55158048937178661829796267066883952599249379770816420064 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 71 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0071 : Poly :=
[
  term ((110316097874357323659592534133767905198498759541632840128 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-55158048937178661829796267066883952599249379770816420064 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0071_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0071
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0072 : Poly :=
[
  term ((-4182770748885165384046390904784396269673424948618365176 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 72 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0072 : Poly :=
[
  term ((-8365541497770330768092781809568792539346849897236730352 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((4182770748885165384046390904784396269673424948618365176 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0072_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0072
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0073 : Poly :=
[
  term ((2623910519148836517674020761314694499590825231881380127768 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0073 : Poly :=
[
  term ((5247821038297673035348041522629388999181650463762760255536 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-2623910519148836517674020761314694499590825231881380127768 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0073_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0073
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0074 : Poly :=
[
  term ((17640175658994048527525599781338136295613042022339341187632 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0074 : Poly :=
[
  term ((35280351317988097055051199562676272591226084044678682375264 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-17640175658994048527525599781338136295613042022339341187632 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0074_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0074
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0075 : Poly :=
[
  term ((-89909656201763947584188668979160065706443130039909034592 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 75 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0075 : Poly :=
[
  term ((-179819312403527895168377337958320131412886260079818069184 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((89909656201763947584188668979160065706443130039909034592 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0075_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0075
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0076 : Poly :=
[
  term ((2415631401936582519225030248050428265229195319740801984 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 76 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0076 : Poly :=
[
  term ((4831262803873165038450060496100856530458390639481603968 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((-2415631401936582519225030248050428265229195319740801984 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0076_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0076
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0077 : Poly :=
[
  term ((939454671567932732706547864889290089751443141566436978724 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 77 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0077 : Poly :=
[
  term ((1878909343135865465413095729778580179502886283132873957448 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-939454671567932732706547864889290089751443141566436978724 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0077_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0077
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0078 : Poly :=
[
  term ((155774736055567593871981104093474950689471486796077088744 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 78 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0078 : Poly :=
[
  term ((311549472111135187743962208186949901378942973592154177488 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-155774736055567593871981104093474950689471486796077088744 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0078_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0078
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0079 : Poly :=
[
  term ((-768685982234066651104386133345269517707237375262943040712 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 79 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0079 : Poly :=
[
  term ((-1537371964468133302208772266690539035414474750525886081424 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((768685982234066651104386133345269517707237375262943040712 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0079_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0079
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0080 : Poly :=
[
  term ((-29187226666113387747370042078547526204692347603384272553808 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 80 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0080 : Poly :=
[
  term ((-58374453332226775494740084157095052409384695206768545107616 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((29187226666113387747370042078547526204692347603384272553808 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0080_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0080
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0081 : Poly :=
[
  term ((3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

/-- Partial product 81 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0081 : Poly :=
[
  term ((6667787935358030179658762860529260606898426802486904 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0081_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0081
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0082 : Poly :=
[
  term ((-61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 82 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0082 : Poly :=
[
  term ((-122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0082_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0082
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0083 : Poly :=
[
  term ((-371648381987436488281199061463140186215011787586803327584 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 83 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0083 : Poly :=
[
  term ((-743296763974872976562398122926280372430023575173606655168 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((371648381987436488281199061463140186215011787586803327584 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0083_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0083
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0084 : Poly :=
[
  term ((1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 84 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0084 : Poly :=
[
  term ((2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0084_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0084
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0085 : Poly :=
[
  term ((5675647433955134642642429861482708089476591577667807961696 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0085 : Poly :=
[
  term ((11351294867910269285284859722965416178953183155335615923392 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5675647433955134642642429861482708089476591577667807961696 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0085_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0085
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0086 : Poly :=
[
  term ((455886520663030797595706457656158839009696734731344781708 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

/-- Partial product 86 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0086 : Poly :=
[
  term ((911773041326061595191412915312317678019393469462689563416 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-455886520663030797595706457656158839009696734731344781708 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0086_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0086
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0087 : Poly :=
[
  term ((3658790560814870824049211783560209610887179578587251577628 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0087 : Poly :=
[
  term ((7317581121629741648098423567120419221774359157174503155256 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3658790560814870824049211783560209610887179578587251577628 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0087_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0087
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0088 : Poly :=
[
  term ((36188249844658901336072441820359374610354944327566187264 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 88 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0088 : Poly :=
[
  term ((72376499689317802672144883640718749220709888655132374528 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-36188249844658901336072441820359374610354944327566187264 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0088_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0088
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0089 : Poly :=
[
  term ((-3837965746796761410185829048469463566914069748837785712 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 89 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0089 : Poly :=
[
  term ((-7675931493593522820371658096938927133828139497675571424 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((3837965746796761410185829048469463566914069748837785712 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0089_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0089
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0090 : Poly :=
[
  term ((-16807481956129741476898894374730533062887383079153621504 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 90 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0090 : Poly :=
[
  term ((-33614963912259482953797788749461066125774766158307243008 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((16807481956129741476898894374730533062887383079153621504 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0090_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0090
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0091 : Poly :=
[
  term ((30013457651548624637609595819540010947108149493241667488 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0091 : Poly :=
[
  term ((60026915303097249275219191639080021894216298986483334976 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-30013457651548624637609595819540010947108149493241667488 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0091_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0091
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0092 : Poly :=
[
  term ((1342326736666181054023717386340730485283175845810049408 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(2, 1), (4, 1), (5, 2), (16, 1)]
]

/-- Partial product 92 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0092 : Poly :=
[
  term ((2684653473332362108047434772681460970566351691620098816 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(2, 1), (4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-1342326736666181054023717386340730485283175845810049408 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(2, 1), (4, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0092_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0092
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0093 : Poly :=
[
  term ((14788032484724617642646291291284574229744174533244147904 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 93 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0093 : Poly :=
[
  term ((29576064969449235285292582582569148459488349066488295808 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-14788032484724617642646291291284574229744174533244147904 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0093_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0093
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0094 : Poly :=
[
  term ((2841171023594486357301875159495399210206883511393283251584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 94 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0094 : Poly :=
[
  term ((5682342047188972714603750318990798420413767022786566503168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2841171023594486357301875159495399210206883511393283251584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0094_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0094
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0095 : Poly :=
[
  term ((1786306935665669820892137378554848530387455324535920510752 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0095 : Poly :=
[
  term ((3572613871331339641784274757109697060774910649071841021504 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1786306935665669820892137378554848530387455324535920510752 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0095_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0095
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0096 : Poly :=
[
  term ((-33149287883619578066920210825822059898723381327754852176 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0096 : Poly :=
[
  term ((-66298575767239156133840421651644119797446762655509704352 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((33149287883619578066920210825822059898723381327754852176 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0096_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0096
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0097 : Poly :=
[
  term ((657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 97 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0097 : Poly :=
[
  term ((1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0097_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0097
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0098 : Poly :=
[
  term ((-657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

/-- Partial product 98 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0098 : Poly :=
[
  term ((-1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0098_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0098
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 16. -/
def rs_R013_ueqv_R013NYYN_coefficient_16_0099 : Poly :=
[
  term ((2415631401936582519225030248050428265229195319740801984 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 99 for generator 16. -/
def rs_R013_ueqv_R013NYYN_partial_16_0099 : Poly :=
[
  term ((-2415631401936582519225030248050428265229195319740801984 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((4831262803873165038450060496100856530458390639481603968 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (6, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 16. -/
theorem rs_R013_ueqv_R013NYYN_partial_16_0099_valid :
    mulPoly rs_R013_ueqv_R013NYYN_coefficient_16_0099
        rs_R013_ueqv_R013NYYN_generator_16_0000_0099 =
      rs_R013_ueqv_R013NYYN_partial_16_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NYYN_partials_16_0000_0099 : List Poly :=
[
  rs_R013_ueqv_R013NYYN_partial_16_0000,
  rs_R013_ueqv_R013NYYN_partial_16_0001,
  rs_R013_ueqv_R013NYYN_partial_16_0002,
  rs_R013_ueqv_R013NYYN_partial_16_0003,
  rs_R013_ueqv_R013NYYN_partial_16_0004,
  rs_R013_ueqv_R013NYYN_partial_16_0005,
  rs_R013_ueqv_R013NYYN_partial_16_0006,
  rs_R013_ueqv_R013NYYN_partial_16_0007,
  rs_R013_ueqv_R013NYYN_partial_16_0008,
  rs_R013_ueqv_R013NYYN_partial_16_0009,
  rs_R013_ueqv_R013NYYN_partial_16_0010,
  rs_R013_ueqv_R013NYYN_partial_16_0011,
  rs_R013_ueqv_R013NYYN_partial_16_0012,
  rs_R013_ueqv_R013NYYN_partial_16_0013,
  rs_R013_ueqv_R013NYYN_partial_16_0014,
  rs_R013_ueqv_R013NYYN_partial_16_0015,
  rs_R013_ueqv_R013NYYN_partial_16_0016,
  rs_R013_ueqv_R013NYYN_partial_16_0017,
  rs_R013_ueqv_R013NYYN_partial_16_0018,
  rs_R013_ueqv_R013NYYN_partial_16_0019,
  rs_R013_ueqv_R013NYYN_partial_16_0020,
  rs_R013_ueqv_R013NYYN_partial_16_0021,
  rs_R013_ueqv_R013NYYN_partial_16_0022,
  rs_R013_ueqv_R013NYYN_partial_16_0023,
  rs_R013_ueqv_R013NYYN_partial_16_0024,
  rs_R013_ueqv_R013NYYN_partial_16_0025,
  rs_R013_ueqv_R013NYYN_partial_16_0026,
  rs_R013_ueqv_R013NYYN_partial_16_0027,
  rs_R013_ueqv_R013NYYN_partial_16_0028,
  rs_R013_ueqv_R013NYYN_partial_16_0029,
  rs_R013_ueqv_R013NYYN_partial_16_0030,
  rs_R013_ueqv_R013NYYN_partial_16_0031,
  rs_R013_ueqv_R013NYYN_partial_16_0032,
  rs_R013_ueqv_R013NYYN_partial_16_0033,
  rs_R013_ueqv_R013NYYN_partial_16_0034,
  rs_R013_ueqv_R013NYYN_partial_16_0035,
  rs_R013_ueqv_R013NYYN_partial_16_0036,
  rs_R013_ueqv_R013NYYN_partial_16_0037,
  rs_R013_ueqv_R013NYYN_partial_16_0038,
  rs_R013_ueqv_R013NYYN_partial_16_0039,
  rs_R013_ueqv_R013NYYN_partial_16_0040,
  rs_R013_ueqv_R013NYYN_partial_16_0041,
  rs_R013_ueqv_R013NYYN_partial_16_0042,
  rs_R013_ueqv_R013NYYN_partial_16_0043,
  rs_R013_ueqv_R013NYYN_partial_16_0044,
  rs_R013_ueqv_R013NYYN_partial_16_0045,
  rs_R013_ueqv_R013NYYN_partial_16_0046,
  rs_R013_ueqv_R013NYYN_partial_16_0047,
  rs_R013_ueqv_R013NYYN_partial_16_0048,
  rs_R013_ueqv_R013NYYN_partial_16_0049,
  rs_R013_ueqv_R013NYYN_partial_16_0050,
  rs_R013_ueqv_R013NYYN_partial_16_0051,
  rs_R013_ueqv_R013NYYN_partial_16_0052,
  rs_R013_ueqv_R013NYYN_partial_16_0053,
  rs_R013_ueqv_R013NYYN_partial_16_0054,
  rs_R013_ueqv_R013NYYN_partial_16_0055,
  rs_R013_ueqv_R013NYYN_partial_16_0056,
  rs_R013_ueqv_R013NYYN_partial_16_0057,
  rs_R013_ueqv_R013NYYN_partial_16_0058,
  rs_R013_ueqv_R013NYYN_partial_16_0059,
  rs_R013_ueqv_R013NYYN_partial_16_0060,
  rs_R013_ueqv_R013NYYN_partial_16_0061,
  rs_R013_ueqv_R013NYYN_partial_16_0062,
  rs_R013_ueqv_R013NYYN_partial_16_0063,
  rs_R013_ueqv_R013NYYN_partial_16_0064,
  rs_R013_ueqv_R013NYYN_partial_16_0065,
  rs_R013_ueqv_R013NYYN_partial_16_0066,
  rs_R013_ueqv_R013NYYN_partial_16_0067,
  rs_R013_ueqv_R013NYYN_partial_16_0068,
  rs_R013_ueqv_R013NYYN_partial_16_0069,
  rs_R013_ueqv_R013NYYN_partial_16_0070,
  rs_R013_ueqv_R013NYYN_partial_16_0071,
  rs_R013_ueqv_R013NYYN_partial_16_0072,
  rs_R013_ueqv_R013NYYN_partial_16_0073,
  rs_R013_ueqv_R013NYYN_partial_16_0074,
  rs_R013_ueqv_R013NYYN_partial_16_0075,
  rs_R013_ueqv_R013NYYN_partial_16_0076,
  rs_R013_ueqv_R013NYYN_partial_16_0077,
  rs_R013_ueqv_R013NYYN_partial_16_0078,
  rs_R013_ueqv_R013NYYN_partial_16_0079,
  rs_R013_ueqv_R013NYYN_partial_16_0080,
  rs_R013_ueqv_R013NYYN_partial_16_0081,
  rs_R013_ueqv_R013NYYN_partial_16_0082,
  rs_R013_ueqv_R013NYYN_partial_16_0083,
  rs_R013_ueqv_R013NYYN_partial_16_0084,
  rs_R013_ueqv_R013NYYN_partial_16_0085,
  rs_R013_ueqv_R013NYYN_partial_16_0086,
  rs_R013_ueqv_R013NYYN_partial_16_0087,
  rs_R013_ueqv_R013NYYN_partial_16_0088,
  rs_R013_ueqv_R013NYYN_partial_16_0089,
  rs_R013_ueqv_R013NYYN_partial_16_0090,
  rs_R013_ueqv_R013NYYN_partial_16_0091,
  rs_R013_ueqv_R013NYYN_partial_16_0092,
  rs_R013_ueqv_R013NYYN_partial_16_0093,
  rs_R013_ueqv_R013NYYN_partial_16_0094,
  rs_R013_ueqv_R013NYYN_partial_16_0095,
  rs_R013_ueqv_R013NYYN_partial_16_0096,
  rs_R013_ueqv_R013NYYN_partial_16_0097,
  rs_R013_ueqv_R013NYYN_partial_16_0098,
  rs_R013_ueqv_R013NYYN_partial_16_0099
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NYYN_block_16_0000_0099 : Poly :=
[
  term ((-18741758417446529430867692186196296692170391155177702208 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((9370879208723264715433846093098148346085195577588851104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((1516249680519402801256349330832682401704201002047020940544 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-1768158076741768821999721229226593526132486249403820658896 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-6980395389026519564699912626265609780052536604283071290576 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-758124840259701400628174665416341200852100501023510470272 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((884079038370884410999860614613296763066243124701910329448 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((3490197694513259782349956313132804890026268302141535645288 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((46535902725610284284861854024957388811258863990784 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((279016751663722693950117718532186813047184437076769947968 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-116538995258912406767391596295662513087420569414761426368 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (2, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((36557981581028829340758097362739101520626420192316129024 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (2, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-23267951362805142142430927012478694405629431995392 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-139508375831861346975058859266093406523592218538384973984 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((58269497629456203383695798147831256543710284707380713184 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-18278990790514414670379048681369550760313210096158064512 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-3174108177158323205762223626316849368474603114522570496 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (2, 1), (5, 2), (6, 1), (16, 1)],
  term ((1587054088579161602881111813158424684237301557261285248 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (2, 1), (5, 2), (16, 1)],
  term ((4790696180373420020155953025859632731610676967424 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-20606068499791053269742046423215270414328502461184 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((629703497930901231337802246376758661262310123169472 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2211782341207766736124135971899492106117741279884364020096 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3166297437030851012111721225152903093487362821801048094368 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((5578668544008753008201898633962283492578247881128259395936 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-2395348090186710010077976512929816365805338483712 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term ((10303034249895526634871023211607635207164251230592 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-314851748965450615668901123188379330631155061584736 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((1105891170603883368062067985949746053058870639942182010048 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1583148718515425506055860612576451546743681410900524047184 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2789334272004376504100949316981141746289123940564129697968 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term ((3174108177158323205762223626316849368474603114522570496 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-1587054088579161602881111813158424684237301557261285248 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-279016751663722693950117718532186813047184437076769947968 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((116538995258912406767391596295662513087420569414761426368 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((156637785400609429624233753768654296023902084140172065408 : Rat) / 7792080197214304916331339474573562704896940052538359825) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((139508375831861346975058859266093406523592218538384973984 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-58269497629456203383695798147831256543710284707380713184 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-78318892700304714812116876884327148011951042070086032704 : Rat) / 7792080197214304916331339474573562704896940052538359825) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-46535902725610284284861854024957388811258863990784 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((18741758417446529430867692186196296692170391155177702208 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((23267951362805142142430927012478694405629431995392 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-9370879208723264715433846093098148346085195577588851104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (3, 1), (5, 1), (16, 1)],
  term ((-4790696180373420020155953025859632731610676967424 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((20606068499791053269742046423215270414328502461184 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-629703497930901231337802246376758661262310123169472 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1516249680519402801256349330832682401704201002047020940544 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((1768158076741768821999721229226593526132486249403820658896 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((6980395389026519564699912626265609780052536604283071290576 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((2395348090186710010077976512929816365805338483712 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-10303034249895526634871023211607635207164251230592 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((314851748965450615668901123188379330631155061584736 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((758124840259701400628174665416341200852100501023510470272 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (3, 1), (11, 1), (16, 1)],
  term ((-884079038370884410999860614613296763066243124701910329448 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (3, 1), (13, 1), (16, 1)],
  term ((-3490197694513259782349956313132804890026268302141535645288 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(0, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((9770440712274272218911460592450865443936437192972355488 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-30834893037723885990643436108356996564800806417216101952 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((693803713493304973801467662338907729407417608704658901664 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (4, 1), (5, 2), (6, 1), (16, 1)],
  term ((2751538409339363010567019641985773212023168176045174272 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(0, 1), (4, 1), (5, 2), (16, 1)],
  term ((-46535902725610284284861854024957388811258863990784 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-279016751663722693950117718532186813047184437076769947968 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((331469224090691322919312062831598323815919549925567674048 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-36557981581028829340758097362739101520626420192316129024 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((23267951362805142142430927012478694405629431995392 : Rat) / 22898284695200005043716523430162897945866743618075) [(0, 1), (5, 1), (9, 1), (16, 1)],
  term ((139508375831861346975058859266093406523592218538384973984 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-165734612045345661459656031415799161907959774962783837024 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(0, 1), (5, 1), (13, 1), (16, 1)],
  term ((18278990790514414670379048681369550760313210096158064512 : Rat) / 1558416039442860983266267894914712540979388010507671965) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((3174108177158323205762223626316849368474603114522570496 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((-1587054088579161602881111813158424684237301557261285248 : Rat) / 222630862777551569038038270702101791568484001501095995) [(0, 1), (5, 2), (16, 1)],
  term ((-4790696180373420020155953025859632731610676967424 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((20606068499791053269742046423215270414328502461184 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-629703497930901231337802246376758661262310123169472 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((39012948530992378466583212517664490519051236365568 : Rat) / 29440651750971435056206958695923725930400098937525) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((2211782341207766736124135971899492106117741279884364020096 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9179168983799339469180166346754510805176097313001405149024 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5578668544008753008201898633962283492578247881128259395936 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((2395348090186710010077976512929816365805338483712 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10303034249895526634871023211607635207164251230592 : Rat) / 9813550583657145018735652898641241976800032979175) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term ((314851748965450615668901123188379330631155061584736 : Rat) / 480863978599200105918046992033420856863201615979575) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19506474265496189233291606258832245259525618182784 : Rat) / 29440651750971435056206958695923725930400098937525) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1105891170603883368062067985949746053058870639942182010048 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((4589584491899669734590083173377255402588048656500702574512 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((2789334272004376504100949316981141746289123940564129697968 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(0, 1), (15, 2), (16, 1)],
  term ((-8597318730714356976573884731272827961677423732489150592 : Rat) / 222630862777551569038038270702101791568484001501095995) [(1, 1), (2, 1), (5, 1), (6, 1), (16, 1)],
  term ((4298659365357178488286942365636413980838711866244575296 : Rat) / 222630862777551569038038270702101791568484001501095995) [(1, 1), (2, 1), (5, 1), (16, 1)],
  term ((60980019793564794635312030622847173366583061441609370944 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(1, 1), (2, 1), (6, 1), (11, 1), (16, 1)],
  term ((-95751622721634123658730909765801287796461933151552705888 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (2, 1), (6, 1), (13, 1), (16, 1)],
  term ((-3069679641007929815400552115441807003783981685195092076896 : Rat) / 70128721774928744246982055271162064344072460472845238425) [(1, 1), (2, 1), (6, 1), (15, 1), (16, 1)],
  term ((-30490009896782397317656015311423586683291530720804685472 : Rat) / 15016091455640215094911748256153923680224325904565447375) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((47875811360817061829365454882900643898230966575776352944 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((1534839820503964907700276057720903501891990842597546038448 : Rat) / 70128721774928744246982055271162064344072460472845238425) [(1, 1), (2, 1), (15, 1), (16, 1)],
  term ((18741758417446529430867692186196296692170391155177702208 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (2, 2), (5, 1), (6, 1), (16, 1)],
  term ((-9370879208723264715433846093098148346085195577588851104 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (2, 2), (5, 1), (16, 1)],
  term ((-1516249680519402801256349330832682401704201002047020940544 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(1, 1), (2, 2), (6, 1), (11, 1), (16, 1)],
  term ((1768158076741768821999721229226593526132486249403820658896 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(1, 1), (2, 2), (6, 1), (13, 1), (16, 1)],
  term ((6980395389026519564699912626265609780052536604283071290576 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((758124840259701400628174665416341200852100501023510470272 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-884079038370884410999860614613296763066243124701910329448 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((-3490197694513259782349956313132804890026268302141535645288 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-11006153637357452042268078567943092848092672704180697088 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 1), (5, 1), (16, 1)],
  term ((-39081762849097088875645842369803461775745748771889421952 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((123339572150895543962573744433427986259203225668864407808 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-2775214853973219895205870649355630917629670434818635606656 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 1), (15, 1), (16, 1)],
  term ((5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 2), (5, 1), (6, 1), (16, 1)],
  term ((-2751538409339363010567019641985773212023168176045174272 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((-61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-9770440712274272218911460592450865443936437192972355488 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((30834893037723885990643436108356996564800806417216101952 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-693803713493304973801467662338907729407417608704658901664 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((11006153637357452042268078567943092848092672704180697088 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-464330009687798043152556960507290783506042700143669379968 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((25375960155725301826971726125025469887357591084860042048 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-5503076818678726021134039283971546424046336352090348544 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (8, 1), (16, 1)],
  term ((232165004843899021576278480253645391753021350071834689984 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(1, 1), (5, 1), (12, 1), (16, 1)],
  term ((-12687980077862650913485863062512734943678795542430021024 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(1, 1), (5, 1), (16, 1)],
  term ((39081762849097088875645842369803461775745748771889421952 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-123339572150895543962573744433427986259203225668864407808 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((2775214853973219895205870649355630917629670434818635606656 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-148999343258241182107165621501610223801379507106577185504 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(1, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-135469565064660379234418270973422705328011292901157003584 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-11127983195995185671567767791006885495442535675339731648064 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-151961246487144750979334711391847552209991720156330310108224 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((486812558179277851054039758328970154671280617785898555888 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (6, 1), (13, 1), (16, 1)],
  term ((955287904122221252666170256162975056096328548536074517936 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-19540881424548544437822921184901730887872874385944710976 : Rat) / 30747234885358535670533579762600891345221238756967344625) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((61669786075447771981286872216713993129601612834432203904 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1387607426986609947602935324677815458814835217409317803328 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((74499671629120591053582810750805111900689753553288592752 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((67734782532330189617209135486711352664005646450578501792 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(1, 1), (11, 1), (16, 1)],
  term ((5563991597997592835783883895503442747721267837669865824032 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((75980623243572375489667355695923776104995860078165155054112 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-243406279089638925527019879164485077335640308892949277944 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (13, 1), (16, 1)],
  term ((-477643952061110626333085128081487528048164274268037258968 : Rat) / 38960400986071524581656697372867813524484700262691799125) [(1, 1), (15, 1), (16, 1)],
  term ((110316097874357323659592534133767905198498759541632840128 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-55158048937178661829796267066883952599249379770816420064 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-8365541497770330768092781809568792539346849897236730352 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((5247821038297673035348041522629388999181650463762760255536 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((35280351317988097055051199562676272591226084044678682375264 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((4182770748885165384046390904784396269673424948618365176 : Rat) / 43046128839501949938747011667641247883309734259754282475) [(2, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-2623910519148836517674020761314694499590825231881380127768 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (13, 1), (16, 1)],
  term ((-17640175658994048527525599781338136295613042022339341187632 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((-179819312403527895168377337958320131412886260079818069184 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((4831262803873165038450060496100856530458390639481603968 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (3, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((1878909343135865465413095729778580179502886283132873957448 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((89909656201763947584188668979160065706443130039909034592 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-2415631401936582519225030248050428265229195319740801984 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-939454671567932732706547864889290089751443141566436978724 : Rat) / 350643608874643721234910276355810321720362302364226192125) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((311549472111135187743962208186949901378942973592154177488 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1537371964468133302208772266690539035414474750525886081424 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-58374453332226775494740084157095052409384695206768545107616 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((6667787935358030179658762860529260606898426802486904 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-122085109100669842413957432814111209740138158382106421184 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-743296763974872976562398122926280372430023575173606655168 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((2329521244344793527639327899587019516423455902471358238048 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((11351294867910269285284859722965416178953183155335615923392 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((911773041326061595191412915312317678019393469462689563416 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((7317581121629741648098423567120419221774359157174503155256 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-155774736055567593871981104093474950689471486796077088744 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((768685982234066651104386133345269517707237375262943040712 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (8, 1), (13, 1), (16, 1)],
  term ((29187226666113387747370042078547526204692347603384272553808 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3333893967679015089829381430264630303449213401243452 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (3, 1), (9, 1), (16, 1)],
  term ((61042554550334921206978716407055604870069079191053210592 : Rat) / 215230644197509749693735058338206239416548671298771412375) [(2, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((371648381987436488281199061463140186215011787586803327584 : Rat) / 645691932592529249081205175014618718249646013896314237125) [(2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-1164760622172396763819663949793509758211727951235679119024 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5675647433955134642642429861482708089476591577667807961696 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-455886520663030797595706457656158839009696734731344781708 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (3, 1), (13, 1), (16, 1)],
  term ((-3658790560814870824049211783560209610887179578587251577628 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (3, 1), (15, 1), (16, 1)],
  term ((72376499689317802672144883640718749220709888655132374528 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-7675931493593522820371658096938927133828139497675571424 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-33614963912259482953797788749461066125774766158307243008 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((60026915303097249275219191639080021894216298986483334976 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-36188249844658901336072441820359374610354944327566187264 : Rat) / 3339462941663273535570574060531526873527260022516439925) [(2, 1), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((3837965746796761410185829048469463566914069748837785712 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((16807481956129741476898894374730533062887383079153621504 : Rat) / 50091944124949103033558610907972903102908900337746598875) [(2, 1), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-30013457651548624637609595819540010947108149493241667488 : Rat) / 116881202958214573744970092118603440573454100788075397375) [(2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((2684653473332362108047434772681460970566351691620098816 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(2, 1), (4, 1), (5, 2), (6, 1), (16, 1)],
  term ((-1342326736666181054023717386340730485283175845810049408 : Rat) / 1113154313887757845190191353510508957842420007505479975) [(2, 1), (4, 1), (5, 2), (16, 1)],
  term ((29576064969449235285292582582569148459488349066488295808 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((5682342047188972714603750318990798420413767022786566503168 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3572613871331339641784274757109697060774910649071841021504 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-66298575767239156133840421651644119797446762655509704352 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1315382006019844762326938591340581635718804239202432 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-14788032484724617642646291291284574229744174533244147904 : Rat) / 71743548065836583231245019446068746472182890432923804125) [(2, 1), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2841171023594486357301875159495399210206883511393283251584 : Rat) / 1051930826623931163704730829067430965161086907092678576375) [(2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1786306935665669820892137378554848530387455324535920510752 : Rat) / 150275832374847309100675832723918709308726701013239796625) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((33149287883619578066920210825822059898723381327754852176 : Rat) / 92241704656075607011600739287802674035663716270902033875) [(2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((657691003009922381163469295670290817859402119601216 : Rat) / 1442591935797600317754140976100262570589604847938725) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-2415631401936582519225030248050428265229195319740801984 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((4831262803873165038450060496100856530458390639481603968 : Rat) / 477066134523324790795796294361646696218180003216634275) [(2, 1), (5, 1), (6, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 0 through 99. -/
theorem rs_R013_ueqv_R013NYYN_block_16_0000_0099_valid :
    checkProductSumEq rs_R013_ueqv_R013NYYN_partials_16_0000_0099
      rs_R013_ueqv_R013NYYN_block_16_0000_0099 = true := by
  native_decide

end R013UeqvR013NYYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
