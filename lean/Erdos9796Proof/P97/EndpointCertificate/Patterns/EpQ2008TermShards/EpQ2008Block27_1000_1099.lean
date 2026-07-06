/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:1000-1099

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1000 : Poly :=
[
  term ((476979966423540056227623845698252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1000 for generator 27. -/
def ep_Q2_008_partial_27_1000 : Poly :=
[
  term ((953959932847080112455247691396505600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-476979966423540056227623845698252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 27. -/
theorem ep_Q2_008_partial_27_1000_valid :
    mulPoly ep_Q2_008_coefficient_27_1000
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1001 : Poly :=
[
  term ((-33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1001 for generator 27. -/
def ep_Q2_008_partial_27_1001 : Poly :=
[
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 27. -/
theorem ep_Q2_008_partial_27_1001_valid :
    mulPoly ep_Q2_008_coefficient_27_1001
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1002 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1002 for generator 27. -/
def ep_Q2_008_partial_27_1002 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 27. -/
theorem ep_Q2_008_partial_27_1002_valid :
    mulPoly ep_Q2_008_coefficient_27_1002
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1003 : Poly :=
[
  term ((-270764933521476675001410435364761600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1003 for generator 27. -/
def ep_Q2_008_partial_27_1003 : Poly :=
[
  term ((270764933521476675001410435364761600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-541529867042953350002820870729523200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 27. -/
theorem ep_Q2_008_partial_27_1003_valid :
    mulPoly ep_Q2_008_coefficient_27_1003
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1004 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1004 for generator 27. -/
def ep_Q2_008_partial_27_1004 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 27. -/
theorem ep_Q2_008_partial_27_1004_valid :
    mulPoly ep_Q2_008_coefficient_27_1004
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1005 : Poly :=
[
  term ((-135382466760738337500705217682380800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1005 for generator 27. -/
def ep_Q2_008_partial_27_1005 : Poly :=
[
  term ((-270764933521476675001410435364761600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((135382466760738337500705217682380800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 27. -/
theorem ep_Q2_008_partial_27_1005_valid :
    mulPoly ep_Q2_008_coefficient_27_1005
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1006 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

/-- Partial product 1006 for generator 27. -/
def ep_Q2_008_partial_27_1006 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 27. -/
theorem ep_Q2_008_partial_27_1006_valid :
    mulPoly ep_Q2_008_coefficient_27_1006
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1007 : Poly :=
[
  term ((-15102320745371993837164737169459833600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1007 for generator 27. -/
def ep_Q2_008_partial_27_1007 : Poly :=
[
  term ((15102320745371993837164737169459833600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-30204641490743987674329474338919667200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 27. -/
theorem ep_Q2_008_partial_27_1007_valid :
    mulPoly ep_Q2_008_coefficient_27_1007
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1008 : Poly :=
[
  term ((-7551160372685996918582368584729916800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1008 for generator 27. -/
def ep_Q2_008_partial_27_1008 : Poly :=
[
  term ((-15102320745371993837164737169459833600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((7551160372685996918582368584729916800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 27. -/
theorem ep_Q2_008_partial_27_1008_valid :
    mulPoly ep_Q2_008_coefficient_27_1008
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1009 : Poly :=
[
  term ((-162308176140360123002038793195980800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1009 for generator 27. -/
def ep_Q2_008_partial_27_1009 : Poly :=
[
  term ((162308176140360123002038793195980800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-324616352280720246004077586391961600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 27. -/
theorem ep_Q2_008_partial_27_1009_valid :
    mulPoly ep_Q2_008_coefficient_27_1009
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1010 : Poly :=
[
  term ((-81154088070180061501019396597990400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 1010 for generator 27. -/
def ep_Q2_008_partial_27_1010 : Poly :=
[
  term ((-162308176140360123002038793195980800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((81154088070180061501019396597990400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 27. -/
theorem ep_Q2_008_partial_27_1010_valid :
    mulPoly ep_Q2_008_coefficient_27_1010
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1011 : Poly :=
[
  term ((812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1011 for generator 27. -/
def ep_Q2_008_partial_27_1011 : Poly :=
[
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 27. -/
theorem ep_Q2_008_partial_27_1011_valid :
    mulPoly ep_Q2_008_coefficient_27_1011
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1012 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1012 for generator 27. -/
def ep_Q2_008_partial_27_1012 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 27. -/
theorem ep_Q2_008_partial_27_1012_valid :
    mulPoly ep_Q2_008_coefficient_27_1012
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1013 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1013 for generator 27. -/
def ep_Q2_008_partial_27_1013 : Poly :=
[
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 27. -/
theorem ep_Q2_008_partial_27_1013_valid :
    mulPoly ep_Q2_008_coefficient_27_1013
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1014 : Poly :=
[
  term ((234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1014 for generator 27. -/
def ep_Q2_008_partial_27_1014 : Poly :=
[
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 27. -/
theorem ep_Q2_008_partial_27_1014_valid :
    mulPoly ep_Q2_008_coefficient_27_1014
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1015 : Poly :=
[
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1015 for generator 27. -/
def ep_Q2_008_partial_27_1015 : Poly :=
[
  term ((234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 27. -/
theorem ep_Q2_008_partial_27_1015_valid :
    mulPoly ep_Q2_008_coefficient_27_1015
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1016 : Poly :=
[
  term ((-234997830172389375 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1016 for generator 27. -/
def ep_Q2_008_partial_27_1016 : Poly :=
[
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 27. -/
theorem ep_Q2_008_partial_27_1016_valid :
    mulPoly ep_Q2_008_coefficient_27_1016
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1017 : Poly :=
[
  term ((52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1017 for generator 27. -/
def ep_Q2_008_partial_27_1017 : Poly :=
[
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 27. -/
theorem ep_Q2_008_partial_27_1017_valid :
    mulPoly ep_Q2_008_coefficient_27_1017
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1018 : Poly :=
[
  term ((18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1018 for generator 27. -/
def ep_Q2_008_partial_27_1018 : Poly :=
[
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 27. -/
theorem ep_Q2_008_partial_27_1018_valid :
    mulPoly ep_Q2_008_coefficient_27_1018
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1019 : Poly :=
[
  term ((-93766382576283600 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1019 for generator 27. -/
def ep_Q2_008_partial_27_1019 : Poly :=
[
  term ((-187532765152567200 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 27. -/
theorem ep_Q2_008_partial_27_1019_valid :
    mulPoly ep_Q2_008_coefficient_27_1019
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1020 : Poly :=
[
  term ((-18816439408906010081873058913208843757150 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1020 for generator 27. -/
def ep_Q2_008_partial_27_1020 : Poly :=
[
  term ((18816439408906010081873058913208843757150 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37632878817812020163746117826417687514300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 27. -/
theorem ep_Q2_008_partial_27_1020_valid :
    mulPoly ep_Q2_008_coefficient_27_1020
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1021 : Poly :=
[
  term ((-9408219704453005040936529456604421878575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1021 for generator 27. -/
def ep_Q2_008_partial_27_1021 : Poly :=
[
  term ((-18816439408906010081873058913208843757150 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9408219704453005040936529456604421878575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 27. -/
theorem ep_Q2_008_partial_27_1021_valid :
    mulPoly ep_Q2_008_coefficient_27_1021
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1022 : Poly :=
[
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1022 for generator 27. -/
def ep_Q2_008_partial_27_1022 : Poly :=
[
  term ((-23441595644070900 : Rat) / 692956453614176359) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 27. -/
theorem ep_Q2_008_partial_27_1022_valid :
    mulPoly ep_Q2_008_coefficient_27_1022
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1023 : Poly :=
[
  term ((11720797822035450 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 1023 for generator 27. -/
def ep_Q2_008_partial_27_1023 : Poly :=
[
  term ((23441595644070900 : Rat) / 692956453614176359) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-11720797822035450 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 27. -/
theorem ep_Q2_008_partial_27_1023_valid :
    mulPoly ep_Q2_008_coefficient_27_1023
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1024 : Poly :=
[
  term ((-4051821608674623000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1024 for generator 27. -/
def ep_Q2_008_partial_27_1024 : Poly :=
[
  term ((4051821608674623000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 27. -/
theorem ep_Q2_008_partial_27_1024_valid :
    mulPoly ep_Q2_008_coefficient_27_1024
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1025 : Poly :=
[
  term ((228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1025 for generator 27. -/
def ep_Q2_008_partial_27_1025 : Poly :=
[
  term ((456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 27. -/
theorem ep_Q2_008_partial_27_1025_valid :
    mulPoly ep_Q2_008_coefficient_27_1025
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1026 : Poly :=
[
  term ((-1712448266899812750 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1026 for generator 27. -/
def ep_Q2_008_partial_27_1026 : Poly :=
[
  term ((-3424896533799625500 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1712448266899812750 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 27. -/
theorem ep_Q2_008_partial_27_1026_valid :
    mulPoly ep_Q2_008_coefficient_27_1026
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1027 : Poly :=
[
  term ((-1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1027 for generator 27. -/
def ep_Q2_008_partial_27_1027 : Poly :=
[
  term ((-3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 27. -/
theorem ep_Q2_008_partial_27_1027_valid :
    mulPoly ep_Q2_008_coefficient_27_1027
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1028 : Poly :=
[
  term ((51554695535882928147534823652397464405250 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1028 for generator 27. -/
def ep_Q2_008_partial_27_1028 : Poly :=
[
  term ((103109391071765856295069647304794928810500 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51554695535882928147534823652397464405250 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 27. -/
theorem ep_Q2_008_partial_27_1028_valid :
    mulPoly ep_Q2_008_coefficient_27_1028
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1029 : Poly :=
[
  term ((-46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1029 for generator 27. -/
def ep_Q2_008_partial_27_1029 : Poly :=
[
  term ((46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-92288735645717763194139081367441344000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 27. -/
theorem ep_Q2_008_partial_27_1029_valid :
    mulPoly ep_Q2_008_coefficient_27_1029
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1030 : Poly :=
[
  term ((-4059837178090107750 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1030 for generator 27. -/
def ep_Q2_008_partial_27_1030 : Poly :=
[
  term ((4059837178090107750 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8119674356180215500 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 27. -/
theorem ep_Q2_008_partial_27_1030_valid :
    mulPoly ep_Q2_008_coefficient_27_1030
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1031 : Poly :=
[
  term ((-23072183911429440798534770341860336000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1031 for generator 27. -/
def ep_Q2_008_partial_27_1031 : Poly :=
[
  term ((-46144367822858881597069540683720672000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((23072183911429440798534770341860336000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 27. -/
theorem ep_Q2_008_partial_27_1031_valid :
    mulPoly ep_Q2_008_coefficient_27_1031
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1032 : Poly :=
[
  term ((-2029918589045053875 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1032 for generator 27. -/
def ep_Q2_008_partial_27_1032 : Poly :=
[
  term ((-4059837178090107750 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((2029918589045053875 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 27. -/
theorem ep_Q2_008_partial_27_1032_valid :
    mulPoly ep_Q2_008_coefficient_27_1032
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1033 : Poly :=
[
  term ((608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1033 for generator 27. -/
def ep_Q2_008_partial_27_1033 : Poly :=
[
  term ((-608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1216881585219910399220775869005520793600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 27. -/
theorem ep_Q2_008_partial_27_1033_valid :
    mulPoly ep_Q2_008_coefficient_27_1033
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1034 : Poly :=
[
  term ((304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1034 for generator 27. -/
def ep_Q2_008_partial_27_1034 : Poly :=
[
  term ((608440792609955199610387934502760396800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 27. -/
theorem ep_Q2_008_partial_27_1034_valid :
    mulPoly ep_Q2_008_coefficient_27_1034
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1035 : Poly :=
[
  term ((-952132201707085141053065602582340331471225 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1035 for generator 27. -/
def ep_Q2_008_partial_27_1035 : Poly :=
[
  term ((952132201707085141053065602582340331471225 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-952132201707085141053065602582340331471225 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 27. -/
theorem ep_Q2_008_partial_27_1035_valid :
    mulPoly ep_Q2_008_coefficient_27_1035
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1036 : Poly :=
[
  term ((-952132201707085141053065602582340331471225 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1036 for generator 27. -/
def ep_Q2_008_partial_27_1036 : Poly :=
[
  term ((-952132201707085141053065602582340331471225 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((952132201707085141053065602582340331471225 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 27. -/
theorem ep_Q2_008_partial_27_1036_valid :
    mulPoly ep_Q2_008_coefficient_27_1036
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1037 : Poly :=
[
  term ((1851247652599570961241629731341332913600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1037 for generator 27. -/
def ep_Q2_008_partial_27_1037 : Poly :=
[
  term ((-1851247652599570961241629731341332913600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3702495305199141922483259462682665827200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 27. -/
theorem ep_Q2_008_partial_27_1037_valid :
    mulPoly ep_Q2_008_coefficient_27_1037
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1038 : Poly :=
[
  term ((2901482086179986863812953166549261671654400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1038 for generator 27. -/
def ep_Q2_008_partial_27_1038 : Poly :=
[
  term ((5802964172359973727625906333098523343308800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2901482086179986863812953166549261671654400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 27. -/
theorem ep_Q2_008_partial_27_1038_valid :
    mulPoly ep_Q2_008_coefficient_27_1038
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1039 : Poly :=
[
  term ((-65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1039 for generator 27. -/
def ep_Q2_008_partial_27_1039 : Poly :=
[
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 27. -/
theorem ep_Q2_008_partial_27_1039_valid :
    mulPoly ep_Q2_008_coefficient_27_1039
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1040 : Poly :=
[
  term ((-13102522712782866000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1040 for generator 27. -/
def ep_Q2_008_partial_27_1040 : Poly :=
[
  term ((13102522712782866000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 27. -/
theorem ep_Q2_008_partial_27_1040_valid :
    mulPoly ep_Q2_008_coefficient_27_1040
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1041 : Poly :=
[
  term ((1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1041 for generator 27. -/
def ep_Q2_008_partial_27_1041 : Poly :=
[
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 27. -/
theorem ep_Q2_008_partial_27_1041_valid :
    mulPoly ep_Q2_008_coefficient_27_1041
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1042 : Poly :=
[
  term ((-10720245855913254000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 1042 for generator 27. -/
def ep_Q2_008_partial_27_1042 : Poly :=
[
  term ((-21440491711826508000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((10720245855913254000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 27. -/
theorem ep_Q2_008_partial_27_1042_valid :
    mulPoly ep_Q2_008_coefficient_27_1042
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1043 : Poly :=
[
  term ((-1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1043 for generator 27. -/
def ep_Q2_008_partial_27_1043 : Poly :=
[
  term ((1084689874169602622998984015288163596800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 27. -/
theorem ep_Q2_008_partial_27_1043_valid :
    mulPoly ep_Q2_008_coefficient_27_1043
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1044 : Poly :=
[
  term ((-887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1044 for generator 27. -/
def ep_Q2_008_partial_27_1044 : Poly :=
[
  term ((-1774947066822986110361973843198813158400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 27. -/
theorem ep_Q2_008_partial_27_1044_valid :
    mulPoly ep_Q2_008_coefficient_27_1044
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1045 : Poly :=
[
  term ((18372781880354946375 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1045 for generator 27. -/
def ep_Q2_008_partial_27_1045 : Poly :=
[
  term ((-18372781880354946375 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((18372781880354946375 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 27. -/
theorem ep_Q2_008_partial_27_1045_valid :
    mulPoly ep_Q2_008_coefficient_27_1045
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1046 : Poly :=
[
  term ((-38782928318584787949240013775087262406500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1046 for generator 27. -/
def ep_Q2_008_partial_27_1046 : Poly :=
[
  term ((-77565856637169575898480027550174524813000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((38782928318584787949240013775087262406500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 27. -/
theorem ep_Q2_008_partial_27_1046_valid :
    mulPoly ep_Q2_008_coefficient_27_1046
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1047 : Poly :=
[
  term ((4528376410574386125 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1047 for generator 27. -/
def ep_Q2_008_partial_27_1047 : Poly :=
[
  term ((4528376410574386125 : Rat) / 1385912907228352718) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4528376410574386125 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 27. -/
theorem ep_Q2_008_partial_27_1047_valid :
    mulPoly ep_Q2_008_coefficient_27_1047
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1048 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1048 for generator 27. -/
def ep_Q2_008_partial_27_1048 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 27. -/
theorem ep_Q2_008_partial_27_1048_valid :
    mulPoly ep_Q2_008_coefficient_27_1048
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1049 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1049 for generator 27. -/
def ep_Q2_008_partial_27_1049 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 27. -/
theorem ep_Q2_008_partial_27_1049_valid :
    mulPoly ep_Q2_008_coefficient_27_1049
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1050 : Poly :=
[
  term ((-828304227220269272190524892154053327397500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1050 for generator 27. -/
def ep_Q2_008_partial_27_1050 : Poly :=
[
  term ((828304227220269272190524892154053327397500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1656608454440538544381049784308106654795000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 27. -/
theorem ep_Q2_008_partial_27_1050_valid :
    mulPoly ep_Q2_008_coefficient_27_1050
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1051 : Poly :=
[
  term ((-414152113610134636095262446077026663698750 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1051 for generator 27. -/
def ep_Q2_008_partial_27_1051 : Poly :=
[
  term ((-828304227220269272190524892154053327397500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((414152113610134636095262446077026663698750 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 27. -/
theorem ep_Q2_008_partial_27_1051_valid :
    mulPoly ep_Q2_008_coefficient_27_1051
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1052 : Poly :=
[
  term ((-525910242021625514181325583170018713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1052 for generator 27. -/
def ep_Q2_008_partial_27_1052 : Poly :=
[
  term ((525910242021625514181325583170018713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1051820484043251028362651166340037427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 27. -/
theorem ep_Q2_008_partial_27_1052_valid :
    mulPoly ep_Q2_008_coefficient_27_1052
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1053 : Poly :=
[
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1053 for generator 27. -/
def ep_Q2_008_partial_27_1053 : Poly :=
[
  term ((8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-16675937998087284000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 27. -/
theorem ep_Q2_008_partial_27_1053_valid :
    mulPoly ep_Q2_008_coefficient_27_1053
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1054 : Poly :=
[
  term ((-262955121010812757090662791585009356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1054 for generator 27. -/
def ep_Q2_008_partial_27_1054 : Poly :=
[
  term ((-525910242021625514181325583170018713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((262955121010812757090662791585009356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 27. -/
theorem ep_Q2_008_partial_27_1054_valid :
    mulPoly ep_Q2_008_coefficient_27_1054
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1055 : Poly :=
[
  term ((-4168984499521821000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1055 for generator 27. -/
def ep_Q2_008_partial_27_1055 : Poly :=
[
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((4168984499521821000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 27. -/
theorem ep_Q2_008_partial_27_1055_valid :
    mulPoly ep_Q2_008_coefficient_27_1055
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1056 : Poly :=
[
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1056 for generator 27. -/
def ep_Q2_008_partial_27_1056 : Poly :=
[
  term ((690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1380514385306766974725979655821299123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 27. -/
theorem ep_Q2_008_partial_27_1056_valid :
    mulPoly ep_Q2_008_coefficient_27_1056
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1057 : Poly :=
[
  term ((-345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 1057 for generator 27. -/
def ep_Q2_008_partial_27_1057 : Poly :=
[
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 27. -/
theorem ep_Q2_008_partial_27_1057_valid :
    mulPoly ep_Q2_008_coefficient_27_1057
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1058 : Poly :=
[
  term ((-920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1058 for generator 27. -/
def ep_Q2_008_partial_27_1058 : Poly :=
[
  term ((920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1840816897985154886897607710097190912000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 27. -/
theorem ep_Q2_008_partial_27_1058_valid :
    mulPoly ep_Q2_008_coefficient_27_1058
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1059 : Poly :=
[
  term ((590045395144651875 : Rat) / 1385912907228352718) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1059 for generator 27. -/
def ep_Q2_008_partial_27_1059 : Poly :=
[
  term ((-590045395144651875 : Rat) / 1385912907228352718) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((590045395144651875 : Rat) / 692956453614176359) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 27. -/
theorem ep_Q2_008_partial_27_1059_valid :
    mulPoly ep_Q2_008_coefficient_27_1059
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1060 : Poly :=
[
  term ((-460204224496288721724401927524297728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1060 for generator 27. -/
def ep_Q2_008_partial_27_1060 : Poly :=
[
  term ((-920408448992577443448803855048595456000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((460204224496288721724401927524297728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 27. -/
theorem ep_Q2_008_partial_27_1060_valid :
    mulPoly ep_Q2_008_coefficient_27_1060
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1061 : Poly :=
[
  term ((870925640895905625 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 1061 for generator 27. -/
def ep_Q2_008_partial_27_1061 : Poly :=
[
  term ((870925640895905625 : Rat) / 1385912907228352718) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-870925640895905625 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 27. -/
theorem ep_Q2_008_partial_27_1061_valid :
    mulPoly ep_Q2_008_coefficient_27_1061
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1062 : Poly :=
[
  term ((1049086361414700277171684829478353635200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1062 for generator 27. -/
def ep_Q2_008_partial_27_1062 : Poly :=
[
  term ((-1049086361414700277171684829478353635200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2098172722829400554343369658956707270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 27. -/
theorem ep_Q2_008_partial_27_1062_valid :
    mulPoly ep_Q2_008_coefficient_27_1062
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1063 : Poly :=
[
  term ((-21801334369016115771 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1063 for generator 27. -/
def ep_Q2_008_partial_27_1063 : Poly :=
[
  term ((21801334369016115771 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21801334369016115771 : Rat) / 5543651628913410872) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 27. -/
theorem ep_Q2_008_partial_27_1063_valid :
    mulPoly ep_Q2_008_coefficient_27_1063
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1064 : Poly :=
[
  term ((16738297436475597556241564700737502864000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1064 for generator 27. -/
def ep_Q2_008_partial_27_1064 : Poly :=
[
  term ((33476594872951195112483129401475005728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-16738297436475597556241564700737502864000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 27. -/
theorem ep_Q2_008_partial_27_1064_valid :
    mulPoly ep_Q2_008_coefficient_27_1064
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1065 : Poly :=
[
  term ((35453869982769265137 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1065 for generator 27. -/
def ep_Q2_008_partial_27_1065 : Poly :=
[
  term ((35453869982769265137 : Rat) / 5543651628913410872) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35453869982769265137 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 27. -/
theorem ep_Q2_008_partial_27_1065_valid :
    mulPoly ep_Q2_008_coefficient_27_1065
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1066 : Poly :=
[
  term ((-21813303624541091199295261739211982406400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1066 for generator 27. -/
def ep_Q2_008_partial_27_1066 : Poly :=
[
  term ((21813303624541091199295261739211982406400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-43626607249082182398590523478423964812800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 27. -/
theorem ep_Q2_008_partial_27_1066_valid :
    mulPoly ep_Q2_008_coefficient_27_1066
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1067 : Poly :=
[
  term ((-17155799657813057761169330009399060947200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1067 for generator 27. -/
def ep_Q2_008_partial_27_1067 : Poly :=
[
  term ((-34311599315626115522338660018798121894400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((17155799657813057761169330009399060947200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 27. -/
theorem ep_Q2_008_partial_27_1067_valid :
    mulPoly ep_Q2_008_coefficient_27_1067
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1068 : Poly :=
[
  term ((2342257115059933523187819114483993384345321 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1068 for generator 27. -/
def ep_Q2_008_partial_27_1068 : Poly :=
[
  term ((-2342257115059933523187819114483993384345321 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2342257115059933523187819114483993384345321 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 27. -/
theorem ep_Q2_008_partial_27_1068_valid :
    mulPoly ep_Q2_008_coefficient_27_1068
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1069 : Poly :=
[
  term ((-1759783537513448391304786471094649744671139 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1069 for generator 27. -/
def ep_Q2_008_partial_27_1069 : Poly :=
[
  term ((-1759783537513448391304786471094649744671139 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1759783537513448391304786471094649744671139 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 27. -/
theorem ep_Q2_008_partial_27_1069_valid :
    mulPoly ep_Q2_008_coefficient_27_1069
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1070 : Poly :=
[
  term ((-22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1070 for generator 27. -/
def ep_Q2_008_partial_27_1070 : Poly :=
[
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 27. -/
theorem ep_Q2_008_partial_27_1070_valid :
    mulPoly ep_Q2_008_coefficient_27_1070
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1071 : Poly :=
[
  term ((-12357048322862627943133129537480145097600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1071 for generator 27. -/
def ep_Q2_008_partial_27_1071 : Poly :=
[
  term ((-24714096645725255886266259074960290195200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((12357048322862627943133129537480145097600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 27. -/
theorem ep_Q2_008_partial_27_1071_valid :
    mulPoly ep_Q2_008_coefficient_27_1071
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1072 : Poly :=
[
  term ((18941704270614319579261454630400387238800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1072 for generator 27. -/
def ep_Q2_008_partial_27_1072 : Poly :=
[
  term ((-18941704270614319579261454630400387238800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((37883408541228639158522909260800774477600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 27. -/
theorem ep_Q2_008_partial_27_1072_valid :
    mulPoly ep_Q2_008_coefficient_27_1072
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1073 : Poly :=
[
  term ((74231465260450796559 : Rat) / 11087303257826821744) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1073 for generator 27. -/
def ep_Q2_008_partial_27_1073 : Poly :=
[
  term ((-74231465260450796559 : Rat) / 11087303257826821744) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((74231465260450796559 : Rat) / 5543651628913410872) [(3, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 27. -/
theorem ep_Q2_008_partial_27_1073_valid :
    mulPoly ep_Q2_008_coefficient_27_1073
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1074 : Poly :=
[
  term ((9470852135307159789630727315200193619400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1074 for generator 27. -/
def ep_Q2_008_partial_27_1074 : Poly :=
[
  term ((18941704270614319579261454630400387238800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-9470852135307159789630727315200193619400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 27. -/
theorem ep_Q2_008_partial_27_1074_valid :
    mulPoly ep_Q2_008_coefficient_27_1074
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1075 : Poly :=
[
  term ((88423559995596830559 : Rat) / 22174606515653643488) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 1075 for generator 27. -/
def ep_Q2_008_partial_27_1075 : Poly :=
[
  term ((88423559995596830559 : Rat) / 11087303257826821744) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-88423559995596830559 : Rat) / 22174606515653643488) [(3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 27. -/
theorem ep_Q2_008_partial_27_1075_valid :
    mulPoly ep_Q2_008_coefficient_27_1075
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1076 : Poly :=
[
  term ((-7740874222958294273983099215447537436800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1076 for generator 27. -/
def ep_Q2_008_partial_27_1076 : Poly :=
[
  term ((7740874222958294273983099215447537436800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15481748445916588547966198430895074873600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 27. -/
theorem ep_Q2_008_partial_27_1076_valid :
    mulPoly ep_Q2_008_coefficient_27_1076
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1077 : Poly :=
[
  term ((-3870437111479147136991549607723768718400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1077 for generator 27. -/
def ep_Q2_008_partial_27_1077 : Poly :=
[
  term ((-7740874222958294273983099215447537436800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3870437111479147136991549607723768718400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 27. -/
theorem ep_Q2_008_partial_27_1077_valid :
    mulPoly ep_Q2_008_coefficient_27_1077
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1078 : Poly :=
[
  term ((2922184218949922417704873737678146734475197 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1078 for generator 27. -/
def ep_Q2_008_partial_27_1078 : Poly :=
[
  term ((-2922184218949922417704873737678146734475197 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2922184218949922417704873737678146734475197 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 27. -/
theorem ep_Q2_008_partial_27_1078_valid :
    mulPoly ep_Q2_008_coefficient_27_1078
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1079 : Poly :=
[
  term ((2342804105349386964574153203399677593007197 : Rat) / 2699321629621272246011853252143728875167968) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1079 for generator 27. -/
def ep_Q2_008_partial_27_1079 : Poly :=
[
  term ((2342804105349386964574153203399677593007197 : Rat) / 1349660814810636123005926626071864437583984) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2342804105349386964574153203399677593007197 : Rat) / 2699321629621272246011853252143728875167968) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 27. -/
theorem ep_Q2_008_partial_27_1079_valid :
    mulPoly ep_Q2_008_coefficient_27_1079
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1080 : Poly :=
[
  term ((-863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1080 for generator 27. -/
def ep_Q2_008_partial_27_1080 : Poly :=
[
  term ((-1726539312076568003845011973608230400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 27. -/
theorem ep_Q2_008_partial_27_1080_valid :
    mulPoly ep_Q2_008_coefficient_27_1080
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1081 : Poly :=
[
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1081 for generator 27. -/
def ep_Q2_008_partial_27_1081 : Poly :=
[
  term ((-431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 27. -/
theorem ep_Q2_008_partial_27_1081_valid :
    mulPoly ep_Q2_008_coefficient_27_1081
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1082 : Poly :=
[
  term ((215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1082 for generator 27. -/
def ep_Q2_008_partial_27_1082 : Poly :=
[
  term ((431634828019142000961252993402057600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 27. -/
theorem ep_Q2_008_partial_27_1082_valid :
    mulPoly ep_Q2_008_coefficient_27_1082
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1083 : Poly :=
[
  term ((-1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1083 for generator 27. -/
def ep_Q2_008_partial_27_1083 : Poly :=
[
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 27. -/
theorem ep_Q2_008_partial_27_1083_valid :
    mulPoly ep_Q2_008_coefficient_27_1083
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1084 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1084 for generator 27. -/
def ep_Q2_008_partial_27_1084 : Poly :=
[
  term ((-771775544509452000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 27. -/
theorem ep_Q2_008_partial_27_1084_valid :
    mulPoly ep_Q2_008_coefficient_27_1084
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1085 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 1085 for generator 27. -/
def ep_Q2_008_partial_27_1085 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (14, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 27. -/
theorem ep_Q2_008_partial_27_1085_valid :
    mulPoly ep_Q2_008_coefficient_27_1085
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1086 : Poly :=
[
  term ((-3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (4, 1), (12, 1), (16, 1)]
]

/-- Partial product 1086 for generator 27. -/
def ep_Q2_008_partial_27_1086 : Poly :=
[
  term ((-7216820728734948900 : Rat) / 692956453614176359) [(3, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 27. -/
theorem ep_Q2_008_partial_27_1086_valid :
    mulPoly ep_Q2_008_coefficient_27_1086
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1087 : Poly :=
[
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (4, 1), (14, 1), (16, 1)]
]

/-- Partial product 1087 for generator 27. -/
def ep_Q2_008_partial_27_1087 : Poly :=
[
  term ((-1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (4, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 27. -/
theorem ep_Q2_008_partial_27_1087_valid :
    mulPoly ep_Q2_008_coefficient_27_1087
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1088 : Poly :=
[
  term ((1804205182183737225 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (16, 1)]
]

/-- Partial product 1088 for generator 27. -/
def ep_Q2_008_partial_27_1088 : Poly :=
[
  term ((1804205182183737225 : Rat) / 692956453614176359) [(3, 2), (4, 1), (14, 1), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 27. -/
theorem ep_Q2_008_partial_27_1088_valid :
    mulPoly ep_Q2_008_coefficient_27_1088
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1089 : Poly :=
[
  term ((24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1089 for generator 27. -/
def ep_Q2_008_partial_27_1089 : Poly :=
[
  term ((48789385395874675328416438830643200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 27. -/
theorem ep_Q2_008_partial_27_1089_valid :
    mulPoly ep_Q2_008_coefficient_27_1089
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1090 : Poly :=
[
  term ((-309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1090 for generator 27. -/
def ep_Q2_008_partial_27_1090 : Poly :=
[
  term ((-618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 27. -/
theorem ep_Q2_008_partial_27_1090_valid :
    mulPoly ep_Q2_008_coefficient_27_1090
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1091 : Poly :=
[
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1091 for generator 27. -/
def ep_Q2_008_partial_27_1091 : Poly :=
[
  term ((12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 27. -/
theorem ep_Q2_008_partial_27_1091_valid :
    mulPoly ep_Q2_008_coefficient_27_1091
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1092 : Poly :=
[
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1092 for generator 27. -/
def ep_Q2_008_partial_27_1092 : Poly :=
[
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 27. -/
theorem ep_Q2_008_partial_27_1092_valid :
    mulPoly ep_Q2_008_coefficient_27_1092
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1093 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1093 for generator 27. -/
def ep_Q2_008_partial_27_1093 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 27. -/
theorem ep_Q2_008_partial_27_1093_valid :
    mulPoly ep_Q2_008_coefficient_27_1093
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1094 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 1094 for generator 27. -/
def ep_Q2_008_partial_27_1094 : Poly :=
[
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 27. -/
theorem ep_Q2_008_partial_27_1094_valid :
    mulPoly ep_Q2_008_coefficient_27_1094
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1095 : Poly :=
[
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1095 for generator 27. -/
def ep_Q2_008_partial_27_1095 : Poly :=
[
  term ((-214382095697070000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 27. -/
theorem ep_Q2_008_partial_27_1095_valid :
    mulPoly ep_Q2_008_coefficient_27_1095
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1096 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1096 for generator 27. -/
def ep_Q2_008_partial_27_1096 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 27. -/
theorem ep_Q2_008_partial_27_1096_valid :
    mulPoly ep_Q2_008_coefficient_27_1096
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1097 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 1097 for generator 27. -/
def ep_Q2_008_partial_27_1097 : Poly :=
[
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 27. -/
theorem ep_Q2_008_partial_27_1097_valid :
    mulPoly ep_Q2_008_coefficient_27_1097
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1098 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1098 for generator 27. -/
def ep_Q2_008_partial_27_1098 : Poly :=
[
  term ((-15990341047530232698 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 27. -/
theorem ep_Q2_008_partial_27_1098_valid :
    mulPoly ep_Q2_008_coefficient_27_1098
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_1099 : Poly :=
[
  term ((1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1099 for generator 27. -/
def ep_Q2_008_partial_27_1099 : Poly :=
[
  term ((1145077892859441821928036850911497083007721 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 27. -/
theorem ep_Q2_008_partial_27_1099_valid :
    mulPoly ep_Q2_008_coefficient_27_1099
        ep_Q2_008_generator_27_1000_1099 =
      ep_Q2_008_partial_27_1099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_1000_1099 : List Poly :=
[
  ep_Q2_008_partial_27_1000,
  ep_Q2_008_partial_27_1001,
  ep_Q2_008_partial_27_1002,
  ep_Q2_008_partial_27_1003,
  ep_Q2_008_partial_27_1004,
  ep_Q2_008_partial_27_1005,
  ep_Q2_008_partial_27_1006,
  ep_Q2_008_partial_27_1007,
  ep_Q2_008_partial_27_1008,
  ep_Q2_008_partial_27_1009,
  ep_Q2_008_partial_27_1010,
  ep_Q2_008_partial_27_1011,
  ep_Q2_008_partial_27_1012,
  ep_Q2_008_partial_27_1013,
  ep_Q2_008_partial_27_1014,
  ep_Q2_008_partial_27_1015,
  ep_Q2_008_partial_27_1016,
  ep_Q2_008_partial_27_1017,
  ep_Q2_008_partial_27_1018,
  ep_Q2_008_partial_27_1019,
  ep_Q2_008_partial_27_1020,
  ep_Q2_008_partial_27_1021,
  ep_Q2_008_partial_27_1022,
  ep_Q2_008_partial_27_1023,
  ep_Q2_008_partial_27_1024,
  ep_Q2_008_partial_27_1025,
  ep_Q2_008_partial_27_1026,
  ep_Q2_008_partial_27_1027,
  ep_Q2_008_partial_27_1028,
  ep_Q2_008_partial_27_1029,
  ep_Q2_008_partial_27_1030,
  ep_Q2_008_partial_27_1031,
  ep_Q2_008_partial_27_1032,
  ep_Q2_008_partial_27_1033,
  ep_Q2_008_partial_27_1034,
  ep_Q2_008_partial_27_1035,
  ep_Q2_008_partial_27_1036,
  ep_Q2_008_partial_27_1037,
  ep_Q2_008_partial_27_1038,
  ep_Q2_008_partial_27_1039,
  ep_Q2_008_partial_27_1040,
  ep_Q2_008_partial_27_1041,
  ep_Q2_008_partial_27_1042,
  ep_Q2_008_partial_27_1043,
  ep_Q2_008_partial_27_1044,
  ep_Q2_008_partial_27_1045,
  ep_Q2_008_partial_27_1046,
  ep_Q2_008_partial_27_1047,
  ep_Q2_008_partial_27_1048,
  ep_Q2_008_partial_27_1049,
  ep_Q2_008_partial_27_1050,
  ep_Q2_008_partial_27_1051,
  ep_Q2_008_partial_27_1052,
  ep_Q2_008_partial_27_1053,
  ep_Q2_008_partial_27_1054,
  ep_Q2_008_partial_27_1055,
  ep_Q2_008_partial_27_1056,
  ep_Q2_008_partial_27_1057,
  ep_Q2_008_partial_27_1058,
  ep_Q2_008_partial_27_1059,
  ep_Q2_008_partial_27_1060,
  ep_Q2_008_partial_27_1061,
  ep_Q2_008_partial_27_1062,
  ep_Q2_008_partial_27_1063,
  ep_Q2_008_partial_27_1064,
  ep_Q2_008_partial_27_1065,
  ep_Q2_008_partial_27_1066,
  ep_Q2_008_partial_27_1067,
  ep_Q2_008_partial_27_1068,
  ep_Q2_008_partial_27_1069,
  ep_Q2_008_partial_27_1070,
  ep_Q2_008_partial_27_1071,
  ep_Q2_008_partial_27_1072,
  ep_Q2_008_partial_27_1073,
  ep_Q2_008_partial_27_1074,
  ep_Q2_008_partial_27_1075,
  ep_Q2_008_partial_27_1076,
  ep_Q2_008_partial_27_1077,
  ep_Q2_008_partial_27_1078,
  ep_Q2_008_partial_27_1079,
  ep_Q2_008_partial_27_1080,
  ep_Q2_008_partial_27_1081,
  ep_Q2_008_partial_27_1082,
  ep_Q2_008_partial_27_1083,
  ep_Q2_008_partial_27_1084,
  ep_Q2_008_partial_27_1085,
  ep_Q2_008_partial_27_1086,
  ep_Q2_008_partial_27_1087,
  ep_Q2_008_partial_27_1088,
  ep_Q2_008_partial_27_1089,
  ep_Q2_008_partial_27_1090,
  ep_Q2_008_partial_27_1091,
  ep_Q2_008_partial_27_1092,
  ep_Q2_008_partial_27_1093,
  ep_Q2_008_partial_27_1094,
  ep_Q2_008_partial_27_1095,
  ep_Q2_008_partial_27_1096,
  ep_Q2_008_partial_27_1097,
  ep_Q2_008_partial_27_1098,
  ep_Q2_008_partial_27_1099
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_1000_1099 : Poly :=
[
  term ((953959932847080112455247691396505600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-67691233380369168750352608841190400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-476979966423540056227623845698252800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((33845616690184584375176304420595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (15, 3), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 2), (15, 1), (16, 1)],
  term ((-541529867042953350002820870729523200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 2), (13, 1), (14, 2), (16, 1)],
  term ((135382466760738337500705217682380800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-30204641490743987674329474338919667200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((7551160372685996918582368584729916800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-324616352280720246004077586391961600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((81154088070180061501019396597990400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((1624589601128860050008462612188569600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-812294800564430025004231306094284800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((234997830172389375 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 1385912907228352718) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-234997830172389375 : Rat) / 692956453614176359) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((234997830172389375 : Rat) / 2771825814456705436) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((104231983788104767842792374250286694400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52115991894052383921396187125143347200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37606820821864993971785419732855115840700 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-187532765152567200 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-18803410410932496985892709866427557920350 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((93766382576283600 : Rat) / 692956453614176359) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-37632878817812020163746117826417687514300 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((9408219704453005040936529456604421878575 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((46883191288141800 : Rat) / 692956453614176359) [(3, 1), (9, 1), (14, 2), (16, 1)],
  term ((-11720797822035450 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)],
  term ((456014929072958359312216637345004288000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((626925074874997500 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8103643217349246000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-228007464536479179656108318672502144000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1712448266899812750 : Rat) / 692956453614176359) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3650644755659731197662327607016562380800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1825322377829865598831163803508281190400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((103109391071765856295069647304794928810500 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-51554695535882928147534823652397464405250 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-92288735645717763194139081367441344000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8119674356180215500 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((23072183911429440798534770341860336000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2029918589045053875 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((1216881585219910399220775869005520793600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-304220396304977599805193967251380198400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-952132201707085141053065602582340331471225 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((952132201707085141053065602582340331471225 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((5801112924707374156664664703367182010395200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-131477560505406378545331395792504678400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3702495305199141922483259462682665827200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2901482086179986863812953166549261671654400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((65738780252703189272665697896252339200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((3944326815162191356359941873775140352000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-8337968999043642000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-26205045425565732000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1972163407581095678179970936887570176000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((10720245855913254000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-690257192653383487362989827910649561600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2169379748339205245997968030576327193600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((887473533411493055180986921599406579200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-77565856637169575898480027550174524813000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-259276238057401875 : Rat) / 5543651628913410872) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((18372781880354946375 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((38782928318584787949240013775087262406500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-4528376410574386125 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1656608454440538544381049784308106654795000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((414152113610134636095262446077026663698750 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1051820484043251028362651166340037427200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-16675937998087284000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((262955121010812757090662791585009356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((4168984499521821000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1380514385306766974725979655821299123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((345128596326691743681494913955324780800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((140440122875626875 : Rat) / 692956453614176359) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1840816897985154886897607710097190912000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (14, 2), (15, 2), (16, 1)],
  term ((590045395144651875 : Rat) / 692956453614176359) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((460204224496288721724401927524297728000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-870925640895905625 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (16, 1)],
  term ((32427508511536494835311444571996652092800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((92709074334554646045 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2098172722829400554343369658956707270400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-21801334369016115771 : Rat) / 5543651628913410872) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-16738297436475597556241564700737502864000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-35453869982769265137 : Rat) / 11087303257826821744) [(3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12498295691085024323043398279586139488000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-43626607249082182398590523478423964812800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((17155799657813057761169330009399060947200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5861824190086830305797392056673292873687599 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-45254679055242762424165152025831208964000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((2342257115059933523187819114483993384345321 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1759783537513448391304786471094649744671139 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((22627339527621381212082576012915604482000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-24714096645725255886266259074960290195200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((12357048322862627943133129537480145097600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((887005920946627125 : Rat) / 692956453614176359) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((37883408541228639158522909260800774477600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((74231465260450796559 : Rat) / 5543651628913410872) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-9470852135307159789630727315200193619400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-88423559995596830559 : Rat) / 22174606515653643488) [(3, 1), (13, 1), (16, 1)],
  term ((-15481748445916588547966198430895074873600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((3870437111479147136991549607723768718400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36211257100033465820670033392404321341750 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2922184218949922417704873737678146734475197 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2342804105349386964574153203399677593007197 : Rat) / 2699321629621272246011853252143728875167968) [(3, 1), (15, 1), (16, 1)],
  term ((-1726539312076568003845011973608230400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((863269656038284001922505986804115200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-215817414009571000480626496701028800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3087102178037808000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((1543551089018904000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(3, 2), (4, 1), (10, 1), (16, 1)],
  term ((-7216820728734948900 : Rat) / 692956453614176359) [(3, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (4, 1), (12, 1), (16, 1)],
  term ((3608410364367474450 : Rat) / 692956453614176359) [(3, 2), (4, 1), (14, 2), (16, 1)],
  term ((-1804205182183737225 : Rat) / 1385912907228352718) [(3, 2), (4, 1), (16, 1)],
  term ((48789385395874675328416438830643200 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-618025807390458842612109558763660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-24394692697937337664208219415321600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((309012903695229421306054779381830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 2), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-214382095697070000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((107191047848535000 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-26797761962133750 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-15990341047530232698 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 692956453614176359) [(3, 2), (5, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((1145077892859441821928036850911497083007721 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1145077892859441821928036850911497083007721 : Rat) / 168707601851329515375740828258983054697998) [(3, 2), (5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 1000 through 1099. -/
theorem ep_Q2_008_block_27_1000_1099_valid :
    checkProductSumEq ep_Q2_008_partials_27_1000_1099
      ep_Q2_008_block_27_1000_1099 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
