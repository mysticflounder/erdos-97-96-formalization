/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 9:2000-2099

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_09_2000_2099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 2000 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2000 : Poly :=
[
  term ((-27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 2000 for generator 9. -/
def ep_Q1_009_partial_09_2000 : Poly :=
[
  term ((-54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2000 for generator 9. -/
theorem ep_Q1_009_partial_09_2000_valid :
    mulPoly ep_Q1_009_coefficient_09_2000
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2000 := by
  native_decide

/-- Coefficient term 2001 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2001 : Poly :=
[
  term ((-282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 316231187575497209268951088829091968445020625151509158557673920492555629138375590790558336) [(7, 2), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 2001 for generator 9. -/
def ep_Q1_009_partial_09_2001 : Poly :=
[
  term ((-282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 158115593787748604634475544414545984222510312575754579278836960246277814569187795395279168) [(2, 1), (7, 2), (9, 1), (12, 1), (13, 1)],
  term ((282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 316231187575497209268951088829091968445020625151509158557673920492555629138375590790558336) [(7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2001 for generator 9. -/
theorem ep_Q1_009_partial_09_2001_valid :
    mulPoly ep_Q1_009_coefficient_09_2001
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2001 := by
  native_decide

/-- Coefficient term 2002 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2002 : Poly :=
[
  term ((42957421548548565318080393395565600000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 2002 for generator 9. -/
def ep_Q1_009_partial_09_2002 : Poly :=
[
  term ((85914843097097130636160786791131200000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (7, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-42957421548548565318080393395565600000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2002 for generator 9. -/
theorem ep_Q1_009_partial_09_2002_valid :
    mulPoly ep_Q1_009_coefficient_09_2002
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2002 := by
  native_decide

/-- Coefficient term 2003 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2003 : Poly :=
[
  term ((-57639507530703502643168411877045644496462865859867767923940522403969259274301369819037995326671166551207572996037277 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 2003 for generator 9. -/
def ep_Q1_009_partial_09_2003 : Poly :=
[
  term ((-57639507530703502643168411877045644496462865859867767923940522403969259274301369819037995326671166551207572996037277 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1)],
  term ((57639507530703502643168411877045644496462865859867767923940522403969259274301369819037995326671166551207572996037277 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2003 for generator 9. -/
theorem ep_Q1_009_partial_09_2003_valid :
    mulPoly ep_Q1_009_coefficient_09_2003
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2003 := by
  native_decide

/-- Coefficient term 2004 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2004 : Poly :=
[
  term ((23320267409785460644907 : Rat) / 4676338877845046513121) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2004 for generator 9. -/
def ep_Q1_009_partial_09_2004 : Poly :=
[
  term ((46640534819570921289814 : Rat) / 4676338877845046513121) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-23320267409785460644907 : Rat) / 4676338877845046513121) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2004 for generator 9. -/
theorem ep_Q1_009_partial_09_2004_valid :
    mulPoly ep_Q1_009_coefficient_09_2004
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2004 := by
  native_decide

/-- Coefficient term 2005 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2005 : Poly :=
[
  term ((341941075526446579931919931428702176000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (12, 1), (15, 3)]
]

/-- Partial product 2005 for generator 9. -/
def ep_Q1_009_partial_09_2005 : Poly :=
[
  term ((683882151052893159863839862857404352000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 3)],
  term ((-341941075526446579931919931428702176000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2005 for generator 9. -/
theorem ep_Q1_009_partial_09_2005_valid :
    mulPoly ep_Q1_009_coefficient_09_2005
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2005 := by
  native_decide

/-- Coefficient term 2006 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2006 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 948693562726491627806853266487275905335061875454527475673021761477666887415126772371675008) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 2006 for generator 9. -/
def ep_Q1_009_partial_09_2006 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 948693562726491627806853266487275905335061875454527475673021761477666887415126772371675008) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2006 for generator 9. -/
theorem ep_Q1_009_partial_09_2006_valid :
    mulPoly ep_Q1_009_coefficient_09_2006
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2006 := by
  native_decide

/-- Coefficient term 2007 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2007 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 263525989646247674390792574024243307037517187626257632131394933743796357615312992325465280) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 2007 for generator 9. -/
def ep_Q1_009_partial_09_2007 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 131762994823123837195396287012121653518758593813128816065697466871898178807656496162732640) [(2, 1), (7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 263525989646247674390792574024243307037517187626257632131394933743796357615312992325465280) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2007 for generator 9. -/
theorem ep_Q1_009_partial_09_2007_valid :
    mulPoly ep_Q1_009_coefficient_09_2007
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2007 := by
  native_decide

/-- Coefficient term 2008 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2008 : Poly :=
[
  term ((-3436593723883885225446431471645248000 : Rat) / 238235207258979625923591009726343894571) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 2008 for generator 9. -/
def ep_Q1_009_partial_09_2008 : Poly :=
[
  term ((-6873187447767770450892862943290496000 : Rat) / 238235207258979625923591009726343894571) [(2, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3436593723883885225446431471645248000 : Rat) / 238235207258979625923591009726343894571) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2008 for generator 9. -/
theorem ep_Q1_009_partial_09_2008_valid :
    mulPoly ep_Q1_009_coefficient_09_2008
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2008 := by
  native_decide

/-- Coefficient term 2009 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2009 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (13, 1), (14, 2)]
]

/-- Partial product 2009 for generator 9. -/
def ep_Q1_009_partial_09_2009 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 59293347670405726737928329155454744083441367215907967229563860092354180463445423273229688) [(2, 1), (7, 2), (9, 1), (13, 1), (14, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2009 for generator 9. -/
theorem ep_Q1_009_partial_09_2009_valid :
    mulPoly ep_Q1_009_coefficient_09_2009
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2009 := by
  native_decide

/-- Coefficient term 2010 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2010 : Poly :=
[
  term ((-68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 2010 for generator 9. -/
def ep_Q1_009_partial_09_2010 : Poly :=
[
  term ((-137463748955355409017857258865809920000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2010 for generator 9. -/
theorem ep_Q1_009_partial_09_2010_valid :
    mulPoly ep_Q1_009_coefficient_09_2010
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2010 := by
  native_decide

/-- Coefficient term 2011 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2011 : Poly :=
[
  term ((-8591484309709713063616078679113120000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 2011 for generator 9. -/
def ep_Q1_009_partial_09_2011 : Poly :=
[
  term ((-17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (13, 1), (15, 2)],
  term ((8591484309709713063616078679113120000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2011 for generator 9. -/
theorem ep_Q1_009_partial_09_2011_valid :
    mulPoly ep_Q1_009_coefficient_09_2011
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2011 := by
  native_decide

/-- Coefficient term 2012 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2012 : Poly :=
[
  term ((-153135456779592752828495658293896247792916285532250563347796077664330935536475294747612897447764969572061908469519 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 2012 for generator 9. -/
def ep_Q1_009_partial_09_2012 : Poly :=
[
  term ((-153135456779592752828495658293896247792916285532250563347796077664330935536475294747612897447764969572061908469519 : Rat) / 59137669793495042103753480166868411190671773959282368291844414410337545865199133738730577938000788573727032949312) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 1)],
  term ((153135456779592752828495658293896247792916285532250563347796077664330935536475294747612897447764969572061908469519 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2012 for generator 9. -/
theorem ep_Q1_009_partial_09_2012_valid :
    mulPoly ep_Q1_009_coefficient_09_2012
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2012 := by
  native_decide

/-- Coefficient term 2013 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2013 : Poly :=
[
  term ((-244412569966854462264 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2013 for generator 9. -/
def ep_Q1_009_partial_09_2013 : Poly :=
[
  term ((-488825139933708924528 : Rat) / 519593208649449612569) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((244412569966854462264 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2013 for generator 9. -/
theorem ep_Q1_009_partial_09_2013_valid :
    mulPoly ep_Q1_009_coefficient_09_2013
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2013 := by
  native_decide

/-- Coefficient term 2014 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2014 : Poly :=
[
  term ((34365937238838852254464314716452480000 : Rat) / 238235207258979625923591009726343894571) [(7, 2), (9, 1), (14, 1), (15, 3)]
]

/-- Partial product 2014 for generator 9. -/
def ep_Q1_009_partial_09_2014 : Poly :=
[
  term ((68731874477677704508928629432904960000 : Rat) / 238235207258979625923591009726343894571) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 3)],
  term ((-34365937238838852254464314716452480000 : Rat) / 238235207258979625923591009726343894571) [(7, 2), (9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2014 for generator 9. -/
theorem ep_Q1_009_partial_09_2014_valid :
    mulPoly ep_Q1_009_coefficient_09_2014
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2014 := by
  native_decide

/-- Coefficient term 2015 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2015 : Poly :=
[
  term ((2994998780494701206726213073764359070080887433913848225721854799782769731393475869941367733 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 2015 for generator 9. -/
def ep_Q1_009_partial_09_2015 : Poly :=
[
  term ((2994998780494701206726213073764359070080887433913848225721854799782769731393475869941367733 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-2994998780494701206726213073764359070080887433913848225721854799782769731393475869941367733 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2015 for generator 9. -/
theorem ep_Q1_009_partial_09_2015_valid :
    mulPoly ep_Q1_009_coefficient_09_2015
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2015 := by
  native_decide

/-- Coefficient term 2016 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2016 : Poly :=
[
  term ((-91069733682922958474330433998599072000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (15, 3)]
]

/-- Partial product 2016 for generator 9. -/
def ep_Q1_009_partial_09_2016 : Poly :=
[
  term ((-182139467365845916948660867997198144000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (15, 3)],
  term ((91069733682922958474330433998599072000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2016 for generator 9. -/
theorem ep_Q1_009_partial_09_2016_valid :
    mulPoly ep_Q1_009_coefficient_09_2016
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2016 := by
  native_decide

/-- Coefficient term 2017 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2017 : Poly :=
[
  term ((-39365782486223054704561024498303645170824488194309076126775050937911865745753414975599472908761715 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2017 for generator 9. -/
def ep_Q1_009_partial_09_2017 : Poly :=
[
  term ((-39365782486223054704561024498303645170824488194309076126775050937911865745753414975599472908761715 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(2, 1), (7, 2), (11, 1), (12, 1), (15, 1)],
  term ((39365782486223054704561024498303645170824488194309076126775050937911865745753414975599472908761715 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2017 for generator 9. -/
theorem ep_Q1_009_partial_09_2017_valid :
    mulPoly ep_Q1_009_coefficient_09_2017
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2017 := by
  native_decide

/-- Coefficient term 2018 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2018 : Poly :=
[
  term ((-16646870 : Rat) / 3536493) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2018 for generator 9. -/
def ep_Q1_009_partial_09_2018 : Poly :=
[
  term ((-33293740 : Rat) / 3536493) [(2, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16646870 : Rat) / 3536493) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2018 for generator 9. -/
theorem ep_Q1_009_partial_09_2018_valid :
    mulPoly ep_Q1_009_coefficient_09_2018
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2018 := by
  native_decide

/-- Coefficient term 2019 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2019 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(7, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 2019 for generator 9. -/
def ep_Q1_009_partial_09_2019 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 80018130194773040947693107834923422139839731762379199400193996631557270299770751854156934435276) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(7, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2019 for generator 9. -/
theorem ep_Q1_009_partial_09_2019_valid :
    mulPoly ep_Q1_009_coefficient_09_2019
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2019 := by
  native_decide

/-- Coefficient term 2020 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2020 : Poly :=
[
  term ((-4592240 : Rat) / 3536493) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2020 for generator 9. -/
def ep_Q1_009_partial_09_2020 : Poly :=
[
  term ((-9184480 : Rat) / 3536493) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((4592240 : Rat) / 3536493) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2020 for generator 9. -/
theorem ep_Q1_009_partial_09_2020_valid :
    mulPoly ep_Q1_009_coefficient_09_2020
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2020 := by
  native_decide

/-- Coefficient term 2021 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2021 : Poly :=
[
  term ((233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(7, 2), (12, 1)]
]

/-- Partial product 2021 for generator 9. -/
def ep_Q1_009_partial_09_2021 : Poly :=
[
  term ((233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(2, 1), (7, 2), (12, 1)],
  term ((-233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2021 for generator 9. -/
theorem ep_Q1_009_partial_09_2021_valid :
    mulPoly ep_Q1_009_coefficient_09_2021
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2021 := by
  native_decide

/-- Coefficient term 2022 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2022 : Poly :=
[
  term ((33963500299091372064333580411159781722064529169833124822179559797155245186869725822421264295668535 : Rat) / 853526722077579103442059816905849836158290472132044793602069297403277549864221353111007300642944) [(7, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2022 for generator 9. -/
def ep_Q1_009_partial_09_2022 : Poly :=
[
  term ((33963500299091372064333580411159781722064529169833124822179559797155245186869725822421264295668535 : Rat) / 426763361038789551721029908452924918079145236066022396801034648701638774932110676555503650321472) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-33963500299091372064333580411159781722064529169833124822179559797155245186869725822421264295668535 : Rat) / 853526722077579103442059816905849836158290472132044793602069297403277549864221353111007300642944) [(7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2022 for generator 9. -/
theorem ep_Q1_009_partial_09_2022_valid :
    mulPoly ep_Q1_009_coefficient_09_2022
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2022 := by
  native_decide

/-- Coefficient term 2023 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2023 : Poly :=
[
  term ((7175375 : Rat) / 1178831) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2023 for generator 9. -/
def ep_Q1_009_partial_09_2023 : Poly :=
[
  term ((14350750 : Rat) / 1178831) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-7175375 : Rat) / 1178831) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2023 for generator 9. -/
theorem ep_Q1_009_partial_09_2023_valid :
    mulPoly ep_Q1_009_coefficient_09_2023
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2023 := by
  native_decide

/-- Coefficient term 2024 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2024 : Poly :=
[
  term ((16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 2), (12, 1), (14, 1)]
]

/-- Partial product 2024 for generator 9. -/
def ep_Q1_009_partial_09_2024 : Poly :=
[
  term ((33678783694041290823715891686000221497991304292471905070916623736187500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (7, 2), (12, 1), (14, 1)],
  term ((-16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2024 for generator 9. -/
theorem ep_Q1_009_partial_09_2024_valid :
    mulPoly ep_Q1_009_coefficient_09_2024
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2024 := by
  native_decide

/-- Coefficient term 2025 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2025 : Poly :=
[
  term ((22076823203516692130406120213558280775551905786458251762179023862596062299495278611326081620208935241957538967789 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 2), (12, 1), (15, 2)]
]

/-- Partial product 2025 for generator 9. -/
def ep_Q1_009_partial_09_2025 : Poly :=
[
  term ((22076823203516692130406120213558280775551905786458251762179023862596062299495278611326081620208935241957538967789 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(2, 1), (7, 2), (12, 1), (15, 2)],
  term ((-22076823203516692130406120213558280775551905786458251762179023862596062299495278611326081620208935241957538967789 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2025 for generator 9. -/
theorem ep_Q1_009_partial_09_2025_valid :
    mulPoly ep_Q1_009_coefficient_09_2025
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2025 := by
  native_decide

/-- Coefficient term 2026 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2026 : Poly :=
[
  term ((4835480129548263620182 : Rat) / 290243508153948313977) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2026 for generator 9. -/
def ep_Q1_009_partial_09_2026 : Poly :=
[
  term ((9670960259096527240364 : Rat) / 290243508153948313977) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4835480129548263620182 : Rat) / 290243508153948313977) [(7, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2026 for generator 9. -/
theorem ep_Q1_009_partial_09_2026_valid :
    mulPoly ep_Q1_009_coefficient_09_2026
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2026 := by
  native_decide

/-- Coefficient term 2027 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2027 : Poly :=
[
  term ((1179091783 : Rat) / 99021804) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 2027 for generator 9. -/
def ep_Q1_009_partial_09_2027 : Poly :=
[
  term ((1179091783 : Rat) / 49510902) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((-1179091783 : Rat) / 99021804) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2027 for generator 9. -/
theorem ep_Q1_009_partial_09_2027_valid :
    mulPoly ep_Q1_009_coefficient_09_2027
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2027 := by
  native_decide

/-- Coefficient term 2028 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2028 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2028 for generator 9. -/
def ep_Q1_009_partial_09_2028 : Poly :=
[
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 71127226839798258620171651408820819679857539344337066133505774783606462488685112759250608386912) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2028 for generator 9. -/
theorem ep_Q1_009_partial_09_2028_valid :
    mulPoly ep_Q1_009_coefficient_09_2028
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2028 := by
  native_decide

/-- Coefficient term 2029 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2029 : Poly :=
[
  term ((-1722090 : Rat) / 1178831) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2029 for generator 9. -/
def ep_Q1_009_partial_09_2029 : Poly :=
[
  term ((-3444180 : Rat) / 1178831) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1722090 : Rat) / 1178831) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2029 for generator 9. -/
theorem ep_Q1_009_partial_09_2029_valid :
    mulPoly ep_Q1_009_coefficient_09_2029
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2029 := by
  native_decide

/-- Coefficient term 2030 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2030 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 2030 for generator 9. -/
def ep_Q1_009_partial_09_2030 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(2, 1), (7, 2), (13, 1), (14, 2), (15, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2030 for generator 9. -/
theorem ep_Q1_009_partial_09_2030_valid :
    mulPoly ep_Q1_009_coefficient_09_2030
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2030 := by
  native_decide

/-- Coefficient term 2031 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2031 : Poly :=
[
  term ((-11480600 : Rat) / 3536493) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 2031 for generator 9. -/
def ep_Q1_009_partial_09_2031 : Poly :=
[
  term ((-22961200 : Rat) / 3536493) [(2, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11480600 : Rat) / 3536493) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2031 for generator 9. -/
theorem ep_Q1_009_partial_09_2031_valid :
    mulPoly ep_Q1_009_coefficient_09_2031
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2031 := by
  native_decide

/-- Coefficient term 2032 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2032 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 2032 for generator 9. -/
def ep_Q1_009_partial_09_2032 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2032 for generator 9. -/
theorem ep_Q1_009_partial_09_2032_valid :
    mulPoly ep_Q1_009_coefficient_09_2032
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2032 := by
  native_decide

/-- Coefficient term 2033 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2033 : Poly :=
[
  term ((-1435075 : Rat) / 3536493) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2033 for generator 9. -/
def ep_Q1_009_partial_09_2033 : Poly :=
[
  term ((-2870150 : Rat) / 3536493) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1435075 : Rat) / 3536493) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2033 for generator 9. -/
theorem ep_Q1_009_partial_09_2033_valid :
    mulPoly ep_Q1_009_coefficient_09_2033
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2033 := by
  native_decide

/-- Coefficient term 2034 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2034 : Poly :=
[
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(7, 2), (14, 1)]
]

/-- Partial product 2034 for generator 9. -/
def ep_Q1_009_partial_09_2034 : Poly :=
[
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 379747058551465279073797799894551833883985167685867386983971509437898909897217127443456637997920) [(2, 1), (7, 2), (14, 1)],
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2034 for generator 9. -/
theorem ep_Q1_009_partial_09_2034_valid :
    mulPoly ep_Q1_009_coefficient_09_2034
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2034 := by
  native_decide

/-- Coefficient term 2035 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2035 : Poly :=
[
  term ((557252208908276297845227778739634191785703743160753341655182777802980266574932856082899745329373817098714813807 : Rat) / 5837482455993753485177667102535005448628636079573073974309957855279747755846165778989191998485030689576537568) [(7, 2), (14, 1), (15, 2)]
]

/-- Partial product 2035 for generator 9. -/
def ep_Q1_009_partial_09_2035 : Poly :=
[
  term ((557252208908276297845227778739634191785703743160753341655182777802980266574932856082899745329373817098714813807 : Rat) / 2918741227996876742588833551267502724314318039786536987154978927639873877923082889494595999242515344788268784) [(2, 1), (7, 2), (14, 1), (15, 2)],
  term ((-557252208908276297845227778739634191785703743160753341655182777802980266574932856082899745329373817098714813807 : Rat) / 5837482455993753485177667102535005448628636079573073974309957855279747755846165778989191998485030689576537568) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2035 for generator 9. -/
theorem ep_Q1_009_partial_09_2035_valid :
    mulPoly ep_Q1_009_coefficient_09_2035
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2035 := by
  native_decide

/-- Coefficient term 2036 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2036 : Poly :=
[
  term ((1409157355467247472796 : Rat) / 96747836051316104659) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2036 for generator 9. -/
def ep_Q1_009_partial_09_2036 : Poly :=
[
  term ((2818314710934494945592 : Rat) / 96747836051316104659) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1409157355467247472796 : Rat) / 96747836051316104659) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2036 for generator 9. -/
theorem ep_Q1_009_partial_09_2036_valid :
    mulPoly ep_Q1_009_coefficient_09_2036
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2036 := by
  native_decide

/-- Coefficient term 2037 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2037 : Poly :=
[
  term ((1492478 : Rat) / 24755451) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 2037 for generator 9. -/
def ep_Q1_009_partial_09_2037 : Poly :=
[
  term ((2984956 : Rat) / 24755451) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-1492478 : Rat) / 24755451) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2037 for generator 9. -/
theorem ep_Q1_009_partial_09_2037_valid :
    mulPoly ep_Q1_009_coefficient_09_2037
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2037 := by
  native_decide

/-- Coefficient term 2038 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2038 : Poly :=
[
  term ((-71944361095511099977301182703796317036334409458564863266175093093425133949135551507130071178081755 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (15, 2)]
]

/-- Partial product 2038 for generator 9. -/
def ep_Q1_009_partial_09_2038 : Poly :=
[
  term ((-71944361095511099977301182703796317036334409458564863266175093093425133949135551507130071178081755 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(2, 1), (7, 2), (15, 2)],
  term ((71944361095511099977301182703796317036334409458564863266175093093425133949135551507130071178081755 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2038 for generator 9. -/
theorem ep_Q1_009_partial_09_2038_valid :
    mulPoly ep_Q1_009_coefficient_09_2038
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2038 := by
  native_decide

/-- Coefficient term 2039 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2039 : Poly :=
[
  term ((-15211795 : Rat) / 3536493) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 2039 for generator 9. -/
def ep_Q1_009_partial_09_2039 : Poly :=
[
  term ((-30423590 : Rat) / 3536493) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((15211795 : Rat) / 3536493) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2039 for generator 9. -/
theorem ep_Q1_009_partial_09_2039_valid :
    mulPoly ep_Q1_009_coefficient_09_2039
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2039 := by
  native_decide

/-- Coefficient term 2040 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2040 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 3), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 2040 for generator 9. -/
def ep_Q1_009_partial_09_2040 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(2, 1), (7, 3), (8, 1), (12, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 3), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2040 for generator 9. -/
theorem ep_Q1_009_partial_09_2040_valid :
    mulPoly ep_Q1_009_coefficient_09_2040
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2040 := by
  native_decide

/-- Coefficient term 2041 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2041 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(7, 3), (9, 1), (12, 1)]
]

/-- Partial product 2041 for generator 9. -/
def ep_Q1_009_partial_09_2041 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(2, 1), (7, 3), (9, 1), (12, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(7, 3), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2041 for generator 9. -/
theorem ep_Q1_009_partial_09_2041_valid :
    mulPoly ep_Q1_009_coefficient_09_2041
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2041 := by
  native_decide

/-- Coefficient term 2042 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2042 : Poly :=
[
  term ((6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(7, 3), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 2042 for generator 9. -/
def ep_Q1_009_partial_09_2042 : Poly :=
[
  term ((13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (7, 3), (9, 1), (12, 1), (15, 2)],
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(7, 3), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2042 for generator 9. -/
theorem ep_Q1_009_partial_09_2042_valid :
    mulPoly ep_Q1_009_coefficient_09_2042
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2042 := by
  native_decide

/-- Coefficient term 2043 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2043 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(7, 3), (12, 1), (15, 1)]
]

/-- Partial product 2043 for generator 9. -/
def ep_Q1_009_partial_09_2043 : Poly :=
[
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(2, 1), (7, 3), (12, 1), (15, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(7, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2043 for generator 9. -/
theorem ep_Q1_009_partial_09_2043_valid :
    mulPoly ep_Q1_009_coefficient_09_2043
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2043 := by
  native_decide

/-- Coefficient term 2044 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2044 : Poly :=
[
  term ((1148060 : Rat) / 1178831) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2044 for generator 9. -/
def ep_Q1_009_partial_09_2044 : Poly :=
[
  term ((2296120 : Rat) / 1178831) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-1148060 : Rat) / 1178831) [(7, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2044 for generator 9. -/
theorem ep_Q1_009_partial_09_2044_valid :
    mulPoly ep_Q1_009_coefficient_09_2044
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2044 := by
  native_decide

/-- Coefficient term 2045 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2045 : Poly :=
[
  term ((5532535653259266684495236042636825358755467556413414157137376570868900 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2045 for generator 9. -/
def ep_Q1_009_partial_09_2045 : Poly :=
[
  term ((11065071306518533368990472085273650717510935112826828314274753141737800 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-5532535653259266684495236042636825358755467556413414157137376570868900 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2045 for generator 9. -/
theorem ep_Q1_009_partial_09_2045_valid :
    mulPoly ep_Q1_009_coefficient_09_2045
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2045 := by
  native_decide

/-- Coefficient term 2046 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2046 : Poly :=
[
  term ((-81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 2046 for generator 9. -/
def ep_Q1_009_partial_09_2046 : Poly :=
[
  term ((-163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2046 for generator 9. -/
theorem ep_Q1_009_partial_09_2046_valid :
    mulPoly ep_Q1_009_coefficient_09_2046
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2046 := by
  native_decide

/-- Coefficient term 2047 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2047 : Poly :=
[
  term ((806123093943420706238297175500980 : Rat) / 10306817152083683685026217919314591) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 2047 for generator 9. -/
def ep_Q1_009_partial_09_2047 : Poly :=
[
  term ((1612246187886841412476594351001960 : Rat) / 10306817152083683685026217919314591) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-806123093943420706238297175500980 : Rat) / 10306817152083683685026217919314591) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2047 for generator 9. -/
theorem ep_Q1_009_partial_09_2047_valid :
    mulPoly ep_Q1_009_coefficient_09_2047
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2047 := by
  native_decide

/-- Coefficient term 2048 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2048 : Poly :=
[
  term ((-359873384433192111618510834046086853084480089746976379384697160244317867036791355418431311257517 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2048 for generator 9. -/
def ep_Q1_009_partial_09_2048 : Poly :=
[
  term ((-359873384433192111618510834046086853084480089746976379384697160244317867036791355418431311257517 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((359873384433192111618510834046086853084480089746976379384697160244317867036791355418431311257517 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2048 for generator 9. -/
theorem ep_Q1_009_partial_09_2048_valid :
    mulPoly ep_Q1_009_coefficient_09_2048
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2048 := by
  native_decide

/-- Coefficient term 2049 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2049 : Poly :=
[
  term ((3175370704805820647963309607925076 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 2049 for generator 9. -/
def ep_Q1_009_partial_09_2049 : Poly :=
[
  term ((6350741409611641295926619215850152 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-3175370704805820647963309607925076 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2049 for generator 9. -/
theorem ep_Q1_009_partial_09_2049_valid :
    mulPoly ep_Q1_009_coefficient_09_2049
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2049 := by
  native_decide

/-- Coefficient term 2050 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2050 : Poly :=
[
  term ((-88516020981370437777855664714930977407491414682892325194291842612604826081582522917451667291419 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2050 for generator 9. -/
def ep_Q1_009_partial_09_2050 : Poly :=
[
  term ((-88516020981370437777855664714930977407491414682892325194291842612604826081582522917451667291419 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((88516020981370437777855664714930977407491414682892325194291842612604826081582522917451667291419 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2050 for generator 9. -/
theorem ep_Q1_009_partial_09_2050_valid :
    mulPoly ep_Q1_009_coefficient_09_2050
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2050 := by
  native_decide

/-- Coefficient term 2051 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2051 : Poly :=
[
  term ((-2556264047432079283323745561211228 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 2051 for generator 9. -/
def ep_Q1_009_partial_09_2051 : Poly :=
[
  term ((-5112528094864158566647491122422456 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2556264047432079283323745561211228 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2051 for generator 9. -/
theorem ep_Q1_009_partial_09_2051_valid :
    mulPoly ep_Q1_009_coefficient_09_2051
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2051 := by
  native_decide

/-- Coefficient term 2052 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2052 : Poly :=
[
  term ((7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 3672955565631120738816146619391347650851799556590253967849734285487704764252761319529279525888) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 2052 for generator 9. -/
def ep_Q1_009_partial_09_2052 : Poly :=
[
  term ((7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 1836477782815560369408073309695673825425899778295126983924867142743852382126380659764639762944) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 3672955565631120738816146619391347650851799556590253967849734285487704764252761319529279525888) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2052 for generator 9. -/
theorem ep_Q1_009_partial_09_2052_valid :
    mulPoly ep_Q1_009_coefficient_09_2052
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2052 := by
  native_decide

/-- Coefficient term 2053 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2053 : Poly :=
[
  term ((69651949980555628021284439576800 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 2053 for generator 9. -/
def ep_Q1_009_partial_09_2053 : Poly :=
[
  term ((139303899961111256042568879153600 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-69651949980555628021284439576800 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2053 for generator 9. -/
theorem ep_Q1_009_partial_09_2053_valid :
    mulPoly ep_Q1_009_coefficient_09_2053
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2053 := by
  native_decide

/-- Coefficient term 2054 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2054 : Poly :=
[
  term ((2332745824089091189416886543874293 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 2054 for generator 9. -/
def ep_Q1_009_partial_09_2054 : Poly :=
[
  term ((4665491648178182378833773087748586 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2332745824089091189416886543874293 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2054 for generator 9. -/
theorem ep_Q1_009_partial_09_2054_valid :
    mulPoly ep_Q1_009_coefficient_09_2054
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2054 := by
  native_decide

/-- Coefficient term 2055 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2055 : Poly :=
[
  term ((-92279263095840480531747409170888015052562875392664863540511276443789430685314755283388399009677 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (12, 1)]
]

/-- Partial product 2055 for generator 9. -/
def ep_Q1_009_partial_09_2055 : Poly :=
[
  term ((-92279263095840480531747409170888015052562875392664863540511276443789430685314755283388399009677 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (8, 1), (12, 1)],
  term ((92279263095840480531747409170888015052562875392664863540511276443789430685314755283388399009677 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2055 for generator 9. -/
theorem ep_Q1_009_partial_09_2055_valid :
    mulPoly ep_Q1_009_coefficient_09_2055
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2055 := by
  native_decide

/-- Coefficient term 2056 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2056 : Poly :=
[
  term ((-131854414537728319805200220865244181414143786916416833161387406168719384196197907436363365226391 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2056 for generator 9. -/
def ep_Q1_009_partial_09_2056 : Poly :=
[
  term ((-131854414537728319805200220865244181414143786916416833161387406168719384196197907436363365226391 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((131854414537728319805200220865244181414143786916416833161387406168719384196197907436363365226391 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2056 for generator 9. -/
theorem ep_Q1_009_partial_09_2056_valid :
    mulPoly ep_Q1_009_coefficient_09_2056
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2056 := by
  native_decide

/-- Coefficient term 2057 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2057 : Poly :=
[
  term ((1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 2057 for generator 9. -/
def ep_Q1_009_partial_09_2057 : Poly :=
[
  term ((2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2057 for generator 9. -/
theorem ep_Q1_009_partial_09_2057_valid :
    mulPoly ep_Q1_009_coefficient_09_2057
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2057 := by
  native_decide

/-- Coefficient term 2058 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2058 : Poly :=
[
  term ((124753201749108786047625112091097165727649267985547773288530337346661812276652929920681619156165 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2058 for generator 9. -/
def ep_Q1_009_partial_09_2058 : Poly :=
[
  term ((124753201749108786047625112091097165727649267985547773288530337346661812276652929920681619156165 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-124753201749108786047625112091097165727649267985547773288530337346661812276652929920681619156165 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2058 for generator 9. -/
theorem ep_Q1_009_partial_09_2058_valid :
    mulPoly ep_Q1_009_coefficient_09_2058
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2058 := by
  native_decide

/-- Coefficient term 2059 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2059 : Poly :=
[
  term ((222040574536872137851310347809396 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 2059 for generator 9. -/
def ep_Q1_009_partial_09_2059 : Poly :=
[
  term ((444081149073744275702620695618792 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-222040574536872137851310347809396 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2059 for generator 9. -/
theorem ep_Q1_009_partial_09_2059_valid :
    mulPoly ep_Q1_009_coefficient_09_2059
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2059 := by
  native_decide

/-- Coefficient term 2060 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2060 : Poly :=
[
  term ((5590323139776023780526294293584702498791468201982799098500525942354660 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 2060 for generator 9. -/
def ep_Q1_009_partial_09_2060 : Poly :=
[
  term ((11180646279552047561052588587169404997582936403965598197001051884709320 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (8, 1), (12, 1), (13, 2)],
  term ((-5590323139776023780526294293584702498791468201982799098500525942354660 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2060 for generator 9. -/
theorem ep_Q1_009_partial_09_2060_valid :
    mulPoly ep_Q1_009_coefficient_09_2060
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2060 := by
  native_decide

/-- Coefficient term 2061 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2061 : Poly :=
[
  term ((468086615099019361379748935638166356792098357654495617427532075321107306392384392050834243082609 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(8, 1), (12, 1), (14, 1)]
]

/-- Partial product 2061 for generator 9. -/
def ep_Q1_009_partial_09_2061 : Poly :=
[
  term ((468086615099019361379748935638166356792098357654495617427532075321107306392384392050834243082609 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (8, 1), (12, 1), (14, 1)],
  term ((-468086615099019361379748935638166356792098357654495617427532075321107306392384392050834243082609 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2061 for generator 9. -/
theorem ep_Q1_009_partial_09_2061_valid :
    mulPoly ep_Q1_009_coefficient_09_2061
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2061 := by
  native_decide

/-- Coefficient term 2062 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2062 : Poly :=
[
  term ((212130366472793952268719667077374306538755645055281098670172912869507034916676790366796781971345 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 2062 for generator 9. -/
def ep_Q1_009_partial_09_2062 : Poly :=
[
  term ((212130366472793952268719667077374306538755645055281098670172912869507034916676790366796781971345 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-212130366472793952268719667077374306538755645055281098670172912869507034916676790366796781971345 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2062 for generator 9. -/
theorem ep_Q1_009_partial_09_2062_valid :
    mulPoly ep_Q1_009_coefficient_09_2062
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2062 := by
  native_decide

/-- Coefficient term 2063 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2063 : Poly :=
[
  term ((112157181185961069034232320539432 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 1), (14, 2), (15, 2)]
]

/-- Partial product 2063 for generator 9. -/
def ep_Q1_009_partial_09_2063 : Poly :=
[
  term ((224314362371922138068464641078864 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-112157181185961069034232320539432 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2063 for generator 9. -/
theorem ep_Q1_009_partial_09_2063_valid :
    mulPoly ep_Q1_009_coefficient_09_2063
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2063 := by
  native_decide

/-- Coefficient term 2064 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2064 : Poly :=
[
  term ((11293777743291126957050253316098812923169489644474653314123213828612043956583539692784806743288979 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 2064 for generator 9. -/
def ep_Q1_009_partial_09_2064 : Poly :=
[
  term ((11293777743291126957050253316098812923169489644474653314123213828612043956583539692784806743288979 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-11293777743291126957050253316098812923169489644474653314123213828612043956583539692784806743288979 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2064 for generator 9. -/
theorem ep_Q1_009_partial_09_2064_valid :
    mulPoly ep_Q1_009_coefficient_09_2064
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2064 := by
  native_decide

/-- Coefficient term 2065 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2065 : Poly :=
[
  term ((-3072884378044006216595937508053292 : Rat) / 30920451456251051055078653757943773) [(8, 1), (12, 1), (15, 4)]
]

/-- Partial product 2065 for generator 9. -/
def ep_Q1_009_partial_09_2065 : Poly :=
[
  term ((-6145768756088012433191875016106584 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (12, 1), (15, 4)],
  term ((3072884378044006216595937508053292 : Rat) / 30920451456251051055078653757943773) [(8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2065 for generator 9. -/
theorem ep_Q1_009_partial_09_2065_valid :
    mulPoly ep_Q1_009_coefficient_09_2065
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2065 := by
  native_decide

/-- Coefficient term 2066 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2066 : Poly :=
[
  term ((89757405835365635399493850659843818455269413739055437199193729642966511468604740490292810642317 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (12, 2)]
]

/-- Partial product 2066 for generator 9. -/
def ep_Q1_009_partial_09_2066 : Poly :=
[
  term ((89757405835365635399493850659843818455269413739055437199193729642966511468604740490292810642317 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (12, 2)],
  term ((-89757405835365635399493850659843818455269413739055437199193729642966511468604740490292810642317 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2066 for generator 9. -/
theorem ep_Q1_009_partial_09_2066_valid :
    mulPoly ep_Q1_009_coefficient_09_2066
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2066 := by
  native_decide

/-- Coefficient term 2067 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2067 : Poly :=
[
  term ((-1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(8, 1), (12, 2), (14, 1), (15, 2)]
]

/-- Partial product 2067 for generator 9. -/
def ep_Q1_009_partial_09_2067 : Poly :=
[
  term ((-2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(8, 1), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2067 for generator 9. -/
theorem ep_Q1_009_partial_09_2067_valid :
    mulPoly ep_Q1_009_coefficient_09_2067
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2067 := by
  native_decide

/-- Coefficient term 2068 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2068 : Poly :=
[
  term ((132088673583336955234329236512759224154091682152866935586762715689845035915689600008384111135127 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (12, 2), (15, 2)]
]

/-- Partial product 2068 for generator 9. -/
def ep_Q1_009_partial_09_2068 : Poly :=
[
  term ((132088673583336955234329236512759224154091682152866935586762715689845035915689600008384111135127 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (8, 1), (12, 2), (15, 2)],
  term ((-132088673583336955234329236512759224154091682152866935586762715689845035915689600008384111135127 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2068 for generator 9. -/
theorem ep_Q1_009_partial_09_2068_valid :
    mulPoly ep_Q1_009_coefficient_09_2068
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2068 := by
  native_decide

/-- Coefficient term 2069 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2069 : Poly :=
[
  term ((44429701959552420391646628580501650867048154004748220322412598146609859173895811707769877850031 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2069 for generator 9. -/
def ep_Q1_009_partial_09_2069 : Poly :=
[
  term ((44429701959552420391646628580501650867048154004748220322412598146609859173895811707769877850031 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-44429701959552420391646628580501650867048154004748220322412598146609859173895811707769877850031 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2069 for generator 9. -/
theorem ep_Q1_009_partial_09_2069_valid :
    mulPoly ep_Q1_009_coefficient_09_2069
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2069 := by
  native_decide

/-- Coefficient term 2070 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2070 : Poly :=
[
  term ((3809603652931488424121817636528028 : Rat) / 30920451456251051055078653757943773) [(8, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 2070 for generator 9. -/
def ep_Q1_009_partial_09_2070 : Poly :=
[
  term ((7619207305862976848243635273056056 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-3809603652931488424121817636528028 : Rat) / 30920451456251051055078653757943773) [(8, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2070 for generator 9. -/
theorem ep_Q1_009_partial_09_2070_valid :
    mulPoly ep_Q1_009_coefficient_09_2070
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2070 := by
  native_decide

/-- Coefficient term 2071 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2071 : Poly :=
[
  term ((-645560803716971219284907002080496330256730620455280877600275850557700980722083005141163230234803 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 2071 for generator 9. -/
def ep_Q1_009_partial_09_2071 : Poly :=
[
  term ((-645560803716971219284907002080496330256730620455280877600275850557700980722083005141163230234803 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((645560803716971219284907002080496330256730620455280877600275850557700980722083005141163230234803 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2071 for generator 9. -/
theorem ep_Q1_009_partial_09_2071_valid :
    mulPoly ep_Q1_009_coefficient_09_2071
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2071 := by
  native_decide

/-- Coefficient term 2072 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2072 : Poly :=
[
  term ((-112157181185961069034232320539432 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (14, 3), (15, 1)]
]

/-- Partial product 2072 for generator 9. -/
def ep_Q1_009_partial_09_2072 : Poly :=
[
  term ((-224314362371922138068464641078864 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (13, 1), (14, 3), (15, 1)],
  term ((112157181185961069034232320539432 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2072 for generator 9. -/
theorem ep_Q1_009_partial_09_2072_valid :
    mulPoly ep_Q1_009_coefficient_09_2072
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2072 := by
  native_decide

/-- Coefficient term 2073 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2073 : Poly :=
[
  term ((128077401571156101637614698961695167850177826763727328597541559021323318679314031442755558782169 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 2073 for generator 9. -/
def ep_Q1_009_partial_09_2073 : Poly :=
[
  term ((128077401571156101637614698961695167850177826763727328597541559021323318679314031442755558782169 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-128077401571156101637614698961695167850177826763727328597541559021323318679314031442755558782169 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2073 for generator 9. -/
theorem ep_Q1_009_partial_09_2073_valid :
    mulPoly ep_Q1_009_coefficient_09_2073
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2073 := by
  native_decide

/-- Coefficient term 2074 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2074 : Poly :=
[
  term ((-65091450752186278904665230170550 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (15, 3)]
]

/-- Partial product 2074 for generator 9. -/
def ep_Q1_009_partial_09_2074 : Poly :=
[
  term ((-130182901504372557809330460341100 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (13, 1), (15, 3)],
  term ((65091450752186278904665230170550 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2074 for generator 9. -/
theorem ep_Q1_009_partial_09_2074_valid :
    mulPoly ep_Q1_009_coefficient_09_2074
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2074 := by
  native_decide

/-- Coefficient term 2075 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2075 : Poly :=
[
  term ((-102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (13, 2)]
]

/-- Partial product 2075 for generator 9. -/
def ep_Q1_009_partial_09_2075 : Poly :=
[
  term ((-102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (13, 2)],
  term ((102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2075 for generator 9. -/
theorem ep_Q1_009_partial_09_2075_valid :
    mulPoly ep_Q1_009_coefficient_09_2075
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2075 := by
  native_decide

/-- Coefficient term 2076 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2076 : Poly :=
[
  term ((3317570161787406534842933806633950174183482719727613480665696397770614862809552224675120401687 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 2076 for generator 9. -/
def ep_Q1_009_partial_09_2076 : Poly :=
[
  term ((3317570161787406534842933806633950174183482719727613480665696397770614862809552224675120401687 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(2, 1), (8, 1), (13, 2), (14, 1)],
  term ((-3317570161787406534842933806633950174183482719727613480665696397770614862809552224675120401687 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2076 for generator 9. -/
theorem ep_Q1_009_partial_09_2076_valid :
    mulPoly ep_Q1_009_coefficient_09_2076
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2076 := by
  native_decide

/-- Coefficient term 2077 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2077 : Poly :=
[
  term ((-140182877327151892570657000201092 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 2077 for generator 9. -/
def ep_Q1_009_partial_09_2077 : Poly :=
[
  term ((-280365754654303785141314000402184 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((140182877327151892570657000201092 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2077 for generator 9. -/
theorem ep_Q1_009_partial_09_2077_valid :
    mulPoly ep_Q1_009_coefficient_09_2077
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2077 := by
  native_decide

/-- Coefficient term 2078 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2078 : Poly :=
[
  term ((-20464424302430061320163336902076 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 2), (15, 2)]
]

/-- Partial product 2078 for generator 9. -/
def ep_Q1_009_partial_09_2078 : Poly :=
[
  term ((-40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (13, 2), (15, 2)],
  term ((20464424302430061320163336902076 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2078 for generator 9. -/
theorem ep_Q1_009_partial_09_2078_valid :
    mulPoly ep_Q1_009_coefficient_09_2078
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2078 := by
  native_decide

/-- Coefficient term 2079 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2079 : Poly :=
[
  term ((-2721595443599592280502671214877448307646945361641872846231464699545094922329049728254253453902857 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (14, 1)]
]

/-- Partial product 2079 for generator 9. -/
def ep_Q1_009_partial_09_2079 : Poly :=
[
  term ((-2721595443599592280502671214877448307646945361641872846231464699545094922329049728254253453902857 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (8, 1), (14, 1)],
  term ((2721595443599592280502671214877448307646945361641872846231464699545094922329049728254253453902857 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2079 for generator 9. -/
theorem ep_Q1_009_partial_09_2079_valid :
    mulPoly ep_Q1_009_coefficient_09_2079
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2079 := by
  native_decide

/-- Coefficient term 2080 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2080 : Poly :=
[
  term ((1698731736157737860126705990892320545754850876892413209778101235376020391055113630044253766294305 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 2080 for generator 9. -/
def ep_Q1_009_partial_09_2080 : Poly :=
[
  term ((1698731736157737860126705990892320545754850876892413209778101235376020391055113630044253766294305 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1698731736157737860126705990892320545754850876892413209778101235376020391055113630044253766294305 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2080 for generator 9. -/
theorem ep_Q1_009_partial_09_2080_valid :
    mulPoly ep_Q1_009_coefficient_09_2080
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2080 := by
  native_decide

/-- Coefficient term 2081 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2081 : Poly :=
[
  term ((-42660353074955050727534998258141746851547956705906484755449769777099163917778636237487358167449 : Rat) / 1734451239325807015552069236934803057346683123945397707040152301480305027563803956444381998336) [(8, 1), (14, 2)]
]

/-- Partial product 2081 for generator 9. -/
def ep_Q1_009_partial_09_2081 : Poly :=
[
  term ((-42660353074955050727534998258141746851547956705906484755449769777099163917778636237487358167449 : Rat) / 867225619662903507776034618467401528673341561972698853520076150740152513781901978222190999168) [(2, 1), (8, 1), (14, 2)],
  term ((42660353074955050727534998258141746851547956705906484755449769777099163917778636237487358167449 : Rat) / 1734451239325807015552069236934803057346683123945397707040152301480305027563803956444381998336) [(8, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2081 for generator 9. -/
theorem ep_Q1_009_partial_09_2081_valid :
    mulPoly ep_Q1_009_coefficient_09_2081
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2081 := by
  native_decide

/-- Coefficient term 2082 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2082 : Poly :=
[
  term ((-1429730191908574746130424845954879 : Rat) / 30920451456251051055078653757943773) [(8, 1), (14, 2), (15, 2)]
]

/-- Partial product 2082 for generator 9. -/
def ep_Q1_009_partial_09_2082 : Poly :=
[
  term ((-2859460383817149492260849691909758 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (14, 2), (15, 2)],
  term ((1429730191908574746130424845954879 : Rat) / 30920451456251051055078653757943773) [(8, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2082 for generator 9. -/
theorem ep_Q1_009_partial_09_2082_valid :
    mulPoly ep_Q1_009_coefficient_09_2082
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2082 := by
  native_decide

/-- Coefficient term 2083 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2083 : Poly :=
[
  term ((898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (15, 2)]
]

/-- Partial product 2083 for generator 9. -/
def ep_Q1_009_partial_09_2083 : Poly :=
[
  term ((898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (15, 2)],
  term ((-898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2083 for generator 9. -/
theorem ep_Q1_009_partial_09_2083_valid :
    mulPoly ep_Q1_009_coefficient_09_2083
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2083 := by
  native_decide

/-- Coefficient term 2084 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2084 : Poly :=
[
  term ((-780503628213828116256552612047329 : Rat) / 30920451456251051055078653757943773) [(8, 1), (15, 4)]
]

/-- Partial product 2084 for generator 9. -/
def ep_Q1_009_partial_09_2084 : Poly :=
[
  term ((-1561007256427656232513105224094658 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (15, 4)],
  term ((780503628213828116256552612047329 : Rat) / 30920451456251051055078653757943773) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2084 for generator 9. -/
theorem ep_Q1_009_partial_09_2084_valid :
    mulPoly ep_Q1_009_coefficient_09_2084
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2084 := by
  native_decide

/-- Coefficient term 2085 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2085 : Poly :=
[
  term ((-49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 1325538775884734596939103677609910803139072438410699951205842651301650592012308534752480295601880877217290690560) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 2085 for generator 9. -/
def ep_Q1_009_partial_09_2085 : Poly :=
[
  term ((-49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 662769387942367298469551838804955401569536219205349975602921325650825296006154267376240147800940438608645345280) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 1325538775884734596939103677609910803139072438410699951205842651301650592012308534752480295601880877217290690560) [(9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2085 for generator 9. -/
theorem ep_Q1_009_partial_09_2085_valid :
    mulPoly ep_Q1_009_coefficient_09_2085
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2085 := by
  native_decide

/-- Coefficient term 2086 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2086 : Poly :=
[
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2086 for generator 9. -/
def ep_Q1_009_partial_09_2086 : Poly :=
[
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 16108978179154760726690496082064888232592894216796700795904337776235337055705138443172503592383968993960129920) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2086 for generator 9. -/
theorem ep_Q1_009_partial_09_2086_valid :
    mulPoly ep_Q1_009_coefficient_09_2086
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2086 := by
  native_decide

/-- Coefficient term 2087 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2087 : Poly :=
[
  term ((4445142160896780050708 : Rat) / 1558779625948348837707) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2087 for generator 9. -/
def ep_Q1_009_partial_09_2087 : Poly :=
[
  term ((8890284321793560101416 : Rat) / 1558779625948348837707) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4445142160896780050708 : Rat) / 1558779625948348837707) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2087 for generator 9. -/
theorem ep_Q1_009_partial_09_2087_valid :
    mulPoly ep_Q1_009_coefficient_09_2087
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2087 := by
  native_decide

/-- Coefficient term 2088 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2088 : Poly :=
[
  term ((10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 463938571559657108928686287163468781098675353443744982922044927955577707204307987163368103460658307026051741696) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 2088 for generator 9. -/
def ep_Q1_009_partial_09_2088 : Poly :=
[
  term ((10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 231969285779828554464343143581734390549337676721872491461022463977788853602153993581684051730329153513025870848) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 463938571559657108928686287163468781098675353443744982922044927955577707204307987163368103460658307026051741696) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2088 for generator 9. -/
theorem ep_Q1_009_partial_09_2088_valid :
    mulPoly ep_Q1_009_coefficient_09_2088
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2088 := by
  native_decide

/-- Coefficient term 2089 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2089 : Poly :=
[
  term ((-109062900059665680812437 : Rat) / 9352677755690093026242) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 2089 for generator 9. -/
def ep_Q1_009_partial_09_2089 : Poly :=
[
  term ((-109062900059665680812437 : Rat) / 4676338877845046513121) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((109062900059665680812437 : Rat) / 9352677755690093026242) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2089 for generator 9. -/
theorem ep_Q1_009_partial_09_2089_valid :
    mulPoly ep_Q1_009_coefficient_09_2089
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2089 := by
  native_decide

/-- Coefficient term 2090 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2090 : Poly :=
[
  term ((59074519660448875793914633126760518158231971529471144661171304560496060887830238458234456990559264291216845228962803 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 2090 for generator 9. -/
def ep_Q1_009_partial_09_2090 : Poly :=
[
  term ((59074519660448875793914633126760518158231971529471144661171304560496060887830238458234456990559264291216845228962803 : Rat) / 788502263913267228050046402224912149208956986123764910557925525471167278202655116516407705840010514316360439324160) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-59074519660448875793914633126760518158231971529471144661171304560496060887830238458234456990559264291216845228962803 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2090 for generator 9. -/
theorem ep_Q1_009_partial_09_2090_valid :
    mulPoly ep_Q1_009_coefficient_09_2090
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2090 := by
  native_decide

/-- Coefficient term 2091 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2091 : Poly :=
[
  term ((-26963978876576423574269 : Rat) / 1558779625948348837707) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2091 for generator 9. -/
def ep_Q1_009_partial_09_2091 : Poly :=
[
  term ((-53927957753152847148538 : Rat) / 1558779625948348837707) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((26963978876576423574269 : Rat) / 1558779625948348837707) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2091 for generator 9. -/
theorem ep_Q1_009_partial_09_2091_valid :
    mulPoly ep_Q1_009_coefficient_09_2091
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2091 := by
  native_decide

/-- Coefficient term 2092 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2092 : Poly :=
[
  term ((765035351744540155571669 : Rat) / 37410711022760372104968) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 2092 for generator 9. -/
def ep_Q1_009_partial_09_2092 : Poly :=
[
  term ((765035351744540155571669 : Rat) / 18705355511380186052484) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-765035351744540155571669 : Rat) / 37410711022760372104968) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2092 for generator 9. -/
theorem ep_Q1_009_partial_09_2092_valid :
    mulPoly ep_Q1_009_coefficient_09_2092
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2092 := by
  native_decide

/-- Coefficient term 2093 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2093 : Poly :=
[
  term ((-159901595754272504066354992664004561346598538499549210501949049307945600452148967599600380867375248054597510986042567 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2093 for generator 9. -/
def ep_Q1_009_partial_09_2093 : Poly :=
[
  term ((-159901595754272504066354992664004561346598538499549210501949049307945600452148967599600380867375248054597510986042567 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((159901595754272504066354992664004561346598538499549210501949049307945600452148967599600380867375248054597510986042567 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2093 for generator 9. -/
theorem ep_Q1_009_partial_09_2093_valid :
    mulPoly ep_Q1_009_coefficient_09_2093
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2093 := by
  native_decide

/-- Coefficient term 2094 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2094 : Poly :=
[
  term ((23274932376326906775331 : Rat) / 1558779625948348837707) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2094 for generator 9. -/
def ep_Q1_009_partial_09_2094 : Poly :=
[
  term ((46549864752653813550662 : Rat) / 1558779625948348837707) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23274932376326906775331 : Rat) / 1558779625948348837707) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2094 for generator 9. -/
theorem ep_Q1_009_partial_09_2094_valid :
    mulPoly ep_Q1_009_coefficient_09_2094
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2094 := by
  native_decide

/-- Coefficient term 2095 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2095 : Poly :=
[
  term ((-370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 2095 for generator 9. -/
def ep_Q1_009_partial_09_2095 : Poly :=
[
  term ((-370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2095 for generator 9. -/
theorem ep_Q1_009_partial_09_2095_valid :
    mulPoly ep_Q1_009_coefficient_09_2095
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2095 := by
  native_decide

/-- Coefficient term 2096 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2096 : Poly :=
[
  term ((499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 2096 for generator 9. -/
def ep_Q1_009_partial_09_2096 : Poly :=
[
  term ((499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 59137669793495042103753480166868411190671773959282368291844414410337545865199133738730577938000788573727032949312) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2096 for generator 9. -/
theorem ep_Q1_009_partial_09_2096_valid :
    mulPoly ep_Q1_009_coefficient_09_2096
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2096 := by
  native_decide

/-- Coefficient term 2097 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2097 : Poly :=
[
  term ((-1222062849834272311320 : Rat) / 519593208649449612569) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2097 for generator 9. -/
def ep_Q1_009_partial_09_2097 : Poly :=
[
  term ((-2444125699668544622640 : Rat) / 519593208649449612569) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1222062849834272311320 : Rat) / 519593208649449612569) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2097 for generator 9. -/
theorem ep_Q1_009_partial_09_2097_valid :
    mulPoly ep_Q1_009_coefficient_09_2097
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2097 := by
  native_decide

/-- Coefficient term 2098 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2098 : Poly :=
[
  term ((804097384918378324117487 : Rat) / 37410711022760372104968) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 2098 for generator 9. -/
def ep_Q1_009_partial_09_2098 : Poly :=
[
  term ((804097384918378324117487 : Rat) / 18705355511380186052484) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-804097384918378324117487 : Rat) / 37410711022760372104968) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2098 for generator 9. -/
theorem ep_Q1_009_partial_09_2098_valid :
    mulPoly ep_Q1_009_coefficient_09_2098
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2098 := by
  native_decide

/-- Coefficient term 2099 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_2099 : Poly :=
[
  term ((117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 2099 for generator 9. -/
def ep_Q1_009_partial_09_2099 : Poly :=
[
  term ((117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2099 for generator 9. -/
theorem ep_Q1_009_partial_09_2099_valid :
    mulPoly ep_Q1_009_coefficient_09_2099
        ep_Q1_009_generator_09_2000_2099 =
      ep_Q1_009_partial_09_2099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_09_2000_2099 : List Poly :=
[
  ep_Q1_009_partial_09_2000,
  ep_Q1_009_partial_09_2001,
  ep_Q1_009_partial_09_2002,
  ep_Q1_009_partial_09_2003,
  ep_Q1_009_partial_09_2004,
  ep_Q1_009_partial_09_2005,
  ep_Q1_009_partial_09_2006,
  ep_Q1_009_partial_09_2007,
  ep_Q1_009_partial_09_2008,
  ep_Q1_009_partial_09_2009,
  ep_Q1_009_partial_09_2010,
  ep_Q1_009_partial_09_2011,
  ep_Q1_009_partial_09_2012,
  ep_Q1_009_partial_09_2013,
  ep_Q1_009_partial_09_2014,
  ep_Q1_009_partial_09_2015,
  ep_Q1_009_partial_09_2016,
  ep_Q1_009_partial_09_2017,
  ep_Q1_009_partial_09_2018,
  ep_Q1_009_partial_09_2019,
  ep_Q1_009_partial_09_2020,
  ep_Q1_009_partial_09_2021,
  ep_Q1_009_partial_09_2022,
  ep_Q1_009_partial_09_2023,
  ep_Q1_009_partial_09_2024,
  ep_Q1_009_partial_09_2025,
  ep_Q1_009_partial_09_2026,
  ep_Q1_009_partial_09_2027,
  ep_Q1_009_partial_09_2028,
  ep_Q1_009_partial_09_2029,
  ep_Q1_009_partial_09_2030,
  ep_Q1_009_partial_09_2031,
  ep_Q1_009_partial_09_2032,
  ep_Q1_009_partial_09_2033,
  ep_Q1_009_partial_09_2034,
  ep_Q1_009_partial_09_2035,
  ep_Q1_009_partial_09_2036,
  ep_Q1_009_partial_09_2037,
  ep_Q1_009_partial_09_2038,
  ep_Q1_009_partial_09_2039,
  ep_Q1_009_partial_09_2040,
  ep_Q1_009_partial_09_2041,
  ep_Q1_009_partial_09_2042,
  ep_Q1_009_partial_09_2043,
  ep_Q1_009_partial_09_2044,
  ep_Q1_009_partial_09_2045,
  ep_Q1_009_partial_09_2046,
  ep_Q1_009_partial_09_2047,
  ep_Q1_009_partial_09_2048,
  ep_Q1_009_partial_09_2049,
  ep_Q1_009_partial_09_2050,
  ep_Q1_009_partial_09_2051,
  ep_Q1_009_partial_09_2052,
  ep_Q1_009_partial_09_2053,
  ep_Q1_009_partial_09_2054,
  ep_Q1_009_partial_09_2055,
  ep_Q1_009_partial_09_2056,
  ep_Q1_009_partial_09_2057,
  ep_Q1_009_partial_09_2058,
  ep_Q1_009_partial_09_2059,
  ep_Q1_009_partial_09_2060,
  ep_Q1_009_partial_09_2061,
  ep_Q1_009_partial_09_2062,
  ep_Q1_009_partial_09_2063,
  ep_Q1_009_partial_09_2064,
  ep_Q1_009_partial_09_2065,
  ep_Q1_009_partial_09_2066,
  ep_Q1_009_partial_09_2067,
  ep_Q1_009_partial_09_2068,
  ep_Q1_009_partial_09_2069,
  ep_Q1_009_partial_09_2070,
  ep_Q1_009_partial_09_2071,
  ep_Q1_009_partial_09_2072,
  ep_Q1_009_partial_09_2073,
  ep_Q1_009_partial_09_2074,
  ep_Q1_009_partial_09_2075,
  ep_Q1_009_partial_09_2076,
  ep_Q1_009_partial_09_2077,
  ep_Q1_009_partial_09_2078,
  ep_Q1_009_partial_09_2079,
  ep_Q1_009_partial_09_2080,
  ep_Q1_009_partial_09_2081,
  ep_Q1_009_partial_09_2082,
  ep_Q1_009_partial_09_2083,
  ep_Q1_009_partial_09_2084,
  ep_Q1_009_partial_09_2085,
  ep_Q1_009_partial_09_2086,
  ep_Q1_009_partial_09_2087,
  ep_Q1_009_partial_09_2088,
  ep_Q1_009_partial_09_2089,
  ep_Q1_009_partial_09_2090,
  ep_Q1_009_partial_09_2091,
  ep_Q1_009_partial_09_2092,
  ep_Q1_009_partial_09_2093,
  ep_Q1_009_partial_09_2094,
  ep_Q1_009_partial_09_2095,
  ep_Q1_009_partial_09_2096,
  ep_Q1_009_partial_09_2097,
  ep_Q1_009_partial_09_2098,
  ep_Q1_009_partial_09_2099
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_09_2000_2099 : Poly :=
[
  term ((-54985499582142163607142903546323968000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 158115593787748604634475544414545984222510312575754579278836960246277814569187795395279168) [(2, 1), (7, 2), (9, 1), (12, 1), (13, 1)],
  term ((85914843097097130636160786791131200000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (7, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-57639507530703502643168411877045644496462865859867767923940522403969259274301369819037995326671166551207572996037277 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1)],
  term ((46640534819570921289814 : Rat) / 4676338877845046513121) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((683882151052893159863839862857404352000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (12, 1), (15, 3)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 131762994823123837195396287012121653518758593813128816065697466871898178807656496162732640) [(2, 1), (7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-6873187447767770450892862943290496000 : Rat) / 238235207258979625923591009726343894571) [(2, 1), (7, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 59293347670405726737928329155454744083441367215907967229563860092354180463445423273229688) [(2, 1), (7, 2), (9, 1), (13, 1), (14, 2)],
  term ((-137463748955355409017857258865809920000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (13, 1), (15, 2)],
  term ((-153135456779592752828495658293896247792916285532250563347796077664330935536475294747612897447764969572061908469519 : Rat) / 59137669793495042103753480166868411190671773959282368291844414410337545865199133738730577938000788573727032949312) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 1)],
  term ((-488825139933708924528 : Rat) / 519593208649449612569) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((68731874477677704508928629432904960000 : Rat) / 238235207258979625923591009726343894571) [(2, 1), (7, 2), (9, 1), (14, 1), (15, 3)],
  term ((2994998780494701206726213073764359070080887433913848225721854799782769731393475869941367733 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-182139467365845916948660867997198144000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (15, 3)],
  term ((-39365782486223054704561024498303645170824488194309076126775050937911865745753414975599472908761715 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(2, 1), (7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-33293740 : Rat) / 3536493) [(2, 1), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 80018130194773040947693107834923422139839731762379199400193996631557270299770751854156934435276) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-9184480 : Rat) / 3536493) [(2, 1), (7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 1012658822803907410863460799718804890357293780495646365290590691834397093059245673182551034661120) [(2, 1), (7, 2), (12, 1)],
  term ((33963500299091372064333580411159781722064529169833124822179559797155245186869725822421264295668535 : Rat) / 426763361038789551721029908452924918079145236066022396801034648701638774932110676555503650321472) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1)],
  term ((14350750 : Rat) / 1178831) [(2, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((33678783694041290823715891686000221497991304292471905070916623736187500 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (7, 2), (12, 1), (14, 1)],
  term ((22076823203516692130406120213558280775551905786458251762179023862596062299495278611326081620208935241957538967789 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(2, 1), (7, 2), (12, 1), (15, 2)],
  term ((9670960259096527240364 : Rat) / 290243508153948313977) [(2, 1), (7, 2), (12, 1), (15, 2), (16, 1)],
  term ((1179091783 : Rat) / 49510902) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 71127226839798258620171651408820819679857539344337066133505774783606462488685112759250608386912) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3444180 : Rat) / 1178831) [(2, 1), (7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(2, 1), (7, 2), (13, 1), (14, 2), (15, 1)],
  term ((-22961200 : Rat) / 3536493) [(2, 1), (7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-2870150 : Rat) / 3536493) [(2, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 379747058551465279073797799894551833883985167685867386983971509437898909897217127443456637997920) [(2, 1), (7, 2), (14, 1)],
  term ((557252208908276297845227778739634191785703743160753341655182777802980266574932856082899745329373817098714813807 : Rat) / 2918741227996876742588833551267502724314318039786536987154978927639873877923082889494595999242515344788268784) [(2, 1), (7, 2), (14, 1), (15, 2)],
  term ((2818314710934494945592 : Rat) / 96747836051316104659) [(2, 1), (7, 2), (14, 1), (15, 2), (16, 1)],
  term ((2984956 : Rat) / 24755451) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-71944361095511099977301182703796317036334409458564863266175093093425133949135551507130071178081755 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(2, 1), (7, 2), (15, 2)],
  term ((-30423590 : Rat) / 3536493) [(2, 1), (7, 2), (15, 2), (16, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 92917030678168232976003709121507306643572310211360591448579587579302055048060926238091892768) [(2, 1), (7, 3), (8, 1), (12, 1), (15, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 197644492234685755793094430518182480278137890719693224098546200307847268211484744244098960) [(2, 1), (7, 3), (9, 1), (12, 1)],
  term ((13746374895535540901785725886580992000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (7, 3), (9, 1), (12, 1), (15, 2)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 106690840259697387930257477113231229519786309016505599200258662175409693733027669138875912580368) [(2, 1), (7, 3), (12, 1), (15, 1)],
  term ((2296120 : Rat) / 1178831) [(2, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((11065071306518533368990472085273650717510935112826828314274753141737800 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1612246187886841412476594351001960 : Rat) / 10306817152083683685026217919314591) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-359873384433192111618510834046086853084480089746976379384697160244317867036791355418431311257517 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((6350741409611641295926619215850152 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-88516020981370437777855664714930977407491414682892325194291842612604826081582522917451667291419 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-5112528094864158566647491122422456 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 1836477782815560369408073309695673825425899778295126983924867142743852382126380659764639762944) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((139303899961111256042568879153600 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((4665491648178182378833773087748586 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-92279263095840480531747409170888015052562875392664863540511276443789430685314755283388399009677 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (8, 1), (12, 1)],
  term ((-131854414537728319805200220865244181414143786916416833161387406168719384196197907436363365226391 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((124753201749108786047625112091097165727649267985547773288530337346661812276652929920681619156165 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((444081149073744275702620695618792 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((11180646279552047561052588587169404997582936403965598197001051884709320 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(2, 1), (8, 1), (12, 1), (13, 2)],
  term ((468086615099019361379748935638166356792098357654495617427532075321107306392384392050834243082609 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (8, 1), (12, 1), (14, 1)],
  term ((212130366472793952268719667077374306538755645055281098670172912869507034916676790366796781971345 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((224314362371922138068464641078864 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((11293777743291126957050253316098812923169489644474653314123213828612043956583539692784806743288979 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(2, 1), (8, 1), (12, 1), (15, 2)],
  term ((-6145768756088012433191875016106584 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (12, 1), (15, 4)],
  term ((89757405835365635399493850659843818455269413739055437199193729642966511468604740490292810642317 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (12, 2)],
  term ((-2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (12, 2), (14, 1), (15, 2)],
  term ((132088673583336955234329236512759224154091682152866935586762715689845035915689600008384111135127 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(2, 1), (8, 1), (12, 2), (15, 2)],
  term ((44429701959552420391646628580501650867048154004748220322412598146609859173895811707769877850031 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((7619207305862976848243635273056056 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-645560803716971219284907002080496330256730620455280877600275850557700980722083005141163230234803 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-224314362371922138068464641078864 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (13, 1), (14, 3), (15, 1)],
  term ((128077401571156101637614698961695167850177826763727328597541559021323318679314031442755558782169 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (8, 1), (13, 1), (15, 1)],
  term ((-130182901504372557809330460341100 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (13, 1), (15, 3)],
  term ((-102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (13, 2)],
  term ((3317570161787406534842933806633950174183482719727613480665696397770614862809552224675120401687 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(2, 1), (8, 1), (13, 2), (14, 1)],
  term ((-280365754654303785141314000402184 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((-40928848604860122640326673804152 : Rat) / 3435605717361227895008739306438197) [(2, 1), (8, 1), (13, 2), (15, 2)],
  term ((-2721595443599592280502671214877448307646945361641872846231464699545094922329049728254253453902857 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (8, 1), (14, 1)],
  term ((1698731736157737860126705990892320545754850876892413209778101235376020391055113630044253766294305 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-42660353074955050727534998258141746851547956705906484755449769777099163917778636237487358167449 : Rat) / 867225619662903507776034618467401528673341561972698853520076150740152513781901978222190999168) [(2, 1), (8, 1), (14, 2)],
  term ((-2859460383817149492260849691909758 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (14, 2), (15, 2)],
  term ((898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (8, 1), (15, 2)],
  term ((-1561007256427656232513105224094658 : Rat) / 30920451456251051055078653757943773) [(2, 1), (8, 1), (15, 4)],
  term ((-49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 662769387942367298469551838804955401569536219205349975602921325650825296006154267376240147800940438608645345280) [(2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 16108978179154760726690496082064888232592894216796700795904337776235337055705138443172503592383968993960129920) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((8890284321793560101416 : Rat) / 1558779625948348837707) [(2, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 231969285779828554464343143581734390549337676721872491461022463977788853602153993581684051730329153513025870848) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-109062900059665680812437 : Rat) / 4676338877845046513121) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((59074519660448875793914633126760518158231971529471144661171304560496060887830238458234456990559264291216845228962803 : Rat) / 788502263913267228050046402224912149208956986123764910557925525471167278202655116516407705840010514316360439324160) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-53927957753152847148538 : Rat) / 1558779625948348837707) [(2, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((765035351744540155571669 : Rat) / 18705355511380186052484) [(2, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-159901595754272504066354992664004561346598538499549210501949049307945600452148967599600380867375248054597510986042567 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((46549864752653813550662 : Rat) / 1558779625948348837707) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 59137669793495042103753480166868411190671773959282368291844414410337545865199133738730577938000788573727032949312) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2444125699668544622640 : Rat) / 519593208649449612569) [(2, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((804097384918378324117487 : Rat) / 18705355511380186052484) [(2, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 2319692857798285544643431435817343905493376767218724914610224639777888536021539935816840517303291535130258708480) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((27492749791071081803571451773161984000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 316231187575497209268951088829091968445020625151509158557673920492555629138375590790558336) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((-42957421548548565318080393395565600000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((57639507530703502643168411877045644496462865859867767923940522403969259274301369819037995326671166551207572996037277 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((-23320267409785460644907 : Rat) / 4676338877845046513121) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-341941075526446579931919931428702176000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (12, 1), (15, 3)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 948693562726491627806853266487275905335061875454527475673021761477666887415126772371675008) [(7, 2), (9, 1), (13, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 263525989646247674390792574024243307037517187626257632131394933743796357615312992325465280) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((3436593723883885225446431471645248000 : Rat) / 238235207258979625923591009726343894571) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (13, 1), (14, 2)],
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((8591484309709713063616078679113120000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((153135456779592752828495658293896247792916285532250563347796077664330935536475294747612897447764969572061908469519 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((244412569966854462264 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34365937238838852254464314716452480000 : Rat) / 238235207258979625923591009726343894571) [(7, 2), (9, 1), (14, 1), (15, 3)],
  term ((-2994998780494701206726213073764359070080887433913848225721854799782769731393475869941367733 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(7, 2), (9, 1), (15, 1)],
  term ((91069733682922958474330433998599072000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (15, 3)],
  term ((39365782486223054704561024498303645170824488194309076126775050937911865745753414975599472908761715 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((16646870 : Rat) / 3536493) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 160036260389546081895386215669846844279679463524758398800387993263114540599541503708313868870552) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((4592240 : Rat) / 3536493) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-233637577096787738975350518554948011656476223853347409178090506209030323643718622928326097932541127 : Rat) / 2025317645607814821726921599437609780714587560991292730581181383668794186118491346365102069322240) [(7, 2), (12, 1)],
  term ((-33963500299091372064333580411159781722064529169833124822179559797155245186869725822421264295668535 : Rat) / 853526722077579103442059816905849836158290472132044793602069297403277549864221353111007300642944) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-7175375 : Rat) / 1178831) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16839391847020645411857945843000110748995652146235952535458311868093750 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 2), (12, 1), (14, 1)],
  term ((-22076823203516692130406120213558280775551905786458251762179023862596062299495278611326081620208935241957538967789 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 2), (12, 1), (15, 2)],
  term ((-4835480129548263620182 : Rat) / 290243508153948313977) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1179091783 : Rat) / 99021804) [(7, 2), (12, 1), (16, 1)],
  term ((1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((1722090 : Rat) / 1178831) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 2), (13, 1), (14, 2), (15, 1)],
  term ((11480600 : Rat) / 3536493) [(7, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (13, 1), (15, 1)],
  term ((1435075 : Rat) / 3536493) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(7, 2), (14, 1)],
  term ((-557252208908276297845227778739634191785703743160753341655182777802980266574932856082899745329373817098714813807 : Rat) / 5837482455993753485177667102535005448628636079573073974309957855279747755846165778989191998485030689576537568) [(7, 2), (14, 1), (15, 2)],
  term ((-1409157355467247472796 : Rat) / 96747836051316104659) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1492478 : Rat) / 24755451) [(7, 2), (14, 1), (16, 1)],
  term ((71944361095511099977301182703796317036334409458564863266175093093425133949135551507130071178081755 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 2), (15, 2)],
  term ((15211795 : Rat) / 3536493) [(7, 2), (15, 2), (16, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 3), (8, 1), (12, 1), (15, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 395288984469371511586188861036364960556275781439386448197092400615694536422969488488197920) [(7, 3), (9, 1), (12, 1)],
  term ((-6873187447767770450892862943290496000 : Rat) / 714705621776938877770773029179031683713) [(7, 3), (9, 1), (12, 1), (15, 2)],
  term ((-1357440775387001886364173258562194661062913386010657797475001756479719508474255688813774927888335 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(7, 3), (12, 1), (15, 1)],
  term ((-1148060 : Rat) / 1178831) [(7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-5532535653259266684495236042636825358755467556413414157137376570868900 : Rat) / 26193285789278909004851618288916664827263288069077324019722017852772303) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((81857697209720245280653347608304 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-806123093943420706238297175500980 : Rat) / 10306817152083683685026217919314591) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((359873384433192111618510834046086853084480089746976379384697160244317867036791355418431311257517 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3175370704805820647963309607925076 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((88516020981370437777855664714930977407491414682892325194291842612604826081582522917451667291419 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((2556264047432079283323745561211228 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7450971053867742594946489685414715690082118378288555245909373472432268293453439228342293920149 : Rat) / 3672955565631120738816146619391347650851799556590253967849734285487704764252761319529279525888) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-69651949980555628021284439576800 : Rat) / 3435605717361227895008739306438197) [(8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-2332745824089091189416886543874293 : Rat) / 30920451456251051055078653757943773) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((92279263095840480531747409170888015052562875392664863540511276443789430685314755283388399009677 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (12, 1)],
  term ((131854414537728319805200220865244181414143786916416833161387406168719384196197907436363365226391 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-124753201749108786047625112091097165727649267985547773288530337346661812276652929920681619156165 : Rat) / 20813414871909684186624830843217636688160197487344772484481827617763660330765647477332583980032) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-222040574536872137851310347809396 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-5590323139776023780526294293584702498791468201982799098500525942354660 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(8, 1), (12, 1), (13, 2)],
  term ((-468086615099019361379748935638166356792098357654495617427532075321107306392384392050834243082609 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(8, 1), (12, 1), (14, 1)],
  term ((-212130366472793952268719667077374306538755645055281098670172912869507034916676790366796781971345 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-112157181185961069034232320539432 : Rat) / 3435605717361227895008739306438197) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-11293777743291126957050253316098812923169489644474653314123213828612043956583539692784806743288979 : Rat) / 124880489231458105119748985059305820128961184924068634906890965706581961984593884863995503880192) [(8, 1), (12, 1), (15, 2)],
  term ((3072884378044006216595937508053292 : Rat) / 30920451456251051055078653757943773) [(8, 1), (12, 1), (15, 4)],
  term ((-89757405835365635399493850659843818455269413739055437199193729642966511468604740490292810642317 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (12, 2)],
  term ((1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(8, 1), (12, 2), (14, 1), (15, 2)],
  term ((-132088673583336955234329236512759224154091682152866935586762715689845035915689600008384111135127 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(8, 1), (12, 2), (15, 2)],
  term ((-44429701959552420391646628580501650867048154004748220322412598146609859173895811707769877850031 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3809603652931488424121817636528028 : Rat) / 30920451456251051055078653757943773) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((645560803716971219284907002080496330256730620455280877600275850557700980722083005141163230234803 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((112157181185961069034232320539432 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (14, 3), (15, 1)],
  term ((-128077401571156101637614698961695167850177826763727328597541559021323318679314031442755558782169 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(8, 1), (13, 1), (15, 1)],
  term ((65091450752186278904665230170550 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 1), (15, 3)],
  term ((102562668013533965222537165734886410229209659813040878337061321920016013897997695252494884354957 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (13, 2)],
  term ((-3317570161787406534842933806633950174183482719727613480665696397770614862809552224675120401687 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(8, 1), (13, 2), (14, 1)],
  term ((140182877327151892570657000201092 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((20464424302430061320163336902076 : Rat) / 3435605717361227895008739306438197) [(8, 1), (13, 2), (15, 2)],
  term ((2721595443599592280502671214877448307646945361641872846231464699545094922329049728254253453902857 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (14, 1)],
  term ((-1698731736157737860126705990892320545754850876892413209778101235376020391055113630044253766294305 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(8, 1), (14, 1), (15, 2)],
  term ((42660353074955050727534998258141746851547956705906484755449769777099163917778636237487358167449 : Rat) / 1734451239325807015552069236934803057346683123945397707040152301480305027563803956444381998336) [(8, 1), (14, 2)],
  term ((1429730191908574746130424845954879 : Rat) / 30920451456251051055078653757943773) [(8, 1), (14, 2), (15, 2)],
  term ((-898138605626116414566048979730722152638468229952061449522246749195134409918404236923046945918933 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(8, 1), (15, 2)],
  term ((780503628213828116256552612047329 : Rat) / 30920451456251051055078653757943773) [(8, 1), (15, 4)],
  term ((49883605692827815994342986972256115594407912661981712762329961959195204833267336394789951893272120858439209881391 : Rat) / 1325538775884734596939103677609910803139072438410699951205842651301650592012308534752480295601880877217290690560) [(9, 1), (11, 1), (12, 1)],
  term ((169463783708544948739876431317275482101263338467851552120237286686067037160961170247919865295166504505792788951 : Rat) / 32217956358309521453380992164129776465185788433593401591808675552470674111410276886345007184767937987920259840) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4445142160896780050708 : Rat) / 1558779625948348837707) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10070641012617514238441711889040775271278685030497859537840716494104992597417409232457827248349600313065523718941 : Rat) / 463938571559657108928686287163468781098675353443744982922044927955577707204307987163368103460658307026051741696) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((109062900059665680812437 : Rat) / 9352677755690093026242) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-59074519660448875793914633126760518158231971529471144661171304560496060887830238458234456990559264291216845228962803 : Rat) / 1577004527826534456100092804449824298417913972247529821115851050942334556405310233032815411680021028632720878648320) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((26963978876576423574269 : Rat) / 1558779625948348837707) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-765035351744540155571669 : Rat) / 37410711022760372104968) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((159901595754272504066354992664004561346598538499549210501949049307945600452148967599600380867375248054597510986042567 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-23274932376326906775331 : Rat) / 1558779625948348837707) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((370486060835519644294487846179259494863102926259817377084308825296362017986190511483697489199688271922098425546827 : Rat) / 9278771431193142178573725743269375621973507068874899658440898559111554144086159743267362069213166140521034833920) [(9, 1), (11, 1), (14, 1)],
  term ((-499781512517470237874362147562296113512778749073898992412872036725600423458176324940701568076014032034912540358945 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((1222062849834272311320 : Rat) / 519593208649449612569) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-804097384918378324117487 : Rat) / 37410711022760372104968) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-117283306522936956553750233179464979379491942247212709346858909469230676785132376220421200023174920811237195459047 : Rat) / 4639385715596571089286862871634687810986753534437449829220449279555777072043079871633681034606583070260517416960) [(9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 2000 through 2099. -/
theorem ep_Q1_009_block_09_2000_2099_valid :
    checkProductSumEq ep_Q1_009_partials_09_2000_2099
      ep_Q1_009_block_09_2000_2099 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
