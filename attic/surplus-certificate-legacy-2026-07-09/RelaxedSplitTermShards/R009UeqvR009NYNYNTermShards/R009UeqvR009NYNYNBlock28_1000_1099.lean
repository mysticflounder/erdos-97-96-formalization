/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1000-1099

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1000 : Poly :=
[
  term ((-55738252728285901278133450364364551761860725606292273201739872572 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1000 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1000 : Poly :=
[
  term ((55738252728285901278133450364364551761860725606292273201739872572 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-111476505456571802556266900728729103523721451212584546403479745144 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1000_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1000
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1001 : Poly :=
[
  term ((-9083316364943928904261906234286143671693499882721046012762212518 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1001 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1001 : Poly :=
[
  term ((9083316364943928904261906234286143671693499882721046012762212518 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-18166632729887857808523812468572287343386999765442092025524425036 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1001_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1001
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1002 : Poly :=
[
  term ((990628657022764908336 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1002 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1002 : Poly :=
[
  term ((-990628657022764908336 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1981257314045529816672 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1002_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1002
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1003 : Poly :=
[
  term ((5253204604641490741344 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1003 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1003 : Poly :=
[
  term ((10506409209282981482688 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5253204604641490741344 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1003_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1003
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1004 : Poly :=
[
  term ((481835446054760627544351963739596041938815155013699659690584319 : Rat) / 8231857529374498990290752643941643637656359350215882530505810) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1004 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1004 : Poly :=
[
  term ((481835446054760627544351963739596041938815155013699659690584319 : Rat) / 4115928764687249495145376321970821818828179675107941265252905) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-481835446054760627544351963739596041938815155013699659690584319 : Rat) / 8231857529374498990290752643941643637656359350215882530505810) [(2, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1004_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1004
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1005 : Poly :=
[
  term ((51868599265107573780 : Rat) / 123978807561639952033) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1005 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1005 : Poly :=
[
  term ((103737198530215147560 : Rat) / 123978807561639952033) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51868599265107573780 : Rat) / 123978807561639952033) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1005_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1005
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1006 : Poly :=
[
  term ((-3104483728852447577978157842529622790033169964451069076315469902638117184413 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(2, 1), (10, 1), (12, 1)]
]

/-- Partial product 1006 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1006 : Poly :=
[
  term ((3104483728852447577978157842529622790033169964451069076315469902638117184413 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(2, 1), (10, 1), (12, 1)],
  term ((-3104483728852447577978157842529622790033169964451069076315469902638117184413 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(2, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1006_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1006
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1007 : Poly :=
[
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1007 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1007 : Poly :=
[
  term ((44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 1371069618788511269055766774065036398827875066971349850059006132) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1007_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1007
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1008 : Poly :=
[
  term ((-1040806163970936 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1008 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1008 : Poly :=
[
  term ((1040806163970936 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2081612327941872 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1008_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1008
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1009 : Poly :=
[
  term ((16233886065342883339640443703796458244562935218838021293323574513939293696457 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1009 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1009 : Poly :=
[
  term ((16233886065342883339640443703796458244562935218838021293323574513939293696457 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16233886065342883339640443703796458244562935218838021293323574513939293696457 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1009_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1009
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1010 : Poly :=
[
  term ((-13158935076718168278512 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1010 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1010 : Poly :=
[
  term ((-26317870153436336557024 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13158935076718168278512 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1010_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1010
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1011 : Poly :=
[
  term ((2523065232219677580928815433485607404778541 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (10, 1), (12, 1), (13, 2)]
]

/-- Partial product 1011 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1011 : Poly :=
[
  term ((-2523065232219677580928815433485607404778541 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (10, 1), (12, 1), (13, 2)],
  term ((2523065232219677580928815433485607404778541 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1011_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1011
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1012 : Poly :=
[
  term ((-57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1012 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1012 : Poly :=
[
  term ((57381500752095027404434458230612059519021 : Rat) / 2374030498538876890092772090581947957130) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1012_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1012
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1013 : Poly :=
[
  term ((-4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1013 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1013 : Poly :=
[
  term ((4737656448675445280648 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1013_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1013
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1014 : Poly :=
[
  term ((104157403615989776267204 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1014 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1014 : Poly :=
[
  term ((208314807231979552534408 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-104157403615989776267204 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1014_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1014
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1015 : Poly :=
[
  term ((-11391443227800450002421066588707515926401030041630866406367981177525 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(2, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 1015 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1015 : Poly :=
[
  term ((-11391443227800450002421066588707515926401030041630866406367981177525 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((11391443227800450002421066588707515926401030041630866406367981177525 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(2, 1), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1015_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1015
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1016 : Poly :=
[
  term ((-3421840724295444 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1016 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1016 : Poly :=
[
  term ((-6843681448590888 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3421840724295444 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1016_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1016
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1017 : Poly :=
[
  term ((-44853870810172687856 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1017 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1017 : Poly :=
[
  term ((-89707741620345375712 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((44853870810172687856 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1017_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1017
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1018 : Poly :=
[
  term ((-564414362775942713410826175138701771677101122393499627953272512883233777863 : Rat) / 2118517034021042950537699886887531294670344625897774179169834579121713430) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1018 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1018 : Poly :=
[
  term ((-564414362775942713410826175138701771677101122393499627953272512883233777863 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(2, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((564414362775942713410826175138701771677101122393499627953272512883233777863 : Rat) / 2118517034021042950537699886887531294670344625897774179169834579121713430) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1018_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1018
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1019 : Poly :=
[
  term ((11191098587923079283392 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1019 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1019 : Poly :=
[
  term ((22382197175846158566784 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11191098587923079283392 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1019_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1019
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1020 : Poly :=
[
  term ((-385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (12, 2), (13, 2)]
]

/-- Partial product 1020 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1020 : Poly :=
[
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (12, 2), (13, 2)],
  term ((-771550671415912258681082857570897192444402 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (12, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1020_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1020
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1021 : Poly :=
[
  term ((-63702447060519027808976 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 2), (13, 2), (16, 1)]
]

/-- Partial product 1021 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1021 : Poly :=
[
  term ((-127404894121038055617952 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1021_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1021
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1022 : Poly :=
[
  term ((3727393535097191541377621920667920466101080681661936688990736782393 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(2, 1), (10, 1), (12, 2), (15, 2)]
]

/-- Partial product 1022 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1022 : Poly :=
[
  term ((3727393535097191541377621920667920466101080681661936688990736782393 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(2, 1), (10, 1), (12, 2), (14, 1), (15, 2)],
  term ((-3727393535097191541377621920667920466101080681661936688990736782393 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(2, 1), (10, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1022_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1022
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1023 : Poly :=
[
  term ((1891231919170704 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1023 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1023 : Poly :=
[
  term ((3782463838341408 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1891231919170704 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1023_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1023
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1024 : Poly :=
[
  term ((-16977091567023200877734604794684744767462844118875700638111203799 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1024 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1024 : Poly :=
[
  term ((16977091567023200877734604794684744767462844118875700638111203799 : Rat) / 19194974663039157766780734836910509583590250937598897900826085848) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16977091567023200877734604794684744767462844118875700638111203799 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1024_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1024
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1025 : Poly :=
[
  term ((3586292146721196 : Rat) / 7342292683791569) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1025 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1025 : Poly :=
[
  term ((-3586292146721196 : Rat) / 7342292683791569) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7172584293442392 : Rat) / 7342292683791569) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1025_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1025
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1026 : Poly :=
[
  term ((-20139732925301247332529099919098507094830928587914547976833840001394260764666227 : Rat) / 25509867182074075804405682775900894072375322184948370460900215001010425164000) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1026 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1026 : Poly :=
[
  term ((-20139732925301247332529099919098507094830928587914547976833840001394260764666227 : Rat) / 12754933591037037902202841387950447036187661092474185230450107500505212582000) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((20139732925301247332529099919098507094830928587914547976833840001394260764666227 : Rat) / 25509867182074075804405682775900894072375322184948370460900215001010425164000) [(2, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1026_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1026
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1027 : Poly :=
[
  term ((-21703895186334287836194233 : Rat) / 3788172465045908734368315) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1027 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1027 : Poly :=
[
  term ((-43407790372668575672388466 : Rat) / 3788172465045908734368315) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21703895186334287836194233 : Rat) / 3788172465045908734368315) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1027_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1027
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1028 : Poly :=
[
  term ((-662680463969664975152110231955577336509747874531301999932120529320034657367131 : Rat) / 6002321689899782542213101829623739781735369925870204814329462353178923568000) [(2, 1), (10, 1), (13, 2)]
]

/-- Partial product 1028 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1028 : Poly :=
[
  term ((662680463969664975152110231955577336509747874531301999932120529320034657367131 : Rat) / 6002321689899782542213101829623739781735369925870204814329462353178923568000) [(2, 1), (10, 1), (13, 2)],
  term ((-662680463969664975152110231955577336509747874531301999932120529320034657367131 : Rat) / 3001160844949891271106550914811869890867684962935102407164731176589461784000) [(2, 1), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1028_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1028
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1029 : Poly :=
[
  term ((-141844910422789883587067015125792134940829 : Rat) / 1582686999025917926728514727054631971420) [(2, 1), (10, 1), (13, 2), (14, 1)]
]

/-- Partial product 1029 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1029 : Poly :=
[
  term ((141844910422789883587067015125792134940829 : Rat) / 1582686999025917926728514727054631971420) [(2, 1), (10, 1), (13, 2), (14, 1)],
  term ((-141844910422789883587067015125792134940829 : Rat) / 791343499512958963364257363527315985710) [(2, 1), (10, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1029_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1029
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1030 : Poly :=
[
  term ((-5855654224517523283076 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1030 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1030 : Poly :=
[
  term ((5855654224517523283076 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-11711308449035046566152 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1030_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1030
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1031 : Poly :=
[
  term ((-5678838792048101270844644 : Rat) / 3788172465045908734368315) [(2, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 1031 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1031 : Poly :=
[
  term ((-11357677584096202541689288 : Rat) / 3788172465045908734368315) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((5678838792048101270844644 : Rat) / 3788172465045908734368315) [(2, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1031_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1031
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1032 : Poly :=
[
  term ((-1342665299404653224806667846409839240390373157478769325115314073365 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(2, 1), (10, 1), (15, 2)]
]

/-- Partial product 1032 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1032 : Poly :=
[
  term ((-1342665299404653224806667846409839240390373157478769325115314073365 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((1342665299404653224806667846409839240390373157478769325115314073365 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(2, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1032_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1032
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1033 : Poly :=
[
  term ((-587298807520623 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1033 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1033 : Poly :=
[
  term ((-1174597615041246 : Rat) / 7342292683791569) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((587298807520623 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1033_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1033
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1034 : Poly :=
[
  term ((-1071350721253800527381 : Rat) / 64098215129500397370) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 1034 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1034 : Poly :=
[
  term ((-1071350721253800527381 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((1071350721253800527381 : Rat) / 64098215129500397370) [(2, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1034_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1034
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1035 : Poly :=
[
  term ((-2015565206660543482819781499749031186114918652887942473154159424522782062132799403 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(2, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1035 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1035 : Poly :=
[
  term ((2015565206660543482819781499749031186114918652887942473154159424522782062132799403 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-2015565206660543482819781499749031186114918652887942473154159424522782062132799403 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1035_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1035
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1036 : Poly :=
[
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1036 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1036 : Poly :=
[
  term ((-273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1036_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1036
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1037 : Poly :=
[
  term ((5036825696373545162176 : Rat) / 619894037808199760165) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1037 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1037 : Poly :=
[
  term ((-5036825696373545162176 : Rat) / 619894037808199760165) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10073651392747090324352 : Rat) / 619894037808199760165) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1037_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1037
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1038 : Poly :=
[
  term ((-281357461937862658834918487 : Rat) / 3788172465045908734368315) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1038 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1038 : Poly :=
[
  term ((-562714923875725317669836974 : Rat) / 3788172465045908734368315) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((281357461937862658834918487 : Rat) / 3788172465045908734368315) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1038_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1038
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1039 : Poly :=
[
  term ((101519399585741688077734088152345771744168100517802514492760437490149840156171 : Rat) / 104702152786221770661160874020504333034782392691871241874017689168233854720) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1039 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1039 : Poly :=
[
  term ((101519399585741688077734088152345771744168100517802514492760437490149840156171 : Rat) / 52351076393110885330580437010252166517391196345935620937008844584116927360) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-101519399585741688077734088152345771744168100517802514492760437490149840156171 : Rat) / 104702152786221770661160874020504333034782392691871241874017689168233854720) [(2, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1039_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1039
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1040 : Poly :=
[
  term ((620992214923522967969621 : Rat) / 39875499632062197203877) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1040 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1040 : Poly :=
[
  term ((1241984429847045935939242 : Rat) / 39875499632062197203877) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-620992214923522967969621 : Rat) / 39875499632062197203877) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1040_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1040
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1041 : Poly :=
[
  term ((988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(2, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1041 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1041 : Poly :=
[
  term ((-988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((1976522159204377063438149020304315863905456 : Rat) / 366362731255999520076045075707090734125) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1041_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1041
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1042 : Poly :=
[
  term ((26805306499882649602368 : Rat) / 619894037808199760165) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1042 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1042 : Poly :=
[
  term ((53610612999765299204736 : Rat) / 619894037808199760165) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-26805306499882649602368 : Rat) / 619894037808199760165) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1042_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1042
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1043 : Poly :=
[
  term ((-11639019871248737351896232843130775891507977871546243222310758261 : Rat) / 6498834891611446571282173139953929187623441592275696734609850) [(2, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1043 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1043 : Poly :=
[
  term ((-11639019871248737351896232843130775891507977871546243222310758261 : Rat) / 3249417445805723285641086569976964593811720796137848367304925) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((11639019871248737351896232843130775891507977871546243222310758261 : Rat) / 6498834891611446571282173139953929187623441592275696734609850) [(2, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1043_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1043
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1044 : Poly :=
[
  term ((-194099778382261789088 : Rat) / 6525200397981050107) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1044 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1044 : Poly :=
[
  term ((-388199556764523578176 : Rat) / 6525200397981050107) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((194099778382261789088 : Rat) / 6525200397981050107) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1044_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1044
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1045 : Poly :=
[
  term ((41331212231648121411162766971842876622843725239093504651994615802518202273218906653 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 1045 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1045 : Poly :=
[
  term ((-41331212231648121411162766971842876622843725239093504651994615802518202273218906653 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(2, 1), (11, 1), (13, 1)],
  term ((41331212231648121411162766971842876622843725239093504651994615802518202273218906653 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(2, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1045_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1045
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1046 : Poly :=
[
  term ((201971228240033744671306220514225166942266392536892951360439906400662929824496119 : Rat) / 219195895786710577282300681629963237955224990626223035071438884453126616224000) [(2, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1046 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1046 : Poly :=
[
  term ((-201971228240033744671306220514225166942266392536892951360439906400662929824496119 : Rat) / 219195895786710577282300681629963237955224990626223035071438884453126616224000) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((201971228240033744671306220514225166942266392536892951360439906400662929824496119 : Rat) / 109597947893355288641150340814981618977612495313111517535719442226563308112000) [(2, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1046_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1046
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1047 : Poly :=
[
  term ((11118009425122566935531473 : Rat) / 841816103343535274304070) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1047 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1047 : Poly :=
[
  term ((-11118009425122566935531473 : Rat) / 841816103343535274304070) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11118009425122566935531473 : Rat) / 420908051671767637152035) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1047_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1047
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1048 : Poly :=
[
  term ((-570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 653863282105260169919043174965287436626649575894374746657356351580775750) [(2, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1048 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1048 : Poly :=
[
  term ((-570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 326931641052630084959521587482643718313324787947187373328678175790387875) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 653863282105260169919043174965287436626649575894374746657356351580775750) [(2, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1048_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1048
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1049 : Poly :=
[
  term ((-402787655279832436132 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1049 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1049 : Poly :=
[
  term ((-805575310559664872264 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((402787655279832436132 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1049_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1049
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1050 : Poly :=
[
  term ((411709646824826749936466737 : Rat) / 7576344930091817468736630) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1050 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1050 : Poly :=
[
  term ((411709646824826749936466737 : Rat) / 3788172465045908734368315) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-411709646824826749936466737 : Rat) / 7576344930091817468736630) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1050_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1050
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1051 : Poly :=
[
  term ((-793062858382678347105065952594416564314445464615186613081975197303489101733 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1051 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1051 : Poly :=
[
  term ((-1586125716765356694210131905188833128628890929230373226163950394606978203466 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((793062858382678347105065952594416564314445464615186613081975197303489101733 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1051_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1051
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1052 : Poly :=
[
  term ((-12125909276773547936 : Rat) / 88556291115457108595) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1052 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1052 : Poly :=
[
  term ((-24251818553547095872 : Rat) / 88556291115457108595) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((12125909276773547936 : Rat) / 88556291115457108595) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1052_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1052
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1053 : Poly :=
[
  term ((1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (13, 3)]
]

/-- Partial product 1053 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1053 : Poly :=
[
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (13, 3)],
  term ((2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1053_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1053
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1054 : Poly :=
[
  term ((2799489730243137442256 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 1054 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1054 : Poly :=
[
  term ((5598979460486274884512 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1054_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1054
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1055 : Poly :=
[
  term ((35618697025018661449480349708168330424113131869798563383070596769 : Rat) / 51186599101437754044748626231761358889574002500263727735536228928) [(2, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1055 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1055 : Poly :=
[
  term ((-35618697025018661449480349708168330424113131869798563383070596769 : Rat) / 51186599101437754044748626231761358889574002500263727735536228928) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((35618697025018661449480349708168330424113131869798563383070596769 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(2, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1055_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1055
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1056 : Poly :=
[
  term ((-1739214840998151 : Rat) / 14684585367583138) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1056 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1056 : Poly :=
[
  term ((1739214840998151 : Rat) / 14684585367583138) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1739214840998151 : Rat) / 7342292683791569) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1056_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1056
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1057 : Poly :=
[
  term ((-18192239511014601845763516288972009825000398251782436899103327491300530233301376461 : Rat) / 30993771481359461867290130115774079043885789036016307706004900577613180337408000) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 1057 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1057 : Poly :=
[
  term ((-18192239511014601845763516288972009825000398251782436899103327491300530233301376461 : Rat) / 15496885740679730933645065057887039521942894518008153853002450288806590168704000) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((18192239511014601845763516288972009825000398251782436899103327491300530233301376461 : Rat) / 30993771481359461867290130115774079043885789036016307706004900577613180337408000) [(2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1057_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1057
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1058 : Poly :=
[
  term ((-16246594987176468383982314 : Rat) / 1262724155015302911456105) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1058 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1058 : Poly :=
[
  term ((-32493189974352936767964628 : Rat) / 1262724155015302911456105) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16246594987176468383982314 : Rat) / 1262724155015302911456105) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1058_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1058
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1059 : Poly :=
[
  term ((-35150633979501694629231306652120654839162021897885607996043353519 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(2, 1), (11, 2)]
]

/-- Partial product 1059 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1059 : Poly :=
[
  term ((35150633979501694629231306652120654839162021897885607996043353519 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(2, 1), (11, 2)],
  term ((-35150633979501694629231306652120654839162021897885607996043353519 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1059_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1059
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1060 : Poly :=
[
  term ((-34610506597012347905781895487689189458970163457919308605737905263 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (11, 2), (12, 1)]
]

/-- Partial product 1060 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1060 : Poly :=
[
  term ((34610506597012347905781895487689189458970163457919308605737905263 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (11, 2), (12, 1)],
  term ((-34610506597012347905781895487689189458970163457919308605737905263 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1060_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1060
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1061 : Poly :=
[
  term ((147011909071790528596 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1061 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1061 : Poly :=
[
  term ((294023818143581057192 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-147011909071790528596 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1061_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1061
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1062 : Poly :=
[
  term ((-3512157401358461500788959803102558196348826887794732098977557004 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 1062 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1062 : Poly :=
[
  term ((-7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((3512157401358461500788959803102558196348826887794732098977557004 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1062_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1062
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1063 : Poly :=
[
  term ((236801443996489053408 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1063 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1063 : Poly :=
[
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-236801443996489053408 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1063_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1063
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1064 : Poly :=
[
  term ((7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 2)]
]

/-- Partial product 1064 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1064 : Poly :=
[
  term ((-7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 2)],
  term ((14048629605433846003155839212410232785395307551178928395910228016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1064_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1064
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1065 : Poly :=
[
  term ((-473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 1065 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1065 : Poly :=
[
  term ((-947205775985956213632 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1065_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1065
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1066 : Poly :=
[
  term ((11738884823952003553428342702254434596658038713810864512291974361 : Rat) / 246955725881234969708722579318249309129690780506476475915174300) [(2, 1), (11, 2), (14, 1)]
]

/-- Partial product 1066 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1066 : Poly :=
[
  term ((-11738884823952003553428342702254434596658038713810864512291974361 : Rat) / 246955725881234969708722579318249309129690780506476475915174300) [(2, 1), (11, 2), (14, 1)],
  term ((11738884823952003553428342702254434596658038713810864512291974361 : Rat) / 123477862940617484854361289659124654564845390253238237957587150) [(2, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1066_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1066
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1067 : Poly :=
[
  term ((-52392551558492845606 : Rat) / 123978807561639952033) [(2, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1067 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1067 : Poly :=
[
  term ((52392551558492845606 : Rat) / 123978807561639952033) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-104785103116985691212 : Rat) / 123978807561639952033) [(2, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1067_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1067
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1068 : Poly :=
[
  term ((1298958068703118966474 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (16, 1)]
]

/-- Partial product 1068 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1068 : Poly :=
[
  term ((2597916137406237932948 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((-1298958068703118966474 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1068_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1068
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1069 : Poly :=
[
  term ((375394804605598562140348940784526855170080103848835821630869665749819038177745497 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(2, 1), (12, 1)]
]

/-- Partial product 1069 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1069 : Poly :=
[
  term ((-375394804605598562140348940784526855170080103848835821630869665749819038177745497 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(2, 1), (12, 1)],
  term ((375394804605598562140348940784526855170080103848835821630869665749819038177745497 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1069_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1069
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1070 : Poly :=
[
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1070 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1070 : Poly :=
[
  term ((-58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1070_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1070
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1071 : Poly :=
[
  term ((2348872156474817556622 : Rat) / 32049107564750198685) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1071 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1071 : Poly :=
[
  term ((-2348872156474817556622 : Rat) / 32049107564750198685) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4697744312949635113244 : Rat) / 32049107564750198685) [(2, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1071_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1071
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1072 : Poly :=
[
  term ((490903188297461818714996351924471288620615642277048401994615005429249816399373414363 : Rat) / 81236306303773747420581498935028901915026962841769059145212844671849283200153600) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1072 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1072 : Poly :=
[
  term ((490903188297461818714996351924471288620615642277048401994615005429249816399373414363 : Rat) / 40618153151886873710290749467514450957513481420884529572606422335924641600076800) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-490903188297461818714996351924471288620615642277048401994615005429249816399373414363 : Rat) / 81236306303773747420581498935028901915026962841769059145212844671849283200153600) [(2, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1072_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1072
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1073 : Poly :=
[
  term ((68786563674829221476921591 : Rat) / 398754996320621972038770) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1073 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1073 : Poly :=
[
  term ((68786563674829221476921591 : Rat) / 199377498160310986019385) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-68786563674829221476921591 : Rat) / 398754996320621972038770) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1073_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1073
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1074 : Poly :=
[
  term ((-214822939657729897953811081854994840533472415040590781489026232347432605796811985907 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(2, 1), (12, 1), (13, 2)]
]

/-- Partial product 1074 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1074 : Poly :=
[
  term ((214822939657729897953811081854994840533472415040590781489026232347432605796811985907 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(2, 1), (12, 1), (13, 2)],
  term ((-214822939657729897953811081854994840533472415040590781489026232347432605796811985907 : Rat) / 120585142169664156327425662481683526280118147968250947168675316309776279750228000) [(2, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1074_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1074
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1075 : Poly :=
[
  term ((-151468046208947825915679929103699431466889913409132487179559025311 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1075 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1075 : Poly :=
[
  term ((151468046208947825915679929103699431466889913409132487179559025311 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (12, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1075_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1075
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1076 : Poly :=
[
  term ((-89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1076 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1076 : Poly :=
[
  term ((89318765789905029800048 : Rat) / 13017774793972194963465) [(2, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (12, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1076_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1076
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1077 : Poly :=
[
  term ((-159562723207625044604839229 : Rat) / 3788172465045908734368315) [(2, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1077 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1077 : Poly :=
[
  term ((-319125446415250089209678458 : Rat) / 3788172465045908734368315) [(2, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((159562723207625044604839229 : Rat) / 3788172465045908734368315) [(2, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1077_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1077
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1078 : Poly :=
[
  term ((4344730130075975005001747801261151533682639724661 : Rat) / 881254482753797208135326891834141428930178904822) [(2, 1), (12, 1), (14, 1)]
]

/-- Partial product 1078 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1078 : Poly :=
[
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 881254482753797208135326891834141428930178904822) [(2, 1), (12, 1), (14, 1)],
  term ((4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(2, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1078_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1078
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1079 : Poly :=
[
  term ((-19746277650951446265269316778019027058401034834973136770587962432905451644662941 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(2, 1), (12, 1), (15, 2)]
]

/-- Partial product 1079 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1079 : Poly :=
[
  term ((-19746277650951446265269316778019027058401034834973136770587962432905451644662941 : Rat) / 21763999974220046996887290075290387910578943053573664240800740682593710336000) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((19746277650951446265269316778019027058401034834973136770587962432905451644662941 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(2, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1079_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1079
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1080 : Poly :=
[
  term ((-20238662152194606439 : Rat) / 872084559585039420) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1080 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1080 : Poly :=
[
  term ((-20238662152194606439 : Rat) / 436042279792519710) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((20238662152194606439 : Rat) / 872084559585039420) [(2, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1080_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1080
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1081 : Poly :=
[
  term ((5556291081884232074827 : Rat) / 512785721036003178960) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 1081 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1081 : Poly :=
[
  term ((5556291081884232074827 : Rat) / 256392860518001589480) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5556291081884232074827 : Rat) / 512785721036003178960) [(2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1081_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1081
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1082 : Poly :=
[
  term ((-112358918862682539851951363983108370171556460244570838805926923092109649512071 : Rat) / 1865485712076004028304624863596318963763909404592028363497206344222318028800) [(2, 1), (12, 2)]
]

/-- Partial product 1082 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1082 : Poly :=
[
  term ((112358918862682539851951363983108370171556460244570838805926923092109649512071 : Rat) / 1865485712076004028304624863596318963763909404592028363497206344222318028800) [(2, 1), (12, 2)],
  term ((-112358918862682539851951363983108370171556460244570838805926923092109649512071 : Rat) / 932742856038002014152312431798159481881954702296014181748603172111159014400) [(2, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1082_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1082
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1083 : Poly :=
[
  term ((112836300917189417929847903781866119204982457385668787966421294094463513429 : Rat) / 33450268958226993955858419266645230968479125672070118618471072301921791) [(2, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1083 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1083 : Poly :=
[
  term ((225672601834378835859695807563732238409964914771337575932842588188927026858 : Rat) / 33450268958226993955858419266645230968479125672070118618471072301921791) [(2, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-112836300917189417929847903781866119204982457385668787966421294094463513429 : Rat) / 33450268958226993955858419266645230968479125672070118618471072301921791) [(2, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1083_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1083
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1084 : Poly :=
[
  term ((5262536548293604686712 : Rat) / 137029208357602052247) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1084 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1084 : Poly :=
[
  term ((10525073096587209373424 : Rat) / 137029208357602052247) [(2, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5262536548293604686712 : Rat) / 137029208357602052247) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1084_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1084
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1085 : Poly :=
[
  term ((-959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(2, 1), (12, 2), (13, 2)]
]

/-- Partial product 1085 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1085 : Poly :=
[
  term ((959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(2, 1), (12, 2), (13, 2)],
  term ((-1919082530258311708738182675806734919634326 : Rat) / 395671749756479481682128681763657992855) [(2, 1), (12, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1085_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1085
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1086 : Poly :=
[
  term ((-158447471848089107621488 : Rat) / 4339258264657398321155) [(2, 1), (12, 2), (13, 2), (16, 1)]
]

/-- Partial product 1086 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1086 : Poly :=
[
  term ((-316894943696178215242976 : Rat) / 4339258264657398321155) [(2, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(2, 1), (12, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1086_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1086
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1087 : Poly :=
[
  term ((-72345988081600546703809593521941558628996881013361985572893828410121888665158941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (12, 2), (15, 2)]
]

/-- Partial product 1087 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1087 : Poly :=
[
  term ((-72345988081600546703809593521941558628996881013361985572893828410121888665158941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (12, 2), (14, 1), (15, 2)],
  term ((72345988081600546703809593521941558628996881013361985572893828410121888665158941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1087_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1087
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1088 : Poly :=
[
  term ((-2561770491363536760742 : Rat) / 32049107564750198685) [(2, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1088 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1088 : Poly :=
[
  term ((-5123540982727073521484 : Rat) / 32049107564750198685) [(2, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((2561770491363536760742 : Rat) / 32049107564750198685) [(2, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1088_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1088
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1089 : Poly :=
[
  term ((-47039863792550259067 : Rat) / 12819643025900079474) [(2, 1), (12, 2), (16, 1)]
]

/-- Partial product 1089 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1089 : Poly :=
[
  term ((-47039863792550259067 : Rat) / 6409821512950039737) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((47039863792550259067 : Rat) / 12819643025900079474) [(2, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1089_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1089
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1090 : Poly :=
[
  term ((-57393269864058856617025645859958433403477487310404414268764313892374272769878941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1090 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1090 : Poly :=
[
  term ((57393269864058856617025645859958433403477487310404414268764313892374272769878941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-57393269864058856617025645859958433403477487310404414268764313892374272769878941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1090_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1090
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1091 : Poly :=
[
  term ((-1070484610703458968011 : Rat) / 64098215129500397370) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1091 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1091 : Poly :=
[
  term ((1070484610703458968011 : Rat) / 64098215129500397370) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1070484610703458968011 : Rat) / 32049107564750198685) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1091_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1091
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1092 : Poly :=
[
  term ((-2103015458150449162107602918970475134221250400633071536988388859715240513008726540849 : Rat) / 189385253959717938771907788928288237593314391901056702301723196167501396417536000) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 1092 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1092 : Poly :=
[
  term ((-2103015458150449162107602918970475134221250400633071536988388859715240513008726540849 : Rat) / 94692626979858969385953894464144118796657195950528351150861598083750698208768000) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((2103015458150449162107602918970475134221250400633071536988388859715240513008726540849 : Rat) / 189385253959717938771907788928288237593314391901056702301723196167501396417536000) [(2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1092_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1092
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1093 : Poly :=
[
  term ((-7227343797476472455767027661 : Rat) / 30305379720367269874946520) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1093 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1093 : Poly :=
[
  term ((-7227343797476472455767027661 : Rat) / 15152689860183634937473260) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7227343797476472455767027661 : Rat) / 30305379720367269874946520) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1093_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1093
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1094 : Poly :=
[
  term ((364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 32905670850924270457338402577560873571869001607312396401416147168) [(2, 1), (13, 1), (15, 3)]
]

/-- Partial product 1094 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1094 : Poly :=
[
  term ((364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 16452835425462135228669201288780436785934500803656198200708073584) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((-364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 32905670850924270457338402577560873571869001607312396401416147168) [(2, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1094_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1094
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1095 : Poly :=
[
  term ((-94454695759941 : Rat) / 7342292683791569) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1095 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1095 : Poly :=
[
  term ((-188909391519882 : Rat) / 7342292683791569) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((94454695759941 : Rat) / 7342292683791569) [(2, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1095_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1095
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1096 : Poly :=
[
  term ((21979862513992621561415069801277860199285437262290759839559062358928303096466671266173 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(2, 1), (13, 2)]
]

/-- Partial product 1096 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1096 : Poly :=
[
  term ((-21979862513992621561415069801277860199285437262290759839559062358928303096466671266173 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(2, 1), (13, 2)],
  term ((21979862513992621561415069801277860199285437262290759839559062358928303096466671266173 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(2, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1096_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1096
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1097 : Poly :=
[
  term ((9413574603427159912941396865160957810051789560924527393785983610063761858118061047 : Rat) / 67696921919811456183817915779190751595855802368140882621010703893207736000128000) [(2, 1), (13, 2), (14, 1)]
]

/-- Partial product 1097 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1097 : Poly :=
[
  term ((-9413574603427159912941396865160957810051789560924527393785983610063761858118061047 : Rat) / 67696921919811456183817915779190751595855802368140882621010703893207736000128000) [(2, 1), (13, 2), (14, 1)],
  term ((9413574603427159912941396865160957810051789560924527393785983610063761858118061047 : Rat) / 33848460959905728091908957889595375797927901184070441310505351946603868000064000) [(2, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1097_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1097
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1098 : Poly :=
[
  term ((152776783819006343297969 : Rat) / 66459166053436995339795) [(2, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1098 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1098 : Poly :=
[
  term ((-152776783819006343297969 : Rat) / 66459166053436995339795) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((305553567638012686595938 : Rat) / 66459166053436995339795) [(2, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1098_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1098
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1099 : Poly :=
[
  term ((-301865906564217309243282051968828762661781190834556241639105530839696186963 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(2, 1), (13, 2), (15, 2)]
]

/-- Partial product 1099 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1099 : Poly :=
[
  term ((-301865906564217309243282051968828762661781190834556241639105530839696186963 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((301865906564217309243282051968828762661781190834556241639105530839696186963 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(2, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1099_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1099
        rs_R009_ueqv_R009NYNYN_generator_28_1000_1099 =
      rs_R009_ueqv_R009NYNYN_partial_28_1099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1000_1099 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1000,
  rs_R009_ueqv_R009NYNYN_partial_28_1001,
  rs_R009_ueqv_R009NYNYN_partial_28_1002,
  rs_R009_ueqv_R009NYNYN_partial_28_1003,
  rs_R009_ueqv_R009NYNYN_partial_28_1004,
  rs_R009_ueqv_R009NYNYN_partial_28_1005,
  rs_R009_ueqv_R009NYNYN_partial_28_1006,
  rs_R009_ueqv_R009NYNYN_partial_28_1007,
  rs_R009_ueqv_R009NYNYN_partial_28_1008,
  rs_R009_ueqv_R009NYNYN_partial_28_1009,
  rs_R009_ueqv_R009NYNYN_partial_28_1010,
  rs_R009_ueqv_R009NYNYN_partial_28_1011,
  rs_R009_ueqv_R009NYNYN_partial_28_1012,
  rs_R009_ueqv_R009NYNYN_partial_28_1013,
  rs_R009_ueqv_R009NYNYN_partial_28_1014,
  rs_R009_ueqv_R009NYNYN_partial_28_1015,
  rs_R009_ueqv_R009NYNYN_partial_28_1016,
  rs_R009_ueqv_R009NYNYN_partial_28_1017,
  rs_R009_ueqv_R009NYNYN_partial_28_1018,
  rs_R009_ueqv_R009NYNYN_partial_28_1019,
  rs_R009_ueqv_R009NYNYN_partial_28_1020,
  rs_R009_ueqv_R009NYNYN_partial_28_1021,
  rs_R009_ueqv_R009NYNYN_partial_28_1022,
  rs_R009_ueqv_R009NYNYN_partial_28_1023,
  rs_R009_ueqv_R009NYNYN_partial_28_1024,
  rs_R009_ueqv_R009NYNYN_partial_28_1025,
  rs_R009_ueqv_R009NYNYN_partial_28_1026,
  rs_R009_ueqv_R009NYNYN_partial_28_1027,
  rs_R009_ueqv_R009NYNYN_partial_28_1028,
  rs_R009_ueqv_R009NYNYN_partial_28_1029,
  rs_R009_ueqv_R009NYNYN_partial_28_1030,
  rs_R009_ueqv_R009NYNYN_partial_28_1031,
  rs_R009_ueqv_R009NYNYN_partial_28_1032,
  rs_R009_ueqv_R009NYNYN_partial_28_1033,
  rs_R009_ueqv_R009NYNYN_partial_28_1034,
  rs_R009_ueqv_R009NYNYN_partial_28_1035,
  rs_R009_ueqv_R009NYNYN_partial_28_1036,
  rs_R009_ueqv_R009NYNYN_partial_28_1037,
  rs_R009_ueqv_R009NYNYN_partial_28_1038,
  rs_R009_ueqv_R009NYNYN_partial_28_1039,
  rs_R009_ueqv_R009NYNYN_partial_28_1040,
  rs_R009_ueqv_R009NYNYN_partial_28_1041,
  rs_R009_ueqv_R009NYNYN_partial_28_1042,
  rs_R009_ueqv_R009NYNYN_partial_28_1043,
  rs_R009_ueqv_R009NYNYN_partial_28_1044,
  rs_R009_ueqv_R009NYNYN_partial_28_1045,
  rs_R009_ueqv_R009NYNYN_partial_28_1046,
  rs_R009_ueqv_R009NYNYN_partial_28_1047,
  rs_R009_ueqv_R009NYNYN_partial_28_1048,
  rs_R009_ueqv_R009NYNYN_partial_28_1049,
  rs_R009_ueqv_R009NYNYN_partial_28_1050,
  rs_R009_ueqv_R009NYNYN_partial_28_1051,
  rs_R009_ueqv_R009NYNYN_partial_28_1052,
  rs_R009_ueqv_R009NYNYN_partial_28_1053,
  rs_R009_ueqv_R009NYNYN_partial_28_1054,
  rs_R009_ueqv_R009NYNYN_partial_28_1055,
  rs_R009_ueqv_R009NYNYN_partial_28_1056,
  rs_R009_ueqv_R009NYNYN_partial_28_1057,
  rs_R009_ueqv_R009NYNYN_partial_28_1058,
  rs_R009_ueqv_R009NYNYN_partial_28_1059,
  rs_R009_ueqv_R009NYNYN_partial_28_1060,
  rs_R009_ueqv_R009NYNYN_partial_28_1061,
  rs_R009_ueqv_R009NYNYN_partial_28_1062,
  rs_R009_ueqv_R009NYNYN_partial_28_1063,
  rs_R009_ueqv_R009NYNYN_partial_28_1064,
  rs_R009_ueqv_R009NYNYN_partial_28_1065,
  rs_R009_ueqv_R009NYNYN_partial_28_1066,
  rs_R009_ueqv_R009NYNYN_partial_28_1067,
  rs_R009_ueqv_R009NYNYN_partial_28_1068,
  rs_R009_ueqv_R009NYNYN_partial_28_1069,
  rs_R009_ueqv_R009NYNYN_partial_28_1070,
  rs_R009_ueqv_R009NYNYN_partial_28_1071,
  rs_R009_ueqv_R009NYNYN_partial_28_1072,
  rs_R009_ueqv_R009NYNYN_partial_28_1073,
  rs_R009_ueqv_R009NYNYN_partial_28_1074,
  rs_R009_ueqv_R009NYNYN_partial_28_1075,
  rs_R009_ueqv_R009NYNYN_partial_28_1076,
  rs_R009_ueqv_R009NYNYN_partial_28_1077,
  rs_R009_ueqv_R009NYNYN_partial_28_1078,
  rs_R009_ueqv_R009NYNYN_partial_28_1079,
  rs_R009_ueqv_R009NYNYN_partial_28_1080,
  rs_R009_ueqv_R009NYNYN_partial_28_1081,
  rs_R009_ueqv_R009NYNYN_partial_28_1082,
  rs_R009_ueqv_R009NYNYN_partial_28_1083,
  rs_R009_ueqv_R009NYNYN_partial_28_1084,
  rs_R009_ueqv_R009NYNYN_partial_28_1085,
  rs_R009_ueqv_R009NYNYN_partial_28_1086,
  rs_R009_ueqv_R009NYNYN_partial_28_1087,
  rs_R009_ueqv_R009NYNYN_partial_28_1088,
  rs_R009_ueqv_R009NYNYN_partial_28_1089,
  rs_R009_ueqv_R009NYNYN_partial_28_1090,
  rs_R009_ueqv_R009NYNYN_partial_28_1091,
  rs_R009_ueqv_R009NYNYN_partial_28_1092,
  rs_R009_ueqv_R009NYNYN_partial_28_1093,
  rs_R009_ueqv_R009NYNYN_partial_28_1094,
  rs_R009_ueqv_R009NYNYN_partial_28_1095,
  rs_R009_ueqv_R009NYNYN_partial_28_1096,
  rs_R009_ueqv_R009NYNYN_partial_28_1097,
  rs_R009_ueqv_R009NYNYN_partial_28_1098,
  rs_R009_ueqv_R009NYNYN_partial_28_1099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1000_1099 : Poly :=
[
  term ((55738252728285901278133450364364551761860725606292273201739872572 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1796371738449611818456227973586718593895227216313394743696798818 : Rat) / 1805231914336512936467270316653869218784289331187693537391625) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((500830555382116661808 : Rat) / 32626001989905250535) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18166632729887857808523812468572287343386999765442092025524425036 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((1981257314045529816672 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5253204604641490741344 : Rat) / 619894037808199760165) [(2, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((481835446054760627544351963739596041938815155013699659690584319 : Rat) / 4115928764687249495145376321970821818828179675107941265252905) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((103737198530215147560 : Rat) / 123978807561639952033) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-481835446054760627544351963739596041938815155013699659690584319 : Rat) / 8231857529374498990290752643941643637656359350215882530505810) [(2, 1), (10, 1), (11, 1), (15, 1)],
  term ((-51868599265107573780 : Rat) / 123978807561639952033) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3104483728852447577978157842529622790033169964451069076315469902638117184413 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(2, 1), (10, 1), (12, 1)],
  term ((4161337660249047420234142924610609863987547275523349748862795263824363157958 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24472536436808326593064 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-44382192026024534582397806520895784987574651591424681404692982275 : Rat) / 685534809394255634527883387032518199413937533485674925029503066) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2081612327941872 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16233886065342883339640443703796458244562935218838021293323574513939293696457 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((13158935076718168278512 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2523065232219677580928815433485607404778541 : Rat) / 4748060997077753780185544181163895914260) [(2, 1), (10, 1), (12, 1), (13, 2)],
  term ((430074455495295434722208315286036577382927 : Rat) / 395671749756479481682128681763657992855) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 1)],
  term ((71017487893551665938352 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-57381500752095027404434458230612059519021 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 2)],
  term ((-9475312897350890561296 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-104157403615989776267204 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3104483728852447577978157842529622790033169964451069076315469902638117184413 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(2, 1), (10, 1), (12, 1), (14, 1)],
  term ((-11391443227800450002421066588707515926401030041630866406367981177525 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-6843681448590888 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-89707741620345375712 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((11391443227800450002421066588707515926401030041630866406367981177525 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(2, 1), (10, 1), (12, 1), (15, 2)],
  term ((3421840724295444 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((44853870810172687856 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-564414362775942713410826175138701771677101122393499627953272512883233777863 : Rat) / 1059258517010521475268849943443765647335172312948887089584917289560856715) [(2, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((22382197175846158566784 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((564414362775942713410826175138701771677101122393499627953272512883233777863 : Rat) / 2118517034021042950537699886887531294670344625897774179169834579121713430) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1)],
  term ((-11191098587923079283392 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (12, 2), (13, 2)],
  term ((-771550671415912258681082857570897192444402 : Rat) / 1187015249269438445046386045290973978565) [(2, 1), (10, 1), (12, 2), (13, 2), (14, 1)],
  term ((-127404894121038055617952 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(2, 1), (10, 1), (12, 2), (13, 2), (16, 1)],
  term ((3727393535097191541377621920667920466101080681661936688990736782393 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(2, 1), (10, 1), (12, 2), (14, 1), (15, 2)],
  term ((3782463838341408 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3727393535097191541377621920667920466101080681661936688990736782393 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(2, 1), (10, 1), (12, 2), (15, 2)],
  term ((-1891231919170704 : Rat) / 7342292683791569) [(2, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-83389300150000368298536133037437704574688317116793776271731222109852663402541119 : Rat) / 52841867734296299880554628607223280578491738811678767383293302502093023554000) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6465442435365589894599418 : Rat) / 541167495006558390624045) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16977091567023200877734604794684744767462844118875700638111203799 : Rat) / 9597487331519578883390367418455254791795125468799448950413042924) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((7172584293442392 : Rat) / 7342292683791569) [(2, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((20139732925301247332529099919098507094830928587914547976833840001394260764666227 : Rat) / 25509867182074075804405682775900894072375322184948370460900215001010425164000) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((21703895186334287836194233 : Rat) / 3788172465045908734368315) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((662680463969664975152110231955577336509747874531301999932120529320034657367131 : Rat) / 6002321689899782542213101829623739781735369925870204814329462353178923568000) [(2, 1), (10, 1), (13, 2)],
  term ((-600922573479989805445397552827374365078624865498969810275444048774717333142821 : Rat) / 4580719184397202466425788238397064570271729680269366831988273901110231144000) [(2, 1), (10, 1), (13, 2), (14, 1)],
  term ((-65744120485183207532252 : Rat) / 39875499632062197203877) [(2, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-141844910422789883587067015125792134940829 : Rat) / 791343499512958963364257363527315985710) [(2, 1), (10, 1), (13, 2), (14, 2)],
  term ((-11711308449035046566152 : Rat) / 4339258264657398321155) [(2, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((5678838792048101270844644 : Rat) / 3788172465045908734368315) [(2, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1342665299404653224806667846409839240390373157478769325115314073365 : Rat) / 38389949326078315533561469673821019167180501875197795801652171696) [(2, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1174597615041246 : Rat) / 7342292683791569) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1071350721253800527381 : Rat) / 32049107564750198685) [(2, 1), (10, 1), (14, 1), (16, 1)],
  term ((1342665299404653224806667846409839240390373157478769325115314073365 : Rat) / 76779898652156631067122939347642038334361003750395591603304343392) [(2, 1), (10, 1), (15, 2)],
  term ((587298807520623 : Rat) / 7342292683791569) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((1071350721253800527381 : Rat) / 64098215129500397370) [(2, 1), (10, 1), (16, 1)],
  term ((2015565206660543482819781499749031186114918652887942473154159424522782062132799403 : Rat) / 422734941874370399044437028857786244627933910493430139066346420016744188432000) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-14763212547930448179733691331066430967893701567603834278249036652909059436993734413 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-118698993141252810431178902 : Rat) / 757634493009181746873663) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((273005061641853561778608452193772499640833315660866155222805703747 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((10073651392747090324352 : Rat) / 619894037808199760165) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((281357461937862658834918487 : Rat) / 3788172465045908734368315) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((101519399585741688077734088152345771744168100517802514492760437490149840156171 : Rat) / 52351076393110885330580437010252166517391196345935620937008844584116927360) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1241984429847045935939242 : Rat) / 39875499632062197203877) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101519399585741688077734088152345771744168100517802514492760437490149840156171 : Rat) / 104702152786221770661160874020504333034782392691871241874017689168233854720) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-620992214923522967969621 : Rat) / 39875499632062197203877) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-988261079602188531719074510152157931952728 : Rat) / 366362731255999520076045075707090734125) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((1976522159204377063438149020304315863905456 : Rat) / 366362731255999520076045075707090734125) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((53610612999765299204736 : Rat) / 619894037808199760165) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-26805306499882649602368 : Rat) / 619894037808199760165) [(2, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-11639019871248737351896232843130775891507977871546243222310758261 : Rat) / 3249417445805723285641086569976964593811720796137848367304925) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-388199556764523578176 : Rat) / 6525200397981050107) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((11639019871248737351896232843130775891507977871546243222310758261 : Rat) / 6498834891611446571282173139953929187623441592275696734609850) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((194099778382261789088 : Rat) / 6525200397981050107) [(2, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-41331212231648121411162766971842876622843725239093504651994615802518202273218906653 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(2, 1), (11, 1), (13, 1)],
  term ((23603940177083690990156249353920261260133245158287759845567591006381778399972047 : Rat) / 3893611306737622096461920002637504884730970228228961807190032815943696472400) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 326931641052630084959521587482643718313324787947187373328678175790387875) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-805575310559664872264 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((723357208823550397453150217 : Rat) / 7576344930091817468736630) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((201971228240033744671306220514225166942266392536892951360439906400662929824496119 : Rat) / 109597947893355288641150340814981618977612495313111517535719442226563308112000) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((11118009425122566935531473 : Rat) / 420908051671767637152035) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((570218492867058098264205641904473758141723710659933284112569089318775307 : Rat) / 653863282105260169919043174965287436626649575894374746657356351580775750) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((402787655279832436132 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-411709646824826749936466737 : Rat) / 7576344930091817468736630) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1586125716765356694210131905188833128628890929230373226163950394606978203466 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-24251818553547095872 : Rat) / 88556291115457108595) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((793062858382678347105065952594416564314445464615186613081975197303489101733 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((12125909276773547936 : Rat) / 88556291115457108595) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1006267008209239861524814300950887913383716504635541363767833536 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (13, 3)],
  term ((2012534016418479723049628601901775826767433009271082727535667072 : Rat) / 15875725235222248052703594384744598444051550175416344880261205) [(2, 1), (11, 1), (13, 3), (14, 1)],
  term ((5598979460486274884512 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-2799489730243137442256 : Rat) / 4339258264657398321155) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((-72522004665144823820282394048812368401708588629894037845215135022961258312040711 : Rat) / 61740580640158290572291095848155535943995595689275513358575499158591992704000) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-64687270571693764181107961 : Rat) / 2525448310030605822912210) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((35618697025018661449480349708168330424113131869798563383070596769 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1739214840998151 : Rat) / 7342292683791569) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((18192239511014601845763516288972009825000398251782436899103327491300530233301376461 : Rat) / 30993771481359461867290130115774079043885789036016307706004900577613180337408000) [(2, 1), (11, 1), (15, 1)],
  term ((16246594987176468383982314 : Rat) / 1262724155015302911456105) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((35150633979501694629231306652120654839162021897885607996043353519 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(2, 1), (11, 2)],
  term ((34610506597012347905781895487689189458970163457919308605737905263 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(2, 1), (11, 2), (12, 1)],
  term ((-34610506597012347905781895487689189458970163457919308605737905263 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(2, 1), (11, 2), (12, 1), (14, 1)],
  term ((294023818143581057192 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-147011909071790528596 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (12, 1), (16, 1)],
  term ((-7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3512157401358461500788959803102558196348826887794732098977557004 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-236801443996489053408 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7024314802716923001577919606205116392697653775589464197955114008 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 2)],
  term ((14048629605433846003155839212410232785395307551178928395910228016 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(2, 1), (11, 2), (13, 2), (14, 1)],
  term ((-947205775985956213632 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((473602887992978106816 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (13, 2), (16, 1)],
  term ((-4448127313060807138813942303983223540055663357407777191501606167 : Rat) / 42578573427799132708400444710042984332705306983875254468133500) [(2, 1), (11, 2), (14, 1)],
  term ((2859878895198702160978 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (14, 1), (16, 1)],
  term ((11738884823952003553428342702254434596658038713810864512291974361 : Rat) / 123477862940617484854361289659124654564845390253238237957587150) [(2, 1), (11, 2), (14, 2)],
  term ((-104785103116985691212 : Rat) / 123978807561639952033) [(2, 1), (11, 2), (14, 2), (16, 1)],
  term ((-1298958068703118966474 : Rat) / 619894037808199760165) [(2, 1), (11, 2), (16, 1)],
  term ((-375394804605598562140348940784526855170080103848835821630869665749819038177745497 : Rat) / 522335999381281127925294961806969309853894633285767941779217776382249048064000) [(2, 1), (12, 1)],
  term ((21329164734722956132970657346074582388138442583300005053042157996177546960753827653 : Rat) / 2507293404437461340141404288118175985031696384005217874852248292341027259264000) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6019358887711042384130681 : Rat) / 22153055351145665113265) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((58419353638864302106121082992309537828634010781059443873706817991952079904822941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4697744312949635113244 : Rat) / 32049107564750198685) [(2, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-490903188297461818714996351924471288620615642277048401994615005429249816399373414363 : Rat) / 81236306303773747420581498935028901915026962841769059145212844671849283200153600) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-68786563674829221476921591 : Rat) / 398754996320621972038770) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((214822939657729897953811081854994840533472415040590781489026232347432605796811985907 : Rat) / 241170284339328312654851324963367052560236295936501894337350632619552559500456000) [(2, 1), (12, 1), (13, 2)],
  term ((-160037903246877163381799563468563155868393928109023443179375233976031606820205740307 : Rat) / 120585142169664156327425662481683526280118147968250947168675316309776279750228000) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-58626737114077545107572898 : Rat) / 757634493009181746873663) [(2, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-302936092417895651831359858207398862933779826818264974359118050622 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(2, 1), (12, 1), (13, 2), (14, 2)],
  term ((-178637531579810059600096 : Rat) / 13017774793972194963465) [(2, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((159562723207625044604839229 : Rat) / 3788172465045908734368315) [(2, 1), (12, 1), (13, 2), (16, 1)],
  term ((374107203237918926712198730395352938546346715967551617234340083345429017419729497 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(2, 1), (12, 1), (14, 1)],
  term ((-19746277650951446265269316778019027058401034834973136770587962432905451644662941 : Rat) / 21763999974220046996887290075290387910578943053573664240800740682593710336000) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-20238662152194606439 : Rat) / 436042279792519710) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5556291081884232074827 : Rat) / 256392860518001589480) [(2, 1), (12, 1), (14, 1), (16, 1)],
  term ((4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(2, 1), (12, 1), (14, 2)],
  term ((19746277650951446265269316778019027058401034834973136770587962432905451644662941 : Rat) / 43527999948440093993774580150580775821157886107147328481601481365187420672000) [(2, 1), (12, 1), (15, 2)],
  term ((20238662152194606439 : Rat) / 872084559585039420) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5556291081884232074827 : Rat) / 512785721036003178960) [(2, 1), (12, 1), (16, 1)],
  term ((112358918862682539851951363983108370171556460244570838805926923092109649512071 : Rat) / 1865485712076004028304624863596318963763909404592028363497206344222318028800) [(2, 1), (12, 2)],
  term ((225672601834378835859695807563732238409964914771337575932842588188927026858 : Rat) / 33450268958226993955858419266645230968479125672070118618471072301921791) [(2, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((10525073096587209373424 : Rat) / 137029208357602052247) [(2, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112836300917189417929847903781866119204982457385668787966421294094463513429 : Rat) / 33450268958226993955858419266645230968479125672070118618471072301921791) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-5262536548293604686712 : Rat) / 137029208357602052247) [(2, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((959541265129155854369091337903367459817163 : Rat) / 395671749756479481682128681763657992855) [(2, 1), (12, 2), (13, 2)],
  term ((-1919082530258311708738182675806734919634326 : Rat) / 395671749756479481682128681763657992855) [(2, 1), (12, 2), (13, 2), (14, 1)],
  term ((-316894943696178215242976 : Rat) / 4339258264657398321155) [(2, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(2, 1), (12, 2), (13, 2), (16, 1)],
  term ((-112358918862682539851951363983108370171556460244570838805926923092109649512071 : Rat) / 932742856038002014152312431798159481881954702296014181748603172111159014400) [(2, 1), (12, 2), (14, 1)],
  term ((-72345988081600546703809593521941558628996881013361985572893828410121888665158941 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(2, 1), (12, 2), (14, 1), (15, 2)],
  term ((-5123540982727073521484 : Rat) / 32049107564750198685) [(2, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-47039863792550259067 : Rat) / 6409821512950039737) [(2, 1), (12, 2), (14, 1), (16, 1)],
  term ((72345988081600546703809593521941558628996881013361985572893828410121888665158941 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(2, 1), (12, 2), (15, 2)],
  term ((2561770491363536760742 : Rat) / 32049107564750198685) [(2, 1), (12, 2), (15, 2), (16, 1)],
  term ((47039863792550259067 : Rat) / 12819643025900079474) [(2, 1), (12, 2), (16, 1)],
  term ((-109741288489733142612329215720728331046116181419328559268266679286018236762056194754623 : Rat) / 5144966065905670669970161599218497121285040979978707079196813495883787936009728000) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2324761125491798720882387761 : Rat) / 5050896620061211645824420) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 16452835425462135228669201288780436785934500803656198200708073584) [(2, 1), (13, 1), (14, 1), (15, 3)],
  term ((-188909391519882 : Rat) / 7342292683791569) [(2, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-57393269864058856617025645859958433403477487310404414268764313892374272769878941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1070484610703458968011 : Rat) / 32049107564750198685) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2103015458150449162107602918970475134221250400633071536988388859715240513008726540849 : Rat) / 189385253959717938771907788928288237593314391901056702301723196167501396417536000) [(2, 1), (13, 1), (15, 1)],
  term ((7227343797476472455767027661 : Rat) / 30305379720367269874946520) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-364996285913281249531826553760809456299492503150808195884927438973 : Rat) / 32905670850924270457338402577560873571869001607312396401416147168) [(2, 1), (13, 1), (15, 3)],
  term ((94454695759941 : Rat) / 7342292683791569) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-21979862513992621561415069801277860199285437262290759839559062358928303096466671266173 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(2, 1), (13, 2)],
  term ((4181343001840385066267950111729902201787906650469072743333492045476206848928242461363 : Rat) / 1543489819771701200991048479765549136385512293993612123759044048765136380802918400) [(2, 1), (13, 2), (14, 1)],
  term ((-301865906564217309243282051968828762661781190834556241639105530839696186963 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(2, 1), (13, 2), (14, 1), (15, 2)],
  term ((-152776783819006343297969 : Rat) / 66459166053436995339795) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((9413574603427159912941396865160957810051789560924527393785983610063761858118061047 : Rat) / 33848460959905728091908957889595375797927901184070441310505351946603868000064000) [(2, 1), (13, 2), (14, 2)],
  term ((305553567638012686595938 : Rat) / 66459166053436995339795) [(2, 1), (13, 2), (14, 2), (16, 1)],
  term ((301865906564217309243282051968828762661781190834556241639105530839696186963 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(2, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1000 through 1099. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1000_1099_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1000_1099
      rs_R009_ueqv_R009NYNYN_block_28_1000_1099 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
