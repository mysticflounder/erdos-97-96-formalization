/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 9:1000-1032

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_09_1000_1032 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1000 : Poly :=
[
  term ((912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1000 for generator 9. -/
def ep_Q2_008_partial_09_1000 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 9. -/
theorem ep_Q2_008_partial_09_1000_valid :
    mulPoly ep_Q2_008_coefficient_09_1000
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1001 : Poly :=
[
  term ((171710815388328391159020793892074775740575 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1001 for generator 9. -/
def ep_Q2_008_partial_09_1001 : Poly :=
[
  term ((171710815388328391159020793892074775740575 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-171710815388328391159020793892074775740575 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 9. -/
theorem ep_Q2_008_partial_09_1001_valid :
    mulPoly ep_Q2_008_coefficient_09_1001
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1002 : Poly :=
[
  term ((-716342282924263875 : Rat) / 692956453614176359) [(10, 1), (16, 1)]
]

/-- Partial product 1002 for generator 9. -/
def ep_Q2_008_partial_09_1002 : Poly :=
[
  term ((-1432684565848527750 : Rat) / 692956453614176359) [(2, 1), (10, 1), (16, 1)],
  term ((716342282924263875 : Rat) / 692956453614176359) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 9. -/
theorem ep_Q2_008_partial_09_1002_valid :
    mulPoly ep_Q2_008_coefficient_09_1002
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1003 : Poly :=
[
  term ((-3919697881978937321306898299118906064800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1003 for generator 9. -/
def ep_Q2_008_partial_09_1003 : Poly :=
[
  term ((-7839395763957874642613796598237812129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3919697881978937321306898299118906064800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 9. -/
theorem ep_Q2_008_partial_09_1003_valid :
    mulPoly ep_Q2_008_coefficient_09_1003
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1004 : Poly :=
[
  term ((1191138428434806000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1004 for generator 9. -/
def ep_Q2_008_partial_09_1004 : Poly :=
[
  term ((2382276856869612000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1191138428434806000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 9. -/
theorem ep_Q2_008_partial_09_1004_valid :
    mulPoly ep_Q2_008_coefficient_09_1004
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1005 : Poly :=
[
  term ((-1084622700618442882221915656387597227489800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1005 for generator 9. -/
def ep_Q2_008_partial_09_1005 : Poly :=
[
  term ((-2169245401236885764443831312775194454979600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1084622700618442882221915656387597227489800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 9. -/
theorem ep_Q2_008_partial_09_1005_valid :
    mulPoly ep_Q2_008_coefficient_09_1005
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1006 : Poly :=
[
  term ((-739561277842910879317489101332838816000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1006 for generator 9. -/
def ep_Q2_008_partial_09_1006 : Poly :=
[
  term ((-1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((739561277842910879317489101332838816000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 9. -/
theorem ep_Q2_008_partial_09_1006_valid :
    mulPoly ep_Q2_008_coefficient_09_1006
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1007 : Poly :=
[
  term ((-2021067534442394656485892126327792997296125 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1007 for generator 9. -/
def ep_Q2_008_partial_09_1007 : Poly :=
[
  term ((-2021067534442394656485892126327792997296125 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2021067534442394656485892126327792997296125 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 9. -/
theorem ep_Q2_008_partial_09_1007_valid :
    mulPoly ep_Q2_008_coefficient_09_1007
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1008 : Poly :=
[
  term ((46540776888706005160357234588337945746800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1008 for generator 9. -/
def ep_Q2_008_partial_09_1008 : Poly :=
[
  term ((93081553777412010320714469176675891493600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-46540776888706005160357234588337945746800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 9. -/
theorem ep_Q2_008_partial_09_1008_valid :
    mulPoly ep_Q2_008_coefficient_09_1008
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1009 : Poly :=
[
  term ((2078747584113896458518655566046791734400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 1009 for generator 9. -/
def ep_Q2_008_partial_09_1009 : Poly :=
[
  term ((4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2078747584113896458518655566046791734400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 9. -/
theorem ep_Q2_008_partial_09_1009_valid :
    mulPoly ep_Q2_008_coefficient_09_1009
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1010 : Poly :=
[
  term ((-20600105216492764125 : Rat) / 22174606515653643488) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1010 for generator 9. -/
def ep_Q2_008_partial_09_1010 : Poly :=
[
  term ((-20600105216492764125 : Rat) / 11087303257826821744) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((20600105216492764125 : Rat) / 22174606515653643488) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 9. -/
theorem ep_Q2_008_partial_09_1010_valid :
    mulPoly ep_Q2_008_coefficient_09_1010
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1011 : Poly :=
[
  term ((-1379209227143377468802494880487966710693400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1011 for generator 9. -/
def ep_Q2_008_partial_09_1011 : Poly :=
[
  term ((-2758418454286754937604989760975933421386800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1379209227143377468802494880487966710693400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 9. -/
theorem ep_Q2_008_partial_09_1011_valid :
    mulPoly ep_Q2_008_coefficient_09_1011
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1012 : Poly :=
[
  term ((1450929662392911490851489138280941264578400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 1012 for generator 9. -/
def ep_Q2_008_partial_09_1012 : Poly :=
[
  term ((2901859324785822981702978276561882529156800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1450929662392911490851489138280941264578400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 9. -/
theorem ep_Q2_008_partial_09_1012_valid :
    mulPoly ep_Q2_008_coefficient_09_1012
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1013 : Poly :=
[
  term ((-936777618601020447135486195021595833600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

/-- Partial product 1013 for generator 9. -/
def ep_Q2_008_partial_09_1013 : Poly :=
[
  term ((-1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((936777618601020447135486195021595833600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 9. -/
theorem ep_Q2_008_partial_09_1013_valid :
    mulPoly ep_Q2_008_coefficient_09_1013
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1014 : Poly :=
[
  term ((986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 4), (16, 1)]
]

/-- Partial product 1014 for generator 9. -/
def ep_Q2_008_partial_09_1014 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 9. -/
theorem ep_Q2_008_partial_09_1014_valid :
    mulPoly ep_Q2_008_coefficient_09_1014
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1015 : Poly :=
[
  term ((2084492249760910500 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 1015 for generator 9. -/
def ep_Q2_008_partial_09_1015 : Poly :=
[
  term ((4168984499521821000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((-2084492249760910500 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 9. -/
theorem ep_Q2_008_partial_09_1015_valid :
    mulPoly ep_Q2_008_coefficient_09_1015
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1016 : Poly :=
[
  term ((172564298163345871840747456977662390400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 1016 for generator 9. -/
def ep_Q2_008_partial_09_1016 : Poly :=
[
  term ((345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-172564298163345871840747456977662390400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 9. -/
theorem ep_Q2_008_partial_09_1016_valid :
    mulPoly ep_Q2_008_coefficient_09_1016
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1017 : Poly :=
[
  term ((95719610994867929631247261237585316802375 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1017 for generator 9. -/
def ep_Q2_008_partial_09_1017 : Poly :=
[
  term ((95719610994867929631247261237585316802375 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-95719610994867929631247261237585316802375 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 9. -/
theorem ep_Q2_008_partial_09_1017_valid :
    mulPoly ep_Q2_008_coefficient_09_1017
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1018 : Poly :=
[
  term ((-7303545811913992061836821224942809366875 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1018 for generator 9. -/
def ep_Q2_008_partial_09_1018 : Poly :=
[
  term ((-7303545811913992061836821224942809366875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((7303545811913992061836821224942809366875 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 9. -/
theorem ep_Q2_008_partial_09_1018_valid :
    mulPoly ep_Q2_008_coefficient_09_1018
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1019 : Poly :=
[
  term ((14687565315436229066002556555156394125306301 : Rat) / 2699321629621272246011853252143728875167968) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1019 for generator 9. -/
def ep_Q2_008_partial_09_1019 : Poly :=
[
  term ((14687565315436229066002556555156394125306301 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14687565315436229066002556555156394125306301 : Rat) / 2699321629621272246011853252143728875167968) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 9. -/
theorem ep_Q2_008_partial_09_1019_valid :
    mulPoly ep_Q2_008_coefficient_09_1019
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1020 : Poly :=
[
  term ((453969441684154202025618411340545201600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1020 for generator 9. -/
def ep_Q2_008_partial_09_1020 : Poly :=
[
  term ((907938883368308404051236822681090403200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-453969441684154202025618411340545201600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 9. -/
theorem ep_Q2_008_partial_09_1020_valid :
    mulPoly ep_Q2_008_coefficient_09_1020
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1021 : Poly :=
[
  term ((-13007384477683589934007137312626720764800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1021 for generator 9. -/
def ep_Q2_008_partial_09_1021 : Poly :=
[
  term ((-26014768955367179868014274625253441529600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((13007384477683589934007137312626720764800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 9. -/
theorem ep_Q2_008_partial_09_1021_valid :
    mulPoly ep_Q2_008_coefficient_09_1021
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1022 : Poly :=
[
  term ((139184747485977174250526105052640909743879 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1022 for generator 9. -/
def ep_Q2_008_partial_09_1022 : Poly :=
[
  term ((139184747485977174250526105052640909743879 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-139184747485977174250526105052640909743879 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 9. -/
theorem ep_Q2_008_partial_09_1022_valid :
    mulPoly ep_Q2_008_coefficient_09_1022
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1023 : Poly :=
[
  term ((-7137589495722855063 : Rat) / 22174606515653643488) [(12, 1), (16, 1)]
]

/-- Partial product 1023 for generator 9. -/
def ep_Q2_008_partial_09_1023 : Poly :=
[
  term ((-7137589495722855063 : Rat) / 11087303257826821744) [(2, 1), (12, 1), (16, 1)],
  term ((7137589495722855063 : Rat) / 22174606515653643488) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 9. -/
theorem ep_Q2_008_partial_09_1023_valid :
    mulPoly ep_Q2_008_coefficient_09_1023
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1024 : Poly :=
[
  term ((-1441080477240912460733177512653407747775669 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1024 for generator 9. -/
def ep_Q2_008_partial_09_1024 : Poly :=
[
  term ((-1441080477240912460733177512653407747775669 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((1441080477240912460733177512653407747775669 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 9. -/
theorem ep_Q2_008_partial_09_1024_valid :
    mulPoly ep_Q2_008_coefficient_09_1024
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1025 : Poly :=
[
  term ((-2680447728385770923268828100176652507720113 : Rat) / 674830407405318061502963313035932218791992) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1025 for generator 9. -/
def ep_Q2_008_partial_09_1025 : Poly :=
[
  term ((-2680447728385770923268828100176652507720113 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((2680447728385770923268828100176652507720113 : Rat) / 674830407405318061502963313035932218791992) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 9. -/
theorem ep_Q2_008_partial_09_1025_valid :
    mulPoly ep_Q2_008_coefficient_09_1025
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1026 : Poly :=
[
  term ((-9854407778128238582596808919614155802400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1026 for generator 9. -/
def ep_Q2_008_partial_09_1026 : Poly :=
[
  term ((-19708815556256477165193617839228311604800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((9854407778128238582596808919614155802400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 9. -/
theorem ep_Q2_008_partial_09_1026_valid :
    mulPoly ep_Q2_008_coefficient_09_1026
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1027 : Poly :=
[
  term ((17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 4), (16, 1)]
]

/-- Partial product 1027 for generator 9. -/
def ep_Q2_008_partial_09_1027 : Poly :=
[
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 4), (16, 1)],
  term ((-17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 9. -/
theorem ep_Q2_008_partial_09_1027_valid :
    mulPoly ep_Q2_008_coefficient_09_1027
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1028 : Poly :=
[
  term ((-92709074334554646045 : Rat) / 44349213031307286976) [(13, 2), (16, 1)]
]

/-- Partial product 1028 for generator 9. -/
def ep_Q2_008_partial_09_1028 : Poly :=
[
  term ((-92709074334554646045 : Rat) / 22174606515653643488) [(2, 1), (13, 2), (16, 1)],
  term ((92709074334554646045 : Rat) / 44349213031307286976) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 9. -/
theorem ep_Q2_008_partial_09_1028_valid :
    mulPoly ep_Q2_008_coefficient_09_1028
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1029 : Poly :=
[
  term ((3124573922771256080760849569896534872000 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1029 for generator 9. -/
def ep_Q2_008_partial_09_1029 : Poly :=
[
  term ((6249147845542512161521699139793069744000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3124573922771256080760849569896534872000 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 9. -/
theorem ep_Q2_008_partial_09_1029_valid :
    mulPoly ep_Q2_008_coefficient_09_1029
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1030 : Poly :=
[
  term ((2361711969064843028417850048259231814760363 : Rat) / 2699321629621272246011853252143728875167968) [(15, 2), (16, 1)]
]

/-- Partial product 1030 for generator 9. -/
def ep_Q2_008_partial_09_1030 : Poly :=
[
  term ((2361711969064843028417850048259231814760363 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (15, 2), (16, 1)],
  term ((-2361711969064843028417850048259231814760363 : Rat) / 2699321629621272246011853252143728875167968) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 9. -/
theorem ep_Q2_008_partial_09_1030_valid :
    mulPoly ep_Q2_008_coefficient_09_1030
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1031 : Poly :=
[
  term ((-10098114343970138494541993239751939288400 : Rat) / 84353800925664757687870414129491527348999) [(15, 4), (16, 1)]
]

/-- Partial product 1031 for generator 9. -/
def ep_Q2_008_partial_09_1031 : Poly :=
[
  term ((-20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (15, 4), (16, 1)],
  term ((10098114343970138494541993239751939288400 : Rat) / 84353800925664757687870414129491527348999) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 9. -/
theorem ep_Q2_008_partial_09_1031_valid :
    mulPoly ep_Q2_008_coefficient_09_1031
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 9. -/
def ep_Q2_008_coefficient_09_1032 : Poly :=
[
  term ((-54940016052332941741 : Rat) / 88698426062614573952) [(16, 1)]
]

/-- Partial product 1032 for generator 9. -/
def ep_Q2_008_partial_09_1032 : Poly :=
[
  term ((-54940016052332941741 : Rat) / 44349213031307286976) [(2, 1), (16, 1)],
  term ((54940016052332941741 : Rat) / 88698426062614573952) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 9. -/
theorem ep_Q2_008_partial_09_1032_valid :
    mulPoly ep_Q2_008_coefficient_09_1032
        ep_Q2_008_generator_09_1000_1032 =
      ep_Q2_008_partial_09_1032 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_09_1000_1032 : List Poly :=
[
  ep_Q2_008_partial_09_1000,
  ep_Q2_008_partial_09_1001,
  ep_Q2_008_partial_09_1002,
  ep_Q2_008_partial_09_1003,
  ep_Q2_008_partial_09_1004,
  ep_Q2_008_partial_09_1005,
  ep_Q2_008_partial_09_1006,
  ep_Q2_008_partial_09_1007,
  ep_Q2_008_partial_09_1008,
  ep_Q2_008_partial_09_1009,
  ep_Q2_008_partial_09_1010,
  ep_Q2_008_partial_09_1011,
  ep_Q2_008_partial_09_1012,
  ep_Q2_008_partial_09_1013,
  ep_Q2_008_partial_09_1014,
  ep_Q2_008_partial_09_1015,
  ep_Q2_008_partial_09_1016,
  ep_Q2_008_partial_09_1017,
  ep_Q2_008_partial_09_1018,
  ep_Q2_008_partial_09_1019,
  ep_Q2_008_partial_09_1020,
  ep_Q2_008_partial_09_1021,
  ep_Q2_008_partial_09_1022,
  ep_Q2_008_partial_09_1023,
  ep_Q2_008_partial_09_1024,
  ep_Q2_008_partial_09_1025,
  ep_Q2_008_partial_09_1026,
  ep_Q2_008_partial_09_1027,
  ep_Q2_008_partial_09_1028,
  ep_Q2_008_partial_09_1029,
  ep_Q2_008_partial_09_1030,
  ep_Q2_008_partial_09_1031,
  ep_Q2_008_partial_09_1032
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_09_1000_1032 : Poly :=
[
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((171710815388328391159020793892074775740575 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1432684565848527750 : Rat) / 692956453614176359) [(2, 1), (10, 1), (16, 1)],
  term ((-7839395763957874642613796598237812129600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2169245401236885764443831312775194454979600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1479122555685821758634978202665677632000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((-2021067534442394656485892126327792997296125 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((93081553777412010320714469176675891493600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4157495168227792917037311132093583468800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-20600105216492764125 : Rat) / 11087303257826821744) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2758418454286754937604989760975933421386800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2901859324785822981702978276561882529156800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-1873555237202040894270972390043191667200 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 3), (15, 4), (16, 1)],
  term ((4168984499521821000 : Rat) / 692956453614176359) [(2, 1), (11, 1), (13, 3), (16, 1)],
  term ((345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(2, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((95719610994867929631247261237585316802375 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7303545811913992061836821224942809366875 : Rat) / 168707601851329515375740828258983054697998) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((14687565315436229066002556555156394125306301 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((907938883368308404051236822681090403200 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-26014768955367179868014274625253441529600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((139184747485977174250526105052640909743879 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7137589495722855063 : Rat) / 11087303257826821744) [(2, 1), (12, 1), (16, 1)],
  term ((-1441080477240912460733177512653407747775669 : Rat) / 674830407405318061502963313035932218791992) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2680447728385770923268828100176652507720113 : Rat) / 337415203702659030751481656517966109395996) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19708815556256477165193617839228311604800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((34679115264387073690690337739212889177600 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 2), (15, 4), (16, 1)],
  term ((-92709074334554646045 : Rat) / 22174606515653643488) [(2, 1), (13, 2), (16, 1)],
  term ((6249147845542512161521699139793069744000 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((2361711969064843028417850048259231814760363 : Rat) / 1349660814810636123005926626071864437583984) [(2, 1), (15, 2), (16, 1)],
  term ((-20196228687940276989083986479503878576800 : Rat) / 84353800925664757687870414129491527348999) [(2, 1), (15, 4), (16, 1)],
  term ((-54940016052332941741 : Rat) / 44349213031307286976) [(2, 1), (16, 1)],
  term ((-912661188914932799415581901754140595200 : Rat) / 84353800925664757687870414129491527348999) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-171710815388328391159020793892074775740575 : Rat) / 168707601851329515375740828258983054697998) [(10, 1), (15, 2), (16, 1)],
  term ((716342282924263875 : Rat) / 692956453614176359) [(10, 1), (16, 1)],
  term ((3919697881978937321306898299118906064800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1191138428434806000 : Rat) / 692956453614176359) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1084622700618442882221915656387597227489800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((739561277842910879317489101332838816000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (12, 1), (13, 3), (15, 2), (16, 1)],
  term ((2021067534442394656485892126327792997296125 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46540776888706005160357234588337945746800 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2078747584113896458518655566046791734400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((20600105216492764125 : Rat) / 22174606515653643488) [(11, 1), (13, 1), (16, 1)],
  term ((1379209227143377468802494880487966710693400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1450929662392911490851489138280941264578400 : Rat) / 84353800925664757687870414129491527348999) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((936777618601020447135486195021595833600 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-986081703790547839089985468443785088000 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 3), (15, 4), (16, 1)],
  term ((-2084492249760910500 : Rat) / 692956453614176359) [(11, 1), (13, 3), (16, 1)],
  term ((-172564298163345871840747456977662390400 : Rat) / 2908751756057405437512772901016949218931) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-95719610994867929631247261237585316802375 : Rat) / 1349660814810636123005926626071864437583984) [(11, 1), (15, 1), (16, 1)],
  term ((7303545811913992061836821224942809366875 : Rat) / 337415203702659030751481656517966109395996) [(11, 1), (15, 3), (16, 1)],
  term ((-14687565315436229066002556555156394125306301 : Rat) / 2699321629621272246011853252143728875167968) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-453969441684154202025618411340545201600 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((13007384477683589934007137312626720764800 : Rat) / 84353800925664757687870414129491527348999) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-139184747485977174250526105052640909743879 : Rat) / 1349660814810636123005926626071864437583984) [(12, 1), (15, 2), (16, 1)],
  term ((7137589495722855063 : Rat) / 22174606515653643488) [(12, 1), (16, 1)],
  term ((1441080477240912460733177512653407747775669 : Rat) / 1349660814810636123005926626071864437583984) [(13, 1), (15, 1), (16, 1)],
  term ((2680447728385770923268828100176652507720113 : Rat) / 674830407405318061502963313035932218791992) [(13, 1), (15, 3), (16, 1)],
  term ((9854407778128238582596808919614155802400 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 2), (16, 1)],
  term ((-17339557632193536845345168869606444588800 : Rat) / 84353800925664757687870414129491527348999) [(13, 2), (15, 4), (16, 1)],
  term ((92709074334554646045 : Rat) / 44349213031307286976) [(13, 2), (16, 1)],
  term ((-3124573922771256080760849569896534872000 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)],
  term ((-2361711969064843028417850048259231814760363 : Rat) / 2699321629621272246011853252143728875167968) [(15, 2), (16, 1)],
  term ((10098114343970138494541993239751939288400 : Rat) / 84353800925664757687870414129491527348999) [(15, 4), (16, 1)],
  term ((54940016052332941741 : Rat) / 88698426062614573952) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 1000 through 1032. -/
theorem ep_Q2_008_block_09_1000_1032_valid :
    checkProductSumEq ep_Q2_008_partials_09_1000_1032
      ep_Q2_008_block_09_1000_1032 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
