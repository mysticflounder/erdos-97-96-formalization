/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 19:0-25

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0000 : Poly :=
[
  term ((-18395663741189647274918544069915729142304968723363596421740956526168676821187 : Rat) / 89014314822985877287882576995052711290711423531998626751741270685454848000) []
]

/-- Partial product 0 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0000 : Poly :=
[
  term ((-18395663741189647274918544069915729142304968723363596421740956526168676821187 : Rat) / 44507157411492938643941288497526355645355711765999313375870635342727424000) [(6, 1), (8, 1)],
  term ((18395663741189647274918544069915729142304968723363596421740956526168676821187 : Rat) / 89014314822985877287882576995052711290711423531998626751741270685454848000) [(6, 2)],
  term ((-18395663741189647274918544069915729142304968723363596421740956526168676821187 : Rat) / 44507157411492938643941288497526355645355711765999313375870635342727424000) [(7, 1), (9, 1)],
  term ((18395663741189647274918544069915729142304968723363596421740956526168676821187 : Rat) / 89014314822985877287882576995052711290711423531998626751741270685454848000) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0000_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0000
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0001 : Poly :=
[
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1)]
]

/-- Partial product 1 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0001 : Poly :=
[
  term ((-2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (7, 2)],
  term ((-2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 2), (8, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0001_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0001
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0002 : Poly :=
[
  term ((-1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 1)]
]

/-- Partial product 2 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0002 : Poly :=
[
  term ((-2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (6, 1), (7, 1), (8, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (6, 2), (7, 1)],
  term ((-2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 2), (9, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0002_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0002
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0003 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (9, 1)]
]

/-- Partial product 3 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0003 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (6, 2), (9, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 2)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0003_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0003
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0004 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0004 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0004_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0004
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0005 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (13, 1)]
]

/-- Partial product 5 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0005 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (6, 2), (13, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0005_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0005
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0006 : Poly :=
[
  term ((4937779350716546115310522632619847699782666742442727132265768563036241961851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1)]
]

/-- Partial product 6 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0006 : Poly :=
[
  term ((4937779350716546115310522632619847699782666742442727132265768563036241961851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (6, 1), (8, 1)],
  term ((-4937779350716546115310522632619847699782666742442727132265768563036241961851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (6, 2)],
  term ((4937779350716546115310522632619847699782666742442727132265768563036241961851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (7, 1), (9, 1)],
  term ((-4937779350716546115310522632619847699782666742442727132265768563036241961851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0006_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0006
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0007 : Poly :=
[
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (6, 1)]
]

/-- Partial product 7 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0007 : Poly :=
[
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (6, 1), (7, 2)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (6, 2), (8, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0007_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0007
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0008 : Poly :=
[
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (6, 1), (16, 1)]
]

/-- Partial product 8 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0008 : Poly :=
[
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (6, 2), (8, 1), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0008_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0008
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0009 : Poly :=
[
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (16, 1)]
]

/-- Partial product 9 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0009 : Poly :=
[
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (6, 2), (16, 1)],
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0009_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0009
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0010 : Poly :=
[
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(3, 1), (7, 1)]
]

/-- Partial product 10 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0010 : Poly :=
[
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (6, 1), (7, 1), (8, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(3, 1), (6, 2), (7, 1)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (7, 2), (9, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(3, 1), (7, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0010_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0010
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0011 : Poly :=
[
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 11 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0011 : Poly :=
[
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0011_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0011
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0012 : Poly :=
[
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 1)]
]

/-- Partial product 12 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0012 : Poly :=
[
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 4028665110523067722080892493310575295484784254680972331436566130160672000) [(6, 1), (7, 1), (9, 1)],
  term ((-1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 1), (7, 2)],
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 4028665110523067722080892493310575295484784254680972331436566130160672000) [(6, 2), (8, 1)],
  term ((-1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0012_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0012
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0013 : Poly :=
[
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(6, 1), (16, 1)]
]

/-- Partial product 13 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0013 : Poly :=
[
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(6, 1), (7, 2), (16, 1)],
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(6, 2), (8, 1), (16, 1)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0013_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0013
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0014 : Poly :=
[
  term ((-3149149553489948 : Rat) / 1048898954827367) [(7, 1), (9, 1)]
]

/-- Partial product 14 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0014 : Poly :=
[
  term ((-6298299106979896 : Rat) / 1048898954827367) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(6, 2), (7, 1), (9, 1)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(7, 2), (9, 2)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0014_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0014
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0015 : Poly :=
[
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(8, 1)]
]

/-- Partial product 15 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0015 : Poly :=
[
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 4028665110523067722080892493310575295484784254680972331436566130160672000) [(6, 1), (8, 2)],
  term ((-1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 2), (8, 1)],
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 4028665110523067722080892493310575295484784254680972331436566130160672000) [(7, 1), (8, 1), (9, 1)],
  term ((-1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0015_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0015
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0016 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0016 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0016_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0016
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0017 : Poly :=
[
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(8, 1), (16, 1)]
]

/-- Partial product 17 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0017 : Poly :=
[
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(6, 1), (8, 2), (16, 1)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(6, 2), (8, 1), (16, 1)],
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0017_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0017
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0018 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0018 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0018_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0018
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0019 : Poly :=
[
  term ((-1574574776744974 : Rat) / 3146696864482101) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 19 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0019 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0019_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0019
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0020 : Poly :=
[
  term ((3149149553489948 : Rat) / 3146696864482101) [(9, 1), (15, 1)]
]

/-- Partial product 20 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0020 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 2), (9, 1), (15, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (9, 2), (15, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0020_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0020
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0021 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0021 : Poly :=
[
  term ((25193196427919584 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0021_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0021
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0022 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(9, 2), (16, 1)]
]

/-- Partial product 22 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0022 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 2), (9, 2), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 1), (9, 3), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0022_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0022
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0023 : Poly :=
[
  term ((1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 16114660442092270888323569973242301181939137018723889325746264520642688000) [(15, 2)]
]

/-- Partial product 23 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0023 : Poly :=
[
  term ((1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 1), (8, 1), (15, 2)],
  term ((-1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 16114660442092270888323569973242301181939137018723889325746264520642688000) [(6, 2), (15, 2)],
  term ((1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(7, 1), (9, 1), (15, 2)],
  term ((-1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 16114660442092270888323569973242301181939137018723889325746264520642688000) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0023_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0023
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0024 : Poly :=
[
  term ((11370534228796125233 : Rat) / 10683035854916732895) [(15, 2), (16, 1)]
]

/-- Partial product 24 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0024 : Poly :=
[
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-11370534228796125233 : Rat) / 10683035854916732895) [(6, 2), (15, 2), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-11370534228796125233 : Rat) / 10683035854916732895) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0024_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0024
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 19. -/
def rs_R009_ueqv_R009NYNYN_coefficient_19_0025 : Poly :=
[
  term ((-125075876516757377563 : Rat) / 42732143419666931580) [(16, 1)]
]

/-- Partial product 25 for generator 19. -/
def rs_R009_ueqv_R009NYNYN_partial_19_0025 : Poly :=
[
  term ((-125075876516757377563 : Rat) / 21366071709833465790) [(6, 1), (8, 1), (16, 1)],
  term ((125075876516757377563 : Rat) / 42732143419666931580) [(6, 2), (16, 1)],
  term ((-125075876516757377563 : Rat) / 21366071709833465790) [(7, 1), (9, 1), (16, 1)],
  term ((125075876516757377563 : Rat) / 42732143419666931580) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 19. -/
theorem rs_R009_ueqv_R009NYNYN_partial_19_0025_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_19_0025
        rs_R009_ueqv_R009NYNYN_generator_19_0000_0025 =
      rs_R009_ueqv_R009NYNYN_partial_19_0025 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_19_0000_0025 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_19_0000,
  rs_R009_ueqv_R009NYNYN_partial_19_0001,
  rs_R009_ueqv_R009NYNYN_partial_19_0002,
  rs_R009_ueqv_R009NYNYN_partial_19_0003,
  rs_R009_ueqv_R009NYNYN_partial_19_0004,
  rs_R009_ueqv_R009NYNYN_partial_19_0005,
  rs_R009_ueqv_R009NYNYN_partial_19_0006,
  rs_R009_ueqv_R009NYNYN_partial_19_0007,
  rs_R009_ueqv_R009NYNYN_partial_19_0008,
  rs_R009_ueqv_R009NYNYN_partial_19_0009,
  rs_R009_ueqv_R009NYNYN_partial_19_0010,
  rs_R009_ueqv_R009NYNYN_partial_19_0011,
  rs_R009_ueqv_R009NYNYN_partial_19_0012,
  rs_R009_ueqv_R009NYNYN_partial_19_0013,
  rs_R009_ueqv_R009NYNYN_partial_19_0014,
  rs_R009_ueqv_R009NYNYN_partial_19_0015,
  rs_R009_ueqv_R009NYNYN_partial_19_0016,
  rs_R009_ueqv_R009NYNYN_partial_19_0017,
  rs_R009_ueqv_R009NYNYN_partial_19_0018,
  rs_R009_ueqv_R009NYNYN_partial_19_0019,
  rs_R009_ueqv_R009NYNYN_partial_19_0020,
  rs_R009_ueqv_R009NYNYN_partial_19_0021,
  rs_R009_ueqv_R009NYNYN_partial_19_0022,
  rs_R009_ueqv_R009NYNYN_partial_19_0023,
  rs_R009_ueqv_R009NYNYN_partial_19_0024,
  rs_R009_ueqv_R009NYNYN_partial_19_0025
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_19_0000_0025 : Poly :=
[
  term ((-2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (7, 1), (9, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 1), (7, 2)],
  term ((-2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 2), (8, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(0, 1), (6, 3)],
  term ((-2114301505901779761644920057797014493764250032464863448 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (6, 1), (7, 1), (8, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (6, 1), (8, 1), (9, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (6, 2), (7, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(1, 1), (6, 2), (9, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (6, 2), (13, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 2)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-2702289616079837584573578840357442277772908447281989508 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 2), (9, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(1, 1), (7, 2), (13, 1)],
  term ((1057150752950889880822460028898507246882125016232431724 : Rat) / 587530160515749714170802100468592505314177950397565345) [(1, 1), (7, 3)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (6, 1), (7, 1), (9, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (6, 1), (7, 2)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((4937779350716546115310522632619847699782666742442727132265768563036241961851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (6, 1), (8, 1)],
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (6, 1), (8, 1), (16, 1)],
  term ((-4937779350716546115310522632619847699782666742442727132265768563036241961851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (6, 2)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (6, 2), (8, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (6, 2), (8, 1), (16, 1)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (6, 2), (16, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (6, 3)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (6, 3), (16, 1)],
  term ((4937779350716546115310522632619847699782666742442727132265768563036241961851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(2, 1), (7, 1), (9, 1)],
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((-4937779350716546115310522632619847699782666742442727132265768563036241961851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(2, 1), (7, 2)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(2, 1), (7, 2), (16, 1)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (6, 1), (7, 1), (8, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(3, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(3, 1), (6, 2), (7, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 16690184029309851991477983186572383367008391912249742515951488253522784000) [(3, 1), (7, 2), (9, 1)],
  term ((-45482136915184500932 : Rat) / 10683035854916732895) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((5054701702925873797201043114832682271103257536185303441017442092247478185851 : Rat) / 33380368058619703982955966373144766734016783824499485031902976507045568000) [(3, 1), (7, 3)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(3, 1), (7, 3), (16, 1)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(6, 1), (7, 1), (8, 1), (9, 1)],
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 4028665110523067722080892493310575295484784254680972331436566130160672000) [(6, 1), (7, 1), (9, 1)],
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 1), (7, 2)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(6, 1), (7, 2), (16, 1)],
  term ((-18395663741189647274918544069915729142304968723363596421740956526168676821187 : Rat) / 44507157411492938643941288497526355645355711765999313375870635342727424000) [(6, 1), (8, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 1), (8, 1), (9, 2), (16, 1)],
  term ((1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 1), (8, 1), (15, 2)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-125075876516757377563 : Rat) / 21366071709833465790) [(6, 1), (8, 1), (16, 1)],
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 4028665110523067722080892493310575295484784254680972331436566130160672000) [(6, 1), (8, 2)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(6, 1), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(6, 1), (8, 2), (16, 1)],
  term ((18395663741189647274918544069915729142304968723363596421740956526168676821187 : Rat) / 89014314822985877287882576995052711290711423531998626751741270685454848000) [(6, 2)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(6, 2), (7, 1), (9, 1)],
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 2), (8, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(6, 2), (8, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(6, 2), (9, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 2), (9, 2), (16, 1)],
  term ((-1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 16114660442092270888323569973242301181939137018723889325746264520642688000) [(6, 2), (15, 2)],
  term ((-11370534228796125233 : Rat) / 10683035854916732895) [(6, 2), (15, 2), (16, 1)],
  term ((125075876516757377563 : Rat) / 42732143419666931580) [(6, 2), (16, 1)],
  term ((-1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(6, 3)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(6, 3), (16, 1)],
  term ((1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 4028665110523067722080892493310575295484784254680972331436566130160672000) [(7, 1), (8, 1), (9, 1)],
  term ((45482136915184500932 : Rat) / 10683035854916732895) [(7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-18395663741189647274918544069915729142304968723363596421740956526168676821187 : Rat) / 44507157411492938643941288497526355645355711765999313375870635342727424000) [(7, 1), (9, 1)],
  term ((1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(7, 1), (9, 1), (15, 2)],
  term ((22741068457592250466 : Rat) / 10683035854916732895) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-125075876516757377563 : Rat) / 21366071709833465790) [(7, 1), (9, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (9, 2), (15, 1)],
  term ((25193196427919584 : Rat) / 3146696864482101) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 1), (9, 3), (16, 1)],
  term ((18395663741189647274918544069915729142304968723363596421740956526168676821187 : Rat) / 89014314822985877287882576995052711290711423531998626751741270685454848000) [(7, 2)],
  term ((-1234598071396672465744759814598802645140604294899388393820962487325983424833 : Rat) / 8057330221046135444161784986621150590969568509361944662873132260321344000) [(7, 2), (8, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-22741068457592250466 : Rat) / 10683035854916732895) [(7, 2), (8, 1), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1574574776744974 : Rat) / 3146696864482101) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 2), (9, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 1048898954827367) [(7, 2), (9, 2)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 2), (9, 2), (16, 1)],
  term ((-1242661681893867478288933640958308477645472625502324690976250316926758336833 : Rat) / 16114660442092270888323569973242301181939137018723889325746264520642688000) [(7, 2), (15, 2)],
  term ((-11370534228796125233 : Rat) / 10683035854916732895) [(7, 2), (15, 2), (16, 1)],
  term ((125075876516757377563 : Rat) / 42732143419666931580) [(7, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 1048898954827367) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 25. -/
theorem rs_R009_ueqv_R009NYNYN_block_19_0000_0025_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_19_0000_0025
      rs_R009_ueqv_R009NYNYN_block_19_0000_0025 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
