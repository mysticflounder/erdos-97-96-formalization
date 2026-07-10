/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 19:0-56

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_19_0000_0056 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0000 : Poly :=
[
  term ((869328376304729440 : Rat) / 53898264945705951) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0000 : Poly :=
[
  term ((1738656752609458880 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((1738656752609458880 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (5, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0000
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0001 : Poly :=
[
  term ((-3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0001 : Poly :=
[
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 3), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0001
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0002 : Poly :=
[
  term ((-34376386853238775484 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 2 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0002 : Poly :=
[
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (9, 2), (16, 1)],
  term ((34376386853238775484 : Rat) / 1347456623642648775) [(4, 1), (5, 3), (9, 1), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((34376386853238775484 : Rat) / 1347456623642648775) [(4, 3), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0002
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0003 : Poly :=
[
  term ((428904071590400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0003 : Poly :=
[
  term ((857808143180800 : Rat) / 5988696105078439) [(4, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-428904071590400 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((857808143180800 : Rat) / 5988696105078439) [(4, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-428904071590400 : Rat) / 5988696105078439) [(4, 3), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0003
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0004 : Poly :=
[
  term ((-8894313636167680 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 4 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0004 : Poly :=
[
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 4), (16, 1)],
  term ((8894313636167680 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 3), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((8894313636167680 : Rat) / 53898264945705951) [(4, 3), (5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0004
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0005 : Poly :=
[
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0005 : Poly :=
[
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 1), (5, 3), (11, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0005
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0006 : Poly :=
[
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0006 : Poly :=
[
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 4), (9, 1), (11, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(4, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 3), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0006
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0007 : Poly :=
[
  term ((-1441943231619625856 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 7 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0007 : Poly :=
[
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 3), (16, 1)],
  term ((1441943231619625856 : Rat) / 89830441576176585) [(4, 1), (5, 4), (9, 2), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((1441943231619625856 : Rat) / 89830441576176585) [(4, 3), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0007
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0008 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 8 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0008 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 3), (7, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0008
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0009 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 9 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0009 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(4, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 3), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0009
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0010 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0010 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 3), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0010
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0011 : Poly :=
[
  term ((-1117217814872729524 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 11 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0011 : Poly :=
[
  term ((-2234435629745459048 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((1117217814872729524 : Rat) / 53898264945705951) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((-2234435629745459048 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((1117217814872729524 : Rat) / 53898264945705951) [(5, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0011
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0012 : Poly :=
[
  term ((-67398833692288000 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 12 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0012 : Poly :=
[
  term ((-134797667384576000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 2), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-134797667384576000 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0012
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0013 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0013 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0013
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0014 : Poly :=
[
  term ((41841876639207876904 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0014 : Poly :=
[
  term ((83683753278415753808 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-41841876639207876904 : Rat) / 4042369870927946325) [(4, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((83683753278415753808 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-41841876639207876904 : Rat) / 4042369870927946325) [(5, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0014
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0015 : Poly :=
[
  term ((153889062020556800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 15 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0015 : Poly :=
[
  term ((307778124041113600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((307778124041113600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0015
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0016 : Poly :=
[
  term ((-62613299096857600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 16 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0016 : Poly :=
[
  term ((-125226598193715200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((62613299096857600 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-125226598193715200 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((62613299096857600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0016
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0017 : Poly :=
[
  term ((6782140458419200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 17 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0017 : Poly :=
[
  term ((13564280916838400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6782140458419200 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((13564280916838400 : Rat) / 5988696105078439) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-6782140458419200 : Rat) / 5988696105078439) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0017
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0018 : Poly :=
[
  term ((-65044124203878400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0018 : Poly :=
[
  term ((-130088248407756800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((65044124203878400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-130088248407756800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((65044124203878400 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0018
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0019 : Poly :=
[
  term ((36898230534054400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 19 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0019 : Poly :=
[
  term ((73796461068108800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((73796461068108800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0019
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0020 : Poly :=
[
  term ((-114573267924994104904 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 20 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0020 : Poly :=
[
  term ((-229146535849988209808 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((114573267924994104904 : Rat) / 4042369870927946325) [(4, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-229146535849988209808 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (14, 1), (16, 1)],
  term ((114573267924994104904 : Rat) / 4042369870927946325) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0020
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0021 : Poly :=
[
  term ((8480022969964144636 : Rat) / 808473974185589265) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 21 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0021 : Poly :=
[
  term ((16960045939928289272 : Rat) / 808473974185589265) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-8480022969964144636 : Rat) / 808473974185589265) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((16960045939928289272 : Rat) / 808473974185589265) [(5, 2), (9, 2), (16, 1)],
  term ((-8480022969964144636 : Rat) / 808473974185589265) [(5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0021
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0022 : Poly :=
[
  term ((-508414149220311040 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0022 : Poly :=
[
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0022
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0023 : Poly :=
[
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 23 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0023 : Poly :=
[
  term ((134797667384576000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((134797667384576000 : Rat) / 53898264945705951) [(5, 2), (9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(5, 3), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0023
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0024 : Poly :=
[
  term ((-12959870438538240 : Rat) / 5988696105078439) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0024 : Poly :=
[
  term ((-25919740877076480 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((12959870438538240 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-25919740877076480 : Rat) / 5988696105078439) [(5, 2), (9, 3), (11, 1), (16, 1)],
  term ((12959870438538240 : Rat) / 5988696105078439) [(5, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0024
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0025 : Poly :=
[
  term ((-70366179940618240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 25 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0025 : Poly :=
[
  term ((-140732359881236480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((70366179940618240 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-140732359881236480 : Rat) / 53898264945705951) [(5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((70366179940618240 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0025
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0026 : Poly :=
[
  term ((149841809771530240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 26 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0026 : Poly :=
[
  term ((299683619543060480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-149841809771530240 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((299683619543060480 : Rat) / 53898264945705951) [(5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-149841809771530240 : Rat) / 53898264945705951) [(5, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0026
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0027 : Poly :=
[
  term ((-116452025702010880 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0027 : Poly :=
[
  term ((-232904051404021760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((116452025702010880 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-232904051404021760 : Rat) / 53898264945705951) [(5, 2), (9, 3), (15, 1), (16, 1)],
  term ((116452025702010880 : Rat) / 53898264945705951) [(5, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0027
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0028 : Poly :=
[
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 28 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0028 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (9, 4), (14, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 3), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0028
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0029 : Poly :=
[
  term ((7101007735377920 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 29 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0029 : Poly :=
[
  term ((14202015470755840 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-7101007735377920 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)],
  term ((14202015470755840 : Rat) / 53898264945705951) [(5, 2), (9, 4), (16, 1)],
  term ((-7101007735377920 : Rat) / 53898264945705951) [(5, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0029
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0030 : Poly :=
[
  term ((47333474265887365388 : Rat) / 808473974185589265) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 30 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0030 : Poly :=
[
  term ((94666948531774730776 : Rat) / 808473974185589265) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-47333474265887365388 : Rat) / 808473974185589265) [(4, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((94666948531774730776 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-47333474265887365388 : Rat) / 808473974185589265) [(5, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0030
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0031 : Poly :=
[
  term ((-251186425872304749068 : Rat) / 1347456623642648775) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 31 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0031 : Poly :=
[
  term ((-502372851744609498136 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((251186425872304749068 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-502372851744609498136 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((251186425872304749068 : Rat) / 1347456623642648775) [(5, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0031
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0032 : Poly :=
[
  term ((16874367719711429382 : Rat) / 149717402626960975) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0032 : Poly :=
[
  term ((33748735439422858764 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-16874367719711429382 : Rat) / 149717402626960975) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((33748735439422858764 : Rat) / 149717402626960975) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-16874367719711429382 : Rat) / 149717402626960975) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0032
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0033 : Poly :=
[
  term ((2678648510683996612 : Rat) / 449152207880882925) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 33 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0033 : Poly :=
[
  term ((5357297021367993224 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(5, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0033
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0034 : Poly :=
[
  term ((19952570973108454444 : Rat) / 449152207880882925) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 34 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0034 : Poly :=
[
  term ((39905141946216908888 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-19952570973108454444 : Rat) / 449152207880882925) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((39905141946216908888 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-19952570973108454444 : Rat) / 449152207880882925) [(5, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0034
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0035 : Poly :=
[
  term ((-90977098757010774674 : Rat) / 1347456623642648775) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0035 : Poly :=
[
  term ((-181954197514021549348 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((90977098757010774674 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-181954197514021549348 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((90977098757010774674 : Rat) / 1347456623642648775) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0035
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0036 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 36 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0036 : Poly :=
[
  term ((-352666601287573760 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-352666601287573760 : Rat) / 17966088315235317) [(5, 3), (7, 1), (9, 2), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 4), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0036
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0037 : Poly :=
[
  term ((64380704189404928 : Rat) / 1967089961522115) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 37 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0037 : Poly :=
[
  term ((128761408378809856 : Rat) / 1967089961522115) [(4, 1), (5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-64380704189404928 : Rat) / 1967089961522115) [(4, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((128761408378809856 : Rat) / 1967089961522115) [(5, 3), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-64380704189404928 : Rat) / 1967089961522115) [(5, 4), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0037
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0038 : Poly :=
[
  term ((-8894313636167680 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 38 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0038 : Poly :=
[
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 2), (9, 2), (16, 1)],
  term ((8894313636167680 : Rat) / 53898264945705951) [(4, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 3), (16, 1)],
  term ((8894313636167680 : Rat) / 53898264945705951) [(5, 4), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0038
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0039 : Poly :=
[
  term ((-34376386853238775484 : Rat) / 1347456623642648775) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 39 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0039 : Poly :=
[
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 2), (16, 1)],
  term ((34376386853238775484 : Rat) / 1347456623642648775) [(4, 2), (5, 2), (8, 1), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(5, 3), (8, 1), (9, 1), (16, 1)],
  term ((34376386853238775484 : Rat) / 1347456623642648775) [(5, 4), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0039
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0040 : Poly :=
[
  term ((-2811998585126945408 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0040 : Poly :=
[
  term ((-5623997170253890816 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2811998585126945408 : Rat) / 53898264945705951) [(4, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-5623997170253890816 : Rat) / 53898264945705951) [(5, 3), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((2811998585126945408 : Rat) / 53898264945705951) [(5, 4), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0040
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0041 : Poly :=
[
  term ((-9506286394053662336 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 41 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0041 : Poly :=
[
  term ((-19012572788107324672 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((9506286394053662336 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-19012572788107324672 : Rat) / 269491324728529755) [(5, 3), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((9506286394053662336 : Rat) / 269491324728529755) [(5, 4), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0041
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0042 : Poly :=
[
  term ((-2646020671482591424 : Rat) / 269491324728529755) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 42 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0042 : Poly :=
[
  term ((-5292041342965182848 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((2646020671482591424 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-5292041342965182848 : Rat) / 269491324728529755) [(5, 3), (9, 2), (11, 1), (16, 1)],
  term ((2646020671482591424 : Rat) / 269491324728529755) [(5, 4), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0042
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0043 : Poly :=
[
  term ((648590829096955008 : Rat) / 29943480525392195) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 43 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0043 : Poly :=
[
  term ((1297181658193910016 : Rat) / 29943480525392195) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(4, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1297181658193910016 : Rat) / 29943480525392195) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(5, 4), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0043
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0044 : Poly :=
[
  term ((-5860076860834193536 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 44 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0044 : Poly :=
[
  term ((-11720153721668387072 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((5860076860834193536 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-11720153721668387072 : Rat) / 269491324728529755) [(5, 3), (9, 2), (13, 1), (16, 1)],
  term ((5860076860834193536 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0044
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0045 : Poly :=
[
  term ((10599574244212703552 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0045 : Poly :=
[
  term ((21199148488425407104 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-10599574244212703552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((21199148488425407104 : Rat) / 269491324728529755) [(5, 3), (9, 2), (15, 1), (16, 1)],
  term ((-10599574244212703552 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0045
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0046 : Poly :=
[
  term ((59805936602460160 : Rat) / 5988696105078439) [(5, 2), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 46 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0046 : Poly :=
[
  term ((119611873204920320 : Rat) / 5988696105078439) [(4, 1), (5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(4, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((119611873204920320 : Rat) / 5988696105078439) [(5, 3), (9, 3), (10, 1), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(5, 4), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0046
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0047 : Poly :=
[
  term ((-8800855790726907136 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 47 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0047 : Poly :=
[
  term ((-17601711581453814272 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((8800855790726907136 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-17601711581453814272 : Rat) / 269491324728529755) [(5, 3), (9, 3), (14, 1), (16, 1)],
  term ((8800855790726907136 : Rat) / 269491324728529755) [(5, 4), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0047
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0048 : Poly :=
[
  term ((803905600645217408 : Rat) / 17966088315235317) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 48 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0048 : Poly :=
[
  term ((1607811201290434816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-803905600645217408 : Rat) / 17966088315235317) [(4, 2), (5, 2), (9, 2), (16, 1)],
  term ((1607811201290434816 : Rat) / 17966088315235317) [(5, 3), (9, 3), (16, 1)],
  term ((-803905600645217408 : Rat) / 17966088315235317) [(5, 4), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0048
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0049 : Poly :=
[
  term ((151768993035843089216 : Rat) / 1347456623642648775) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 49 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0049 : Poly :=
[
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(4, 2), (5, 2), (10, 1), (16, 1)],
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(5, 3), (9, 1), (10, 1), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(5, 4), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0049
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0050 : Poly :=
[
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 50 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0050 : Poly :=
[
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 2), (5, 2), (14, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(5, 3), (9, 1), (14, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0050
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0051 : Poly :=
[
  term ((107949311728127469098 : Rat) / 1347456623642648775) [(5, 2), (16, 1)]
]

/-- Partial product 51 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0051 : Poly :=
[
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((-107949311728127469098 : Rat) / 1347456623642648775) [(4, 2), (5, 2), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 3), (9, 1), (16, 1)],
  term ((-107949311728127469098 : Rat) / 1347456623642648775) [(5, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0051
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0052 : Poly :=
[
  term ((-1441943231619625856 : Rat) / 89830441576176585) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 52 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0052 : Poly :=
[
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 3), (8, 2), (9, 1), (16, 1)],
  term ((1441943231619625856 : Rat) / 89830441576176585) [(4, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(5, 4), (8, 1), (9, 2), (16, 1)],
  term ((1441943231619625856 : Rat) / 89830441576176585) [(5, 5), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0052
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0053 : Poly :=
[
  term ((21544338488377272832 : Rat) / 269491324728529755) [(5, 3), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 53 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0053 : Poly :=
[
  term ((43088676976754545664 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(4, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((43088676976754545664 : Rat) / 269491324728529755) [(5, 4), (9, 2), (10, 1), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(5, 5), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0053
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0054 : Poly :=
[
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 54 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0054 : Poly :=
[
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(5, 4), (9, 2), (14, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 5), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0054
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0055 : Poly :=
[
  term ((4050643928527080896 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 55 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0055 : Poly :=
[
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-4050643928527080896 : Rat) / 269491324728529755) [(4, 2), (5, 3), (9, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 4), (9, 2), (16, 1)],
  term ((-4050643928527080896 : Rat) / 269491324728529755) [(5, 5), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0055
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YNN_coefficient_19_0056 : Poly :=
[
  term (1 : Rat) [(16, 1)]
]

/-- Partial product 56 for generator 19. -/
def rs_R010_ueqv_R010YNN_partial_19_0056 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (16, 1)],
  term (2 : Rat) [(5, 1), (9, 1), (16, 1)],
  term (-1 : Rat) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 19. -/
theorem rs_R010_ueqv_R010YNN_partial_19_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_19_0056
        rs_R010_ueqv_R010YNN_generator_19_0000_0056 =
      rs_R010_ueqv_R010YNN_partial_19_0056 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_19_0000_0056 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_19_0000,
  rs_R010_ueqv_R010YNN_partial_19_0001,
  rs_R010_ueqv_R010YNN_partial_19_0002,
  rs_R010_ueqv_R010YNN_partial_19_0003,
  rs_R010_ueqv_R010YNN_partial_19_0004,
  rs_R010_ueqv_R010YNN_partial_19_0005,
  rs_R010_ueqv_R010YNN_partial_19_0006,
  rs_R010_ueqv_R010YNN_partial_19_0007,
  rs_R010_ueqv_R010YNN_partial_19_0008,
  rs_R010_ueqv_R010YNN_partial_19_0009,
  rs_R010_ueqv_R010YNN_partial_19_0010,
  rs_R010_ueqv_R010YNN_partial_19_0011,
  rs_R010_ueqv_R010YNN_partial_19_0012,
  rs_R010_ueqv_R010YNN_partial_19_0013,
  rs_R010_ueqv_R010YNN_partial_19_0014,
  rs_R010_ueqv_R010YNN_partial_19_0015,
  rs_R010_ueqv_R010YNN_partial_19_0016,
  rs_R010_ueqv_R010YNN_partial_19_0017,
  rs_R010_ueqv_R010YNN_partial_19_0018,
  rs_R010_ueqv_R010YNN_partial_19_0019,
  rs_R010_ueqv_R010YNN_partial_19_0020,
  rs_R010_ueqv_R010YNN_partial_19_0021,
  rs_R010_ueqv_R010YNN_partial_19_0022,
  rs_R010_ueqv_R010YNN_partial_19_0023,
  rs_R010_ueqv_R010YNN_partial_19_0024,
  rs_R010_ueqv_R010YNN_partial_19_0025,
  rs_R010_ueqv_R010YNN_partial_19_0026,
  rs_R010_ueqv_R010YNN_partial_19_0027,
  rs_R010_ueqv_R010YNN_partial_19_0028,
  rs_R010_ueqv_R010YNN_partial_19_0029,
  rs_R010_ueqv_R010YNN_partial_19_0030,
  rs_R010_ueqv_R010YNN_partial_19_0031,
  rs_R010_ueqv_R010YNN_partial_19_0032,
  rs_R010_ueqv_R010YNN_partial_19_0033,
  rs_R010_ueqv_R010YNN_partial_19_0034,
  rs_R010_ueqv_R010YNN_partial_19_0035,
  rs_R010_ueqv_R010YNN_partial_19_0036,
  rs_R010_ueqv_R010YNN_partial_19_0037,
  rs_R010_ueqv_R010YNN_partial_19_0038,
  rs_R010_ueqv_R010YNN_partial_19_0039,
  rs_R010_ueqv_R010YNN_partial_19_0040,
  rs_R010_ueqv_R010YNN_partial_19_0041,
  rs_R010_ueqv_R010YNN_partial_19_0042,
  rs_R010_ueqv_R010YNN_partial_19_0043,
  rs_R010_ueqv_R010YNN_partial_19_0044,
  rs_R010_ueqv_R010YNN_partial_19_0045,
  rs_R010_ueqv_R010YNN_partial_19_0046,
  rs_R010_ueqv_R010YNN_partial_19_0047,
  rs_R010_ueqv_R010YNN_partial_19_0048,
  rs_R010_ueqv_R010YNN_partial_19_0049,
  rs_R010_ueqv_R010YNN_partial_19_0050,
  rs_R010_ueqv_R010YNN_partial_19_0051,
  rs_R010_ueqv_R010YNN_partial_19_0052,
  rs_R010_ueqv_R010YNN_partial_19_0053,
  rs_R010_ueqv_R010YNN_partial_19_0054,
  rs_R010_ueqv_R010YNN_partial_19_0055,
  rs_R010_ueqv_R010YNN_partial_19_0056
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_19_0000_0056 : Poly :=
[
  term ((1738656752609458880 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (8, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (4, 2), (5, 1), (16, 1)],
  term ((1738656752609458880 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-869328376304729440 : Rat) / 53898264945705951) [(1, 1), (5, 3), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-2234435629745459048 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 2), (16, 1)],
  term ((307778124041113600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-125226598193715200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13564280916838400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-130088248407756800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((73796461068108800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-229146535849988209808 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((16960045939928289272 : Rat) / 808473974185589265) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((134797667384576000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-25919740877076480 : Rat) / 5988696105078439) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-140732359881236480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((299683619543060480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-232904051404021760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((14202015470755840 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((94666948531774730776 : Rat) / 808473974185589265) [(4, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-502372851744609498136 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((33748735439422858764 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((5357297021367993224 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((39905141946216908888 : Rat) / 449152207880882925) [(4, 1), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-181954197514021549348 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-134797667384576000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 1), (11, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 2), (9, 2), (11, 1), (16, 1)],
  term ((83683753278415753808 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (8, 2), (11, 1), (16, 1)],
  term ((-352666601287573760 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-5623997170253890816 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-19012572788107324672 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5292041342965182848 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1297181658193910016 : Rat) / 29943480525392195) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11720153721668387072 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((21199148488425407104 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((119611873204920320 : Rat) / 5988696105078439) [(4, 1), (5, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-17601711581453814272 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((1607811201290434816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (10, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (14, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (16, 1)],
  term ((128761408378809856 : Rat) / 1967089961522115) [(4, 1), (5, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 2), (9, 2), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 2), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (9, 2), (16, 1)],
  term ((857808143180800 : Rat) / 5988696105078439) [(4, 1), (5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 4), (16, 1)],
  term ((43088676976754545664 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 3), (8, 2), (9, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 3), (9, 1), (11, 2), (16, 1)],
  term ((34376386853238775484 : Rat) / 1347456623642648775) [(4, 1), (5, 3), (9, 1), (16, 1)],
  term ((-16221876397329891584 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 2), (11, 1), (16, 1)],
  term ((-8607187821536916736 : Rat) / 269491324728529755) [(4, 1), (5, 3), (9, 3), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 1), (5, 3), (11, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 1), (5, 4), (9, 1), (11, 1), (16, 1)],
  term ((1441943231619625856 : Rat) / 89830441576176585) [(4, 1), (5, 4), (9, 2), (16, 1)],
  term (2 : Rat) [(4, 1), (8, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(4, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((1117217814872729524 : Rat) / 53898264945705951) [(4, 2), (5, 1), (7, 1), (16, 1)],
  term ((6397627375820800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10068353983708160 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(4, 2), (5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-267446723475347501216 : Rat) / 808473974185589265) [(4, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((62613299096857600 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6782140458419200 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((65044124203878400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((114573267924994104904 : Rat) / 4042369870927946325) [(4, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8480022969964144636 : Rat) / 808473974185589265) [(4, 2), (5, 1), (9, 1), (16, 1)],
  term ((508414149220311040 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-67398833692288000 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((12959870438538240 : Rat) / 5988696105078439) [(4, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((70366179940618240 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-149841809771530240 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((116452025702010880 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-7101007735377920 : Rat) / 53898264945705951) [(4, 2), (5, 1), (9, 3), (16, 1)],
  term ((-47333474265887365388 : Rat) / 808473974185589265) [(4, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((251186425872304749068 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-16874367719711429382 : Rat) / 149717402626960975) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(4, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19952570973108454444 : Rat) / 449152207880882925) [(4, 2), (5, 1), (13, 1), (16, 1)],
  term ((90977098757010774674 : Rat) / 1347456623642648775) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-1668182145870453248 : Rat) / 17966088315235317) [(4, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-8607187821536916736 : Rat) / 269491324728529755) [(4, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((34376386853238775484 : Rat) / 1347456623642648775) [(4, 2), (5, 2), (8, 1), (16, 1)],
  term ((2811998585126945408 : Rat) / 53898264945705951) [(4, 2), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((9506286394053662336 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2646020671482591424 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(4, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((5860076860834193536 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-10599574244212703552 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-59805936602460160 : Rat) / 5988696105078439) [(4, 2), (5, 2), (9, 2), (10, 1), (16, 1)],
  term ((8800855790726907136 : Rat) / 269491324728529755) [(4, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-803905600645217408 : Rat) / 17966088315235317) [(4, 2), (5, 2), (9, 2), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(4, 2), (5, 2), (10, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 2), (5, 2), (14, 1), (16, 1)],
  term ((-107949311728127469098 : Rat) / 1347456623642648775) [(4, 2), (5, 2), (16, 1)],
  term ((1441943231619625856 : Rat) / 89830441576176585) [(4, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(4, 2), (5, 3), (9, 1), (10, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-4050643928527080896 : Rat) / 269491324728529755) [(4, 2), (5, 3), (9, 1), (16, 1)],
  term (-1 : Rat) [(4, 2), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 3), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((34376386853238775484 : Rat) / 1347456623642648775) [(4, 3), (5, 1), (9, 1), (16, 1)],
  term ((-428904071590400 : Rat) / 5988696105078439) [(4, 3), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((8894313636167680 : Rat) / 53898264945705951) [(4, 3), (5, 1), (9, 3), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(4, 3), (5, 1), (11, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(4, 3), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1441943231619625856 : Rat) / 89830441576176585) [(4, 3), (5, 2), (9, 2), (16, 1)],
  term (2 : Rat) [(5, 1), (9, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-2234435629745459048 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((83683753278415753808 : Rat) / 4042369870927946325) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-134797667384576000 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 3), (11, 1), (16, 1)],
  term ((94666948531774730776 : Rat) / 808473974185589265) [(5, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-502372851744609498136 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((33748735439422858764 : Rat) / 149717402626960975) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((5357297021367993224 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((39905141946216908888 : Rat) / 449152207880882925) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-181954197514021549348 : Rat) / 1347456623642648775) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((307778124041113600 : Rat) / 53898264945705951) [(5, 2), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((-125226598193715200 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13564280916838400 : Rat) / 5988696105078439) [(5, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-130088248407756800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((73796461068108800 : Rat) / 53898264945705951) [(5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-229146535849988209808 : Rat) / 4042369870927946325) [(5, 2), (9, 2), (14, 1), (16, 1)],
  term ((16960045939928289272 : Rat) / 808473974185589265) [(5, 2), (9, 2), (16, 1)],
  term ((-1016828298440622080 : Rat) / 53898264945705951) [(5, 2), (9, 3), (10, 1), (11, 1), (16, 1)],
  term ((134797667384576000 : Rat) / 53898264945705951) [(5, 2), (9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-25919740877076480 : Rat) / 5988696105078439) [(5, 2), (9, 3), (11, 1), (16, 1)],
  term ((-140732359881236480 : Rat) / 53898264945705951) [(5, 2), (9, 3), (13, 1), (14, 1), (16, 1)],
  term ((299683619543060480 : Rat) / 53898264945705951) [(5, 2), (9, 3), (13, 1), (16, 1)],
  term ((-232904051404021760 : Rat) / 53898264945705951) [(5, 2), (9, 3), (15, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 2), (9, 4), (14, 1), (16, 1)],
  term ((14202015470755840 : Rat) / 53898264945705951) [(5, 2), (9, 4), (16, 1)],
  term (-1 : Rat) [(5, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 3), (7, 1), (8, 1), (16, 1)],
  term ((-352666601287573760 : Rat) / 17966088315235317) [(5, 3), (7, 1), (9, 2), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 3), (7, 1), (10, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 3), (7, 1), (14, 1), (16, 1)],
  term ((1117217814872729524 : Rat) / 53898264945705951) [(5, 3), (7, 1), (16, 1)],
  term ((67398833692288000 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(5, 3), (8, 1), (9, 1), (16, 1)],
  term ((17551369811535273472 : Rat) / 269491324728529755) [(5, 3), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 3), (8, 1), (9, 3), (16, 1)],
  term ((-41841876639207876904 : Rat) / 4042369870927946325) [(5, 3), (8, 1), (11, 1), (16, 1)],
  term ((-153889062020556800 : Rat) / 53898264945705951) [(5, 3), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((303537986071686178432 : Rat) / 1347456623642648775) [(5, 3), (9, 1), (10, 1), (16, 1)],
  term ((62613299096857600 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6782140458419200 : Rat) / 5988696105078439) [(5, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((65044124203878400 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-36898230534054400 : Rat) / 53898264945705951) [(5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-1180818472812535524272 : Rat) / 4042369870927946325) [(5, 3), (9, 1), (14, 1), (16, 1)],
  term ((605295755518944091408 : Rat) / 4042369870927946325) [(5, 3), (9, 1), (16, 1)],
  term ((-1705194340344526592 : Rat) / 17966088315235317) [(5, 3), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-6449855652189588224 : Rat) / 89830441576176585) [(5, 3), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-4708847173230962048 : Rat) / 269491324728529755) [(5, 3), (9, 2), (11, 1), (16, 1)],
  term ((12026465823448281344 : Rat) / 269491324728529755) [(5, 3), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-12469362770526038272 : Rat) / 269491324728529755) [(5, 3), (9, 2), (13, 1), (16, 1)],
  term ((2420156512992829056 : Rat) / 29943480525392195) [(5, 3), (9, 2), (15, 1), (16, 1)],
  term ((119611873204920320 : Rat) / 5988696105078439) [(5, 3), (9, 3), (10, 1), (16, 1)],
  term ((-17512768445092137472 : Rat) / 269491324728529755) [(5, 3), (9, 3), (14, 1), (16, 1)],
  term ((4816332596135926528 : Rat) / 53898264945705951) [(5, 3), (9, 3), (16, 1)],
  term ((-47333474265887365388 : Rat) / 808473974185589265) [(5, 3), (10, 1), (11, 1), (16, 1)],
  term ((251186425872304749068 : Rat) / 1347456623642648775) [(5, 3), (11, 1), (14, 1), (16, 1)],
  term ((-16874367719711429382 : Rat) / 149717402626960975) [(5, 3), (11, 1), (16, 1)],
  term ((-2678648510683996612 : Rat) / 449152207880882925) [(5, 3), (13, 1), (14, 1), (16, 1)],
  term ((-19952570973108454444 : Rat) / 449152207880882925) [(5, 3), (13, 1), (16, 1)],
  term ((90977098757010774674 : Rat) / 1347456623642648775) [(5, 3), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 4), (7, 1), (9, 1), (16, 1)],
  term ((-64380704189404928 : Rat) / 1967089961522115) [(5, 4), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-8607187821536916736 : Rat) / 269491324728529755) [(5, 4), (8, 1), (9, 2), (16, 1)],
  term ((34376386853238775484 : Rat) / 1347456623642648775) [(5, 4), (8, 1), (16, 1)],
  term ((2811998585126945408 : Rat) / 53898264945705951) [(5, 4), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((9506286394053662336 : Rat) / 269491324728529755) [(5, 4), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2646020671482591424 : Rat) / 269491324728529755) [(5, 4), (9, 1), (11, 1), (16, 1)],
  term ((-648590829096955008 : Rat) / 29943480525392195) [(5, 4), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((5860076860834193536 : Rat) / 269491324728529755) [(5, 4), (9, 1), (13, 1), (16, 1)],
  term ((-10599574244212703552 : Rat) / 269491324728529755) [(5, 4), (9, 1), (15, 1), (16, 1)],
  term ((40397409829643838464 : Rat) / 269491324728529755) [(5, 4), (9, 2), (10, 1), (16, 1)],
  term ((-7401719923381416448 : Rat) / 269491324728529755) [(5, 4), (9, 2), (14, 1), (16, 1)],
  term ((-3957296152624099328 : Rat) / 269491324728529755) [(5, 4), (9, 2), (16, 1)],
  term ((-151768993035843089216 : Rat) / 1347456623642648775) [(5, 4), (10, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 4), (14, 1), (16, 1)],
  term ((-107949311728127469098 : Rat) / 1347456623642648775) [(5, 4), (16, 1)],
  term ((1441943231619625856 : Rat) / 89830441576176585) [(5, 5), (8, 1), (9, 1), (16, 1)],
  term ((-21544338488377272832 : Rat) / 269491324728529755) [(5, 5), (9, 1), (10, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 5), (9, 1), (14, 1), (16, 1)],
  term ((-4050643928527080896 : Rat) / 269491324728529755) [(5, 5), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 56. -/
theorem rs_R010_ueqv_R010YNN_block_19_0000_0056_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_19_0000_0056
      rs_R010_ueqv_R010YNN_block_19_0000_0056 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
