/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 2:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0000 : Poly :=
[
  term ((-25830077419170561919349477954962284833955750674356794832328188545441681543722203 : Rat) / 13784128457147665997667699055263309557223401320469787348468170298791758080000) []
]

/-- Partial product 0 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0000 : Poly :=
[
  term ((-25830077419170561919349477954962284833955750674356794832328188545441681543722203 : Rat) / 13784128457147665997667699055263309557223401320469787348468170298791758080000) [(0, 2)],
  term ((-25830077419170561919349477954962284833955750674356794832328188545441681543722203 : Rat) / 13784128457147665997667699055263309557223401320469787348468170298791758080000) [(1, 2)],
  term ((25830077419170561919349477954962284833955750674356794832328188545441681543722203 : Rat) / 13784128457147665997667699055263309557223401320469787348468170298791758080000) [(10, 2)],
  term ((25830077419170561919349477954962284833955750674356794832328188545441681543722203 : Rat) / 13784128457147665997667699055263309557223401320469787348468170298791758080000) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0000_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0000
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0001 : Poly :=
[
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 1 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0001 : Poly :=
[
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0001_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0001
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0002 : Poly :=
[
  term ((-915328190854138551471170615446156849634340895642745927748927004743211057099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(0, 1), (10, 1)]
]

/-- Partial product 2 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0002 : Poly :=
[
  term ((-915328190854138551471170615446156849634340895642745927748927004743211057099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(0, 1), (1, 2), (10, 1)],
  term ((915328190854138551471170615446156849634340895642745927748927004743211057099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(0, 1), (10, 1), (11, 2)],
  term ((915328190854138551471170615446156849634340895642745927748927004743211057099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(0, 1), (10, 3)],
  term ((-915328190854138551471170615446156849634340895642745927748927004743211057099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(0, 3), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0002_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0002
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0003 : Poly :=
[
  term ((-334694819791852282016 : Rat) / 32049107564750198685) [(0, 1), (10, 1), (16, 1)]
]

/-- Partial product 3 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0003 : Poly :=
[
  term ((-334694819791852282016 : Rat) / 32049107564750198685) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((334694819791852282016 : Rat) / 32049107564750198685) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((334694819791852282016 : Rat) / 32049107564750198685) [(0, 1), (10, 3), (16, 1)],
  term ((-334694819791852282016 : Rat) / 32049107564750198685) [(0, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0003_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0003
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0004 : Poly :=
[
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 4 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0004 : Poly :=
[
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 3), (15, 1)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0004_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0004
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0005 : Poly :=
[
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 1), (12, 1)]
]

/-- Partial product 5 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0005 : Poly :=
[
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 1), (1, 2), (12, 1)],
  term ((-6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 1), (10, 2), (12, 1)],
  term ((-6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 1), (11, 2), (12, 1)],
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0005_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0005
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0006 : Poly :=
[
  term ((167347409895926141008 : Rat) / 32049107564750198685) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 6 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0006 : Poly :=
[
  term ((167347409895926141008 : Rat) / 32049107564750198685) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-167347409895926141008 : Rat) / 32049107564750198685) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-167347409895926141008 : Rat) / 32049107564750198685) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((167347409895926141008 : Rat) / 32049107564750198685) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0006_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0006
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0007 : Poly :=
[
  term ((-402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 2)]
]

/-- Partial product 7 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0007 : Poly :=
[
  term ((-402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 2), (1, 2)],
  term ((402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 2), (10, 2)],
  term ((402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 2), (11, 2)],
  term ((-402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0007_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0007
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0008 : Poly :=
[
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 8 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0008 : Poly :=
[
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0008_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0008
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0009 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 9 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0009 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0009_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0009
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0010 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 1)]
]

/-- Partial product 10 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0010 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 3)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0010_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0010
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0011 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 11 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0011 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0011_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0011
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0012 : Poly :=
[
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 12 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0012 : Poly :=
[
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0012_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0012
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0013 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0013 : Poly :=
[
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0013_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0013
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0014 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1)]
]

/-- Partial product 14 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0014 : Poly :=
[
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (9, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 2)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0014_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0014
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0015 : Poly :=
[
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1)]
]

/-- Partial product 15 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0015 : Poly :=
[
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 3)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0015_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0015
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0016 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 16 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0016 : Poly :=
[
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 3), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0016_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0016
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0017 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 17 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0017 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0017_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0017
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0018 : Poly :=
[
  term ((-1225496284267972044034680810610671325320093331024 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 18 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0018 : Poly :=
[
  term ((-1225496284267972044034680810610671325320093331024 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((1225496284267972044034680810610671325320093331024 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((1225496284267972044034680810610671325320093331024 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (10, 3), (15, 1)],
  term ((-1225496284267972044034680810610671325320093331024 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0018_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0018
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0019 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0019 : Poly :=
[
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0019_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0019
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0020 : Poly :=
[
  term ((277266589773173945735094163483092988720948152960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 1)]
]

/-- Partial product 20 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0020 : Poly :=
[
  term ((277266589773173945735094163483092988720948152960 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (11, 1)],
  term ((-277266589773173945735094163483092988720948152960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (11, 1)],
  term ((-277266589773173945735094163483092988720948152960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 3)],
  term ((277266589773173945735094163483092988720948152960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0020_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0020
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0021 : Poly :=
[
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 21 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0021 : Poly :=
[
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (11, 3), (16, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0021_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0021
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0022 : Poly :=
[
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(1, 1), (13, 1)]
]

/-- Partial product 22 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0022 : Poly :=
[
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 2), (1, 1), (13, 1)],
  term ((-6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(1, 1), (10, 2), (13, 1)],
  term ((-6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(1, 1), (11, 2), (13, 1)],
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0022_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0022
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0023 : Poly :=
[
  term ((231495586300516381768 : Rat) / 32049107564750198685) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0023 : Poly :=
[
  term ((231495586300516381768 : Rat) / 32049107564750198685) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-231495586300516381768 : Rat) / 32049107564750198685) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-231495586300516381768 : Rat) / 32049107564750198685) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((231495586300516381768 : Rat) / 32049107564750198685) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0023_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0023
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0024 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0024 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0024_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0024
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0025 : Poly :=
[
  term ((-402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 2)]
]

/-- Partial product 25 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0025 : Poly :=
[
  term ((-402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 2), (1, 2)],
  term ((402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 2), (10, 2)],
  term ((402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 2), (11, 2)],
  term ((-402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0025_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0025
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0026 : Poly :=
[
  term ((-957243529681522105109202703141992948711753416714585 : Rat) / 73144122068565168275232132022233738601204849100226) [(2, 1)]
]

/-- Partial product 26 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0026 : Poly :=
[
  term ((-957243529681522105109202703141992948711753416714585 : Rat) / 73144122068565168275232132022233738601204849100226) [(0, 2), (2, 1)],
  term ((-957243529681522105109202703141992948711753416714585 : Rat) / 73144122068565168275232132022233738601204849100226) [(1, 2), (2, 1)],
  term ((957243529681522105109202703141992948711753416714585 : Rat) / 73144122068565168275232132022233738601204849100226) [(2, 1), (10, 2)],
  term ((957243529681522105109202703141992948711753416714585 : Rat) / 73144122068565168275232132022233738601204849100226) [(2, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0026_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0026
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0027 : Poly :=
[
  term ((-228617455162261592374622066945088951094758857263798 : Rat) / 12190687011427528045872022003705623100200808183371) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 27 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0027 : Poly :=
[
  term ((-228617455162261592374622066945088951094758857263798 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-228617455162261592374622066945088951094758857263798 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((228617455162261592374622066945088951094758857263798 : Rat) / 12190687011427528045872022003705623100200808183371) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((228617455162261592374622066945088951094758857263798 : Rat) / 12190687011427528045872022003705623100200808183371) [(2, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0027_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0027
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0028 : Poly :=
[
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (11, 2)]
]

/-- Partial product 28 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0028 : Poly :=
[
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (2, 1), (11, 2)],
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (2, 1), (11, 2)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (10, 2), (11, 2)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0028_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0028
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0029 : Poly :=
[
  term ((4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(2, 1), (12, 1)]
]

/-- Partial product 29 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0029 : Poly :=
[
  term ((4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(0, 2), (2, 1), (12, 1)],
  term ((4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(1, 2), (2, 1), (12, 1)],
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(2, 1), (10, 2), (12, 1)],
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(2, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0029_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0029
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0030 : Poly :=
[
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 30 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0030 : Poly :=
[
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-2852486164866260356910896250009098986648548482336 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-2852486164866260356910896250009098986648548482336 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0030_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0030
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0031 : Poly :=
[
  term ((9746722386659317836135860499614212489322543564182 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (15, 2)]
]

/-- Partial product 31 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0031 : Poly :=
[
  term ((9746722386659317836135860499614212489322543564182 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 2), (2, 1), (15, 2)],
  term ((9746722386659317836135860499614212489322543564182 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 2), (2, 1), (15, 2)],
  term ((-9746722386659317836135860499614212489322543564182 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (10, 2), (15, 2)],
  term ((-9746722386659317836135860499614212489322543564182 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0031_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0031
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0032 : Poly :=
[
  term ((-787287388372487 : Rat) / 1048898954827367) [(2, 1), (16, 1)]
]

/-- Partial product 32 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0032 : Poly :=
[
  term ((-787287388372487 : Rat) / 1048898954827367) [(0, 2), (2, 1), (16, 1)],
  term ((-787287388372487 : Rat) / 1048898954827367) [(1, 2), (2, 1), (16, 1)],
  term ((787287388372487 : Rat) / 1048898954827367) [(2, 1), (10, 2), (16, 1)],
  term ((787287388372487 : Rat) / 1048898954827367) [(2, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0032_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0032
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0033 : Poly :=
[
  term ((-146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 33 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0033 : Poly :=
[
  term ((-146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (3, 1), (8, 1), (11, 1)],
  term ((-146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (8, 1), (10, 2), (11, 1)],
  term ((146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (8, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0033_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0033
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0034 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (8, 1), (13, 1)]
]

/-- Partial product 34 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0034 : Poly :=
[
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (3, 1), (8, 1), (13, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (3, 1), (8, 1), (13, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (8, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0034_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0034
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0035 : Poly :=
[
  term ((-51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 35 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0035 : Poly :=
[
  term ((-51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((-51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0035_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0035
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0036 : Poly :=
[
  term ((79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 36 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0036 : Poly :=
[
  term ((79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (10, 1), (11, 3)],
  term ((-79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0036_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0036
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0037 : Poly :=
[
  term ((84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 37 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0037 : Poly :=
[
  term ((84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0037_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0037
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0038 : Poly :=
[
  term ((376315591597847565770747214216403896530673827605466 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (11, 1)]
]

/-- Partial product 38 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0038 : Poly :=
[
  term ((376315591597847565770747214216403896530673827605466 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (3, 1), (11, 1)],
  term ((376315591597847565770747214216403896530673827605466 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (3, 1), (11, 1)],
  term ((-376315591597847565770747214216403896530673827605466 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (10, 2), (11, 1)],
  term ((-376315591597847565770747214216403896530673827605466 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0038_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0038
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0039 : Poly :=
[
  term ((424793539505796783445640233129880304495251437999423 : Rat) / 36572061034282584137616066011116869300602424550113) [(3, 1), (13, 1)]
]

/-- Partial product 39 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0039 : Poly :=
[
  term ((424793539505796783445640233129880304495251437999423 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 2), (3, 1), (13, 1)],
  term ((424793539505796783445640233129880304495251437999423 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 2), (3, 1), (13, 1)],
  term ((-424793539505796783445640233129880304495251437999423 : Rat) / 36572061034282584137616066011116869300602424550113) [(3, 1), (10, 2), (13, 1)],
  term ((-424793539505796783445640233129880304495251437999423 : Rat) / 36572061034282584137616066011116869300602424550113) [(3, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0039_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0039
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0040 : Poly :=
[
  term ((2929355028119901040692448208548651313666965489861 : Rat) / 420368517635432001581793862196745624144855454599) [(3, 1), (15, 1)]
]

/-- Partial product 40 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0040 : Poly :=
[
  term ((2929355028119901040692448208548651313666965489861 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 2), (3, 1), (15, 1)],
  term ((2929355028119901040692448208548651313666965489861 : Rat) / 420368517635432001581793862196745624144855454599) [(1, 2), (3, 1), (15, 1)],
  term ((-2929355028119901040692448208548651313666965489861 : Rat) / 420368517635432001581793862196745624144855454599) [(3, 1), (10, 2), (15, 1)],
  term ((-2929355028119901040692448208548651313666965489861 : Rat) / 420368517635432001581793862196745624144855454599) [(3, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0040_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0040
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0041 : Poly :=
[
  term ((1574574776744974 : Rat) / 1048898954827367) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0041 : Poly :=
[
  term ((1574574776744974 : Rat) / 1048898954827367) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 1048898954827367) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 1048898954827367) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 1048898954827367) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0041_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0041
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0042 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 42 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0042 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (11, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (11, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 2), (11, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0042_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0042
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0043 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 43 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0043 : Poly :=
[
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0043_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0043
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0044 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1)]
]

/-- Partial product 44 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0044 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (9, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (9, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0044_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0044
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0045 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1)]
]

/-- Partial product 45 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0045 : Poly :=
[
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (9, 1), (10, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (9, 1), (10, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (11, 2)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0045_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0045
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0046 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 46 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0046 : Poly :=
[
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0046_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0046
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0047 : Poly :=
[
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 1)]
]

/-- Partial product 47 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0047 : Poly :=
[
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (11, 1)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (11, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (11, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0047_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0047
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0048 : Poly :=
[
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1)]
]

/-- Partial product 48 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0048 : Poly :=
[
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (6, 1)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (6, 1)],
  term ((1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (10, 2)],
  term ((1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0048_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0048
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0049 : Poly :=
[
  term ((1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (8, 1)]
]

/-- Partial product 49 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0049 : Poly :=
[
  term ((1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (6, 1), (8, 1)],
  term ((1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (6, 1), (8, 1)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (8, 1), (10, 2)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0049_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0049
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0050 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0050 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0050_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0050
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0051 : Poly :=
[
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(7, 1), (9, 1)]
]

/-- Partial product 51 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0051 : Poly :=
[
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (7, 1), (9, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (7, 1), (9, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(7, 1), (9, 1), (10, 2)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0051_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0051
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0052 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 52 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0052 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0052_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0052
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0053 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0053 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0053_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0053
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0054 : Poly :=
[
  term ((-1574574776744974 : Rat) / 3146696864482101) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 54 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0054 : Poly :=
[
  term ((-1574574776744974 : Rat) / 3146696864482101) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0054_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0054
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0055 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0055 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0055_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0055
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0056 : Poly :=
[
  term ((3348110347927727174942761402703919039098303248385783261723322069412846282315445659 : Rat) / 1845350197200643785437763211023375566973282851777892781276176298750746612960000) [(8, 1)]
]

/-- Partial product 56 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0056 : Poly :=
[
  term ((3348110347927727174942761402703919039098303248385783261723322069412846282315445659 : Rat) / 1845350197200643785437763211023375566973282851777892781276176298750746612960000) [(0, 2), (8, 1)],
  term ((3348110347927727174942761402703919039098303248385783261723322069412846282315445659 : Rat) / 1845350197200643785437763211023375566973282851777892781276176298750746612960000) [(1, 2), (8, 1)],
  term ((-3348110347927727174942761402703919039098303248385783261723322069412846282315445659 : Rat) / 1845350197200643785437763211023375566973282851777892781276176298750746612960000) [(8, 1), (10, 2)],
  term ((-3348110347927727174942761402703919039098303248385783261723322069412846282315445659 : Rat) / 1845350197200643785437763211023375566973282851777892781276176298750746612960000) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0056_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0056
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0057 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 57 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0057 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0057_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0057
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0058 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 58 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0058 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0058_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0058
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0059 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 59 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0059 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0059_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0059
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0060 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 60 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0060 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0060_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0060
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0061 : Poly :=
[
  term ((41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1)]
]

/-- Partial product 61 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0061 : Poly :=
[
  term ((41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (8, 1), (10, 1)],
  term ((41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (8, 1), (10, 1)],
  term ((-41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1), (11, 2)],
  term ((-41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0061_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0061
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0062 : Poly :=
[
  term ((63874574089153914960514941033146795478883778134607726063295390928 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 62 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0062 : Poly :=
[
  term ((63874574089153914960514941033146795478883778134607726063295390928 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((63874574089153914960514941033146795478883778134607726063295390928 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-63874574089153914960514941033146795478883778134607726063295390928 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-63874574089153914960514941033146795478883778134607726063295390928 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0062_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0062
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0063 : Poly :=
[
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 63 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0063 : Poly :=
[
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0063_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0063
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0064 : Poly :=
[
  term ((-95880280753224113419955420943544692046985856096454728237411431488159323032 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 64 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0064 : Poly :=
[
  term ((-95880280753224113419955420943544692046985856096454728237411431488159323032 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((-95880280753224113419955420943544692046985856096454728237411431488159323032 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((95880280753224113419955420943544692046985856096454728237411431488159323032 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((95880280753224113419955420943544692046985856096454728237411431488159323032 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0064_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0064
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0065 : Poly :=
[
  term ((7702308172494839458112 : Rat) / 4339258264657398321155) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0065 : Poly :=
[
  term ((7702308172494839458112 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((7702308172494839458112 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7702308172494839458112 : Rat) / 4339258264657398321155) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7702308172494839458112 : Rat) / 4339258264657398321155) [(8, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0065_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0065
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0066 : Poly :=
[
  term ((16352936973231285059981654685691145453744641793202689615395773532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 2)]
]

/-- Partial product 66 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0066 : Poly :=
[
  term ((16352936973231285059981654685691145453744641793202689615395773532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (8, 1), (11, 2)],
  term ((16352936973231285059981654685691145453744641793202689615395773532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (8, 1), (11, 2)],
  term ((-16352936973231285059981654685691145453744641793202689615395773532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 2), (11, 2)],
  term ((-16352936973231285059981654685691145453744641793202689615395773532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0066_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0066
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0067 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 67 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0067 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 2), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0067_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0067
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0068 : Poly :=
[
  term ((111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(8, 1), (12, 1)]
]

/-- Partial product 68 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0068 : Poly :=
[
  term ((111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(0, 2), (8, 1), (12, 1)],
  term ((111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(1, 2), (8, 1), (12, 1)],
  term ((-111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(8, 1), (10, 2), (12, 1)],
  term ((-111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0068_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0068
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0069 : Poly :=
[
  term ((-882279375742283788 : Rat) / 712202390327782193) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 69 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0069 : Poly :=
[
  term ((-882279375742283788 : Rat) / 712202390327782193) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-882279375742283788 : Rat) / 712202390327782193) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((882279375742283788 : Rat) / 712202390327782193) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((882279375742283788 : Rat) / 712202390327782193) [(8, 1), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0069_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0069
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0070 : Poly :=
[
  term ((-33794665735672374726018367460792793382083985950056804206208613296 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 70 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0070 : Poly :=
[
  term ((-33794665735672374726018367460792793382083985950056804206208613296 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-33794665735672374726018367460792793382083985950056804206208613296 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((33794665735672374726018367460792793382083985950056804206208613296 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((33794665735672374726018367460792793382083985950056804206208613296 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0070_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0070
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0071 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0071 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0071_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0071
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0072 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 1741526715918218292267431714815089014314401169053) [(8, 1), (13, 2)]
]

/-- Partial product 72 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0072 : Poly :=
[
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 2), (8, 1), (13, 2)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 2), (8, 1), (13, 2)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 1741526715918218292267431714815089014314401169053) [(8, 1), (10, 2), (13, 2)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 1741526715918218292267431714815089014314401169053) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0072_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0072
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0073 : Poly :=
[
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (15, 2)]
]

/-- Partial product 73 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0073 : Poly :=
[
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(0, 2), (8, 1), (15, 2)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 2), (8, 1), (15, 2)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 2), (15, 2)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0073_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0073
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0074 : Poly :=
[
  term ((3852076819738752 : Rat) / 7342292683791569) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 74 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0074 : Poly :=
[
  term ((3852076819738752 : Rat) / 7342292683791569) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0074_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0074
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0075 : Poly :=
[
  term ((5625735004609077918618844 : Rat) / 168738551328409796076525) [(8, 1), (16, 1)]
]

/-- Partial product 75 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0075 : Poly :=
[
  term ((5625735004609077918618844 : Rat) / 168738551328409796076525) [(0, 2), (8, 1), (16, 1)],
  term ((5625735004609077918618844 : Rat) / 168738551328409796076525) [(1, 2), (8, 1), (16, 1)],
  term ((-5625735004609077918618844 : Rat) / 168738551328409796076525) [(8, 1), (10, 2), (16, 1)],
  term ((-5625735004609077918618844 : Rat) / 168738551328409796076525) [(8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0075_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0075
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0076 : Poly :=
[
  term ((-24805749529769896725376078114260091892570293122432682521909032032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 76 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0076 : Poly :=
[
  term ((-24805749529769896725376078114260091892570293122432682521909032032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-24805749529769896725376078114260091892570293122432682521909032032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((24805749529769896725376078114260091892570293122432682521909032032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 3)],
  term ((24805749529769896725376078114260091892570293122432682521909032032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0076_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0076
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0077 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 77 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0077 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 3), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0077_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0077
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0078 : Poly :=
[
  term ((-67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 78 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0078 : Poly :=
[
  term ((-67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0078_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0078
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0079 : Poly :=
[
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 79 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0079 : Poly :=
[
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(9, 1), (10, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0079_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0079
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0080 : Poly :=
[
  term ((-1057496637197239061162106794564914878537122436075892361108610859301020879412 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 80 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0080 : Poly :=
[
  term ((-1057496637197239061162106794564914878537122436075892361108610859301020879412 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1057496637197239061162106794564914878537122436075892361108610859301020879412 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((1057496637197239061162106794564914878537122436075892361108610859301020879412 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((1057496637197239061162106794564914878537122436075892361108610859301020879412 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0080_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0080
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0081 : Poly :=
[
  term ((1973735849983421113728 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 81 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0081 : Poly :=
[
  term ((1973735849983421113728 : Rat) / 4339258264657398321155) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1973735849983421113728 : Rat) / 4339258264657398321155) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1973735849983421113728 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1973735849983421113728 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0081_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0081
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0082 : Poly :=
[
  term ((238652910412337876370749881718916494271243979271280314131787220842 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(9, 1), (11, 1)]
]

/-- Partial product 82 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0082 : Poly :=
[
  term ((238652910412337876370749881718916494271243979271280314131787220842 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(0, 2), (9, 1), (11, 1)],
  term ((238652910412337876370749881718916494271243979271280314131787220842 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 2), (9, 1), (11, 1)],
  term ((-238652910412337876370749881718916494271243979271280314131787220842 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(9, 1), (10, 2), (11, 1)],
  term ((-238652910412337876370749881718916494271243979271280314131787220842 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0082_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0082
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0083 : Poly :=
[
  term ((-967604402247826057184 : Rat) / 867851652931479664231) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 83 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0083 : Poly :=
[
  term ((-967604402247826057184 : Rat) / 867851652931479664231) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-967604402247826057184 : Rat) / 867851652931479664231) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((967604402247826057184 : Rat) / 867851652931479664231) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((967604402247826057184 : Rat) / 867851652931479664231) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0083_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0083
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0084 : Poly :=
[
  term ((69457221858904429441402215074235143928481714814588417149070878273100194405638667 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(9, 1), (13, 1)]
]

/-- Partial product 84 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0084 : Poly :=
[
  term ((69457221858904429441402215074235143928481714814588417149070878273100194405638667 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(0, 2), (9, 1), (13, 1)],
  term ((69457221858904429441402215074235143928481714814588417149070878273100194405638667 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(1, 2), (9, 1), (13, 1)],
  term ((-69457221858904429441402215074235143928481714814588417149070878273100194405638667 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(9, 1), (10, 2), (13, 1)],
  term ((-69457221858904429441402215074235143928481714814588417149070878273100194405638667 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0084_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0084
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0085 : Poly :=
[
  term ((-68295154809442242038836 : Rat) / 180389165002186130208015) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 85 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0085 : Poly :=
[
  term ((-68295154809442242038836 : Rat) / 180389165002186130208015) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-68295154809442242038836 : Rat) / 180389165002186130208015) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((68295154809442242038836 : Rat) / 180389165002186130208015) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((68295154809442242038836 : Rat) / 180389165002186130208015) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0085_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0085
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0086 : Poly :=
[
  term ((42097495400497161401543562589591515534924504220069905554054245439 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(9, 1), (15, 1)]
]

/-- Partial product 86 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0086 : Poly :=
[
  term ((42097495400497161401543562589591515534924504220069905554054245439 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 2), (9, 1), (15, 1)],
  term ((42097495400497161401543562589591515534924504220069905554054245439 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 2), (9, 1), (15, 1)],
  term ((-42097495400497161401543562589591515534924504220069905554054245439 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(9, 1), (10, 2), (15, 1)],
  term ((-42097495400497161401543562589591515534924504220069905554054245439 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0086_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0086
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0087 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0087 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0087_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0087
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0088 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2)]
]

/-- Partial product 88 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0088 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (9, 2)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (9, 2)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0088_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0088
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0089 : Poly :=
[
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1)]
]

/-- Partial product 89 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0089 : Poly :=
[
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (9, 2), (10, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (9, 2), (10, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 2)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0089_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0089
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0090 : Poly :=
[
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 90 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0090 : Poly :=
[
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (10, 1), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (10, 1), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 2), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0090_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0090
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0091 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (16, 1)]
]

/-- Partial product 91 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0091 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (16, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0091_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0091
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0092 : Poly :=
[
  term ((856199973762092726870558763423062990346141748899964897266201917545700575099 : Rat) / 3129409505495597248402121847482321881314073483546826721740904047535522000) [(10, 1)]
]

/-- Partial product 92 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0092 : Poly :=
[
  term ((856199973762092726870558763423062990346141748899964897266201917545700575099 : Rat) / 3129409505495597248402121847482321881314073483546826721740904047535522000) [(0, 2), (10, 1)],
  term ((856199973762092726870558763423062990346141748899964897266201917545700575099 : Rat) / 3129409505495597248402121847482321881314073483546826721740904047535522000) [(1, 2), (10, 1)],
  term ((-856199973762092726870558763423062990346141748899964897266201917545700575099 : Rat) / 3129409505495597248402121847482321881314073483546826721740904047535522000) [(10, 1), (11, 2)],
  term ((-856199973762092726870558763423062990346141748899964897266201917545700575099 : Rat) / 3129409505495597248402121847482321881314073483546826721740904047535522000) [(10, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0092_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0092
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0093 : Poly :=
[
  term ((-132709240381195416956186448322446631773974867568636 : Rat) / 1354520779047503116208002444856180344466756464819) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 93 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0093 : Poly :=
[
  term ((-132709240381195416956186448322446631773974867568636 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((-132709240381195416956186448322446631773974867568636 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((132709240381195416956186448322446631773974867568636 : Rat) / 1354520779047503116208002444856180344466756464819) [(10, 1), (11, 3), (13, 1)],
  term ((132709240381195416956186448322446631773974867568636 : Rat) / 1354520779047503116208002444856180344466756464819) [(10, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0093_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0093
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0094 : Poly :=
[
  term ((30292153212333967249008563804069345431606354216320310320981647032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 94 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0094 : Poly :=
[
  term ((30292153212333967249008563804069345431606354216320310320981647032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((30292153212333967249008563804069345431606354216320310320981647032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-30292153212333967249008563804069345431606354216320310320981647032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 3), (15, 1)],
  term ((-30292153212333967249008563804069345431606354216320310320981647032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0094_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0094
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0095 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0095 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0095_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0095
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0096 : Poly :=
[
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 2)]
]

/-- Partial product 96 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0096 : Poly :=
[
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (10, 1), (11, 2)],
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (10, 1), (11, 2)],
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 4)],
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0096_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0096
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0097 : Poly :=
[
  term ((-19739871204079129004118185447737285475870731568782006993467763434667291588432691 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(10, 1), (12, 1)]
]

/-- Partial product 97 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0097 : Poly :=
[
  term ((-19739871204079129004118185447737285475870731568782006993467763434667291588432691 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(0, 2), (10, 1), (12, 1)],
  term ((-19739871204079129004118185447737285475870731568782006993467763434667291588432691 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(1, 2), (10, 1), (12, 1)],
  term ((19739871204079129004118185447737285475870731568782006993467763434667291588432691 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(10, 1), (11, 2), (12, 1)],
  term ((19739871204079129004118185447737285475870731568782006993467763434667291588432691 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(10, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0097_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0097
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0098 : Poly :=
[
  term ((-3519280546611759732950072 : Rat) / 168738551328409796076525) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 98 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0098 : Poly :=
[
  term ((-3519280546611759732950072 : Rat) / 168738551328409796076525) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3519280546611759732950072 : Rat) / 168738551328409796076525) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((3519280546611759732950072 : Rat) / 168738551328409796076525) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((3519280546611759732950072 : Rat) / 168738551328409796076525) [(10, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0098_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0098
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 2. -/
def rs_R009_ueqv_R009NYNYN_coefficient_02_0099 : Poly :=
[
  term ((12677146461852574709467901324159841378037296033537383358307752028 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 99 for generator 2. -/
def rs_R009_ueqv_R009NYNYN_partial_02_0099 : Poly :=
[
  term ((12677146461852574709467901324159841378037296033537383358307752028 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((12677146461852574709467901324159841378037296033537383358307752028 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-12677146461852574709467901324159841378037296033537383358307752028 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-12677146461852574709467901324159841378037296033537383358307752028 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 2. -/
theorem rs_R009_ueqv_R009NYNYN_partial_02_0099_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_02_0099
        rs_R009_ueqv_R009NYNYN_generator_02_0000_0099 =
      rs_R009_ueqv_R009NYNYN_partial_02_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_02_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_02_0000,
  rs_R009_ueqv_R009NYNYN_partial_02_0001,
  rs_R009_ueqv_R009NYNYN_partial_02_0002,
  rs_R009_ueqv_R009NYNYN_partial_02_0003,
  rs_R009_ueqv_R009NYNYN_partial_02_0004,
  rs_R009_ueqv_R009NYNYN_partial_02_0005,
  rs_R009_ueqv_R009NYNYN_partial_02_0006,
  rs_R009_ueqv_R009NYNYN_partial_02_0007,
  rs_R009_ueqv_R009NYNYN_partial_02_0008,
  rs_R009_ueqv_R009NYNYN_partial_02_0009,
  rs_R009_ueqv_R009NYNYN_partial_02_0010,
  rs_R009_ueqv_R009NYNYN_partial_02_0011,
  rs_R009_ueqv_R009NYNYN_partial_02_0012,
  rs_R009_ueqv_R009NYNYN_partial_02_0013,
  rs_R009_ueqv_R009NYNYN_partial_02_0014,
  rs_R009_ueqv_R009NYNYN_partial_02_0015,
  rs_R009_ueqv_R009NYNYN_partial_02_0016,
  rs_R009_ueqv_R009NYNYN_partial_02_0017,
  rs_R009_ueqv_R009NYNYN_partial_02_0018,
  rs_R009_ueqv_R009NYNYN_partial_02_0019,
  rs_R009_ueqv_R009NYNYN_partial_02_0020,
  rs_R009_ueqv_R009NYNYN_partial_02_0021,
  rs_R009_ueqv_R009NYNYN_partial_02_0022,
  rs_R009_ueqv_R009NYNYN_partial_02_0023,
  rs_R009_ueqv_R009NYNYN_partial_02_0024,
  rs_R009_ueqv_R009NYNYN_partial_02_0025,
  rs_R009_ueqv_R009NYNYN_partial_02_0026,
  rs_R009_ueqv_R009NYNYN_partial_02_0027,
  rs_R009_ueqv_R009NYNYN_partial_02_0028,
  rs_R009_ueqv_R009NYNYN_partial_02_0029,
  rs_R009_ueqv_R009NYNYN_partial_02_0030,
  rs_R009_ueqv_R009NYNYN_partial_02_0031,
  rs_R009_ueqv_R009NYNYN_partial_02_0032,
  rs_R009_ueqv_R009NYNYN_partial_02_0033,
  rs_R009_ueqv_R009NYNYN_partial_02_0034,
  rs_R009_ueqv_R009NYNYN_partial_02_0035,
  rs_R009_ueqv_R009NYNYN_partial_02_0036,
  rs_R009_ueqv_R009NYNYN_partial_02_0037,
  rs_R009_ueqv_R009NYNYN_partial_02_0038,
  rs_R009_ueqv_R009NYNYN_partial_02_0039,
  rs_R009_ueqv_R009NYNYN_partial_02_0040,
  rs_R009_ueqv_R009NYNYN_partial_02_0041,
  rs_R009_ueqv_R009NYNYN_partial_02_0042,
  rs_R009_ueqv_R009NYNYN_partial_02_0043,
  rs_R009_ueqv_R009NYNYN_partial_02_0044,
  rs_R009_ueqv_R009NYNYN_partial_02_0045,
  rs_R009_ueqv_R009NYNYN_partial_02_0046,
  rs_R009_ueqv_R009NYNYN_partial_02_0047,
  rs_R009_ueqv_R009NYNYN_partial_02_0048,
  rs_R009_ueqv_R009NYNYN_partial_02_0049,
  rs_R009_ueqv_R009NYNYN_partial_02_0050,
  rs_R009_ueqv_R009NYNYN_partial_02_0051,
  rs_R009_ueqv_R009NYNYN_partial_02_0052,
  rs_R009_ueqv_R009NYNYN_partial_02_0053,
  rs_R009_ueqv_R009NYNYN_partial_02_0054,
  rs_R009_ueqv_R009NYNYN_partial_02_0055,
  rs_R009_ueqv_R009NYNYN_partial_02_0056,
  rs_R009_ueqv_R009NYNYN_partial_02_0057,
  rs_R009_ueqv_R009NYNYN_partial_02_0058,
  rs_R009_ueqv_R009NYNYN_partial_02_0059,
  rs_R009_ueqv_R009NYNYN_partial_02_0060,
  rs_R009_ueqv_R009NYNYN_partial_02_0061,
  rs_R009_ueqv_R009NYNYN_partial_02_0062,
  rs_R009_ueqv_R009NYNYN_partial_02_0063,
  rs_R009_ueqv_R009NYNYN_partial_02_0064,
  rs_R009_ueqv_R009NYNYN_partial_02_0065,
  rs_R009_ueqv_R009NYNYN_partial_02_0066,
  rs_R009_ueqv_R009NYNYN_partial_02_0067,
  rs_R009_ueqv_R009NYNYN_partial_02_0068,
  rs_R009_ueqv_R009NYNYN_partial_02_0069,
  rs_R009_ueqv_R009NYNYN_partial_02_0070,
  rs_R009_ueqv_R009NYNYN_partial_02_0071,
  rs_R009_ueqv_R009NYNYN_partial_02_0072,
  rs_R009_ueqv_R009NYNYN_partial_02_0073,
  rs_R009_ueqv_R009NYNYN_partial_02_0074,
  rs_R009_ueqv_R009NYNYN_partial_02_0075,
  rs_R009_ueqv_R009NYNYN_partial_02_0076,
  rs_R009_ueqv_R009NYNYN_partial_02_0077,
  rs_R009_ueqv_R009NYNYN_partial_02_0078,
  rs_R009_ueqv_R009NYNYN_partial_02_0079,
  rs_R009_ueqv_R009NYNYN_partial_02_0080,
  rs_R009_ueqv_R009NYNYN_partial_02_0081,
  rs_R009_ueqv_R009NYNYN_partial_02_0082,
  rs_R009_ueqv_R009NYNYN_partial_02_0083,
  rs_R009_ueqv_R009NYNYN_partial_02_0084,
  rs_R009_ueqv_R009NYNYN_partial_02_0085,
  rs_R009_ueqv_R009NYNYN_partial_02_0086,
  rs_R009_ueqv_R009NYNYN_partial_02_0087,
  rs_R009_ueqv_R009NYNYN_partial_02_0088,
  rs_R009_ueqv_R009NYNYN_partial_02_0089,
  rs_R009_ueqv_R009NYNYN_partial_02_0090,
  rs_R009_ueqv_R009NYNYN_partial_02_0091,
  rs_R009_ueqv_R009NYNYN_partial_02_0092,
  rs_R009_ueqv_R009NYNYN_partial_02_0093,
  rs_R009_ueqv_R009NYNYN_partial_02_0094,
  rs_R009_ueqv_R009NYNYN_partial_02_0095,
  rs_R009_ueqv_R009NYNYN_partial_02_0096,
  rs_R009_ueqv_R009NYNYN_partial_02_0097,
  rs_R009_ueqv_R009NYNYN_partial_02_0098,
  rs_R009_ueqv_R009NYNYN_partial_02_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_02_0000_0099 : Poly :=
[
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-915328190854138551471170615446156849634340895642745927748927004743211057099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(0, 1), (1, 2), (10, 1)],
  term ((-334694819791852282016 : Rat) / 32049107564750198685) [(0, 1), (1, 2), (10, 1), (16, 1)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 1), (1, 2), (12, 1)],
  term ((167347409895926141008 : Rat) / 32049107564750198685) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((915328190854138551471170615446156849634340895642745927748927004743211057099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(0, 1), (10, 1), (11, 2)],
  term ((334694819791852282016 : Rat) / 32049107564750198685) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((-6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 1), (10, 2), (12, 1)],
  term ((-167347409895926141008 : Rat) / 32049107564750198685) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((915328190854138551471170615446156849634340895642745927748927004743211057099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(0, 1), (10, 3)],
  term ((334694819791852282016 : Rat) / 32049107564750198685) [(0, 1), (10, 3), (16, 1)],
  term ((-6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 1), (11, 2), (12, 1)],
  term ((-167347409895926141008 : Rat) / 32049107564750198685) [(0, 1), (11, 2), (12, 1), (16, 1)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 1), (11, 3), (15, 1)],
  term ((-25830077419170561919349477954962284833955750674356794832328188545441681543722203 : Rat) / 13784128457147665997667699055263309557223401320469787348468170298791758080000) [(0, 2)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (8, 1), (11, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (8, 1), (15, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (9, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (9, 1), (10, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (9, 1), (10, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-1225496284267972044034680810610671325320093331024 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 2), (1, 1), (10, 1), (15, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((277266589773173945735094163483092988720948152960 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (1, 1), (11, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 2), (1, 1), (13, 1)],
  term ((231495586300516381768 : Rat) / 32049107564750198685) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-804899846600443159242072524132741168451204901765448236 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 2), (1, 2)],
  term ((-957243529681522105109202703141992948711753416714585 : Rat) / 73144122068565168275232132022233738601204849100226) [(0, 2), (2, 1)],
  term ((-228617455162261592374622066945088951094758857263798 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (2, 1), (11, 2)],
  term ((4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(0, 2), (2, 1), (12, 1)],
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((9746722386659317836135860499614212489322543564182 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 2), (2, 1), (15, 2)],
  term ((-787287388372487 : Rat) / 1048898954827367) [(0, 2), (2, 1), (16, 1)],
  term ((-146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (3, 1), (8, 1), (11, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (3, 1), (8, 1), (13, 1)],
  term ((-51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (3, 1), (8, 1), (15, 1)],
  term ((79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((376315591597847565770747214216403896530673827605466 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 2), (3, 1), (11, 1)],
  term ((424793539505796783445640233129880304495251437999423 : Rat) / 36572061034282584137616066011116869300602424550113) [(0, 2), (3, 1), (13, 1)],
  term ((2929355028119901040692448208548651313666965489861 : Rat) / 420368517635432001581793862196745624144855454599) [(0, 2), (3, 1), (15, 1)],
  term ((1574574776744974 : Rat) / 1048898954827367) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (11, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (9, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (9, 1), (10, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(0, 2), (5, 1), (11, 1)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (6, 1)],
  term ((1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (6, 1), (8, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 2), (7, 1), (9, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((3348110347927727174942761402703919039098303248385783261723322069412846282315445659 : Rat) / 1845350197200643785437763211023375566973282851777892781276176298750746612960000) [(0, 2), (8, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 1), (9, 1), (11, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (8, 1), (10, 1)],
  term ((63874574089153914960514941033146795478883778134607726063295390928 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-95880280753224113419955420943544692046985856096454728237411431488159323032 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((7702308172494839458112 : Rat) / 4339258264657398321155) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((16352936973231285059981654685691145453744641793202689615395773532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (8, 1), (11, 2)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(0, 2), (8, 1), (12, 1)],
  term ((-882279375742283788 : Rat) / 712202390327782193) [(0, 2), (8, 1), (12, 1), (16, 1)],
  term ((-33794665735672374726018367460792793382083985950056804206208613296 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 1741526715918218292267431714815089014314401169053) [(0, 2), (8, 1), (13, 2)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(0, 2), (8, 1), (15, 2)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((5625735004609077918618844 : Rat) / 168738551328409796076525) [(0, 2), (8, 1), (16, 1)],
  term ((-24805749529769896725376078114260091892570293122432682521909032032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(0, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1057496637197239061162106794564914878537122436075892361108610859301020879412 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((1973735849983421113728 : Rat) / 4339258264657398321155) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((238652910412337876370749881718916494271243979271280314131787220842 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(0, 2), (9, 1), (11, 1)],
  term ((-967604402247826057184 : Rat) / 867851652931479664231) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((69457221858904429441402215074235143928481714814588417149070878273100194405638667 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(0, 2), (9, 1), (13, 1)],
  term ((-68295154809442242038836 : Rat) / 180389165002186130208015) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((42097495400497161401543562589591515534924504220069905554054245439 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(0, 2), (9, 1), (15, 1)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (9, 2)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(0, 2), (9, 2), (10, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (10, 1), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(0, 2), (9, 2), (16, 1)],
  term ((856199973762092726870558763423062990346141748899964897266201917545700575099 : Rat) / 3129409505495597248402121847482321881314073483546826721740904047535522000) [(0, 2), (10, 1)],
  term ((-132709240381195416956186448322446631773974867568636 : Rat) / 1354520779047503116208002444856180344466756464819) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((30292153212333967249008563804069345431606354216320310320981647032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(0, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(0, 2), (10, 1), (11, 2)],
  term ((-19739871204079129004118185447737285475870731568782006993467763434667291588432691 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(0, 2), (10, 1), (12, 1)],
  term ((-3519280546611759732950072 : Rat) / 168738551328409796076525) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((12677146461852574709467901324159841378037296033537383358307752028 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 2), (10, 2)],
  term ((402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 2), (11, 2)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 3), (3, 1), (15, 1)],
  term ((-915328190854138551471170615446156849634340895642745927748927004743211057099 : Rat) / 1564704752747798624201060923741160940657036741773413360870452023767761000) [(0, 3), (10, 1)],
  term ((-334694819791852282016 : Rat) / 32049107564750198685) [(0, 3), (10, 1), (16, 1)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(0, 3), (11, 1), (15, 1)],
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(0, 3), (12, 1)],
  term ((167347409895926141008 : Rat) / 32049107564750198685) [(0, 3), (12, 1), (16, 1)],
  term ((-402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(0, 4)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (10, 2), (15, 1)],
  term ((-3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (10, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 2), (11, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (10, 2), (15, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((221473389797841062944 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (8, 1), (11, 3)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 1), (11, 2)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 2)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 2), (16, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (10, 3)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (10, 3), (16, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (9, 1), (11, 2)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((1225496284267972044034680810610671325320093331024 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((-277266589773173945735094163483092988720948152960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (10, 2), (11, 1)],
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (10, 2), (11, 1), (16, 1)],
  term ((-6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(1, 1), (10, 2), (13, 1)],
  term ((-231495586300516381768 : Rat) / 32049107564750198685) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (10, 2), (15, 1), (16, 1)],
  term ((1225496284267972044034680810610671325320093331024 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 1), (10, 3), (15, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 1), (10, 3), (15, 1), (16, 1)],
  term ((-6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(1, 1), (11, 2), (13, 1)],
  term ((-231495586300516381768 : Rat) / 32049107564750198685) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-277266589773173945735094163483092988720948152960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 1), (11, 3)],
  term ((55368347449460265736 : Rat) / 123978807561639952033) [(1, 1), (11, 3), (16, 1)],
  term ((-25830077419170561919349477954962284833955750674356794832328188545441681543722203 : Rat) / 13784128457147665997667699055263309557223401320469787348468170298791758080000) [(1, 2)],
  term ((-957243529681522105109202703141992948711753416714585 : Rat) / 73144122068565168275232132022233738601204849100226) [(1, 2), (2, 1)],
  term ((-228617455162261592374622066945088951094758857263798 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (2, 1), (11, 2)],
  term ((4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(1, 2), (2, 1), (12, 1)],
  term ((2852486164866260356910896250009098986648548482336 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((9746722386659317836135860499614212489322543564182 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 2), (2, 1), (15, 2)],
  term ((-787287388372487 : Rat) / 1048898954827367) [(1, 2), (2, 1), (16, 1)],
  term ((-146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (3, 1), (8, 1), (11, 1)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (3, 1), (8, 1), (13, 1)],
  term ((-51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (3, 1), (8, 1), (15, 1)],
  term ((79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((376315591597847565770747214216403896530673827605466 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 2), (3, 1), (11, 1)],
  term ((424793539505796783445640233129880304495251437999423 : Rat) / 36572061034282584137616066011116869300602424550113) [(1, 2), (3, 1), (13, 1)],
  term ((2929355028119901040692448208548651313666965489861 : Rat) / 420368517635432001581793862196745624144855454599) [(1, 2), (3, 1), (15, 1)],
  term ((1574574776744974 : Rat) / 1048898954827367) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (11, 1)],
  term ((5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (9, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (9, 1), (10, 1)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(1, 2), (5, 1), (11, 1)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (6, 1)],
  term ((1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (6, 1), (8, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 2), (7, 1), (9, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1574574776744974 : Rat) / 3146696864482101) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((3348110347927727174942761402703919039098303248385783261723322069412846282315445659 : Rat) / 1845350197200643785437763211023375566973282851777892781276176298750746612960000) [(1, 2), (8, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 1), (9, 1), (11, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (8, 1), (9, 1), (15, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (8, 1), (10, 1)],
  term ((63874574089153914960514941033146795478883778134607726063295390928 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-95880280753224113419955420943544692046985856096454728237411431488159323032 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((7702308172494839458112 : Rat) / 4339258264657398321155) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((16352936973231285059981654685691145453744641793202689615395773532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (8, 1), (11, 2)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(1, 2), (8, 1), (12, 1)],
  term ((-882279375742283788 : Rat) / 712202390327782193) [(1, 2), (8, 1), (12, 1), (16, 1)],
  term ((-33794665735672374726018367460792793382083985950056804206208613296 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((5704972329732520713821792500018197973297096964672 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 2), (8, 1), (13, 2)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(1, 2), (8, 1), (15, 2)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((5625735004609077918618844 : Rat) / 168738551328409796076525) [(1, 2), (8, 1), (16, 1)],
  term ((-24805749529769896725376078114260091892570293122432682521909032032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(1, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1057496637197239061162106794564914878537122436075892361108610859301020879412 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((1973735849983421113728 : Rat) / 4339258264657398321155) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((238652910412337876370749881718916494271243979271280314131787220842 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(1, 2), (9, 1), (11, 1)],
  term ((-967604402247826057184 : Rat) / 867851652931479664231) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((69457221858904429441402215074235143928481714814588417149070878273100194405638667 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(1, 2), (9, 1), (13, 1)],
  term ((-68295154809442242038836 : Rat) / 180389165002186130208015) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((42097495400497161401543562589591515534924504220069905554054245439 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(1, 2), (9, 1), (15, 1)],
  term ((-1926038409869376 : Rat) / 7342292683791569) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (9, 2)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(1, 2), (9, 2), (10, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (10, 1), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(1, 2), (9, 2), (16, 1)],
  term ((856199973762092726870558763423062990346141748899964897266201917545700575099 : Rat) / 3129409505495597248402121847482321881314073483546826721740904047535522000) [(1, 2), (10, 1)],
  term ((-132709240381195416956186448322446631773974867568636 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((30292153212333967249008563804069345431606354216320310320981647032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(1, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(1, 2), (10, 1), (11, 2)],
  term ((-19739871204079129004118185447737285475870731568782006993467763434667291588432691 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(1, 2), (10, 1), (12, 1)],
  term ((-3519280546611759732950072 : Rat) / 168738551328409796076525) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((12677146461852574709467901324159841378037296033537383358307752028 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 2), (10, 2)],
  term ((402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 2), (11, 2)],
  term ((3587675373958673285011070731579025480263586563888 : Rat) / 12190687011427528045872022003705623100200808183371) [(1, 3), (2, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 3), (7, 1), (16, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (8, 1), (11, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 3), (8, 1), (11, 1), (16, 1)],
  term ((1109066359092695782940376653932371954883792611840 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (8, 1), (15, 1)],
  term ((-221473389797841062944 : Rat) / 123978807561639952033) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((-554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (9, 1)],
  term ((554533179546347891470188326966185977441896305920 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (9, 1), (10, 1)],
  term ((-110736694898920531472 : Rat) / 123978807561639952033) [(1, 3), (9, 1), (10, 1), (16, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 3), (9, 1), (16, 1)],
  term ((-1225496284267972044034680810610671325320093331024 : Rat) / 1741526715918218292267431714815089014314401169053) [(1, 3), (10, 1), (15, 1)],
  term ((110736694898920531472 : Rat) / 123978807561639952033) [(1, 3), (10, 1), (15, 1), (16, 1)],
  term ((277266589773173945735094163483092988720948152960 : Rat) / 1354520779047503116208002444856180344466756464819) [(1, 3), (11, 1)],
  term ((-55368347449460265736 : Rat) / 123978807561639952033) [(1, 3), (11, 1), (16, 1)],
  term ((6497328604846864696374497597241297323689756452188067930390933515643068585293 : Rat) / 21905866538469180738814852932376253169198514384827787052186328332748654000) [(1, 3), (13, 1)],
  term ((231495586300516381768 : Rat) / 32049107564750198685) [(1, 3), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 3), (15, 1), (16, 1)],
  term ((-402449923300221579621036262066370584225602450882724118 : Rat) / 195843386838583238056934033489530835104725983465855115) [(1, 4)],
  term ((957243529681522105109202703141992948711753416714585 : Rat) / 73144122068565168275232132022233738601204849100226) [(2, 1), (10, 2)],
  term ((228617455162261592374622066945088951094758857263798 : Rat) / 12190687011427528045872022003705623100200808183371) [(2, 1), (10, 2), (11, 1), (15, 1)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (10, 2), (11, 2)],
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(2, 1), (10, 2), (12, 1)],
  term ((-2852486164866260356910896250009098986648548482336 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (10, 2), (13, 1), (15, 1)],
  term ((-9746722386659317836135860499614212489322543564182 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (10, 2), (15, 2)],
  term ((787287388372487 : Rat) / 1048898954827367) [(2, 1), (10, 2), (16, 1)],
  term ((957243529681522105109202703141992948711753416714585 : Rat) / 73144122068565168275232132022233738601204849100226) [(2, 1), (11, 2)],
  term ((-4344730130075975005001747801261151533682639724661 : Rat) / 440627241376898604067663445917070714465089452411) [(2, 1), (11, 2), (12, 1)],
  term ((-2852486164866260356910896250009098986648548482336 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-9746722386659317836135860499614212489322543564182 : Rat) / 1741526715918218292267431714815089014314401169053) [(2, 1), (11, 2), (15, 2)],
  term ((787287388372487 : Rat) / 1048898954827367) [(2, 1), (11, 2), (16, 1)],
  term ((228617455162261592374622066945088951094758857263798 : Rat) / 12190687011427528045872022003705623100200808183371) [(2, 1), (11, 3), (15, 1)],
  term ((-26403261873363683810466717412786205636019481314608 : Rat) / 1354520779047503116208002444856180344466756464819) [(2, 1), (11, 4)],
  term ((146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (8, 1), (10, 2), (11, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (8, 1), (10, 2), (13, 1)],
  term ((51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (10, 2), (15, 1)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (8, 1), (11, 2), (13, 1)],
  term ((51830221844573044927459011190735890323793330640328 : Rat) / 4063562337142509348624007334568541033400269394457) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((146942409994440100667164554423135286868060778576560 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (8, 1), (11, 3)],
  term ((-84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (10, 1), (11, 2), (15, 1)],
  term ((-79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (10, 1), (11, 3)],
  term ((-376315591597847565770747214216403896530673827605466 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (10, 2), (11, 1)],
  term ((-424793539505796783445640233129880304495251437999423 : Rat) / 36572061034282584137616066011116869300602424550113) [(3, 1), (10, 2), (13, 1)],
  term ((-2929355028119901040692448208548651313666965489861 : Rat) / 420368517635432001581793862196745624144855454599) [(3, 1), (10, 2), (15, 1)],
  term ((-1574574776744974 : Rat) / 1048898954827367) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-79209785620091051431400152238358616908058443943824 : Rat) / 1354520779047503116208002444856180344466756464819) [(3, 1), (10, 3), (11, 1)],
  term ((-84310371288028822197760162192107098786194284251368 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (10, 3), (15, 1)],
  term ((-424793539505796783445640233129880304495251437999423 : Rat) / 36572061034282584137616066011116869300602424550113) [(3, 1), (11, 2), (13, 1)],
  term ((-2929355028119901040692448208548651313666965489861 : Rat) / 420368517635432001581793862196745624144855454599) [(3, 1), (11, 2), (15, 1)],
  term ((-1574574776744974 : Rat) / 1048898954827367) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-376315591597847565770747214216403896530673827605466 : Rat) / 12190687011427528045872022003705623100200808183371) [(3, 1), (11, 3)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 2), (11, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (10, 2), (15, 1)],
  term ((-5722604153576009374971138360219682679132300849342054400 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 2), (15, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (8, 1), (11, 3)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 1), (11, 2)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 2)],
  term ((-2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (10, 3)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (9, 1), (11, 2)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 2), (11, 1)],
  term ((2861302076788004687485569180109841339566150424671027200 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (10, 3), (15, 1)],
  term ((-1430651038394002343742784590054920669783075212335513600 : Rat) / 5029561857573480003500719814159288601122592702202571773) [(5, 1), (11, 3)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (8, 1), (10, 2)],
  term ((-1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (8, 1), (11, 2)],
  term ((1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (10, 2)],
  term ((1645138863128947703751118811458935030890783431049557784 : Rat) / 587530160515749714170802100468592505314177950397565345) [(6, 1), (11, 2)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (10, 2), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(7, 1), (9, 1), (10, 2)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(7, 1), (9, 1), (11, 2)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 1), (11, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (10, 2), (13, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 1), (11, 2), (13, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (11, 2), (15, 1), (16, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 3)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1), (11, 2)],
  term ((-3348110347927727174942761402703919039098303248385783261723322069412846282315445659 : Rat) / 1845350197200643785437763211023375566973282851777892781276176298750746612960000) [(8, 1), (10, 2)],
  term ((-63874574089153914960514941033146795478883778134607726063295390928 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (10, 2), (11, 1), (13, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((95880280753224113419955420943544692046985856096454728237411431488159323032 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-7702308172494839458112 : Rat) / 4339258264657398321155) [(8, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16352936973231285059981654685691145453744641793202689615395773532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 2), (11, 2)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (10, 2), (11, 2), (16, 1)],
  term ((-111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(8, 1), (10, 2), (12, 1)],
  term ((882279375742283788 : Rat) / 712202390327782193) [(8, 1), (10, 2), (12, 1), (16, 1)],
  term ((33794665735672374726018367460792793382083985950056804206208613296 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 1741526715918218292267431714815089014314401169053) [(8, 1), (10, 2), (13, 2)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 2), (15, 2)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(8, 1), (10, 2), (15, 2), (16, 1)],
  term ((-5625735004609077918618844 : Rat) / 168738551328409796076525) [(8, 1), (10, 2), (16, 1)],
  term ((-41266564453486465618310601345535086615962309737808 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 3)],
  term ((-3348110347927727174942761402703919039098303248385783261723322069412846282315445659 : Rat) / 1845350197200643785437763211023375566973282851777892781276176298750746612960000) [(8, 1), (11, 2)],
  term ((-111308236167999038404643805495561351656377754378932634212128031352950634351 : Rat) / 1112678935287323466098532212438158891133892794149982834396765883568185600) [(8, 1), (11, 2), (12, 1)],
  term ((882279375742283788 : Rat) / 712202390327782193) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((33794665735672374726018367460792793382083985950056804206208613296 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5704972329732520713821792500018197973297096964672 : Rat) / 1741526715918218292267431714815089014314401169053) [(8, 1), (11, 2), (13, 2)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (11, 2), (15, 2)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-5625735004609077918618844 : Rat) / 168738551328409796076525) [(8, 1), (11, 2), (16, 1)],
  term ((-63874574089153914960514941033146795478883778134607726063295390928 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (11, 3), (13, 1)],
  term ((-11197958920972549769024 : Rat) / 13017774793972194963465) [(8, 1), (11, 3), (13, 1), (16, 1)],
  term ((95880280753224113419955420943544692046985856096454728237411431488159323032 : Rat) / 980794923157890254878564762447931154939974363841562119986034527371163625) [(8, 1), (11, 3), (15, 1)],
  term ((-7702308172494839458112 : Rat) / 4339258264657398321155) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-16352936973231285059981654685691145453744641793202689615395773532 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (11, 4)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (11, 4), (16, 1)],
  term ((67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 1), (11, 2), (13, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (11, 2), (13, 1), (16, 1)],
  term ((1057496637197239061162106794564914878537122436075892361108610859301020879412 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1973735849983421113728 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((24805749529769896725376078114260091892570293122432682521909032032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 3)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (11, 3), (16, 1)],
  term ((-238652910412337876370749881718916494271243979271280314131787220842 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(9, 1), (10, 2), (11, 1)],
  term ((967604402247826057184 : Rat) / 867851652931479664231) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-69457221858904429441402215074235143928481714814588417149070878273100194405638667 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(9, 1), (10, 2), (13, 1)],
  term ((68295154809442242038836 : Rat) / 180389165002186130208015) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-42097495400497161401543562589591515534924504220069905554054245439 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(9, 1), (10, 2), (15, 1)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((24805749529769896725376078114260091892570293122432682521909032032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 3), (11, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (10, 3), (11, 1), (16, 1)],
  term ((67813664330321102574289677797742631733924 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 3), (13, 1)],
  term ((11197958920972549769024 : Rat) / 13017774793972194963465) [(9, 1), (10, 3), (13, 1), (16, 1)],
  term ((1057496637197239061162106794564914878537122436075892361108610859301020879412 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (10, 3), (15, 1)],
  term ((-1973735849983421113728 : Rat) / 4339258264657398321155) [(9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-69457221858904429441402215074235143928481714814588417149070878273100194405638667 : Rat) / 394552612416079039108141226933933828319404983127201463128589992015627909203200) [(9, 1), (11, 2), (13, 1)],
  term ((68295154809442242038836 : Rat) / 180389165002186130208015) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-42097495400497161401543562589591515534924504220069905554054245439 : Rat) / 2399371832879894720847591854613813697948781367199862237603260731) [(9, 1), (11, 2), (15, 1)],
  term ((1926038409869376 : Rat) / 7342292683791569) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-238652910412337876370749881718916494271243979271280314131787220842 : Rat) / 2778251916163893409223129017330304727709021280697860354045710875) [(9, 1), (11, 3)],
  term ((967604402247826057184 : Rat) / 867851652931479664231) [(9, 1), (11, 3), (16, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 2)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 2), (16, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (16, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 3)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (10, 3), (16, 1)],
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 2)],
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (11, 2), (16, 1)],
  term ((-856199973762092726870558763423062990346141748899964897266201917545700575099 : Rat) / 3129409505495597248402121847482321881314073483546826721740904047535522000) [(10, 1), (11, 2)],
  term ((19739871204079129004118185447737285475870731568782006993467763434667291588432691 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(10, 1), (11, 2), (12, 1)],
  term ((3519280546611759732950072 : Rat) / 168738551328409796076525) [(10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-12677146461852574709467901324159841378037296033537383358307752028 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((132709240381195416956186448322446631773974867568636 : Rat) / 1354520779047503116208002444856180344466756464819) [(10, 1), (11, 3), (13, 1)],
  term ((-30292153212333967249008563804069345431606354216320310320981647032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 3), (15, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 1), (11, 3), (15, 1), (16, 1)],
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 1), (11, 4)],
  term ((25830077419170561919349477954962284833955750674356794832328188545441681543722203 : Rat) / 13784128457147665997667699055263309557223401320469787348468170298791758080000) [(10, 2)],
  term ((-856199973762092726870558763423062990346141748899964897266201917545700575099 : Rat) / 3129409505495597248402121847482321881314073483546826721740904047535522000) [(10, 3)],
  term ((132709240381195416956186448322446631773974867568636 : Rat) / 1354520779047503116208002444856180344466756464819) [(10, 3), (11, 1), (13, 1)],
  term ((-30292153212333967249008563804069345431606354216320310320981647032 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 3), (11, 1), (15, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(10, 3), (11, 1), (15, 1), (16, 1)],
  term ((-75583606333489524429136943513887229716393729965940 : Rat) / 4063562337142509348624007334568541033400269394457) [(10, 3), (11, 2)],
  term ((19739871204079129004118185447737285475870731568782006993467763434667291588432691 : Rat) / 16476341046434319512837171526994424705118596890874042689965859810274523330000) [(10, 3), (12, 1)],
  term ((3519280546611759732950072 : Rat) / 168738551328409796076525) [(10, 3), (12, 1), (16, 1)],
  term ((-12677146461852574709467901324159841378037296033537383358307752028 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(10, 3), (13, 1), (15, 1)],
  term ((25830077419170561919349477954962284833955750674356794832328188545441681543722203 : Rat) / 13784128457147665997667699055263309557223401320469787348468170298791758080000) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NYNYN_block_02_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_02_0000_0099
      rs_R009_ueqv_R009NYNYN_block_02_0000_0099 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
