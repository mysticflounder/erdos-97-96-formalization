/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:2000-2099

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_2000_2099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 2000 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2000 : Poly :=
[
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 2000 for generator 15. -/
def ep_Q2_024_partial_15_2000 : Poly :=
[
  term ((-207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2000 for generator 15. -/
theorem ep_Q2_024_partial_15_2000_valid :
    mulPoly ep_Q2_024_coefficient_15_2000
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2000 := by
  native_decide

/-- Coefficient term 2001 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2001 : Poly :=
[
  term ((1624539094208615819329210045164617550317754730169205571001 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 2001 for generator 15. -/
def ep_Q2_024_partial_15_2001 : Poly :=
[
  term ((1624539094208615819329210045164617550317754730169205571001 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1624539094208615819329210045164617550317754730169205571001 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2001 for generator 15. -/
theorem ep_Q2_024_partial_15_2001_valid :
    mulPoly ep_Q2_024_coefficient_15_2001
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2001 := by
  native_decide

/-- Coefficient term 2002 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2002 : Poly :=
[
  term ((-8096118816025563 : Rat) / 4651120884612772) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2002 for generator 15. -/
def ep_Q2_024_partial_15_2002 : Poly :=
[
  term ((-8096118816025563 : Rat) / 2325560442306386) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8096118816025563 : Rat) / 4651120884612772) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2002 for generator 15. -/
theorem ep_Q2_024_partial_15_2002_valid :
    mulPoly ep_Q2_024_coefficient_15_2002
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2002 := by
  native_decide

/-- Coefficient term 2003 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2003 : Poly :=
[
  term ((62806934852525941268185730253463325359364416002864186299 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 2003 for generator 15. -/
def ep_Q2_024_partial_15_2003 : Poly :=
[
  term ((62806934852525941268185730253463325359364416002864186299 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-62806934852525941268185730253463325359364416002864186299 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2003 for generator 15. -/
theorem ep_Q2_024_partial_15_2003_valid :
    mulPoly ep_Q2_024_coefficient_15_2003
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2003 := by
  native_decide

/-- Coefficient term 2004 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2004 : Poly :=
[
  term ((-14522449102671091 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 2004 for generator 15. -/
def ep_Q2_024_partial_15_2004 : Poly :=
[
  term ((-29044898205342182 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((14522449102671091 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2004 for generator 15. -/
theorem ep_Q2_024_partial_15_2004_valid :
    mulPoly ep_Q2_024_coefficient_15_2004
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2004 := by
  native_decide

/-- Coefficient term 2005 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2005 : Poly :=
[
  term ((-220154479092286088114368163945967902964441455056572775393 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 2005 for generator 15. -/
def ep_Q2_024_partial_15_2005 : Poly :=
[
  term ((-220154479092286088114368163945967902964441455056572775393 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((220154479092286088114368163945967902964441455056572775393 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2005 for generator 15. -/
theorem ep_Q2_024_partial_15_2005_valid :
    mulPoly ep_Q2_024_coefficient_15_2005
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2005 := by
  native_decide

/-- Coefficient term 2006 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2006 : Poly :=
[
  term ((4004120440815739 : Rat) / 4651120884612772) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2006 for generator 15. -/
def ep_Q2_024_partial_15_2006 : Poly :=
[
  term ((4004120440815739 : Rat) / 2325560442306386) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4004120440815739 : Rat) / 4651120884612772) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2006 for generator 15. -/
theorem ep_Q2_024_partial_15_2006_valid :
    mulPoly ep_Q2_024_coefficient_15_2006
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2006 := by
  native_decide

/-- Coefficient term 2007 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2007 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 2007 for generator 15. -/
def ep_Q2_024_partial_15_2007 : Poly :=
[
  term ((4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (12, 1), (15, 3)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2007 for generator 15. -/
theorem ep_Q2_024_partial_15_2007_valid :
    mulPoly ep_Q2_024_coefficient_15_2007
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2007 := by
  native_decide

/-- Coefficient term 2008 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2008 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 2008 for generator 15. -/
def ep_Q2_024_partial_15_2008 : Poly :=
[
  term ((-1249107794586464 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2008 for generator 15. -/
theorem ep_Q2_024_partial_15_2008_valid :
    mulPoly ep_Q2_024_coefficient_15_2008
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2008 := by
  native_decide

/-- Coefficient term 2009 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2009 : Poly :=
[
  term ((-561180869747247067406770766105928338504 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 2009 for generator 15. -/
def ep_Q2_024_partial_15_2009 : Poly :=
[
  term ((-1122361739494494134813541532211856677008 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((561180869747247067406770766105928338504 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2009 for generator 15. -/
theorem ep_Q2_024_partial_15_2009_valid :
    mulPoly ep_Q2_024_coefficient_15_2009
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2009 := by
  native_decide

/-- Coefficient term 2010 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2010 : Poly :=
[
  term ((18824350358765638388281147334886715462 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 2010 for generator 15. -/
def ep_Q2_024_partial_15_2010 : Poly :=
[
  term ((37648700717531276776562294669773430924 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-18824350358765638388281147334886715462 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2010 for generator 15. -/
theorem ep_Q2_024_partial_15_2010_valid :
    mulPoly ep_Q2_024_coefficient_15_2010
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2010 := by
  native_decide

/-- Coefficient term 2011 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2011 : Poly :=
[
  term ((-32308823398589358505785030365517698217216757534155423611 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 2011 for generator 15. -/
def ep_Q2_024_partial_15_2011 : Poly :=
[
  term ((-32308823398589358505785030365517698217216757534155423611 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((32308823398589358505785030365517698217216757534155423611 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2011 for generator 15. -/
theorem ep_Q2_024_partial_15_2011_valid :
    mulPoly ep_Q2_024_coefficient_15_2011
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2011 := by
  native_decide

/-- Coefficient term 2012 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2012 : Poly :=
[
  term ((5832264222063603 : Rat) / 2325560442306386) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2012 for generator 15. -/
def ep_Q2_024_partial_15_2012 : Poly :=
[
  term ((5832264222063603 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5832264222063603 : Rat) / 2325560442306386) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2012 for generator 15. -/
theorem ep_Q2_024_partial_15_2012_valid :
    mulPoly ep_Q2_024_coefficient_15_2012
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2012 := by
  native_decide

/-- Coefficient term 2013 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2013 : Poly :=
[
  term ((-615619649892803691839225179056574397895212913912736413337 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 2013 for generator 15. -/
def ep_Q2_024_partial_15_2013 : Poly :=
[
  term ((-615619649892803691839225179056574397895212913912736413337 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((615619649892803691839225179056574397895212913912736413337 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2013 for generator 15. -/
theorem ep_Q2_024_partial_15_2013_valid :
    mulPoly ep_Q2_024_coefficient_15_2013
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2013 := by
  native_decide

/-- Coefficient term 2014 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2014 : Poly :=
[
  term ((-59886801146866879 : Rat) / 13953362653838316) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 2014 for generator 15. -/
def ep_Q2_024_partial_15_2014 : Poly :=
[
  term ((-59886801146866879 : Rat) / 6976681326919158) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((59886801146866879 : Rat) / 13953362653838316) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2014 for generator 15. -/
theorem ep_Q2_024_partial_15_2014_valid :
    mulPoly ep_Q2_024_coefficient_15_2014
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2014 := by
  native_decide

/-- Coefficient term 2015 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2015 : Poly :=
[
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 3), (13, 1)]
]

/-- Partial product 2015 for generator 15. -/
def ep_Q2_024_partial_15_2015 : Poly :=
[
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 3), (13, 1)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2015 for generator 15. -/
theorem ep_Q2_024_partial_15_2015_valid :
    mulPoly ep_Q2_024_coefficient_15_2015
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2015 := by
  native_decide

/-- Coefficient term 2016 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2016 : Poly :=
[
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 3), (15, 1)]
]

/-- Partial product 2016 for generator 15. -/
def ep_Q2_024_partial_15_2016 : Poly :=
[
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (9, 1), (12, 3), (15, 1)],
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2016 for generator 15. -/
theorem ep_Q2_024_partial_15_2016_valid :
    mulPoly ep_Q2_024_coefficient_15_2016
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2016 := by
  native_decide

/-- Coefficient term 2017 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2017 : Poly :=
[
  term ((-4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 2017 for generator 15. -/
def ep_Q2_024_partial_15_2017 : Poly :=
[
  term ((-4569079916135479 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2017 for generator 15. -/
theorem ep_Q2_024_partial_15_2017_valid :
    mulPoly ep_Q2_024_coefficient_15_2017
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2017 := by
  native_decide

/-- Coefficient term 2018 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2018 : Poly :=
[
  term ((314688800998853570750485392958593183239 : Rat) / 1199709457402477296566693528029539267990) [(9, 1), (13, 1)]
]

/-- Partial product 2018 for generator 15. -/
def ep_Q2_024_partial_15_2018 : Poly :=
[
  term ((314688800998853570750485392958593183239 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1)],
  term ((-314688800998853570750485392958593183239 : Rat) / 1199709457402477296566693528029539267990) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2018 for generator 15. -/
theorem ep_Q2_024_partial_15_2018_valid :
    mulPoly ep_Q2_024_coefficient_15_2018
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2018 := by
  native_decide

/-- Coefficient term 2019 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2019 : Poly :=
[
  term ((-1356886213777717593573901108965641100892 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 2019 for generator 15. -/
def ep_Q2_024_partial_15_2019 : Poly :=
[
  term ((-2713772427555435187147802217931282201784 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((1356886213777717593573901108965641100892 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2019 for generator 15. -/
theorem ep_Q2_024_partial_15_2019_valid :
    mulPoly ep_Q2_024_coefficient_15_2019
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2019 := by
  native_decide

/-- Coefficient term 2020 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2020 : Poly :=
[
  term ((-8317026245857188619117647207721586307124 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 2020 for generator 15. -/
def ep_Q2_024_partial_15_2020 : Poly :=
[
  term ((-16634052491714377238235294415443172614248 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((8317026245857188619117647207721586307124 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2020 for generator 15. -/
theorem ep_Q2_024_partial_15_2020_valid :
    mulPoly ep_Q2_024_coefficient_15_2020
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2020 := by
  native_decide

/-- Coefficient term 2021 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2021 : Poly :=
[
  term ((4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 3)]
]

/-- Partial product 2021 for generator 15. -/
def ep_Q2_024_partial_15_2021 : Poly :=
[
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 3)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2021 for generator 15. -/
theorem ep_Q2_024_partial_15_2021_valid :
    mulPoly ep_Q2_024_coefficient_15_2021
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2021 := by
  native_decide

/-- Coefficient term 2022 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2022 : Poly :=
[
  term ((6213257326497533998434406865439742334811255363356619031 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 2022 for generator 15. -/
def ep_Q2_024_partial_15_2022 : Poly :=
[
  term ((6213257326497533998434406865439742334811255363356619031 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-6213257326497533998434406865439742334811255363356619031 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2022 for generator 15. -/
theorem ep_Q2_024_partial_15_2022_valid :
    mulPoly ep_Q2_024_coefficient_15_2022
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2022 := by
  native_decide

/-- Coefficient term 2023 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2023 : Poly :=
[
  term ((-998341009679466 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2023 for generator 15. -/
def ep_Q2_024_partial_15_2023 : Poly :=
[
  term ((-1996682019358932 : Rat) / 1162780221153193) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((998341009679466 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2023 for generator 15. -/
theorem ep_Q2_024_partial_15_2023_valid :
    mulPoly ep_Q2_024_coefficient_15_2023
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2023 := by
  native_decide

/-- Coefficient term 2024 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2024 : Poly :=
[
  term ((-91424493103504246547347775531772868672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 2024 for generator 15. -/
def ep_Q2_024_partial_15_2024 : Poly :=
[
  term ((-182848986207008493094695551063545737344 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((91424493103504246547347775531772868672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2024 for generator 15. -/
theorem ep_Q2_024_partial_15_2024_valid :
    mulPoly ep_Q2_024_coefficient_15_2024
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2024 := by
  native_decide

/-- Coefficient term 2025 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2025 : Poly :=
[
  term ((119713423097193330689087450274257183499694930181445633257 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 2025 for generator 15. -/
def ep_Q2_024_partial_15_2025 : Poly :=
[
  term ((119713423097193330689087450274257183499694930181445633257 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-119713423097193330689087450274257183499694930181445633257 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2025 for generator 15. -/
theorem ep_Q2_024_partial_15_2025_valid :
    mulPoly ep_Q2_024_coefficient_15_2025
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2025 := by
  native_decide

/-- Coefficient term 2026 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2026 : Poly :=
[
  term ((-11527705892893849 : Rat) / 4651120884612772) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2026 for generator 15. -/
def ep_Q2_024_partial_15_2026 : Poly :=
[
  term ((-11527705892893849 : Rat) / 2325560442306386) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((11527705892893849 : Rat) / 4651120884612772) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2026 for generator 15. -/
theorem ep_Q2_024_partial_15_2026_valid :
    mulPoly ep_Q2_024_coefficient_15_2026
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2026 := by
  native_decide

/-- Coefficient term 2027 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2027 : Poly :=
[
  term ((-55671291068105150782818935938743289169734649859706824367 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 2027 for generator 15. -/
def ep_Q2_024_partial_15_2027 : Poly :=
[
  term ((-55671291068105150782818935938743289169734649859706824367 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((55671291068105150782818935938743289169734649859706824367 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2027 for generator 15. -/
theorem ep_Q2_024_partial_15_2027_valid :
    mulPoly ep_Q2_024_coefficient_15_2027
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2027 := by
  native_decide

/-- Coefficient term 2028 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2028 : Poly :=
[
  term ((-90306014185731673 : Rat) / 6976681326919158) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 2028 for generator 15. -/
def ep_Q2_024_partial_15_2028 : Poly :=
[
  term ((-90306014185731673 : Rat) / 3488340663459579) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((90306014185731673 : Rat) / 6976681326919158) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2028 for generator 15. -/
theorem ep_Q2_024_partial_15_2028_valid :
    mulPoly ep_Q2_024_coefficient_15_2028
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2028 := by
  native_decide

/-- Coefficient term 2029 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2029 : Poly :=
[
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 3), (15, 1)]
]

/-- Partial product 2029 for generator 15. -/
def ep_Q2_024_partial_15_2029 : Poly :=
[
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (9, 1), (14, 3), (15, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2029 for generator 15. -/
theorem ep_Q2_024_partial_15_2029_valid :
    mulPoly ep_Q2_024_coefficient_15_2029
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2029 := by
  native_decide

/-- Coefficient term 2030 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2030 : Poly :=
[
  term ((833967741040952 : Rat) / 1162780221153193) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 2030 for generator 15. -/
def ep_Q2_024_partial_15_2030 : Poly :=
[
  term ((1667935482081904 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2030 for generator 15. -/
theorem ep_Q2_024_partial_15_2030_valid :
    mulPoly ep_Q2_024_coefficient_15_2030
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2030 := by
  native_decide

/-- Coefficient term 2031 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2031 : Poly :=
[
  term ((-24381871583415222619427240024539885248092857597419037319 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (15, 1)]
]

/-- Partial product 2031 for generator 15. -/
def ep_Q2_024_partial_15_2031 : Poly :=
[
  term ((-24381871583415222619427240024539885248092857597419037319 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (15, 1)],
  term ((24381871583415222619427240024539885248092857597419037319 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2031 for generator 15. -/
theorem ep_Q2_024_partial_15_2031_valid :
    mulPoly ep_Q2_024_coefficient_15_2031
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2031 := by
  native_decide

/-- Coefficient term 2032 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2032 : Poly :=
[
  term ((1235944130217429 : Rat) / 4651120884612772) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2032 for generator 15. -/
def ep_Q2_024_partial_15_2032 : Poly :=
[
  term ((1235944130217429 : Rat) / 2325560442306386) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1235944130217429 : Rat) / 4651120884612772) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2032 for generator 15. -/
theorem ep_Q2_024_partial_15_2032_valid :
    mulPoly ep_Q2_024_coefficient_15_2032
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2032 := by
  native_decide

/-- Coefficient term 2033 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2033 : Poly :=
[
  term ((164811286342967808698294818897798801710593850205157267 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (15, 3)]
]

/-- Partial product 2033 for generator 15. -/
def ep_Q2_024_partial_15_2033 : Poly :=
[
  term ((329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (9, 1), (15, 3)],
  term ((-164811286342967808698294818897798801710593850205157267 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2033 for generator 15. -/
theorem ep_Q2_024_partial_15_2033_valid :
    mulPoly ep_Q2_024_coefficient_15_2033
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2033 := by
  native_decide

/-- Coefficient term 2034 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2034 : Poly :=
[
  term ((-68425302891492 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 2034 for generator 15. -/
def ep_Q2_024_partial_15_2034 : Poly :=
[
  term ((-136850605782984 : Rat) / 1162780221153193) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((68425302891492 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2034 for generator 15. -/
theorem ep_Q2_024_partial_15_2034_valid :
    mulPoly ep_Q2_024_coefficient_15_2034
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2034 := by
  native_decide

/-- Coefficient term 2035 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2035 : Poly :=
[
  term ((-914350963129433696035730740766505087503 : Rat) / 599854728701238648283346764014769633995) [(9, 2)]
]

/-- Partial product 2035 for generator 15. -/
def ep_Q2_024_partial_15_2035 : Poly :=
[
  term ((-1828701926258867392071461481533010175006 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2)],
  term ((914350963129433696035730740766505087503 : Rat) / 599854728701238648283346764014769633995) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2035 for generator 15. -/
theorem ep_Q2_024_partial_15_2035_valid :
    mulPoly ep_Q2_024_coefficient_15_2035
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2035 := by
  native_decide

/-- Coefficient term 2036 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2036 : Poly :=
[
  term ((3988326455287122176982579045888720255746 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1)]
]

/-- Partial product 2036 for generator 15. -/
def ep_Q2_024_partial_15_2036 : Poly :=
[
  term ((7976652910574244353965158091777440511492 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (12, 1)],
  term ((-3988326455287122176982579045888720255746 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2036 for generator 15. -/
theorem ep_Q2_024_partial_15_2036_valid :
    mulPoly ep_Q2_024_coefficient_15_2036
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2036 := by
  native_decide

/-- Coefficient term 2037 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2037 : Poly :=
[
  term ((-387831206174171804247592766806064263212 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (14, 1)]
]

/-- Partial product 2037 for generator 15. -/
def ep_Q2_024_partial_15_2037 : Poly :=
[
  term ((-775662412348343608495185533612128526424 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((387831206174171804247592766806064263212 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2037 for generator 15. -/
theorem ep_Q2_024_partial_15_2037_valid :
    mulPoly ep_Q2_024_coefficient_15_2037
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2037 := by
  native_decide

/-- Coefficient term 2038 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2038 : Poly :=
[
  term ((1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2)]
]

/-- Partial product 2038 for generator 15. -/
def ep_Q2_024_partial_15_2038 : Poly :=
[
  term ((3813787790979841501322937562585614036464 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (12, 2)],
  term ((-1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2038 for generator 15. -/
theorem ep_Q2_024_partial_15_2038_valid :
    mulPoly ep_Q2_024_coefficient_15_2038
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2038 := by
  native_decide

/-- Coefficient term 2039 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2039 : Poly :=
[
  term ((-31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 2039 for generator 15. -/
def ep_Q2_024_partial_15_2039 : Poly :=
[
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2039 for generator 15. -/
theorem ep_Q2_024_partial_15_2039_valid :
    mulPoly ep_Q2_024_coefficient_15_2039
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2039 := by
  native_decide

/-- Coefficient term 2040 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2040 : Poly :=
[
  term ((803394675995137985879655712377857470234 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (14, 1)]
]

/-- Partial product 2040 for generator 15. -/
def ep_Q2_024_partial_15_2040 : Poly :=
[
  term ((1606789351990275971759311424755714940468 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (14, 1)],
  term ((-803394675995137985879655712377857470234 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2040 for generator 15. -/
theorem ep_Q2_024_partial_15_2040_valid :
    mulPoly ep_Q2_024_coefficient_15_2040
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2040 := by
  native_decide

/-- Coefficient term 2041 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2041 : Poly :=
[
  term ((-45563684842479776101655148289441130296 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 2)]
]

/-- Partial product 2041 for generator 15. -/
def ep_Q2_024_partial_15_2041 : Poly :=
[
  term ((-91127369684959552203310296578882260592 : Rat) / 3389009766673664679566930870139941435) [(6, 1), (9, 2), (14, 2)],
  term ((45563684842479776101655148289441130296 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2041 for generator 15. -/
theorem ep_Q2_024_partial_15_2041_valid :
    mulPoly ep_Q2_024_coefficient_15_2041
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2041 := by
  native_decide

/-- Coefficient term 2042 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2042 : Poly :=
[
  term ((1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2042 for generator 15. -/
def ep_Q2_024_partial_15_2042 : Poly :=
[
  term ((3928170973431556897968641917911482171402 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2042 for generator 15. -/
theorem ep_Q2_024_partial_15_2042_valid :
    mulPoly ep_Q2_024_coefficient_15_2042
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2042 := by
  native_decide

/-- Coefficient term 2043 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2043 : Poly :=
[
  term ((-68166470380177770147880004260145194096 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2043 for generator 15. -/
def ep_Q2_024_partial_15_2043 : Poly :=
[
  term ((-136332940760355540295760008520290388192 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((68166470380177770147880004260145194096 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2043 for generator 15. -/
theorem ep_Q2_024_partial_15_2043_valid :
    mulPoly ep_Q2_024_coefficient_15_2043
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2043 := by
  native_decide

/-- Coefficient term 2044 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2044 : Poly :=
[
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 2044 for generator 15. -/
def ep_Q2_024_partial_15_2044 : Poly :=
[
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2044 for generator 15. -/
theorem ep_Q2_024_partial_15_2044_valid :
    mulPoly ep_Q2_024_coefficient_15_2044
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2044 := by
  native_decide

/-- Coefficient term 2045 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2045 : Poly :=
[
  term ((-3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 2045 for generator 15. -/
def ep_Q2_024_partial_15_2045 : Poly :=
[
  term ((-7941159738640092377781708051038156584201845832521631328 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2045 for generator 15. -/
theorem ep_Q2_024_partial_15_2045_valid :
    mulPoly ep_Q2_024_coefficient_15_2045
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2045 := by
  native_decide

/-- Coefficient term 2046 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2046 : Poly :=
[
  term ((547402423131936 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2046 for generator 15. -/
def ep_Q2_024_partial_15_2046 : Poly :=
[
  term ((1094804846263872 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-547402423131936 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2046 for generator 15. -/
theorem ep_Q2_024_partial_15_2046_valid :
    mulPoly ep_Q2_024_coefficient_15_2046
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2046 := by
  native_decide

/-- Coefficient term 2047 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2047 : Poly :=
[
  term ((-13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 2047 for generator 15. -/
def ep_Q2_024_partial_15_2047 : Poly :=
[
  term ((-27491063214868865162112024830977996352 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2047 for generator 15. -/
theorem ep_Q2_024_partial_15_2047_valid :
    mulPoly ep_Q2_024_coefficient_15_2047
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2047 := by
  native_decide

/-- Coefficient term 2048 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2048 : Poly :=
[
  term ((7622752059727415278488553192885972165232523449500836449 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 2048 for generator 15. -/
def ep_Q2_024_partial_15_2048 : Poly :=
[
  term ((15245504119454830556977106385771944330465046899001672898 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7622752059727415278488553192885972165232523449500836449 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2048 for generator 15. -/
theorem ep_Q2_024_partial_15_2048_valid :
    mulPoly ep_Q2_024_coefficient_15_2048
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2048 := by
  native_decide

/-- Coefficient term 2049 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2049 : Poly :=
[
  term ((-3785903321153188 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2049 for generator 15. -/
def ep_Q2_024_partial_15_2049 : Poly :=
[
  term ((-7571806642306376 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3785903321153188 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2049 for generator 15. -/
theorem ep_Q2_024_partial_15_2049_valid :
    mulPoly ep_Q2_024_coefficient_15_2049
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2049 := by
  native_decide

/-- Coefficient term 2050 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2050 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 2050 for generator 15. -/
def ep_Q2_024_partial_15_2050 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2050 for generator 15. -/
theorem ep_Q2_024_partial_15_2050_valid :
    mulPoly ep_Q2_024_coefficient_15_2050
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2050 := by
  native_decide

/-- Coefficient term 2051 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2051 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 2051 for generator 15. -/
def ep_Q2_024_partial_15_2051 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2051 for generator 15. -/
theorem ep_Q2_024_partial_15_2051_valid :
    mulPoly ep_Q2_024_coefficient_15_2051
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2051 := by
  native_decide

/-- Coefficient term 2052 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2052 : Poly :=
[
  term ((-278572919499171938003108304402158252454662811974073471673 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2052 for generator 15. -/
def ep_Q2_024_partial_15_2052 : Poly :=
[
  term ((-278572919499171938003108304402158252454662811974073471673 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((278572919499171938003108304402158252454662811974073471673 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2052 for generator 15. -/
theorem ep_Q2_024_partial_15_2052_valid :
    mulPoly ep_Q2_024_coefficient_15_2052
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2052 := by
  native_decide

/-- Coefficient term 2053 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2053 : Poly :=
[
  term ((14078238642132395 : Rat) / 2325560442306386) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2053 for generator 15. -/
def ep_Q2_024_partial_15_2053 : Poly :=
[
  term ((14078238642132395 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14078238642132395 : Rat) / 2325560442306386) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2053 for generator 15. -/
theorem ep_Q2_024_partial_15_2053_valid :
    mulPoly ep_Q2_024_coefficient_15_2053
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2053 := by
  native_decide

/-- Coefficient term 2054 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2054 : Poly :=
[
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 2054 for generator 15. -/
def ep_Q2_024_partial_15_2054 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2054 for generator 15. -/
theorem ep_Q2_024_partial_15_2054_valid :
    mulPoly ep_Q2_024_coefficient_15_2054
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2054 := by
  native_decide

/-- Coefficient term 2055 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2055 : Poly :=
[
  term ((312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 2055 for generator 15. -/
def ep_Q2_024_partial_15_2055 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2055 for generator 15. -/
theorem ep_Q2_024_partial_15_2055_valid :
    mulPoly ep_Q2_024_coefficient_15_2055
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2055 := by
  native_decide

/-- Coefficient term 2056 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2056 : Poly :=
[
  term ((-402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 2056 for generator 15. -/
def ep_Q2_024_partial_15_2056 : Poly :=
[
  term ((-805341698516247746487407736754202445236 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2056 for generator 15. -/
theorem ep_Q2_024_partial_15_2056_valid :
    mulPoly ep_Q2_024_coefficient_15_2056
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2056 := by
  native_decide

/-- Coefficient term 2057 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2057 : Poly :=
[
  term ((-3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 2057 for generator 15. -/
def ep_Q2_024_partial_15_2057 : Poly :=
[
  term ((-7181570345025089215510545206361812704 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2057 for generator 15. -/
theorem ep_Q2_024_partial_15_2057_valid :
    mulPoly ep_Q2_024_coefficient_15_2057
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2057 := by
  native_decide

/-- Coefficient term 2058 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2058 : Poly :=
[
  term ((2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 2058 for generator 15. -/
def ep_Q2_024_partial_15_2058 : Poly :=
[
  term ((4074480252190612073483360722046549035277896901160054012 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2058 for generator 15. -/
theorem ep_Q2_024_partial_15_2058_valid :
    mulPoly ep_Q2_024_coefficient_15_2058
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2058 := by
  native_decide

/-- Coefficient term 2059 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2059 : Poly :=
[
  term ((-3012139900347352 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2059 for generator 15. -/
def ep_Q2_024_partial_15_2059 : Poly :=
[
  term ((-6024279800694704 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3012139900347352 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2059 for generator 15. -/
theorem ep_Q2_024_partial_15_2059_valid :
    mulPoly ep_Q2_024_coefficient_15_2059
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2059 := by
  native_decide

/-- Coefficient term 2060 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2060 : Poly :=
[
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 2060 for generator 15. -/
def ep_Q2_024_partial_15_2060 : Poly :=
[
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2060 for generator 15. -/
theorem ep_Q2_024_partial_15_2060_valid :
    mulPoly ep_Q2_024_coefficient_15_2060
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2060 := by
  native_decide

/-- Coefficient term 2061 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2061 : Poly :=
[
  term ((-6533280838736367 : Rat) / 2325560442306386) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 2061 for generator 15. -/
def ep_Q2_024_partial_15_2061 : Poly :=
[
  term ((-6533280838736367 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((6533280838736367 : Rat) / 2325560442306386) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2061 for generator 15. -/
theorem ep_Q2_024_partial_15_2061_valid :
    mulPoly ep_Q2_024_coefficient_15_2061
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2061 := by
  native_decide

/-- Coefficient term 2062 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2062 : Poly :=
[
  term ((788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 3), (13, 1)]
]

/-- Partial product 2062 for generator 15. -/
def ep_Q2_024_partial_15_2062 : Poly :=
[
  term ((1576427228864685585532861798833297750976 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (12, 3), (13, 1)],
  term ((-788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2062 for generator 15. -/
theorem ep_Q2_024_partial_15_2062_valid :
    mulPoly ep_Q2_024_coefficient_15_2062
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2062 := by
  native_decide

/-- Coefficient term 2063 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2063 : Poly :=
[
  term ((-7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 3), (15, 1)]
]

/-- Partial product 2063 for generator 15. -/
def ep_Q2_024_partial_15_2063 : Poly :=
[
  term ((-14190503691287756559998110760772247013129470784083539996 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (11, 1), (12, 3), (15, 1)],
  term ((7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2063 for generator 15. -/
theorem ep_Q2_024_partial_15_2063_valid :
    mulPoly ep_Q2_024_coefficient_15_2063
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2063 := by
  native_decide

/-- Coefficient term 2064 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2064 : Poly :=
[
  term ((5285404992210680 : Rat) / 1162780221153193) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 2064 for generator 15. -/
def ep_Q2_024_partial_15_2064 : Poly :=
[
  term ((10570809984421360 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-5285404992210680 : Rat) / 1162780221153193) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2064 for generator 15. -/
theorem ep_Q2_024_partial_15_2064_valid :
    mulPoly ep_Q2_024_coefficient_15_2064
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2064 := by
  native_decide

/-- Coefficient term 2065 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2065 : Poly :=
[
  term ((2256715975290250605431863812890733365038 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2065 for generator 15. -/
def ep_Q2_024_partial_15_2065 : Poly :=
[
  term ((4513431950580501210863727625781466730076 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2256715975290250605431863812890733365038 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2065 for generator 15. -/
theorem ep_Q2_024_partial_15_2065_valid :
    mulPoly ep_Q2_024_coefficient_15_2065
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2065 := by
  native_decide

/-- Coefficient term 2066 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2066 : Poly :=
[
  term ((-259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (15, 1)]
]

/-- Partial product 2066 for generator 15. -/
def ep_Q2_024_partial_15_2066 : Poly :=
[
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (15, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2066 for generator 15. -/
theorem ep_Q2_024_partial_15_2066_valid :
    mulPoly ep_Q2_024_coefficient_15_2066
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2066 := by
  native_decide

/-- Coefficient term 2067 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2067 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2067 for generator 15. -/
def ep_Q2_024_partial_15_2067 : Poly :=
[
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2067 for generator 15. -/
theorem ep_Q2_024_partial_15_2067_valid :
    mulPoly ep_Q2_024_coefficient_15_2067
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2067 := by
  native_decide

/-- Coefficient term 2068 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2068 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 2068 for generator 15. -/
def ep_Q2_024_partial_15_2068 : Poly :=
[
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 2), (12, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2068 for generator 15. -/
theorem ep_Q2_024_partial_15_2068_valid :
    mulPoly ep_Q2_024_coefficient_15_2068
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2068 := by
  native_decide

/-- Coefficient term 2069 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2069 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2069 for generator 15. -/
def ep_Q2_024_partial_15_2069 : Poly :=
[
  term ((115944433813960 : Rat) / 1162780221153193) [(6, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2069 for generator 15. -/
theorem ep_Q2_024_partial_15_2069_valid :
    mulPoly ep_Q2_024_coefficient_15_2069
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2069 := by
  native_decide

/-- Coefficient term 2070 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2070 : Poly :=
[
  term ((-2171106079967871622040011721355043700 : Rat) / 119970945740247729656669352802953926799) [(12, 1)]
]

/-- Partial product 2070 for generator 15. -/
def ep_Q2_024_partial_15_2070 : Poly :=
[
  term ((-4342212159935743244080023442710087400 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1)],
  term ((2171106079967871622040011721355043700 : Rat) / 119970945740247729656669352802953926799) [(12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2070 for generator 15. -/
theorem ep_Q2_024_partial_15_2070_valid :
    mulPoly ep_Q2_024_coefficient_15_2070
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2070 := by
  native_decide

/-- Coefficient term 2071 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2071 : Poly :=
[
  term ((-100627186497768095756014244740644749963479143924725465057 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2071 for generator 15. -/
def ep_Q2_024_partial_15_2071 : Poly :=
[
  term ((-100627186497768095756014244740644749963479143924725465057 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((100627186497768095756014244740644749963479143924725465057 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2071 for generator 15. -/
theorem ep_Q2_024_partial_15_2071_valid :
    mulPoly ep_Q2_024_coefficient_15_2071
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2071 := by
  native_decide

/-- Coefficient term 2072 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2072 : Poly :=
[
  term ((2573312628706035 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2072 for generator 15. -/
def ep_Q2_024_partial_15_2072 : Poly :=
[
  term ((5146625257412070 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2573312628706035 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2072 for generator 15. -/
theorem ep_Q2_024_partial_15_2072_valid :
    mulPoly ep_Q2_024_coefficient_15_2072
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2072 := by
  native_decide

/-- Coefficient term 2073 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2073 : Poly :=
[
  term ((711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 2073 for generator 15. -/
def ep_Q2_024_partial_15_2073 : Poly :=
[
  term ((1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2073 for generator 15. -/
theorem ep_Q2_024_partial_15_2073_valid :
    mulPoly ep_Q2_024_coefficient_15_2073
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2073 := by
  native_decide

/-- Coefficient term 2074 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2074 : Poly :=
[
  term ((1944431909698480 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 2074 for generator 15. -/
def ep_Q2_024_partial_15_2074 : Poly :=
[
  term ((3888863819396960 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1944431909698480 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2074 for generator 15. -/
theorem ep_Q2_024_partial_15_2074_valid :
    mulPoly ep_Q2_024_coefficient_15_2074
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2074 := by
  native_decide

/-- Coefficient term 2075 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2075 : Poly :=
[
  term ((-178920812992727331645844914978808763164804683435148385183 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2075 for generator 15. -/
def ep_Q2_024_partial_15_2075 : Poly :=
[
  term ((-178920812992727331645844914978808763164804683435148385183 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((178920812992727331645844914978808763164804683435148385183 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2075 for generator 15. -/
theorem ep_Q2_024_partial_15_2075_valid :
    mulPoly ep_Q2_024_coefficient_15_2075
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2075 := by
  native_decide

/-- Coefficient term 2076 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2076 : Poly :=
[
  term ((4644446468927837 : Rat) / 4651120884612772) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2076 for generator 15. -/
def ep_Q2_024_partial_15_2076 : Poly :=
[
  term ((4644446468927837 : Rat) / 2325560442306386) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4644446468927837 : Rat) / 4651120884612772) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2076 for generator 15. -/
theorem ep_Q2_024_partial_15_2076_valid :
    mulPoly ep_Q2_024_coefficient_15_2076
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2076 := by
  native_decide

/-- Coefficient term 2077 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2077 : Poly :=
[
  term ((4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (15, 3)]
]

/-- Partial product 2077 for generator 15. -/
def ep_Q2_024_partial_15_2077 : Poly :=
[
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2077 for generator 15. -/
theorem ep_Q2_024_partial_15_2077_valid :
    mulPoly ep_Q2_024_coefficient_15_2077
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2077 := by
  native_decide

/-- Coefficient term 2078 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2078 : Poly :=
[
  term ((-898255108859200 : Rat) / 1162780221153193) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 2078 for generator 15. -/
def ep_Q2_024_partial_15_2078 : Poly :=
[
  term ((-1796510217718400 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((898255108859200 : Rat) / 1162780221153193) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2078 for generator 15. -/
theorem ep_Q2_024_partial_15_2078_valid :
    mulPoly ep_Q2_024_coefficient_15_2078
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2078 := by
  native_decide

/-- Coefficient term 2079 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2079 : Poly :=
[
  term ((-5956150632032731776871675238807568177 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2)]
]

/-- Partial product 2079 for generator 15. -/
def ep_Q2_024_partial_15_2079 : Poly :=
[
  term ((-11912301264065463553743350477615136354 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 1), (13, 2)],
  term ((5956150632032731776871675238807568177 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2079 for generator 15. -/
theorem ep_Q2_024_partial_15_2079_valid :
    mulPoly ep_Q2_024_coefficient_15_2079
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2079 := by
  native_decide

/-- Coefficient term 2080 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2080 : Poly :=
[
  term ((35646343387205276559768295962213703684 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 2080 for generator 15. -/
def ep_Q2_024_partial_15_2080 : Poly :=
[
  term ((71292686774410553119536591924427407368 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-35646343387205276559768295962213703684 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2080 for generator 15. -/
theorem ep_Q2_024_partial_15_2080_valid :
    mulPoly ep_Q2_024_coefficient_15_2080
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2080 := by
  native_decide

/-- Coefficient term 2081 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2081 : Poly :=
[
  term ((22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 2)]
]

/-- Partial product 2081 for generator 15. -/
def ep_Q2_024_partial_15_2081 : Poly :=
[
  term ((44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1), (13, 2), (14, 2)],
  term ((-22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2081 for generator 15. -/
theorem ep_Q2_024_partial_15_2081_valid :
    mulPoly ep_Q2_024_coefficient_15_2081
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2081 := by
  native_decide

/-- Coefficient term 2082 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2082 : Poly :=
[
  term ((46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (15, 2)]
]

/-- Partial product 2082 for generator 15. -/
def ep_Q2_024_partial_15_2082 : Poly :=
[
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2082 for generator 15. -/
theorem ep_Q2_024_partial_15_2082_valid :
    mulPoly ep_Q2_024_coefficient_15_2082
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2082 := by
  native_decide

/-- Coefficient term 2083 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2083 : Poly :=
[
  term ((2333972174105383381624929647646431819129 : Rat) / 3599128372207431889700080584088617803970) [(12, 1), (14, 1)]
]

/-- Partial product 2083 for generator 15. -/
def ep_Q2_024_partial_15_2083 : Poly :=
[
  term ((2333972174105383381624929647646431819129 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (12, 1), (14, 1)],
  term ((-2333972174105383381624929647646431819129 : Rat) / 3599128372207431889700080584088617803970) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2083 for generator 15. -/
theorem ep_Q2_024_partial_15_2083_valid :
    mulPoly ep_Q2_024_coefficient_15_2083
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2083 := by
  native_decide

/-- Coefficient term 2084 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2084 : Poly :=
[
  term ((15180541170369561101804430932522810879446235656117045777 : Rat) / 929998952132019818504773430836265897467346423247461380) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 2084 for generator 15. -/
def ep_Q2_024_partial_15_2084 : Poly :=
[
  term ((15180541170369561101804430932522810879446235656117045777 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-15180541170369561101804430932522810879446235656117045777 : Rat) / 929998952132019818504773430836265897467346423247461380) [(12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2084 for generator 15. -/
theorem ep_Q2_024_partial_15_2084_valid :
    mulPoly ep_Q2_024_coefficient_15_2084
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2084 := by
  native_decide

/-- Coefficient term 2085 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2085 : Poly :=
[
  term ((8690279857338671 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2085 for generator 15. -/
def ep_Q2_024_partial_15_2085 : Poly :=
[
  term ((17380559714677342 : Rat) / 1162780221153193) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8690279857338671 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2085 for generator 15. -/
theorem ep_Q2_024_partial_15_2085_valid :
    mulPoly ep_Q2_024_coefficient_15_2085
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2085 := by
  native_decide

/-- Coefficient term 2086 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2086 : Poly :=
[
  term ((-113735859996716653429015016342939245997 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (14, 2)]
]

/-- Partial product 2086 for generator 15. -/
def ep_Q2_024_partial_15_2086 : Poly :=
[
  term ((-227471719993433306858030032685878491994 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1), (14, 2)],
  term ((113735859996716653429015016342939245997 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2086 for generator 15. -/
theorem ep_Q2_024_partial_15_2086_valid :
    mulPoly ep_Q2_024_coefficient_15_2086
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2086 := by
  native_decide

/-- Coefficient term 2087 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2087 : Poly :=
[
  term ((110746012898057673927102069159216388484506324589221734683 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (15, 2)]
]

/-- Partial product 2087 for generator 15. -/
def ep_Q2_024_partial_15_2087 : Poly :=
[
  term ((110746012898057673927102069159216388484506324589221734683 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (12, 1), (15, 2)],
  term ((-110746012898057673927102069159216388484506324589221734683 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2087 for generator 15. -/
theorem ep_Q2_024_partial_15_2087_valid :
    mulPoly ep_Q2_024_coefficient_15_2087
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2087 := by
  native_decide

/-- Coefficient term 2088 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2088 : Poly :=
[
  term ((-1706754637262347 : Rat) / 2325560442306386) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2088 for generator 15. -/
def ep_Q2_024_partial_15_2088 : Poly :=
[
  term ((-1706754637262347 : Rat) / 1162780221153193) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1706754637262347 : Rat) / 2325560442306386) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2088 for generator 15. -/
theorem ep_Q2_024_partial_15_2088_valid :
    mulPoly ep_Q2_024_coefficient_15_2088
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2088 := by
  native_decide

/-- Coefficient term 2089 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2089 : Poly :=
[
  term ((-3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 2)]
]

/-- Partial product 2089 for generator 15. -/
def ep_Q2_024_partial_15_2089 : Poly :=
[
  term ((-3547621289883656721536675546465362102489 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (12, 2)],
  term ((3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2089 for generator 15. -/
theorem ep_Q2_024_partial_15_2089_valid :
    mulPoly ep_Q2_024_coefficient_15_2089
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2089 := by
  native_decide

/-- Coefficient term 2090 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2090 : Poly :=
[
  term ((2051752662630417419944615142955974061740499318920404108 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2090 for generator 15. -/
def ep_Q2_024_partial_15_2090 : Poly :=
[
  term ((4103505325260834839889230285911948123480998637840808216 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2051752662630417419944615142955974061740499318920404108 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2090 for generator 15. -/
theorem ep_Q2_024_partial_15_2090_valid :
    mulPoly ep_Q2_024_coefficient_15_2090
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2090 := by
  native_decide

/-- Coefficient term 2091 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2091 : Poly :=
[
  term ((1269203461259312 : Rat) / 1162780221153193) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2091 for generator 15. -/
def ep_Q2_024_partial_15_2091 : Poly :=
[
  term ((2538406922518624 : Rat) / 1162780221153193) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1269203461259312 : Rat) / 1162780221153193) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2091 for generator 15. -/
theorem ep_Q2_024_partial_15_2091_valid :
    mulPoly ep_Q2_024_coefficient_15_2091
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2091 := by
  native_decide

/-- Coefficient term 2092 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2092 : Poly :=
[
  term ((-226511025274083114392684760909110413859786777991142239 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 2), (13, 1), (15, 1)]
]

/-- Partial product 2092 for generator 15. -/
def ep_Q2_024_partial_15_2092 : Poly :=
[
  term ((-453022050548166228785369521818220827719573555982284478 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((226511025274083114392684760909110413859786777991142239 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2092 for generator 15. -/
theorem ep_Q2_024_partial_15_2092_valid :
    mulPoly ep_Q2_024_coefficient_15_2092
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2092 := by
  native_decide

/-- Coefficient term 2093 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2093 : Poly :=
[
  term ((884148848535676 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2093 for generator 15. -/
def ep_Q2_024_partial_15_2093 : Poly :=
[
  term ((1768297697071352 : Rat) / 1162780221153193) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-884148848535676 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2093 for generator 15. -/
theorem ep_Q2_024_partial_15_2093_valid :
    mulPoly ep_Q2_024_coefficient_15_2093
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2093 := by
  native_decide

/-- Coefficient term 2094 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2094 : Poly :=
[
  term ((-17584558770739660517560042664784307136 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2)]
]

/-- Partial product 2094 for generator 15. -/
def ep_Q2_024_partial_15_2094 : Poly :=
[
  term ((-35169117541479321035120085329568614272 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 2), (13, 2)],
  term ((17584558770739660517560042664784307136 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2094 for generator 15. -/
theorem ep_Q2_024_partial_15_2094_valid :
    mulPoly ep_Q2_024_coefficient_15_2094
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2094 := by
  native_decide

/-- Coefficient term 2095 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2095 : Poly :=
[
  term ((-98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2), (14, 1)]
]

/-- Partial product 2095 for generator 15. -/
def ep_Q2_024_partial_15_2095 : Poly :=
[
  term ((-197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 2), (13, 2), (14, 1)],
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2095 for generator 15. -/
theorem ep_Q2_024_partial_15_2095_valid :
    mulPoly ep_Q2_024_coefficient_15_2095
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2095 := by
  native_decide

/-- Coefficient term 2096 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2096 : Poly :=
[
  term ((-89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (14, 1)]
]

/-- Partial product 2096 for generator 15. -/
def ep_Q2_024_partial_15_2096 : Poly :=
[
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 2), (14, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2096 for generator 15. -/
theorem ep_Q2_024_partial_15_2096_valid :
    mulPoly ep_Q2_024_coefficient_15_2096
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2096 := by
  native_decide

/-- Coefficient term 2097 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2097 : Poly :=
[
  term ((-3692447632406855500674698553989002081140768070342209532 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (14, 1), (15, 2)]
]

/-- Partial product 2097 for generator 15. -/
def ep_Q2_024_partial_15_2097 : Poly :=
[
  term ((-7384895264813711001349397107978004162281536140684419064 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((3692447632406855500674698553989002081140768070342209532 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2097 for generator 15. -/
theorem ep_Q2_024_partial_15_2097_valid :
    mulPoly ep_Q2_024_coefficient_15_2097
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2097 := by
  native_decide

/-- Coefficient term 2098 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2098 : Poly :=
[
  term ((-362799607875184 : Rat) / 1162780221153193) [(12, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2098 for generator 15. -/
def ep_Q2_024_partial_15_2098 : Poly :=
[
  term ((-725599215750368 : Rat) / 1162780221153193) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((362799607875184 : Rat) / 1162780221153193) [(12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2098 for generator 15. -/
theorem ep_Q2_024_partial_15_2098_valid :
    mulPoly ep_Q2_024_coefficient_15_2098
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2098 := by
  native_decide

/-- Coefficient term 2099 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_2099 : Poly :=
[
  term ((56984541335742393675937923018603674853194430506664255793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(12, 2), (15, 2)]
]

/-- Partial product 2099 for generator 15. -/
def ep_Q2_024_partial_15_2099 : Poly :=
[
  term ((56984541335742393675937923018603674853194430506664255793 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 2), (15, 2)],
  term ((-56984541335742393675937923018603674853194430506664255793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2099 for generator 15. -/
theorem ep_Q2_024_partial_15_2099_valid :
    mulPoly ep_Q2_024_coefficient_15_2099
        ep_Q2_024_generator_15_2000_2099 =
      ep_Q2_024_partial_15_2099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_2000_2099 : List Poly :=
[
  ep_Q2_024_partial_15_2000,
  ep_Q2_024_partial_15_2001,
  ep_Q2_024_partial_15_2002,
  ep_Q2_024_partial_15_2003,
  ep_Q2_024_partial_15_2004,
  ep_Q2_024_partial_15_2005,
  ep_Q2_024_partial_15_2006,
  ep_Q2_024_partial_15_2007,
  ep_Q2_024_partial_15_2008,
  ep_Q2_024_partial_15_2009,
  ep_Q2_024_partial_15_2010,
  ep_Q2_024_partial_15_2011,
  ep_Q2_024_partial_15_2012,
  ep_Q2_024_partial_15_2013,
  ep_Q2_024_partial_15_2014,
  ep_Q2_024_partial_15_2015,
  ep_Q2_024_partial_15_2016,
  ep_Q2_024_partial_15_2017,
  ep_Q2_024_partial_15_2018,
  ep_Q2_024_partial_15_2019,
  ep_Q2_024_partial_15_2020,
  ep_Q2_024_partial_15_2021,
  ep_Q2_024_partial_15_2022,
  ep_Q2_024_partial_15_2023,
  ep_Q2_024_partial_15_2024,
  ep_Q2_024_partial_15_2025,
  ep_Q2_024_partial_15_2026,
  ep_Q2_024_partial_15_2027,
  ep_Q2_024_partial_15_2028,
  ep_Q2_024_partial_15_2029,
  ep_Q2_024_partial_15_2030,
  ep_Q2_024_partial_15_2031,
  ep_Q2_024_partial_15_2032,
  ep_Q2_024_partial_15_2033,
  ep_Q2_024_partial_15_2034,
  ep_Q2_024_partial_15_2035,
  ep_Q2_024_partial_15_2036,
  ep_Q2_024_partial_15_2037,
  ep_Q2_024_partial_15_2038,
  ep_Q2_024_partial_15_2039,
  ep_Q2_024_partial_15_2040,
  ep_Q2_024_partial_15_2041,
  ep_Q2_024_partial_15_2042,
  ep_Q2_024_partial_15_2043,
  ep_Q2_024_partial_15_2044,
  ep_Q2_024_partial_15_2045,
  ep_Q2_024_partial_15_2046,
  ep_Q2_024_partial_15_2047,
  ep_Q2_024_partial_15_2048,
  ep_Q2_024_partial_15_2049,
  ep_Q2_024_partial_15_2050,
  ep_Q2_024_partial_15_2051,
  ep_Q2_024_partial_15_2052,
  ep_Q2_024_partial_15_2053,
  ep_Q2_024_partial_15_2054,
  ep_Q2_024_partial_15_2055,
  ep_Q2_024_partial_15_2056,
  ep_Q2_024_partial_15_2057,
  ep_Q2_024_partial_15_2058,
  ep_Q2_024_partial_15_2059,
  ep_Q2_024_partial_15_2060,
  ep_Q2_024_partial_15_2061,
  ep_Q2_024_partial_15_2062,
  ep_Q2_024_partial_15_2063,
  ep_Q2_024_partial_15_2064,
  ep_Q2_024_partial_15_2065,
  ep_Q2_024_partial_15_2066,
  ep_Q2_024_partial_15_2067,
  ep_Q2_024_partial_15_2068,
  ep_Q2_024_partial_15_2069,
  ep_Q2_024_partial_15_2070,
  ep_Q2_024_partial_15_2071,
  ep_Q2_024_partial_15_2072,
  ep_Q2_024_partial_15_2073,
  ep_Q2_024_partial_15_2074,
  ep_Q2_024_partial_15_2075,
  ep_Q2_024_partial_15_2076,
  ep_Q2_024_partial_15_2077,
  ep_Q2_024_partial_15_2078,
  ep_Q2_024_partial_15_2079,
  ep_Q2_024_partial_15_2080,
  ep_Q2_024_partial_15_2081,
  ep_Q2_024_partial_15_2082,
  ep_Q2_024_partial_15_2083,
  ep_Q2_024_partial_15_2084,
  ep_Q2_024_partial_15_2085,
  ep_Q2_024_partial_15_2086,
  ep_Q2_024_partial_15_2087,
  ep_Q2_024_partial_15_2088,
  ep_Q2_024_partial_15_2089,
  ep_Q2_024_partial_15_2090,
  ep_Q2_024_partial_15_2091,
  ep_Q2_024_partial_15_2092,
  ep_Q2_024_partial_15_2093,
  ep_Q2_024_partial_15_2094,
  ep_Q2_024_partial_15_2095,
  ep_Q2_024_partial_15_2096,
  ep_Q2_024_partial_15_2097,
  ep_Q2_024_partial_15_2098,
  ep_Q2_024_partial_15_2099
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_2000_2099 : Poly :=
[
  term ((-207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((1624539094208615819329210045164617550317754730169205571001 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8096118816025563 : Rat) / 2325560442306386) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62806934852525941268185730253463325359364416002864186299 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-29044898205342182 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-220154479092286088114368163945967902964441455056572775393 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((4004120440815739 : Rat) / 2325560442306386) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (12, 1), (15, 3)],
  term ((-1249107794586464 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1122361739494494134813541532211856677008 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((37648700717531276776562294669773430924 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-32308823398589358505785030365517698217216757534155423611 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((5832264222063603 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-615619649892803691839225179056574397895212913912736413337 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-59886801146866879 : Rat) / 6976681326919158) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 3), (13, 1)],
  term ((25139328452534028572442634900325055710038373424316626143 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (9, 1), (12, 3), (15, 1)],
  term ((-4569079916135479 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((314688800998853570750485392958593183239 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1)],
  term ((-2713772427555435187147802217931282201784 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-16634052491714377238235294415443172614248 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((8486750246624093521424296941571253888 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 1), (14, 3)],
  term ((6213257326497533998434406865439742334811255363356619031 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1996682019358932 : Rat) / 1162780221153193) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-182848986207008493094695551063545737344 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((119713423097193330689087450274257183499694930181445633257 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-11527705892893849 : Rat) / 2325560442306386) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-55671291068105150782818935938743289169734649859706824367 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((-90306014185731673 : Rat) / 3488340663459579) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (9, 1), (14, 3), (15, 1)],
  term ((1667935482081904 : Rat) / 1162780221153193) [(6, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-24381871583415222619427240024539885248092857597419037319 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (9, 1), (15, 1)],
  term ((1235944130217429 : Rat) / 2325560442306386) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (9, 1), (15, 3)],
  term ((-136850605782984 : Rat) / 1162780221153193) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-1828701926258867392071461481533010175006 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2)],
  term ((7976652910574244353965158091777440511492 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (12, 1)],
  term ((-775662412348343608495185533612128526424 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((3813787790979841501322937562585614036464 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (12, 2)],
  term ((-63112532186469946331305143931700421056 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((1606789351990275971759311424755714940468 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 2), (14, 1)],
  term ((-91127369684959552203310296578882260592 : Rat) / 3389009766673664679566930870139941435) [(6, 1), (9, 2), (14, 2)],
  term ((3928170973431556897968641917911482171402 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-136332940760355540295760008520290388192 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-7941159738640092377781708051038156584201845832521631328 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1094804846263872 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-27491063214868865162112024830977996352 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((15245504119454830556977106385771944330465046899001672898 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7571806642306376 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((624553897293232 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-278572919499171938003108304402158252454662811974073471673 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((14078238642132395 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-805341698516247746487407736754202445236 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-7181570345025089215510545206361812704 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((4074480252190612073483360722046549035277896901160054012 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-6024279800694704 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((63266169461659354395606229885235433260289045114720801271 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-6533280838736367 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1576427228864685585532861798833297750976 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (12, 3), (13, 1)],
  term ((-14190503691287756559998110760772247013129470784083539996 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (11, 1), (12, 3), (15, 1)],
  term ((10570809984421360 : Rat) / 1162780221153193) [(6, 1), (11, 1), (12, 3), (15, 1), (16, 1)],
  term ((4513431950580501210863727625781466730076 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 1), (15, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (11, 2), (12, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(6, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4342212159935743244080023442710087400 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1)],
  term ((-100627186497768095756014244740644749963479143924725465057 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5146625257412070 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1422526770560142681406634024494915095373669574068378424 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3888863819396960 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-178920812992727331645844914978808763164804683435148385183 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((4644446468927837 : Rat) / 2325560442306386) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8932230819593789109350084471869951301087548508526939872 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((-1796510217718400 : Rat) / 1162780221153193) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-11912301264065463553743350477615136354 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 1), (13, 2)],
  term ((71292686774410553119536591924427407368 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((44741039465109071923402142474522467712 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1), (13, 2), (14, 2)],
  term ((93212013096392473427083411308443024896 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((2333972174105383381624929647646431819129 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (12, 1), (14, 1)],
  term ((15180541170369561101804430932522810879446235656117045777 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((17380559714677342 : Rat) / 1162780221153193) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-227471719993433306858030032685878491994 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (12, 1), (14, 2)],
  term ((110746012898057673927102069159216388484506324589221734683 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (12, 1), (15, 2)],
  term ((-1706754637262347 : Rat) / 1162780221153193) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3547621289883656721536675546465362102489 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (12, 2)],
  term ((4103505325260834839889230285911948123480998637840808216 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((2538406922518624 : Rat) / 1162780221153193) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-453022050548166228785369521818220827719573555982284478 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((1768297697071352 : Rat) / 1162780221153193) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-35169117541479321035120085329568614272 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 2), (13, 2)],
  term ((-197773517925461086681542750109224956096 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (12, 2), (13, 2), (14, 1)],
  term ((-179900494408894967444133818184926615716 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (12, 2), (14, 1)],
  term ((-7384895264813711001349397107978004162281536140684419064 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-725599215750368 : Rat) / 1162780221153193) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((56984541335742393675937923018603674853194430506664255793 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (12, 2), (15, 2)],
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1624539094208615819329210045164617550317754730169205571001 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((8096118816025563 : Rat) / 4651120884612772) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62806934852525941268185730253463325359364416002864186299 : Rat) / 929998952132019818504773430836265897467346423247461380) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((14522449102671091 : Rat) / 1162780221153193) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((220154479092286088114368163945967902964441455056572775393 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 1), (15, 1)],
  term ((-4004120440815739 : Rat) / 4651120884612772) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (15, 3)],
  term ((624553897293232 : Rat) / 1162780221153193) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((561180869747247067406770766105928338504 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (12, 2), (13, 1)],
  term ((-18824350358765638388281147334886715462 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((32308823398589358505785030365517698217216757534155423611 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-5832264222063603 : Rat) / 2325560442306386) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((615619649892803691839225179056574397895212913912736413337 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (12, 2), (15, 1)],
  term ((59886801146866879 : Rat) / 13953362653838316) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 3), (13, 1)],
  term ((-25139328452534028572442634900325055710038373424316626143 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(9, 1), (12, 3), (15, 1)],
  term ((4569079916135479 : Rat) / 2325560442306386) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-314688800998853570750485392958593183239 : Rat) / 1199709457402477296566693528029539267990) [(9, 1), (13, 1)],
  term ((1356886213777717593573901108965641100892 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 1)],
  term ((8317026245857188619117647207721586307124 : Rat) / 1799564186103715944850040292044308901985) [(9, 1), (13, 1), (14, 2)],
  term ((-4243375123312046760712148470785626944 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 1), (14, 3)],
  term ((-6213257326497533998434406865439742334811255363356619031 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (13, 1), (15, 2)],
  term ((998341009679466 : Rat) / 1162780221153193) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((91424493103504246547347775531772868672 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (13, 2), (15, 1)],
  term ((-119713423097193330689087450274257183499694930181445633257 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(9, 1), (14, 1), (15, 1)],
  term ((11527705892893849 : Rat) / 4651120884612772) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((55671291068105150782818935938743289169734649859706824367 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(9, 1), (14, 2), (15, 1)],
  term ((90306014185731673 : Rat) / 6976681326919158) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(9, 1), (14, 3), (15, 1)],
  term ((-833967741040952 : Rat) / 1162780221153193) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((24381871583415222619427240024539885248092857597419037319 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(9, 1), (15, 1)],
  term ((-1235944130217429 : Rat) / 4651120884612772) [(9, 1), (15, 1), (16, 1)],
  term ((-164811286342967808698294818897798801710593850205157267 : Rat) / 232499738033004954626193357709066474366836605811865345) [(9, 1), (15, 3)],
  term ((68425302891492 : Rat) / 1162780221153193) [(9, 1), (15, 3), (16, 1)],
  term ((914350963129433696035730740766505087503 : Rat) / 599854728701238648283346764014769633995) [(9, 2)],
  term ((-3988326455287122176982579045888720255746 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 1)],
  term ((387831206174171804247592766806064263212 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (12, 1), (14, 1)],
  term ((-1906893895489920750661468781292807018232 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (12, 2)],
  term ((31556266093234973165652571965850210528 : Rat) / 199951576233746216094448921338256544665) [(9, 2), (13, 1), (15, 1)],
  term ((-803394675995137985879655712377857470234 : Rat) / 599854728701238648283346764014769633995) [(9, 2), (14, 1)],
  term ((45563684842479776101655148289441130296 : Rat) / 3389009766673664679566930870139941435) [(9, 2), (14, 2)],
  term ((-1964085486715778448984320958955741085701 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (12, 1), (13, 1)],
  term ((68166470380177770147880004260145194096 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((3970579869320046188890854025519078292100922916260815664 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-547402423131936 : Rat) / 1162780221153193) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((13745531607434432581056012415488998176 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-7622752059727415278488553192885972165232523449500836449 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3785903321153188 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((278572919499171938003108304402158252454662811974073471673 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(11, 1), (12, 1), (15, 1)],
  term ((-14078238642132395 : Rat) / 2325560442306386) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 1), (12, 1), (15, 3)],
  term ((-312276948646616 : Rat) / 1162780221153193) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((402670849258123873243703868377101222618 : Rat) / 199951576233746216094448921338256544665) [(11, 1), (12, 2), (13, 1)],
  term ((3590785172512544607755272603180906352 : Rat) / 39990315246749243218889784267651308933) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2037240126095306036741680361023274517638948450580027006 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((3012139900347352 : Rat) / 1162780221153193) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-63266169461659354395606229885235433260289045114720801271 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(11, 1), (12, 2), (15, 1)],
  term ((6533280838736367 : Rat) / 2325560442306386) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-788213614432342792766430899416648875488 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (12, 3), (13, 1)],
  term ((7095251845643878279999055380386123506564735392041769998 : Rat) / 232499738033004954626193357709066474366836605811865345) [(11, 1), (12, 3), (15, 1)],
  term ((-5285404992210680 : Rat) / 1162780221153193) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-2256715975290250605431863812890733365038 : Rat) / 1799564186103715944850040292044308901985) [(11, 1), (13, 1), (14, 1)],
  term ((259271587441775770073257543406488449392 : Rat) / 599854728701238648283346764014769633995) [(11, 1), (15, 1)],
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(11, 2), (12, 1), (15, 2)],
  term ((-57972216906980 : Rat) / 1162780221153193) [(11, 2), (12, 1), (15, 2), (16, 1)],
  term ((2171106079967871622040011721355043700 : Rat) / 119970945740247729656669352802953926799) [(12, 1)],
  term ((100627186497768095756014244740644749963479143924725465057 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2573312628706035 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-711263385280071340703317012247457547686834787034189212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1944431909698480 : Rat) / 1162780221153193) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((178920812992727331645844914978808763164804683435148385183 : Rat) / 11159987425584237822057281170035190769608157078969536560) [(12, 1), (13, 1), (15, 1)],
  term ((-4644446468927837 : Rat) / 4651120884612772) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4466115409796894554675042235934975650543774254263469936 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 1), (13, 1), (15, 3)],
  term ((898255108859200 : Rat) / 1162780221153193) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((5956150632032731776871675238807568177 : Rat) / 199951576233746216094448921338256544665) [(12, 1), (13, 2)],
  term ((-35646343387205276559768295962213703684 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 1)],
  term ((-22370519732554535961701071237261233856 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (13, 2), (14, 2)],
  term ((-46606006548196236713541705654221512448 : Rat) / 599854728701238648283346764014769633995) [(12, 1), (13, 2), (15, 2)],
  term ((-2333972174105383381624929647646431819129 : Rat) / 3599128372207431889700080584088617803970) [(12, 1), (14, 1)],
  term ((-15180541170369561101804430932522810879446235656117045777 : Rat) / 929998952132019818504773430836265897467346423247461380) [(12, 1), (14, 1), (15, 2)],
  term ((-8690279857338671 : Rat) / 1162780221153193) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((113735859996716653429015016342939245997 : Rat) / 119970945740247729656669352802953926799) [(12, 1), (14, 2)],
  term ((-110746012898057673927102069159216388484506324589221734683 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(12, 1), (15, 2)],
  term ((1706754637262347 : Rat) / 2325560442306386) [(12, 1), (15, 2), (16, 1)],
  term ((3547621289883656721536675546465362102489 : Rat) / 3599128372207431889700080584088617803970) [(12, 2)],
  term ((-2051752662630417419944615142955974061740499318920404108 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1269203461259312 : Rat) / 1162780221153193) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((226511025274083114392684760909110413859786777991142239 : Rat) / 232499738033004954626193357709066474366836605811865345) [(12, 2), (13, 1), (15, 1)],
  term ((-884148848535676 : Rat) / 1162780221153193) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((17584558770739660517560042664784307136 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2)],
  term ((98886758962730543340771375054612478048 : Rat) / 599854728701238648283346764014769633995) [(12, 2), (13, 2), (14, 1)],
  term ((89950247204447483722066909092463307858 : Rat) / 199951576233746216094448921338256544665) [(12, 2), (14, 1)],
  term ((3692447632406855500674698553989002081140768070342209532 : Rat) / 697499214099014863878580073127199423100509817435596035) [(12, 2), (14, 1), (15, 2)],
  term ((362799607875184 : Rat) / 1162780221153193) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-56984541335742393675937923018603674853194430506664255793 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 2000 through 2099. -/
theorem ep_Q2_024_block_15_2000_2099_valid :
    checkProductSumEq ep_Q2_024_partials_15_2000_2099
      ep_Q2_024_block_15_2000_2099 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
