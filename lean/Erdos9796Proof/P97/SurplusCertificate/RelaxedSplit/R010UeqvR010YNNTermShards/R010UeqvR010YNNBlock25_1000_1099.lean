/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1000-1099

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1000 : Poly :=
[
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1000 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1000 : Poly :=
[
  term ((14811927865666629632 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1000
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1001 : Poly :=
[
  term ((1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (16, 1)]
]

/-- Partial product 1001 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1001 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1001
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1002 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1002 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1002 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1002
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1003 : Poly :=
[
  term ((166603837426378240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1003 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1003 : Poly :=
[
  term ((-166603837426378240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1003
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1004 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1004 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1004 : Poly :=
[
  term ((2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1004
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1005 : Poly :=
[
  term ((-333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1005 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1005 : Poly :=
[
  term ((-666415349705512960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1005
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1006 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1006 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1006 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1006
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1007 : Poly :=
[
  term ((-83301918713189120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1007 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1007 : Poly :=
[
  term ((-166603837426378240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((83301918713189120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1007
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1008 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1008 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1008 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1008
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1009 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1009 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1009 : Poly :=
[
  term ((557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1009
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1010 : Poly :=
[
  term ((69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1010 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1010 : Poly :=
[
  term ((139253367632691200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1010
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1011 : Poly :=
[
  term ((290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1011 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1011 : Poly :=
[
  term ((-290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1011
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1012 : Poly :=
[
  term ((-580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1012 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1012 : Poly :=
[
  term ((-1160800562204581504 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1012
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1013 : Poly :=
[
  term ((-145100070275572688 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1013 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1013 : Poly :=
[
  term ((-290200140551145376 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((145100070275572688 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1013
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1014 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1014 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1014 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1014
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1015 : Poly :=
[
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1015 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1015 : Poly :=
[
  term ((-1531787043959603200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1015
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1016 : Poly :=
[
  term ((-191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1016 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1016 : Poly :=
[
  term ((-382946760989900800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1016
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1017 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1017 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1017 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1017
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1018 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1018 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1018 : Poly :=
[
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1018
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1019 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1019 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1019 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1019
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1020 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1020 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1020 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1020
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1021 : Poly :=
[
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1021 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1021 : Poly :=
[
  term ((4456107764246118400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1021
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1022 : Poly :=
[
  term ((557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1022 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1022 : Poly :=
[
  term ((1114026941061529600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1022
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1023 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1023 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1023 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1023
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1024 : Poly :=
[
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1024 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1024 : Poly :=
[
  term ((4362857639094471872 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1024
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1025 : Poly :=
[
  term ((545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1025 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1025 : Poly :=
[
  term ((1090714409773617968 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1025
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1026 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1026 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1026 : Poly :=
[
  term ((188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1026
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1027 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1027 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1027 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1027
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1028 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1028 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1028 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1028
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1029 : Poly :=
[
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1029 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1029 : Poly :=
[
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1029
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1030 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1030 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1030 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1030
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1031 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1031 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1031 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1031
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1032 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1032 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1032 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1032
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1033 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1033 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1033 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1033
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1034 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1034 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1034 : Poly :=
[
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1034
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1035 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1035 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1035 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1035
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1036 : Poly :=
[
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1036 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1036 : Poly :=
[
  term ((-262473904242278400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1036
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1037 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1037 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1037 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1037
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1038 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1038 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1038 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1038
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1039 : Poly :=
[
  term ((6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1039 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1039 : Poly :=
[
  term ((12632040155946803200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1039
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1040 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 1040 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1040 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1040
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1041 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1041 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1041 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1041
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1042 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1042 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1042 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1042
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1043 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1043 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1043 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1043
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1044 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1044 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1044 : Poly :=
[
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1044
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1045 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 1045 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1045 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1045
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1046 : Poly :=
[
  term ((867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1046 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1046 : Poly :=
[
  term ((-867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1046
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1047 : Poly :=
[
  term ((-1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1047 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1047 : Poly :=
[
  term ((-3471218487750451200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1047
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1048 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1048 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1048 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1048
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1049 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1049 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1049 : Poly :=
[
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1049
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1050 : Poly :=
[
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1050 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1050 : Poly :=
[
  term ((14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1050
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1051 : Poly :=
[
  term ((-446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1051 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1051 : Poly :=
[
  term ((446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1051
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1052 : Poly :=
[
  term ((28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1052 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1052 : Poly :=
[
  term ((57429116717129400320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1052
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1053 : Poly :=
[
  term ((893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1053 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1053 : Poly :=
[
  term ((1787885070942387200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1053
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1054 : Poly :=
[
  term ((7178639589641175040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1054 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1054 : Poly :=
[
  term ((14357279179282350080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1054
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1055 : Poly :=
[
  term ((223485633867798400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1055 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1055 : Poly :=
[
  term ((446971267735596800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-223485633867798400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1055
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1056 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1056 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1056 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1056
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1057 : Poly :=
[
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1057 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1057 : Poly :=
[
  term ((-225732769845452800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1057
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1058 : Poly :=
[
  term ((-28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1058 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1058 : Poly :=
[
  term ((-56433192461363200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1058
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1059 : Poly :=
[
  term ((-511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1059 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1059 : Poly :=
[
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1059
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1060 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1060 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1060 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1060
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1061 : Poly :=
[
  term ((1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1061 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1061 : Poly :=
[
  term ((2044980740434352270464 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1061
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1062 : Poly :=
[
  term ((3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1062 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1062 : Poly :=
[
  term ((6947622085770741760 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1062
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1063 : Poly :=
[
  term ((255622592554294033808 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1063 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1063 : Poly :=
[
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-255622592554294033808 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1063
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1064 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1064 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1064 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1064
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1065 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1065 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1065 : Poly :=
[
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1065
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1066 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1066 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1066 : Poly :=
[
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1066
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1067 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1067 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1067 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1067
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1068 : Poly :=
[
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1068 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1068 : Poly :=
[
  term ((853079985039851520 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1068
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1069 : Poly :=
[
  term ((106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1069 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1069 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1069
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1070 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1070 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1070 : Poly :=
[
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1070
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1071 : Poly :=
[
  term ((6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1071 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1071 : Poly :=
[
  term ((13794878664998502400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1071
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1072 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1072 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1072 : Poly :=
[
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1072_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1072
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1073 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1073 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1073 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1073_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1073
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1074 : Poly :=
[
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1074 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1074 : Poly :=
[
  term ((284618036357365760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1074_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1074
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1075 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 1075 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1075 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1075_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1075
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1076 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1076 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1076 : Poly :=
[
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1076_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1076
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1077 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1077 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1077 : Poly :=
[
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1077_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1077
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1078 : Poly :=
[
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1078 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1078 : Poly :=
[
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1078_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1078
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1079 : Poly :=
[
  term ((1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1079 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1079 : Poly :=
[
  term ((3827731223081229055328 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1079_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1079
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1080 : Poly :=
[
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1080 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1080 : Poly :=
[
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1080_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1080
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1081 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1081 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1081 : Poly :=
[
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1081_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1081
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1082 : Poly :=
[
  term ((1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1082 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1082 : Poly :=
[
  term ((3935210171690233092032 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1082_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1082
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1083 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1083 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1083 : Poly :=
[
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1083_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1083
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1084 : Poly :=
[
  term ((-5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1084 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1084 : Poly :=
[
  term ((5870580103587404800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1084_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1084
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1085 : Poly :=
[
  term ((11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1085 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1085 : Poly :=
[
  term ((23482320414349619200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1085_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1085
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1086 : Poly :=
[
  term ((16251516598643200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1086 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1086 : Poly :=
[
  term ((32503033197286400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-16251516598643200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1086_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1086
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1087 : Poly :=
[
  term ((106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1087 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1087 : Poly :=
[
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1087_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1087
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1088 : Poly :=
[
  term ((-212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1088 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1088 : Poly :=
[
  term ((-424919110036195934240 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1088_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1088
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1089 : Poly :=
[
  term ((-55838672413150521220 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1089 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1089 : Poly :=
[
  term ((-111677344826301042440 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((55838672413150521220 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1089_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1089
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1090 : Poly :=
[
  term ((11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1090 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1090 : Poly :=
[
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1090_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1090
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1091 : Poly :=
[
  term ((-301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1091 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1091 : Poly :=
[
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1091_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1091
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1092 : Poly :=
[
  term ((-22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1092 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1092 : Poly :=
[
  term ((-44308621434595947520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1092_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1092
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1093 : Poly :=
[
  term ((602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1093 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1093 : Poly :=
[
  term ((1205891218000388737376 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1093_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1093
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1094 : Poly :=
[
  term ((-5538577679324493440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1094 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1094 : Poly :=
[
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5538577679324493440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1094_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1094
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1095 : Poly :=
[
  term ((150736402250048592172 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1095 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1095 : Poly :=
[
  term ((301472804500097184344 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-150736402250048592172 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1095_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1095
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1096 : Poly :=
[
  term ((-738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1096 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1096 : Poly :=
[
  term ((738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1096_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1096
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1097 : Poly :=
[
  term ((1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1097 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1097 : Poly :=
[
  term ((2955300994754554880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1097_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1097
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1098 : Poly :=
[
  term ((369412624344319360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1098 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1098 : Poly :=
[
  term ((738825248688638720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-369412624344319360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1098_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1098
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1099 : Poly :=
[
  term ((-241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 1), (16, 1)]
]

/-- Partial product 1099 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1099 : Poly :=
[
  term ((241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1099_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1099
        rs_R010_ueqv_R010YNN_generator_25_1000_1099 =
      rs_R010_ueqv_R010YNN_partial_25_1099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1000_1099 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1000,
  rs_R010_ueqv_R010YNN_partial_25_1001,
  rs_R010_ueqv_R010YNN_partial_25_1002,
  rs_R010_ueqv_R010YNN_partial_25_1003,
  rs_R010_ueqv_R010YNN_partial_25_1004,
  rs_R010_ueqv_R010YNN_partial_25_1005,
  rs_R010_ueqv_R010YNN_partial_25_1006,
  rs_R010_ueqv_R010YNN_partial_25_1007,
  rs_R010_ueqv_R010YNN_partial_25_1008,
  rs_R010_ueqv_R010YNN_partial_25_1009,
  rs_R010_ueqv_R010YNN_partial_25_1010,
  rs_R010_ueqv_R010YNN_partial_25_1011,
  rs_R010_ueqv_R010YNN_partial_25_1012,
  rs_R010_ueqv_R010YNN_partial_25_1013,
  rs_R010_ueqv_R010YNN_partial_25_1014,
  rs_R010_ueqv_R010YNN_partial_25_1015,
  rs_R010_ueqv_R010YNN_partial_25_1016,
  rs_R010_ueqv_R010YNN_partial_25_1017,
  rs_R010_ueqv_R010YNN_partial_25_1018,
  rs_R010_ueqv_R010YNN_partial_25_1019,
  rs_R010_ueqv_R010YNN_partial_25_1020,
  rs_R010_ueqv_R010YNN_partial_25_1021,
  rs_R010_ueqv_R010YNN_partial_25_1022,
  rs_R010_ueqv_R010YNN_partial_25_1023,
  rs_R010_ueqv_R010YNN_partial_25_1024,
  rs_R010_ueqv_R010YNN_partial_25_1025,
  rs_R010_ueqv_R010YNN_partial_25_1026,
  rs_R010_ueqv_R010YNN_partial_25_1027,
  rs_R010_ueqv_R010YNN_partial_25_1028,
  rs_R010_ueqv_R010YNN_partial_25_1029,
  rs_R010_ueqv_R010YNN_partial_25_1030,
  rs_R010_ueqv_R010YNN_partial_25_1031,
  rs_R010_ueqv_R010YNN_partial_25_1032,
  rs_R010_ueqv_R010YNN_partial_25_1033,
  rs_R010_ueqv_R010YNN_partial_25_1034,
  rs_R010_ueqv_R010YNN_partial_25_1035,
  rs_R010_ueqv_R010YNN_partial_25_1036,
  rs_R010_ueqv_R010YNN_partial_25_1037,
  rs_R010_ueqv_R010YNN_partial_25_1038,
  rs_R010_ueqv_R010YNN_partial_25_1039,
  rs_R010_ueqv_R010YNN_partial_25_1040,
  rs_R010_ueqv_R010YNN_partial_25_1041,
  rs_R010_ueqv_R010YNN_partial_25_1042,
  rs_R010_ueqv_R010YNN_partial_25_1043,
  rs_R010_ueqv_R010YNN_partial_25_1044,
  rs_R010_ueqv_R010YNN_partial_25_1045,
  rs_R010_ueqv_R010YNN_partial_25_1046,
  rs_R010_ueqv_R010YNN_partial_25_1047,
  rs_R010_ueqv_R010YNN_partial_25_1048,
  rs_R010_ueqv_R010YNN_partial_25_1049,
  rs_R010_ueqv_R010YNN_partial_25_1050,
  rs_R010_ueqv_R010YNN_partial_25_1051,
  rs_R010_ueqv_R010YNN_partial_25_1052,
  rs_R010_ueqv_R010YNN_partial_25_1053,
  rs_R010_ueqv_R010YNN_partial_25_1054,
  rs_R010_ueqv_R010YNN_partial_25_1055,
  rs_R010_ueqv_R010YNN_partial_25_1056,
  rs_R010_ueqv_R010YNN_partial_25_1057,
  rs_R010_ueqv_R010YNN_partial_25_1058,
  rs_R010_ueqv_R010YNN_partial_25_1059,
  rs_R010_ueqv_R010YNN_partial_25_1060,
  rs_R010_ueqv_R010YNN_partial_25_1061,
  rs_R010_ueqv_R010YNN_partial_25_1062,
  rs_R010_ueqv_R010YNN_partial_25_1063,
  rs_R010_ueqv_R010YNN_partial_25_1064,
  rs_R010_ueqv_R010YNN_partial_25_1065,
  rs_R010_ueqv_R010YNN_partial_25_1066,
  rs_R010_ueqv_R010YNN_partial_25_1067,
  rs_R010_ueqv_R010YNN_partial_25_1068,
  rs_R010_ueqv_R010YNN_partial_25_1069,
  rs_R010_ueqv_R010YNN_partial_25_1070,
  rs_R010_ueqv_R010YNN_partial_25_1071,
  rs_R010_ueqv_R010YNN_partial_25_1072,
  rs_R010_ueqv_R010YNN_partial_25_1073,
  rs_R010_ueqv_R010YNN_partial_25_1074,
  rs_R010_ueqv_R010YNN_partial_25_1075,
  rs_R010_ueqv_R010YNN_partial_25_1076,
  rs_R010_ueqv_R010YNN_partial_25_1077,
  rs_R010_ueqv_R010YNN_partial_25_1078,
  rs_R010_ueqv_R010YNN_partial_25_1079,
  rs_R010_ueqv_R010YNN_partial_25_1080,
  rs_R010_ueqv_R010YNN_partial_25_1081,
  rs_R010_ueqv_R010YNN_partial_25_1082,
  rs_R010_ueqv_R010YNN_partial_25_1083,
  rs_R010_ueqv_R010YNN_partial_25_1084,
  rs_R010_ueqv_R010YNN_partial_25_1085,
  rs_R010_ueqv_R010YNN_partial_25_1086,
  rs_R010_ueqv_R010YNN_partial_25_1087,
  rs_R010_ueqv_R010YNN_partial_25_1088,
  rs_R010_ueqv_R010YNN_partial_25_1089,
  rs_R010_ueqv_R010YNN_partial_25_1090,
  rs_R010_ueqv_R010YNN_partial_25_1091,
  rs_R010_ueqv_R010YNN_partial_25_1092,
  rs_R010_ueqv_R010YNN_partial_25_1093,
  rs_R010_ueqv_R010YNN_partial_25_1094,
  rs_R010_ueqv_R010YNN_partial_25_1095,
  rs_R010_ueqv_R010YNN_partial_25_1096,
  rs_R010_ueqv_R010YNN_partial_25_1097,
  rs_R010_ueqv_R010YNN_partial_25_1098,
  rs_R010_ueqv_R010YNN_partial_25_1099
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1000_1099 : Poly :=
[
  term ((14811927865666629632 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (12, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (14, 1), (16, 1)],
  term ((-1851490983208328704 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (16, 1)],
  term ((2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-666415349705512960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((83301918713189120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1160800562204581504 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((145100070275572688 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1531787043959603200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((4456107764246118400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((4362857639094471872 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-545357204886808984 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-262473904242278400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((12632040155946803200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 3), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (14, 1), (16, 1)],
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (15, 2), (16, 1)],
  term ((-3471218487750451200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((57429116717129400320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1787885070942387200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7178639589641175040 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-223485633867798400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-225732769845452800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2044980740434352270464 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6947622085770741760 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-255622592554294033808 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((853079985039851520 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((13794878664998502400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((284618036357365760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (12, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((3827731223081229055328 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3935210171690233092032 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((23482320414349619200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6163107402362982400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-11741160207174809600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16251516598643200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-424919110036195934240 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-217907122335350026000 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((212459555018097967120 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((55838672413150521220 : Rat) / 161694794837117853) [(3, 1), (5, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-44308621434595947520 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1205891218000388737376 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-602945609000194368688 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((5538577679324493440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-150736402250048592172 : Rat) / 1347456623642648775) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((2955300994754554880 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-369412624344319360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 1), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1000 through 1099. -/
theorem rs_R010_ueqv_R010YNN_block_25_1000_1099_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1000_1099
      rs_R010_ueqv_R010YNN_block_25_1000_1099 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
