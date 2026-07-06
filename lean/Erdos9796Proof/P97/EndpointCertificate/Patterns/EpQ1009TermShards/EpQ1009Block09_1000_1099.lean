/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 9:1000-1099

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_09_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1000 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 21862830747804290112000872734472307445546425932084845046724608842188718834837864997198092416) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1000 for generator 9. -/
def ep_Q1_009_partial_09_1000 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 10931415373902145056000436367236153722773212966042422523362304421094359417418932498599046208) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 21862830747804290112000872734472307445546425932084845046724608842188718834837864997198092416) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 9. -/
theorem ep_Q1_009_partial_09_1000_valid :
    mulPoly ep_Q1_009_coefficient_09_1000
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1001 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 46504586408161354304257513063101760065444209581104288023187341248905239579172880998611520) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1)]
]

/-- Partial product 1001 for generator 9. -/
def ep_Q1_009_partial_09_1001 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 23252293204080677152128756531550880032722104790552144011593670624452619789586440499305760) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (9, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 46504586408161354304257513063101760065444209581104288023187341248905239579172880998611520) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 9. -/
theorem ep_Q1_009_partial_09_1001_valid :
    mulPoly ep_Q1_009_coefficient_09_1001
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1002 : Poly :=
[
  term ((-3436593723883885225446431471645248000 : Rat) / 42041507163349345751221942892884216689) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 1002 for generator 9. -/
def ep_Q1_009_partial_09_1002 : Poly :=
[
  term ((-6873187447767770450892862943290496000 : Rat) / 42041507163349345751221942892884216689) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((3436593723883885225446431471645248000 : Rat) / 42041507163349345751221942892884216689) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 9. -/
theorem ep_Q1_009_partial_09_1002_valid :
    mulPoly ep_Q1_009_coefficient_09_1002
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1003 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 25103727119928797160060582850172054004655602121530729223590273453037574996006510385617861783616) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 1003 for generator 9. -/
def ep_Q1_009_partial_09_1003 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 12551863559964398580030291425086027002327801060765364611795136726518787498003255192808930891808) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 25103727119928797160060582850172054004655602121530729223590273453037574996006510385617861783616) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 9. -/
theorem ep_Q1_009_partial_09_1003_valid :
    mulPoly ep_Q1_009_coefficient_09_1003
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1004 : Poly :=
[
  term ((-574030 : Rat) / 69343) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1004 for generator 9. -/
def ep_Q1_009_partial_09_1004 : Poly :=
[
  term ((-1148060 : Rat) / 69343) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((574030 : Rat) / 69343) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 9. -/
theorem ep_Q1_009_partial_09_1004_valid :
    mulPoly ep_Q1_009_coefficient_09_1004
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1005 : Poly :=
[
  term ((-438359079078049353188758746287821564013946914589860808329514028578585487792709217700579519119901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (5, 1), (6, 1), (8, 1)]
]

/-- Partial product 1005 for generator 9. -/
def ep_Q1_009_partial_09_1005 : Poly :=
[
  term ((-438359079078049353188758746287821564013946914589860808329514028578585487792709217700579519119901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (5, 1), (6, 1), (8, 1)],
  term ((438359079078049353188758746287821564013946914589860808329514028578585487792709217700579519119901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (5, 1), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 9. -/
theorem ep_Q1_009_partial_09_1005_valid :
    mulPoly ep_Q1_009_coefficient_09_1005
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1006 : Poly :=
[
  term ((2134608775932531241654439081355116 : Rat) / 30920451456251051055078653757943773) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2)]
]

/-- Partial product 1006 for generator 9. -/
def ep_Q1_009_partial_09_1006 : Poly :=
[
  term ((4269217551865062483308878162710232 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((-2134608775932531241654439081355116 : Rat) / 30920451456251051055078653757943773) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 9. -/
theorem ep_Q1_009_partial_09_1006_valid :
    mulPoly ep_Q1_009_coefficient_09_1006
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1007 : Poly :=
[
  term ((44078413356831377315030631380448323476636617068900848752013287553892716256817931375374924212576348337852017201290519 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 1007 for generator 9. -/
def ep_Q1_009_partial_09_1007 : Poly :=
[
  term ((44078413356831377315030631380448323476636617068900848752013287553892716256817931375374924212576348337852017201290519 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-44078413356831377315030631380448323476636617068900848752013287553892716256817931375374924212576348337852017201290519 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 9. -/
theorem ep_Q1_009_partial_09_1007_valid :
    mulPoly ep_Q1_009_coefficient_09_1007
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1008 : Poly :=
[
  term ((-9929692780031738430899 : Rat) / 1558779625948348837707) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1008 for generator 9. -/
def ep_Q1_009_partial_09_1008 : Poly :=
[
  term ((-19859385560063476861798 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((9929692780031738430899 : Rat) / 1558779625948348837707) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 9. -/
theorem ep_Q1_009_partial_09_1008_valid :
    mulPoly ep_Q1_009_coefficient_09_1008
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1009 : Poly :=
[
  term ((-774310973182644768716975550838560 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1009 for generator 9. -/
def ep_Q1_009_partial_09_1009 : Poly :=
[
  term ((-1548621946365289537433951101677120 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((774310973182644768716975550838560 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 9. -/
theorem ep_Q1_009_partial_09_1009_valid :
    mulPoly ep_Q1_009_coefficient_09_1009
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1010 : Poly :=
[
  term ((-152 : Rat) / 51) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 1010 for generator 9. -/
def ep_Q1_009_partial_09_1010 : Poly :=
[
  term ((-304 : Rat) / 51) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((152 : Rat) / 51) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 9. -/
theorem ep_Q1_009_partial_09_1010_valid :
    mulPoly ep_Q1_009_coefficient_09_1010
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1011 : Poly :=
[
  term ((414530879200720597164876063108362712562813428034068392179589465781125468990375486164874206164476771 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(3, 1), (5, 1), (6, 1), (15, 2)]
]

/-- Partial product 1011 for generator 9. -/
def ep_Q1_009_partial_09_1011 : Poly :=
[
  term ((414530879200720597164876063108362712562813428034068392179589465781125468990375486164874206164476771 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-414530879200720597164876063108362712562813428034068392179589465781125468990375486164874206164476771 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(3, 1), (5, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 9. -/
theorem ep_Q1_009_partial_09_1011_valid :
    mulPoly ep_Q1_009_coefficient_09_1011
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1012 : Poly :=
[
  term ((-649627177189263 : Rat) / 1395206957462413) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1012 for generator 9. -/
def ep_Q1_009_partial_09_1012 : Poly :=
[
  term ((-1299254354378526 : Rat) / 1395206957462413) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((649627177189263 : Rat) / 1395206957462413) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 9. -/
theorem ep_Q1_009_partial_09_1012_valid :
    mulPoly ep_Q1_009_coefficient_09_1012
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1013 : Poly :=
[
  term ((-1074245167 : Rat) / 99021804) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 1013 for generator 9. -/
def ep_Q1_009_partial_09_1013 : Poly :=
[
  term ((-1074245167 : Rat) / 49510902) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((1074245167 : Rat) / 99021804) [(3, 1), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 9. -/
theorem ep_Q1_009_partial_09_1013_valid :
    mulPoly ep_Q1_009_coefficient_09_1013
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1014 : Poly :=
[
  term ((10161410154142298256919870814455135357549798190292364090151467061016215320813394959182652713979 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1014 for generator 9. -/
def ep_Q1_009_partial_09_1014 : Poly :=
[
  term ((10161410154142298256919870814455135357549798190292364090151467061016215320813394959182652713979 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(2, 1), (3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-10161410154142298256919870814455135357549798190292364090151467061016215320813394959182652713979 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 9. -/
theorem ep_Q1_009_partial_09_1014_valid :
    mulPoly ep_Q1_009_coefficient_09_1014
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1015 : Poly :=
[
  term ((-7854808122429499391225351268929168127193270817245752893874298437166131937050814073997171979 : Rat) / 9486935627264916278068532664872759053350618754545274756730217614776668874151267723716750080) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1015 for generator 9. -/
def ep_Q1_009_partial_09_1015 : Poly :=
[
  term ((-7854808122429499391225351268929168127193270817245752893874298437166131937050814073997171979 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((7854808122429499391225351268929168127193270817245752893874298437166131937050814073997171979 : Rat) / 9486935627264916278068532664872759053350618754545274756730217614776668874151267723716750080) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 9. -/
theorem ep_Q1_009_partial_09_1015_valid :
    mulPoly ep_Q1_009_coefficient_09_1015
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1016 : Poly :=
[
  term ((119421631904965011584263493639672368000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1016 for generator 9. -/
def ep_Q1_009_partial_09_1016 : Poly :=
[
  term ((238843263809930023168526987279344736000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-119421631904965011584263493639672368000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 9. -/
theorem ep_Q1_009_partial_09_1016_valid :
    mulPoly ep_Q1_009_coefficient_09_1016
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1017 : Poly :=
[
  term ((188684267778793262204620082940145057887744960655481433849025244150681011677921540745114714976478565 : Rat) / 5121160332465474620652358901435099016949742832792268761612415784419665299185328118666043803857664) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1017 for generator 9. -/
def ep_Q1_009_partial_09_1017 : Poly :=
[
  term ((188684267778793262204620082940145057887744960655481433849025244150681011677921540745114714976478565 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-188684267778793262204620082940145057887744960655481433849025244150681011677921540745114714976478565 : Rat) / 5121160332465474620652358901435099016949742832792268761612415784419665299185328118666043803857664) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 9. -/
theorem ep_Q1_009_partial_09_1017_valid :
    mulPoly ep_Q1_009_coefficient_09_1017
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1018 : Poly :=
[
  term ((39895085 : Rat) / 7072986) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1018 for generator 9. -/
def ep_Q1_009_partial_09_1018 : Poly :=
[
  term ((39895085 : Rat) / 3536493) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39895085 : Rat) / 7072986) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 9. -/
theorem ep_Q1_009_partial_09_1018_valid :
    mulPoly ep_Q1_009_coefficient_09_1018
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1019 : Poly :=
[
  term ((228223548654087635462825679702744678736209534244863755006907506015675960802677752380739361809115 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(3, 1), (5, 1), (8, 1), (14, 1)]
]

/-- Partial product 1019 for generator 9. -/
def ep_Q1_009_partial_09_1019 : Poly :=
[
  term ((228223548654087635462825679702744678736209534244863755006907506015675960802677752380739361809115 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (3, 1), (5, 1), (8, 1), (14, 1)],
  term ((-228223548654087635462825679702744678736209534244863755006907506015675960802677752380739361809115 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(3, 1), (5, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 9. -/
theorem ep_Q1_009_partial_09_1019_valid :
    mulPoly ep_Q1_009_coefficient_09_1019
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1020 : Poly :=
[
  term ((-1464849026145783864202066219637582 : Rat) / 30920451456251051055078653757943773) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1020 for generator 9. -/
def ep_Q1_009_partial_09_1020 : Poly :=
[
  term ((-2929698052291567728404132439275164 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((1464849026145783864202066219637582 : Rat) / 30920451456251051055078653757943773) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 9. -/
theorem ep_Q1_009_partial_09_1020_valid :
    mulPoly ep_Q1_009_coefficient_09_1020
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1021 : Poly :=
[
  term ((-26031451343194241314953941122565091372219181384913399445061500520180309100826749782588457826358937761042999142694347 : Rat) / 3154009055653068912200185608899648596835827944495059642231702101884669112810620466065630823360042057265441757296640) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1021 for generator 9. -/
def ep_Q1_009_partial_09_1021 : Poly :=
[
  term ((-26031451343194241314953941122565091372219181384913399445061500520180309100826749782588457826358937761042999142694347 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(2, 1), (3, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((26031451343194241314953941122565091372219181384913399445061500520180309100826749782588457826358937761042999142694347 : Rat) / 3154009055653068912200185608899648596835827944495059642231702101884669112810620466065630823360042057265441757296640) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 9. -/
theorem ep_Q1_009_partial_09_1021_valid :
    mulPoly ep_Q1_009_coefficient_09_1021
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1022 : Poly :=
[
  term ((46648022797508117536655 : Rat) / 9352677755690093026242) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1022 for generator 9. -/
def ep_Q1_009_partial_09_1022 : Poly :=
[
  term ((46648022797508117536655 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46648022797508117536655 : Rat) / 9352677755690093026242) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 9. -/
theorem ep_Q1_009_partial_09_1022_valid :
    mulPoly ep_Q1_009_coefficient_09_1022
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1023 : Poly :=
[
  term ((16 : Rat) / 3) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1023 for generator 9. -/
def ep_Q1_009_partial_09_1023 : Poly :=
[
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 9. -/
theorem ep_Q1_009_partial_09_1023_valid :
    mulPoly ep_Q1_009_coefficient_09_1023
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1024 : Poly :=
[
  term ((-8 : Rat) / 17) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 1024 for generator 9. -/
def ep_Q1_009_partial_09_1024 : Poly :=
[
  term ((-16 : Rat) / 17) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((8 : Rat) / 17) [(3, 1), (5, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 9. -/
theorem ep_Q1_009_partial_09_1024_valid :
    mulPoly ep_Q1_009_coefficient_09_1024
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1025 : Poly :=
[
  term ((664852913330670802975584035892060 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1025 for generator 9. -/
def ep_Q1_009_partial_09_1025 : Poly :=
[
  term ((1329705826661341605951168071784120 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-664852913330670802975584035892060 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 9. -/
theorem ep_Q1_009_partial_09_1025_valid :
    mulPoly ep_Q1_009_coefficient_09_1025
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1026 : Poly :=
[
  term ((695986293428803935022998411405276434013803257129785474057195499050793765841356180589856941246946271 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 1026 for generator 9. -/
def ep_Q1_009_partial_09_1026 : Poly :=
[
  term ((695986293428803935022998411405276434013803257129785474057195499050793765841356180589856941246946271 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (3, 1), (5, 1), (14, 1)],
  term ((-695986293428803935022998411405276434013803257129785474057195499050793765841356180589856941246946271 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 9. -/
theorem ep_Q1_009_partial_09_1026_valid :
    mulPoly ep_Q1_009_coefficient_09_1026
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1027 : Poly :=
[
  term ((-83155724214916219625377321128013561409490640063211940674189048007963827698101161522433887297034519 : Rat) / 226046677978095795507914692177093163883360144600561576484316202839370572799989277660520657464686752) [(3, 1), (5, 1), (14, 1), (15, 2)]
]

/-- Partial product 1027 for generator 9. -/
def ep_Q1_009_partial_09_1027 : Poly :=
[
  term ((-83155724214916219625377321128013561409490640063211940674189048007963827698101161522433887297034519 : Rat) / 113023338989047897753957346088546581941680072300280788242158101419685286399994638830260328732343376) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((83155724214916219625377321128013561409490640063211940674189048007963827698101161522433887297034519 : Rat) / 226046677978095795507914692177093163883360144600561576484316202839370572799989277660520657464686752) [(3, 1), (5, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 9. -/
theorem ep_Q1_009_partial_09_1027_valid :
    mulPoly ep_Q1_009_coefficient_09_1027
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1028 : Poly :=
[
  term ((1174736530171009 : Rat) / 2790413914924826) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1028 for generator 9. -/
def ep_Q1_009_partial_09_1028 : Poly :=
[
  term ((1174736530171009 : Rat) / 1395206957462413) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1174736530171009 : Rat) / 2790413914924826) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 9. -/
theorem ep_Q1_009_partial_09_1028_valid :
    mulPoly ep_Q1_009_coefficient_09_1028
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1029 : Poly :=
[
  term ((1254814339 : Rat) / 99021804) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 1029 for generator 9. -/
def ep_Q1_009_partial_09_1029 : Poly :=
[
  term ((1254814339 : Rat) / 49510902) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-1254814339 : Rat) / 99021804) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 9. -/
theorem ep_Q1_009_partial_09_1029_valid :
    mulPoly ep_Q1_009_coefficient_09_1029
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1030 : Poly :=
[
  term ((-20 : Rat) / 51) [(3, 1), (5, 1), (14, 2), (16, 1)]
]

/-- Partial product 1030 for generator 9. -/
def ep_Q1_009_partial_09_1030 : Poly :=
[
  term ((-40 : Rat) / 51) [(2, 1), (3, 1), (5, 1), (14, 2), (16, 1)],
  term ((20 : Rat) / 51) [(3, 1), (5, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 9. -/
theorem ep_Q1_009_partial_09_1030_valid :
    mulPoly ep_Q1_009_coefficient_09_1030
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1031 : Poly :=
[
  term ((13 : Rat) / 102) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 1031 for generator 9. -/
def ep_Q1_009_partial_09_1031 : Poly :=
[
  term ((13 : Rat) / 51) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-13 : Rat) / 102) [(3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 9. -/
theorem ep_Q1_009_partial_09_1031_valid :
    mulPoly ep_Q1_009_coefficient_09_1031
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1032 : Poly :=
[
  term ((-8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 890571716835482906164955021823166604126951794348629016670548606994258302) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 1032 for generator 9. -/
def ep_Q1_009_partial_09_1032 : Poly :=
[
  term ((-8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 890571716835482906164955021823166604126951794348629016670548606994258302) [(3, 1), (6, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 9. -/
theorem ep_Q1_009_partial_09_1032_valid :
    mulPoly ep_Q1_009_coefficient_09_1032
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1033 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1033 for generator 9. -/
def ep_Q1_009_partial_09_1033 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 9. -/
theorem ep_Q1_009_partial_09_1033_valid :
    mulPoly ep_Q1_009_coefficient_09_1033
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1034 : Poly :=
[
  term ((4313116540247450339268146604696784072629051030411866772078680263309041035453167644545154749099 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2)]
]

/-- Partial product 1034 for generator 9. -/
def ep_Q1_009_partial_09_1034 : Poly :=
[
  term ((4313116540247450339268146604696784072629051030411866772078680263309041035453167644545154749099 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((-4313116540247450339268146604696784072629051030411866772078680263309041035453167644545154749099 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 9. -/
theorem ep_Q1_009_partial_09_1034_valid :
    mulPoly ep_Q1_009_coefficient_09_1034
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1035 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 1035 for generator 9. -/
def ep_Q1_009_partial_09_1035 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 1185866953408114534758566583109094881668827344318159344591277201847083609268908465464593760) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 9. -/
theorem ep_Q1_009_partial_09_1035_valid :
    mulPoly ep_Q1_009_coefficient_09_1035
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1036 : Poly :=
[
  term ((-3436593723883885225446431471645248000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1036 for generator 9. -/
def ep_Q1_009_partial_09_1036 : Poly :=
[
  term ((-6873187447767770450892862943290496000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((3436593723883885225446431471645248000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 9. -/
theorem ep_Q1_009_partial_09_1036_valid :
    mulPoly ep_Q1_009_coefficient_09_1036
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1037 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 40198879776546255415544629935901521412502621841293537104789057689731647771827405608969280) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 1037 for generator 9. -/
def ep_Q1_009_partial_09_1037 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 20099439888273127707772314967950760706251310920646768552394528844865823885913702804484640) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 40198879776546255415544629935901521412502621841293537104789057689731647771827405608969280) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 9. -/
theorem ep_Q1_009_partial_09_1037_valid :
    mulPoly ep_Q1_009_coefficient_09_1037
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1038 : Poly :=
[
  term ((202759029709149228301339456827069632000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 3)]
]

/-- Partial product 1038 for generator 9. -/
def ep_Q1_009_partial_09_1038 : Poly :=
[
  term ((405518059418298456602678913654139264000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 3)],
  term ((-202759029709149228301339456827069632000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 9. -/
theorem ep_Q1_009_partial_09_1038_valid :
    mulPoly ep_Q1_009_coefficient_09_1038
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1039 : Poly :=
[
  term ((152 : Rat) / 51) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 1039 for generator 9. -/
def ep_Q1_009_partial_09_1039 : Poly :=
[
  term ((304 : Rat) / 51) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-152 : Rat) / 51) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 9. -/
theorem ep_Q1_009_partial_09_1039_valid :
    mulPoly ep_Q1_009_coefficient_09_1039
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1040 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 1040 for generator 9. -/
def ep_Q1_009_partial_09_1040 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 9. -/
theorem ep_Q1_009_partial_09_1040_valid :
    mulPoly ep_Q1_009_coefficient_09_1040
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1041 : Poly :=
[
  term ((-574030 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1041 for generator 9. -/
def ep_Q1_009_partial_09_1041 : Poly :=
[
  term ((-1148060 : Rat) / 3536493) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((574030 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 9. -/
theorem ep_Q1_009_partial_09_1041_valid :
    mulPoly ep_Q1_009_coefficient_09_1041
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1042 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 21699831917226587375645588565402961936227723867763850684798371967879937708412407282483236457024) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

/-- Partial product 1042 for generator 9. -/
def ep_Q1_009_partial_09_1042 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 10849915958613293687822794282701480968113861933881925342399185983939968854206203641241618228512) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 21699831917226587375645588565402961936227723867763850684798371967879937708412407282483236457024) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 9. -/
theorem ep_Q1_009_partial_09_1042_valid :
    mulPoly ep_Q1_009_coefficient_09_1042
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1043 : Poly :=
[
  term ((33867770 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1043 for generator 9. -/
def ep_Q1_009_partial_09_1043 : Poly :=
[
  term ((67735540 : Rat) / 3536493) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-33867770 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 9. -/
theorem ep_Q1_009_partial_09_1043_valid :
    mulPoly ep_Q1_009_coefficient_09_1043
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1044 : Poly :=
[
  term ((-285676354224687013146879544900792329648418077981974238576238417521060483746244208014203110905883 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

/-- Partial product 1044 for generator 9. -/
def ep_Q1_009_partial_09_1044 : Poly :=
[
  term ((-285676354224687013146879544900792329648418077981974238576238417521060483746244208014203110905883 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((285676354224687013146879544900792329648418077981974238576238417521060483746244208014203110905883 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(3, 1), (6, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 9. -/
theorem ep_Q1_009_partial_09_1044_valid :
    mulPoly ep_Q1_009_coefficient_09_1044
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1045 : Poly :=
[
  term ((103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1045 for generator 9. -/
def ep_Q1_009_partial_09_1045 : Poly :=
[
  term ((103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 9. -/
theorem ep_Q1_009_partial_09_1045_valid :
    mulPoly ep_Q1_009_coefficient_09_1045
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1046 : Poly :=
[
  term ((771656695162152182892908449537916 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 1046 for generator 9. -/
def ep_Q1_009_partial_09_1046 : Poly :=
[
  term ((1543313390324304365785816899075832 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-771656695162152182892908449537916 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 9. -/
theorem ep_Q1_009_partial_09_1046_valid :
    mulPoly ep_Q1_009_coefficient_09_1046
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1047 : Poly :=
[
  term ((89769049120763909367239176496388968921075799525697865395985933452379461447245131839803946735021 : Rat) / 1300838429494355261664051927701102293010012342959048280280114226110228770672852967333286498752) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1047 for generator 9. -/
def ep_Q1_009_partial_09_1047 : Poly :=
[
  term ((89769049120763909367239176496388968921075799525697865395985933452379461447245131839803946735021 : Rat) / 650419214747177630832025963850551146505006171479524140140057113055114385336426483666643249376) [(2, 1), (3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-89769049120763909367239176496388968921075799525697865395985933452379461447245131839803946735021 : Rat) / 1300838429494355261664051927701102293010012342959048280280114226110228770672852967333286498752) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 9. -/
theorem ep_Q1_009_partial_09_1047_valid :
    mulPoly ep_Q1_009_coefficient_09_1047
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1048 : Poly :=
[
  term ((-5890501935516780473905886024647924 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 1048 for generator 9. -/
def ep_Q1_009_partial_09_1048 : Poly :=
[
  term ((-11781003871033560947811772049295848 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((5890501935516780473905886024647924 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 9. -/
theorem ep_Q1_009_partial_09_1048_valid :
    mulPoly ep_Q1_009_coefficient_09_1048
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1049 : Poly :=
[
  term ((-33645074339121599131279742277155499450159309365004054570436808313914555991324979728610567790781 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

/-- Partial product 1049 for generator 9. -/
def ep_Q1_009_partial_09_1049 : Poly :=
[
  term ((-33645074339121599131279742277155499450159309365004054570436808313914555991324979728610567790781 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((33645074339121599131279742277155499450159309365004054570436808313914555991324979728610567790781 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(3, 1), (6, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 9. -/
theorem ep_Q1_009_partial_09_1049_valid :
    mulPoly ep_Q1_009_coefficient_09_1049
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1050 : Poly :=
[
  term ((-6054808363587299595049634209404344 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (15, 3)]
]

/-- Partial product 1050 for generator 9. -/
def ep_Q1_009_partial_09_1050 : Poly :=
[
  term ((-12109616727174599190099268418808688 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 3)],
  term ((6054808363587299595049634209404344 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 9. -/
theorem ep_Q1_009_partial_09_1050_valid :
    mulPoly ep_Q1_009_coefficient_09_1050
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1051 : Poly :=
[
  term ((-22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 36387338945855459523818532326546571066562772819117253562513327682790408408181018601048478702796729962827587584) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 1051 for generator 9. -/
def ep_Q1_009_partial_09_1051 : Poly :=
[
  term ((-22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 18193669472927729761909266163273285533281386409558626781256663841395204204090509300524239351398364981413793792) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 36387338945855459523818532326546571066562772819117253562513327682790408408181018601048478702796729962827587584) [(3, 1), (6, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 9. -/
theorem ep_Q1_009_partial_09_1051_valid :
    mulPoly ep_Q1_009_coefficient_09_1051
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1052 : Poly :=
[
  term ((1315883553243244697701004615414931001600 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1052 for generator 9. -/
def ep_Q1_009_partial_09_1052 : Poly :=
[
  term ((2631767106486489395402009230829862003200 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1315883553243244697701004615414931001600 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 9. -/
theorem ep_Q1_009_partial_09_1052_valid :
    mulPoly ep_Q1_009_coefficient_09_1052
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1053 : Poly :=
[
  term ((33566503132130417398849482832007528055940178302197119414533953550826124711337541583055952639420167233495635373139219 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1053 for generator 9. -/
def ep_Q1_009_partial_09_1053 : Poly :=
[
  term ((33566503132130417398849482832007528055940178302197119414533953550826124711337541583055952639420167233495635373139219 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-33566503132130417398849482832007528055940178302197119414533953550826124711337541583055952639420167233495635373139219 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 9. -/
theorem ep_Q1_009_partial_09_1053_valid :
    mulPoly ep_Q1_009_coefficient_09_1053
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1054 : Poly :=
[
  term ((-16652554168440290568845 : Rat) / 4676338877845046513121) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1054 for generator 9. -/
def ep_Q1_009_partial_09_1054 : Poly :=
[
  term ((-33305108336880581137690 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((16652554168440290568845 : Rat) / 4676338877845046513121) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 9. -/
theorem ep_Q1_009_partial_09_1054_valid :
    mulPoly ep_Q1_009_coefficient_09_1054
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1055 : Poly :=
[
  term ((349127175749358307299401520269764896335924968531882749102101384699972265891451572474429966582772684512581061769327 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (6, 1), (9, 1), (14, 1)]
]

/-- Partial product 1055 for generator 9. -/
def ep_Q1_009_partial_09_1055 : Poly :=
[
  term ((349127175749358307299401520269764896335924968531882749102101384699972265891451572474429966582772684512581061769327 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-349127175749358307299401520269764896335924968531882749102101384699972265891451572474429966582772684512581061769327 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (6, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 9. -/
theorem ep_Q1_009_partial_09_1055_valid :
    mulPoly ep_Q1_009_coefficient_09_1055
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1056 : Poly :=
[
  term ((14733998758123296813629983269382991334400 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1056 for generator 9. -/
def ep_Q1_009_partial_09_1056 : Poly :=
[
  term ((29467997516246593627259966538765982668800 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((-14733998758123296813629983269382991334400 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 9. -/
theorem ep_Q1_009_partial_09_1056_valid :
    mulPoly ep_Q1_009_coefficient_09_1056
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1057 : Poly :=
[
  term ((-726381667900088353382879 : Rat) / 18705355511380186052484) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1057 for generator 9. -/
def ep_Q1_009_partial_09_1057 : Poly :=
[
  term ((-726381667900088353382879 : Rat) / 9352677755690093026242) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((726381667900088353382879 : Rat) / 18705355511380186052484) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 9. -/
theorem ep_Q1_009_partial_09_1057_valid :
    mulPoly ep_Q1_009_coefficient_09_1057
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1058 : Poly :=
[
  term ((-67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(3, 1), (6, 1), (9, 1), (14, 2)]
]

/-- Partial product 1058 for generator 9. -/
def ep_Q1_009_partial_09_1058 : Poly :=
[
  term ((-67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 2)],
  term ((67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(3, 1), (6, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 9. -/
theorem ep_Q1_009_partial_09_1058_valid :
    mulPoly ep_Q1_009_coefficient_09_1058
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1059 : Poly :=
[
  term ((47378771947181737846355 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 1059 for generator 9. -/
def ep_Q1_009_partial_09_1059 : Poly :=
[
  term ((94757543894363475692710 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-47378771947181737846355 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 9. -/
theorem ep_Q1_009_partial_09_1059_valid :
    mulPoly ep_Q1_009_coefficient_09_1059
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1060 : Poly :=
[
  term ((-25259581352375392004042941102617604209565975717366553998855544059040049049214517748375593453956712010244771548729 : Rat) / 593304938986657056471065765406254438832924745014119571525903329925633768399289026724159297095568483308021399040) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

/-- Partial product 1060 for generator 9. -/
def ep_Q1_009_partial_09_1060 : Poly :=
[
  term ((-25259581352375392004042941102617604209565975717366553998855544059040049049214517748375593453956712010244771548729 : Rat) / 296652469493328528235532882703127219416462372507059785762951664962816884199644513362079648547784241654010699520) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((25259581352375392004042941102617604209565975717366553998855544059040049049214517748375593453956712010244771548729 : Rat) / 593304938986657056471065765406254438832924745014119571525903329925633768399289026724159297095568483308021399040) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 9. -/
theorem ep_Q1_009_partial_09_1060_valid :
    mulPoly ep_Q1_009_coefficient_09_1060
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1061 : Poly :=
[
  term ((36140930482800245882702 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1061 for generator 9. -/
def ep_Q1_009_partial_09_1061 : Poly :=
[
  term ((72281860965600491765404 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-36140930482800245882702 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 9. -/
theorem ep_Q1_009_partial_09_1061_valid :
    mulPoly ep_Q1_009_coefficient_09_1061
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1062 : Poly :=
[
  term ((-4370314146020811289561 : Rat) / 12470237007586790701656) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 1062 for generator 9. -/
def ep_Q1_009_partial_09_1062 : Poly :=
[
  term ((-4370314146020811289561 : Rat) / 6235118503793395350828) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((4370314146020811289561 : Rat) / 12470237007586790701656) [(3, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 9. -/
theorem ep_Q1_009_partial_09_1062_valid :
    mulPoly ep_Q1_009_coefficient_09_1062
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1063 : Poly :=
[
  term ((28 : Rat) / 17) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 1063 for generator 9. -/
def ep_Q1_009_partial_09_1063 : Poly :=
[
  term ((56 : Rat) / 17) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 9. -/
theorem ep_Q1_009_partial_09_1063_valid :
    mulPoly ep_Q1_009_coefficient_09_1063
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1064 : Poly :=
[
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1064 for generator 9. -/
def ep_Q1_009_partial_09_1064 : Poly :=
[
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 9. -/
theorem ep_Q1_009_partial_09_1064_valid :
    mulPoly ep_Q1_009_coefficient_09_1064
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1065 : Poly :=
[
  term ((-152 : Rat) / 51) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1065 for generator 9. -/
def ep_Q1_009_partial_09_1065 : Poly :=
[
  term ((-304 : Rat) / 51) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 51) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 9. -/
theorem ep_Q1_009_partial_09_1065_valid :
    mulPoly ep_Q1_009_coefficient_09_1065
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1066 : Poly :=
[
  term ((-457034821909905838926144202455925955178239385839120662456679199396588033443904061554281949999806671 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 1066 for generator 9. -/
def ep_Q1_009_partial_09_1066 : Poly :=
[
  term ((-457034821909905838926144202455925955178239385839120662456679199396588033443904061554281949999806671 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((457034821909905838926144202455925955178239385839120662456679199396588033443904061554281949999806671 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 9. -/
theorem ep_Q1_009_partial_09_1066_valid :
    mulPoly ep_Q1_009_coefficient_09_1066
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1067 : Poly :=
[
  term ((13774374059767336875539430222523313446505994468872152297854093723786594347815948206228362934656497 : Rat) / 126582352850488426357932599964850611294661722561955795661323836479299636632405709147818879332640) [(3, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 1067 for generator 9. -/
def ep_Q1_009_partial_09_1067 : Poly :=
[
  term ((13774374059767336875539430222523313446505994468872152297854093723786594347815948206228362934656497 : Rat) / 63291176425244213178966299982425305647330861280977897830661918239649818316202854573909439666320) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-13774374059767336875539430222523313446505994468872152297854093723786594347815948206228362934656497 : Rat) / 126582352850488426357932599964850611294661722561955795661323836479299636632405709147818879332640) [(3, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 9. -/
theorem ep_Q1_009_partial_09_1067_valid :
    mulPoly ep_Q1_009_coefficient_09_1067
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1068 : Poly :=
[
  term ((110245046 : Rat) / 8251817) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1068 for generator 9. -/
def ep_Q1_009_partial_09_1068 : Poly :=
[
  term ((220490092 : Rat) / 8251817) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-110245046 : Rat) / 8251817) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 9. -/
theorem ep_Q1_009_partial_09_1068_valid :
    mulPoly ep_Q1_009_coefficient_09_1068
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1069 : Poly :=
[
  term ((61550833280362071054522754040664026538579172937204351318627135052166980514080233901608136758392757 : Rat) / 145315721557347297112230873542417033925017235814646727739917558968166796799993107067477565513012912) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 1069 for generator 9. -/
def ep_Q1_009_partial_09_1069 : Poly :=
[
  term ((61550833280362071054522754040664026538579172937204351318627135052166980514080233901608136758392757 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-61550833280362071054522754040664026538579172937204351318627135052166980514080233901608136758392757 : Rat) / 145315721557347297112230873542417033925017235814646727739917558968166796799993107067477565513012912) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 9. -/
theorem ep_Q1_009_partial_09_1069_valid :
    mulPoly ep_Q1_009_coefficient_09_1069
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1070 : Poly :=
[
  term ((-523901273465947 : Rat) / 1395206957462413) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1070 for generator 9. -/
def ep_Q1_009_partial_09_1070 : Poly :=
[
  term ((-1047802546931894 : Rat) / 1395206957462413) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((523901273465947 : Rat) / 1395206957462413) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 9. -/
theorem ep_Q1_009_partial_09_1070_valid :
    mulPoly ep_Q1_009_coefficient_09_1070
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1071 : Poly :=
[
  term ((-2766090479 : Rat) / 99021804) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 1071 for generator 9. -/
def ep_Q1_009_partial_09_1071 : Poly :=
[
  term ((-2766090479 : Rat) / 49510902) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((2766090479 : Rat) / 99021804) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 9. -/
theorem ep_Q1_009_partial_09_1071_valid :
    mulPoly ep_Q1_009_coefficient_09_1071
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1072 : Poly :=
[
  term ((163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1072 for generator 9. -/
def ep_Q1_009_partial_09_1072 : Poly :=
[
  term ((327908400577828390986977134137600 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 9. -/
theorem ep_Q1_009_partial_09_1072_valid :
    mulPoly ep_Q1_009_coefficient_09_1072
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1073 : Poly :=
[
  term ((-738911770847538294689972337494160 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (13, 2), (15, 1)]
]

/-- Partial product 1073 for generator 9. -/
def ep_Q1_009_partial_09_1073 : Poly :=
[
  term ((-1477823541695076589379944674988320 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (6, 1), (13, 2), (15, 1)],
  term ((738911770847538294689972337494160 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 9. -/
theorem ep_Q1_009_partial_09_1073_valid :
    mulPoly ep_Q1_009_coefficient_09_1073
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1074 : Poly :=
[
  term ((112314480083123873857685044195808423928963585040031968835171328472018809432757480161267975030986922549553718944699 : Rat) / 91940348681901617391548256864926335815901018253275915095381836220656027154577111019079773976139233360830466696) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 1074 for generator 9. -/
def ep_Q1_009_partial_09_1074 : Poly :=
[
  term ((112314480083123873857685044195808423928963585040031968835171328472018809432757480161267975030986922549553718944699 : Rat) / 45970174340950808695774128432463167907950509126637957547690918110328013577288555509539886988069616680415233348) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-112314480083123873857685044195808423928963585040031968835171328472018809432757480161267975030986922549553718944699 : Rat) / 91940348681901617391548256864926335815901018253275915095381836220656027154577111019079773976139233360830466696) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 9. -/
theorem ep_Q1_009_partial_09_1074_valid :
    mulPoly ep_Q1_009_coefficient_09_1074
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1075 : Poly :=
[
  term ((310633722310001430793647 : Rat) / 2708939409436850930452) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1075 for generator 9. -/
def ep_Q1_009_partial_09_1075 : Poly :=
[
  term ((310633722310001430793647 : Rat) / 1354469704718425465226) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-310633722310001430793647 : Rat) / 2708939409436850930452) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 9. -/
theorem ep_Q1_009_partial_09_1075_valid :
    mulPoly ep_Q1_009_coefficient_09_1075
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1076 : Poly :=
[
  term ((-584211232539439590500206591191903592942898220522191645 : Rat) / 285071954829622879643311256928356724175362184887277392) [(3, 1), (6, 1), (14, 2), (15, 1)]
]

/-- Partial product 1076 for generator 9. -/
def ep_Q1_009_partial_09_1076 : Poly :=
[
  term ((-584211232539439590500206591191903592942898220522191645 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((584211232539439590500206591191903592942898220522191645 : Rat) / 285071954829622879643311256928356724175362184887277392) [(3, 1), (6, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 9. -/
theorem ep_Q1_009_partial_09_1076_valid :
    mulPoly ep_Q1_009_coefficient_09_1076
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1077 : Poly :=
[
  term ((3567820812410335 : Rat) / 1395206957462413) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1077 for generator 9. -/
def ep_Q1_009_partial_09_1077 : Poly :=
[
  term ((7135641624820670 : Rat) / 1395206957462413) [(2, 1), (3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3567820812410335 : Rat) / 1395206957462413) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 9. -/
theorem ep_Q1_009_partial_09_1077_valid :
    mulPoly ep_Q1_009_coefficient_09_1077
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1078 : Poly :=
[
  term ((-828192219334010628447744246806565939006642314975007952059940729783665460575225022970702929348164321745818612699997 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 1078 for generator 9. -/
def ep_Q1_009_partial_09_1078 : Poly :=
[
  term ((-828192219334010628447744246806565939006642314975007952059940729783665460575225022970702929348164321745818612699997 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((828192219334010628447744246806565939006642314975007952059940729783665460575225022970702929348164321745818612699997 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 9. -/
theorem ep_Q1_009_partial_09_1078_valid :
    mulPoly ep_Q1_009_coefficient_09_1078
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1079 : Poly :=
[
  term ((-110466448510813017450487 : Rat) / 16253636456621105582712) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 1079 for generator 9. -/
def ep_Q1_009_partial_09_1079 : Poly :=
[
  term ((-110466448510813017450487 : Rat) / 8126818228310552791356) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((110466448510813017450487 : Rat) / 16253636456621105582712) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 9. -/
theorem ep_Q1_009_partial_09_1079_valid :
    mulPoly ep_Q1_009_coefficient_09_1079
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1080 : Poly :=
[
  term ((-319317955503280361704956078436969206260527520068360488881921595029926189541701769127041047864150277 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 1080 for generator 9. -/
def ep_Q1_009_partial_09_1080 : Poly :=
[
  term ((-319317955503280361704956078436969206260527520068360488881921595029926189541701769127041047864150277 : Rat) / 84767504241785923315468009566409936456260054225210591181618576064763964799995979122695246549257532) [(2, 1), (3, 1), (6, 1), (15, 3)],
  term ((319317955503280361704956078436969206260527520068360488881921595029926189541701769127041047864150277 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 9. -/
theorem ep_Q1_009_partial_09_1080_valid :
    mulPoly ep_Q1_009_coefficient_09_1080
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1081 : Poly :=
[
  term ((3018102343223526 : Rat) / 1395206957462413) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 1081 for generator 9. -/
def ep_Q1_009_partial_09_1081 : Poly :=
[
  term ((6036204686447052 : Rat) / 1395206957462413) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-3018102343223526 : Rat) / 1395206957462413) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 9. -/
theorem ep_Q1_009_partial_09_1081_valid :
    mulPoly ep_Q1_009_coefficient_09_1081
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1082 : Poly :=
[
  term ((-152 : Rat) / 51) [(3, 1), (6, 2), (13, 1), (16, 1)]
]

/-- Partial product 1082 for generator 9. -/
def ep_Q1_009_partial_09_1082 : Poly :=
[
  term ((-304 : Rat) / 51) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((152 : Rat) / 51) [(3, 1), (6, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 9. -/
theorem ep_Q1_009_partial_09_1082_valid :
    mulPoly ep_Q1_009_coefficient_09_1082
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1083 : Poly :=
[
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (7, 1), (8, 1), (12, 1)]
]

/-- Partial product 1083 for generator 9. -/
def ep_Q1_009_partial_09_1083 : Poly :=
[
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1)],
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (7, 1), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 9. -/
theorem ep_Q1_009_partial_09_1083_valid :
    mulPoly ep_Q1_009_coefficient_09_1083
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1084 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1084 for generator 9. -/
def ep_Q1_009_partial_09_1084 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 9. -/
theorem ep_Q1_009_partial_09_1084_valid :
    mulPoly ep_Q1_009_coefficient_09_1084
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1085 : Poly :=
[
  term ((-239865742595437265882108009424014549563337582415204977019064718085569054751603794593021916147 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1085 for generator 9. -/
def ep_Q1_009_partial_09_1085 : Poly :=
[
  term ((-239865742595437265882108009424014549563337582415204977019064718085569054751603794593021916147 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((239865742595437265882108009424014549563337582415204977019064718085569054751603794593021916147 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 9. -/
theorem ep_Q1_009_partial_09_1085_valid :
    mulPoly ep_Q1_009_coefficient_09_1085
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1086 : Poly :=
[
  term ((-950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1086 for generator 9. -/
def ep_Q1_009_partial_09_1086 : Poly :=
[
  term ((-950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 9. -/
theorem ep_Q1_009_partial_09_1086_valid :
    mulPoly ep_Q1_009_coefficient_09_1086
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1087 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1087 for generator 9. -/
def ep_Q1_009_partial_09_1087 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(2, 1), (3, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 9. -/
theorem ep_Q1_009_partial_09_1087_valid :
    mulPoly ep_Q1_009_coefficient_09_1087
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1088 : Poly :=
[
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 1088 for generator 9. -/
def ep_Q1_009_partial_09_1088 : Poly :=
[
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (7, 1), (8, 1), (14, 1)],
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (7, 1), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 9. -/
theorem ep_Q1_009_partial_09_1088_valid :
    mulPoly ep_Q1_009_coefficient_09_1088
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1089 : Poly :=
[
  term ((2430651631979297319851389943745972133937266035811183331483886589483930187981850246774956401103 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1089 for generator 9. -/
def ep_Q1_009_partial_09_1089 : Poly :=
[
  term ((2430651631979297319851389943745972133937266035811183331483886589483930187981850246774956401103 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(2, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-2430651631979297319851389943745972133937266035811183331483886589483930187981850246774956401103 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 9. -/
theorem ep_Q1_009_partial_09_1089_valid :
    mulPoly ep_Q1_009_coefficient_09_1089
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1090 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1090 for generator 9. -/
def ep_Q1_009_partial_09_1090 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 9. -/
theorem ep_Q1_009_partial_09_1090_valid :
    mulPoly ep_Q1_009_coefficient_09_1090
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1091 : Poly :=
[
  term ((-17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1091 for generator 9. -/
def ep_Q1_009_partial_09_1091 : Poly :=
[
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 9. -/
theorem ep_Q1_009_partial_09_1091_valid :
    mulPoly ep_Q1_009_coefficient_09_1091
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1092 : Poly :=
[
  term ((-2178444170162957530803351933809730432834874990729317365816127452182797092088933887361681398122859513656731644716513 : Rat) / 225286361118076350871441829207117756916844853178218545873693007277476365200758604718973630240003004090388696949760) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1092 for generator 9. -/
def ep_Q1_009_partial_09_1092 : Poly :=
[
  term ((-2178444170162957530803351933809730432834874990729317365816127452182797092088933887361681398122859513656731644716513 : Rat) / 112643180559038175435720914603558878458422426589109272936846503638738182600379302359486815120001502045194348474880) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((2178444170162957530803351933809730432834874990729317365816127452182797092088933887361681398122859513656731644716513 : Rat) / 225286361118076350871441829207117756916844853178218545873693007277476365200758604718973630240003004090388696949760) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 9. -/
theorem ep_Q1_009_partial_09_1092_valid :
    mulPoly ep_Q1_009_coefficient_09_1092
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1093 : Poly :=
[
  term ((23320267409785460644907 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1093 for generator 9. -/
def ep_Q1_009_partial_09_1093 : Poly :=
[
  term ((46640534819570921289814 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23320267409785460644907 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 9. -/
theorem ep_Q1_009_partial_09_1093_valid :
    mulPoly ep_Q1_009_coefficient_09_1093
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1094 : Poly :=
[
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 3)]
]

/-- Partial product 1094 for generator 9. -/
def ep_Q1_009_partial_09_1094 : Poly :=
[
  term ((-13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 3)],
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 9. -/
theorem ep_Q1_009_partial_09_1094_valid :
    mulPoly ep_Q1_009_coefficient_09_1094
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1095 : Poly :=
[
  term ((734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1095 for generator 9. -/
def ep_Q1_009_partial_09_1095 : Poly :=
[
  term ((734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 9. -/
theorem ep_Q1_009_partial_09_1095_valid :
    mulPoly ep_Q1_009_coefficient_09_1095
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1096 : Poly :=
[
  term ((-22337859205245253965401804565694112000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1096 for generator 9. -/
def ep_Q1_009_partial_09_1096 : Poly :=
[
  term ((-44675718410490507930803609131388224000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((22337859205245253965401804565694112000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 9. -/
theorem ep_Q1_009_partial_09_1096_valid :
    mulPoly ep_Q1_009_coefficient_09_1096
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1097 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)]
]

/-- Partial product 1097 for generator 9. -/
def ep_Q1_009_partial_09_1097 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 9. -/
theorem ep_Q1_009_partial_09_1097_valid :
    mulPoly ep_Q1_009_coefficient_09_1097
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1098 : Poly :=
[
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1098 for generator 9. -/
def ep_Q1_009_partial_09_1098 : Poly :=
[
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 9. -/
theorem ep_Q1_009_partial_09_1098_valid :
    mulPoly ep_Q1_009_coefficient_09_1098
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1099 : Poly :=
[
  term ((6507151989263087297395131580417245077161187789594226734316150494206849758872408870178781905349405278495275008896007 : Rat) / 675859083354229052614325487621353270750534559534655637621079021832429095602275814156920890720009012271166090849280) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1099 for generator 9. -/
def ep_Q1_009_partial_09_1099 : Poly :=
[
  term ((6507151989263087297395131580417245077161187789594226734316150494206849758872408870178781905349405278495275008896007 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6507151989263087297395131580417245077161187789594226734316150494206849758872408870178781905349405278495275008896007 : Rat) / 675859083354229052614325487621353270750534559534655637621079021832429095602275814156920890720009012271166090849280) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 9. -/
theorem ep_Q1_009_partial_09_1099_valid :
    mulPoly ep_Q1_009_coefficient_09_1099
        ep_Q1_009_generator_09_1000_1099 =
      ep_Q1_009_partial_09_1099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_09_1000_1099 : List Poly :=
[
  ep_Q1_009_partial_09_1000,
  ep_Q1_009_partial_09_1001,
  ep_Q1_009_partial_09_1002,
  ep_Q1_009_partial_09_1003,
  ep_Q1_009_partial_09_1004,
  ep_Q1_009_partial_09_1005,
  ep_Q1_009_partial_09_1006,
  ep_Q1_009_partial_09_1007,
  ep_Q1_009_partial_09_1008,
  ep_Q1_009_partial_09_1009,
  ep_Q1_009_partial_09_1010,
  ep_Q1_009_partial_09_1011,
  ep_Q1_009_partial_09_1012,
  ep_Q1_009_partial_09_1013,
  ep_Q1_009_partial_09_1014,
  ep_Q1_009_partial_09_1015,
  ep_Q1_009_partial_09_1016,
  ep_Q1_009_partial_09_1017,
  ep_Q1_009_partial_09_1018,
  ep_Q1_009_partial_09_1019,
  ep_Q1_009_partial_09_1020,
  ep_Q1_009_partial_09_1021,
  ep_Q1_009_partial_09_1022,
  ep_Q1_009_partial_09_1023,
  ep_Q1_009_partial_09_1024,
  ep_Q1_009_partial_09_1025,
  ep_Q1_009_partial_09_1026,
  ep_Q1_009_partial_09_1027,
  ep_Q1_009_partial_09_1028,
  ep_Q1_009_partial_09_1029,
  ep_Q1_009_partial_09_1030,
  ep_Q1_009_partial_09_1031,
  ep_Q1_009_partial_09_1032,
  ep_Q1_009_partial_09_1033,
  ep_Q1_009_partial_09_1034,
  ep_Q1_009_partial_09_1035,
  ep_Q1_009_partial_09_1036,
  ep_Q1_009_partial_09_1037,
  ep_Q1_009_partial_09_1038,
  ep_Q1_009_partial_09_1039,
  ep_Q1_009_partial_09_1040,
  ep_Q1_009_partial_09_1041,
  ep_Q1_009_partial_09_1042,
  ep_Q1_009_partial_09_1043,
  ep_Q1_009_partial_09_1044,
  ep_Q1_009_partial_09_1045,
  ep_Q1_009_partial_09_1046,
  ep_Q1_009_partial_09_1047,
  ep_Q1_009_partial_09_1048,
  ep_Q1_009_partial_09_1049,
  ep_Q1_009_partial_09_1050,
  ep_Q1_009_partial_09_1051,
  ep_Q1_009_partial_09_1052,
  ep_Q1_009_partial_09_1053,
  ep_Q1_009_partial_09_1054,
  ep_Q1_009_partial_09_1055,
  ep_Q1_009_partial_09_1056,
  ep_Q1_009_partial_09_1057,
  ep_Q1_009_partial_09_1058,
  ep_Q1_009_partial_09_1059,
  ep_Q1_009_partial_09_1060,
  ep_Q1_009_partial_09_1061,
  ep_Q1_009_partial_09_1062,
  ep_Q1_009_partial_09_1063,
  ep_Q1_009_partial_09_1064,
  ep_Q1_009_partial_09_1065,
  ep_Q1_009_partial_09_1066,
  ep_Q1_009_partial_09_1067,
  ep_Q1_009_partial_09_1068,
  ep_Q1_009_partial_09_1069,
  ep_Q1_009_partial_09_1070,
  ep_Q1_009_partial_09_1071,
  ep_Q1_009_partial_09_1072,
  ep_Q1_009_partial_09_1073,
  ep_Q1_009_partial_09_1074,
  ep_Q1_009_partial_09_1075,
  ep_Q1_009_partial_09_1076,
  ep_Q1_009_partial_09_1077,
  ep_Q1_009_partial_09_1078,
  ep_Q1_009_partial_09_1079,
  ep_Q1_009_partial_09_1080,
  ep_Q1_009_partial_09_1081,
  ep_Q1_009_partial_09_1082,
  ep_Q1_009_partial_09_1083,
  ep_Q1_009_partial_09_1084,
  ep_Q1_009_partial_09_1085,
  ep_Q1_009_partial_09_1086,
  ep_Q1_009_partial_09_1087,
  ep_Q1_009_partial_09_1088,
  ep_Q1_009_partial_09_1089,
  ep_Q1_009_partial_09_1090,
  ep_Q1_009_partial_09_1091,
  ep_Q1_009_partial_09_1092,
  ep_Q1_009_partial_09_1093,
  ep_Q1_009_partial_09_1094,
  ep_Q1_009_partial_09_1095,
  ep_Q1_009_partial_09_1096,
  ep_Q1_009_partial_09_1097,
  ep_Q1_009_partial_09_1098,
  ep_Q1_009_partial_09_1099
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_09_1000_1099 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 10931415373902145056000436367236153722773212966042422523362304421094359417418932498599046208) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 23252293204080677152128756531550880032722104790552144011593670624452619789586440499305760) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (9, 1)],
  term ((-6873187447767770450892862943290496000 : Rat) / 42041507163349345751221942892884216689) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 12551863559964398580030291425086027002327801060765364611795136726518787498003255192808930891808) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((-1148060 : Rat) / 69343) [(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-438359079078049353188758746287821564013946914589860808329514028578585487792709217700579519119901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (5, 1), (6, 1), (8, 1)],
  term ((4269217551865062483308878162710232 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((44078413356831377315030631380448323476636617068900848752013287553892716256817931375374924212576348337852017201290519 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((-19859385560063476861798 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1548621946365289537433951101677120 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-304 : Rat) / 51) [(2, 1), (3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((414530879200720597164876063108362712562813428034068392179589465781125468990375486164874206164476771 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-1299254354378526 : Rat) / 1395206957462413) [(2, 1), (3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-1074245167 : Rat) / 49510902) [(2, 1), (3, 1), (5, 1), (6, 1), (16, 1)],
  term ((10161410154142298256919870814455135357549798190292364090151467061016215320813394959182652713979 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(2, 1), (3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-7854808122429499391225351268929168127193270817245752893874298437166131937050814073997171979 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((238843263809930023168526987279344736000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((188684267778793262204620082940145057887744960655481433849025244150681011677921540745114714976478565 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((39895085 : Rat) / 3536493) [(2, 1), (3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((228223548654087635462825679702744678736209534244863755006907506015675960802677752380739361809115 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (3, 1), (5, 1), (8, 1), (14, 1)],
  term ((-2929698052291567728404132439275164 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((-26031451343194241314953941122565091372219181384913399445061500520180309100826749782588457826358937761042999142694347 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(2, 1), (3, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((46648022797508117536655 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 17) [(2, 1), (3, 1), (5, 1), (12, 1), (16, 1)],
  term ((1329705826661341605951168071784120 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((695986293428803935022998411405276434013803257129785474057195499050793765841356180589856941246946271 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (3, 1), (5, 1), (14, 1)],
  term ((-83155724214916219625377321128013561409490640063211940674189048007963827698101161522433887297034519 : Rat) / 113023338989047897753957346088546581941680072300280788242158101419685286399994638830260328732343376) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((1174736530171009 : Rat) / 1395206957462413) [(2, 1), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((1254814339 : Rat) / 49510902) [(2, 1), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-40 : Rat) / 51) [(2, 1), (3, 1), (5, 1), (14, 2), (16, 1)],
  term ((13 : Rat) / 51) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (3, 1), (6, 1), (7, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((4313116540247450339268146604696784072629051030411866772078680263309041035453167644545154749099 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (3, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 1185866953408114534758566583109094881668827344318159344591277201847083609268908465464593760) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((-6873187447767770450892862943290496000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 20099439888273127707772314967950760706251310920646768552394528844865823885913702804484640) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((405518059418298456602678913654139264000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (6, 1), (7, 1), (9, 1), (15, 3)],
  term ((304 : Rat) / 51) [(2, 1), (3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1148060 : Rat) / 3536493) [(2, 1), (3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 10849915958613293687822794282701480968113861933881925342399185983939968854206203641241618228512) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2)],
  term ((67735540 : Rat) / 3536493) [(2, 1), (3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-285676354224687013146879544900792329648418077981974238576238417521060483746244208014203110905883 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1)],
  term ((103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((1543313390324304365785816899075832 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((89769049120763909367239176496388968921075799525697865395985933452379461447245131839803946735021 : Rat) / 650419214747177630832025963850551146505006171479524140140057113055114385336426483666643249376) [(2, 1), (3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-11781003871033560947811772049295848 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-33645074339121599131279742277155499450159309365004054570436808313914555991324979728610567790781 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 1)],
  term ((-12109616727174599190099268418808688 : Rat) / 30920451456251051055078653757943773) [(2, 1), (3, 1), (6, 1), (8, 1), (15, 3)],
  term ((-22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 18193669472927729761909266163273285533281386409558626781256663841395204204090509300524239351398364981413793792) [(2, 1), (3, 1), (6, 1), (9, 1)],
  term ((2631767106486489395402009230829862003200 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((33566503132130417398849482832007528055940178302197119414533953550826124711337541583055952639420167233495635373139219 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-33305108336880581137690 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((349127175749358307299401520269764896335924968531882749102101384699972265891451572474429966582772684512581061769327 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((29467997516246593627259966538765982668800 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((-726381667900088353382879 : Rat) / 9352677755690093026242) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 2)],
  term ((94757543894363475692710 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-25259581352375392004042941102617604209565975717366553998855544059040049049214517748375593453956712010244771548729 : Rat) / 296652469493328528235532882703127219416462372507059785762951664962816884199644513362079648547784241654010699520) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2)],
  term ((72281860965600491765404 : Rat) / 1558779625948348837707) [(2, 1), (3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-4370314146020811289561 : Rat) / 6235118503793395350828) [(2, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((56 : Rat) / 17) [(2, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((32 : Rat) / 3) [(2, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-304 : Rat) / 51) [(2, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-457034821909905838926144202455925955178239385839120662456679199396588033443904061554281949999806671 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(2, 1), (3, 1), (6, 1), (13, 1)],
  term ((13774374059767336875539430222523313446505994468872152297854093723786594347815948206228362934656497 : Rat) / 63291176425244213178966299982425305647330861280977897830661918239649818316202854573909439666320) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((220490092 : Rat) / 8251817) [(2, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((61550833280362071054522754040664026538579172937204351318627135052166980514080233901608136758392757 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-1047802546931894 : Rat) / 1395206957462413) [(2, 1), (3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2766090479 : Rat) / 49510902) [(2, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((327908400577828390986977134137600 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1477823541695076589379944674988320 : Rat) / 24049240021528595265061175145067379) [(2, 1), (3, 1), (6, 1), (13, 2), (15, 1)],
  term ((112314480083123873857685044195808423928963585040031968835171328472018809432757480161267975030986922549553718944699 : Rat) / 45970174340950808695774128432463167907950509126637957547690918110328013577288555509539886988069616680415233348) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((310633722310001430793647 : Rat) / 1354469704718425465226) [(2, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-584211232539439590500206591191903592942898220522191645 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((7135641624820670 : Rat) / 1395206957462413) [(2, 1), (3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-828192219334010628447744246806565939006642314975007952059940729783665460575225022970702929348164321745818612699997 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(2, 1), (3, 1), (6, 1), (15, 1)],
  term ((-110466448510813017450487 : Rat) / 8126818228310552791356) [(2, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-319317955503280361704956078436969206260527520068360488881921595029926189541701769127041047864150277 : Rat) / 84767504241785923315468009566409936456260054225210591181618576064763964799995979122695246549257532) [(2, 1), (3, 1), (6, 1), (15, 3)],
  term ((6036204686447052 : Rat) / 1395206957462413) [(2, 1), (3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-304 : Rat) / 51) [(2, 1), (3, 1), (6, 2), (13, 1), (16, 1)],
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-239865742595437265882108009424014549563337582415204977019064718085569054751603794593021916147 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(2, 1), (3, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((-950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(2, 1), (3, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (3, 1), (7, 1), (8, 1), (14, 1)],
  term ((2430651631979297319851389943745972133937266035811183331483886589483930187981850246774956401103 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(2, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2178444170162957530803351933809730432834874990729317365816127452182797092088933887361681398122859513656731644716513 : Rat) / 112643180559038175435720914603558878458422426589109272936846503638738182600379302359486815120001502045194348474880) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((46640534819570921289814 : Rat) / 4676338877845046513121) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (3, 1), (7, 1), (9, 1), (12, 1), (15, 3)],
  term ((734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-44675718410490507930803609131388224000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (3, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((6507151989263087297395131580417245077161187789594226734316150494206849758872408870178781905349405278495275008896007 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(2, 1), (3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 21862830747804290112000872734472307445546425932084845046724608842188718834837864997198092416) [(3, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 46504586408161354304257513063101760065444209581104288023187341248905239579172880998611520) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1)],
  term ((3436593723883885225446431471645248000 : Rat) / 42041507163349345751221942892884216689) [(3, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 2)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 25103727119928797160060582850172054004655602121530729223590273453037574996006510385617861783616) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((574030 : Rat) / 69343) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((438359079078049353188758746287821564013946914589860808329514028578585487792709217700579519119901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (5, 1), (6, 1), (8, 1)],
  term ((-2134608775932531241654439081355116 : Rat) / 30920451456251051055078653757943773) [(3, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((-44078413356831377315030631380448323476636617068900848752013287553892716256817931375374924212576348337852017201290519 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1)],
  term ((9929692780031738430899 : Rat) / 1558779625948348837707) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((774310973182644768716975550838560 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((152 : Rat) / 51) [(3, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-414530879200720597164876063108362712562813428034068392179589465781125468990375486164874206164476771 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((649627177189263 : Rat) / 1395206957462413) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((1074245167 : Rat) / 99021804) [(3, 1), (5, 1), (6, 1), (16, 1)],
  term ((-10161410154142298256919870814455135357549798190292364090151467061016215320813394959182652713979 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(3, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((7854808122429499391225351268929168127193270817245752893874298437166131937050814073997171979 : Rat) / 9486935627264916278068532664872759053350618754545274756730217614776668874151267723716750080) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1)],
  term ((-119421631904965011584263493639672368000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-188684267778793262204620082940145057887744960655481433849025244150681011677921540745114714976478565 : Rat) / 5121160332465474620652358901435099016949742832792268761612415784419665299185328118666043803857664) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((-39895085 : Rat) / 7072986) [(3, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-228223548654087635462825679702744678736209534244863755006907506015675960802677752380739361809115 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(3, 1), (5, 1), (8, 1), (14, 1)],
  term ((1464849026145783864202066219637582 : Rat) / 30920451456251051055078653757943773) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((26031451343194241314953941122565091372219181384913399445061500520180309100826749782588457826358937761042999142694347 : Rat) / 3154009055653068912200185608899648596835827944495059642231702101884669112810620466065630823360042057265441757296640) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1)],
  term ((-46648022797508117536655 : Rat) / 9352677755690093026242) [(3, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (5, 1), (12, 1), (14, 1), (16, 1)],
  term ((8 : Rat) / 17) [(3, 1), (5, 1), (12, 1), (16, 1)],
  term ((-664852913330670802975584035892060 : Rat) / 24049240021528595265061175145067379) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-695986293428803935022998411405276434013803257129785474057195499050793765841356180589856941246946271 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(3, 1), (5, 1), (14, 1)],
  term ((83155724214916219625377321128013561409490640063211940674189048007963827698101161522433887297034519 : Rat) / 226046677978095795507914692177093163883360144600561576484316202839370572799989277660520657464686752) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-1174736530171009 : Rat) / 2790413914924826) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1254814339 : Rat) / 99021804) [(3, 1), (5, 1), (14, 1), (16, 1)],
  term ((20 : Rat) / 51) [(3, 1), (5, 1), (14, 2), (16, 1)],
  term ((-13 : Rat) / 102) [(3, 1), (5, 1), (16, 1)],
  term ((8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 890571716835482906164955021823166604126951794348629016670548606994258302) [(3, 1), (6, 1), (7, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-4313116540247450339268146604696784072629051030411866772078680263309041035453167644545154749099 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (6, 1), (7, 1), (8, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((3436593723883885225446431471645248000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 40198879776546255415544629935901521412502621841293537104789057689731647771827405608969280) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((-202759029709149228301339456827069632000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (6, 1), (7, 1), (9, 1), (15, 3)],
  term ((-152 : Rat) / 51) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((574030 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 21699831917226587375645588565402961936227723867763850684798371967879937708412407282483236457024) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-33867770 : Rat) / 3536493) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((285676354224687013146879544900792329648418077981974238576238417521060483746244208014203110905883 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(3, 1), (6, 1), (8, 1), (13, 1)],
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(3, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-771656695162152182892908449537916 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-89769049120763909367239176496388968921075799525697865395985933452379461447245131839803946735021 : Rat) / 1300838429494355261664051927701102293010012342959048280280114226110228770672852967333286498752) [(3, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((5890501935516780473905886024647924 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((33645074339121599131279742277155499450159309365004054570436808313914555991324979728610567790781 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(3, 1), (6, 1), (8, 1), (15, 1)],
  term ((6054808363587299595049634209404344 : Rat) / 30920451456251051055078653757943773) [(3, 1), (6, 1), (8, 1), (15, 3)],
  term ((22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 36387338945855459523818532326546571066562772819117253562513327682790408408181018601048478702796729962827587584) [(3, 1), (6, 1), (9, 1)],
  term ((-1315883553243244697701004615414931001600 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33566503132130417398849482832007528055940178302197119414533953550826124711337541583055952639420167233495635373139219 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((16652554168440290568845 : Rat) / 4676338877845046513121) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-349127175749358307299401520269764896335924968531882749102101384699972265891451572474429966582772684512581061769327 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-14733998758123296813629983269382991334400 : Rat) / 15008818057315716433186233612759665357973) [(3, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((726381667900088353382879 : Rat) / 18705355511380186052484) [(3, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((67993024914602653859100699487643637223261991823788488187995998685159442116247668312263180172935873275423373091729 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((-47378771947181737846355 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((25259581352375392004042941102617604209565975717366553998855544059040049049214517748375593453956712010244771548729 : Rat) / 593304938986657056471065765406254438832924745014119571525903329925633768399289026724159297095568483308021399040) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((-36140930482800245882702 : Rat) / 1558779625948348837707) [(3, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((4370314146020811289561 : Rat) / 12470237007586790701656) [(3, 1), (6, 1), (9, 1), (16, 1)],
  term ((-28 : Rat) / 17) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((152 : Rat) / 51) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((457034821909905838926144202455925955178239385839120662456679199396588033443904061554281949999806671 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(3, 1), (6, 1), (13, 1)],
  term ((-13774374059767336875539430222523313446505994468872152297854093723786594347815948206228362934656497 : Rat) / 126582352850488426357932599964850611294661722561955795661323836479299636632405709147818879332640) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-110245046 : Rat) / 8251817) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-61550833280362071054522754040664026538579172937204351318627135052166980514080233901608136758392757 : Rat) / 145315721557347297112230873542417033925017235814646727739917558968166796799993107067477565513012912) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((523901273465947 : Rat) / 1395206957462413) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((2766090479 : Rat) / 99021804) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((738911770847538294689972337494160 : Rat) / 24049240021528595265061175145067379) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((-112314480083123873857685044195808423928963585040031968835171328472018809432757480161267975030986922549553718944699 : Rat) / 91940348681901617391548256864926335815901018253275915095381836220656027154577111019079773976139233360830466696) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-310633722310001430793647 : Rat) / 2708939409436850930452) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((584211232539439590500206591191903592942898220522191645 : Rat) / 285071954829622879643311256928356724175362184887277392) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-3567820812410335 : Rat) / 1395206957462413) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((828192219334010628447744246806565939006642314975007952059940729783665460575225022970702929348164321745818612699997 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(3, 1), (6, 1), (15, 1)],
  term ((110466448510813017450487 : Rat) / 16253636456621105582712) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((319317955503280361704956078436969206260527520068360488881921595029926189541701769127041047864150277 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(3, 1), (6, 1), (15, 3)],
  term ((-3018102343223526 : Rat) / 1395206957462413) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((152 : Rat) / 51) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (7, 1), (8, 1), (12, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(3, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((239865742595437265882108009424014549563337582415204977019064718085569054751603794593021916147 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (12, 1), (15, 2)],
  term ((950347712257912786618405184085732083799621413480580814186827854627415821371036938628593419293 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(3, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(3, 1), (7, 1), (8, 1), (14, 1)],
  term ((-2430651631979297319851389943745972133937266035811183331483886589483930187981850246774956401103 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(3, 1), (7, 1), (8, 1), (14, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((2178444170162957530803351933809730432834874990729317365816127452182797092088933887361681398122859513656731644716513 : Rat) / 225286361118076350871441829207117756916844853178218545873693007277476365200758604718973630240003004090388696949760) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-23320267409785460644907 : Rat) / 4676338877845046513121) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 3)],
  term ((-734622342385492748819637169036540903982104464922264659139322875418415217134248798287505293 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((22337859205245253965401804565694112000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-6507151989263087297395131580417245077161187789594226734316150494206849758872408870178781905349405278495275008896007 : Rat) / 675859083354229052614325487621353270750534559534655637621079021832429095602275814156920890720009012271166090849280) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 1000 through 1099. -/
theorem ep_Q1_009_block_09_1000_1099_valid :
    checkProductSumEq ep_Q1_009_partials_09_1000_1099
      ep_Q1_009_block_09_1000_1099 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
