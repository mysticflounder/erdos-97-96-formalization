/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 21:1000-1099

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_21_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1000 : Poly :=
[
  term ((-132308858369529581179687611658342048000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (14, 1), (15, 3)]
]

/-- Partial product 1000 for generator 21. -/
def ep_Q1_009_partial_21_1000 : Poly :=
[
  term ((-264617716739059162359375223316684096000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((132308858369529581179687611658342048000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 21. -/
theorem ep_Q1_009_partial_21_1000_valid :
    mulPoly ep_Q1_009_coefficient_21_1000
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1001 : Poly :=
[
  term ((-42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 157700452782653445610009280444982429841791397224752982111585105094233455640531023303281541168002102863272087864832) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 1001 for generator 21. -/
def ep_Q1_009_partial_21_1001 : Poly :=
[
  term ((-42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 78850226391326722805004640222491214920895698612376491055792552547116727820265511651640770584001051431636043932416) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 157700452782653445610009280444982429841791397224752982111585105094233455640531023303281541168002102863272087864832) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 21. -/
theorem ep_Q1_009_partial_21_1001_valid :
    mulPoly ep_Q1_009_coefficient_21_1001
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1002 : Poly :=
[
  term ((61103142491713615566 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1002 for generator 21. -/
def ep_Q1_009_partial_21_1002 : Poly :=
[
  term ((122206284983427231132 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-61103142491713615566 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 21. -/
theorem ep_Q1_009_partial_21_1002_valid :
    mulPoly ep_Q1_009_coefficient_21_1002
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1003 : Poly :=
[
  term ((8591484309709713063616078679113120000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (15, 3)]
]

/-- Partial product 1003 for generator 21. -/
def ep_Q1_009_partial_21_1003 : Poly :=
[
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (15, 3)],
  term ((-8591484309709713063616078679113120000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 21. -/
theorem ep_Q1_009_partial_21_1003_valid :
    mulPoly ep_Q1_009_coefficient_21_1003
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1004 : Poly :=
[
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(7, 2), (10, 1)]
]

/-- Partial product 1004 for generator 21. -/
def ep_Q1_009_partial_21_1004 : Poly :=
[
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(7, 2), (10, 1)],
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(7, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 21. -/
theorem ep_Q1_009_partial_21_1004_valid :
    mulPoly ep_Q1_009_coefficient_21_1004
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1005 : Poly :=
[
  term ((50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 5121160332465474620652358901435099016949742832792268761612415784419665299185328118666043803857664) [(7, 2), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1005 for generator 21. -/
def ep_Q1_009_partial_21_1005 : Poly :=
[
  term ((-50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 5121160332465474620652358901435099016949742832792268761612415784419665299185328118666043803857664) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 21. -/
theorem ep_Q1_009_partial_21_1005_valid :
    mulPoly ep_Q1_009_coefficient_21_1005
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1006 : Poly :=
[
  term ((10619555 : Rat) / 7072986) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1006 for generator 21. -/
def ep_Q1_009_partial_21_1006 : Poly :=
[
  term ((-10619555 : Rat) / 7072986) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((10619555 : Rat) / 3536493) [(7, 2), (10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 21. -/
theorem ep_Q1_009_partial_21_1006_valid :
    mulPoly ep_Q1_009_coefficient_21_1006
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1007 : Poly :=
[
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1007 for generator 21. -/
def ep_Q1_009_partial_21_1007 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (10, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 21. -/
theorem ep_Q1_009_partial_21_1007_valid :
    mulPoly ep_Q1_009_coefficient_21_1007
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1008 : Poly :=
[
  term ((5740300 : Rat) / 3536493) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1008 for generator 21. -/
def ep_Q1_009_partial_21_1008 : Poly :=
[
  term ((-5740300 : Rat) / 3536493) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11480600 : Rat) / 3536493) [(7, 2), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 21. -/
theorem ep_Q1_009_partial_21_1008_valid :
    mulPoly ep_Q1_009_coefficient_21_1008
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1009 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1009 for generator 21. -/
def ep_Q1_009_partial_21_1009 : Poly :=
[
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 21. -/
theorem ep_Q1_009_partial_21_1009_valid :
    mulPoly ep_Q1_009_coefficient_21_1009
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1010 : Poly :=
[
  term ((-5740300 : Rat) / 3536493) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1010 for generator 21. -/
def ep_Q1_009_partial_21_1010 : Poly :=
[
  term ((5740300 : Rat) / 3536493) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11480600 : Rat) / 3536493) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 21. -/
theorem ep_Q1_009_partial_21_1010_valid :
    mulPoly ep_Q1_009_coefficient_21_1010
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1011 : Poly :=
[
  term ((555056043834682909088384312456969501325001284072576403776195553689449585681364676141878329251583931041636241487 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 2), (10, 1), (15, 2)]
]

/-- Partial product 1011 for generator 21. -/
def ep_Q1_009_partial_21_1011 : Poly :=
[
  term ((-555056043834682909088384312456969501325001284072576403776195553689449585681364676141878329251583931041636241487 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 2), (10, 1), (15, 2)],
  term ((555056043834682909088384312456969501325001284072576403776195553689449585681364676141878329251583931041636241487 : Rat) / 52537342103943781366599003922815049037657724716157665768789620697517729802615492010902727986365276206188838112) [(7, 2), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 21. -/
theorem ep_Q1_009_partial_21_1011_valid :
    mulPoly ep_Q1_009_coefficient_21_1011
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1012 : Poly :=
[
  term ((241824701481919774306 : Rat) / 290243508153948313977) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1012 for generator 21. -/
def ep_Q1_009_partial_21_1012 : Poly :=
[
  term ((-241824701481919774306 : Rat) / 290243508153948313977) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((483649402963839548612 : Rat) / 290243508153948313977) [(7, 2), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 21. -/
theorem ep_Q1_009_partial_21_1012_valid :
    mulPoly ep_Q1_009_coefficient_21_1012
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1013 : Poly :=
[
  term ((-746239 : Rat) / 24755451) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 1013 for generator 21. -/
def ep_Q1_009_partial_21_1013 : Poly :=
[
  term ((746239 : Rat) / 24755451) [(7, 2), (10, 1), (16, 1)],
  term ((-1492478 : Rat) / 24755451) [(7, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 21. -/
theorem ep_Q1_009_partial_21_1013_valid :
    mulPoly ep_Q1_009_coefficient_21_1013
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1014 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 121932388868225586206008545272264262308327210304577827657438471057611078552031621873001042948992) [(7, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1014 for generator 21. -/
def ep_Q1_009_partial_21_1014 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 60966194434112793103004272636132131154163605152288913828719235528805539276015810936500521474496) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 121932388868225586206008545272264262308327210304577827657438471057611078552031621873001042948992) [(7, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 21. -/
theorem ep_Q1_009_partial_21_1014_valid :
    mulPoly ep_Q1_009_coefficient_21_1014
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1015 : Poly :=
[
  term ((2009105 : Rat) / 1178831) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1015 for generator 21. -/
def ep_Q1_009_partial_21_1015 : Poly :=
[
  term ((4018210 : Rat) / 1178831) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2009105 : Rat) / 1178831) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 21. -/
theorem ep_Q1_009_partial_21_1015_valid :
    mulPoly ep_Q1_009_coefficient_21_1015
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1016 : Poly :=
[
  term ((50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 10242320664930949241304717802870198033899485665584537523224831568839330598370656237332087607715328) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 1016 for generator 21. -/
def ep_Q1_009_partial_21_1016 : Poly :=
[
  term ((50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 5121160332465474620652358901435099016949742832792268761612415784419665299185328118666043803857664) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 10242320664930949241304717802870198033899485665584537523224831568839330598370656237332087607715328) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 21. -/
theorem ep_Q1_009_partial_21_1016_valid :
    mulPoly ep_Q1_009_coefficient_21_1016
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1017 : Poly :=
[
  term ((10619555 : Rat) / 14145972) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1017 for generator 21. -/
def ep_Q1_009_partial_21_1017 : Poly :=
[
  term ((10619555 : Rat) / 7072986) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10619555 : Rat) / 14145972) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 21. -/
theorem ep_Q1_009_partial_21_1017_valid :
    mulPoly ep_Q1_009_coefficient_21_1017
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1018 : Poly :=
[
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(7, 2), (12, 1)]
]

/-- Partial product 1018 for generator 21. -/
def ep_Q1_009_partial_21_1018 : Poly :=
[
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 379747058551465279073797799894551833883985167685867386983971509437898909897217127443456637997920) [(7, 2), (10, 1), (12, 1)],
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 21. -/
theorem ep_Q1_009_partial_21_1018_valid :
    mulPoly ep_Q1_009_coefficient_21_1018
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1019 : Poly :=
[
  term ((148957162083674758382439288244834021513862898223039 : Rat) / 3959332705966984439490434124004954502435585901212186) [(7, 2), (12, 1), (15, 2)]
]

/-- Partial product 1019 for generator 21. -/
def ep_Q1_009_partial_21_1019 : Poly :=
[
  term ((148957162083674758382439288244834021513862898223039 : Rat) / 1979666352983492219745217062002477251217792950606093) [(7, 2), (10, 1), (12, 1), (15, 2)],
  term ((-148957162083674758382439288244834021513862898223039 : Rat) / 3959332705966984439490434124004954502435585901212186) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 21. -/
theorem ep_Q1_009_partial_21_1019_valid :
    mulPoly ep_Q1_009_coefficient_21_1019
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1020 : Poly :=
[
  term ((-60266866769928 : Rat) / 1395206957462413) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1020 for generator 21. -/
def ep_Q1_009_partial_21_1020 : Poly :=
[
  term ((-120533733539856 : Rat) / 1395206957462413) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((60266866769928 : Rat) / 1395206957462413) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 21. -/
theorem ep_Q1_009_partial_21_1020_valid :
    mulPoly ep_Q1_009_coefficient_21_1020
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1021 : Poly :=
[
  term ((1492478 : Rat) / 24755451) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 1021 for generator 21. -/
def ep_Q1_009_partial_21_1021 : Poly :=
[
  term ((2984956 : Rat) / 24755451) [(7, 2), (10, 1), (12, 1), (16, 1)],
  term ((-1492478 : Rat) / 24755451) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 21. -/
theorem ep_Q1_009_partial_21_1021_valid :
    mulPoly ep_Q1_009_coefficient_21_1021
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1022 : Poly :=
[
  term ((47427984395296091307058317208362067550726884951672983255711513821303410371558948302251449180711245 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1022 for generator 21. -/
def ep_Q1_009_partial_21_1022 : Poly :=
[
  term ((47427984395296091307058317208362067550726884951672983255711513821303410371558948302251449180711245 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-47427984395296091307058317208362067550726884951672983255711513821303410371558948302251449180711245 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 21. -/
theorem ep_Q1_009_partial_21_1022_valid :
    mulPoly ep_Q1_009_coefficient_21_1022
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1023 : Poly :=
[
  term ((10045525 : Rat) / 3536493) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1023 for generator 21. -/
def ep_Q1_009_partial_21_1023 : Poly :=
[
  term ((20091050 : Rat) / 3536493) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10045525 : Rat) / 3536493) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 21. -/
theorem ep_Q1_009_partial_21_1023_valid :
    mulPoly ep_Q1_009_coefficient_21_1023
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1024 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1024 for generator 21. -/
def ep_Q1_009_partial_21_1024 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(7, 2), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 21. -/
theorem ep_Q1_009_partial_21_1024_valid :
    mulPoly ep_Q1_009_coefficient_21_1024
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1025 : Poly :=
[
  term ((-11480600 : Rat) / 3536493) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1025 for generator 21. -/
def ep_Q1_009_partial_21_1025 : Poly :=
[
  term ((-22961200 : Rat) / 3536493) [(7, 2), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11480600 : Rat) / 3536493) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 21. -/
theorem ep_Q1_009_partial_21_1025_valid :
    mulPoly ep_Q1_009_coefficient_21_1025
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1026 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 1026 for generator 21. -/
def ep_Q1_009_partial_21_1026 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 21. -/
theorem ep_Q1_009_partial_21_1026_valid :
    mulPoly ep_Q1_009_coefficient_21_1026
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1027 : Poly :=
[
  term ((-2870150 : Rat) / 3536493) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1027 for generator 21. -/
def ep_Q1_009_partial_21_1027 : Poly :=
[
  term ((-5740300 : Rat) / 3536493) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2870150 : Rat) / 3536493) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 21. -/
theorem ep_Q1_009_partial_21_1027_valid :
    mulPoly ep_Q1_009_coefficient_21_1027
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1028 : Poly :=
[
  term ((-233599281340472612708747342266468915686335573603767941599351819268997126823520852503799832292541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(7, 2), (14, 1)]
]

/-- Partial product 1028 for generator 21. -/
def ep_Q1_009_partial_21_1028 : Poly :=
[
  term ((-233599281340472612708747342266468915686335573603767941599351819268997126823520852503799832292541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(7, 2), (10, 1), (14, 1)],
  term ((233599281340472612708747342266468915686335573603767941599351819268997126823520852503799832292541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 21. -/
theorem ep_Q1_009_partial_21_1028_valid :
    mulPoly ep_Q1_009_coefficient_21_1028
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1029 : Poly :=
[
  term ((-8547277264960853555937066059690344733695186722956879969509880605700825456600988418364795428009047381437594496623 : Rat) / 70049789471925041822132005230420065383543632954876887691719494263356973070153989347870303981820368274918450816) [(7, 2), (14, 1), (15, 2)]
]

/-- Partial product 1029 for generator 21. -/
def ep_Q1_009_partial_21_1029 : Poly :=
[
  term ((-8547277264960853555937066059690344733695186722956879969509880605700825456600988418364795428009047381437594496623 : Rat) / 35024894735962520911066002615210032691771816477438443845859747131678486535076994673935151990910184137459225408) [(7, 2), (10, 1), (14, 1), (15, 2)],
  term ((8547277264960853555937066059690344733695186722956879969509880605700825456600988418364795428009047381437594496623 : Rat) / 70049789471925041822132005230420065383543632954876887691719494263356973070153989347870303981820368274918450816) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 21. -/
theorem ep_Q1_009_partial_21_1029_valid :
    mulPoly ep_Q1_009_coefficient_21_1029
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1030 : Poly :=
[
  term ((-1863086521548918911634 : Rat) / 96747836051316104659) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1030 for generator 21. -/
def ep_Q1_009_partial_21_1030 : Poly :=
[
  term ((-3726173043097837823268 : Rat) / 96747836051316104659) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1863086521548918911634 : Rat) / 96747836051316104659) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 21. -/
theorem ep_Q1_009_partial_21_1030_valid :
    mulPoly ep_Q1_009_coefficient_21_1030
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1031 : Poly :=
[
  term ((-1179091783 : Rat) / 99021804) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 1031 for generator 21. -/
def ep_Q1_009_partial_21_1031 : Poly :=
[
  term ((-1179091783 : Rat) / 49510902) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((1179091783 : Rat) / 99021804) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 21. -/
theorem ep_Q1_009_partial_21_1031_valid :
    mulPoly ep_Q1_009_coefficient_21_1031
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1032 : Poly :=
[
  term ((-16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 2), (14, 2)]
]

/-- Partial product 1032 for generator 21. -/
def ep_Q1_009_partial_21_1032 : Poly :=
[
  term ((-33678783694041290823715891686000221497991304292471905070916623736187500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 2), (10, 1), (14, 2)],
  term ((16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 21. -/
theorem ep_Q1_009_partial_21_1032_valid :
    mulPoly ep_Q1_009_coefficient_21_1032
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1033 : Poly :=
[
  term ((555056043834682909088384312456969501325001284072576403776195553689449585681364676141878329251583931041636241487 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 2), (15, 2)]
]

/-- Partial product 1033 for generator 21. -/
def ep_Q1_009_partial_21_1033 : Poly :=
[
  term ((555056043834682909088384312456969501325001284072576403776195553689449585681364676141878329251583931041636241487 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 2), (10, 1), (15, 2)],
  term ((-555056043834682909088384312456969501325001284072576403776195553689449585681364676141878329251583931041636241487 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 21. -/
theorem ep_Q1_009_partial_21_1033_valid :
    mulPoly ep_Q1_009_coefficient_21_1033
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1034 : Poly :=
[
  term ((120912350740959887153 : Rat) / 290243508153948313977) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 1034 for generator 21. -/
def ep_Q1_009_partial_21_1034 : Poly :=
[
  term ((241824701481919774306 : Rat) / 290243508153948313977) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-120912350740959887153 : Rat) / 290243508153948313977) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 21. -/
theorem ep_Q1_009_partial_21_1034_valid :
    mulPoly ep_Q1_009_coefficient_21_1034
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1035 : Poly :=
[
  term ((-746239 : Rat) / 49510902) [(7, 2), (16, 1)]
]

/-- Partial product 1035 for generator 21. -/
def ep_Q1_009_partial_21_1035 : Poly :=
[
  term ((-746239 : Rat) / 24755451) [(7, 2), (10, 1), (16, 1)],
  term ((746239 : Rat) / 49510902) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 21. -/
theorem ep_Q1_009_partial_21_1035_valid :
    mulPoly ep_Q1_009_coefficient_21_1035
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1036 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 3), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1036 for generator 21. -/
def ep_Q1_009_partial_21_1036 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(7, 3), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 3), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 21. -/
theorem ep_Q1_009_partial_21_1036_valid :
    mulPoly ep_Q1_009_coefficient_21_1036
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1037 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(7, 3), (9, 1), (14, 1)]
]

/-- Partial product 1037 for generator 21. -/
def ep_Q1_009_partial_21_1037 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(7, 3), (9, 1), (10, 1), (14, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(7, 3), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 21. -/
theorem ep_Q1_009_partial_21_1037_valid :
    mulPoly ep_Q1_009_coefficient_21_1037
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1038 : Poly :=
[
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(7, 3), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1038 for generator 21. -/
def ep_Q1_009_partial_21_1038 : Poly :=
[
  term ((-13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(7, 3), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(7, 3), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 21. -/
theorem ep_Q1_009_partial_21_1038_valid :
    mulPoly ep_Q1_009_coefficient_21_1038
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1039 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(7, 3), (14, 1), (15, 1)]
]

/-- Partial product 1039 for generator 21. -/
def ep_Q1_009_partial_21_1039 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(7, 3), (10, 1), (14, 1), (15, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(7, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 21. -/
theorem ep_Q1_009_partial_21_1039_valid :
    mulPoly ep_Q1_009_coefficient_21_1039
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1040 : Poly :=
[
  term ((-1148060 : Rat) / 1178831) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1040 for generator 21. -/
def ep_Q1_009_partial_21_1040 : Poly :=
[
  term ((-2296120 : Rat) / 1178831) [(7, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1148060 : Rat) / 1178831) [(7, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 21. -/
theorem ep_Q1_009_partial_21_1040_valid :
    mulPoly ep_Q1_009_coefficient_21_1040
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1041 : Poly :=
[
  term ((3967116038874217265825855470559603053966023145830438485152766056976055409740246906756190072345811 : Rat) / 999043913851664840957991880474446561031689479392549079255127725652655695876751078911964031041536) [(8, 1)]
]

/-- Partial product 1041 for generator 21. -/
def ep_Q1_009_partial_21_1041 : Poly :=
[
  term ((-3967116038874217265825855470559603053966023145830438485152766056976055409740246906756190072345811 : Rat) / 999043913851664840957991880474446561031689479392549079255127725652655695876751078911964031041536) [(8, 1)],
  term ((3967116038874217265825855470559603053966023145830438485152766056976055409740246906756190072345811 : Rat) / 499521956925832420478995940237223280515844739696274539627563862826327847938375539455982015520768) [(8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 21. -/
theorem ep_Q1_009_partial_21_1041_valid :
    mulPoly ep_Q1_009_coefficient_21_1041
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1042 : Poly :=
[
  term ((-2233785920524525396540180456569411200 : Rat) / 2144116865330816633312319087537095051139) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1042 for generator 21. -/
def ep_Q1_009_partial_21_1042 : Poly :=
[
  term ((-4467571841049050793080360913138822400 : Rat) / 2144116865330816633312319087537095051139) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2233785920524525396540180456569411200 : Rat) / 2144116865330816633312319087537095051139) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 21. -/
theorem ep_Q1_009_partial_21_1042_valid :
    mulPoly ep_Q1_009_coefficient_21_1042
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1043 : Poly :=
[
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 166507318975277473492998646745741093505281579898758179875854620942109282646125179818660671840256) [(8, 1), (10, 1)]
]

/-- Partial product 1043 for generator 21. -/
def ep_Q1_009_partial_21_1043 : Poly :=
[
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 166507318975277473492998646745741093505281579898758179875854620942109282646125179818660671840256) [(8, 1), (10, 1)],
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 21. -/
theorem ep_Q1_009_partial_21_1043_valid :
    mulPoly ep_Q1_009_coefficient_21_1043
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1044 : Poly :=
[
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1044 for generator 21. -/
def ep_Q1_009_partial_21_1044 : Poly :=
[
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(8, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 21. -/
theorem ep_Q1_009_partial_21_1044_valid :
    mulPoly ep_Q1_009_coefficient_21_1044
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1045 : Poly :=
[
  term ((92177088238486828529237386602358 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (11, 1), (15, 3)]
]

/-- Partial product 1045 for generator 21. -/
def ep_Q1_009_partial_21_1045 : Poly :=
[
  term ((-92177088238486828529237386602358 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (11, 1), (15, 3)],
  term ((184354176476973657058474773204716 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 21. -/
theorem ep_Q1_009_partial_21_1045_valid :
    mulPoly ep_Q1_009_coefficient_21_1045
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1046 : Poly :=
[
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (10, 1), (12, 1)]
]

/-- Partial product 1046 for generator 21. -/
def ep_Q1_009_partial_21_1046 : Poly :=
[
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (10, 1), (12, 1)],
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(8, 1), (10, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 21. -/
theorem ep_Q1_009_partial_21_1046_valid :
    mulPoly ep_Q1_009_coefficient_21_1046
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1047 : Poly :=
[
  term ((-72712617912013130197815550853738920675185333953881566930575608494282513159465310240688920145 : Rat) / 131176984486825740672005236406833844673278555592509070280347653053132313009027189983188554496) [(8, 1), (10, 1), (12, 1), (15, 2)]
]

/-- Partial product 1047 for generator 21. -/
def ep_Q1_009_partial_21_1047 : Poly :=
[
  term ((72712617912013130197815550853738920675185333953881566930575608494282513159465310240688920145 : Rat) / 131176984486825740672005236406833844673278555592509070280347653053132313009027189983188554496) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-72712617912013130197815550853738920675185333953881566930575608494282513159465310240688920145 : Rat) / 65588492243412870336002618203416922336639277796254535140173826526566156504513594991594277248) [(8, 1), (10, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 21. -/
theorem ep_Q1_009_partial_21_1047_valid :
    mulPoly ep_Q1_009_coefficient_21_1047
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1048 : Poly :=
[
  term ((-166728741461598183206380508500638238498411061311340497311594597554320334 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1048 for generator 21. -/
def ep_Q1_009_partial_21_1048 : Poly :=
[
  term ((166728741461598183206380508500638238498411061311340497311594597554320334 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-333457482923196366412761017001276476996822122622680994623189195108640668 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 21. -/
theorem ep_Q1_009_partial_21_1048_valid :
    mulPoly ep_Q1_009_coefficient_21_1048
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1049 : Poly :=
[
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1049 for generator 21. -/
def ep_Q1_009_partial_21_1049 : Poly :=
[
  term ((-81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 21. -/
theorem ep_Q1_009_partial_21_1049_valid :
    mulPoly ep_Q1_009_coefficient_21_1049
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1050 : Poly :=
[
  term ((-87995855923220277810228748565735304280033941209150426915346564733399126501559921400146378835919 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 1050 for generator 21. -/
def ep_Q1_009_partial_21_1050 : Poly :=
[
  term ((87995855923220277810228748565735304280033941209150426915346564733399126501559921400146378835919 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-87995855923220277810228748565735304280033941209150426915346564733399126501559921400146378835919 : Rat) / 2601676858988710523328103855402204586020024685918096560560228452220457541345705934666572997504) [(8, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 21. -/
theorem ep_Q1_009_partial_21_1050_valid :
    mulPoly ep_Q1_009_coefficient_21_1050
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1051 : Poly :=
[
  term ((-74030180828191428306080913708696 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (13, 1), (15, 3)]
]

/-- Partial product 1051 for generator 21. -/
def ep_Q1_009_partial_21_1051 : Poly :=
[
  term ((74030180828191428306080913708696 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-148060361656382856612161827417392 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 21. -/
theorem ep_Q1_009_partial_21_1051_valid :
    mulPoly ep_Q1_009_coefficient_21_1051
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1052 : Poly :=
[
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (10, 1), (13, 2)]
]

/-- Partial product 1052 for generator 21. -/
def ep_Q1_009_partial_21_1052 : Poly :=
[
  term ((103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (10, 1), (13, 2)],
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (10, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 21. -/
theorem ep_Q1_009_partial_21_1052_valid :
    mulPoly ep_Q1_009_coefficient_21_1052
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1053 : Poly :=
[
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 166507318975277473492998646745741093505281579898758179875854620942109282646125179818660671840256) [(8, 1), (10, 1), (14, 1)]
]

/-- Partial product 1053 for generator 21. -/
def ep_Q1_009_partial_21_1053 : Poly :=
[
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 166507318975277473492998646745741093505281579898758179875854620942109282646125179818660671840256) [(8, 1), (10, 1), (14, 1)],
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 21. -/
theorem ep_Q1_009_partial_21_1053_valid :
    mulPoly ep_Q1_009_coefficient_21_1053
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1054 : Poly :=
[
  term ((-12357407712571389471379257638081976173443256461343071645050028571747960134895521844067672634217 : Rat) / 424763568814483350747445527412604830370616275251934132336363828933952251648278519945562938368) [(8, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 1054 for generator 21. -/
def ep_Q1_009_partial_21_1054 : Poly :=
[
  term ((12357407712571389471379257638081976173443256461343071645050028571747960134895521844067672634217 : Rat) / 424763568814483350747445527412604830370616275251934132336363828933952251648278519945562938368) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-12357407712571389471379257638081976173443256461343071645050028571747960134895521844067672634217 : Rat) / 212381784407241675373722763706302415185308137625967066168181914466976125824139259972781469184) [(8, 1), (10, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 21. -/
theorem ep_Q1_009_partial_21_1054_valid :
    mulPoly ep_Q1_009_coefficient_21_1054
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1055 : Poly :=
[
  term ((1450009580106890032585259128923556 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (14, 2), (15, 2)]
]

/-- Partial product 1055 for generator 21. -/
def ep_Q1_009_partial_21_1055 : Poly :=
[
  term ((-1450009580106890032585259128923556 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((2900019160213780065170518257847112 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 21. -/
theorem ep_Q1_009_partial_21_1055_valid :
    mulPoly ep_Q1_009_coefficient_21_1055
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1056 : Poly :=
[
  term ((-4563507464975397969179375630785911055933631380652961742213464131180547822055817905380031461407405 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 1056 for generator 21. -/
def ep_Q1_009_partial_21_1056 : Poly :=
[
  term ((4563507464975397969179375630785911055933631380652961742213464131180547822055817905380031461407405 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(8, 1), (10, 1), (15, 2)],
  term ((-4563507464975397969179375630785911055933631380652961742213464131180547822055817905380031461407405 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 21. -/
theorem ep_Q1_009_partial_21_1056_valid :
    mulPoly ep_Q1_009_coefficient_21_1056
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1057 : Poly :=
[
  term ((3623483223845010107874864986242400 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (15, 4)]
]

/-- Partial product 1057 for generator 21. -/
def ep_Q1_009_partial_21_1057 : Poly :=
[
  term ((-3623483223845010107874864986242400 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (15, 4)],
  term ((7246966447690020215749729972484800 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 21. -/
theorem ep_Q1_009_partial_21_1057_valid :
    mulPoly ep_Q1_009_coefficient_21_1057
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1058 : Poly :=
[
  term ((103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1058 for generator 21. -/
def ep_Q1_009_partial_21_1058 : Poly :=
[
  term ((103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 21. -/
theorem ep_Q1_009_partial_21_1058_valid :
    mulPoly ep_Q1_009_coefficient_21_1058
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1059 : Poly :=
[
  term ((63415609085614190411530546623591959526936478441141771041768558198621829373677808563047305809 : Rat) / 131176984486825740672005236406833844673278555592509070280347653053132313009027189983188554496) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1059 for generator 21. -/
def ep_Q1_009_partial_21_1059 : Poly :=
[
  term ((63415609085614190411530546623591959526936478441141771041768558198621829373677808563047305809 : Rat) / 65588492243412870336002618203416922336639277796254535140173826526566156504513594991594277248) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-63415609085614190411530546623591959526936478441141771041768558198621829373677808563047305809 : Rat) / 131176984486825740672005236406833844673278555592509070280347653053132313009027189983188554496) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 21. -/
theorem ep_Q1_009_partial_21_1059_valid :
    mulPoly ep_Q1_009_coefficient_21_1059
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1060 : Poly :=
[
  term ((67616001749292260496390079351445541801853648819382098766812076359195506274863980353516442211341 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1060 for generator 21. -/
def ep_Q1_009_partial_21_1060 : Poly :=
[
  term ((67616001749292260496390079351445541801853648819382098766812076359195506274863980353516442211341 : Rat) / 1951257644241532892496077891551653439515018514438572420420171339165343156009279450999929748128) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-67616001749292260496390079351445541801853648819382098766812076359195506274863980353516442211341 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 21. -/
theorem ep_Q1_009_partial_21_1060_valid :
    mulPoly ep_Q1_009_coefficient_21_1060
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1061 : Poly :=
[
  term ((-55721559984444502417027551661440 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 1061 for generator 21. -/
def ep_Q1_009_partial_21_1061 : Poly :=
[
  term ((-111443119968889004834055103322880 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((55721559984444502417027551661440 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 21. -/
theorem ep_Q1_009_partial_21_1061_valid :
    mulPoly ep_Q1_009_coefficient_21_1061
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1062 : Poly :=
[
  term ((-1064596861614822288039703696698382321796738588036236232671819000514718230 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1062 for generator 21. -/
def ep_Q1_009_partial_21_1062 : Poly :=
[
  term ((-2129193723229644576079407393396764643593477176072472465343638001029436460 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((1064596861614822288039703696698382321796738588036236232671819000514718230 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 21. -/
theorem ep_Q1_009_partial_21_1062_valid :
    mulPoly ep_Q1_009_coefficient_21_1062
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1063 : Poly :=
[
  term ((-4595188356113587345373495122197732359401191129314635005255519446651728041431244705949015487687 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1063 for generator 21. -/
def ep_Q1_009_partial_21_1063 : Poly :=
[
  term ((-4595188356113587345373495122197732359401191129314635005255519446651728041431244705949015487687 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((4595188356113587345373495122197732359401191129314635005255519446651728041431244705949015487687 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 21. -/
theorem ep_Q1_009_partial_21_1063_valid :
    mulPoly ep_Q1_009_coefficient_21_1063
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1064 : Poly :=
[
  term ((129751740812635930723108465370136 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1064 for generator 21. -/
def ep_Q1_009_partial_21_1064 : Poly :=
[
  term ((259503481625271861446216930740272 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-129751740812635930723108465370136 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 21. -/
theorem ep_Q1_009_partial_21_1064_valid :
    mulPoly ep_Q1_009_coefficient_21_1064
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1065 : Poly :=
[
  term ((88462782965631509855892718431241328600051480257045241572834875762416640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (11, 1), (13, 1), (14, 2)]
]

/-- Partial product 1065 for generator 21. -/
def ep_Q1_009_partial_21_1065 : Poly :=
[
  term ((176925565931263019711785436862482657200102960514090483145669751524833280 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-88462782965631509855892718431241328600051480257045241572834875762416640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 21. -/
theorem ep_Q1_009_partial_21_1065_valid :
    mulPoly ep_Q1_009_coefficient_21_1065
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1066 : Poly :=
[
  term ((-81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1066 for generator 21. -/
def ep_Q1_009_partial_21_1066 : Poly :=
[
  term ((-163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 21. -/
theorem ep_Q1_009_partial_21_1066_valid :
    mulPoly ep_Q1_009_coefficient_21_1066
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1067 : Poly :=
[
  term ((4559346876948017926225304939670171695281212116964622422938385011820771694169298973022069071909549 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1067 for generator 21. -/
def ep_Q1_009_partial_21_1067 : Poly :=
[
  term ((4559346876948017926225304939670171695281212116964622422938385011820771694169298973022069071909549 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4559346876948017926225304939670171695281212116964622422938385011820771694169298973022069071909549 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 21. -/
theorem ep_Q1_009_partial_21_1067_valid :
    mulPoly ep_Q1_009_coefficient_21_1067
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1068 : Poly :=
[
  term ((-3623483223845010107874864986242400 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 1068 for generator 21. -/
def ep_Q1_009_partial_21_1068 : Poly :=
[
  term ((-7246966447690020215749729972484800 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((3623483223845010107874864986242400 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 21. -/
theorem ep_Q1_009_partial_21_1068_valid :
    mulPoly ep_Q1_009_coefficient_21_1068
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1069 : Poly :=
[
  term ((37070323741014616422955450905657331949881909928526752351644176615212459886992811809269087424059 : Rat) / 1274290706443450052242336582237814491111848825755802397009091486801856754944835559836688815104) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 1069 for generator 21. -/
def ep_Q1_009_partial_21_1069 : Poly :=
[
  term ((37070323741014616422955450905657331949881909928526752351644176615212459886992811809269087424059 : Rat) / 637145353221725026121168291118907245555924412877901198504545743400928377472417779918344407552) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-37070323741014616422955450905657331949881909928526752351644176615212459886992811809269087424059 : Rat) / 1274290706443450052242336582237814491111848825755802397009091486801856754944835559836688815104) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 21. -/
theorem ep_Q1_009_partial_21_1069_valid :
    mulPoly ep_Q1_009_coefficient_21_1069
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1070 : Poly :=
[
  term ((-1450009580106890032585259128923556 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (14, 3), (15, 1)]
]

/-- Partial product 1070 for generator 21. -/
def ep_Q1_009_partial_21_1070 : Poly :=
[
  term ((-2900019160213780065170518257847112 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (11, 1), (14, 3), (15, 1)],
  term ((1450009580106890032585259128923556 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 21. -/
theorem ep_Q1_009_partial_21_1070_valid :
    mulPoly ep_Q1_009_coefficient_21_1070
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1071 : Poly :=
[
  term ((-1419038591552162227259031566973612210344641544346144707457261243788517136589621182306723429350745 : Rat) / 166507318975277473492998646745741093505281579898758179875854620942109282646125179818660671840256) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1071 for generator 21. -/
def ep_Q1_009_partial_21_1071 : Poly :=
[
  term ((-1419038591552162227259031566973612210344641544346144707457261243788517136589621182306723429350745 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1419038591552162227259031566973612210344641544346144707457261243788517136589621182306723429350745 : Rat) / 166507318975277473492998646745741093505281579898758179875854620942109282646125179818660671840256) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 21. -/
theorem ep_Q1_009_partial_21_1071_valid :
    mulPoly ep_Q1_009_coefficient_21_1071
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1072 : Poly :=
[
  term ((46088544119243414264618693301179 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (15, 3)]
]

/-- Partial product 1072 for generator 21. -/
def ep_Q1_009_partial_21_1072 : Poly :=
[
  term ((92177088238486828529237386602358 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (11, 1), (15, 3)],
  term ((-46088544119243414264618693301179 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 21. -/
theorem ep_Q1_009_partial_21_1072_valid :
    mulPoly ep_Q1_009_coefficient_21_1072
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1073 : Poly :=
[
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (11, 2), (14, 1)]
]

/-- Partial product 1073 for generator 21. -/
def ep_Q1_009_partial_21_1073 : Poly :=
[
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 21. -/
theorem ep_Q1_009_partial_21_1073_valid :
    mulPoly ep_Q1_009_coefficient_21_1073
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1074 : Poly :=
[
  term ((-92177088238486828529237386602358 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 1074 for generator 21. -/
def ep_Q1_009_partial_21_1074 : Poly :=
[
  term ((-184354176476973657058474773204716 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((92177088238486828529237386602358 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 21. -/
theorem ep_Q1_009_partial_21_1074_valid :
    mulPoly ep_Q1_009_coefficient_21_1074
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1075 : Poly :=
[
  term ((-444190279169766768470808602748461335386305500244478493940134106784854905786196488848359224891747 : Rat) / 55502439658425824497666215581913697835093859966252726625284873647369760882041726606220223946752) [(8, 1), (12, 1)]
]

/-- Partial product 1075 for generator 21. -/
def ep_Q1_009_partial_21_1075 : Poly :=
[
  term ((-444190279169766768470808602748461335386305500244478493940134106784854905786196488848359224891747 : Rat) / 27751219829212912248833107790956848917546929983126363312642436823684880441020863303110111973376) [(8, 1), (10, 1), (12, 1)],
  term ((444190279169766768470808602748461335386305500244478493940134106784854905786196488848359224891747 : Rat) / 55502439658425824497666215581913697835093859966252726625284873647369760882041726606220223946752) [(8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 21. -/
theorem ep_Q1_009_partial_21_1075_valid :
    mulPoly ep_Q1_009_coefficient_21_1075
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1076 : Poly :=
[
  term ((115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1076 for generator 21. -/
def ep_Q1_009_partial_21_1076 : Poly :=
[
  term ((231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 21. -/
theorem ep_Q1_009_partial_21_1076_valid :
    mulPoly ep_Q1_009_coefficient_21_1076
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1077 : Poly :=
[
  term ((29898409737228894721175583221587683110703630764661249043823352699239691203060119225649226181651 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1077 for generator 21. -/
def ep_Q1_009_partial_21_1077 : Poly :=
[
  term ((29898409737228894721175583221587683110703630764661249043823352699239691203060119225649226181651 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-29898409737228894721175583221587683110703630764661249043823352699239691203060119225649226181651 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 21. -/
theorem ep_Q1_009_partial_21_1077_valid :
    mulPoly ep_Q1_009_coefficient_21_1077
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1078 : Poly :=
[
  term ((61278664621328028430830276469850542062572213524489767112780410295704998731644809454920065524337844704361052547 : Rat) / 2133972097777881548305058108457351496635548859579643942638076800185222547983153756394668071676915005111511040) [(8, 1), (12, 1), (14, 1)]
]

/-- Partial product 1078 for generator 21. -/
def ep_Q1_009_partial_21_1078 : Poly :=
[
  term ((61278664621328028430830276469850542062572213524489767112780410295704998731644809454920065524337844704361052547 : Rat) / 1066986048888940774152529054228675748317774429789821971319038400092611273991576878197334035838457502555755520) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-61278664621328028430830276469850542062572213524489767112780410295704998731644809454920065524337844704361052547 : Rat) / 2133972097777881548305058108457351496635548859579643942638076800185222547983153756394668071676915005111511040) [(8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 21. -/
theorem ep_Q1_009_partial_21_1078_valid :
    mulPoly ep_Q1_009_coefficient_21_1078
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1079 : Poly :=
[
  term ((-1827044378890291190928015200042846 : Rat) / 10306817152083683685026217919314591) [(8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1079 for generator 21. -/
def ep_Q1_009_partial_21_1079 : Poly :=
[
  term ((-3654088757780582381856030400085692 : Rat) / 10306817152083683685026217919314591) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1827044378890291190928015200042846 : Rat) / 10306817152083683685026217919314591) [(8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 21. -/
theorem ep_Q1_009_partial_21_1079_valid :
    mulPoly ep_Q1_009_coefficient_21_1079
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1080 : Poly :=
[
  term ((-746239 : Rat) / 7072986) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1080 for generator 21. -/
def ep_Q1_009_partial_21_1080 : Poly :=
[
  term ((-746239 : Rat) / 3536493) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((746239 : Rat) / 7072986) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 21. -/
theorem ep_Q1_009_partial_21_1080_valid :
    mulPoly ep_Q1_009_coefficient_21_1080
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1081 : Poly :=
[
  term ((227380528012268467172599833382735726637116063370084367275211487133798655553883230569326753593 : Rat) / 2973344981701383455232118691888233812594313926763538926354546802537665761537949639618940568576) [(8, 1), (12, 1), (14, 2)]
]

/-- Partial product 1081 for generator 21. -/
def ep_Q1_009_partial_21_1081 : Poly :=
[
  term ((227380528012268467172599833382735726637116063370084367275211487133798655553883230569326753593 : Rat) / 1486672490850691727616059345944116906297156963381769463177273401268832880768974819809470284288) [(8, 1), (10, 1), (12, 1), (14, 2)],
  term ((-227380528012268467172599833382735726637116063370084367275211487133798655553883230569326753593 : Rat) / 2973344981701383455232118691888233812594313926763538926354546802537665761537949639618940568576) [(8, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 21. -/
theorem ep_Q1_009_partial_21_1081_valid :
    mulPoly ep_Q1_009_coefficient_21_1081
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1082 : Poly :=
[
  term ((594374227318957662064580557578853946374670719083532290576694059074057934740540869145858862867179 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1082 for generator 21. -/
def ep_Q1_009_partial_21_1082 : Poly :=
[
  term ((594374227318957662064580557578853946374670719083532290576694059074057934740540869145858862867179 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-594374227318957662064580557578853946374670719083532290576694059074057934740540869145858862867179 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 21. -/
theorem ep_Q1_009_partial_21_1082_valid :
    mulPoly ep_Q1_009_coefficient_21_1082
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1083 : Poly :=
[
  term ((55721559984444502417027551661440 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 1), (15, 4)]
]

/-- Partial product 1083 for generator 21. -/
def ep_Q1_009_partial_21_1083 : Poly :=
[
  term ((111443119968889004834055103322880 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (12, 1), (15, 4)],
  term ((-55721559984444502417027551661440 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 21. -/
theorem ep_Q1_009_partial_21_1083_valid :
    mulPoly ep_Q1_009_coefficient_21_1083
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1084 : Poly :=
[
  term ((36500460227365292529935692457280145619522166541117537050244870585891382320715802123239473461475 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(8, 1), (12, 2)]
]

/-- Partial product 1084 for generator 21. -/
def ep_Q1_009_partial_21_1084 : Poly :=
[
  term ((36500460227365292529935692457280145619522166541117537050244870585891382320715802123239473461475 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(8, 1), (10, 1), (12, 2)],
  term ((-36500460227365292529935692457280145619522166541117537050244870585891382320715802123239473461475 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(8, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 21. -/
theorem ep_Q1_009_partial_21_1084_valid :
    mulPoly ep_Q1_009_coefficient_21_1084
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1085 : Poly :=
[
  term ((302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(8, 1), (12, 2), (14, 1)]
]

/-- Partial product 1085 for generator 21. -/
def ep_Q1_009_partial_21_1085 : Poly :=
[
  term ((302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(8, 1), (10, 1), (12, 2), (14, 1)],
  term ((-302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(8, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 21. -/
theorem ep_Q1_009_partial_21_1085_valid :
    mulPoly ep_Q1_009_coefficient_21_1085
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1086 : Poly :=
[
  term ((-47894043602915685442455117761832 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1086 for generator 21. -/
def ep_Q1_009_partial_21_1086 : Poly :=
[
  term ((-95788087205831370884910235523664 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((47894043602915685442455117761832 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 21. -/
theorem ep_Q1_009_partial_21_1086_valid :
    mulPoly ep_Q1_009_coefficient_21_1086
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1087 : Poly :=
[
  term ((-77032002650116062550969126006107705049279948331900327278589795113827964263057279519027830211139 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1087 for generator 21. -/
def ep_Q1_009_partial_21_1087 : Poly :=
[
  term ((-77032002650116062550969126006107705049279948331900327278589795113827964263057279519027830211139 : Rat) / 1951257644241532892496077891551653439515018514438572420420171339165343156009279450999929748128) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((77032002650116062550969126006107705049279948331900327278589795113827964263057279519027830211139 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 21. -/
theorem ep_Q1_009_partial_21_1087_valid :
    mulPoly ep_Q1_009_coefficient_21_1087
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1088 : Poly :=
[
  term ((-29585422759168759553401755714576 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1088 for generator 21. -/
def ep_Q1_009_partial_21_1088 : Poly :=
[
  term ((-59170845518337519106803511429152 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((29585422759168759553401755714576 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 21. -/
theorem ep_Q1_009_partial_21_1088_valid :
    mulPoly ep_Q1_009_coefficient_21_1088
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1089 : Poly :=
[
  term ((317417687658931218102957106681216 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1089 for generator 21. -/
def ep_Q1_009_partial_21_1089 : Poly :=
[
  term ((634835375317862436205914213362432 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-317417687658931218102957106681216 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 21. -/
theorem ep_Q1_009_partial_21_1089_valid :
    mulPoly ep_Q1_009_coefficient_21_1089
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1090 : Poly :=
[
  term ((-82270597166086424953424363224702524055804578772527126514660550621405183862508696958031457107919 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1090 for generator 21. -/
def ep_Q1_009_partial_21_1090 : Poly :=
[
  term ((-82270597166086424953424363224702524055804578772527126514660550621405183862508696958031457107919 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((82270597166086424953424363224702524055804578772527126514660550621405183862508696958031457107919 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 21. -/
theorem ep_Q1_009_partial_21_1090_valid :
    mulPoly ep_Q1_009_coefficient_21_1090
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1091 : Poly :=
[
  term ((-37015090414095714153040456854348 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (15, 3)]
]

/-- Partial product 1091 for generator 21. -/
def ep_Q1_009_partial_21_1091 : Poly :=
[
  term ((-74030180828191428306080913708696 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((37015090414095714153040456854348 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 21. -/
theorem ep_Q1_009_partial_21_1091_valid :
    mulPoly ep_Q1_009_coefficient_21_1091
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1092 : Poly :=
[
  term ((-104090160355144188689911656966007445059733530821320928632128874140966310314585109883776677855117 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (13, 2)]
]

/-- Partial product 1092 for generator 21. -/
def ep_Q1_009_partial_21_1092 : Poly :=
[
  term ((-104090160355144188689911656966007445059733530821320928632128874140966310314585109883776677855117 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (10, 1), (13, 2)],
  term ((104090160355144188689911656966007445059733530821320928632128874140966310314585109883776677855117 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 21. -/
theorem ep_Q1_009_partial_21_1092_valid :
    mulPoly ep_Q1_009_coefficient_21_1092
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1093 : Poly :=
[
  term ((35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 637145353221725026121168291118907245555924412877901198504545743400928377472417779918344407552) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 1093 for generator 21. -/
def ep_Q1_009_partial_21_1093 : Poly :=
[
  term ((35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 637145353221725026121168291118907245555924412877901198504545743400928377472417779918344407552) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 21. -/
theorem ep_Q1_009_partial_21_1093_valid :
    mulPoly ep_Q1_009_coefficient_21_1093
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1094 : Poly :=
[
  term ((-1708006641713517482473409784006448303811308367803423698803474228470129001736904664606530662109337 : Rat) / 55502439658425824497666215581913697835093859966252726625284873647369760882041726606220223946752) [(8, 1), (14, 1)]
]

/-- Partial product 1094 for generator 21. -/
def ep_Q1_009_partial_21_1094 : Poly :=
[
  term ((-1708006641713517482473409784006448303811308367803423698803474228470129001736904664606530662109337 : Rat) / 27751219829212912248833107790956848917546929983126363312642436823684880441020863303110111973376) [(8, 1), (10, 1), (14, 1)],
  term ((1708006641713517482473409784006448303811308367803423698803474228470129001736904664606530662109337 : Rat) / 55502439658425824497666215581913697835093859966252726625284873647369760882041726606220223946752) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 21. -/
theorem ep_Q1_009_partial_21_1094_valid :
    mulPoly ep_Q1_009_coefficient_21_1094
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1095 : Poly :=
[
  term ((-2188144789399685423663282398491778602727561524143903342539085770514417913270637633110286576327 : Rat) / 74958276849614708955431563661047911241873460338576611588770087458932750290872679990393459712) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1095 for generator 21. -/
def ep_Q1_009_partial_21_1095 : Poly :=
[
  term ((-2188144789399685423663282398491778602727561524143903342539085770514417913270637633110286576327 : Rat) / 37479138424807354477715781830523955620936730169288305794385043729466375145436339995196729856) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((2188144789399685423663282398491778602727561524143903342539085770514417913270637633110286576327 : Rat) / 74958276849614708955431563661047911241873460338576611588770087458932750290872679990393459712) [(8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 21. -/
theorem ep_Q1_009_partial_21_1095_valid :
    mulPoly ep_Q1_009_coefficient_21_1095
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1096 : Poly :=
[
  term ((517162565197373683397655100879368537145284975918037179625115926304704312121812486147270748783427 : Rat) / 27751219829212912248833107790956848917546929983126363312642436823684880441020863303110111973376) [(8, 1), (14, 2)]
]

/-- Partial product 1096 for generator 21. -/
def ep_Q1_009_partial_21_1096 : Poly :=
[
  term ((517162565197373683397655100879368537145284975918037179625115926304704312121812486147270748783427 : Rat) / 13875609914606456124416553895478424458773464991563181656321218411842440220510431651555055986688) [(8, 1), (10, 1), (14, 2)],
  term ((-517162565197373683397655100879368537145284975918037179625115926304704312121812486147270748783427 : Rat) / 27751219829212912248833107790956848917546929983126363312642436823684880441020863303110111973376) [(8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 21. -/
theorem ep_Q1_009_partial_21_1096_valid :
    mulPoly ep_Q1_009_coefficient_21_1096
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1097 : Poly :=
[
  term ((-16099418967704898418797795367348 : Rat) / 10306817152083683685026217919314591) [(8, 1), (14, 2), (15, 2)]
]

/-- Partial product 1097 for generator 21. -/
def ep_Q1_009_partial_21_1097 : Poly :=
[
  term ((-32198837935409796837595590734696 : Rat) / 10306817152083683685026217919314591) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((16099418967704898418797795367348 : Rat) / 10306817152083683685026217919314591) [(8, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 21. -/
theorem ep_Q1_009_partial_21_1097_valid :
    mulPoly ep_Q1_009_coefficient_21_1097
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1098 : Poly :=
[
  term ((-35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(8, 1), (14, 3)]
]

/-- Partial product 1098 for generator 21. -/
def ep_Q1_009_partial_21_1098 : Poly :=
[
  term ((-35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 159286338305431256530292072779726811388981103219475299626136435850232094368104444979586101888) [(8, 1), (10, 1), (14, 3)],
  term ((35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(8, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 21. -/
theorem ep_Q1_009_partial_21_1098_valid :
    mulPoly ep_Q1_009_coefficient_21_1098
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_1099 : Poly :=
[
  term ((-4567228079399605006491631417359780082901648706328152572968081584086032025216082289492988632443565 : Rat) / 249760978462916210239497970118611640257922369848137269813781931413163923969187769727991007760384) [(8, 1), (15, 2)]
]

/-- Partial product 1099 for generator 21. -/
def ep_Q1_009_partial_21_1099 : Poly :=
[
  term ((-4567228079399605006491631417359780082901648706328152572968081584086032025216082289492988632443565 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(8, 1), (10, 1), (15, 2)],
  term ((4567228079399605006491631417359780082901648706328152572968081584086032025216082289492988632443565 : Rat) / 249760978462916210239497970118611640257922369848137269813781931413163923969187769727991007760384) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 21. -/
theorem ep_Q1_009_partial_21_1099_valid :
    mulPoly ep_Q1_009_coefficient_21_1099
        ep_Q1_009_generator_21_1000_1099 =
      ep_Q1_009_partial_21_1099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_21_1000_1099 : List Poly :=
[
  ep_Q1_009_partial_21_1000,
  ep_Q1_009_partial_21_1001,
  ep_Q1_009_partial_21_1002,
  ep_Q1_009_partial_21_1003,
  ep_Q1_009_partial_21_1004,
  ep_Q1_009_partial_21_1005,
  ep_Q1_009_partial_21_1006,
  ep_Q1_009_partial_21_1007,
  ep_Q1_009_partial_21_1008,
  ep_Q1_009_partial_21_1009,
  ep_Q1_009_partial_21_1010,
  ep_Q1_009_partial_21_1011,
  ep_Q1_009_partial_21_1012,
  ep_Q1_009_partial_21_1013,
  ep_Q1_009_partial_21_1014,
  ep_Q1_009_partial_21_1015,
  ep_Q1_009_partial_21_1016,
  ep_Q1_009_partial_21_1017,
  ep_Q1_009_partial_21_1018,
  ep_Q1_009_partial_21_1019,
  ep_Q1_009_partial_21_1020,
  ep_Q1_009_partial_21_1021,
  ep_Q1_009_partial_21_1022,
  ep_Q1_009_partial_21_1023,
  ep_Q1_009_partial_21_1024,
  ep_Q1_009_partial_21_1025,
  ep_Q1_009_partial_21_1026,
  ep_Q1_009_partial_21_1027,
  ep_Q1_009_partial_21_1028,
  ep_Q1_009_partial_21_1029,
  ep_Q1_009_partial_21_1030,
  ep_Q1_009_partial_21_1031,
  ep_Q1_009_partial_21_1032,
  ep_Q1_009_partial_21_1033,
  ep_Q1_009_partial_21_1034,
  ep_Q1_009_partial_21_1035,
  ep_Q1_009_partial_21_1036,
  ep_Q1_009_partial_21_1037,
  ep_Q1_009_partial_21_1038,
  ep_Q1_009_partial_21_1039,
  ep_Q1_009_partial_21_1040,
  ep_Q1_009_partial_21_1041,
  ep_Q1_009_partial_21_1042,
  ep_Q1_009_partial_21_1043,
  ep_Q1_009_partial_21_1044,
  ep_Q1_009_partial_21_1045,
  ep_Q1_009_partial_21_1046,
  ep_Q1_009_partial_21_1047,
  ep_Q1_009_partial_21_1048,
  ep_Q1_009_partial_21_1049,
  ep_Q1_009_partial_21_1050,
  ep_Q1_009_partial_21_1051,
  ep_Q1_009_partial_21_1052,
  ep_Q1_009_partial_21_1053,
  ep_Q1_009_partial_21_1054,
  ep_Q1_009_partial_21_1055,
  ep_Q1_009_partial_21_1056,
  ep_Q1_009_partial_21_1057,
  ep_Q1_009_partial_21_1058,
  ep_Q1_009_partial_21_1059,
  ep_Q1_009_partial_21_1060,
  ep_Q1_009_partial_21_1061,
  ep_Q1_009_partial_21_1062,
  ep_Q1_009_partial_21_1063,
  ep_Q1_009_partial_21_1064,
  ep_Q1_009_partial_21_1065,
  ep_Q1_009_partial_21_1066,
  ep_Q1_009_partial_21_1067,
  ep_Q1_009_partial_21_1068,
  ep_Q1_009_partial_21_1069,
  ep_Q1_009_partial_21_1070,
  ep_Q1_009_partial_21_1071,
  ep_Q1_009_partial_21_1072,
  ep_Q1_009_partial_21_1073,
  ep_Q1_009_partial_21_1074,
  ep_Q1_009_partial_21_1075,
  ep_Q1_009_partial_21_1076,
  ep_Q1_009_partial_21_1077,
  ep_Q1_009_partial_21_1078,
  ep_Q1_009_partial_21_1079,
  ep_Q1_009_partial_21_1080,
  ep_Q1_009_partial_21_1081,
  ep_Q1_009_partial_21_1082,
  ep_Q1_009_partial_21_1083,
  ep_Q1_009_partial_21_1084,
  ep_Q1_009_partial_21_1085,
  ep_Q1_009_partial_21_1086,
  ep_Q1_009_partial_21_1087,
  ep_Q1_009_partial_21_1088,
  ep_Q1_009_partial_21_1089,
  ep_Q1_009_partial_21_1090,
  ep_Q1_009_partial_21_1091,
  ep_Q1_009_partial_21_1092,
  ep_Q1_009_partial_21_1093,
  ep_Q1_009_partial_21_1094,
  ep_Q1_009_partial_21_1095,
  ep_Q1_009_partial_21_1096,
  ep_Q1_009_partial_21_1097,
  ep_Q1_009_partial_21_1098,
  ep_Q1_009_partial_21_1099
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_21_1000_1099 : Poly :=
[
  term ((-264617716739059162359375223316684096000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 3)],
  term ((-42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 78850226391326722805004640222491214920895698612376491055792552547116727820265511651640770584001051431636043932416) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((122206284983427231132 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (15, 3)],
  term ((132308858369529581179687611658342048000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (14, 1), (15, 3)],
  term ((42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 157700452782653445610009280444982429841791397224752982111585105094233455640531023303281541168002102863272087864832) [(7, 2), (9, 1), (15, 1)],
  term ((-61103142491713615566 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8591484309709713063616078679113120000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (15, 3)],
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(7, 2), (10, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 60966194434112793103004272636132131154163605152288913828719235528805539276015810936500521474496) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((4018210 : Rat) / 1178831) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 379747058551465279073797799894551833883985167685867386983971509437898909897217127443456637997920) [(7, 2), (10, 1), (12, 1)],
  term ((148957162083674758382439288244834021513862898223039 : Rat) / 1979666352983492219745217062002477251217792950606093) [(7, 2), (10, 1), (12, 1), (15, 2)],
  term ((-120533733539856 : Rat) / 1395206957462413) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((2984956 : Rat) / 24755451) [(7, 2), (10, 1), (12, 1), (16, 1)],
  term ((33853576641426072443416584622740120940097751091566405280961496256506215286816391414113699901827895 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((14350750 : Rat) / 3536493) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(7, 2), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-22961200 : Rat) / 3536493) [(7, 2), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-233599281340472612708747342266468915686335573603767941599351819268997126823520852503799832292541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(7, 2), (10, 1), (14, 1)],
  term ((-8547277264960853555937066059690344733695186722956879969509880605700825456600988418364795428009047381437594496623 : Rat) / 35024894735962520911066002615210032691771816477438443845859747131678486535076994673935151990910184137459225408) [(7, 2), (10, 1), (14, 1), (15, 2)],
  term ((-3726173043097837823268 : Rat) / 96747836051316104659) [(7, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1179091783 : Rat) / 49510902) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-33678783694041290823715891686000221497991304292471905070916623736187500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 2), (10, 1), (14, 2)],
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(7, 2), (10, 2)],
  term ((50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (10, 2), (11, 1), (15, 1)],
  term ((10619555 : Rat) / 3536493) [(7, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((11480600 : Rat) / 3536493) [(7, 2), (10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (10, 2), (13, 1), (15, 1)],
  term ((-11480600 : Rat) / 3536493) [(7, 2), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((555056043834682909088384312456969501325001284072576403776195553689449585681364676141878329251583931041636241487 : Rat) / 52537342103943781366599003922815049037657724716157665768789620697517729802615492010902727986365276206188838112) [(7, 2), (10, 2), (15, 2)],
  term ((483649402963839548612 : Rat) / 290243508153948313977) [(7, 2), (10, 2), (15, 2), (16, 1)],
  term ((-1492478 : Rat) / 24755451) [(7, 2), (10, 2), (16, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 121932388868225586206008545272264262308327210304577827657438471057611078552031621873001042948992) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-2009105 : Rat) / 1178831) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 10242320664930949241304717802870198033899485665584537523224831568839330598370656237332087607715328) [(7, 2), (11, 1), (15, 1)],
  term ((-10619555 : Rat) / 14145972) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(7, 2), (12, 1)],
  term ((-148957162083674758382439288244834021513862898223039 : Rat) / 3959332705966984439490434124004954502435585901212186) [(7, 2), (12, 1), (15, 2)],
  term ((60266866769928 : Rat) / 1395206957462413) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1492478 : Rat) / 24755451) [(7, 2), (12, 1), (16, 1)],
  term ((-47427984395296091307058317208362067550726884951672983255711513821303410371558948302251449180711245 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-10045525 : Rat) / 3536493) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((11480600 : Rat) / 3536493) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 2), (13, 1), (15, 1)],
  term ((2870150 : Rat) / 3536493) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((233599281340472612708747342266468915686335573603767941599351819268997126823520852503799832292541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(7, 2), (14, 1)],
  term ((8547277264960853555937066059690344733695186722956879969509880605700825456600988418364795428009047381437594496623 : Rat) / 70049789471925041822132005230420065383543632954876887691719494263356973070153989347870303981820368274918450816) [(7, 2), (14, 1), (15, 2)],
  term ((1863086521548918911634 : Rat) / 96747836051316104659) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((1179091783 : Rat) / 99021804) [(7, 2), (14, 1), (16, 1)],
  term ((16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 2), (14, 2)],
  term ((-555056043834682909088384312456969501325001284072576403776195553689449585681364676141878329251583931041636241487 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 2), (15, 2)],
  term ((-120912350740959887153 : Rat) / 290243508153948313977) [(7, 2), (15, 2), (16, 1)],
  term ((746239 : Rat) / 49510902) [(7, 2), (16, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(7, 3), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 3), (8, 1), (14, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(7, 3), (9, 1), (10, 1), (14, 1)],
  term ((-13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(7, 3), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(7, 3), (9, 1), (14, 1)],
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(7, 3), (9, 1), (14, 1), (15, 2)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(7, 3), (10, 1), (14, 1), (15, 1)],
  term ((-2296120 : Rat) / 1178831) [(7, 3), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(7, 3), (14, 1), (15, 1)],
  term ((1148060 : Rat) / 1178831) [(7, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3967116038874217265825855470559603053966023145830438485152766056976055409740246906756190072345811 : Rat) / 999043913851664840957991880474446561031689479392549079255127725652655695876751078911964031041536) [(8, 1)],
  term ((-4467571841049050793080360913138822400 : Rat) / 2144116865330816633312319087537095051139) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2233785920524525396540180456569411200 : Rat) / 2144116865330816633312319087537095051139) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1905561514794659371207634289697375133925078013211416347039128393670875137760503387957135 : Rat) / 7566847957938118666455459752640286383529905287772901102077940271008310168814570467570688) [(8, 1), (10, 1)],
  term ((103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((63415609085614190411530546623591959526936478441141771041768558198621829373677808563047305809 : Rat) / 65588492243412870336002618203416922336639277796254535140173826526566156504513594991594277248) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((67616001749292260496390079351445541801853648819382098766812076359195506274863980353516442211341 : Rat) / 1951257644241532892496077891551653439515018514438572420420171339165343156009279450999929748128) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-111443119968889004834055103322880 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 3)],
  term ((-2129193723229644576079407393396764643593477176072472465343638001029436460 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-4595188356113587345373495122197732359401191129314635005255519446651728041431244705949015487687 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((259503481625271861446216930740272 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((176925565931263019711785436862482657200102960514090483145669751524833280 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((4559346876948017926225304939670171695281212116964622422938385011820771694169298973022069071909549 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7246966447690020215749729972484800 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 3)],
  term ((37070323741014616422955450905657331949881909928526752351644176615212459886992811809269087424059 : Rat) / 637145353221725026121168291118907245555924412877901198504545743400928377472417779918344407552) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2900019160213780065170518257847112 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (11, 1), (14, 3), (15, 1)],
  term ((-878257537213282411525004262977251127439309437189446374951212090460991388 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-184354176476973657058474773204716 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (11, 2), (14, 1), (15, 2)],
  term ((1983297615936310901185453814906517403609906821585115828003377722186862845784879529236985484051 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(8, 1), (10, 1), (12, 1)],
  term ((231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((29898409737228894721175583221587683110703630764661249043823352699239691203060119225649226181651 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((61278664621328028430830276469850542062572213524489767112780410295704998731644809454920065524337844704361052547 : Rat) / 1066986048888940774152529054228675748317774429789821971319038400092611273991576878197334035838457502555755520) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-3654088757780582381856030400085692 : Rat) / 10306817152083683685026217919314591) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-746239 : Rat) / 3536493) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((227380528012268467172599833382735726637116063370084367275211487133798655553883230569326753593 : Rat) / 1486672490850691727616059345944116906297156963381769463177273401268832880768974819809470284288) [(8, 1), (10, 1), (12, 1), (14, 2)],
  term ((1197401256169444886622701165709302824309688492907576487618126615558935488547058110210359707231613 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((111443119968889004834055103322880 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (12, 1), (15, 4)],
  term ((36500460227365292529935692457280145619522166541117537050244870585891382320715802123239473461475 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(8, 1), (10, 1), (12, 2)],
  term ((302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(8, 1), (10, 1), (12, 2), (14, 1)],
  term ((-95788087205831370884910235523664 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((-76788465661354334591539637263463286791719965665516770586083031851174140124663467050239335233155 : Rat) / 1951257644241532892496077891551653439515018514438572420420171339165343156009279450999929748128) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-141028542728057764387456859037456 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((634835375317862436205914213362432 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((489948771217690592740967944042959896487576307040830024758813110599741000 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-2465759035572902705695356834796485768496012870230509749387330681182840 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (10, 1), (13, 2)],
  term ((35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-1658906207092198024953121681903225443926360745242762789698471676390046933330367932378864773582297 : Rat) / 23786759853611067641856949535105870500754511414108311410836374420301326092303597116951524548608) [(8, 1), (10, 1), (14, 1)],
  term ((-37324699701875135990413828634474543972407322436863498711178830482246328646515113993546725692467 : Rat) / 1274290706443450052242336582237814491111848825755802397009091486801856754944835559836688815104) [(8, 1), (10, 1), (14, 1), (15, 2)],
  term ((517162565197373683397655100879368537145284975918037179625115926304704312121812486147270748783427 : Rat) / 13875609914606456124416553895478424458773464991563181656321218411842440220510431651555055986688) [(8, 1), (10, 1), (14, 2)],
  term ((-1546606093913119423098045901127644 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (14, 2), (15, 2)],
  term ((-35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 159286338305431256530292072779726811388981103219475299626136435850232094368104444979586101888) [(8, 1), (10, 1), (14, 3)],
  term ((-119399219055622340660366673485314614689436915390211374368787928364626570 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(8, 1), (10, 1), (15, 2)],
  term ((-3623483223845010107874864986242400 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 1), (15, 4)],
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (10, 2)],
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(8, 1), (10, 2), (11, 1), (15, 1)],
  term ((184354176476973657058474773204716 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 2), (11, 1), (15, 3)],
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(8, 1), (10, 2), (12, 1)],
  term ((-72712617912013130197815550853738920675185333953881566930575608494282513159465310240688920145 : Rat) / 65588492243412870336002618203416922336639277796254535140173826526566156504513594991594277248) [(8, 1), (10, 2), (12, 1), (15, 2)],
  term ((-333457482923196366412761017001276476996822122622680994623189195108640668 : Rat) / 1335857575253224359247432532734749906190427691522943525005822910491387453) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 2), (13, 1), (14, 1), (15, 3)],
  term ((-87995855923220277810228748565735304280033941209150426915346564733399126501559921400146378835919 : Rat) / 2601676858988710523328103855402204586020024685918096560560228452220457541345705934666572997504) [(8, 1), (10, 2), (13, 1), (15, 1)],
  term ((-148060361656382856612161827417392 : Rat) / 3435605717361227895008739306438197) [(8, 1), (10, 2), (13, 1), (15, 3)],
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (10, 2), (13, 2)],
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (10, 2), (14, 1)],
  term ((-12357407712571389471379257638081976173443256461343071645050028571747960134895521844067672634217 : Rat) / 212381784407241675373722763706302415185308137625967066168181914466976125824139259972781469184) [(8, 1), (10, 2), (14, 1), (15, 2)],
  term ((2900019160213780065170518257847112 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 2), (14, 2), (15, 2)],
  term ((-4563507464975397969179375630785911055933631380652961742213464131180547822055817905380031461407405 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (10, 2), (15, 2)],
  term ((7246966447690020215749729972484800 : Rat) / 30920451456251051055078653757943773) [(8, 1), (10, 2), (15, 4)],
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-63415609085614190411530546623591959526936478441141771041768558198621829373677808563047305809 : Rat) / 131176984486825740672005236406833844673278555592509070280347653053132313009027189983188554496) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-67616001749292260496390079351445541801853648819382098766812076359195506274863980353516442211341 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((55721559984444502417027551661440 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((1064596861614822288039703696698382321796738588036236232671819000514718230 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(8, 1), (11, 1), (13, 1)],
  term ((4595188356113587345373495122197732359401191129314635005255519446651728041431244705949015487687 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-129751740812635930723108465370136 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-88462782965631509855892718431241328600051480257045241572834875762416640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-4559346876948017926225304939670171695281212116964622422938385011820771694169298973022069071909549 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((3623483223845010107874864986242400 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-37070323741014616422955450905657331949881909928526752351644176615212459886992811809269087424059 : Rat) / 1274290706443450052242336582237814491111848825755802397009091486801856754944835559836688815104) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((1450009580106890032585259128923556 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (14, 3), (15, 1)],
  term ((1419038591552162227259031566973612210344641544346144707457261243788517136589621182306723429350745 : Rat) / 166507318975277473492998646745741093505281579898758179875854620942109282646125179818660671840256) [(8, 1), (11, 1), (15, 1)],
  term ((-46088544119243414264618693301179 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (15, 3)],
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(8, 1), (11, 2), (14, 1)],
  term ((92177088238486828529237386602358 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 2), (14, 1), (15, 2)],
  term ((444190279169766768470808602748461335386305500244478493940134106784854905786196488848359224891747 : Rat) / 55502439658425824497666215581913697835093859966252726625284873647369760882041726606220223946752) [(8, 1), (12, 1)],
  term ((-115513186567189546824957854071200 : Rat) / 24049240021528595265061175145067379) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-29898409737228894721175583221587683110703630764661249043823352699239691203060119225649226181651 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-61278664621328028430830276469850542062572213524489767112780410295704998731644809454920065524337844704361052547 : Rat) / 2133972097777881548305058108457351496635548859579643942638076800185222547983153756394668071676915005111511040) [(8, 1), (12, 1), (14, 1)],
  term ((1827044378890291190928015200042846 : Rat) / 10306817152083683685026217919314591) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((746239 : Rat) / 7072986) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-227380528012268467172599833382735726637116063370084367275211487133798655553883230569326753593 : Rat) / 2973344981701383455232118691888233812594313926763538926354546802537665761537949639618940568576) [(8, 1), (12, 1), (14, 2)],
  term ((-594374227318957662064580557578853946374670719083532290576694059074057934740540869145858862867179 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (12, 1), (15, 2)],
  term ((-55721559984444502417027551661440 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 1), (15, 4)],
  term ((-36500460227365292529935692457280145619522166541117537050244870585891382320715802123239473461475 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(8, 1), (12, 2)],
  term ((-302038004505260528801370317124300979007759037060868912524681305394715358732123534083281753913 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(8, 1), (12, 2), (14, 1)],
  term ((47894043602915685442455117761832 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 2), (15, 2)],
  term ((77032002650116062550969126006107705049279948331900327278589795113827964263057279519027830211139 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((29585422759168759553401755714576 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-317417687658931218102957106681216 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((82270597166086424953424363224702524055804578772527126514660550621405183862508696958031457107919 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(8, 1), (13, 1), (15, 1)],
  term ((37015090414095714153040456854348 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (15, 3)],
  term ((104090160355144188689911656966007445059733530821320928632128874140966310314585109883776677855117 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (13, 2)],
  term ((-35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 637145353221725026121168291118907245555924412877901198504545743400928377472417779918344407552) [(8, 1), (13, 2), (14, 1)],
  term ((1708006641713517482473409784006448303811308367803423698803474228470129001736904664606530662109337 : Rat) / 55502439658425824497666215581913697835093859966252726625284873647369760882041726606220223946752) [(8, 1), (14, 1)],
  term ((2188144789399685423663282398491778602727561524143903342539085770514417913270637633110286576327 : Rat) / 74958276849614708955431563661047911241873460338576611588770087458932750290872679990393459712) [(8, 1), (14, 1), (15, 2)],
  term ((-517162565197373683397655100879368537145284975918037179625115926304704312121812486147270748783427 : Rat) / 27751219829212912248833107790956848917546929983126363312642436823684880441020863303110111973376) [(8, 1), (14, 2)],
  term ((16099418967704898418797795367348 : Rat) / 10306817152083683685026217919314591) [(8, 1), (14, 2), (15, 2)],
  term ((35149271019359497511398922045446719961396686684682929083939848814146833049777615206830786239 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(8, 1), (14, 3)],
  term ((4567228079399605006491631417359780082901648706328152572968081584086032025216082289492988632443565 : Rat) / 249760978462916210239497970118611640257922369848137269813781931413163923969187769727991007760384) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 1000 through 1099. -/
theorem ep_Q1_009_block_21_1000_1099_valid :
    checkProductSumEq ep_Q1_009_partials_21_1000_1099
      ep_Q1_009_block_21_1000_1099 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
