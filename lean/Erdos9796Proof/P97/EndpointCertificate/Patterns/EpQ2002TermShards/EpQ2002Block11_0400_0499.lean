/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 11:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_11_0400_0499 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0400 : Poly :=
[
  term ((96435431313 : Rat) / 7401317245) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 11. -/
def ep_Q2_002_partial_11_0400 : Poly :=
[
  term ((192870862626 : Rat) / 7401317245) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96435431313 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-96435431313 : Rat) / 7401317245) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((192870862626 : Rat) / 7401317245) [(3, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 11. -/
theorem ep_Q2_002_partial_11_0400_valid :
    mulPoly ep_Q2_002_coefficient_11_0400
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0401 : Poly :=
[
  term ((-155231234939440596818520715072248 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1)]
]

/-- Partial product 401 for generator 11. -/
def ep_Q2_002_partial_11_0401 : Poly :=
[
  term ((-310462469878881193637041430144496 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((155231234939440596818520715072248 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 2)],
  term ((155231234939440596818520715072248 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (15, 2)],
  term ((-310462469878881193637041430144496 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 11. -/
theorem ep_Q2_002_partial_11_0401_valid :
    mulPoly ep_Q2_002_coefficient_11_0401
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0402 : Poly :=
[
  term ((-33287582444194308137302204267752 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 402 for generator 11. -/
def ep_Q2_002_partial_11_0402 : Poly :=
[
  term ((-66575164888388616274604408535504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((33287582444194308137302204267752 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((33287582444194308137302204267752 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 3)],
  term ((-66575164888388616274604408535504 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 11. -/
theorem ep_Q2_002_partial_11_0402_valid :
    mulPoly ep_Q2_002_coefficient_11_0402
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0403 : Poly :=
[
  term ((127758982487988572425195883360888385338712 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 403 for generator 11. -/
def ep_Q2_002_partial_11_0403 : Poly :=
[
  term ((255517964975977144850391766721776770677424 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-127758982487988572425195883360888385338712 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-127758982487988572425195883360888385338712 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (13, 1), (15, 4)],
  term ((255517964975977144850391766721776770677424 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 11. -/
theorem ep_Q2_002_partial_11_0403_valid :
    mulPoly ep_Q2_002_coefficient_11_0403
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0404 : Poly :=
[
  term ((-10904829414 : Rat) / 7401317245) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 404 for generator 11. -/
def ep_Q2_002_partial_11_0404 : Poly :=
[
  term ((-21809658828 : Rat) / 7401317245) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((10904829414 : Rat) / 7401317245) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((10904829414 : Rat) / 7401317245) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-21809658828 : Rat) / 7401317245) [(3, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 11. -/
theorem ep_Q2_002_partial_11_0404_valid :
    mulPoly ep_Q2_002_coefficient_11_0404
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0405 : Poly :=
[
  term ((-137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 2), (15, 1)]
]

/-- Partial product 405 for generator 11. -/
def ep_Q2_002_partial_11_0405 : Poly :=
[
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 2), (15, 3)],
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 11. -/
theorem ep_Q2_002_partial_11_0405_valid :
    mulPoly ep_Q2_002_coefficient_11_0405
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0406 : Poly :=
[
  term ((97834224838924898667531977230354918870003 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 406 for generator 11. -/
def ep_Q2_002_partial_11_0406 : Poly :=
[
  term ((195668449677849797335063954460709837740006 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-97834224838924898667531977230354918870003 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (14, 1), (15, 3)],
  term ((-97834224838924898667531977230354918870003 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (14, 3), (15, 1)],
  term ((195668449677849797335063954460709837740006 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 11. -/
theorem ep_Q2_002_partial_11_0406_valid :
    mulPoly ep_Q2_002_coefficient_11_0406
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0407 : Poly :=
[
  term ((6833897911 : Rat) / 17763161388) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 11. -/
def ep_Q2_002_partial_11_0407 : Poly :=
[
  term ((6833897911 : Rat) / 8881580694) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6833897911 : Rat) / 17763161388) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6833897911 : Rat) / 17763161388) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((6833897911 : Rat) / 8881580694) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 11. -/
theorem ep_Q2_002_partial_11_0407_valid :
    mulPoly ep_Q2_002_coefficient_11_0407
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0408 : Poly :=
[
  term ((1528036932616938401612533630456001867294857 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 1)]
]

/-- Partial product 408 for generator 11. -/
def ep_Q2_002_partial_11_0408 : Poly :=
[
  term ((3056073865233876803225067260912003734589714 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-1528036932616938401612533630456001867294857 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 2), (15, 1)],
  term ((-1528036932616938401612533630456001867294857 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 3)],
  term ((3056073865233876803225067260912003734589714 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 11. -/
theorem ep_Q2_002_partial_11_0408_valid :
    mulPoly ep_Q2_002_coefficient_11_0408
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0409 : Poly :=
[
  term ((-35350929301 : Rat) / 29605268980) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 11. -/
def ep_Q2_002_partial_11_0409 : Poly :=
[
  term ((-35350929301 : Rat) / 14802634490) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((35350929301 : Rat) / 29605268980) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((35350929301 : Rat) / 29605268980) [(3, 1), (15, 3), (16, 1)],
  term ((-35350929301 : Rat) / 14802634490) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 11. -/
theorem ep_Q2_002_partial_11_0409_valid :
    mulPoly ep_Q2_002_coefficient_11_0409
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0410 : Poly :=
[
  term ((-805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 3)]
]

/-- Partial product 410 for generator 11. -/
def ep_Q2_002_partial_11_0410 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 2), (15, 3)],
  term ((805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 5)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 11. -/
theorem ep_Q2_002_partial_11_0410_valid :
    mulPoly ep_Q2_002_coefficient_11_0410
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0411 : Poly :=
[
  term ((-79237851682 : Rat) / 22203951735) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 411 for generator 11. -/
def ep_Q2_002_partial_11_0411 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((79237851682 : Rat) / 22203951735) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((79237851682 : Rat) / 22203951735) [(3, 1), (15, 5), (16, 1)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 11. -/
theorem ep_Q2_002_partial_11_0411_valid :
    mulPoly ep_Q2_002_coefficient_11_0411
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0412 : Poly :=
[
  term ((8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (11, 1)]
]

/-- Partial product 412 for generator 11. -/
def ep_Q2_002_partial_11_0412 : Poly :=
[
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 2)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 11. -/
theorem ep_Q2_002_partial_11_0412_valid :
    mulPoly ep_Q2_002_coefficient_11_0412
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0413 : Poly :=
[
  term ((-15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (13, 1)]
]

/-- Partial product 413 for generator 11. -/
def ep_Q2_002_partial_11_0413 : Poly :=
[
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 2)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 11. -/
theorem ep_Q2_002_partial_11_0413_valid :
    mulPoly ep_Q2_002_coefficient_11_0413
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0414 : Poly :=
[
  term ((-449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 1), (15, 1)]
]

/-- Partial product 414 for generator 11. -/
def ep_Q2_002_partial_11_0414 : Poly :=
[
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (5, 1), (6, 1), (15, 2)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 1), (14, 2), (15, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 11. -/
theorem ep_Q2_002_partial_11_0414_valid :
    mulPoly ep_Q2_002_coefficient_11_0414
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0415 : Poly :=
[
  term ((-190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 11. -/
def ep_Q2_002_partial_11_0415 : Poly :=
[
  term ((-381790635174 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 11. -/
theorem ep_Q2_002_partial_11_0415_valid :
    mulPoly ep_Q2_002_coefficient_11_0415
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0416 : Poly :=
[
  term ((-61815322465527511165681997306496 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 416 for generator 11. -/
def ep_Q2_002_partial_11_0416 : Poly :=
[
  term ((-123630644931055022331363994612992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((-123630644931055022331363994612992 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((61815322465527511165681997306496 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 2)],
  term ((61815322465527511165681997306496 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 11. -/
theorem ep_Q2_002_partial_11_0416_valid :
    mulPoly ep_Q2_002_coefficient_11_0416
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0417 : Poly :=
[
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 417 for generator 11. -/
def ep_Q2_002_partial_11_0417 : Poly :=
[
  term ((-310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 11. -/
theorem ep_Q2_002_partial_11_0417_valid :
    mulPoly ep_Q2_002_coefficient_11_0417
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0418 : Poly :=
[
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 418 for generator 11. -/
def ep_Q2_002_partial_11_0418 : Poly :=
[
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 2)],
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 11. -/
theorem ep_Q2_002_partial_11_0418_valid :
    mulPoly ep_Q2_002_coefficient_11_0418
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0419 : Poly :=
[
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 419 for generator 11. -/
def ep_Q2_002_partial_11_0419 : Poly :=
[
  term ((584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 11. -/
theorem ep_Q2_002_partial_11_0419_valid :
    mulPoly ep_Q2_002_coefficient_11_0419
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0420 : Poly :=
[
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 420 for generator 11. -/
def ep_Q2_002_partial_11_0420 : Poly :=
[
  term ((3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 11. -/
theorem ep_Q2_002_partial_11_0420_valid :
    mulPoly ep_Q2_002_coefficient_11_0420
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0421 : Poly :=
[
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 421 for generator 11. -/
def ep_Q2_002_partial_11_0421 : Poly :=
[
  term ((300100471816 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((300100471816 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 11. -/
theorem ep_Q2_002_partial_11_0421_valid :
    mulPoly ep_Q2_002_coefficient_11_0421
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0422 : Poly :=
[
  term ((116409828469390134513900844165632 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 422 for generator 11. -/
def ep_Q2_002_partial_11_0422 : Poly :=
[
  term ((232819656938780269027801688331264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((232819656938780269027801688331264 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((-116409828469390134513900844165632 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((-116409828469390134513900844165632 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 11. -/
theorem ep_Q2_002_partial_11_0422_valid :
    mulPoly ep_Q2_002_coefficient_11_0422
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0423 : Poly :=
[
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 423 for generator 11. -/
def ep_Q2_002_partial_11_0423 : Poly :=
[
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 2)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 11. -/
theorem ep_Q2_002_partial_11_0423_valid :
    mulPoly ep_Q2_002_coefficient_11_0423
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0424 : Poly :=
[
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 424 for generator 11. -/
def ep_Q2_002_partial_11_0424 : Poly :=
[
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (14, 2), (15, 1)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (14, 1), (15, 2)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (14, 1), (15, 3)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 11. -/
theorem ep_Q2_002_partial_11_0424_valid :
    mulPoly ep_Q2_002_coefficient_11_0424
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0425 : Poly :=
[
  term ((7782778567 : Rat) / 4440790347) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 425 for generator 11. -/
def ep_Q2_002_partial_11_0425 : Poly :=
[
  term ((15565557134 : Rat) / 4440790347) [(2, 1), (4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((15565557134 : Rat) / 4440790347) [(3, 1), (4, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7782778567 : Rat) / 4440790347) [(4, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-7782778567 : Rat) / 4440790347) [(4, 1), (5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 11. -/
theorem ep_Q2_002_partial_11_0425_valid :
    mulPoly ep_Q2_002_coefficient_11_0425
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0426 : Poly :=
[
  term ((6140748594887150202683732469956273822289744 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 426 for generator 11. -/
def ep_Q2_002_partial_11_0426 : Poly :=
[
  term ((12281497189774300405367464939912547644579488 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((12281497189774300405367464939912547644579488 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((-6140748594887150202683732469956273822289744 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-6140748594887150202683732469956273822289744 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 11. -/
theorem ep_Q2_002_partial_11_0426_valid :
    mulPoly ep_Q2_002_coefficient_11_0426
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0427 : Poly :=
[
  term ((611599845596 : Rat) / 22203951735) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 11. -/
def ep_Q2_002_partial_11_0427 : Poly :=
[
  term ((1223199691192 : Rat) / 22203951735) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1223199691192 : Rat) / 22203951735) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-611599845596 : Rat) / 22203951735) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-611599845596 : Rat) / 22203951735) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 11. -/
theorem ep_Q2_002_partial_11_0427_valid :
    mulPoly ep_Q2_002_coefficient_11_0427
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0428 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (11, 1)]
]

/-- Partial product 428 for generator 11. -/
def ep_Q2_002_partial_11_0428 : Poly :=
[
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 2)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 11. -/
theorem ep_Q2_002_partial_11_0428_valid :
    mulPoly ep_Q2_002_coefficient_11_0428
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0429 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (13, 1)]
]

/-- Partial product 429 for generator 11. -/
def ep_Q2_002_partial_11_0429 : Poly :=
[
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 2)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 11. -/
theorem ep_Q2_002_partial_11_0429_valid :
    mulPoly ep_Q2_002_coefficient_11_0429
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0430 : Poly :=
[
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 430 for generator 11. -/
def ep_Q2_002_partial_11_0430 : Poly :=
[
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 11. -/
theorem ep_Q2_002_partial_11_0430_valid :
    mulPoly ep_Q2_002_coefficient_11_0430
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0431 : Poly :=
[
  term ((-88171245013 : Rat) / 7401317245) [(4, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 11. -/
def ep_Q2_002_partial_11_0431 : Poly :=
[
  term ((-176342490026 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 11. -/
theorem ep_Q2_002_partial_11_0431_valid :
    mulPoly ep_Q2_002_coefficient_11_0431
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0432 : Poly :=
[
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 432 for generator 11. -/
def ep_Q2_002_partial_11_0432 : Poly :=
[
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 11. -/
theorem ep_Q2_002_partial_11_0432_valid :
    mulPoly ep_Q2_002_coefficient_11_0432
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0433 : Poly :=
[
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 433 for generator 11. -/
def ep_Q2_002_partial_11_0433 : Poly :=
[
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 11. -/
theorem ep_Q2_002_partial_11_0433_valid :
    mulPoly ep_Q2_002_coefficient_11_0433
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0434 : Poly :=
[
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 434 for generator 11. -/
def ep_Q2_002_partial_11_0434 : Poly :=
[
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 11. -/
theorem ep_Q2_002_partial_11_0434_valid :
    mulPoly ep_Q2_002_coefficient_11_0434
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0435 : Poly :=
[
  term ((-97514072568 : Rat) / 7401317245) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 435 for generator 11. -/
def ep_Q2_002_partial_11_0435 : Poly :=
[
  term ((-195028145136 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((97514072568 : Rat) / 7401317245) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((97514072568 : Rat) / 7401317245) [(4, 1), (6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 11. -/
theorem ep_Q2_002_partial_11_0435_valid :
    mulPoly ep_Q2_002_coefficient_11_0435
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0436 : Poly :=
[
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 436 for generator 11. -/
def ep_Q2_002_partial_11_0436 : Poly :=
[
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 11. -/
theorem ep_Q2_002_partial_11_0436_valid :
    mulPoly ep_Q2_002_coefficient_11_0436
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0437 : Poly :=
[
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 437 for generator 11. -/
def ep_Q2_002_partial_11_0437 : Poly :=
[
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 11. -/
theorem ep_Q2_002_partial_11_0437_valid :
    mulPoly ep_Q2_002_coefficient_11_0437
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0438 : Poly :=
[
  term ((-1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 438 for generator 11. -/
def ep_Q2_002_partial_11_0438 : Poly :=
[
  term ((-2376406475382967311677577214749255393732288 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2376406475382967311677577214749255393732288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 11. -/
theorem ep_Q2_002_partial_11_0438_valid :
    mulPoly ep_Q2_002_coefficient_11_0438
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0439 : Poly :=
[
  term ((-56063165212 : Rat) / 7401317245) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 11. -/
def ep_Q2_002_partial_11_0439 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 11. -/
theorem ep_Q2_002_partial_11_0439_valid :
    mulPoly ep_Q2_002_coefficient_11_0439
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0440 : Poly :=
[
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 2)]
]

/-- Partial product 440 for generator 11. -/
def ep_Q2_002_partial_11_0440 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 2), (14, 2)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 11. -/
theorem ep_Q2_002_partial_11_0440_valid :
    mulPoly ep_Q2_002_coefficient_11_0440
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0441 : Poly :=
[
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (15, 2)]
]

/-- Partial product 441 for generator 11. -/
def ep_Q2_002_partial_11_0441 : Poly :=
[
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 3)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (14, 2), (15, 2)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 11. -/
theorem ep_Q2_002_partial_11_0441_valid :
    mulPoly ep_Q2_002_coefficient_11_0441
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0442 : Poly :=
[
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 442 for generator 11. -/
def ep_Q2_002_partial_11_0442 : Poly :=
[
  term ((-300100471816 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-300100471816 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 11. -/
theorem ep_Q2_002_partial_11_0442_valid :
    mulPoly ep_Q2_002_coefficient_11_0442
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0443 : Poly :=
[
  term ((-569477153819262447993121332431364 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 443 for generator 11. -/
def ep_Q2_002_partial_11_0443 : Poly :=
[
  term ((-1138954307638524895986242664862728 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-1138954307638524895986242664862728 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((569477153819262447993121332431364 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((569477153819262447993121332431364 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 11. -/
theorem ep_Q2_002_partial_11_0443_valid :
    mulPoly ep_Q2_002_coefficient_11_0443
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0444 : Poly :=
[
  term ((-223222974288517911567627896390136 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 444 for generator 11. -/
def ep_Q2_002_partial_11_0444 : Poly :=
[
  term ((-446445948577035823135255792780272 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 2)],
  term ((-446445948577035823135255792780272 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((223222974288517911567627896390136 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((223222974288517911567627896390136 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 11. -/
theorem ep_Q2_002_partial_11_0444_valid :
    mulPoly ep_Q2_002_coefficient_11_0444
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0445 : Poly :=
[
  term ((1072432127654211413969067357097488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 445 for generator 11. -/
def ep_Q2_002_partial_11_0445 : Poly :=
[
  term ((2144864255308422827938134714194976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((2144864255308422827938134714194976 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1072432127654211413969067357097488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((-1072432127654211413969067357097488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 11. -/
theorem ep_Q2_002_partial_11_0445_valid :
    mulPoly ep_Q2_002_coefficient_11_0445
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0446 : Poly :=
[
  term ((420370663953822733963900703980512 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 446 for generator 11. -/
def ep_Q2_002_partial_11_0446 : Poly :=
[
  term ((840741327907645467927801407961024 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 2)],
  term ((840741327907645467927801407961024 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-420370663953822733963900703980512 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-420370663953822733963900703980512 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 11. -/
theorem ep_Q2_002_partial_11_0446_valid :
    mulPoly ep_Q2_002_coefficient_11_0446
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0447 : Poly :=
[
  term ((1322144440678332907091338143744396510841188 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 447 for generator 11. -/
def ep_Q2_002_partial_11_0447 : Poly :=
[
  term ((2644288881356665814182676287488793021682376 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((2644288881356665814182676287488793021682376 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((-1322144440678332907091338143744396510841188 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((-1322144440678332907091338143744396510841188 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 11. -/
theorem ep_Q2_002_partial_11_0447_valid :
    mulPoly ep_Q2_002_coefficient_11_0447
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0448 : Poly :=
[
  term ((538321952737 : Rat) / 22203951735) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 11. -/
def ep_Q2_002_partial_11_0448 : Poly :=
[
  term ((1076643905474 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((1076643905474 : Rat) / 22203951735) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-538321952737 : Rat) / 22203951735) [(4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-538321952737 : Rat) / 22203951735) [(4, 1), (7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 11. -/
theorem ep_Q2_002_partial_11_0448_valid :
    mulPoly ep_Q2_002_coefficient_11_0448
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0449 : Poly :=
[
  term ((-1878047313506278591632460030709460552458862 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 449 for generator 11. -/
def ep_Q2_002_partial_11_0449 : Poly :=
[
  term ((-3756094627012557183264920061418921104917724 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-3756094627012557183264920061418921104917724 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((1878047313506278591632460030709460552458862 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((1878047313506278591632460030709460552458862 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 11. -/
theorem ep_Q2_002_partial_11_0449_valid :
    mulPoly ep_Q2_002_coefficient_11_0449
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0450 : Poly :=
[
  term ((629858494543 : Rat) / 14802634490) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 450 for generator 11. -/
def ep_Q2_002_partial_11_0450 : Poly :=
[
  term ((629858494543 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((629858494543 : Rat) / 7401317245) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((-629858494543 : Rat) / 14802634490) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-629858494543 : Rat) / 14802634490) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 11. -/
theorem ep_Q2_002_partial_11_0450_valid :
    mulPoly ep_Q2_002_coefficient_11_0450
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0451 : Poly :=
[
  term ((-143948423504311431894328106844576 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 451 for generator 11. -/
def ep_Q2_002_partial_11_0451 : Poly :=
[
  term ((-287896847008622863788656213689152 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-287896847008622863788656213689152 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((143948423504311431894328106844576 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((143948423504311431894328106844576 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 11. -/
theorem ep_Q2_002_partial_11_0451_valid :
    mulPoly ep_Q2_002_coefficient_11_0451
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0452 : Poly :=
[
  term ((35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 452 for generator 11. -/
def ep_Q2_002_partial_11_0452 : Poly :=
[
  term ((70009733193456992020180447445856 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((70009733193456992020180447445856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 11. -/
theorem ep_Q2_002_partial_11_0452_valid :
    mulPoly ep_Q2_002_coefficient_11_0452
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0453 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 453 for generator 11. -/
def ep_Q2_002_partial_11_0453 : Poly :=
[
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 11. -/
theorem ep_Q2_002_partial_11_0453_valid :
    mulPoly ep_Q2_002_coefficient_11_0453
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0454 : Poly :=
[
  term ((-65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 454 for generator 11. -/
def ep_Q2_002_partial_11_0454 : Poly :=
[
  term ((-131841438452141049047629271866752 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-131841438452141049047629271866752 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 11. -/
theorem ep_Q2_002_partial_11_0454_valid :
    mulPoly ep_Q2_002_coefficient_11_0454
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0455 : Poly :=
[
  term ((-13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 455 for generator 11. -/
def ep_Q2_002_partial_11_0455 : Poly :=
[
  term ((-26216078969019318766629871418448579110736 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-26216078969019318766629871418448579110736 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 11. -/
theorem ep_Q2_002_partial_11_0455_valid :
    mulPoly ep_Q2_002_coefficient_11_0455
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0456 : Poly :=
[
  term ((-26206208982 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 456 for generator 11. -/
def ep_Q2_002_partial_11_0456 : Poly :=
[
  term ((-52412417964 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52412417964 : Rat) / 7401317245) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((26206208982 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((26206208982 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 11. -/
theorem ep_Q2_002_partial_11_0456_valid :
    mulPoly ep_Q2_002_coefficient_11_0456
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0457 : Poly :=
[
  term ((271081838939219100297078926308992 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 457 for generator 11. -/
def ep_Q2_002_partial_11_0457 : Poly :=
[
  term ((542163677878438200594157852617984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((542163677878438200594157852617984 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((-271081838939219100297078926308992 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((-271081838939219100297078926308992 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 11. -/
theorem ep_Q2_002_partial_11_0457_valid :
    mulPoly ep_Q2_002_coefficient_11_0457
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0458 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 458 for generator 11. -/
def ep_Q2_002_partial_11_0458 : Poly :=
[
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 2)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 11. -/
theorem ep_Q2_002_partial_11_0458_valid :
    mulPoly ep_Q2_002_coefficient_11_0458
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0459 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 459 for generator 11. -/
def ep_Q2_002_partial_11_0459 : Poly :=
[
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 11. -/
theorem ep_Q2_002_partial_11_0459_valid :
    mulPoly ep_Q2_002_coefficient_11_0459
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0460 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 11. -/
def ep_Q2_002_partial_11_0460 : Poly :=
[
  term ((65009381712 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((65009381712 : Rat) / 7401317245) [(3, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 11. -/
theorem ep_Q2_002_partial_11_0460_valid :
    mulPoly ep_Q2_002_coefficient_11_0460
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0461 : Poly :=
[
  term ((1100312183846855778921284622375148615256616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 461 for generator 11. -/
def ep_Q2_002_partial_11_0461 : Poly :=
[
  term ((2200624367693711557842569244750297230513232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((2200624367693711557842569244750297230513232 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((-1100312183846855778921284622375148615256616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-1100312183846855778921284622375148615256616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 11. -/
theorem ep_Q2_002_partial_11_0461_valid :
    mulPoly ep_Q2_002_coefficient_11_0461
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0462 : Poly :=
[
  term ((122112241278 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 11. -/
def ep_Q2_002_partial_11_0462 : Poly :=
[
  term ((244224482556 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((244224482556 : Rat) / 7401317245) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-122112241278 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-122112241278 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 11. -/
theorem ep_Q2_002_partial_11_0462_valid :
    mulPoly ep_Q2_002_coefficient_11_0462
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0463 : Poly :=
[
  term ((-111702773398650873552489863135124 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 463 for generator 11. -/
def ep_Q2_002_partial_11_0463 : Poly :=
[
  term ((-223405546797301747104979726270248 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-223405546797301747104979726270248 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((111702773398650873552489863135124 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((111702773398650873552489863135124 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 11. -/
theorem ep_Q2_002_partial_11_0463_valid :
    mulPoly ep_Q2_002_coefficient_11_0463
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0464 : Poly :=
[
  term ((241754142184692935674905546212525148774288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 464 for generator 11. -/
def ep_Q2_002_partial_11_0464 : Poly :=
[
  term ((483508284369385871349811092425050297548576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((483508284369385871349811092425050297548576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((-241754142184692935674905546212525148774288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-241754142184692935674905546212525148774288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 11. -/
theorem ep_Q2_002_partial_11_0464_valid :
    mulPoly ep_Q2_002_coefficient_11_0464
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0465 : Poly :=
[
  term ((-5130926716 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 465 for generator 11. -/
def ep_Q2_002_partial_11_0465 : Poly :=
[
  term ((-10261853432 : Rat) / 7401317245) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10261853432 : Rat) / 7401317245) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 11. -/
theorem ep_Q2_002_partial_11_0465_valid :
    mulPoly ep_Q2_002_coefficient_11_0465
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0466 : Poly :=
[
  term ((12299854991590288272886871265396 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 466 for generator 11. -/
def ep_Q2_002_partial_11_0466 : Poly :=
[
  term ((24599709983180576545773742530792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((24599709983180576545773742530792 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-12299854991590288272886871265396 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-12299854991590288272886871265396 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 11. -/
theorem ep_Q2_002_partial_11_0466_valid :
    mulPoly ep_Q2_002_coefficient_11_0466
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0467 : Poly :=
[
  term ((16862578520217549205530408665904 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 467 for generator 11. -/
def ep_Q2_002_partial_11_0467 : Poly :=
[
  term ((33725157040435098411060817331808 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 2)],
  term ((33725157040435098411060817331808 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-16862578520217549205530408665904 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-16862578520217549205530408665904 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 11. -/
theorem ep_Q2_002_partial_11_0467_valid :
    mulPoly ep_Q2_002_coefficient_11_0467
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0468 : Poly :=
[
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 468 for generator 11. -/
def ep_Q2_002_partial_11_0468 : Poly :=
[
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (14, 2), (15, 1)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 1), (15, 2)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 11. -/
theorem ep_Q2_002_partial_11_0468_valid :
    mulPoly ep_Q2_002_coefficient_11_0468
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0469 : Poly :=
[
  term ((8990116940749981607226363085014938087052 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 469 for generator 11. -/
def ep_Q2_002_partial_11_0469 : Poly :=
[
  term ((17980233881499963214452726170029876174104 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((17980233881499963214452726170029876174104 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((-8990116940749981607226363085014938087052 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-8990116940749981607226363085014938087052 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 11. -/
theorem ep_Q2_002_partial_11_0469_valid :
    mulPoly ep_Q2_002_coefficient_11_0469
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0470 : Poly :=
[
  term ((42906632336 : Rat) / 7401317245) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 470 for generator 11. -/
def ep_Q2_002_partial_11_0470 : Poly :=
[
  term ((85813264672 : Rat) / 7401317245) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((85813264672 : Rat) / 7401317245) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-42906632336 : Rat) / 7401317245) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-42906632336 : Rat) / 7401317245) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 11. -/
theorem ep_Q2_002_partial_11_0470_valid :
    mulPoly ep_Q2_002_coefficient_11_0470
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0471 : Poly :=
[
  term ((-63727815577937193272219016332736 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2)]
]

/-- Partial product 471 for generator 11. -/
def ep_Q2_002_partial_11_0471 : Poly :=
[
  term ((-127455631155874386544438032665472 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 2), (14, 1)],
  term ((-127455631155874386544438032665472 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((63727815577937193272219016332736 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (14, 2)],
  term ((63727815577937193272219016332736 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 11. -/
theorem ep_Q2_002_partial_11_0471_valid :
    mulPoly ep_Q2_002_coefficient_11_0471
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0472 : Poly :=
[
  term ((21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 1)]
]

/-- Partial product 472 for generator 11. -/
def ep_Q2_002_partial_11_0472 : Poly :=
[
  term ((42499062132911791212953868662592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1)],
  term ((42499062132911791212953868662592 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 1), (14, 2)],
  term ((-21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 11. -/
theorem ep_Q2_002_partial_11_0472_valid :
    mulPoly ep_Q2_002_coefficient_11_0472
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0473 : Poly :=
[
  term ((-565832677740030724059368520174188032525128 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 473 for generator 11. -/
def ep_Q2_002_partial_11_0473 : Poly :=
[
  term ((-1131665355480061448118737040348376065050256 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1131665355480061448118737040348376065050256 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((565832677740030724059368520174188032525128 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((565832677740030724059368520174188032525128 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 11. -/
theorem ep_Q2_002_partial_11_0473_valid :
    mulPoly ep_Q2_002_coefficient_11_0473
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0474 : Poly :=
[
  term ((26874136301 : Rat) / 7401317245) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 474 for generator 11. -/
def ep_Q2_002_partial_11_0474 : Poly :=
[
  term ((53748272602 : Rat) / 7401317245) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((53748272602 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-26874136301 : Rat) / 7401317245) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26874136301 : Rat) / 7401317245) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 11. -/
theorem ep_Q2_002_partial_11_0474_valid :
    mulPoly ep_Q2_002_coefficient_11_0474
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0475 : Poly :=
[
  term ((134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 2)]
]

/-- Partial product 475 for generator 11. -/
def ep_Q2_002_partial_11_0475 : Poly :=
[
  term ((269996050446337912635887820244128 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 2), (14, 1)],
  term ((269996050446337912635887820244128 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 2), (15, 1)],
  term ((-134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 2), (14, 2)],
  term ((-134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 11. -/
theorem ep_Q2_002_partial_11_0475_valid :
    mulPoly ep_Q2_002_coefficient_11_0475
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0476 : Poly :=
[
  term ((241873117722098559755276947519221020646000 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 476 for generator 11. -/
def ep_Q2_002_partial_11_0476 : Poly :=
[
  term ((483746235444197119510553895038442041292000 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((483746235444197119510553895038442041292000 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (12, 1), (15, 3)],
  term ((-241873117722098559755276947519221020646000 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term ((-241873117722098559755276947519221020646000 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 11. -/
theorem ep_Q2_002_partial_11_0476_valid :
    mulPoly ep_Q2_002_coefficient_11_0476
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0477 : Poly :=
[
  term ((15286678100 : Rat) / 1480263449) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 477 for generator 11. -/
def ep_Q2_002_partial_11_0477 : Poly :=
[
  term ((30573356200 : Rat) / 1480263449) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((30573356200 : Rat) / 1480263449) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((-15286678100 : Rat) / 1480263449) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-15286678100 : Rat) / 1480263449) [(4, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 11. -/
theorem ep_Q2_002_partial_11_0477_valid :
    mulPoly ep_Q2_002_coefficient_11_0477
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0478 : Poly :=
[
  term ((-360459341974721249870464442738680897980816 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 478 for generator 11. -/
def ep_Q2_002_partial_11_0478 : Poly :=
[
  term ((-720918683949442499740928885477361795961632 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-720918683949442499740928885477361795961632 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((360459341974721249870464442738680897980816 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 1), (15, 3)],
  term ((360459341974721249870464442738680897980816 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 11. -/
theorem ep_Q2_002_partial_11_0478_valid :
    mulPoly ep_Q2_002_coefficient_11_0478
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0479 : Poly :=
[
  term ((-2910032184 : Rat) / 1057331035) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 11. -/
def ep_Q2_002_partial_11_0479 : Poly :=
[
  term ((-5820064368 : Rat) / 1057331035) [(2, 1), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5820064368 : Rat) / 1057331035) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2910032184 : Rat) / 1057331035) [(4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((2910032184 : Rat) / 1057331035) [(4, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 11. -/
theorem ep_Q2_002_partial_11_0479_valid :
    mulPoly ep_Q2_002_coefficient_11_0479
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0480 : Poly :=
[
  term ((557407051888263229768737472448190013406538 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 480 for generator 11. -/
def ep_Q2_002_partial_11_0480 : Poly :=
[
  term ((1114814103776526459537474944896380026813076 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((1114814103776526459537474944896380026813076 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-557407051888263229768737472448190013406538 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-557407051888263229768737472448190013406538 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 11. -/
theorem ep_Q2_002_partial_11_0480_valid :
    mulPoly ep_Q2_002_coefficient_11_0480
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0481 : Poly :=
[
  term ((169445448303 : Rat) / 14802634490) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 481 for generator 11. -/
def ep_Q2_002_partial_11_0481 : Poly :=
[
  term ((169445448303 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((169445448303 : Rat) / 7401317245) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-169445448303 : Rat) / 14802634490) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-169445448303 : Rat) / 14802634490) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 11. -/
theorem ep_Q2_002_partial_11_0481_valid :
    mulPoly ep_Q2_002_coefficient_11_0481
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0482 : Poly :=
[
  term ((202841031594920779151113059585072 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2)]
]

/-- Partial product 482 for generator 11. -/
def ep_Q2_002_partial_11_0482 : Poly :=
[
  term ((405682063189841558302226119170144 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((405682063189841558302226119170144 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-202841031594920779151113059585072 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 2)],
  term ((-202841031594920779151113059585072 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 11. -/
theorem ep_Q2_002_partial_11_0482_valid :
    mulPoly ep_Q2_002_coefficient_11_0482
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0483 : Poly :=
[
  term ((-31755393239027991228473034495168 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 1)]
]

/-- Partial product 483 for generator 11. -/
def ep_Q2_002_partial_11_0483 : Poly :=
[
  term ((-63510786478055982456946068990336 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (14, 2)],
  term ((-63510786478055982456946068990336 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 2), (14, 1), (15, 1)],
  term ((31755393239027991228473034495168 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 1), (15, 2)],
  term ((31755393239027991228473034495168 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 11. -/
theorem ep_Q2_002_partial_11_0483_valid :
    mulPoly ep_Q2_002_coefficient_11_0483
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0484 : Poly :=
[
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 1), (15, 2)]
]

/-- Partial product 484 for generator 11. -/
def ep_Q2_002_partial_11_0484 : Poly :=
[
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (14, 2), (15, 2)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (14, 1), (15, 3)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 1), (15, 4)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 11. -/
theorem ep_Q2_002_partial_11_0484_valid :
    mulPoly ep_Q2_002_coefficient_11_0484
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0485 : Poly :=
[
  term ((-158475703364 : Rat) / 22203951735) [(4, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 485 for generator 11. -/
def ep_Q2_002_partial_11_0485 : Poly :=
[
  term ((-316951406728 : Rat) / 22203951735) [(2, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-316951406728 : Rat) / 22203951735) [(3, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((158475703364 : Rat) / 22203951735) [(4, 1), (14, 1), (15, 4), (16, 1)],
  term ((158475703364 : Rat) / 22203951735) [(4, 1), (14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 11. -/
theorem ep_Q2_002_partial_11_0485_valid :
    mulPoly ep_Q2_002_coefficient_11_0485
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0486 : Poly :=
[
  term ((1591699760925910653648185526738764974229064 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 2)]
]

/-- Partial product 486 for generator 11. -/
def ep_Q2_002_partial_11_0486 : Poly :=
[
  term ((3183399521851821307296371053477529948458128 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((3183399521851821307296371053477529948458128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 3)],
  term ((-1591699760925910653648185526738764974229064 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 2), (15, 2)],
  term ((-1591699760925910653648185526738764974229064 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 11. -/
theorem ep_Q2_002_partial_11_0486_valid :
    mulPoly ep_Q2_002_coefficient_11_0486
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0487 : Poly :=
[
  term ((29068555937 : Rat) / 7401317245) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 487 for generator 11. -/
def ep_Q2_002_partial_11_0487 : Poly :=
[
  term ((58137111874 : Rat) / 7401317245) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((58137111874 : Rat) / 7401317245) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((-29068555937 : Rat) / 7401317245) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-29068555937 : Rat) / 7401317245) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 11. -/
theorem ep_Q2_002_partial_11_0487_valid :
    mulPoly ep_Q2_002_coefficient_11_0487
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0488 : Poly :=
[
  term ((50560026822502949442764000599686 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1)]
]

/-- Partial product 488 for generator 11. -/
def ep_Q2_002_partial_11_0488 : Poly :=
[
  term ((101120053645005898885528001199372 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((101120053645005898885528001199372 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-50560026822502949442764000599686 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (14, 2)],
  term ((-50560026822502949442764000599686 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 11. -/
theorem ep_Q2_002_partial_11_0488_valid :
    mulPoly ep_Q2_002_coefficient_11_0488
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0489 : Poly :=
[
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (12, 1)]
]

/-- Partial product 489 for generator 11. -/
def ep_Q2_002_partial_11_0489 : Poly :=
[
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 11. -/
theorem ep_Q2_002_partial_11_0489_valid :
    mulPoly ep_Q2_002_coefficient_11_0489
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0490 : Poly :=
[
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (12, 1), (13, 1)]
]

/-- Partial product 490 for generator 11. -/
def ep_Q2_002_partial_11_0490 : Poly :=
[
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 11. -/
theorem ep_Q2_002_partial_11_0490_valid :
    mulPoly ep_Q2_002_coefficient_11_0490
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0491 : Poly :=
[
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 491 for generator 11. -/
def ep_Q2_002_partial_11_0491 : Poly :=
[
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 11. -/
theorem ep_Q2_002_partial_11_0491_valid :
    mulPoly ep_Q2_002_coefficient_11_0491
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0492 : Poly :=
[
  term ((-56063165212 : Rat) / 7401317245) [(5, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 492 for generator 11. -/
def ep_Q2_002_partial_11_0492 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (6, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 11. -/
theorem ep_Q2_002_partial_11_0492_valid :
    mulPoly ep_Q2_002_coefficient_11_0492
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0493 : Poly :=
[
  term ((-95213998974082779910608436409112 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1)]
]

/-- Partial product 493 for generator 11. -/
def ep_Q2_002_partial_11_0493 : Poly :=
[
  term ((-190427997948165559821216872818224 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-190427997948165559821216872818224 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((95213998974082779910608436409112 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((95213998974082779910608436409112 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 11. -/
theorem ep_Q2_002_partial_11_0493_valid :
    mulPoly ep_Q2_002_coefficient_11_0493
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0494 : Poly :=
[
  term ((208758623021905648635621748546240750318431 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 494 for generator 11. -/
def ep_Q2_002_partial_11_0494 : Poly :=
[
  term ((417517246043811297271243497092481500636862 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((417517246043811297271243497092481500636862 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-208758623021905648635621748546240750318431 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((-208758623021905648635621748546240750318431 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 11. -/
theorem ep_Q2_002_partial_11_0494_valid :
    mulPoly ep_Q2_002_coefficient_11_0494
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0495 : Poly :=
[
  term ((-9699017801 : Rat) / 17763161388) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 495 for generator 11. -/
def ep_Q2_002_partial_11_0495 : Poly :=
[
  term ((-9699017801 : Rat) / 8881580694) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9699017801 : Rat) / 8881580694) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((9699017801 : Rat) / 17763161388) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((9699017801 : Rat) / 17763161388) [(5, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 11. -/
theorem ep_Q2_002_partial_11_0495_valid :
    mulPoly ep_Q2_002_coefficient_11_0495
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0496 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 496 for generator 11. -/
def ep_Q2_002_partial_11_0496 : Poly :=
[
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 11. -/
theorem ep_Q2_002_partial_11_0496_valid :
    mulPoly ep_Q2_002_coefficient_11_0496
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0497 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1)]
]

/-- Partial product 497 for generator 11. -/
def ep_Q2_002_partial_11_0497 : Poly :=
[
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 11. -/
theorem ep_Q2_002_partial_11_0497_valid :
    mulPoly ep_Q2_002_coefficient_11_0497
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0498 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 498 for generator 11. -/
def ep_Q2_002_partial_11_0498 : Poly :=
[
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 11. -/
theorem ep_Q2_002_partial_11_0498_valid :
    mulPoly ep_Q2_002_coefficient_11_0498
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0499 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 11. -/
def ep_Q2_002_partial_11_0499 : Poly :=
[
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((195028145136 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 11. -/
theorem ep_Q2_002_partial_11_0499_valid :
    mulPoly ep_Q2_002_coefficient_11_0499
        ep_Q2_002_generator_11_0400_0499 =
      ep_Q2_002_partial_11_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_11_0400_0499 : List Poly :=
[
  ep_Q2_002_partial_11_0400,
  ep_Q2_002_partial_11_0401,
  ep_Q2_002_partial_11_0402,
  ep_Q2_002_partial_11_0403,
  ep_Q2_002_partial_11_0404,
  ep_Q2_002_partial_11_0405,
  ep_Q2_002_partial_11_0406,
  ep_Q2_002_partial_11_0407,
  ep_Q2_002_partial_11_0408,
  ep_Q2_002_partial_11_0409,
  ep_Q2_002_partial_11_0410,
  ep_Q2_002_partial_11_0411,
  ep_Q2_002_partial_11_0412,
  ep_Q2_002_partial_11_0413,
  ep_Q2_002_partial_11_0414,
  ep_Q2_002_partial_11_0415,
  ep_Q2_002_partial_11_0416,
  ep_Q2_002_partial_11_0417,
  ep_Q2_002_partial_11_0418,
  ep_Q2_002_partial_11_0419,
  ep_Q2_002_partial_11_0420,
  ep_Q2_002_partial_11_0421,
  ep_Q2_002_partial_11_0422,
  ep_Q2_002_partial_11_0423,
  ep_Q2_002_partial_11_0424,
  ep_Q2_002_partial_11_0425,
  ep_Q2_002_partial_11_0426,
  ep_Q2_002_partial_11_0427,
  ep_Q2_002_partial_11_0428,
  ep_Q2_002_partial_11_0429,
  ep_Q2_002_partial_11_0430,
  ep_Q2_002_partial_11_0431,
  ep_Q2_002_partial_11_0432,
  ep_Q2_002_partial_11_0433,
  ep_Q2_002_partial_11_0434,
  ep_Q2_002_partial_11_0435,
  ep_Q2_002_partial_11_0436,
  ep_Q2_002_partial_11_0437,
  ep_Q2_002_partial_11_0438,
  ep_Q2_002_partial_11_0439,
  ep_Q2_002_partial_11_0440,
  ep_Q2_002_partial_11_0441,
  ep_Q2_002_partial_11_0442,
  ep_Q2_002_partial_11_0443,
  ep_Q2_002_partial_11_0444,
  ep_Q2_002_partial_11_0445,
  ep_Q2_002_partial_11_0446,
  ep_Q2_002_partial_11_0447,
  ep_Q2_002_partial_11_0448,
  ep_Q2_002_partial_11_0449,
  ep_Q2_002_partial_11_0450,
  ep_Q2_002_partial_11_0451,
  ep_Q2_002_partial_11_0452,
  ep_Q2_002_partial_11_0453,
  ep_Q2_002_partial_11_0454,
  ep_Q2_002_partial_11_0455,
  ep_Q2_002_partial_11_0456,
  ep_Q2_002_partial_11_0457,
  ep_Q2_002_partial_11_0458,
  ep_Q2_002_partial_11_0459,
  ep_Q2_002_partial_11_0460,
  ep_Q2_002_partial_11_0461,
  ep_Q2_002_partial_11_0462,
  ep_Q2_002_partial_11_0463,
  ep_Q2_002_partial_11_0464,
  ep_Q2_002_partial_11_0465,
  ep_Q2_002_partial_11_0466,
  ep_Q2_002_partial_11_0467,
  ep_Q2_002_partial_11_0468,
  ep_Q2_002_partial_11_0469,
  ep_Q2_002_partial_11_0470,
  ep_Q2_002_partial_11_0471,
  ep_Q2_002_partial_11_0472,
  ep_Q2_002_partial_11_0473,
  ep_Q2_002_partial_11_0474,
  ep_Q2_002_partial_11_0475,
  ep_Q2_002_partial_11_0476,
  ep_Q2_002_partial_11_0477,
  ep_Q2_002_partial_11_0478,
  ep_Q2_002_partial_11_0479,
  ep_Q2_002_partial_11_0480,
  ep_Q2_002_partial_11_0481,
  ep_Q2_002_partial_11_0482,
  ep_Q2_002_partial_11_0483,
  ep_Q2_002_partial_11_0484,
  ep_Q2_002_partial_11_0485,
  ep_Q2_002_partial_11_0486,
  ep_Q2_002_partial_11_0487,
  ep_Q2_002_partial_11_0488,
  ep_Q2_002_partial_11_0489,
  ep_Q2_002_partial_11_0490,
  ep_Q2_002_partial_11_0491,
  ep_Q2_002_partial_11_0492,
  ep_Q2_002_partial_11_0493,
  ep_Q2_002_partial_11_0494,
  ep_Q2_002_partial_11_0495,
  ep_Q2_002_partial_11_0496,
  ep_Q2_002_partial_11_0497,
  ep_Q2_002_partial_11_0498,
  ep_Q2_002_partial_11_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_11_0400_0499 : Poly :=
[
  term ((192870862626 : Rat) / 7401317245) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-310462469878881193637041430144496 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 1), (14, 1)],
  term ((255517964975977144850391766721776770677424 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-21809658828 : Rat) / 7401317245) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-66575164888388616274604408535504 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 1), (14, 2)],
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(2, 1), (3, 1), (13, 2), (14, 1), (15, 1)],
  term ((3056073865233876803225067260912003734589714 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-35350929301 : Rat) / 14802634490) [(2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((-158475703364 : Rat) / 22203951735) [(2, 1), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((195668449677849797335063954460709837740006 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((6833897911 : Rat) / 8881580694) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-123630644931055022331363994612992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 2)],
  term ((584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((300100471816 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((232819656938780269027801688331264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 2)],
  term ((12281497189774300405367464939912547644579488 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((1223199691192 : Rat) / 22203951735) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (14, 2), (15, 1)],
  term ((15565557134 : Rat) / 4440790347) [(2, 1), (4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2376406475382967311677577214749255393732288 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (13, 2), (14, 1)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-300100471816 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1138954307638524895986242664862728 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-446445948577035823135255792780272 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 2)],
  term ((2144864255308422827938134714194976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((840741327907645467927801407961024 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 2)],
  term ((-3756094627012557183264920061418921104917724 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((629858494543 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2644288881356665814182676287488793021682376 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1)],
  term ((1076643905474 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((70009733193456992020180447445856 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-287896847008622863788656213689152 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-131841438452141049047629271866752 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-26216078969019318766629871418448579110736 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-52412417964 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((542163677878438200594157852617984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 2)],
  term ((2200624367693711557842569244750297230513232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((244224482556 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1)],
  term ((65009381712 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-223405546797301747104979726270248 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((483508284369385871349811092425050297548576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10261853432 : Rat) / 7401317245) [(2, 1), (4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((24599709983180576545773742530792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((33725157040435098411060817331808 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 2)],
  term ((17980233881499963214452726170029876174104 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((85813264672 : Rat) / 7401317245) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (14, 2), (15, 1)],
  term ((42499062132911791212953868662592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 2), (12, 1), (14, 1)],
  term ((-127455631155874386544438032665472 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 2), (14, 1)],
  term ((-1131665355480061448118737040348376065050256 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((53748272602 : Rat) / 7401317245) [(2, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((269996050446337912635887820244128 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 2), (14, 1)],
  term ((483746235444197119510553895038442041292000 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2)],
  term ((30573356200 : Rat) / 1480263449) [(2, 1), (4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1114814103776526459537474944896380026813076 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((169445448303 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-720918683949442499740928885477361795961632 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5820064368 : Rat) / 1057331035) [(2, 1), (4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((405682063189841558302226119170144 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (14, 1)],
  term ((-63510786478055982456946068990336 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (13, 2), (14, 2)],
  term ((3183399521851821307296371053477529948458128 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (14, 1), (15, 2)],
  term ((58137111874 : Rat) / 7401317245) [(2, 1), (4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (14, 2), (15, 2)],
  term ((-316951406728 : Rat) / 22203951735) [(2, 1), (4, 1), (14, 2), (15, 2), (16, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((101120053645005898885528001199372 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (11, 1), (14, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(2, 1), (5, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-190427997948165559821216872818224 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (6, 1), (13, 1), (14, 1)],
  term ((417517246043811297271243497092481500636862 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1)],
  term ((-9699017801 : Rat) / 8881580694) [(2, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(3, 1), (4, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (5, 1), (6, 1), (15, 2)],
  term ((-381790635174 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((-123630644931055022331363994612992 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2)],
  term ((300100471816 : Rat) / 7401317245) [(3, 1), (4, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((232819656938780269027801688331264 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (5, 1), (14, 1), (15, 2)],
  term ((15565557134 : Rat) / 4440790347) [(3, 1), (4, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((12281497189774300405367464939912547644579488 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((1223199691192 : Rat) / 22203951735) [(3, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2)],
  term ((-176342490026 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2)],
  term ((-195028145136 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (11, 1), (15, 2)],
  term ((-2376406475382967311677577214749255393732288 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (6, 1), (15, 3)],
  term ((-300100471816 : Rat) / 7401317245) [(3, 1), (4, 1), (6, 1), (15, 3), (16, 1)],
  term ((-446445948577035823135255792780272 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1138954307638524895986242664862728 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (11, 1), (15, 1)],
  term ((840741327907645467927801407961024 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((2144864255308422827938134714194976 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (7, 1), (13, 1), (15, 1)],
  term ((2644288881356665814182676287488793021682376 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2)],
  term ((1076643905474 : Rat) / 22203951735) [(3, 1), (4, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3756094627012557183264920061418921104917724 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (7, 1), (15, 2)],
  term ((629858494543 : Rat) / 7401317245) [(3, 1), (4, 1), (7, 1), (15, 2), (16, 1)],
  term ((70009733193456992020180447445856 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-287896847008622863788656213689152 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (11, 1), (15, 1)],
  term ((-131841438452141049047629271866752 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-26216078969019318766629871418448579110736 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2)],
  term ((-52412417964 : Rat) / 7401317245) [(3, 1), (4, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((542163677878438200594157852617984 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (9, 1), (13, 1), (15, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (9, 1), (14, 1), (15, 2)],
  term ((65009381712 : Rat) / 7401317245) [(3, 1), (4, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2200624367693711557842569244750297230513232 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (9, 1), (15, 2)],
  term ((244224482556 : Rat) / 7401317245) [(3, 1), (4, 1), (9, 1), (15, 2), (16, 1)],
  term ((-223405546797301747104979726270248 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((483508284369385871349811092425050297548576 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10261853432 : Rat) / 7401317245) [(3, 1), (4, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((33725157040435098411060817331808 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((24599709983180576545773742530792 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 1), (14, 1), (15, 2)],
  term ((17980233881499963214452726170029876174104 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (4, 1), (11, 1), (15, 2)],
  term ((85813264672 : Rat) / 7401317245) [(3, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((42499062132911791212953868662592 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-127455631155874386544438032665472 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-1131665355480061448118737040348376065050256 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2)],
  term ((53748272602 : Rat) / 7401317245) [(3, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((269996050446337912635887820244128 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (12, 1), (13, 2), (15, 1)],
  term ((483746235444197119510553895038442041292000 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (4, 1), (12, 1), (15, 3)],
  term ((30573356200 : Rat) / 1480263449) [(3, 1), (4, 1), (12, 1), (15, 3), (16, 1)],
  term ((-720918683949442499740928885477361795961632 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2)],
  term ((-5820064368 : Rat) / 1057331035) [(3, 1), (4, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1114814103776526459537474944896380026813076 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((169445448303 : Rat) / 7401317245) [(3, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-63510786478055982456946068990336 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 2), (14, 1), (15, 1)],
  term ((405682063189841558302226119170144 : Rat) / 1273790490336191187829975377157) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (14, 1), (15, 3)],
  term ((-316951406728 : Rat) / 22203951735) [(3, 1), (4, 1), (14, 1), (15, 3), (16, 1)],
  term ((3183399521851821307296371053477529948458128 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (4, 1), (15, 3)],
  term ((58137111874 : Rat) / 7401317245) [(3, 1), (4, 1), (15, 3), (16, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((101120053645005898885528001199372 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (6, 1), (12, 1), (15, 2)],
  term ((-112126330424 : Rat) / 7401317245) [(3, 1), (5, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-190427997948165559821216872818224 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((417517246043811297271243497092481500636862 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (5, 1), (6, 1), (15, 2)],
  term ((-9699017801 : Rat) / 8881580694) [(3, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2)],
  term ((195028145136 : Rat) / 7401317245) [(3, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-96435431313 : Rat) / 7401317245) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-96435431313 : Rat) / 7401317245) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((33287582444194308137302204267752 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((155231234939440596818520715072248 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 2)],
  term ((-127758982487988572425195883360888385338712 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((10904829414 : Rat) / 7401317245) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((33287582444194308137302204267752 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (14, 3)],
  term ((155231234939440596818520715072248 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 1), (15, 2)],
  term ((-127758982487988572425195883360888385338712 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (13, 1), (15, 4)],
  term ((10904829414 : Rat) / 7401317245) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 2), (14, 2), (15, 1)],
  term ((137864429583094792691624450967552 : Rat) / 1273790490336191187829975377157) [(3, 1), (13, 2), (15, 3)],
  term ((-97834224838924898667531977230354918870003 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (14, 1), (15, 3)],
  term ((-6833897911 : Rat) / 17763161388) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1528036932616938401612533630456001867294857 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 2), (15, 1)],
  term ((35350929301 : Rat) / 29605268980) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (14, 2), (15, 3)],
  term ((79237851682 : Rat) / 22203951735) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((-97834224838924898667531977230354918870003 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (14, 3), (15, 1)],
  term ((-6833897911 : Rat) / 17763161388) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1528036932616938401612533630456001867294857 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 3)],
  term ((35350929301 : Rat) / 29605268980) [(3, 1), (15, 3), (16, 1)],
  term ((805609802875682775348978966241272190695888 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 5)],
  term ((79237851682 : Rat) / 22203951735) [(3, 1), (15, 5), (16, 1)],
  term ((192870862626 : Rat) / 7401317245) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((-66575164888388616274604408535504 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-310462469878881193637041430144496 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 1), (15, 1)],
  term ((255517964975977144850391766721776770677424 : Rat) / 122438019774574775144195206323084197045) [(3, 2), (13, 1), (15, 3)],
  term ((-21809658828 : Rat) / 7401317245) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-275728859166189585383248901935104 : Rat) / 1273790490336191187829975377157) [(3, 2), (13, 2), (15, 2)],
  term ((195668449677849797335063954460709837740006 : Rat) / 269363643504064505317229453910785233499) [(3, 2), (14, 1), (15, 2)],
  term ((6833897911 : Rat) / 8881580694) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((3056073865233876803225067260912003734589714 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 2)],
  term ((-35350929301 : Rat) / 14802634490) [(3, 2), (15, 2), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(3, 2), (15, 4)],
  term ((-158475703364 : Rat) / 22203951735) [(3, 2), (15, 4), (16, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 2)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (11, 1), (15, 2)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 2)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (6, 1), (13, 1), (15, 2)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 1), (14, 2), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (6, 1), (15, 3)],
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (15, 3), (16, 1)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 2)],
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 1), (15, 2)],
  term ((61815322465527511165681997306496 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 2)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 3)],
  term ((61815322465527511165681997306496 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (15, 2)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (15, 3)],
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (15, 3), (16, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-116409828469390134513900844165632 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 2)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 3)],
  term ((-116409828469390134513900844165632 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (14, 1), (15, 3)],
  term ((-7782778567 : Rat) / 4440790347) [(4, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6140748594887150202683732469956273822289744 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (14, 2), (15, 1)],
  term ((-611599845596 : Rat) / 22203951735) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (14, 3), (15, 1)],
  term ((-7782778567 : Rat) / 4440790347) [(4, 1), (5, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6140748594887150202683732469956273822289744 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (15, 3)],
  term ((-611599845596 : Rat) / 22203951735) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (11, 1), (14, 2)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (13, 1), (14, 2)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (7, 1), (15, 3)],
  term ((88171245013 : Rat) / 7401317245) [(4, 1), (6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1), (14, 2)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(4, 1), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (9, 1), (15, 3)],
  term ((97514072568 : Rat) / 7401317245) [(4, 1), (6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (15, 3)],
  term ((1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1188203237691483655838788607374627696866144 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (13, 1), (15, 3)],
  term ((56063165212 : Rat) / 7401317245) [(4, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 2), (14, 2)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 2), (15, 2)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (14, 2), (15, 2)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (15, 4)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (6, 1), (15, 4), (16, 1)],
  term ((223222974288517911567627896390136 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((569477153819262447993121332431364 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 2)],
  term ((223222974288517911567627896390136 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 3)],
  term ((569477153819262447993121332431364 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-420370663953822733963900703980512 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1072432127654211413969067357097488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((-420370663953822733963900703980512 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 3)],
  term ((-1072432127654211413969067357097488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1322144440678332907091338143744396510841188 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 1), (15, 3)],
  term ((-538321952737 : Rat) / 22203951735) [(4, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((1878047313506278591632460030709460552458862 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-629858494543 : Rat) / 14802634490) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1322144440678332907091338143744396510841188 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 3), (15, 1)],
  term ((-538321952737 : Rat) / 22203951735) [(4, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((1878047313506278591632460030709460552458862 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 3)],
  term ((-629858494543 : Rat) / 14802634490) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-35004866596728496010090223722928 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((143948423504311431894328106844576 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 3)],
  term ((143948423504311431894328106844576 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((65920719226070524523814635933376 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((26206208982 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((13108039484509659383314935709224289555368 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (9, 1), (12, 1), (15, 3)],
  term ((26206208982 : Rat) / 7401317245) [(4, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-271081838939219100297078926308992 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 3)],
  term ((-271081838939219100297078926308992 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((-32504690856 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1100312183846855778921284622375148615256616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((-122112241278 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 3), (15, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1100312183846855778921284622375148615256616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 3)],
  term ((-122112241278 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((111702773398650873552489863135124 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((111702773398650873552489863135124 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-241754142184692935674905546212525148774288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-241754142184692935674905546212525148774288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term ((5130926716 : Rat) / 7401317245) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-16862578520217549205530408665904 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12299854991590288272886871265396 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-16862578520217549205530408665904 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 3)],
  term ((-12299854991590288272886871265396 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (14, 1), (15, 3)],
  term ((-8990116940749981607226363085014938087052 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((-42906632336 : Rat) / 7401317245) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (14, 3), (15, 1)],
  term ((-8990116940749981607226363085014938087052 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (11, 1), (15, 3)],
  term ((-42906632336 : Rat) / 7401317245) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 1), (14, 2)],
  term ((-21249531066455895606476934331296 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((63727815577937193272219016332736 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (14, 2)],
  term ((63727815577937193272219016332736 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 2), (15, 2)],
  term ((565832677740030724059368520174188032525128 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-26874136301 : Rat) / 7401317245) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((565832677740030724059368520174188032525128 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (12, 1), (13, 1), (15, 3)],
  term ((-26874136301 : Rat) / 7401317245) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 2), (14, 2)],
  term ((-134998025223168956317943910122064 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 2), (15, 2)],
  term ((-241873117722098559755276947519221020646000 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (12, 1), (14, 2), (15, 2)],
  term ((-15286678100 : Rat) / 1480263449) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-241873117722098559755276947519221020646000 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (12, 1), (15, 4)],
  term ((-15286678100 : Rat) / 1480263449) [(4, 1), (12, 1), (15, 4), (16, 1)],
  term ((360459341974721249870464442738680897980816 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 1), (15, 3)],
  term ((2910032184 : Rat) / 1057331035) [(4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-557407051888263229768737472448190013406538 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-169445448303 : Rat) / 14802634490) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((360459341974721249870464442738680897980816 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (14, 3), (15, 1)],
  term ((2910032184 : Rat) / 1057331035) [(4, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-557407051888263229768737472448190013406538 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 3)],
  term ((-169445448303 : Rat) / 14802634490) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((31755393239027991228473034495168 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 1), (15, 2)],
  term ((-202841031594920779151113059585072 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 2)],
  term ((31755393239027991228473034495168 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (14, 3)],
  term ((-202841031594920779151113059585072 : Rat) / 1273790490336191187829975377157) [(4, 1), (13, 2), (15, 2)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 1), (15, 4)],
  term ((158475703364 : Rat) / 22203951735) [(4, 1), (14, 1), (15, 4), (16, 1)],
  term ((-1591699760925910653648185526738764974229064 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 2), (15, 2)],
  term ((-29068555937 : Rat) / 7401317245) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (14, 3), (15, 2)],
  term ((158475703364 : Rat) / 22203951735) [(4, 1), (14, 3), (15, 2), (16, 1)],
  term ((-1591699760925910653648185526738764974229064 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (15, 4)],
  term ((-29068555937 : Rat) / 7401317245) [(4, 1), (15, 4), (16, 1)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 2)],
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-50560026822502949442764000599686 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (14, 2)],
  term ((-50560026822502949442764000599686 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (11, 1), (15, 2)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 2)],
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((56063165212 : Rat) / 7401317245) [(5, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((95213998974082779910608436409112 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (14, 2)],
  term ((95213998974082779910608436409112 : Rat) / 1273790490336191187829975377157) [(5, 1), (6, 1), (13, 1), (15, 2)],
  term ((-208758623021905648635621748546240750318431 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((9699017801 : Rat) / 17763161388) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-208758623021905648635621748546240750318431 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (6, 1), (15, 3)],
  term ((9699017801 : Rat) / 17763161388) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 2)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1), (14, 2)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (7, 1), (9, 1), (15, 3)],
  term ((-97514072568 : Rat) / 7401317245) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 400 through 499. -/
theorem ep_Q2_002_block_11_0400_0499_valid :
    checkProductSumEq ep_Q2_002_partials_11_0400_0499
      ep_Q2_002_block_11_0400_0499 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
