/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 19:2000-2099

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_19_2000_2099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 2000 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2000 : Poly :=
[
  term ((6 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 2000 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2000 : Poly :=
[
  term ((12 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2000 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2000_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2000
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2000 := by
  native_decide

/-- Coefficient term 2001 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2001 : Poly :=
[
  term ((81 : Rat) / 10) [(6, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 2001 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2001 : Poly :=
[
  term ((81 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-81 : Rat) / 10) [(6, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2001 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2001_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2001
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2001 := by
  native_decide

/-- Coefficient term 2002 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2002 : Poly :=
[
  term ((-9 : Rat) / 10) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 2002 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2002 : Poly :=
[
  term ((-9 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 10) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2002 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2002_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2002
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2002 := by
  native_decide

/-- Coefficient term 2003 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2003 : Poly :=
[
  term ((616 : Rat) / 5) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 2003 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2003 : Poly :=
[
  term ((1232 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-616 : Rat) / 5) [(6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2003 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2003_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2003
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2003 := by
  native_decide

/-- Coefficient term 2004 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2004 : Poly :=
[
  term ((-25574 : Rat) / 105) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 2004 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2004 : Poly :=
[
  term ((-51148 : Rat) / 105) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((25574 : Rat) / 105) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2004 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2004_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2004
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2004 := by
  native_decide

/-- Coefficient term 2005 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2005 : Poly :=
[
  term ((1042 : Rat) / 35) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2005 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2005 : Poly :=
[
  term ((2084 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1042 : Rat) / 35) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2005 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2005_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2005
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2005 := by
  native_decide

/-- Coefficient term 2006 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2006 : Poly :=
[
  term ((-19067264 : Rat) / 53375) [(6, 1), (7, 1), (11, 1), (13, 2)]
]

/-- Partial product 2006 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2006 : Poly :=
[
  term ((-38134528 : Rat) / 53375) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((19067264 : Rat) / 53375) [(6, 1), (7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2006 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2006_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2006
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2006 := by
  native_decide

/-- Coefficient term 2007 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2007 : Poly :=
[
  term ((3072 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 2007 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2007 : Poly :=
[
  term ((6144 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-3072 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2007 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2007_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2007
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2007 := by
  native_decide

/-- Coefficient term 2008 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2008 : Poly :=
[
  term ((-1024 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2008 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2008 : Poly :=
[
  term ((-2048 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1024 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2008 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2008_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2008
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2008 := by
  native_decide

/-- Coefficient term 2009 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2009 : Poly :=
[
  term ((832 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 2009 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2009 : Poly :=
[
  term ((1664 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-832 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2009 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2009_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2009
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2009 := by
  native_decide

/-- Coefficient term 2010 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2010 : Poly :=
[
  term ((-576 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 2010 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2010 : Poly :=
[
  term ((-1152 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((576 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2010 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2010_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2010
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2010 := by
  native_decide

/-- Coefficient term 2011 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2011 : Poly :=
[
  term ((693 : Rat) / 25) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 2011 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2011 : Poly :=
[
  term ((1386 : Rat) / 25) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-693 : Rat) / 25) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2011 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2011_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2011
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2011 := by
  native_decide

/-- Coefficient term 2012 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2012 : Poly :=
[
  term ((-9 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2012 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2012 : Poly :=
[
  term ((-18 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2012 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2012_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2012
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2012 := by
  native_decide

/-- Coefficient term 2013 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2013 : Poly :=
[
  term ((-6321712 : Rat) / 53375) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 2013 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2013 : Poly :=
[
  term ((-12643424 : Rat) / 53375) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((6321712 : Rat) / 53375) [(6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2013 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2013_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2013
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2013 := by
  native_decide

/-- Coefficient term 2014 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2014 : Poly :=
[
  term ((768 : Rat) / 7) [(6, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 2014 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2014 : Poly :=
[
  term ((1536 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 7) [(6, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2014 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2014_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2014
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2014 := by
  native_decide

/-- Coefficient term 2015 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2015 : Poly :=
[
  term ((288 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2015 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2015 : Poly :=
[
  term ((576 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-288 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2015 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2015_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2015
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2015 := by
  native_decide

/-- Coefficient term 2016 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2016 : Poly :=
[
  term ((-234 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 2016 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2016 : Poly :=
[
  term ((-468 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((234 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2016 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2016_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2016
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2016 := by
  native_decide

/-- Coefficient term 2017 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2017 : Poly :=
[
  term ((16867 : Rat) / 1400) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 2017 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2017 : Poly :=
[
  term ((16867 : Rat) / 700) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-16867 : Rat) / 1400) [(6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2017 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2017_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2017
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2017 := by
  native_decide

/-- Coefficient term 2018 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2018 : Poly :=
[
  term ((-79 : Rat) / 280) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 2018 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2018 : Poly :=
[
  term ((-79 : Rat) / 140) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((79 : Rat) / 280) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2018 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2018_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2018
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2018 := by
  native_decide

/-- Coefficient term 2019 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2019 : Poly :=
[
  term ((2736 : Rat) / 7625) [(6, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 2019 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2019 : Poly :=
[
  term ((5472 : Rat) / 7625) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-2736 : Rat) / 7625) [(6, 1), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2019 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2019_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2019
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2019 := by
  native_decide

/-- Coefficient term 2020 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2020 : Poly :=
[
  term ((1005 : Rat) / 7) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 2020 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2020 : Poly :=
[
  term ((2010 : Rat) / 7) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1005 : Rat) / 7) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2020 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2020_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2020
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2020 := by
  native_decide

/-- Coefficient term 2021 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2021 : Poly :=
[
  term ((-729 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2021 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2021 : Poly :=
[
  term ((-1458 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((729 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2021 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2021_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2021
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2021 := by
  native_decide

/-- Coefficient term 2022 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2022 : Poly :=
[
  term ((34443648 : Rat) / 53375) [(6, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 2022 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2022 : Poly :=
[
  term ((68887296 : Rat) / 53375) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-34443648 : Rat) / 53375) [(6, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2022 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2022_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2022
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2022 := by
  native_decide

/-- Coefficient term 2023 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2023 : Poly :=
[
  term ((-27648 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 2023 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2023 : Poly :=
[
  term ((-55296 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((27648 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2023 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2023_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2023
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2023 := by
  native_decide

/-- Coefficient term 2024 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2024 : Poly :=
[
  term ((9216 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2024 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2024 : Poly :=
[
  term ((18432 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9216 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2024 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2024_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2024
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2024 := by
  native_decide

/-- Coefficient term 2025 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2025 : Poly :=
[
  term ((-7488 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 2025 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2025 : Poly :=
[
  term ((-14976 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((7488 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2025 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2025_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2025
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2025 := by
  native_decide

/-- Coefficient term 2026 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2026 : Poly :=
[
  term ((-125408 : Rat) / 875) [(6, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 2026 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2026 : Poly :=
[
  term ((-250816 : Rat) / 875) [(6, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((125408 : Rat) / 875) [(6, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2026 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2026_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2026
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2026 := by
  native_decide

/-- Coefficient term 2027 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2027 : Poly :=
[
  term ((6144 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 2027 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2027 : Poly :=
[
  term ((12288 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-6144 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2027 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2027_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2027
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2027 := by
  native_decide

/-- Coefficient term 2028 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2028 : Poly :=
[
  term ((-2048 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2028 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2028 : Poly :=
[
  term ((-4096 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2048 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2028 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2028_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2028
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2028 := by
  native_decide

/-- Coefficient term 2029 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2029 : Poly :=
[
  term ((1664 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 2029 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2029 : Poly :=
[
  term ((3328 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1664 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2029 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2029_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2029
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2029 := by
  native_decide

/-- Coefficient term 2030 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2030 : Poly :=
[
  term ((-9209 : Rat) / 105) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 2030 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2030 : Poly :=
[
  term ((-18418 : Rat) / 105) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((9209 : Rat) / 105) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2030 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2030_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2030
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2030 := by
  native_decide

/-- Coefficient term 2031 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2031 : Poly :=
[
  term ((379 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 2031 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2031 : Poly :=
[
  term ((758 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-379 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2031 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2031_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2031
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2031 := by
  native_decide

/-- Coefficient term 2032 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2032 : Poly :=
[
  term ((8125416 : Rat) / 53375) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 2032 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2032 : Poly :=
[
  term ((16250832 : Rat) / 53375) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-8125416 : Rat) / 53375) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2032 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2032_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2032
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2032 := by
  native_decide

/-- Coefficient term 2033 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2033 : Poly :=
[
  term ((-6528 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2033 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2033 : Poly :=
[
  term ((-13056 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((6528 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2033 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2033_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2033
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2033 := by
  native_decide

/-- Coefficient term 2034 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2034 : Poly :=
[
  term ((2176 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2034 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2034 : Poly :=
[
  term ((4352 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2176 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2034 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2034_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2034
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2034 := by
  native_decide

/-- Coefficient term 2035 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2035 : Poly :=
[
  term ((-1768 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2035 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2035 : Poly :=
[
  term ((-3536 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2035 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2035_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2035
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2035 := by
  native_decide

/-- Coefficient term 2036 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2036 : Poly :=
[
  term ((6137 : Rat) / 700) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 2036 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2036 : Poly :=
[
  term ((6137 : Rat) / 350) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-6137 : Rat) / 700) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2036 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2036_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2036
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2036 := by
  native_decide

/-- Coefficient term 2037 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2037 : Poly :=
[
  term ((-137 : Rat) / 28) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2037 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2037 : Poly :=
[
  term ((-137 : Rat) / 14) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((137 : Rat) / 28) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2037 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2037_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2037
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2037 := by
  native_decide

/-- Coefficient term 2038 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2038 : Poly :=
[
  term ((18063594 : Rat) / 53375) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 2038 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2038 : Poly :=
[
  term ((36127188 : Rat) / 53375) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-18063594 : Rat) / 53375) [(6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2038 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2038_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2038
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2038 := by
  native_decide

/-- Coefficient term 2039 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2039 : Poly :=
[
  term ((-10844 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 2039 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2039 : Poly :=
[
  term ((-21688 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((10844 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2039 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2039_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2039
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2039 := by
  native_decide

/-- Coefficient term 2040 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2040 : Poly :=
[
  term ((-352 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2040 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2040 : Poly :=
[
  term ((-704 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((352 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2040 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2040_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2040
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2040 := by
  native_decide

/-- Coefficient term 2041 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2041 : Poly :=
[
  term ((258 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 2041 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2041 : Poly :=
[
  term ((516 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-258 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2041 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2041_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2041
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2041 := by
  native_decide

/-- Coefficient term 2042 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2042 : Poly :=
[
  term ((15223 : Rat) / 840) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 2042 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2042 : Poly :=
[
  term ((15223 : Rat) / 420) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-15223 : Rat) / 840) [(6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2042 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2042_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2042
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2042 := by
  native_decide

/-- Coefficient term 2043 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2043 : Poly :=
[
  term ((459 : Rat) / 280) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2043 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2043 : Poly :=
[
  term ((459 : Rat) / 140) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-459 : Rat) / 280) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2043 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2043_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2043
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2043 := by
  native_decide

/-- Coefficient term 2044 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2044 : Poly :=
[
  term ((14341 : Rat) / 210) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 2044 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2044 : Poly :=
[
  term ((14341 : Rat) / 105) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-14341 : Rat) / 210) [(6, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2044 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2044_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2044
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2044 := by
  native_decide

/-- Coefficient term 2045 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2045 : Poly :=
[
  term ((-479 : Rat) / 70) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2045 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2045 : Poly :=
[
  term ((-479 : Rat) / 35) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((479 : Rat) / 70) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2045 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2045_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2045
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2045 := by
  native_decide

/-- Coefficient term 2046 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2046 : Poly :=
[
  term ((-5199448 : Rat) / 53375) [(6, 1), (10, 1), (13, 2)]
]

/-- Partial product 2046 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2046 : Poly :=
[
  term ((-10398896 : Rat) / 53375) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((5199448 : Rat) / 53375) [(6, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2046 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2046_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2046
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2046 := by
  native_decide

/-- Coefficient term 2047 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2047 : Poly :=
[
  term ((4224 : Rat) / 35) [(6, 1), (10, 1), (13, 2), (14, 1)]
]

/-- Partial product 2047 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2047 : Poly :=
[
  term ((8448 : Rat) / 35) [(6, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-4224 : Rat) / 35) [(6, 1), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2047 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2047_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2047
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2047 := by
  native_decide

/-- Coefficient term 2048 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2048 : Poly :=
[
  term ((-1408 : Rat) / 35) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2048 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2048 : Poly :=
[
  term ((-2816 : Rat) / 35) [(6, 1), (8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 35) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2048 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2048_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2048
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2048 := by
  native_decide

/-- Coefficient term 2049 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2049 : Poly :=
[
  term ((1144 : Rat) / 35) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 2049 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2049 : Poly :=
[
  term ((2288 : Rat) / 35) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1144 : Rat) / 35) [(6, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2049 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2049_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2049
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2049 := by
  native_decide

/-- Coefficient term 2050 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2050 : Poly :=
[
  term ((-4766816 : Rat) / 53375) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2050 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2050 : Poly :=
[
  term ((-9533632 : Rat) / 53375) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((4766816 : Rat) / 53375) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2050 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2050_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2050
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2050 := by
  native_decide

/-- Coefficient term 2051 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2051 : Poly :=
[
  term ((768 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2051 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2051 : Poly :=
[
  term ((1536 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-768 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2051 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2051_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2051
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2051 := by
  native_decide

/-- Coefficient term 2052 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2052 : Poly :=
[
  term ((-256 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2052 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2052 : Poly :=
[
  term ((-512 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((256 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2052 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2052_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2052
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2052 := by
  native_decide

/-- Coefficient term 2053 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2053 : Poly :=
[
  term ((208 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2053 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2053 : Poly :=
[
  term ((416 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2053 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2053_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2053
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2053 := by
  native_decide

/-- Coefficient term 2054 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2054 : Poly :=
[
  term ((-12787 : Rat) / 210) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2054 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2054 : Poly :=
[
  term ((-12787 : Rat) / 105) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((12787 : Rat) / 210) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2054 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2054_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2054
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2054 := by
  native_decide

/-- Coefficient term 2055 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2055 : Poly :=
[
  term ((521 : Rat) / 70) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2055 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2055 : Poly :=
[
  term ((521 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-521 : Rat) / 70) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2055 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2055_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2055
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2055 := by
  native_decide

/-- Coefficient term 2056 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2056 : Poly :=
[
  term ((-1165556 : Rat) / 7625) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 2056 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2056 : Poly :=
[
  term ((-2331112 : Rat) / 7625) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((1165556 : Rat) / 7625) [(6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2056 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2056_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2056
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2056 := by
  native_decide

/-- Coefficient term 2057 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2057 : Poly :=
[
  term ((576 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2057 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2057 : Poly :=
[
  term ((1152 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2057 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2057_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2057
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2057 := by
  native_decide

/-- Coefficient term 2058 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2058 : Poly :=
[
  term ((192 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2058 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2058 : Poly :=
[
  term ((384 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2058 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2058_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2058
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2058 := by
  native_decide

/-- Coefficient term 2059 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2059 : Poly :=
[
  term ((-156 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2059 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2059 : Poly :=
[
  term ((-312 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((156 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2059 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2059_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2059
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2059 := by
  native_decide

/-- Coefficient term 2060 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2060 : Poly :=
[
  term ((-4106 : Rat) / 105) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 2060 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2060 : Poly :=
[
  term ((-8212 : Rat) / 105) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((4106 : Rat) / 105) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2060 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2060_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2060
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2060 := by
  native_decide

/-- Coefficient term 2061 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2061 : Poly :=
[
  term ((38 : Rat) / 7) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2061 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2061 : Poly :=
[
  term ((76 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-38 : Rat) / 7) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2061 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2061_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2061
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2061 := by
  native_decide

/-- Coefficient term 2062 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2062 : Poly :=
[
  term ((-310592 : Rat) / 2135) [(6, 1), (11, 1), (13, 3)]
]

/-- Partial product 2062 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2062 : Poly :=
[
  term ((-621184 : Rat) / 2135) [(6, 1), (8, 1), (11, 1), (13, 3)],
  term ((310592 : Rat) / 2135) [(6, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2062 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2062_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2062
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2062 := by
  native_decide

/-- Coefficient term 2063 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2063 : Poly :=
[
  term ((6144 : Rat) / 35) [(6, 1), (11, 1), (13, 3), (14, 1)]
]

/-- Partial product 2063 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2063 : Poly :=
[
  term ((12288 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (13, 3), (14, 1)],
  term ((-6144 : Rat) / 35) [(6, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2063 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2063_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2063
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2063 := by
  native_decide

/-- Coefficient term 2064 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2064 : Poly :=
[
  term ((-2048 : Rat) / 35) [(6, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 2064 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2064 : Poly :=
[
  term ((-4096 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((2048 : Rat) / 35) [(6, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2064 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2064_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2064
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2064 := by
  native_decide

/-- Coefficient term 2065 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2065 : Poly :=
[
  term ((1664 : Rat) / 35) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 2065 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2065 : Poly :=
[
  term ((3328 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1664 : Rat) / 35) [(6, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2065 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2065_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2065
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2065 := by
  native_decide

/-- Coefficient term 2066 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2066 : Poly :=
[
  term ((131 : Rat) / 4) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 2066 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2066 : Poly :=
[
  term ((131 : Rat) / 2) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-131 : Rat) / 4) [(6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2066 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2066_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2066
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2066 := by
  native_decide

/-- Coefficient term 2067 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2067 : Poly :=
[
  term ((-87 : Rat) / 20) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2067 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2067 : Poly :=
[
  term ((-87 : Rat) / 10) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((87 : Rat) / 20) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2067 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2067_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2067
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2067 := by
  native_decide

/-- Coefficient term 2068 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2068 : Poly :=
[
  term ((-587 : Rat) / 105) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 2068 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2068 : Poly :=
[
  term ((-1174 : Rat) / 105) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((587 : Rat) / 105) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2068 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2068_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2068
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2068 := by
  native_decide

/-- Coefficient term 2069 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2069 : Poly :=
[
  term ((29 : Rat) / 7) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2069 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2069 : Poly :=
[
  term ((58 : Rat) / 7) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-29 : Rat) / 7) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2069 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2069_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2069
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2069 := by
  native_decide

/-- Coefficient term 2070 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2070 : Poly :=
[
  term ((-24833408 : Rat) / 53375) [(6, 1), (11, 2), (13, 2)]
]

/-- Partial product 2070 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2070 : Poly :=
[
  term ((-49666816 : Rat) / 53375) [(6, 1), (8, 1), (11, 2), (13, 2)],
  term ((24833408 : Rat) / 53375) [(6, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2070 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2070_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2070
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2070 := by
  native_decide

/-- Coefficient term 2071 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2071 : Poly :=
[
  term ((19968 : Rat) / 35) [(6, 1), (11, 2), (13, 2), (14, 1)]
]

/-- Partial product 2071 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2071 : Poly :=
[
  term ((39936 : Rat) / 35) [(6, 1), (8, 1), (11, 2), (13, 2), (14, 1)],
  term ((-19968 : Rat) / 35) [(6, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2071 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2071_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2071
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2071 := by
  native_decide

/-- Coefficient term 2072 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2072 : Poly :=
[
  term ((-6656 : Rat) / 35) [(6, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2072 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2072 : Poly :=
[
  term ((-13312 : Rat) / 35) [(6, 1), (8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((6656 : Rat) / 35) [(6, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2072 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2072_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2072
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2072 := by
  native_decide

/-- Coefficient term 2073 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2073 : Poly :=
[
  term ((5408 : Rat) / 35) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

/-- Partial product 2073 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2073 : Poly :=
[
  term ((10816 : Rat) / 35) [(6, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-5408 : Rat) / 35) [(6, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2073 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2073_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2073
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2073 := by
  native_decide

/-- Coefficient term 2074 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2074 : Poly :=
[
  term ((-3 : Rat) / 5) [(6, 1), (12, 1)]
]

/-- Partial product 2074 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2074 : Poly :=
[
  term ((-6 : Rat) / 5) [(6, 1), (8, 1), (12, 1)],
  term ((3 : Rat) / 5) [(6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2074 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2074_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2074
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2074 := by
  native_decide

/-- Coefficient term 2075 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2075 : Poly :=
[
  term ((-13873 : Rat) / 105) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2075 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2075 : Poly :=
[
  term ((-27746 : Rat) / 105) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((13873 : Rat) / 105) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2075 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2075_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2075
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2075 := by
  native_decide

/-- Coefficient term 2076 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2076 : Poly :=
[
  term ((523 : Rat) / 35) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2076 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2076 : Poly :=
[
  term ((1046 : Rat) / 35) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-523 : Rat) / 35) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2076 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2076_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2076
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2076 := by
  native_decide

/-- Coefficient term 2077 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2077 : Poly :=
[
  term ((-11682256 : Rat) / 53375) [(6, 1), (12, 1), (13, 2)]
]

/-- Partial product 2077 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2077 : Poly :=
[
  term ((-23364512 : Rat) / 53375) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((11682256 : Rat) / 53375) [(6, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2077 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2077_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2077
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2077 := by
  native_decide

/-- Coefficient term 2078 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2078 : Poly :=
[
  term ((9216 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 2078 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2078 : Poly :=
[
  term ((18432 : Rat) / 35) [(6, 1), (8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-9216 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2078 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2078_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2078
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2078 := by
  native_decide

/-- Coefficient term 2079 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2079 : Poly :=
[
  term ((-3072 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2079 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2079 : Poly :=
[
  term ((-6144 : Rat) / 35) [(6, 1), (8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3072 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2079 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2079_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2079
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2079 := by
  native_decide

/-- Coefficient term 2080 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2080 : Poly :=
[
  term ((2496 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 2080 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2080 : Poly :=
[
  term ((4992 : Rat) / 35) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-2496 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2080 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2080_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2080
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2080 := by
  native_decide

/-- Coefficient term 2081 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2081 : Poly :=
[
  term ((-6 : Rat) / 5) [(6, 1), (12, 1), (14, 1)]
]

/-- Partial product 2081 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2081 : Poly :=
[
  term ((-12 : Rat) / 5) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((6 : Rat) / 5) [(6, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2081 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2081_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2081
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2081 := by
  native_decide

/-- Coefficient term 2082 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2082 : Poly :=
[
  term ((-3 : Rat) / 5) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 2082 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2082 : Poly :=
[
  term ((-6 : Rat) / 5) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((3 : Rat) / 5) [(6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2082 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2082_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2082
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2082 := by
  native_decide

/-- Coefficient term 2083 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2083 : Poly :=
[
  term ((144667 : Rat) / 4200) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 2083 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2083 : Poly :=
[
  term ((144667 : Rat) / 2100) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-144667 : Rat) / 4200) [(6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2083 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2083_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2083
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2083 := by
  native_decide

/-- Coefficient term 2084 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2084 : Poly :=
[
  term ((-989 : Rat) / 280) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2084 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2084 : Poly :=
[
  term ((-989 : Rat) / 140) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((989 : Rat) / 280) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2084 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2084_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2084
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2084 := by
  native_decide

/-- Coefficient term 2085 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2085 : Poly :=
[
  term ((-1165092 : Rat) / 53375) [(6, 1), (13, 2)]
]

/-- Partial product 2085 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2085 : Poly :=
[
  term ((-2330184 : Rat) / 53375) [(6, 1), (8, 1), (13, 2)],
  term ((1165092 : Rat) / 53375) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2085 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2085_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2085
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2085 := by
  native_decide

/-- Coefficient term 2086 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2086 : Poly :=
[
  term ((-1144 : Rat) / 35) [(6, 1), (13, 2), (14, 1)]
]

/-- Partial product 2086 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2086 : Poly :=
[
  term ((-2288 : Rat) / 35) [(6, 1), (8, 1), (13, 2), (14, 1)],
  term ((1144 : Rat) / 35) [(6, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2086 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2086_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2086
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2086 := by
  native_decide

/-- Coefficient term 2087 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2087 : Poly :=
[
  term ((2752 : Rat) / 35) [(6, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2087 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2087 : Poly :=
[
  term ((5504 : Rat) / 35) [(6, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2752 : Rat) / 35) [(6, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2087 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2087_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2087
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2087 := by
  native_decide

/-- Coefficient term 2088 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2088 : Poly :=
[
  term ((-2236 : Rat) / 35) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 2088 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2088 : Poly :=
[
  term ((-4472 : Rat) / 35) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((2236 : Rat) / 35) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2088 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2088_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2088
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2088 := by
  native_decide

/-- Coefficient term 2089 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2089 : Poly :=
[
  term ((3 : Rat) / 5) [(6, 1), (14, 1)]
]

/-- Partial product 2089 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2089 : Poly :=
[
  term ((6 : Rat) / 5) [(6, 1), (8, 1), (14, 1)],
  term ((-3 : Rat) / 5) [(6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2089 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2089_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2089
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2089 := by
  native_decide

/-- Coefficient term 2090 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2090 : Poly :=
[
  term ((3 : Rat) / 10) [(6, 1), (16, 1)]
]

/-- Partial product 2090 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2090 : Poly :=
[
  term ((3 : Rat) / 5) [(6, 1), (8, 1), (16, 1)],
  term ((-3 : Rat) / 10) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2090 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2090_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2090
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2090 := by
  native_decide

/-- Coefficient term 2091 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2091 : Poly :=
[
  term ((-2736 : Rat) / 7625) [(7, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 2091 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2091 : Poly :=
[
  term ((2736 : Rat) / 7625) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-5472 : Rat) / 7625) [(7, 1), (8, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2091 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2091_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2091
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2091 := by
  native_decide

/-- Coefficient term 2092 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2092 : Poly :=
[
  term ((29152 : Rat) / 105) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 2092 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2092 : Poly :=
[
  term ((-29152 : Rat) / 105) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((58304 : Rat) / 105) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2092 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2092_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2092
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2092 := by
  native_decide

/-- Coefficient term 2093 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2093 : Poly :=
[
  term ((-1184 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2093 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2093 : Poly :=
[
  term ((1184 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2368 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2093 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2093_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2093
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2093 := by
  native_decide

/-- Coefficient term 2094 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2094 : Poly :=
[
  term ((20951008 : Rat) / 53375) [(7, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 2094 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2094 : Poly :=
[
  term ((-20951008 : Rat) / 53375) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((41902016 : Rat) / 53375) [(7, 1), (8, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2094 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2094_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2094
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2094 := by
  native_decide

/-- Coefficient term 2095 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2095 : Poly :=
[
  term ((-16896 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 2095 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2095 : Poly :=
[
  term ((16896 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-33792 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2095 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2095_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2095
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2095 := by
  native_decide

/-- Coefficient term 2096 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2096 : Poly :=
[
  term ((5632 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2096 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2096 : Poly :=
[
  term ((-5632 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((11264 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2096 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2096_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2096
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2096 := by
  native_decide

/-- Coefficient term 2097 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2097 : Poly :=
[
  term ((-4576 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 2097 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2097 : Poly :=
[
  term ((4576 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-9152 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2097 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2097_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2097
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2097 := by
  native_decide

/-- Coefficient term 2098 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2098 : Poly :=
[
  term ((125408 : Rat) / 875) [(7, 1), (8, 1), (11, 2), (13, 1)]
]

/-- Partial product 2098 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2098 : Poly :=
[
  term ((-125408 : Rat) / 875) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((250816 : Rat) / 875) [(7, 1), (8, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2098 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2098_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2098
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2098 := by
  native_decide

/-- Coefficient term 2099 from coefficient polynomial 19. -/
def rs_R003_ueqv_R003YY_coefficient_19_2099 : Poly :=
[
  term ((-6144 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 2099 for generator 19. -/
def rs_R003_ueqv_R003YY_partial_19_2099 : Poly :=
[
  term ((6144 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((-12288 : Rat) / 35) [(7, 1), (8, 2), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2099 for generator 19. -/
theorem rs_R003_ueqv_R003YY_partial_19_2099_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_19_2099
        rs_R003_ueqv_R003YY_generator_19_2000_2099 =
      rs_R003_ueqv_R003YY_partial_19_2099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_19_2000_2099 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_19_2000,
  rs_R003_ueqv_R003YY_partial_19_2001,
  rs_R003_ueqv_R003YY_partial_19_2002,
  rs_R003_ueqv_R003YY_partial_19_2003,
  rs_R003_ueqv_R003YY_partial_19_2004,
  rs_R003_ueqv_R003YY_partial_19_2005,
  rs_R003_ueqv_R003YY_partial_19_2006,
  rs_R003_ueqv_R003YY_partial_19_2007,
  rs_R003_ueqv_R003YY_partial_19_2008,
  rs_R003_ueqv_R003YY_partial_19_2009,
  rs_R003_ueqv_R003YY_partial_19_2010,
  rs_R003_ueqv_R003YY_partial_19_2011,
  rs_R003_ueqv_R003YY_partial_19_2012,
  rs_R003_ueqv_R003YY_partial_19_2013,
  rs_R003_ueqv_R003YY_partial_19_2014,
  rs_R003_ueqv_R003YY_partial_19_2015,
  rs_R003_ueqv_R003YY_partial_19_2016,
  rs_R003_ueqv_R003YY_partial_19_2017,
  rs_R003_ueqv_R003YY_partial_19_2018,
  rs_R003_ueqv_R003YY_partial_19_2019,
  rs_R003_ueqv_R003YY_partial_19_2020,
  rs_R003_ueqv_R003YY_partial_19_2021,
  rs_R003_ueqv_R003YY_partial_19_2022,
  rs_R003_ueqv_R003YY_partial_19_2023,
  rs_R003_ueqv_R003YY_partial_19_2024,
  rs_R003_ueqv_R003YY_partial_19_2025,
  rs_R003_ueqv_R003YY_partial_19_2026,
  rs_R003_ueqv_R003YY_partial_19_2027,
  rs_R003_ueqv_R003YY_partial_19_2028,
  rs_R003_ueqv_R003YY_partial_19_2029,
  rs_R003_ueqv_R003YY_partial_19_2030,
  rs_R003_ueqv_R003YY_partial_19_2031,
  rs_R003_ueqv_R003YY_partial_19_2032,
  rs_R003_ueqv_R003YY_partial_19_2033,
  rs_R003_ueqv_R003YY_partial_19_2034,
  rs_R003_ueqv_R003YY_partial_19_2035,
  rs_R003_ueqv_R003YY_partial_19_2036,
  rs_R003_ueqv_R003YY_partial_19_2037,
  rs_R003_ueqv_R003YY_partial_19_2038,
  rs_R003_ueqv_R003YY_partial_19_2039,
  rs_R003_ueqv_R003YY_partial_19_2040,
  rs_R003_ueqv_R003YY_partial_19_2041,
  rs_R003_ueqv_R003YY_partial_19_2042,
  rs_R003_ueqv_R003YY_partial_19_2043,
  rs_R003_ueqv_R003YY_partial_19_2044,
  rs_R003_ueqv_R003YY_partial_19_2045,
  rs_R003_ueqv_R003YY_partial_19_2046,
  rs_R003_ueqv_R003YY_partial_19_2047,
  rs_R003_ueqv_R003YY_partial_19_2048,
  rs_R003_ueqv_R003YY_partial_19_2049,
  rs_R003_ueqv_R003YY_partial_19_2050,
  rs_R003_ueqv_R003YY_partial_19_2051,
  rs_R003_ueqv_R003YY_partial_19_2052,
  rs_R003_ueqv_R003YY_partial_19_2053,
  rs_R003_ueqv_R003YY_partial_19_2054,
  rs_R003_ueqv_R003YY_partial_19_2055,
  rs_R003_ueqv_R003YY_partial_19_2056,
  rs_R003_ueqv_R003YY_partial_19_2057,
  rs_R003_ueqv_R003YY_partial_19_2058,
  rs_R003_ueqv_R003YY_partial_19_2059,
  rs_R003_ueqv_R003YY_partial_19_2060,
  rs_R003_ueqv_R003YY_partial_19_2061,
  rs_R003_ueqv_R003YY_partial_19_2062,
  rs_R003_ueqv_R003YY_partial_19_2063,
  rs_R003_ueqv_R003YY_partial_19_2064,
  rs_R003_ueqv_R003YY_partial_19_2065,
  rs_R003_ueqv_R003YY_partial_19_2066,
  rs_R003_ueqv_R003YY_partial_19_2067,
  rs_R003_ueqv_R003YY_partial_19_2068,
  rs_R003_ueqv_R003YY_partial_19_2069,
  rs_R003_ueqv_R003YY_partial_19_2070,
  rs_R003_ueqv_R003YY_partial_19_2071,
  rs_R003_ueqv_R003YY_partial_19_2072,
  rs_R003_ueqv_R003YY_partial_19_2073,
  rs_R003_ueqv_R003YY_partial_19_2074,
  rs_R003_ueqv_R003YY_partial_19_2075,
  rs_R003_ueqv_R003YY_partial_19_2076,
  rs_R003_ueqv_R003YY_partial_19_2077,
  rs_R003_ueqv_R003YY_partial_19_2078,
  rs_R003_ueqv_R003YY_partial_19_2079,
  rs_R003_ueqv_R003YY_partial_19_2080,
  rs_R003_ueqv_R003YY_partial_19_2081,
  rs_R003_ueqv_R003YY_partial_19_2082,
  rs_R003_ueqv_R003YY_partial_19_2083,
  rs_R003_ueqv_R003YY_partial_19_2084,
  rs_R003_ueqv_R003YY_partial_19_2085,
  rs_R003_ueqv_R003YY_partial_19_2086,
  rs_R003_ueqv_R003YY_partial_19_2087,
  rs_R003_ueqv_R003YY_partial_19_2088,
  rs_R003_ueqv_R003YY_partial_19_2089,
  rs_R003_ueqv_R003YY_partial_19_2090,
  rs_R003_ueqv_R003YY_partial_19_2091,
  rs_R003_ueqv_R003YY_partial_19_2092,
  rs_R003_ueqv_R003YY_partial_19_2093,
  rs_R003_ueqv_R003YY_partial_19_2094,
  rs_R003_ueqv_R003YY_partial_19_2095,
  rs_R003_ueqv_R003YY_partial_19_2096,
  rs_R003_ueqv_R003YY_partial_19_2097,
  rs_R003_ueqv_R003YY_partial_19_2098,
  rs_R003_ueqv_R003YY_partial_19_2099
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_19_2000_2099 : Poly :=
[
  term ((12 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((81 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-9 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1232 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (11, 1)],
  term ((-51148 : Rat) / 105) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2084 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38134528 : Rat) / 53375) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2)],
  term ((6144 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2048 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1664 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((1386 : Rat) / 25) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-18 : Rat) / 5) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12643424 : Rat) / 53375) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((1536 : Rat) / 7) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((576 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-468 : Rat) / 35) [(6, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((16867 : Rat) / 700) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-79 : Rat) / 140) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 5) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-81 : Rat) / 10) [(6, 1), (7, 1), (10, 1), (15, 1)],
  term ((9 : Rat) / 10) [(6, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-616 : Rat) / 5) [(6, 1), (7, 1), (11, 1)],
  term ((25574 : Rat) / 105) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1042 : Rat) / 35) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((19067264 : Rat) / 53375) [(6, 1), (7, 1), (11, 1), (13, 2)],
  term ((-3072 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1)],
  term ((1024 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-832 : Rat) / 7) [(6, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((576 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-693 : Rat) / 25) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((9 : Rat) / 5) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((6321712 : Rat) / 53375) [(6, 1), (7, 1), (13, 1)],
  term ((-768 : Rat) / 7) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((234 : Rat) / 35) [(6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-16867 : Rat) / 1400) [(6, 1), (7, 1), (15, 1)],
  term ((79 : Rat) / 280) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((5472 : Rat) / 7625) [(6, 1), (8, 1), (9, 1), (10, 1), (13, 1)],
  term ((2010 : Rat) / 7) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1458 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((68887296 : Rat) / 53375) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-55296 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((18432 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-14976 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-250816 : Rat) / 875) [(6, 1), (8, 1), (9, 1), (11, 2), (13, 1)],
  term ((12288 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-4096 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((3328 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-18418 : Rat) / 105) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((758 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((16250832 : Rat) / 53375) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-13056 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((4352 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3536 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((6137 : Rat) / 350) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-137 : Rat) / 14) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((36127188 : Rat) / 53375) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-21688 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-704 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((516 : Rat) / 35) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((15223 : Rat) / 420) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((459 : Rat) / 140) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((14341 : Rat) / 105) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-479 : Rat) / 35) [(6, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10398896 : Rat) / 53375) [(6, 1), (8, 1), (10, 1), (13, 2)],
  term ((8448 : Rat) / 35) [(6, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-2816 : Rat) / 35) [(6, 1), (8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((2288 : Rat) / 35) [(6, 1), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-9533632 : Rat) / 53375) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((1536 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-512 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((416 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-12787 : Rat) / 105) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((521 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2331112 : Rat) / 7625) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((1152 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((384 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-312 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8212 : Rat) / 105) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((76 : Rat) / 7) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-621184 : Rat) / 2135) [(6, 1), (8, 1), (11, 1), (13, 3)],
  term ((12288 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (13, 3), (14, 1)],
  term ((-4096 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((3328 : Rat) / 35) [(6, 1), (8, 1), (11, 1), (13, 3), (16, 1)],
  term ((131 : Rat) / 2) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-87 : Rat) / 10) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1174 : Rat) / 105) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((58 : Rat) / 7) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-49666816 : Rat) / 53375) [(6, 1), (8, 1), (11, 2), (13, 2)],
  term ((39936 : Rat) / 35) [(6, 1), (8, 1), (11, 2), (13, 2), (14, 1)],
  term ((-13312 : Rat) / 35) [(6, 1), (8, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((10816 : Rat) / 35) [(6, 1), (8, 1), (11, 2), (13, 2), (16, 1)],
  term ((-6 : Rat) / 5) [(6, 1), (8, 1), (12, 1)],
  term ((-27746 : Rat) / 105) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((1046 : Rat) / 35) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-23364512 : Rat) / 53375) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((18432 : Rat) / 35) [(6, 1), (8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-6144 : Rat) / 35) [(6, 1), (8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((4992 : Rat) / 35) [(6, 1), (8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((-6 : Rat) / 5) [(6, 1), (8, 1), (12, 1), (16, 1)],
  term ((144667 : Rat) / 2100) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-989 : Rat) / 140) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2330184 : Rat) / 53375) [(6, 1), (8, 1), (13, 2)],
  term ((-2288 : Rat) / 35) [(6, 1), (8, 1), (13, 2), (14, 1)],
  term ((5504 : Rat) / 35) [(6, 1), (8, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4472 : Rat) / 35) [(6, 1), (8, 1), (13, 2), (16, 1)],
  term ((6 : Rat) / 5) [(6, 1), (8, 1), (14, 1)],
  term ((3 : Rat) / 5) [(6, 1), (8, 1), (16, 1)],
  term ((-2736 : Rat) / 7625) [(6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1005 : Rat) / 7) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((729 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34443648 : Rat) / 53375) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((27648 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-9216 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((7488 : Rat) / 35) [(6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((125408 : Rat) / 875) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((-6144 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((2048 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((9209 : Rat) / 105) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-379 : Rat) / 35) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-8125416 : Rat) / 53375) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((6528 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2176 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1768 : Rat) / 35) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6137 : Rat) / 700) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((137 : Rat) / 28) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18063594 : Rat) / 53375) [(6, 1), (9, 1), (13, 1)],
  term ((10844 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((352 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-258 : Rat) / 35) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-15223 : Rat) / 840) [(6, 1), (9, 1), (15, 1)],
  term ((-459 : Rat) / 280) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-14341 : Rat) / 210) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((479 : Rat) / 70) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5199448 : Rat) / 53375) [(6, 1), (10, 1), (13, 2)],
  term ((-4224 : Rat) / 35) [(6, 1), (10, 1), (13, 2), (14, 1)],
  term ((1408 : Rat) / 35) [(6, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1144 : Rat) / 35) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((4766816 : Rat) / 53375) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-768 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((256 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-208 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((12787 : Rat) / 210) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-521 : Rat) / 70) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1165556 : Rat) / 7625) [(6, 1), (11, 1), (13, 1)],
  term ((-576 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-192 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((156 : Rat) / 5) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((4106 : Rat) / 105) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-38 : Rat) / 7) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((310592 : Rat) / 2135) [(6, 1), (11, 1), (13, 3)],
  term ((-6144 : Rat) / 35) [(6, 1), (11, 1), (13, 3), (14, 1)],
  term ((2048 : Rat) / 35) [(6, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1664 : Rat) / 35) [(6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-131 : Rat) / 4) [(6, 1), (11, 1), (15, 1)],
  term ((87 : Rat) / 20) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((587 : Rat) / 105) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-29 : Rat) / 7) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((24833408 : Rat) / 53375) [(6, 1), (11, 2), (13, 2)],
  term ((-19968 : Rat) / 35) [(6, 1), (11, 2), (13, 2), (14, 1)],
  term ((6656 : Rat) / 35) [(6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-5408 : Rat) / 35) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((3 : Rat) / 5) [(6, 1), (12, 1)],
  term ((13873 : Rat) / 105) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-523 : Rat) / 35) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11682256 : Rat) / 53375) [(6, 1), (12, 1), (13, 2)],
  term ((-9216 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((3072 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2496 : Rat) / 35) [(6, 1), (12, 1), (13, 2), (16, 1)],
  term ((6 : Rat) / 5) [(6, 1), (12, 1), (14, 1)],
  term ((3 : Rat) / 5) [(6, 1), (12, 1), (16, 1)],
  term ((-144667 : Rat) / 4200) [(6, 1), (13, 1), (15, 1)],
  term ((989 : Rat) / 280) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1165092 : Rat) / 53375) [(6, 1), (13, 2)],
  term ((1144 : Rat) / 35) [(6, 1), (13, 2), (14, 1)],
  term ((-2752 : Rat) / 35) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((2236 : Rat) / 35) [(6, 1), (13, 2), (16, 1)],
  term ((-3 : Rat) / 5) [(6, 1), (14, 1)],
  term ((-3 : Rat) / 10) [(6, 1), (16, 1)],
  term ((2736 : Rat) / 7625) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-29152 : Rat) / 105) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((1184 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20951008 : Rat) / 53375) [(7, 1), (8, 1), (11, 1), (13, 2)],
  term ((16896 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((-5632 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((4576 : Rat) / 35) [(7, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-125408 : Rat) / 875) [(7, 1), (8, 1), (11, 2), (13, 1)],
  term ((6144 : Rat) / 35) [(7, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((-5472 : Rat) / 7625) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((58304 : Rat) / 105) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((-2368 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((41902016 : Rat) / 53375) [(7, 1), (8, 2), (11, 1), (13, 2)],
  term ((-33792 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 2), (14, 1)],
  term ((11264 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9152 : Rat) / 35) [(7, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((250816 : Rat) / 875) [(7, 1), (8, 2), (11, 2), (13, 1)],
  term ((-12288 : Rat) / 35) [(7, 1), (8, 2), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 2000 through 2099. -/
theorem rs_R003_ueqv_R003YY_block_19_2000_2099_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_19_2000_2099
      rs_R003_ueqv_R003YY_block_19_2000_2099 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
