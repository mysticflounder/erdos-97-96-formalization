/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 19:1000-1099

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1000 : Poly :=
[
  term ((-294 : Rat) / 67) [(7, 2), (14, 1)]
]

/-- Partial product 1000 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1000 : Poly :=
[
  term ((-588 : Rat) / 67) [(7, 2), (8, 1), (14, 1)],
  term ((294 : Rat) / 67) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1000
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1001 : Poly :=
[
  term ((-523726648036 : Rat) / 5817514525) [(7, 2), (15, 2)]
]

/-- Partial product 1001 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1001 : Poly :=
[
  term ((-1047453296072 : Rat) / 5817514525) [(7, 2), (8, 1), (15, 2)],
  term ((523726648036 : Rat) / 5817514525) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1001
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1002 : Poly :=
[
  term ((1197437289337 : Rat) / 52357630725) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 1002 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1002 : Poly :=
[
  term ((2394874578674 : Rat) / 52357630725) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1197437289337 : Rat) / 52357630725) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1002
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1003 : Poly :=
[
  term ((-2192956060288 : Rat) / 157072892175) [(7, 3), (8, 1), (11, 1)]
]

/-- Partial product 1003 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1003 : Poly :=
[
  term ((2192956060288 : Rat) / 157072892175) [(7, 3), (8, 1), (11, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 3), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1003
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1004 : Poly :=
[
  term ((-34264938442 : Rat) / 5817514525) [(7, 3), (8, 1), (13, 1)]
]

/-- Partial product 1004 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1004 : Poly :=
[
  term ((34264938442 : Rat) / 5817514525) [(7, 3), (8, 1), (13, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 3), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1004
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1005 : Poly :=
[
  term ((2394874578674 : Rat) / 157072892175) [(7, 3), (8, 1), (15, 1)]
]

/-- Partial product 1005 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1005 : Poly :=
[
  term ((-2394874578674 : Rat) / 157072892175) [(7, 3), (8, 1), (15, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 3), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1005
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1006 : Poly :=
[
  term ((1096478030144 : Rat) / 52357630725) [(7, 3), (11, 1)]
]

/-- Partial product 1006 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1006 : Poly :=
[
  term ((2192956060288 : Rat) / 52357630725) [(7, 3), (8, 1), (11, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1006
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1007 : Poly :=
[
  term ((51397407663 : Rat) / 5817514525) [(7, 3), (13, 1)]
]

/-- Partial product 1007 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1007 : Poly :=
[
  term ((102794815326 : Rat) / 5817514525) [(7, 3), (8, 1), (13, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1007
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1008 : Poly :=
[
  term ((-1197437289337 : Rat) / 52357630725) [(7, 3), (15, 1)]
]

/-- Partial product 1008 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1008 : Poly :=
[
  term ((-2394874578674 : Rat) / 52357630725) [(7, 3), (8, 1), (15, 1)],
  term ((1197437289337 : Rat) / 52357630725) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1008
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1009 : Poly :=
[
  term ((903 : Rat) / 536) [(8, 1)]
]

/-- Partial product 1009 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1009 : Poly :=
[
  term ((-903 : Rat) / 536) [(8, 1)],
  term ((903 : Rat) / 268) [(8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1009
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1010 : Poly :=
[
  term ((-98 : Rat) / 67) [(8, 1), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 1010 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1010 : Poly :=
[
  term ((98 : Rat) / 67) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-196 : Rat) / 67) [(8, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1010
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1011 : Poly :=
[
  term ((-316 : Rat) / 67) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 1011 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1011 : Poly :=
[
  term ((316 : Rat) / 67) [(8, 1), (9, 1), (11, 1)],
  term ((-632 : Rat) / 67) [(8, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1011
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1012 : Poly :=
[
  term ((98 : Rat) / 67) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1012 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1012 : Poly :=
[
  term ((-98 : Rat) / 67) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((196 : Rat) / 67) [(8, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1012
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1013 : Poly :=
[
  term ((-267 : Rat) / 134) [(8, 1), (10, 1)]
]

/-- Partial product 1013 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1013 : Poly :=
[
  term ((267 : Rat) / 134) [(8, 1), (10, 1)],
  term ((-267 : Rat) / 67) [(8, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1013
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1014 : Poly :=
[
  term ((40815776771 : Rat) / 3490508715) [(8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1014 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1014 : Poly :=
[
  term ((-40815776771 : Rat) / 3490508715) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((81631553542 : Rat) / 3490508715) [(8, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1014
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1015 : Poly :=
[
  term ((-2401603084102 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1015 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1015 : Poly :=
[
  term ((2401603084102 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4803206168204 : Rat) / 94243735305) [(8, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1015
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1016 : Poly :=
[
  term ((2612209713344 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 2)]
]

/-- Partial product 1016 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1016 : Poly :=
[
  term ((-2612209713344 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 2)],
  term ((5224419426688 : Rat) / 94243735305) [(8, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1016
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1017 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1017 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1017 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((5483520 : Rat) / 12247399) [(8, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1017
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1018 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1018 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1018 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1018
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1019 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1019 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1019 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1019
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1020 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1020 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1020 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1020
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1021 : Poly :=
[
  term ((-5639327652 : Rat) / 1163502905) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1021 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1021 : Poly :=
[
  term ((5639327652 : Rat) / 1163502905) [(8, 1), (11, 1), (13, 1)],
  term ((-11278655304 : Rat) / 1163502905) [(8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1021
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1022 : Poly :=
[
  term ((3731840 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1022 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1022 : Poly :=
[
  term ((-3731840 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((7463680 : Rat) / 12247399) [(8, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1022
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1023 : Poly :=
[
  term ((-685440 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 2)]
]

/-- Partial product 1023 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1023 : Poly :=
[
  term ((685440 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(8, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1023
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1024 : Poly :=
[
  term ((31051520 : Rat) / 110226591) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1024 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1024 : Poly :=
[
  term ((-31051520 : Rat) / 110226591) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((62103040 : Rat) / 110226591) [(8, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1024
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1025 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1025 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1025 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(8, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1025
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1026 : Poly :=
[
  term ((-54153526 : Rat) / 330679773) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1026 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1026 : Poly :=
[
  term ((54153526 : Rat) / 330679773) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-108307052 : Rat) / 330679773) [(8, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1026
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1027 : Poly :=
[
  term ((4395520 : Rat) / 36742197) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 1027 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1027 : Poly :=
[
  term ((-4395520 : Rat) / 36742197) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(8, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1027
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1028 : Poly :=
[
  term ((98278882028 : Rat) / 10471526145) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1028 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1028 : Poly :=
[
  term ((-98278882028 : Rat) / 10471526145) [(8, 1), (11, 1), (15, 1)],
  term ((196557764056 : Rat) / 10471526145) [(8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1028
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1029 : Poly :=
[
  term ((8791040 : Rat) / 110226591) [(8, 1), (11, 1), (15, 3)]
]

/-- Partial product 1029 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1029 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(8, 1), (11, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(8, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1029
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1030 : Poly :=
[
  term ((-110928170476 : Rat) / 10471526145) [(8, 1), (11, 2)]
]

/-- Partial product 1030 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1030 : Poly :=
[
  term ((110928170476 : Rat) / 10471526145) [(8, 1), (11, 2)],
  term ((-221856340952 : Rat) / 10471526145) [(8, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1030
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1031 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(8, 1), (11, 2), (12, 1)]
]

/-- Partial product 1031 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1031 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(8, 1), (11, 2), (12, 1)],
  term ((38993920 : Rat) / 36742197) [(8, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1031
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1032 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(8, 1), (11, 2), (12, 1), (14, 1)]
]

/-- Partial product 1032 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1032 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(8, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1032
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1033 : Poly :=
[
  term ((2132480 : Rat) / 110226591) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 1033 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1033 : Poly :=
[
  term ((-2132480 : Rat) / 110226591) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((4264960 : Rat) / 110226591) [(8, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1033
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1034 : Poly :=
[
  term ((238837760 : Rat) / 330679773) [(8, 1), (11, 2), (14, 1)]
]

/-- Partial product 1034 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1034 : Poly :=
[
  term ((-238837760 : Rat) / 330679773) [(8, 1), (11, 2), (14, 1)],
  term ((477675520 : Rat) / 330679773) [(8, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1034
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1035 : Poly :=
[
  term ((-4874240 : Rat) / 36742197) [(8, 1), (11, 2), (14, 2)]
]

/-- Partial product 1035 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1035 : Poly :=
[
  term ((4874240 : Rat) / 36742197) [(8, 1), (11, 2), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(8, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1035
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1036 : Poly :=
[
  term ((-32552960 : Rat) / 36742197) [(8, 1), (11, 2), (15, 2)]
]

/-- Partial product 1036 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1036 : Poly :=
[
  term ((32552960 : Rat) / 36742197) [(8, 1), (11, 2), (15, 2)],
  term ((-65105920 : Rat) / 36742197) [(8, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1036
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1037 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(8, 1), (11, 3), (15, 1)]
]

/-- Partial product 1037 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1037 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(8, 1), (11, 3), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(8, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1037
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1038 : Poly :=
[
  term ((-36 : Rat) / 67) [(8, 1), (12, 1)]
]

/-- Partial product 1038 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1038 : Poly :=
[
  term ((36 : Rat) / 67) [(8, 1), (12, 1)],
  term ((-72 : Rat) / 67) [(8, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1038
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1039 : Poly :=
[
  term ((24 : Rat) / 67) [(8, 1), (14, 1)]
]

/-- Partial product 1039 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1039 : Poly :=
[
  term ((-24 : Rat) / 67) [(8, 1), (14, 1)],
  term ((48 : Rat) / 67) [(8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1039
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1040 : Poly :=
[
  term ((-180893700152 : Rat) / 4960196595) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 1040 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1040 : Poly :=
[
  term ((-361787400304 : Rat) / 4960196595) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((180893700152 : Rat) / 4960196595) [(9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1040
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1041 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 1041 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1041 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 36742197) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1041
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1042 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1042 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1042 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-97484800 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1042
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1043 : Poly :=
[
  term ((-2132480 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1043 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1043 : Poly :=
[
  term ((-4264960 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((2132480 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1043
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1044 : Poly :=
[
  term ((-238837760 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1044 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1044 : Poly :=
[
  term ((-477675520 : Rat) / 330679773) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((238837760 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1044
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1045 : Poly :=
[
  term ((4874240 : Rat) / 36742197) [(9, 1), (10, 1), (11, 1), (14, 2)]
]

/-- Partial product 1045 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1045 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-4874240 : Rat) / 36742197) [(9, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1045
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1046 : Poly :=
[
  term ((32552960 : Rat) / 36742197) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 1046 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1046 : Poly :=
[
  term ((65105920 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-32552960 : Rat) / 36742197) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1046
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1047 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 1047 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1047 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(9, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1047
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1048 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1048 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1048 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((2741760 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1048
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1049 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1049 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1049 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-4569600 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1049
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1050 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1050 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1050 : Poly :=
[
  term ((-175820800 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1050
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1051 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1051 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1051 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1051
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1052 : Poly :=
[
  term ((-2983783733 : Rat) / 183710985) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1052 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1052 : Poly :=
[
  term ((-5967567466 : Rat) / 183710985) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((2983783733 : Rat) / 183710985) [(9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1052
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1053 : Poly :=
[
  term ((-3731840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1053 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1053 : Poly :=
[
  term ((-7463680 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((3731840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1053
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1054 : Poly :=
[
  term ((685440 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 2)]
]

/-- Partial product 1054 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1054 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-685440 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1054
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1055 : Poly :=
[
  term ((-31051520 : Rat) / 110226591) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 1055 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1055 : Poly :=
[
  term ((-62103040 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((31051520 : Rat) / 110226591) [(9, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1055
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1056 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 1056 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1056 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1056
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1057 : Poly :=
[
  term ((54153526 : Rat) / 330679773) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1057 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1057 : Poly :=
[
  term ((108307052 : Rat) / 330679773) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-54153526 : Rat) / 330679773) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1057
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1058 : Poly :=
[
  term ((-4395520 : Rat) / 36742197) [(9, 1), (10, 1), (14, 2), (15, 1)]
]

/-- Partial product 1058 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1058 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((4395520 : Rat) / 36742197) [(9, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1058
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1059 : Poly :=
[
  term ((173416149031 : Rat) / 4960196595) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1059 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1059 : Poly :=
[
  term ((346832298062 : Rat) / 4960196595) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-173416149031 : Rat) / 4960196595) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1059
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1060 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(9, 1), (10, 1), (15, 3)]
]

/-- Partial product 1060 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1060 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1060
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1061 : Poly :=
[
  term ((-2612209713344 : Rat) / 94243735305) [(9, 1), (10, 2), (11, 1)]
]

/-- Partial product 1061 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1061 : Poly :=
[
  term ((-5224419426688 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((2612209713344 : Rat) / 94243735305) [(9, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1061
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1062 : Poly :=
[
  term ((-40815776771 : Rat) / 3490508715) [(9, 1), (10, 2), (13, 1)]
]

/-- Partial product 1062 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1062 : Poly :=
[
  term ((-81631553542 : Rat) / 3490508715) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((40815776771 : Rat) / 3490508715) [(9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1062
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1063 : Poly :=
[
  term ((2401603084102 : Rat) / 94243735305) [(9, 1), (10, 2), (15, 1)]
]

/-- Partial product 1063 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1063 : Poly :=
[
  term ((4803206168204 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-2401603084102 : Rat) / 94243735305) [(9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1063
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1064 : Poly :=
[
  term ((-404417506972 : Rat) / 24800982975) [(9, 1), (11, 1)]
]

/-- Partial product 1064 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1064 : Poly :=
[
  term ((-808835013944 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1)],
  term ((404417506972 : Rat) / 24800982975) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1064
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1065 : Poly :=
[
  term ((-14682881024 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1065 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1065 : Poly :=
[
  term ((-29365762048 : Rat) / 330679773) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((14682881024 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1065
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1066 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1066 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1066 : Poly :=
[
  term ((-779878400 : Rat) / 110226591) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1066
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1067 : Poly :=
[
  term ((-46914560 : Rat) / 36742197) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1067 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1067 : Poly :=
[
  term ((-93829120 : Rat) / 36742197) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((46914560 : Rat) / 36742197) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1067
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1068 : Poly :=
[
  term ((389404514737 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1068 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1068 : Poly :=
[
  term ((778809029474 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-389404514737 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1068
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1069 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 1069 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1069 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1069
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1070 : Poly :=
[
  term ((-103342925728 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1070 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1070 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1070
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1071 : Poly :=
[
  term ((3846480160 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1071 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1071 : Poly :=
[
  term ((7692960320 : Rat) / 110226591) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-3846480160 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1071
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1072 : Poly :=
[
  term ((2320 : Rat) / 201) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1072 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1072 : Poly :=
[
  term ((4640 : Rat) / 201) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1072
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1073 : Poly :=
[
  term ((202546857628 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1073 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1073 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1073
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1074 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 1074 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1074 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1074
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1075 : Poly :=
[
  term ((-229420016 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1075 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1075 : Poly :=
[
  term ((-458840032 : Rat) / 12247399) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((229420016 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1075
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1076 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1076 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1076 : Poly :=
[
  term ((-36556800 : Rat) / 12247399) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1076
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1077 : Poly :=
[
  term ((13063133668 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1077 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1077 : Poly :=
[
  term ((26126267336 : Rat) / 330679773) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-13063133668 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1077
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1078 : Poly :=
[
  term ((-63 : Rat) / 67) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1078 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1078 : Poly :=
[
  term ((-126 : Rat) / 67) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1078
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1079 : Poly :=
[
  term ((351641600 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 1079 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1079 : Poly :=
[
  term ((703283200 : Rat) / 110226591) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-351641600 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1079
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1080 : Poly :=
[
  term ((-6329836871 : Rat) / 1837109850) [(9, 1), (13, 1)]
]

/-- Partial product 1080 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1080 : Poly :=
[
  term ((-6329836871 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1)],
  term ((6329836871 : Rat) / 1837109850) [(9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1080
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1081 : Poly :=
[
  term ((6934665808 : Rat) / 918554925) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1081 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1081 : Poly :=
[
  term ((13869331616 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-6934665808 : Rat) / 918554925) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1081
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1082 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1082 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1082 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1082
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1083 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1083 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1083 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1083
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1084 : Poly :=
[
  term ((891593680 : Rat) / 36742197) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1084 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1084 : Poly :=
[
  term ((1783187360 : Rat) / 36742197) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-891593680 : Rat) / 36742197) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1084
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1085 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1085 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1085 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1085
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1086 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 1086 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1086 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1086
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1087 : Poly :=
[
  term ((-255125025176 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1087 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1087 : Poly :=
[
  term ((-510250050352 : Rat) / 24800982975) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((255125025176 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1087_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1087
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1088 : Poly :=
[
  term ((20641044794 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1088 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1088 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1088_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1088
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1089 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(9, 1), (14, 1), (15, 3)]
]

/-- Partial product 1089 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1089 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1089_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1089
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1090 : Poly :=
[
  term ((-94679907244 : Rat) / 24800982975) [(9, 1), (15, 1)]
]

/-- Partial product 1090 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1090 : Poly :=
[
  term ((-189359814488 : Rat) / 24800982975) [(8, 1), (9, 1), (15, 1)],
  term ((94679907244 : Rat) / 24800982975) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1090_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1090
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1091 : Poly :=
[
  term ((30318188881 : Rat) / 24800982975) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1091 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1091 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1091_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1091
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1092 : Poly :=
[
  term ((-1868257600 : Rat) / 36742197) [(9, 1), (15, 3)]
]

/-- Partial product 1092 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1092 : Poly :=
[
  term ((-3736515200 : Rat) / 36742197) [(8, 1), (9, 1), (15, 3)],
  term ((1868257600 : Rat) / 36742197) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1092_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1092
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1093 : Poly :=
[
  term ((-571 : Rat) / 134) [(9, 2)]
]

/-- Partial product 1093 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1093 : Poly :=
[
  term ((-571 : Rat) / 67) [(8, 1), (9, 2)],
  term ((571 : Rat) / 134) [(9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1093_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1093
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1094 : Poly :=
[
  term ((316 : Rat) / 67) [(9, 2), (10, 1)]
]

/-- Partial product 1094 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1094 : Poly :=
[
  term ((632 : Rat) / 67) [(8, 1), (9, 2), (10, 1)],
  term ((-316 : Rat) / 67) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1094_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1094
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1095 : Poly :=
[
  term ((-98 : Rat) / 67) [(9, 2), (10, 1), (14, 1)]
]

/-- Partial product 1095 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1095 : Poly :=
[
  term ((-196 : Rat) / 67) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((98 : Rat) / 67) [(9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1095_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1095
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1096 : Poly :=
[
  term ((98 : Rat) / 67) [(9, 2), (10, 2)]
]

/-- Partial product 1096 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1096 : Poly :=
[
  term ((196 : Rat) / 67) [(8, 1), (9, 2), (10, 2)],
  term ((-98 : Rat) / 67) [(9, 2), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1096_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1096
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1097 : Poly :=
[
  term ((44102409344 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 1097 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1097 : Poly :=
[
  term ((88204818688 : Rat) / 18848747061) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1097_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1097
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1098 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1098 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1098 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1098_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1098
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NNNYN_coefficient_19_1099 : Poly :=
[
  term ((689100146 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 1099 for generator 19. -/
def rs_R009_ueqv_R009NNNYN_partial_19_1099 : Poly :=
[
  term ((1378200292 : Rat) / 698101743) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 19. -/
theorem rs_R009_ueqv_R009NNNYN_partial_19_1099_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_19_1099
        rs_R009_ueqv_R009NNNYN_generator_19_1000_1099 =
      rs_R009_ueqv_R009NNNYN_partial_19_1099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_19_1000_1099 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_19_1000,
  rs_R009_ueqv_R009NNNYN_partial_19_1001,
  rs_R009_ueqv_R009NNNYN_partial_19_1002,
  rs_R009_ueqv_R009NNNYN_partial_19_1003,
  rs_R009_ueqv_R009NNNYN_partial_19_1004,
  rs_R009_ueqv_R009NNNYN_partial_19_1005,
  rs_R009_ueqv_R009NNNYN_partial_19_1006,
  rs_R009_ueqv_R009NNNYN_partial_19_1007,
  rs_R009_ueqv_R009NNNYN_partial_19_1008,
  rs_R009_ueqv_R009NNNYN_partial_19_1009,
  rs_R009_ueqv_R009NNNYN_partial_19_1010,
  rs_R009_ueqv_R009NNNYN_partial_19_1011,
  rs_R009_ueqv_R009NNNYN_partial_19_1012,
  rs_R009_ueqv_R009NNNYN_partial_19_1013,
  rs_R009_ueqv_R009NNNYN_partial_19_1014,
  rs_R009_ueqv_R009NNNYN_partial_19_1015,
  rs_R009_ueqv_R009NNNYN_partial_19_1016,
  rs_R009_ueqv_R009NNNYN_partial_19_1017,
  rs_R009_ueqv_R009NNNYN_partial_19_1018,
  rs_R009_ueqv_R009NNNYN_partial_19_1019,
  rs_R009_ueqv_R009NNNYN_partial_19_1020,
  rs_R009_ueqv_R009NNNYN_partial_19_1021,
  rs_R009_ueqv_R009NNNYN_partial_19_1022,
  rs_R009_ueqv_R009NNNYN_partial_19_1023,
  rs_R009_ueqv_R009NNNYN_partial_19_1024,
  rs_R009_ueqv_R009NNNYN_partial_19_1025,
  rs_R009_ueqv_R009NNNYN_partial_19_1026,
  rs_R009_ueqv_R009NNNYN_partial_19_1027,
  rs_R009_ueqv_R009NNNYN_partial_19_1028,
  rs_R009_ueqv_R009NNNYN_partial_19_1029,
  rs_R009_ueqv_R009NNNYN_partial_19_1030,
  rs_R009_ueqv_R009NNNYN_partial_19_1031,
  rs_R009_ueqv_R009NNNYN_partial_19_1032,
  rs_R009_ueqv_R009NNNYN_partial_19_1033,
  rs_R009_ueqv_R009NNNYN_partial_19_1034,
  rs_R009_ueqv_R009NNNYN_partial_19_1035,
  rs_R009_ueqv_R009NNNYN_partial_19_1036,
  rs_R009_ueqv_R009NNNYN_partial_19_1037,
  rs_R009_ueqv_R009NNNYN_partial_19_1038,
  rs_R009_ueqv_R009NNNYN_partial_19_1039,
  rs_R009_ueqv_R009NNNYN_partial_19_1040,
  rs_R009_ueqv_R009NNNYN_partial_19_1041,
  rs_R009_ueqv_R009NNNYN_partial_19_1042,
  rs_R009_ueqv_R009NNNYN_partial_19_1043,
  rs_R009_ueqv_R009NNNYN_partial_19_1044,
  rs_R009_ueqv_R009NNNYN_partial_19_1045,
  rs_R009_ueqv_R009NNNYN_partial_19_1046,
  rs_R009_ueqv_R009NNNYN_partial_19_1047,
  rs_R009_ueqv_R009NNNYN_partial_19_1048,
  rs_R009_ueqv_R009NNNYN_partial_19_1049,
  rs_R009_ueqv_R009NNNYN_partial_19_1050,
  rs_R009_ueqv_R009NNNYN_partial_19_1051,
  rs_R009_ueqv_R009NNNYN_partial_19_1052,
  rs_R009_ueqv_R009NNNYN_partial_19_1053,
  rs_R009_ueqv_R009NNNYN_partial_19_1054,
  rs_R009_ueqv_R009NNNYN_partial_19_1055,
  rs_R009_ueqv_R009NNNYN_partial_19_1056,
  rs_R009_ueqv_R009NNNYN_partial_19_1057,
  rs_R009_ueqv_R009NNNYN_partial_19_1058,
  rs_R009_ueqv_R009NNNYN_partial_19_1059,
  rs_R009_ueqv_R009NNNYN_partial_19_1060,
  rs_R009_ueqv_R009NNNYN_partial_19_1061,
  rs_R009_ueqv_R009NNNYN_partial_19_1062,
  rs_R009_ueqv_R009NNNYN_partial_19_1063,
  rs_R009_ueqv_R009NNNYN_partial_19_1064,
  rs_R009_ueqv_R009NNNYN_partial_19_1065,
  rs_R009_ueqv_R009NNNYN_partial_19_1066,
  rs_R009_ueqv_R009NNNYN_partial_19_1067,
  rs_R009_ueqv_R009NNNYN_partial_19_1068,
  rs_R009_ueqv_R009NNNYN_partial_19_1069,
  rs_R009_ueqv_R009NNNYN_partial_19_1070,
  rs_R009_ueqv_R009NNNYN_partial_19_1071,
  rs_R009_ueqv_R009NNNYN_partial_19_1072,
  rs_R009_ueqv_R009NNNYN_partial_19_1073,
  rs_R009_ueqv_R009NNNYN_partial_19_1074,
  rs_R009_ueqv_R009NNNYN_partial_19_1075,
  rs_R009_ueqv_R009NNNYN_partial_19_1076,
  rs_R009_ueqv_R009NNNYN_partial_19_1077,
  rs_R009_ueqv_R009NNNYN_partial_19_1078,
  rs_R009_ueqv_R009NNNYN_partial_19_1079,
  rs_R009_ueqv_R009NNNYN_partial_19_1080,
  rs_R009_ueqv_R009NNNYN_partial_19_1081,
  rs_R009_ueqv_R009NNNYN_partial_19_1082,
  rs_R009_ueqv_R009NNNYN_partial_19_1083,
  rs_R009_ueqv_R009NNNYN_partial_19_1084,
  rs_R009_ueqv_R009NNNYN_partial_19_1085,
  rs_R009_ueqv_R009NNNYN_partial_19_1086,
  rs_R009_ueqv_R009NNNYN_partial_19_1087,
  rs_R009_ueqv_R009NNNYN_partial_19_1088,
  rs_R009_ueqv_R009NNNYN_partial_19_1089,
  rs_R009_ueqv_R009NNNYN_partial_19_1090,
  rs_R009_ueqv_R009NNNYN_partial_19_1091,
  rs_R009_ueqv_R009NNNYN_partial_19_1092,
  rs_R009_ueqv_R009NNNYN_partial_19_1093,
  rs_R009_ueqv_R009NNNYN_partial_19_1094,
  rs_R009_ueqv_R009NNNYN_partial_19_1095,
  rs_R009_ueqv_R009NNNYN_partial_19_1096,
  rs_R009_ueqv_R009NNNYN_partial_19_1097,
  rs_R009_ueqv_R009NNNYN_partial_19_1098,
  rs_R009_ueqv_R009NNNYN_partial_19_1099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_19_1000_1099 : Poly :=
[
  term ((-588 : Rat) / 67) [(7, 2), (8, 1), (14, 1)],
  term ((-1047453296072 : Rat) / 5817514525) [(7, 2), (8, 1), (15, 2)],
  term ((2394874578674 : Rat) / 52357630725) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((294 : Rat) / 67) [(7, 2), (14, 1)],
  term ((523726648036 : Rat) / 5817514525) [(7, 2), (15, 2)],
  term ((-1197437289337 : Rat) / 52357630725) [(7, 2), (15, 2), (16, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(7, 3), (8, 1), (11, 1)],
  term ((137059753768 : Rat) / 5817514525) [(7, 3), (8, 1), (13, 1)],
  term ((-9579498314696 : Rat) / 157072892175) [(7, 3), (8, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 3), (8, 2), (11, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 3), (8, 2), (13, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 3), (8, 2), (15, 1)],
  term ((-1096478030144 : Rat) / 52357630725) [(7, 3), (11, 1)],
  term ((-51397407663 : Rat) / 5817514525) [(7, 3), (13, 1)],
  term ((1197437289337 : Rat) / 52357630725) [(7, 3), (15, 1)],
  term ((-903 : Rat) / 536) [(8, 1)],
  term ((-354532187374 : Rat) / 4960196595) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-38993920 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((194969600 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-4264960 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-477675520 : Rat) / 330679773) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((65105920 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (11, 2), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((9139200 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((35164160 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-5967567466 : Rat) / 183710985) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-7463680 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1370880 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-62103040 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((3655680 : Rat) / 12247399) [(8, 1), (9, 1), (10, 1), (13, 2), (15, 1)],
  term ((108307052 : Rat) / 330679773) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((346832298062 : Rat) / 4960196595) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(8, 1), (9, 1), (10, 1), (15, 3)],
  term ((-5224419426688 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 2), (11, 1)],
  term ((-81631553542 : Rat) / 3490508715) [(8, 1), (9, 1), (10, 2), (13, 1)],
  term ((4803206168204 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-691863213644 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1)],
  term ((-29365762048 : Rat) / 330679773) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-93829120 : Rat) / 36742197) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((742532964824 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((7692960320 : Rat) / 110226591) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-389939200 : Rat) / 110226591) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-458840032 : Rat) / 12247399) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((26126267336 : Rat) / 330679773) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((-6329836871 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1)],
  term ((13869331616 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1783187360 : Rat) / 36742197) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5483520 : Rat) / 12247399) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-510250050352 : Rat) / 24800982975) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-189359814488 : Rat) / 24800982975) [(8, 1), (9, 1), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3736515200 : Rat) / 36742197) [(8, 1), (9, 1), (15, 3)],
  term ((-571 : Rat) / 67) [(8, 1), (9, 2)],
  term ((632 : Rat) / 67) [(8, 1), (9, 2), (10, 1)],
  term ((-196 : Rat) / 67) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((196 : Rat) / 67) [(8, 1), (9, 2), (10, 2)],
  term ((88204818688 : Rat) / 18848747061) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1378200292 : Rat) / 698101743) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((267 : Rat) / 134) [(8, 1), (10, 1)],
  term ((-40815776771 : Rat) / 3490508715) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((2401603084102 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2612209713344 : Rat) / 94243735305) [(8, 1), (10, 1), (11, 2)],
  term ((-2741760 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((4569600 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((5639327652 : Rat) / 1163502905) [(8, 1), (11, 1), (13, 1)],
  term ((-3731840 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((685440 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-31051520 : Rat) / 110226591) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((54153526 : Rat) / 330679773) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4395520 : Rat) / 36742197) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-98278882028 : Rat) / 10471526145) [(8, 1), (11, 1), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(8, 1), (11, 1), (15, 3)],
  term ((110928170476 : Rat) / 10471526145) [(8, 1), (11, 2)],
  term ((-19496960 : Rat) / 36742197) [(8, 1), (11, 2), (12, 1)],
  term ((97484800 : Rat) / 110226591) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2132480 : Rat) / 110226591) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-238837760 : Rat) / 330679773) [(8, 1), (11, 2), (14, 1)],
  term ((4874240 : Rat) / 36742197) [(8, 1), (11, 2), (14, 2)],
  term ((32552960 : Rat) / 36742197) [(8, 1), (11, 2), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(8, 1), (11, 3), (15, 1)],
  term ((36 : Rat) / 67) [(8, 1), (12, 1)],
  term ((-24 : Rat) / 67) [(8, 1), (14, 1)],
  term ((903 : Rat) / 268) [(8, 2)],
  term ((-196 : Rat) / 67) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((-632 : Rat) / 67) [(8, 2), (9, 1), (11, 1)],
  term ((196 : Rat) / 67) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-267 : Rat) / 67) [(8, 2), (10, 1)],
  term ((81631553542 : Rat) / 3490508715) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-4803206168204 : Rat) / 94243735305) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((5224419426688 : Rat) / 94243735305) [(8, 2), (10, 1), (11, 2)],
  term ((5483520 : Rat) / 12247399) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-35164160 : Rat) / 36742197) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-11278655304 : Rat) / 1163502905) [(8, 2), (11, 1), (13, 1)],
  term ((7463680 : Rat) / 12247399) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(8, 2), (11, 1), (13, 1), (14, 2)],
  term ((62103040 : Rat) / 110226591) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((-108307052 : Rat) / 330679773) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((196557764056 : Rat) / 10471526145) [(8, 2), (11, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(8, 2), (11, 1), (15, 3)],
  term ((-221856340952 : Rat) / 10471526145) [(8, 2), (11, 2)],
  term ((38993920 : Rat) / 36742197) [(8, 2), (11, 2), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(8, 2), (11, 2), (12, 1), (14, 1)],
  term ((4264960 : Rat) / 110226591) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((477675520 : Rat) / 330679773) [(8, 2), (11, 2), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(8, 2), (11, 2), (14, 2)],
  term ((-65105920 : Rat) / 36742197) [(8, 2), (11, 2), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(8, 2), (11, 3), (15, 1)],
  term ((-72 : Rat) / 67) [(8, 2), (12, 1)],
  term ((48 : Rat) / 67) [(8, 2), (14, 1)],
  term ((180893700152 : Rat) / 4960196595) [(9, 1), (10, 1), (11, 1)],
  term ((19496960 : Rat) / 36742197) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-97484800 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((2132480 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((238837760 : Rat) / 330679773) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-4874240 : Rat) / 36742197) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-32552960 : Rat) / 36742197) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(9, 1), (10, 1), (11, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-4569600 : Rat) / 12247399) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((87910400 : Rat) / 110226591) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((2983783733 : Rat) / 183710985) [(9, 1), (10, 1), (13, 1)],
  term ((3731840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-685440 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((31051520 : Rat) / 110226591) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-54153526 : Rat) / 330679773) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((4395520 : Rat) / 36742197) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-173416149031 : Rat) / 4960196595) [(9, 1), (10, 1), (15, 1)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (10, 1), (15, 3)],
  term ((2612209713344 : Rat) / 94243735305) [(9, 1), (10, 2), (11, 1)],
  term ((40815776771 : Rat) / 3490508715) [(9, 1), (10, 2), (13, 1)],
  term ((-2401603084102 : Rat) / 94243735305) [(9, 1), (10, 2), (15, 1)],
  term ((404417506972 : Rat) / 24800982975) [(9, 1), (11, 1)],
  term ((14682881024 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((46914560 : Rat) / 36742197) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-389404514737 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((103342925728 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3846480160 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)],
  term ((-2320 : Rat) / 201) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)],
  term ((194969600 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)],
  term ((229420016 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13063133668 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 67) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)],
  term ((6329836871 : Rat) / 1837109850) [(9, 1), (13, 1)],
  term ((-6934665808 : Rat) / 918554925) [(9, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-891593680 : Rat) / 36742197) [(9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (16, 1)],
  term ((2741760 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)],
  term ((255125025176 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(9, 1), (14, 1), (15, 3)],
  term ((94679907244 : Rat) / 24800982975) [(9, 1), (15, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(9, 1), (15, 1), (16, 1)],
  term ((1868257600 : Rat) / 36742197) [(9, 1), (15, 3)],
  term ((571 : Rat) / 134) [(9, 2)],
  term ((-316 : Rat) / 67) [(9, 2), (10, 1)],
  term ((98 : Rat) / 67) [(9, 2), (10, 1), (14, 1)],
  term ((-98 : Rat) / 67) [(9, 2), (10, 2)],
  term ((-44102409344 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 1000 through 1099. -/
theorem rs_R009_ueqv_R009NNNYN_block_19_1000_1099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_19_1000_1099
      rs_R009_ueqv_R009NNNYN_block_19_1000_1099 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
