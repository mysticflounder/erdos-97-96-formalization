/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:2000-2099

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 2000 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2000 : Poly :=
[
  term ((-17678256226348968010868 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2000 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2000 : Poly :=
[
  term ((17678256226348968010868 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35356512452697936021736 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2000 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2000_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2000
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2000 := by
  native_decide

/-- Coefficient term 2001 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2001 : Poly :=
[
  term ((-55765329354387316517569699 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2001 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2001 : Poly :=
[
  term ((-111530658708774633035139398 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((55765329354387316517569699 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2001 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2001_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2001
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2001 := by
  native_decide

/-- Coefficient term 2002 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2002 : Poly :=
[
  term ((2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 2002 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2002 : Poly :=
[
  term ((-2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 14396230997279368325085551127682882187692688203199173425619564386) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2002 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2002_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2002
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2002 := by
  native_decide

/-- Coefficient term 2003 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2003 : Poly :=
[
  term ((10998115966491984 : Rat) / 7342292683791569) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2003 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2003 : Poly :=
[
  term ((-10998115966491984 : Rat) / 7342292683791569) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21996231932983968 : Rat) / 7342292683791569) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2003 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2003_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2003
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2003 := by
  native_decide

/-- Coefficient term 2004 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2004 : Poly :=
[
  term ((1358948211893892793410039198627410284579899004912433797812161165266257787249133007247 : Rat) / 771744909885850600495524239882774568192756146996806061879522024382568190401459200) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 2004 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2004 : Poly :=
[
  term ((1358948211893892793410039198627410284579899004912433797812161165266257787249133007247 : Rat) / 385872454942925300247762119941387284096378073498403030939761012191284095200729600) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1358948211893892793410039198627410284579899004912433797812161165266257787249133007247 : Rat) / 771744909885850600495524239882774568192756146996806061879522024382568190401459200) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2004 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2004_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2004
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2004 := by
  native_decide

/-- Coefficient term 2005 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2005 : Poly :=
[
  term ((150662426558771192627309708 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2005 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2005 : Poly :=
[
  term ((301324853117542385254619416 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-150662426558771192627309708 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2005 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2005_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2005
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2005 := by
  native_decide

/-- Coefficient term 2006 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2006 : Poly :=
[
  term ((461441701634154561390309104572327306580609 : Rat) / 942075594658284480195544480389661887750) [(9, 1), (10, 1), (12, 2), (13, 1)]
]

/-- Partial product 2006 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2006 : Poly :=
[
  term ((-461441701634154561390309104572327306580609 : Rat) / 942075594658284480195544480389661887750) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((461441701634154561390309104572327306580609 : Rat) / 471037797329142240097772240194830943875) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2006 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2006_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2006
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2006 := by
  native_decide

/-- Coefficient term 2007 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2007 : Poly :=
[
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 2007 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2007 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2007 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2007_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2007
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2007 := by
  native_decide

/-- Coefficient term 2008 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2008 : Poly :=
[
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2008 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2008 : Poly :=
[
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2008 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2008_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2008
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2008 := by
  native_decide

/-- Coefficient term 2009 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2009 : Poly :=
[
  term ((38992079646219941389816 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 2009 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2009 : Poly :=
[
  term ((77984159292439882779632 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-38992079646219941389816 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2009 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2009_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2009
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2009 := by
  native_decide

/-- Coefficient term 2010 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2010 : Poly :=
[
  term ((-29872325662771717645217013473890565490968292126921220315808164188810574167973 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 2010 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2010 : Poly :=
[
  term ((-29872325662771717645217013473890565490968292126921220315808164188810574167973 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((29872325662771717645217013473890565490968292126921220315808164188810574167973 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2010 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2010_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2010
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2010 := by
  native_decide

/-- Coefficient term 2011 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2011 : Poly :=
[
  term ((-278148355353337795548 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 2011 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2011 : Poly :=
[
  term ((-556296710706675591096 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((278148355353337795548 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2011 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2011_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2011
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2011 := by
  native_decide

/-- Coefficient term 2012 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2012 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 3), (15, 1)]
]

/-- Partial product 2012 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2012 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 1), (12, 3), (14, 1), (15, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2012 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2012_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2012
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2012 := by
  native_decide

/-- Coefficient term 2013 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2013 : Poly :=
[
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 2013 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2013 : Poly :=
[
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2013 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2013_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2013
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2013 := by
  native_decide

/-- Coefficient term 2014 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2014 : Poly :=
[
  term ((554883214230871208839762459374331365749320130430491667346074297989421804911299671989 : Rat) / 514496606590567066997016159921849712128504097997870707919681349588378793600972800) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 2014 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2014 : Poly :=
[
  term ((-554883214230871208839762459374331365749320130430491667346074297989421804911299671989 : Rat) / 514496606590567066997016159921849712128504097997870707919681349588378793600972800) [(9, 1), (10, 1), (13, 1)],
  term ((554883214230871208839762459374331365749320130430491667346074297989421804911299671989 : Rat) / 257248303295283533498508079960924856064252048998935353959840674794189396800486400) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2014 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2014_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2014
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2014 := by
  native_decide

/-- Coefficient term 2015 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2015 : Poly :=
[
  term ((1040971542958823933144912787039699424667375260181021715702337315162659132380017 : Rat) / 84546988374874079808887405771557248925586782098686027813269284003348837686400) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 2015 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2015 : Poly :=
[
  term ((-1040971542958823933144912787039699424667375260181021715702337315162659132380017 : Rat) / 84546988374874079808887405771557248925586782098686027813269284003348837686400) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1040971542958823933144912787039699424667375260181021715702337315162659132380017 : Rat) / 42273494187437039904443702885778624462793391049343013906634642001674418843200) [(9, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2015 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2015_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2015
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2015 := by
  native_decide

/-- Coefficient term 2016 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2016 : Poly :=
[
  term ((6264422184418272469188409 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2016 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2016 : Poly :=
[
  term ((-6264422184418272469188409 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((12528844368836544938376818 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2016 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2016_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2016
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2016 := by
  native_decide

/-- Coefficient term 2017 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2017 : Poly :=
[
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 2017 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2017 : Poly :=
[
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2017 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2017_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2017
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2017 := by
  native_decide

/-- Coefficient term 2018 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2018 : Poly :=
[
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2018 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2018 : Poly :=
[
  term ((972214275157813717938 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2018 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2018_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2018
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2018 := by
  native_decide

/-- Coefficient term 2019 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2019 : Poly :=
[
  term ((64044666596978914198547413 : Rat) / 2525448310030605822912210) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 2019 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2019 : Poly :=
[
  term ((64044666596978914198547413 : Rat) / 1262724155015302911456105) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-64044666596978914198547413 : Rat) / 2525448310030605822912210) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2019 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2019_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2019
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2019 := by
  native_decide

/-- Coefficient term 2020 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2020 : Poly :=
[
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 2020 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2020 : Poly :=
[
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2020 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2020_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2020
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2020 := by
  native_decide

/-- Coefficient term 2021 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2021 : Poly :=
[
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2021 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2021 : Poly :=
[
  term ((-18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2021 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2021_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2021
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2021 := by
  native_decide

/-- Coefficient term 2022 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2022 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 1), (13, 3)]
]

/-- Partial product 2022 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2022 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 1), (13, 3)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2022 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2022_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2022
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2022 := by
  native_decide

/-- Coefficient term 2023 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2023 : Poly :=
[
  term ((-8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 2023 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2023 : Poly :=
[
  term ((8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 9327428560380020141523124317981594818819547022960141817486031721111590144000) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(9, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2023 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2023_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2023
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2023 := by
  native_decide

/-- Coefficient term 2024 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2024 : Poly :=
[
  term ((-574354170564423016258 : Rat) / 32049107564750198685) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2024 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2024 : Poly :=
[
  term ((574354170564423016258 : Rat) / 32049107564750198685) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1148708341128846032516 : Rat) / 32049107564750198685) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2024 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2024_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2024
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2024 := by
  native_decide

/-- Coefficient term 2025 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2025 : Poly :=
[
  term ((-6269532968492965262223314310922587333361002675069259645765924524226778623742267875523 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 2025 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2025 : Poly :=
[
  term ((-6269532968492965262223314310922587333361002675069259645765924524226778623742267875523 : Rat) / 1929362274714626501238810599706936420481890367492015154698805060956420476003648000) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((6269532968492965262223314310922587333361002675069259645765924524226778623742267875523 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2025 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2025_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2025
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2025 := by
  native_decide

/-- Coefficient term 2026 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2026 : Poly :=
[
  term ((-234146249966431483882644721 : Rat) / 7576344930091817468736630) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 2026 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2026 : Poly :=
[
  term ((-234146249966431483882644721 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((234146249966431483882644721 : Rat) / 7576344930091817468736630) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2026 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2026_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2026
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2026 := by
  native_decide

/-- Coefficient term 2027 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2027 : Poly :=
[
  term ((32820990624515682959095597448726571559968022416943071613654707626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 2), (11, 1)]
]

/-- Partial product 2027 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2027 : Poly :=
[
  term ((-32820990624515682959095597448726571559968022416943071613654707626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 2), (11, 1)],
  term ((65641981249031365918191194897453143119936044833886143227309415252 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2027 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2027_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2027
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2027 := by
  native_decide

/-- Coefficient term 2028 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2028 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (12, 1)]
]

/-- Partial product 2028 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2028 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2028 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2028_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2028
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2028 := by
  native_decide

/-- Coefficient term 2029 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2029 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 2029 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2029 : Poly :=
[
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2029 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2029_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2029
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2029 := by
  native_decide

/-- Coefficient term 2030 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2030 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (14, 1)]
]

/-- Partial product 2030 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2030 : Poly :=
[
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2030 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2030_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2030
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2030 := by
  native_decide

/-- Coefficient term 2031 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2031 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 2031 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2031 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2031 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2031_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2031
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2031 := by
  native_decide

/-- Coefficient term 2032 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2032 : Poly :=
[
  term ((1208921285421916659216 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 2032 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2032 : Poly :=
[
  term ((2417842570843833318432 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1208921285421916659216 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2032 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2032_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2032
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2032 := by
  native_decide

/-- Coefficient term 2033 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2033 : Poly :=
[
  term ((-135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 2), (12, 1), (13, 1)]
]

/-- Partial product 2033 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2033 : Poly :=
[
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2033 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2033_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2033
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2033 := by
  native_decide

/-- Coefficient term 2034 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2034 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2034 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2034 : Poly :=
[
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2034 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2034_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2034
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2034 := by
  native_decide

/-- Coefficient term 2035 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2035 : Poly :=
[
  term ((-210550014651819344959139591238183882621817541685310314670831382105205408416 : Rat) / 3783066132180433840245892655156305883339901117674596748517561748431631125) [(9, 1), (10, 2), (12, 1), (15, 1)]
]

/-- Partial product 2035 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2035 : Poly :=
[
  term ((-421100029303638689918279182476367765243635083370620629341662764210410816832 : Rat) / 3783066132180433840245892655156305883339901117674596748517561748431631125) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((210550014651819344959139591238183882621817541685310314670831382105205408416 : Rat) / 3783066132180433840245892655156305883339901117674596748517561748431631125) [(9, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2035 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2035_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2035
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2035 := by
  native_decide

/-- Coefficient term 2036 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2036 : Poly :=
[
  term ((444573560003453283264 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2036 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2036 : Poly :=
[
  term ((889147120006906566528 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-444573560003453283264 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2036 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2036_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2036
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2036 := by
  native_decide

/-- Coefficient term 2037 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2037 : Poly :=
[
  term ((-197619821437186068491659620882290295144850262779190643626776663 : Rat) / 1703142937111965308336017788401719373308212279355010178725340) [(9, 1), (10, 2), (13, 1)]
]

/-- Partial product 2037 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2037 : Poly :=
[
  term ((197619821437186068491659620882290295144850262779190643626776663 : Rat) / 1703142937111965308336017788401719373308212279355010178725340) [(9, 1), (10, 2), (13, 1)],
  term ((-197619821437186068491659620882290295144850262779190643626776663 : Rat) / 851571468555982654168008894200859686654106139677505089362670) [(9, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2037 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2037_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2037
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2037 := by
  native_decide

/-- Coefficient term 2038 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2038 : Poly :=
[
  term ((2431938818678725092656732583307098876685592 : Rat) / 29675381231735961126159651132274349464125) [(9, 1), (10, 2), (13, 1), (14, 1)]
]

/-- Partial product 2038 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2038 : Poly :=
[
  term ((-2431938818678725092656732583307098876685592 : Rat) / 29675381231735961126159651132274349464125) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((4863877637357450185313465166614197753371184 : Rat) / 29675381231735961126159651132274349464125) [(9, 1), (10, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2038 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2038_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2038
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2038 := by
  native_decide

/-- Coefficient term 2039 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2039 : Poly :=
[
  term ((35475871759773640960 : Rat) / 53133774669274265157) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2039 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2039 : Poly :=
[
  term ((-35475871759773640960 : Rat) / 53133774669274265157) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((70951743519547281920 : Rat) / 53133774669274265157) [(9, 1), (10, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2039 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2039_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2039
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2039 := by
  native_decide

/-- Coefficient term 2040 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2040 : Poly :=
[
  term ((-7145992579464943698156 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 2040 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2040 : Poly :=
[
  term ((-14291985158929887396312 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((7145992579464943698156 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2040 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2040_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2040
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2040 := by
  native_decide

/-- Coefficient term 2041 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2041 : Poly :=
[
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(9, 1), (10, 2), (14, 1), (15, 1)]
]

/-- Partial product 2041 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2041 : Poly :=
[
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(9, 1), (10, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2041 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2041_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2041
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2041 := by
  native_decide

/-- Coefficient term 2042 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2042 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2042 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2042 : Poly :=
[
  term ((1926038409869376 : Rat) / 7342292683791569) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2042 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2042_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2042
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2042 := by
  native_decide

/-- Coefficient term 2043 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2043 : Poly :=
[
  term ((1796143489149601437260838300999331622189763612503675632089951234971583666481 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 2043 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2043 : Poly :=
[
  term ((1796143489149601437260838300999331622189763612503675632089951234971583666481 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((-1796143489149601437260838300999331622189763612503675632089951234971583666481 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2043 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2043_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2043
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2043 := by
  native_decide

/-- Coefficient term 2044 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2044 : Poly :=
[
  term ((2288764104487326900654 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 2044 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2044 : Poly :=
[
  term ((4577528208974653801308 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2288764104487326900654 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2044 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2044_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2044
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2044 := by
  native_decide

/-- Coefficient term 2045 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2045 : Poly :=
[
  term ((33153390579587002893694827519506860178751975677357120423524476399006525623485517 : Rat) / 219195895786710577282300681629963237955224990626223035071438884453126616224000) [(9, 1), (11, 1)]
]

/-- Partial product 2045 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2045 : Poly :=
[
  term ((-33153390579587002893694827519506860178751975677357120423524476399006525623485517 : Rat) / 219195895786710577282300681629963237955224990626223035071438884453126616224000) [(9, 1), (11, 1)],
  term ((33153390579587002893694827519506860178751975677357120423524476399006525623485517 : Rat) / 109597947893355288641150340814981618977612495313111517535719442226563308112000) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2045 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2045_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2045
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2045 := by
  native_decide

/-- Coefficient term 2046 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2046 : Poly :=
[
  term ((1012859850508621730849794317570215906649465963140093737069867251267907081727772083 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 2046 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2046 : Poly :=
[
  term ((-1012859850508621730849794317570215906649465963140093737069867251267907081727772083 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (11, 1), (12, 1)],
  term ((1012859850508621730849794317570215906649465963140093737069867251267907081727772083 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2046 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2046_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2046
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2046 := by
  native_decide

/-- Coefficient term 2047 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2047 : Poly :=
[
  term ((1115458840362465912474461184356022287677953763503246632850677241833 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2047 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2047 : Poly :=
[
  term ((1115458840362465912474461184356022287677953763503246632850677241833 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1115458840362465912474461184356022287677953763503246632850677241833 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2047 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2047_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2047
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2047 := by
  native_decide

/-- Coefficient term 2048 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2048 : Poly :=
[
  term ((14099418073641136905992 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2048 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2048 : Poly :=
[
  term ((28198836147282273811984 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14099418073641136905992 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2048 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2048_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2048
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2048 := by
  native_decide

/-- Coefficient term 2049 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2049 : Poly :=
[
  term ((844935876516012574665438619200172941817391435329808782625830443917 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 2049 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2049 : Poly :=
[
  term ((-844935876516012574665438619200172941817391435329808782625830443917 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((844935876516012574665438619200172941817391435329808782625830443917 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(9, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2049 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2049_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2049
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2049 := by
  native_decide

/-- Coefficient term 2050 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2050 : Poly :=
[
  term ((6724678652056770546268 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 2050 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2050 : Poly :=
[
  term ((-6724678652056770546268 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((13449357304113541092536 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2050 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2050_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2050
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2050 := by
  native_decide

/-- Coefficient term 2051 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2051 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 2051 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2051 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2051 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2051_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2051
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2051 := by
  native_decide

/-- Coefficient term 2052 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2052 : Poly :=
[
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2052 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2052 : Poly :=
[
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2052 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2052_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2052
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2052 := by
  native_decide

/-- Coefficient term 2053 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2053 : Poly :=
[
  term ((72979139028909619073586388 : Rat) / 3788172465045908734368315) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 2053 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2053 : Poly :=
[
  term ((145958278057819238147172776 : Rat) / 3788172465045908734368315) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-72979139028909619073586388 : Rat) / 3788172465045908734368315) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2053 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2053_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2053
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2053 := by
  native_decide

/-- Coefficient term 2054 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2054 : Poly :=
[
  term ((-9458171865698887942516523032080869982055326617246942211192822649627 : Rat) / 7408671776437049091261677379547479273890723415194294277455229000) [(9, 1), (11, 1), (12, 2)]
]

/-- Partial product 2054 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2054 : Poly :=
[
  term ((9458171865698887942516523032080869982055326617246942211192822649627 : Rat) / 7408671776437049091261677379547479273890723415194294277455229000) [(9, 1), (11, 1), (12, 2)],
  term ((-9458171865698887942516523032080869982055326617246942211192822649627 : Rat) / 3704335888218524545630838689773739636945361707597147138727614500) [(9, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2054 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2054_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2054
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2054 := by
  native_decide

/-- Coefficient term 2055 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2055 : Poly :=
[
  term ((-73576557155067338527118 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 2055 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2055 : Poly :=
[
  term ((-147153114310134677054236 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((73576557155067338527118 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2055 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2055_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2055
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2055 := by
  native_decide

/-- Coefficient term 2056 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2056 : Poly :=
[
  term ((-3344814199593803947686384519899153183600534985509927411820868317419747586553 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2056 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2056 : Poly :=
[
  term ((3344814199593803947686384519899153183600534985509927411820868317419747586553 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3344814199593803947686384519899153183600534985509927411820868317419747586553 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2056 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2056_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2056
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2056 := by
  native_decide

/-- Coefficient term 2057 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2057 : Poly :=
[
  term ((-1895821981306172969745 : Rat) / 867851652931479664231) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2057 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2057 : Poly :=
[
  term ((1895821981306172969745 : Rat) / 867851652931479664231) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3791643962612345939490 : Rat) / 867851652931479664231) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2057 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2057_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2057
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2057 := by
  native_decide

/-- Coefficient term 2058 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2058 : Poly :=
[
  term ((56623588084287641462995795449935553957145226058128011428151287617009468047477 : Rat) / 847406813608417180215079954755012517868137850359109671667933831648685372000) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 2058 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2058 : Poly :=
[
  term ((56623588084287641462995795449935553957145226058128011428151287617009468047477 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-56623588084287641462995795449935553957145226058128011428151287617009468047477 : Rat) / 847406813608417180215079954755012517868137850359109671667933831648685372000) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2058 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2058_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2058
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2058 := by
  native_decide

/-- Coefficient term 2059 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2059 : Poly :=
[
  term ((5778161644554077925243 : Rat) / 8678516529314796642310) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2059 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2059 : Poly :=
[
  term ((5778161644554077925243 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5778161644554077925243 : Rat) / 8678516529314796642310) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2059 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2059_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2059
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2059 := by
  native_decide

/-- Coefficient term 2060 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2060 : Poly :=
[
  term ((3110862594116341505929758879637706948533655555966027094974223609367 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(9, 1), (11, 1), (13, 2)]
]

/-- Partial product 2060 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2060 : Poly :=
[
  term ((-3110862594116341505929758879637706948533655555966027094974223609367 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(9, 1), (11, 1), (13, 2)],
  term ((3110862594116341505929758879637706948533655555966027094974223609367 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2060 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2060_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2060
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2060 := by
  native_decide

/-- Coefficient term 2061 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2061 : Poly :=
[
  term ((-2524232651855401718609201205687265366415156869993004542125644192233 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 2061 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2061 : Poly :=
[
  term ((2524232651855401718609201205687265366415156869993004542125644192233 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2524232651855401718609201205687265366415156869993004542125644192233 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(9, 1), (11, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2061 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2061_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2061
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2061 := by
  native_decide

/-- Coefficient term 2062 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2062 : Poly :=
[
  term ((-1331440894453351930264 : Rat) / 685146041788010261235) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2062 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2062 : Poly :=
[
  term ((1331440894453351930264 : Rat) / 685146041788010261235) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2662881788906703860528 : Rat) / 685146041788010261235) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2062 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2062_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2062
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2062 := by
  native_decide

/-- Coefficient term 2063 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2063 : Poly :=
[
  term ((1949445868927651240108 : Rat) / 2603554958794438992693) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 2063 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2063 : Poly :=
[
  term ((3898891737855302480216 : Rat) / 2603554958794438992693) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1949445868927651240108 : Rat) / 2603554958794438992693) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2063 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2063_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2063
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2063 := by
  native_decide

/-- Coefficient term 2064 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2064 : Poly :=
[
  term ((62575314548874457011842878928353972932789616147150582255576167039153807067165709 : Rat) / 109597947893355288641150340814981618977612495313111517535719442226563308112000) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 2064 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2064 : Poly :=
[
  term ((-62575314548874457011842878928353972932789616147150582255576167039153807067165709 : Rat) / 109597947893355288641150340814981618977612495313111517535719442226563308112000) [(9, 1), (11, 1), (14, 1)],
  term ((62575314548874457011842878928353972932789616147150582255576167039153807067165709 : Rat) / 54798973946677644320575170407490809488806247656555758767859721113281654056000) [(9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2064 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2064_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2064
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2064 := by
  native_decide

/-- Coefficient term 2065 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2065 : Poly :=
[
  term ((946811629973271506950251 : Rat) / 120259443334790753472010) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 2065 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2065 : Poly :=
[
  term ((-946811629973271506950251 : Rat) / 120259443334790753472010) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((946811629973271506950251 : Rat) / 60129721667395376736005) [(9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2065 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2065_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2065
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2065 := by
  native_decide

/-- Coefficient term 2066 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2066 : Poly :=
[
  term ((7474880528901332781824537 : Rat) / 1683632206687070548608140) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 2066 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2066 : Poly :=
[
  term ((7474880528901332781824537 : Rat) / 841816103343535274304070) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7474880528901332781824537 : Rat) / 1683632206687070548608140) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2066 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2066_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2066
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2066 := by
  native_decide

/-- Coefficient term 2067 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2067 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 2067 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2067 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2067 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2067_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2067
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2067 := by
  native_decide

/-- Coefficient term 2068 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2068 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2068 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2068 : Poly :=
[
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2068 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2068_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2068
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2068 := by
  native_decide

/-- Coefficient term 2069 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2069 : Poly :=
[
  term ((434793673213446168827724866442225877337522 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 2069 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2069 : Poly :=
[
  term ((-434793673213446168827724866442225877337522 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1)],
  term ((869587346426892337655449732884451754675044 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2069 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2069_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2069
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2069 := by
  native_decide

/-- Coefficient term 2070 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2070 : Poly :=
[
  term ((-1360652153374024023188443491793473810233372 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 2070 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2070 : Poly :=
[
  term ((1360652153374024023188443491793473810233372 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2721304306748048046376886983586947620466744 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2070 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2070_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2070
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2070 := by
  native_decide

/-- Coefficient term 2071 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2071 : Poly :=
[
  term ((1935208804495652114368 : Rat) / 867851652931479664231) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2071 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2071 : Poly :=
[
  term ((-1935208804495652114368 : Rat) / 867851652931479664231) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((3870417608991304228736 : Rat) / 867851652931479664231) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2071 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2071_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2071
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2071 := by
  native_decide

/-- Coefficient term 2072 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2072 : Poly :=
[
  term ((-4002565231296461041312 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 2072 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2072 : Poly :=
[
  term ((-8005130462592922082624 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((4002565231296461041312 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2072 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2072_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2072
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2072 := by
  native_decide

/-- Coefficient term 2073 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2073 : Poly :=
[
  term ((-520462727731190792802931174789486442393614645595027497164060310885253964671128717 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 2073 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2073 : Poly :=
[
  term ((520462727731190792802931174789486442393614645595027497164060310885253964671128717 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(9, 1), (12, 1), (13, 1)],
  term ((-520462727731190792802931174789486442393614645595027497164060310885253964671128717 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2073 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2073_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2073
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2073 := by
  native_decide

/-- Coefficient term 2074 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2074 : Poly :=
[
  term ((-642688370877854647453309321123630600507582742646001671887658629823636872536558441 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2074 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2074 : Poly :=
[
  term ((642688370877854647453309321123630600507582742646001671887658629823636872536558441 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-642688370877854647453309321123630600507582742646001671887658629823636872536558441 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2074 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2074_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2074
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2074 := by
  native_decide

/-- Coefficient term 2075 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2075 : Poly :=
[
  term ((-17092102905297559401186691 : Rat) / 1082334990013116781248090) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2075 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2075 : Poly :=
[
  term ((17092102905297559401186691 : Rat) / 1082334990013116781248090) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-17092102905297559401186691 : Rat) / 541167495006558390624045) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2075 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2075_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2075
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2075 := by
  native_decide

/-- Coefficient term 2076 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2076 : Poly :=
[
  term ((-728917473370992354357587314795807532302327760539308350177025849849637862641 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 2076 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2076 : Poly :=
[
  term ((-728917473370992354357587314795807532302327760539308350177025849849637862641 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((728917473370992354357587314795807532302327760539308350177025849849637862641 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2076 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2076_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2076
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2076 := by
  native_decide

/-- Coefficient term 2077 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2077 : Poly :=
[
  term ((-4412060981842280138864 : Rat) / 4339258264657398321155) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2077 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2077 : Poly :=
[
  term ((-8824121963684560277728 : Rat) / 4339258264657398321155) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4412060981842280138864 : Rat) / 4339258264657398321155) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2077 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2077_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2077
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2077 := by
  native_decide

/-- Coefficient term 2078 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2078 : Poly :=
[
  term ((-47157156390487054483493197 : Rat) / 1515268986018363493747326) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2078 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2078 : Poly :=
[
  term ((-47157156390487054483493197 : Rat) / 757634493009181746873663) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((47157156390487054483493197 : Rat) / 1515268986018363493747326) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2078 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2078_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2078
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2078 := by
  native_decide

/-- Coefficient term 2079 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2079 : Poly :=
[
  term ((-9397285014186587686118774698143418456514925820124691561783161251 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(9, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 2079 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2079 : Poly :=
[
  term ((-9397285014186587686118774698143418456514925820124691561783161251 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((9397285014186587686118774698143418456514925820124691561783161251 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(9, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2079 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2079_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2079
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2079 := by
  native_decide

/-- Coefficient term 2080 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2080 : Poly :=
[
  term ((-1656419629152817119692 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2080 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2080 : Poly :=
[
  term ((-3312839258305634239384 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1656419629152817119692 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2080 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2080_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2080
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2080 := by
  native_decide

/-- Coefficient term 2081 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2081 : Poly :=
[
  term ((295698743676036280354638649240343868933631743101761387581222311243629 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 2081 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2081 : Poly :=
[
  term ((-295698743676036280354638649240343868933631743101761387581222311243629 : Rat) / 691019087869409679604106454128778345009249033753560324429739090528) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((295698743676036280354638649240343868933631743101761387581222311243629 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(9, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2081 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2081_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2081
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2081 := by
  native_decide

/-- Coefficient term 2082 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2082 : Poly :=
[
  term ((24505271519402223 : Rat) / 7342292683791569) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2082 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2082 : Poly :=
[
  term ((-24505271519402223 : Rat) / 7342292683791569) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((49010543038804446 : Rat) / 7342292683791569) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2082 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2082_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2082
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2082 := by
  native_decide

/-- Coefficient term 2083 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2083 : Poly :=
[
  term ((-473644336167898610803986055422699369200215173716003538878645818099389804264870685307 : Rat) / 177412622962264505861040055145465417975346240688920933765407361927027170207232000) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 2083 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2083 : Poly :=
[
  term ((-473644336167898610803986055422699369200215173716003538878645818099389804264870685307 : Rat) / 88706311481132252930520027572732708987673120344460466882703680963513585103616000) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((473644336167898610803986055422699369200215173716003538878645818099389804264870685307 : Rat) / 177412622962264505861040055145465417975346240688920933765407361927027170207232000) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2083 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2083_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2083
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2083 := by
  native_decide

/-- Coefficient term 2084 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2084 : Poly :=
[
  term ((-287733148615864910685463771 : Rat) / 5050896620061211645824420) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2084 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2084 : Poly :=
[
  term ((-287733148615864910685463771 : Rat) / 2525448310030605822912210) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((287733148615864910685463771 : Rat) / 5050896620061211645824420) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2084 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2084_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2084
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2084 := by
  native_decide

/-- Coefficient term 2085 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2085 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 2085 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2085 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2085 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2085_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2085
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2085 := by
  native_decide

/-- Coefficient term 2086 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2086 : Poly :=
[
  term ((2020095442437435 : Rat) / 7342292683791569) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 2086 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2086 : Poly :=
[
  term ((4040190884874870 : Rat) / 7342292683791569) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2086 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2086_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2086
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2086 := by
  native_decide

/-- Coefficient term 2087 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2087 : Poly :=
[
  term ((4584619527216974736170336385018284588570810805486023093652748763617 : Rat) / 9525435141133348831622156630846759066430930105249806928156723000) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 2087 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2087 : Poly :=
[
  term ((-4584619527216974736170336385018284588570810805486023093652748763617 : Rat) / 9525435141133348831622156630846759066430930105249806928156723000) [(9, 1), (12, 2), (13, 1)],
  term ((4584619527216974736170336385018284588570810805486023093652748763617 : Rat) / 4762717570566674415811078315423379533215465052624903464078361500) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2087 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2087_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2087
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2087 := by
  native_decide

/-- Coefficient term 2088 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2088 : Poly :=
[
  term ((-3474203545639783811292668732035443921698293 : Rat) / 6594529162607991361368811362727633214250) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 2088 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2088 : Poly :=
[
  term ((3474203545639783811292668732035443921698293 : Rat) / 6594529162607991361368811362727633214250) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(9, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2088 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2088_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2088
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2088 := by
  native_decide

/-- Coefficient term 2089 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2089 : Poly :=
[
  term ((17732162024501022419544 : Rat) / 4339258264657398321155) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2089 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2089 : Poly :=
[
  term ((-17732162024501022419544 : Rat) / 4339258264657398321155) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((35464324049002044839088 : Rat) / 4339258264657398321155) [(9, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2089 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2089_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2089
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2089 := by
  native_decide

/-- Coefficient term 2090 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2090 : Poly :=
[
  term ((251041508153904097609582 : Rat) / 13017774793972194963465) [(9, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 2090 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2090 : Poly :=
[
  term ((502083016307808195219164 : Rat) / 13017774793972194963465) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-251041508153904097609582 : Rat) / 13017774793972194963465) [(9, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2090 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2090_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2090
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2090 := by
  native_decide

/-- Coefficient term 2091 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2091 : Poly :=
[
  term ((-2886388821508899455856593262035668199699991159632309760471799852390579146660950651 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 2091 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2091 : Poly :=
[
  term ((-2886388821508899455856593262035668199699991159632309760471799852390579146660950651 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((2886388821508899455856593262035668199699991159632309760471799852390579146660950651 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2091 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2091_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2091
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2091 := by
  native_decide

/-- Coefficient term 2092 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2092 : Poly :=
[
  term ((5903677716004721617743638 : Rat) / 3788172465045908734368315) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 2092 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2092 : Poly :=
[
  term ((11807355432009443235487276 : Rat) / 3788172465045908734368315) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5903677716004721617743638 : Rat) / 3788172465045908734368315) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2092 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2092_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2092
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2092 := by
  native_decide

/-- Coefficient term 2093 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2093 : Poly :=
[
  term ((3474203545639783811292668732035443921698293 : Rat) / 6594529162607991361368811362727633214250) [(9, 1), (12, 3), (15, 1)]
]

/-- Partial product 2093 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2093 : Poly :=
[
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-3474203545639783811292668732035443921698293 : Rat) / 6594529162607991361368811362727633214250) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2093 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2093_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2093
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2093 := by
  native_decide

/-- Coefficient term 2094 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2094 : Poly :=
[
  term ((-17732162024501022419544 : Rat) / 4339258264657398321155) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 2094 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2094 : Poly :=
[
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((17732162024501022419544 : Rat) / 4339258264657398321155) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2094 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2094_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2094
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2094 := by
  native_decide

/-- Coefficient term 2095 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2095 : Poly :=
[
  term ((-1537007945108921447188183801491918463358388541571985663377588776078671572181109 : Rat) / 219195895786710577282300681629963237955224990626223035071438884453126616224000) [(9, 1), (13, 1)]
]

/-- Partial product 2095 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2095 : Poly :=
[
  term ((1537007945108921447188183801491918463358388541571985663377588776078671572181109 : Rat) / 219195895786710577282300681629963237955224990626223035071438884453126616224000) [(9, 1), (13, 1)],
  term ((-1537007945108921447188183801491918463358388541571985663377588776078671572181109 : Rat) / 109597947893355288641150340814981618977612495313111517535719442226563308112000) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2095 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2095_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2095
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2095 := by
  native_decide

/-- Coefficient term 2096 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2096 : Poly :=
[
  term ((-293645380351394610468802941086131052372859692235572596837133054301514646475432156247 : Rat) / 183748788068059666784648628543517754331608606427810967114171910567278140571776000) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 2096 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2096 : Poly :=
[
  term ((293645380351394610468802941086131052372859692235572596837133054301514646475432156247 : Rat) / 183748788068059666784648628543517754331608606427810967114171910567278140571776000) [(9, 1), (13, 1), (14, 1)],
  term ((-293645380351394610468802941086131052372859692235572596837133054301514646475432156247 : Rat) / 91874394034029833392324314271758877165804303213905483557085955283639070285888000) [(9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2096 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2096_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2096
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2096 := by
  native_decide

/-- Coefficient term 2097 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2097 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 2097 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2097 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2097 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2097_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2097
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2097 := by
  native_decide

/-- Coefficient term 2098 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2098 : Poly :=
[
  term ((-4040190884874870 : Rat) / 7342292683791569) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2098 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2098 : Poly :=
[
  term ((4040190884874870 : Rat) / 7342292683791569) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-8080381769749740 : Rat) / 7342292683791569) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2098 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2098_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2098
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2098 := by
  native_decide

/-- Coefficient term 2099 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2099 : Poly :=
[
  term ((-6606247453038541125565155 : Rat) / 168363220668707054860814) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2099 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2099 : Poly :=
[
  term ((6606247453038541125565155 : Rat) / 168363220668707054860814) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6606247453038541125565155 : Rat) / 84181610334353527430407) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2099 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2099_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2099
        rs_R009_ueqv_R009NYNYN_generator_28_2000_2099 =
      rs_R009_ueqv_R009NYNYN_partial_28_2099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_2000_2099 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_2000,
  rs_R009_ueqv_R009NYNYN_partial_28_2001,
  rs_R009_ueqv_R009NYNYN_partial_28_2002,
  rs_R009_ueqv_R009NYNYN_partial_28_2003,
  rs_R009_ueqv_R009NYNYN_partial_28_2004,
  rs_R009_ueqv_R009NYNYN_partial_28_2005,
  rs_R009_ueqv_R009NYNYN_partial_28_2006,
  rs_R009_ueqv_R009NYNYN_partial_28_2007,
  rs_R009_ueqv_R009NYNYN_partial_28_2008,
  rs_R009_ueqv_R009NYNYN_partial_28_2009,
  rs_R009_ueqv_R009NYNYN_partial_28_2010,
  rs_R009_ueqv_R009NYNYN_partial_28_2011,
  rs_R009_ueqv_R009NYNYN_partial_28_2012,
  rs_R009_ueqv_R009NYNYN_partial_28_2013,
  rs_R009_ueqv_R009NYNYN_partial_28_2014,
  rs_R009_ueqv_R009NYNYN_partial_28_2015,
  rs_R009_ueqv_R009NYNYN_partial_28_2016,
  rs_R009_ueqv_R009NYNYN_partial_28_2017,
  rs_R009_ueqv_R009NYNYN_partial_28_2018,
  rs_R009_ueqv_R009NYNYN_partial_28_2019,
  rs_R009_ueqv_R009NYNYN_partial_28_2020,
  rs_R009_ueqv_R009NYNYN_partial_28_2021,
  rs_R009_ueqv_R009NYNYN_partial_28_2022,
  rs_R009_ueqv_R009NYNYN_partial_28_2023,
  rs_R009_ueqv_R009NYNYN_partial_28_2024,
  rs_R009_ueqv_R009NYNYN_partial_28_2025,
  rs_R009_ueqv_R009NYNYN_partial_28_2026,
  rs_R009_ueqv_R009NYNYN_partial_28_2027,
  rs_R009_ueqv_R009NYNYN_partial_28_2028,
  rs_R009_ueqv_R009NYNYN_partial_28_2029,
  rs_R009_ueqv_R009NYNYN_partial_28_2030,
  rs_R009_ueqv_R009NYNYN_partial_28_2031,
  rs_R009_ueqv_R009NYNYN_partial_28_2032,
  rs_R009_ueqv_R009NYNYN_partial_28_2033,
  rs_R009_ueqv_R009NYNYN_partial_28_2034,
  rs_R009_ueqv_R009NYNYN_partial_28_2035,
  rs_R009_ueqv_R009NYNYN_partial_28_2036,
  rs_R009_ueqv_R009NYNYN_partial_28_2037,
  rs_R009_ueqv_R009NYNYN_partial_28_2038,
  rs_R009_ueqv_R009NYNYN_partial_28_2039,
  rs_R009_ueqv_R009NYNYN_partial_28_2040,
  rs_R009_ueqv_R009NYNYN_partial_28_2041,
  rs_R009_ueqv_R009NYNYN_partial_28_2042,
  rs_R009_ueqv_R009NYNYN_partial_28_2043,
  rs_R009_ueqv_R009NYNYN_partial_28_2044,
  rs_R009_ueqv_R009NYNYN_partial_28_2045,
  rs_R009_ueqv_R009NYNYN_partial_28_2046,
  rs_R009_ueqv_R009NYNYN_partial_28_2047,
  rs_R009_ueqv_R009NYNYN_partial_28_2048,
  rs_R009_ueqv_R009NYNYN_partial_28_2049,
  rs_R009_ueqv_R009NYNYN_partial_28_2050,
  rs_R009_ueqv_R009NYNYN_partial_28_2051,
  rs_R009_ueqv_R009NYNYN_partial_28_2052,
  rs_R009_ueqv_R009NYNYN_partial_28_2053,
  rs_R009_ueqv_R009NYNYN_partial_28_2054,
  rs_R009_ueqv_R009NYNYN_partial_28_2055,
  rs_R009_ueqv_R009NYNYN_partial_28_2056,
  rs_R009_ueqv_R009NYNYN_partial_28_2057,
  rs_R009_ueqv_R009NYNYN_partial_28_2058,
  rs_R009_ueqv_R009NYNYN_partial_28_2059,
  rs_R009_ueqv_R009NYNYN_partial_28_2060,
  rs_R009_ueqv_R009NYNYN_partial_28_2061,
  rs_R009_ueqv_R009NYNYN_partial_28_2062,
  rs_R009_ueqv_R009NYNYN_partial_28_2063,
  rs_R009_ueqv_R009NYNYN_partial_28_2064,
  rs_R009_ueqv_R009NYNYN_partial_28_2065,
  rs_R009_ueqv_R009NYNYN_partial_28_2066,
  rs_R009_ueqv_R009NYNYN_partial_28_2067,
  rs_R009_ueqv_R009NYNYN_partial_28_2068,
  rs_R009_ueqv_R009NYNYN_partial_28_2069,
  rs_R009_ueqv_R009NYNYN_partial_28_2070,
  rs_R009_ueqv_R009NYNYN_partial_28_2071,
  rs_R009_ueqv_R009NYNYN_partial_28_2072,
  rs_R009_ueqv_R009NYNYN_partial_28_2073,
  rs_R009_ueqv_R009NYNYN_partial_28_2074,
  rs_R009_ueqv_R009NYNYN_partial_28_2075,
  rs_R009_ueqv_R009NYNYN_partial_28_2076,
  rs_R009_ueqv_R009NYNYN_partial_28_2077,
  rs_R009_ueqv_R009NYNYN_partial_28_2078,
  rs_R009_ueqv_R009NYNYN_partial_28_2079,
  rs_R009_ueqv_R009NYNYN_partial_28_2080,
  rs_R009_ueqv_R009NYNYN_partial_28_2081,
  rs_R009_ueqv_R009NYNYN_partial_28_2082,
  rs_R009_ueqv_R009NYNYN_partial_28_2083,
  rs_R009_ueqv_R009NYNYN_partial_28_2084,
  rs_R009_ueqv_R009NYNYN_partial_28_2085,
  rs_R009_ueqv_R009NYNYN_partial_28_2086,
  rs_R009_ueqv_R009NYNYN_partial_28_2087,
  rs_R009_ueqv_R009NYNYN_partial_28_2088,
  rs_R009_ueqv_R009NYNYN_partial_28_2089,
  rs_R009_ueqv_R009NYNYN_partial_28_2090,
  rs_R009_ueqv_R009NYNYN_partial_28_2091,
  rs_R009_ueqv_R009NYNYN_partial_28_2092,
  rs_R009_ueqv_R009NYNYN_partial_28_2093,
  rs_R009_ueqv_R009NYNYN_partial_28_2094,
  rs_R009_ueqv_R009NYNYN_partial_28_2095,
  rs_R009_ueqv_R009NYNYN_partial_28_2096,
  rs_R009_ueqv_R009NYNYN_partial_28_2097,
  rs_R009_ueqv_R009NYNYN_partial_28_2098,
  rs_R009_ueqv_R009NYNYN_partial_28_2099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_2000_2099 : Poly :=
[
  term ((-96097541023171983961651634 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-35356512452697936021736 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((55765329354387316517569699 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1300928897579839938462261493451151214674780055028696690123205486103426320574985314447 : Rat) / 385872454942925300247762119941387284096378073498403030939761012191284095200729600) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((295650500178218805291217576 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2164599832067324285318728888043281771988102083863431823924534119173 : Rat) / 7198115498639684162542775563841441093846344101599586712809782193) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((21996231932983968 : Rat) / 7342292683791569) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1358948211893892793410039198627410284579899004912433797812161165266257787249133007247 : Rat) / 771744909885850600495524239882774568192756146996806061879522024382568190401459200) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-150662426558771192627309708 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-461441701634154561390309104572327306580609 : Rat) / 942075594658284480195544480389661887750) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((20777325206089709388561881118216301627186289 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((75607804741077261038936 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 2)],
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-38992079646219941389816 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-29872325662771717645217013473890565490968292126921220315808164188810574167973 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-556296710706675591096 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((29872325662771717645217013473890565490968292126921220315808164188810574167973 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((278148355353337795548 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (10, 1), (12, 3), (14, 1), (15, 1)],
  term ((-4752709102725243481392 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 3), (15, 1)],
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((-554883214230871208839762459374331365749320130430491667346074297989421804911299671989 : Rat) / 514496606590567066997016159921849712128504097997870707919681349588378793600972800) [(9, 1), (10, 1), (13, 1)],
  term ((1655147654448485481657540614202895720899596589916542635817291958955460662173534220791 : Rat) / 771744909885850600495524239882774568192756146996806061879522024382568190401459200) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((972214275157813717938 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((37173915521303694025290766 : Rat) / 757634493009181746873663) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1040971542958823933144912787039699424667375260181021715702337315162659132380017 : Rat) / 42273494187437039904443702885778624462793391049343013906634642001674418843200) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((12528844368836544938376818 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-486107137578906858969 : Rat) / 619894037808199760165) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-64044666596978914198547413 : Rat) / 2525448310030605822912210) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 889040613172445890951401285545697512866886809823315313294627480) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 1), (13, 3)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (10, 1), (13, 3), (14, 1)],
  term ((-18199958671012105864522080246638891247049828834545913879200550011232475366770371302833 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-166258161359887247783965379 : Rat) / 3788172465045908734368315) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8313066708274973542646815959346354255346832600385940784927051698134549274889563 : Rat) / 4663714280190010070761562158990797409409773511480070908743015860555795072000) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1148708341128846032516 : Rat) / 32049107564750198685) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((6269532968492965262223314310922587333361002675069259645765924524226778623742267875523 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(9, 1), (10, 1), (15, 1)],
  term ((234146249966431483882644721 : Rat) / 7576344930091817468736630) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32820990624515682959095597448726571559968022416943071613654707626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 2), (11, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (12, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((3216141900115433904994681165463592800224098411085673520846739148 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(9, 1), (10, 2), (11, 1), (14, 1)],
  term ((609862617633560825504 : Rat) / 123978807561639952033) [(9, 1), (10, 2), (11, 1), (14, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (10, 2), (11, 1), (14, 2)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (14, 2), (16, 1)],
  term ((-1208921285421916659216 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term ((135627328660642205148579355595485263467848 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 2), (12, 1), (13, 1)],
  term ((-271254657321284410297158711190970526935696 : Rat) / 1187015249269438445046386045290973978565) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-421100029303638689918279182476367765243635083370620629341662764210410816832 : Rat) / 3783066132180433840245892655156305883339901117674596748517561748431631125) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1)],
  term ((889147120006906566528 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((210550014651819344959139591238183882621817541685310314670831382105205408416 : Rat) / 3783066132180433840245892655156305883339901117674596748517561748431631125) [(9, 1), (10, 2), (12, 1), (15, 1)],
  term ((-444573560003453283264 : Rat) / 619894037808199760165) [(9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((197619821437186068491659620882290295144850262779190643626776663 : Rat) / 1703142937111965308336017788401719373308212279355010178725340) [(9, 1), (10, 2), (13, 1)],
  term ((-5234497686222954317678006749593029479563556134849984101666601170273 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (10, 2), (13, 1), (14, 1)],
  term ((-51567544057934204224136 : Rat) / 13017774793972194963465) [(9, 1), (10, 2), (13, 1), (14, 1), (16, 1)],
  term ((4863877637357450185313465166614197753371184 : Rat) / 29675381231735961126159651132274349464125) [(9, 1), (10, 2), (13, 1), (14, 2)],
  term ((70951743519547281920 : Rat) / 53133774669274265157) [(9, 1), (10, 2), (13, 1), (14, 2), (16, 1)],
  term ((7145992579464943698156 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term ((979611705980426124475024882262319582057013465425477885055443957314524873981 : Rat) / 52962925850526073763442497172188282366758615647444354479245864478042835750) [(9, 1), (10, 2), (14, 1), (15, 1)],
  term ((5715807279015405670428 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (14, 1), (15, 1), (16, 1)],
  term ((10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(9, 1), (10, 2), (14, 2), (15, 1)],
  term ((-3852076819738752 : Rat) / 7342292683791569) [(9, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-1796143489149601437260838300999331622189763612503675632089951234971583666481 : Rat) / 105925851701052147526884994344376564733517231294888708958491728956085671500) [(9, 1), (10, 2), (15, 1)],
  term ((-2288764104487326900654 : Rat) / 4339258264657398321155) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-33153390579587002893694827519506860178751975677357120423524476399006525623485517 : Rat) / 219195895786710577282300681629963237955224990626223035071438884453126616224000) [(9, 1), (11, 1)],
  term ((-1012859850508621730849794317570215906649465963140093737069867251267907081727772083 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(9, 1), (11, 1), (12, 1)],
  term ((1115458840362465912474461184356022287677953763503246632850677241833 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((28198836147282273811984 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1115458840362465912474461184356022287677953763503246632850677241833 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-14099418073641136905992 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((759748951621385926415071847592060133319849271656777631460644661888406284071273119 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5519145621847384912575212 : Rat) / 199377498160310986019385) [(9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((844935876516012574665438619200172941817391435329808782625830443917 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((13449357304113541092536 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-72979139028909619073586388 : Rat) / 3788172465045908734368315) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term ((9458171865698887942516523032080869982055326617246942211192822649627 : Rat) / 7408671776437049091261677379547479273890723415194294277455229000) [(9, 1), (11, 1), (12, 2)],
  term ((-9458171865698887942516523032080869982055326617246942211192822649627 : Rat) / 3704335888218524545630838689773739636945361707597147138727614500) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-147153114310134677054236 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((73576557155067338527118 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term ((4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2179610221583563253424 : Rat) / 619894037808199760165) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3344814199593803947686384519899153183600534985509927411820868317419747586553 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3791643962612345939490 : Rat) / 867851652931479664231) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56623588084287641462995795449935553957145226058128011428151287617009468047477 : Rat) / 847406813608417180215079954755012517868137850359109671667933831648685372000) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5778161644554077925243 : Rat) / 8678516529314796642310) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3110862594116341505929758879637706948533655555966027094974223609367 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(9, 1), (11, 1), (13, 2)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2524232651855401718609201205687265366415156869993004542125644192233 : Rat) / 8334755748491680227669387051990914183127063842093581062137132625) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((-2662881788906703860528 : Rat) / 685146041788010261235) [(9, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1949445868927651240108 : Rat) / 2603554958794438992693) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-165740160521253871348537190506758084114819146548960112354786613997 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(9, 1), (11, 1), (14, 1)],
  term ((873401153699414673374 : Rat) / 867851652931479664231) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((62575314548874457011842878928353972932789616147150582255576167039153807067165709 : Rat) / 54798973946677644320575170407490809488806247656555758767859721113281654056000) [(9, 1), (11, 1), (14, 2)],
  term ((946811629973271506950251 : Rat) / 60129721667395376736005) [(9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-7474880528901332781824537 : Rat) / 1683632206687070548608140) [(9, 1), (11, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (12, 1), (15, 1)],
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-434793673213446168827724866442225877337522 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-2525882069295883236352 : Rat) / 619894037808199760165) [(9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2721304306748048046376886983586947620466744 : Rat) / 9891793743911987042053217044091449821375) [(9, 1), (11, 2), (13, 1), (14, 2)],
  term ((3870417608991304228736 : Rat) / 867851652931479664231) [(9, 1), (11, 2), (13, 1), (14, 2), (16, 1)],
  term ((4002565231296461041312 : Rat) / 4339258264657398321155) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((520462727731190792802931174789486442393614645595027497164060310885253964671128717 : Rat) / 591828918624118558662211840400900742479107474690802194692884988023441863804800) [(9, 1), (12, 1), (13, 1)],
  term ((-1520646302144684426858667475590411274476187904434757766584314826342967591391576243 : Rat) / 986381531040197597770353067334834570798512457818003657821474980039069773008000) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-728917473370992354357587314795807532302327760539308350177025849849637862641 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8824121963684560277728 : Rat) / 4339258264657398321155) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-39102982618643069891847237 : Rat) / 841816103343535274304070) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-642688370877854647453309321123630600507582742646001671887658629823636872536558441 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-17092102905297559401186691 : Rat) / 541167495006558390624045) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((728917473370992354357587314795807532302327760539308350177025849849637862641 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((4412060981842280138864 : Rat) / 4339258264657398321155) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((47157156390487054483493197 : Rat) / 1515268986018363493747326) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-9397285014186587686118774698143418456514925820124691561783161251 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3312839258305634239384 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9397285014186587686118774698143418456514925820124691561783161251 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((1656419629152817119692 : Rat) / 13017774793972194963465) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14836494705272052508827580767810950364565480877968230948075187748355805519627430425903 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-296161959507881416652520841 : Rat) / 2525448310030605822912210) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((295698743676036280354638649240343868933631743101761387581222311243629 : Rat) / 345509543934704839802053227064389172504624516876780162214869545264) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((49010543038804446 : Rat) / 7342292683791569) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((473644336167898610803986055422699369200215173716003538878645818099389804264870685307 : Rat) / 177412622962264505861040055145465417975346240688920933765407361927027170207232000) [(9, 1), (12, 1), (15, 1)],
  term ((287733148615864910685463771 : Rat) / 5050896620061211645824420) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 1), (12, 1), (15, 3)],
  term ((-2020095442437435 : Rat) / 7342292683791569) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4584619527216974736170336385018284588570810805486023093652748763617 : Rat) / 9525435141133348831622156630846759066430930105249806928156723000) [(9, 1), (12, 2), (13, 1)],
  term ((7093767619906552131798974685495580465169143626915530884602298149871 : Rat) / 4762717570566674415811078315423379533215465052624903464078361500) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((448886530234305127960532 : Rat) / 13017774793972194963465) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((35464324049002044839088 : Rat) / 4339258264657398321155) [(9, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-251041508153904097609582 : Rat) / 13017774793972194963465) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2886388821508899455856593262035668199699991159632309760471799852390579146660950651 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((11807355432009443235487276 : Rat) / 3788172465045908734368315) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2886388821508899455856593262035668199699991159632309760471799852390579146660950651 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (12, 2), (15, 1)],
  term ((-5903677716004721617743638 : Rat) / 3788172465045908734368315) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3474203545639783811292668732035443921698293 : Rat) / 3297264581303995680684405681363816607125) [(9, 1), (12, 3), (14, 1), (15, 1)],
  term ((-35464324049002044839088 : Rat) / 4339258264657398321155) [(9, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-3474203545639783811292668732035443921698293 : Rat) / 6594529162607991361368811362727633214250) [(9, 1), (12, 3), (15, 1)],
  term ((17732162024501022419544 : Rat) / 4339258264657398321155) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((1537007945108921447188183801491918463358388541571985663377588776078671572181109 : Rat) / 219195895786710577282300681629963237955224990626223035071438884453126616224000) [(9, 1), (13, 1)],
  term ((407495867443192794235484012501721642304808759545023870822906399646908647151381519701 : Rat) / 257248303295283533498508079960924856064252048998935353959840674794189396800486400) [(9, 1), (13, 1), (14, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6606247453038541125565155 : Rat) / 168363220668707054860814) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-293645380351394610468802941086131052372859692235572596837133054301514646475432156247 : Rat) / 91874394034029833392324314271758877165804303213905483557085955283639070285888000) [(9, 1), (13, 1), (14, 2)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-8080381769749740 : Rat) / 7342292683791569) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6606247453038541125565155 : Rat) / 84181610334353527430407) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 2000 through 2099. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_2000_2099_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_2000_2099
      rs_R009_ueqv_R009NYNYN_block_28_2000_2099 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
