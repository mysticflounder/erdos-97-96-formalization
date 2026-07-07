/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:2000-2099

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_2000_2099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 2000 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2000 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 2000 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2000 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2000 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2000
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2000 := by
  native_decide

/-- Coefficient term 2001 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2001 : Poly :=
[
  term ((2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 2001 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2001 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2001 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2001
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2001 := by
  native_decide

/-- Coefficient term 2002 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2002 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2002 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2002 : Poly :=
[
  term ((10403022895177344256 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2002 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2002
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2002 := by
  native_decide

/-- Coefficient term 2003 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2003 : Poly :=
[
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 2003 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2003 : Poly :=
[
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((93256174352261123072 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2003 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2003
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2003 := by
  native_decide

/-- Coefficient term 2004 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2004 : Poly :=
[
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2004 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2004 : Poly :=
[
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2004 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2004
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2004 := by
  native_decide

/-- Coefficient term 2005 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2005 : Poly :=
[
  term ((5201511447588672128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2005 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2005 : Poly :=
[
  term ((10403022895177344256 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2005 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2005
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2005 := by
  native_decide

/-- Coefficient term 2006 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2006 : Poly :=
[
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2006 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2006 : Poly :=
[
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2006 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2006
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2006 := by
  native_decide

/-- Coefficient term 2007 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2007 : Poly :=
[
  term ((2600755723794336064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 2007 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2007 : Poly :=
[
  term ((5201511447588672128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2600755723794336064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2007 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2007
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2007 := by
  native_decide

/-- Coefficient term 2008 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2008 : Poly :=
[
  term ((20806045790354688512 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2008 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2008 : Poly :=
[
  term ((41612091580709377024 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2008 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2008
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2008 := by
  native_decide

/-- Coefficient term 2009 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2009 : Poly :=
[
  term ((-8418017671482129344 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 2009 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2009 : Poly :=
[
  term ((-16836035342964258688 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((8418017671482129344 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2009 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2009
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2009 := by
  native_decide

/-- Coefficient term 2010 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2010 : Poly :=
[
  term ((23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 2010 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2010 : Poly :=
[
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2010 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2010
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2010 := by
  native_decide

/-- Coefficient term 2011 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2011 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2011 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2011 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2011 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2011
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2011 := by
  native_decide

/-- Coefficient term 2012 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2012 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2012 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2012 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2012 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2012
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2012 := by
  native_decide

/-- Coefficient term 2013 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2013 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2013 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2013 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2013 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2013
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2013 := by
  native_decide

/-- Coefficient term 2014 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2014 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 2014 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2014 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2014 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2014
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2014 := by
  native_decide

/-- Coefficient term 2015 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2015 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 2015 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2015 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2015 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2015
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2015 := by
  native_decide

/-- Coefficient term 2016 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2016 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2016 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2016 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2016 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2016
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2016 := by
  native_decide

/-- Coefficient term 2017 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2017 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2017 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2017 : Poly :=
[
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2017 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2017
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2017 := by
  native_decide

/-- Coefficient term 2018 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2018 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 2018 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2018 : Poly :=
[
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2018 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2018
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2018 := by
  native_decide

/-- Coefficient term 2019 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2019 : Poly :=
[
  term ((234434006574915815846 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 2019 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2019 : Poly :=
[
  term ((468868013149831631692 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-234434006574915815846 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2019 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2019
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2019 := by
  native_decide

/-- Coefficient term 2020 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2020 : Poly :=
[
  term ((4999882740922454656 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 2020 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2020 : Poly :=
[
  term ((9999765481844909312 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4999882740922454656 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2020 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2020
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2020 := by
  native_decide

/-- Coefficient term 2021 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2021 : Poly :=
[
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2021 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2021 : Poly :=
[
  term ((191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2021 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2021
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2021 := by
  native_decide

/-- Coefficient term 2022 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2022 : Poly :=
[
  term ((191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2022 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2022 : Poly :=
[
  term ((383924068390104923648 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2022 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2022
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2022 := by
  native_decide

/-- Coefficient term 2023 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2023 : Poly :=
[
  term ((278471186185100039296 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 2023 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2023 : Poly :=
[
  term ((556942372370200078592 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-278471186185100039296 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2023 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2023
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2023 := by
  native_decide

/-- Coefficient term 2024 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2024 : Poly :=
[
  term ((-551629423133793335936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 2024 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2024 : Poly :=
[
  term ((-1103258846267586671872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((551629423133793335936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2024 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2024
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2024 := by
  native_decide

/-- Coefficient term 2025 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2025 : Poly :=
[
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2025 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2025 : Poly :=
[
  term ((35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2025 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2025
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2025 := by
  native_decide

/-- Coefficient term 2026 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2026 : Poly :=
[
  term ((1894373021495730688 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 2026 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2026 : Poly :=
[
  term ((-1894373021495730688 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((3788746042991461376 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2026 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2026
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2026 := by
  native_decide

/-- Coefficient term 2027 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2027 : Poly :=
[
  term ((35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2027 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2027 : Poly :=
[
  term ((71114605730400015872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2027 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2027
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2027 := by
  native_decide

/-- Coefficient term 2028 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2028 : Poly :=
[
  term ((17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2028 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2028 : Poly :=
[
  term ((35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2028 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2028
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2028 := by
  native_decide

/-- Coefficient term 2029 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2029 : Poly :=
[
  term ((273117101644084330816 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 2029 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2029 : Poly :=
[
  term ((546234203288168661632 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-273117101644084330816 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2029 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2029
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2029 := by
  native_decide

/-- Coefficient term 2030 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2030 : Poly :=
[
  term ((-17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 2030 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2030 : Poly :=
[
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2030 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2030
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2030 := by
  native_decide

/-- Coefficient term 2031 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2031 : Poly :=
[
  term ((8883940493983474624 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 2031 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2031 : Poly :=
[
  term ((17767880987966949248 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-8883940493983474624 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2031 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2031
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2031 := by
  native_decide

/-- Coefficient term 2032 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2032 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2032 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2032 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2032 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2032
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2032 := by
  native_decide

/-- Coefficient term 2033 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2033 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2033 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2033 : Poly :=
[
  term ((-112866384922726400 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2033 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2033
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2033 := by
  native_decide

/-- Coefficient term 2034 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2034 : Poly :=
[
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 2034 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2034 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2034 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2034
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2034 := by
  native_decide

/-- Coefficient term 2035 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2035 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 2035 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2035 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2035 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2035
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2035 := by
  native_decide

/-- Coefficient term 2036 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2036 : Poly :=
[
  term ((-3571708172118305015776 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2036 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2036 : Poly :=
[
  term ((3571708172118305015776 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7143416344236610031552 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2036 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2036
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2036 := by
  native_decide

/-- Coefficient term 2037 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2037 : Poly :=
[
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 2037 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2037 : Poly :=
[
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((250159693855260997632 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2037 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2037
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2037 := by
  native_decide

/-- Coefficient term 2038 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2038 : Poly :=
[
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2038 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2038 : Poly :=
[
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2038 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2038
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2038 := by
  native_decide

/-- Coefficient term 2039 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2039 : Poly :=
[
  term ((2280524925257042658976 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2039 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2039 : Poly :=
[
  term ((4561049850514085317952 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2280524925257042658976 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2039 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2039
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2039 := by
  native_decide

/-- Coefficient term 2040 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2040 : Poly :=
[
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2040 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2040 : Poly :=
[
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2040 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2040
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2040 := by
  native_decide

/-- Coefficient term 2041 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2041 : Poly :=
[
  term ((843198443425259115728 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 2041 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2041 : Poly :=
[
  term ((1686396886850518231456 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-843198443425259115728 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2041 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2041
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2041 := by
  native_decide

/-- Coefficient term 2042 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2042 : Poly :=
[
  term ((374021934416662849856 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2042 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2042 : Poly :=
[
  term ((748043868833325699712 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-374021934416662849856 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2042 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2042
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2042 := by
  native_decide

/-- Coefficient term 2043 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2043 : Poly :=
[
  term ((-617152196964378099728 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2043 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2043 : Poly :=
[
  term ((-1234304393928756199456 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((617152196964378099728 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2043 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2043
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2043 := by
  native_decide

/-- Coefficient term 2044 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2044 : Poly :=
[
  term ((62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 2044 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2044 : Poly :=
[
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2044 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2044
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2044 := by
  native_decide

/-- Coefficient term 2045 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2045 : Poly :=
[
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 2045 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2045 : Poly :=
[
  term ((-140732359881236480 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((70366179940618240 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2045 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2045
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2045 := by
  native_decide

/-- Coefficient term 2046 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2046 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2046 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2046 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2046 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2046
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2046 := by
  native_decide

/-- Coefficient term 2047 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2047 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2047 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2047 : Poly :=
[
  term ((426539992519925760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2047 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2047
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2047 := by
  native_decide

/-- Coefficient term 2048 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2048 : Poly :=
[
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2048 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2048 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2048 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2048
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2048 := by
  native_decide

/-- Coefficient term 2049 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2049 : Poly :=
[
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2049 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2049 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2049 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2049
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2049 := by
  native_decide

/-- Coefficient term 2050 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2050 : Poly :=
[
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2050 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2050 : Poly :=
[
  term ((40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2050 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2050
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2050 := by
  native_decide

/-- Coefficient term 2051 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2051 : Poly :=
[
  term ((40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2051 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2051 : Poly :=
[
  term ((81316758641444399104 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2051 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2051
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2051 := by
  native_decide

/-- Coefficient term 2052 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2052 : Poly :=
[
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2052 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2052 : Poly :=
[
  term ((40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2052 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2052
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2052 := by
  native_decide

/-- Coefficient term 2053 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2053 : Poly :=
[
  term ((8906656304825851136 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 2053 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2053 : Poly :=
[
  term ((17813312609651702272 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-8906656304825851136 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2053 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2053
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2053 := by
  native_decide

/-- Coefficient term 2054 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2054 : Poly :=
[
  term ((-20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 2054 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2054 : Poly :=
[
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2054 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2054
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2054 := by
  native_decide

/-- Coefficient term 2055 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2055 : Poly :=
[
  term ((-8413297359032750336 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 2055 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2055 : Poly :=
[
  term ((-16826594718065500672 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((8413297359032750336 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2055 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2055
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2055 := by
  native_decide

/-- Coefficient term 2056 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2056 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2056 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2056 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2056 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2056
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2056 := by
  native_decide

/-- Coefficient term 2057 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2057 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2057 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2057 : Poly :=
[
  term ((142309018178682880 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2057 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2057
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2057 := by
  native_decide

/-- Coefficient term 2058 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2058 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 2058 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2058 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2058 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2058
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2058 := by
  native_decide

/-- Coefficient term 2059 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2059 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 2059 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2059 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2059 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2059
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2059 := by
  native_decide

/-- Coefficient term 2060 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2060 : Poly :=
[
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 1), (16, 1)]
]

/-- Partial product 2060 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2060 : Poly :=
[
  term ((5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2060 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2060
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2060 := by
  native_decide

/-- Coefficient term 2061 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2061 : Poly :=
[
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2061 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2061 : Poly :=
[
  term ((107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2061 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2061
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2061 := by
  native_decide

/-- Coefficient term 2062 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2062 : Poly :=
[
  term ((107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2062 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2062 : Poly :=
[
  term ((214061386431808725296 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2062 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2062
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2062 := by
  native_decide

/-- Coefficient term 2063 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2063 : Poly :=
[
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2063 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2063 : Poly :=
[
  term ((107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2063 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2063
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2063 := by
  native_decide

/-- Coefficient term 2064 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2064 : Poly :=
[
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2064 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2064 : Poly :=
[
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2064 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2064
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2064 := by
  native_decide

/-- Coefficient term 2065 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2065 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2065 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2065 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2065 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2065
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2065 := by
  native_decide

/-- Coefficient term 2066 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2066 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2066 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2066 : Poly :=
[
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2066 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2066
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2066 := by
  native_decide

/-- Coefficient term 2067 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2067 : Poly :=
[
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2067 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2067 : Poly :=
[
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2067 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2067
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2067 := by
  native_decide

/-- Coefficient term 2068 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2068 : Poly :=
[
  term ((93769178090243826392 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 2068 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2068 : Poly :=
[
  term ((187538356180487652784 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-93769178090243826392 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2068 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2068
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2068 := by
  native_decide

/-- Coefficient term 2069 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2069 : Poly :=
[
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 2069 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2069 : Poly :=
[
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2069 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2069
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2069 := by
  native_decide

/-- Coefficient term 2070 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2070 : Poly :=
[
  term ((628905400039050442 : Rat) / 89830441576176585) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 2070 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2070 : Poly :=
[
  term ((1257810800078100884 : Rat) / 89830441576176585) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-628905400039050442 : Rat) / 89830441576176585) [(5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2070 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2070
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2070 := by
  native_decide

/-- Coefficient term 2071 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2071 : Poly :=
[
  term ((-74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 2071 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2071 : Poly :=
[
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2071 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2071
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2071 := by
  native_decide

/-- Coefficient term 2072 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2072 : Poly :=
[
  term ((-50965111854247936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 2072 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2072 : Poly :=
[
  term ((-101930223708495872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((50965111854247936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2072 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2072_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2072
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2072 := by
  native_decide

/-- Coefficient term 2073 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2073 : Poly :=
[
  term ((290922195766284032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 2073 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2073 : Poly :=
[
  term ((581844391532568064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-290922195766284032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2073 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2073_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2073
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2073 := by
  native_decide

/-- Coefficient term 2074 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2074 : Poly :=
[
  term ((211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2074 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2074 : Poly :=
[
  term ((-211310777032520608952 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((422621554065041217904 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2074 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2074_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2074
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2074 := by
  native_decide

/-- Coefficient term 2075 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2075 : Poly :=
[
  term ((-1060077680229954281944 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2075 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2075 : Poly :=
[
  term ((-2120155360459908563888 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1060077680229954281944 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2075 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2075_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2075
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2075 := by
  native_decide

/-- Coefficient term 2076 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2076 : Poly :=
[
  term ((-524566813608503631308 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 2076 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2076 : Poly :=
[
  term ((-1049133627217007262616 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((524566813608503631308 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2076 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2076_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2076
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2076 := by
  native_decide

/-- Coefficient term 2077 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2077 : Poly :=
[
  term ((130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2077 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2077 : Poly :=
[
  term ((261021856840832384 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2077 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2077_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2077
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2077 := by
  native_decide

/-- Coefficient term 2078 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2078 : Poly :=
[
  term ((783386825823715117508 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 2078 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2078 : Poly :=
[
  term ((1566773651647430235016 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-783386825823715117508 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2078 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2078_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2078
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2078 := by
  native_decide

/-- Coefficient term 2079 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2079 : Poly :=
[
  term ((-2114322739200 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 2), (11, 1), (16, 1)]
]

/-- Partial product 2079 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2079 : Poly :=
[
  term ((-4228645478400 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2079 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2079_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2079
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2079 := by
  native_decide

/-- Coefficient term 2080 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2080 : Poly :=
[
  term ((74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 2080 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2080 : Poly :=
[
  term ((149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2080 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2080_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2080
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2080 := by
  native_decide

/-- Coefficient term 2081 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2081 : Poly :=
[
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 2081 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2081 : Poly :=
[
  term ((-298786499782448128 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2081 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2081_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2081
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2081 := by
  native_decide

/-- Coefficient term 2082 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2082 : Poly :=
[
  term ((8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2082 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2082 : Poly :=
[
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((17090829968789593600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2082 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2082_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2082
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2082 := by
  native_decide

/-- Coefficient term 2083 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2083 : Poly :=
[
  term ((175062625358773856 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 2083 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2083 : Poly :=
[
  term ((-175062625358773856 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((350125250717547712 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2083 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2083_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2083
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2083 := by
  native_decide

/-- Coefficient term 2084 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2084 : Poly :=
[
  term ((-8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2084 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2084 : Poly :=
[
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2084 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2084_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2084
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2084 := by
  native_decide

/-- Coefficient term 2085 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2085 : Poly :=
[
  term ((-7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2085 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2085 : Poly :=
[
  term ((-14473016737428912896 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2085 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2085_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2085
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2085 := by
  native_decide

/-- Coefficient term 2086 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2086 : Poly :=
[
  term ((-14167548379161734312 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 2086 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2086 : Poly :=
[
  term ((-28335096758323468624 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((14167548379161734312 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2086 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2086_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2086
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2086 := by
  native_decide

/-- Coefficient term 2087 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2087 : Poly :=
[
  term ((-967593547098646016 : Rat) / 17966088315235317) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 2087 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2087 : Poly :=
[
  term ((-1935187094197292032 : Rat) / 17966088315235317) [(5, 2), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((967593547098646016 : Rat) / 17966088315235317) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2087 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2087_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2087
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2087 := by
  native_decide

/-- Coefficient term 2088 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2088 : Poly :=
[
  term ((475103519750908800 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 2088 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2088 : Poly :=
[
  term ((950207039501817600 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-475103519750908800 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2088 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2088_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2088
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2088 := by
  native_decide

/-- Coefficient term 2089 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2089 : Poly :=
[
  term ((-7629540008709653552 : Rat) / 161694794837117853) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 2089 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2089 : Poly :=
[
  term ((-15259080017419307104 : Rat) / 161694794837117853) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((7629540008709653552 : Rat) / 161694794837117853) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2089 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2089_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2089
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2089 := by
  native_decide

/-- Coefficient term 2090 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2090 : Poly :=
[
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2090 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2090 : Poly :=
[
  term ((4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2090 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2090_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2090
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2090 := by
  native_decide

/-- Coefficient term 2091 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2091 : Poly :=
[
  term ((4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2091 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2091 : Poly :=
[
  term ((8433775374907807744 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2091 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2091_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2091
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2091 := by
  native_decide

/-- Coefficient term 2092 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2092 : Poly :=
[
  term ((2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 2092 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2092 : Poly :=
[
  term ((4217077976500431872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2092 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2092_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2092
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2092 := by
  native_decide

/-- Coefficient term 2093 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2093 : Poly :=
[
  term ((-1675992702085607936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 2093 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2093 : Poly :=
[
  term ((-3351985404171215872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((1675992702085607936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2093 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2093_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2093
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2093 := by
  native_decide

/-- Coefficient term 2094 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2094 : Poly :=
[
  term ((-2864363248016246976 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2094 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2094 : Poly :=
[
  term ((2864363248016246976 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5728726496032493952 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2094 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2094_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2094
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2094 := by
  native_decide

/-- Coefficient term 2095 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2095 : Poly :=
[
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 2095 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2095 : Poly :=
[
  term ((62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2095 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2095_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2095
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2095 := by
  native_decide

/-- Coefficient term 2096 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2096 : Poly :=
[
  term ((62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2096 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2096 : Poly :=
[
  term ((124856456357000300096 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2096 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2096_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2096
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2096 := by
  native_decide

/-- Coefficient term 2097 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2097 : Poly :=
[
  term ((36565468589577901912 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2097 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2097 : Poly :=
[
  term ((73130937179155803824 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36565468589577901912 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2097 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2097_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2097
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2097 := by
  native_decide

/-- Coefficient term 2098 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2098 : Poly :=
[
  term ((2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 2098 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2098 : Poly :=
[
  term ((4299895776072604928 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2098 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2098_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2098
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2098 := by
  native_decide

/-- Coefficient term 2099 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_2099 : Poly :=
[
  term ((50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2099 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_2099 : Poly :=
[
  term ((100669242223361146336 : Rat) / 89830441576176585) [(5, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2099 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_2099_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_2099
        rs_R010_ueqv_R010YNN_generator_25_2000_2099 =
      rs_R010_ueqv_R010YNN_partial_25_2099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_2000_2099 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_2000,
  rs_R010_ueqv_R010YNN_partial_25_2001,
  rs_R010_ueqv_R010YNN_partial_25_2002,
  rs_R010_ueqv_R010YNN_partial_25_2003,
  rs_R010_ueqv_R010YNN_partial_25_2004,
  rs_R010_ueqv_R010YNN_partial_25_2005,
  rs_R010_ueqv_R010YNN_partial_25_2006,
  rs_R010_ueqv_R010YNN_partial_25_2007,
  rs_R010_ueqv_R010YNN_partial_25_2008,
  rs_R010_ueqv_R010YNN_partial_25_2009,
  rs_R010_ueqv_R010YNN_partial_25_2010,
  rs_R010_ueqv_R010YNN_partial_25_2011,
  rs_R010_ueqv_R010YNN_partial_25_2012,
  rs_R010_ueqv_R010YNN_partial_25_2013,
  rs_R010_ueqv_R010YNN_partial_25_2014,
  rs_R010_ueqv_R010YNN_partial_25_2015,
  rs_R010_ueqv_R010YNN_partial_25_2016,
  rs_R010_ueqv_R010YNN_partial_25_2017,
  rs_R010_ueqv_R010YNN_partial_25_2018,
  rs_R010_ueqv_R010YNN_partial_25_2019,
  rs_R010_ueqv_R010YNN_partial_25_2020,
  rs_R010_ueqv_R010YNN_partial_25_2021,
  rs_R010_ueqv_R010YNN_partial_25_2022,
  rs_R010_ueqv_R010YNN_partial_25_2023,
  rs_R010_ueqv_R010YNN_partial_25_2024,
  rs_R010_ueqv_R010YNN_partial_25_2025,
  rs_R010_ueqv_R010YNN_partial_25_2026,
  rs_R010_ueqv_R010YNN_partial_25_2027,
  rs_R010_ueqv_R010YNN_partial_25_2028,
  rs_R010_ueqv_R010YNN_partial_25_2029,
  rs_R010_ueqv_R010YNN_partial_25_2030,
  rs_R010_ueqv_R010YNN_partial_25_2031,
  rs_R010_ueqv_R010YNN_partial_25_2032,
  rs_R010_ueqv_R010YNN_partial_25_2033,
  rs_R010_ueqv_R010YNN_partial_25_2034,
  rs_R010_ueqv_R010YNN_partial_25_2035,
  rs_R010_ueqv_R010YNN_partial_25_2036,
  rs_R010_ueqv_R010YNN_partial_25_2037,
  rs_R010_ueqv_R010YNN_partial_25_2038,
  rs_R010_ueqv_R010YNN_partial_25_2039,
  rs_R010_ueqv_R010YNN_partial_25_2040,
  rs_R010_ueqv_R010YNN_partial_25_2041,
  rs_R010_ueqv_R010YNN_partial_25_2042,
  rs_R010_ueqv_R010YNN_partial_25_2043,
  rs_R010_ueqv_R010YNN_partial_25_2044,
  rs_R010_ueqv_R010YNN_partial_25_2045,
  rs_R010_ueqv_R010YNN_partial_25_2046,
  rs_R010_ueqv_R010YNN_partial_25_2047,
  rs_R010_ueqv_R010YNN_partial_25_2048,
  rs_R010_ueqv_R010YNN_partial_25_2049,
  rs_R010_ueqv_R010YNN_partial_25_2050,
  rs_R010_ueqv_R010YNN_partial_25_2051,
  rs_R010_ueqv_R010YNN_partial_25_2052,
  rs_R010_ueqv_R010YNN_partial_25_2053,
  rs_R010_ueqv_R010YNN_partial_25_2054,
  rs_R010_ueqv_R010YNN_partial_25_2055,
  rs_R010_ueqv_R010YNN_partial_25_2056,
  rs_R010_ueqv_R010YNN_partial_25_2057,
  rs_R010_ueqv_R010YNN_partial_25_2058,
  rs_R010_ueqv_R010YNN_partial_25_2059,
  rs_R010_ueqv_R010YNN_partial_25_2060,
  rs_R010_ueqv_R010YNN_partial_25_2061,
  rs_R010_ueqv_R010YNN_partial_25_2062,
  rs_R010_ueqv_R010YNN_partial_25_2063,
  rs_R010_ueqv_R010YNN_partial_25_2064,
  rs_R010_ueqv_R010YNN_partial_25_2065,
  rs_R010_ueqv_R010YNN_partial_25_2066,
  rs_R010_ueqv_R010YNN_partial_25_2067,
  rs_R010_ueqv_R010YNN_partial_25_2068,
  rs_R010_ueqv_R010YNN_partial_25_2069,
  rs_R010_ueqv_R010YNN_partial_25_2070,
  rs_R010_ueqv_R010YNN_partial_25_2071,
  rs_R010_ueqv_R010YNN_partial_25_2072,
  rs_R010_ueqv_R010YNN_partial_25_2073,
  rs_R010_ueqv_R010YNN_partial_25_2074,
  rs_R010_ueqv_R010YNN_partial_25_2075,
  rs_R010_ueqv_R010YNN_partial_25_2076,
  rs_R010_ueqv_R010YNN_partial_25_2077,
  rs_R010_ueqv_R010YNN_partial_25_2078,
  rs_R010_ueqv_R010YNN_partial_25_2079,
  rs_R010_ueqv_R010YNN_partial_25_2080,
  rs_R010_ueqv_R010YNN_partial_25_2081,
  rs_R010_ueqv_R010YNN_partial_25_2082,
  rs_R010_ueqv_R010YNN_partial_25_2083,
  rs_R010_ueqv_R010YNN_partial_25_2084,
  rs_R010_ueqv_R010YNN_partial_25_2085,
  rs_R010_ueqv_R010YNN_partial_25_2086,
  rs_R010_ueqv_R010YNN_partial_25_2087,
  rs_R010_ueqv_R010YNN_partial_25_2088,
  rs_R010_ueqv_R010YNN_partial_25_2089,
  rs_R010_ueqv_R010YNN_partial_25_2090,
  rs_R010_ueqv_R010YNN_partial_25_2091,
  rs_R010_ueqv_R010YNN_partial_25_2092,
  rs_R010_ueqv_R010YNN_partial_25_2093,
  rs_R010_ueqv_R010YNN_partial_25_2094,
  rs_R010_ueqv_R010YNN_partial_25_2095,
  rs_R010_ueqv_R010YNN_partial_25_2096,
  rs_R010_ueqv_R010YNN_partial_25_2097,
  rs_R010_ueqv_R010YNN_partial_25_2098,
  rs_R010_ueqv_R010YNN_partial_25_2099
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_2000_2099 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 2), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2600755723794336064 : Rat) / 29943480525392195) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-93256174352261123072 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52971108029289260672 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((93256174352261123072 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((46628087176130561536 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2600755723794336064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((8418017671482129344 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-23314043588065280768 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((149201931245565692164 : Rat) / 449152207880882925) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1700977553050764416 : Rat) / 53898264945705951) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-234434006574915815846 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((9999765481844909312 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-4999882740922454656 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((383924068390104923648 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((556942372370200078592 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-105474548736485857280 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-383924068390104923648 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-191962034195052461824 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-278471186185100039296 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((551629423133793335936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((71114605730400015872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((546234203288168661632 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((51409269942405117056 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-71114605730400015872 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((3788746042991461376 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-35557302865200007936 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-273117101644084330816 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((17778651432600003968 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-8883940493983474624 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-250159693855260997632 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4561049850514085317952 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1686396886850518231456 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((748043868833325699712 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51942306181989973696 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7143416344236610031552 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((250159693855260997632 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((125079846927630498816 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2280524925257042658976 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-843198443425259115728 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-374021934416662849856 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((617152196964378099728 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-62539923463815249408 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-140732359881236480 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((70366179940618240 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 2), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((81316758641444399104 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17813312609651702272 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-16826594718065500672 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-81316758641444399104 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-40658379320722199552 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-8906656304825851136 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((20329189660361099776 : Rat) / 89830441576176585) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((8413297359032750336 : Rat) / 269491324728529755) [(5, 2), (8, 1), (9, 2), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (13, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(5, 2), (8, 1), (10, 1), (16, 1)],
  term ((214061386431808725296 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-214061386431808725296 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-107030693215904362648 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((53515346607952181324 : Rat) / 149717402626960975) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3633339420515800547392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((187538356180487652784 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((1257810800078100884 : Rat) / 89830441576176585) [(5, 2), (8, 1), (12, 1), (16, 1)],
  term ((-3633339420515800547392 : Rat) / 269491324728529755) [(5, 2), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1816669710257900273696 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-93769178090243826392 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (14, 1), (16, 1)],
  term ((908334855128950136848 : Rat) / 269491324728529755) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-628905400039050442 : Rat) / 89830441576176585) [(5, 2), (8, 1), (16, 1)],
  term ((-101930223708495872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((656541016478180096 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((50965111854247936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-290922195766284032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-2120155360459908563888 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1049133627217007262616 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((261021856840832384 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((170073255494942396752 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((422621554065041217904 : Rat) / 161694794837117853) [(5, 2), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1060077680229954281944 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((524566813608503631308 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-130510928420416192 : Rat) / 29943480525392195) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-783386825823715117508 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 2), (11, 1), (12, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-298786499782448128 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-74696624945612032 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((149393249891224064 : Rat) / 269491324728529755) [(5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-17090829968789593600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14473016737428912896 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28335096758323468624 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1935187094197292032 : Rat) / 17966088315235317) [(5, 2), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-77870963715325500224 : Rat) / 808473974185589265) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((17090829968789593600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((350125250717547712 : Rat) / 89830441576176585) [(5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((8545414984394796800 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7236508368714456448 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((14167548379161734312 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((967593547098646016 : Rat) / 17966088315235317) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-475103519750908800 : Rat) / 5988696105078439) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((7629540008709653552 : Rat) / 161694794837117853) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((8433775374907807744 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4217077976500431872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8433775374907807744 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-4216887687453903872 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2108538988250215936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1675992702085607936 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((124856456357000300096 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((73130937179155803824 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4299895776072604928 : Rat) / 269491324728529755) [(5, 2), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((100669242223361146336 : Rat) / 89830441576176585) [(5, 2), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2864363248016246976 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5728726496032493952 : Rat) / 29943480525392195) [(5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-124856456357000300096 : Rat) / 53898264945705951) [(5, 2), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-62428228178500150048 : Rat) / 53898264945705951) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36565468589577901912 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2149947888036302464 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-50334621111680573168 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 2000 through 2099. -/
theorem rs_R010_ueqv_R010YNN_block_25_2000_2099_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_2000_2099
      rs_R010_ueqv_R010YNN_block_25_2000_2099 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
