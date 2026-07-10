/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:700-799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0700 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 700 for generator 9. -/
def ep_Q2_002_partial_09_0700 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 9. -/
theorem ep_Q2_002_partial_09_0700_valid :
    mulPoly ep_Q2_002_coefficient_09_0700
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0701 : Poly :=
[
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 701 for generator 9. -/
def ep_Q2_002_partial_09_0701 : Poly :=
[
  term ((-33162853602572616672085597726752 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 9. -/
theorem ep_Q2_002_partial_09_0701_valid :
    mulPoly ep_Q2_002_coefficient_09_0701
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0702 : Poly :=
[
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 702 for generator 9. -/
def ep_Q2_002_partial_09_0702 : Poly :=
[
  term ((62451863800983100189204984877184 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 9. -/
theorem ep_Q2_002_partial_09_0702_valid :
    mulPoly ep_Q2_002_coefficient_09_0702
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0703 : Poly :=
[
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (7, 1), (15, 2)]
]

/-- Partial product 703 for generator 9. -/
def ep_Q2_002_partial_09_0703 : Poly :=
[
  term ((1798864918700863612923282373934692107147696 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 9. -/
theorem ep_Q2_002_partial_09_0703_valid :
    mulPoly ep_Q2_002_coefficient_09_0703
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0704 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 704 for generator 9. -/
def ep_Q2_002_partial_09_0704 : Poly :=
[
  term ((763581270348 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-381790635174 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 9. -/
theorem ep_Q2_002_partial_09_0704_valid :
    mulPoly ep_Q2_002_coefficient_09_0704
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0705 : Poly :=
[
  term ((-38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1)]
]

/-- Partial product 705 for generator 9. -/
def ep_Q2_002_partial_09_0705 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 9. -/
theorem ep_Q2_002_partial_09_0705_valid :
    mulPoly ep_Q2_002_coefficient_09_0705
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0706 : Poly :=
[
  term ((155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 706 for generator 9. -/
def ep_Q2_002_partial_09_0706 : Poly :=
[
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 9. -/
theorem ep_Q2_002_partial_09_0706_valid :
    mulPoly ep_Q2_002_coefficient_09_0706
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0707 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 1)]
]

/-- Partial product 707 for generator 9. -/
def ep_Q2_002_partial_09_0707 : Poly :=
[
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 9. -/
theorem ep_Q2_002_partial_09_0707_valid :
    mulPoly ep_Q2_002_coefficient_09_0707
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0708 : Poly :=
[
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (15, 2)]
]

/-- Partial product 708 for generator 9. -/
def ep_Q2_002_partial_09_0708 : Poly :=
[
  term ((-117530099766188738730213585768288 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2)],
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 9. -/
theorem ep_Q2_002_partial_09_0708_valid :
    mulPoly ep_Q2_002_coefficient_09_0708
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0709 : Poly :=
[
  term ((73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

/-- Partial product 709 for generator 9. -/
def ep_Q2_002_partial_09_0709 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 9. -/
theorem ep_Q2_002_partial_09_0709_valid :
    mulPoly ep_Q2_002_coefficient_09_0709
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0710 : Poly :=
[
  term ((-292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 710 for generator 9. -/
def ep_Q2_002_partial_09_0710 : Poly :=
[
  term ((-584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 9. -/
theorem ep_Q2_002_partial_09_0710_valid :
    mulPoly ep_Q2_002_coefficient_09_0710
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0711 : Poly :=
[
  term ((-1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 711 for generator 9. -/
def ep_Q2_002_partial_09_0711 : Poly :=
[
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 9. -/
theorem ep_Q2_002_partial_09_0711_valid :
    mulPoly ep_Q2_002_coefficient_09_0711
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0712 : Poly :=
[
  term ((-150050235908 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 712 for generator 9. -/
def ep_Q2_002_partial_09_0712 : Poly :=
[
  term ((-300100471816 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 9. -/
theorem ep_Q2_002_partial_09_0712_valid :
    mulPoly ep_Q2_002_coefficient_09_0712
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0713 : Poly :=
[
  term ((463683485706429756570198543557597587069404 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (15, 1)]
]

/-- Partial product 713 for generator 9. -/
def ep_Q2_002_partial_09_0713 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-463683485706429756570198543557597587069404 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 9. -/
theorem ep_Q2_002_partial_09_0713_valid :
    mulPoly ep_Q2_002_coefficient_09_0713
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0714 : Poly :=
[
  term ((37512558977 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 714 for generator 9. -/
def ep_Q2_002_partial_09_0714 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-37512558977 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 9. -/
theorem ep_Q2_002_partial_09_0714_valid :
    mulPoly ep_Q2_002_coefficient_09_0714
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0715 : Poly :=
[
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 1)]
]

/-- Partial product 715 for generator 9. -/
def ep_Q2_002_partial_09_0715 : Poly :=
[
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 9. -/
theorem ep_Q2_002_partial_09_0715_valid :
    mulPoly ep_Q2_002_coefficient_09_0715
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0716 : Poly :=
[
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (15, 2)]
]

/-- Partial product 716 for generator 9. -/
def ep_Q2_002_partial_09_0716 : Poly :=
[
  term ((221331187933253564025651456986496 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 9. -/
theorem ep_Q2_002_partial_09_0716_valid :
    mulPoly ep_Q2_002_coefficient_09_0716
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0717 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

/-- Partial product 717 for generator 9. -/
def ep_Q2_002_partial_09_0717 : Poly :=
[
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 9. -/
theorem ep_Q2_002_partial_09_0717_valid :
    mulPoly ep_Q2_002_coefficient_09_0717
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0718 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 718 for generator 9. -/
def ep_Q2_002_partial_09_0718 : Poly :=
[
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((7782778567 : Rat) / 4440790347) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 9. -/
theorem ep_Q2_002_partial_09_0718_valid :
    mulPoly ep_Q2_002_coefficient_09_0718
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0719 : Poly :=
[
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (15, 3)]
]

/-- Partial product 719 for generator 9. -/
def ep_Q2_002_partial_09_0719 : Poly :=
[
  term ((-955096054767820213715764753308696422106864 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 9. -/
theorem ep_Q2_002_partial_09_0719_valid :
    mulPoly ep_Q2_002_coefficient_09_0719
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0720 : Poly :=
[
  term ((-15565557134 : Rat) / 4440790347) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

/-- Partial product 720 for generator 9. -/
def ep_Q2_002_partial_09_0720 : Poly :=
[
  term ((-31131114268 : Rat) / 4440790347) [(2, 1), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((15565557134 : Rat) / 4440790347) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 9. -/
theorem ep_Q2_002_partial_09_0720_valid :
    mulPoly ep_Q2_002_coefficient_09_0720
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0721 : Poly :=
[
  term ((-56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 721 for generator 9. -/
def ep_Q2_002_partial_09_0721 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 9. -/
theorem ep_Q2_002_partial_09_0721_valid :
    mulPoly ep_Q2_002_coefficient_09_0721
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0722 : Poly :=
[
  term ((106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

/-- Partial product 722 for generator 9. -/
def ep_Q2_002_partial_09_0722 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 9. -/
theorem ep_Q2_002_partial_09_0722_valid :
    mulPoly ep_Q2_002_coefficient_09_0722
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0723 : Poly :=
[
  term ((458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 723 for generator 9. -/
def ep_Q2_002_partial_09_0723 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 9. -/
theorem ep_Q2_002_partial_09_0723_valid :
    mulPoly ep_Q2_002_coefficient_09_0723
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0724 : Poly :=
[
  term ((48757036284 : Rat) / 7401317245) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 724 for generator 9. -/
def ep_Q2_002_partial_09_0724 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 9. -/
theorem ep_Q2_002_partial_09_0724_valid :
    mulPoly ep_Q2_002_coefficient_09_0724
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0725 : Poly :=
[
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 725 for generator 9. -/
def ep_Q2_002_partial_09_0725 : Poly :=
[
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 9. -/
theorem ep_Q2_002_partial_09_0725_valid :
    mulPoly ep_Q2_002_coefficient_09_0725
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0726 : Poly :=
[
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 726 for generator 9. -/
def ep_Q2_002_partial_09_0726 : Poly :=
[
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 9. -/
theorem ep_Q2_002_partial_09_0726_valid :
    mulPoly ep_Q2_002_coefficient_09_0726
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0727 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 727 for generator 9. -/
def ep_Q2_002_partial_09_0727 : Poly :=
[
  term ((150050235908 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 9. -/
theorem ep_Q2_002_partial_09_0727_valid :
    mulPoly ep_Q2_002_coefficient_09_0727
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0728 : Poly :=
[
  term ((-56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

/-- Partial product 728 for generator 9. -/
def ep_Q2_002_partial_09_0728 : Poly :=
[
  term ((-113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 9. -/
theorem ep_Q2_002_partial_09_0728_valid :
    mulPoly ep_Q2_002_coefficient_09_0728
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0729 : Poly :=
[
  term ((-123185681526631413932478913742676693823986 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 729 for generator 9. -/
def ep_Q2_002_partial_09_0729 : Poly :=
[
  term ((-246371363053262827864957827485353387647972 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((123185681526631413932478913742676693823986 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 9. -/
theorem ep_Q2_002_partial_09_0729_valid :
    mulPoly ep_Q2_002_coefficient_09_0729
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0730 : Poly :=
[
  term ((-38126575709 : Rat) / 6343986210) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 730 for generator 9. -/
def ep_Q2_002_partial_09_0730 : Poly :=
[
  term ((-38126575709 : Rat) / 3171993105) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((38126575709 : Rat) / 6343986210) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 9. -/
theorem ep_Q2_002_partial_09_0730_valid :
    mulPoly ep_Q2_002_coefficient_09_0730
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0731 : Poly :=
[
  term ((30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2)]
]

/-- Partial product 731 for generator 9. -/
def ep_Q2_002_partial_09_0731 : Poly :=
[
  term ((60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 2)],
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 9. -/
theorem ep_Q2_002_partial_09_0731_valid :
    mulPoly ep_Q2_002_coefficient_09_0731
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0732 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2), (12, 1)]
]

/-- Partial product 732 for generator 9. -/
def ep_Q2_002_partial_09_0732 : Poly :=
[
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 2), (12, 1)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 9. -/
theorem ep_Q2_002_partial_09_0732_valid :
    mulPoly ep_Q2_002_coefficient_09_0732
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0733 : Poly :=
[
  term ((742335481487719031573114745711840 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 733 for generator 9. -/
def ep_Q2_002_partial_09_0733 : Poly :=
[
  term ((1484670962975438063146229491423680 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-742335481487719031573114745711840 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 9. -/
theorem ep_Q2_002_partial_09_0733_valid :
    mulPoly ep_Q2_002_coefficient_09_0733
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0734 : Poly :=
[
  term ((-900086648500979323875054300908095731760212 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (15, 2)]
]

/-- Partial product 734 for generator 9. -/
def ep_Q2_002_partial_09_0734 : Poly :=
[
  term ((-1800173297001958647750108601816191463520424 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((900086648500979323875054300908095731760212 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 9. -/
theorem ep_Q2_002_partial_09_0734_valid :
    mulPoly ep_Q2_002_coefficient_09_0734
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0735 : Poly :=
[
  term ((229205174269 : Rat) / 7401317245) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 735 for generator 9. -/
def ep_Q2_002_partial_09_0735 : Poly :=
[
  term ((458410348538 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-229205174269 : Rat) / 7401317245) [(4, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 9. -/
theorem ep_Q2_002_partial_09_0735_valid :
    mulPoly ep_Q2_002_coefficient_09_0735
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0736 : Poly :=
[
  term ((14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 736 for generator 9. -/
def ep_Q2_002_partial_09_0736 : Poly :=
[
  term ((28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1)],
  term ((-14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 9. -/
theorem ep_Q2_002_partial_09_0736_valid :
    mulPoly ep_Q2_002_coefficient_09_0736
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0737 : Poly :=
[
  term ((-26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

/-- Partial product 737 for generator 9. -/
def ep_Q2_002_partial_09_0737 : Poly :=
[
  term ((-53323790206862476260917094033792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 9. -/
theorem ep_Q2_002_partial_09_0737_valid :
    mulPoly ep_Q2_002_coefficient_09_0737
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0738 : Poly :=
[
  term ((-71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 738 for generator 9. -/
def ep_Q2_002_partial_09_0738 : Poly :=
[
  term ((-143493232074946280623259186363914408714656 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 9. -/
theorem ep_Q2_002_partial_09_0738_valid :
    mulPoly ep_Q2_002_coefficient_09_0738
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0739 : Poly :=
[
  term ((-10981330664 : Rat) / 7401317245) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 739 for generator 9. -/
def ep_Q2_002_partial_09_0739 : Poly :=
[
  term ((-21962661328 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((10981330664 : Rat) / 7401317245) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 9. -/
theorem ep_Q2_002_partial_09_0739_valid :
    mulPoly ep_Q2_002_coefficient_09_0739
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0740 : Poly :=
[
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 740 for generator 9. -/
def ep_Q2_002_partial_09_0740 : Poly :=
[
  term ((-453089127865163734675508137847424 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 9. -/
theorem ep_Q2_002_partial_09_0740_valid :
    mulPoly ep_Q2_002_coefficient_09_0740
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0741 : Poly :=
[
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 741 for generator 9. -/
def ep_Q2_002_partial_09_0741 : Poly :=
[
  term ((853251678587343666835905621355008 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 9. -/
theorem ep_Q2_002_partial_09_0741_valid :
    mulPoly ep_Q2_002_coefficient_09_0741
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0742 : Poly :=
[
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (9, 1), (15, 2)]
]

/-- Partial product 742 for generator 9. -/
def ep_Q2_002_partial_09_0742 : Poly :=
[
  term ((3665325266919308560444948551146631909122304 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 9. -/
theorem ep_Q2_002_partial_09_0742_valid :
    mulPoly ep_Q2_002_coefficient_09_0742
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0743 : Poly :=
[
  term ((195028145136 : Rat) / 7401317245) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 743 for generator 9. -/
def ep_Q2_002_partial_09_0743 : Poly :=
[
  term ((390056290272 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-195028145136 : Rat) / 7401317245) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 9. -/
theorem ep_Q2_002_partial_09_0743_valid :
    mulPoly ep_Q2_002_coefficient_09_0743
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0744 : Poly :=
[
  term ((-10902263615966066249431537650954 : Rat) / 115799135485108289802725034287) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 744 for generator 9. -/
def ep_Q2_002_partial_09_0744 : Poly :=
[
  term ((-21804527231932132498863075301908 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((10902263615966066249431537650954 : Rat) / 115799135485108289802725034287) [(4, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 9. -/
theorem ep_Q2_002_partial_09_0744_valid :
    mulPoly ep_Q2_002_coefficient_09_0744
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0745 : Poly :=
[
  term ((88792632590157655490080842960168 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 745 for generator 9. -/
def ep_Q2_002_partial_09_0745 : Poly :=
[
  term ((177585265180315310980161685920336 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-88792632590157655490080842960168 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 9. -/
theorem ep_Q2_002_partial_09_0745_valid :
    mulPoly ep_Q2_002_coefficient_09_0745
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0746 : Poly :=
[
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 746 for generator 9. -/
def ep_Q2_002_partial_09_0746 : Poly :=
[
  term ((-199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 9. -/
theorem ep_Q2_002_partial_09_0746_valid :
    mulPoly ep_Q2_002_coefficient_09_0746
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0747 : Poly :=
[
  term ((368766368994381051499851664648512 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 747 for generator 9. -/
def ep_Q2_002_partial_09_0747 : Poly :=
[
  term ((737532737988762102999703329297024 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-368766368994381051499851664648512 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 9. -/
theorem ep_Q2_002_partial_09_0747_valid :
    mulPoly ep_Q2_002_coefficient_09_0747
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0748 : Poly :=
[
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 748 for generator 9. -/
def ep_Q2_002_partial_09_0748 : Poly :=
[
  term ((271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 9. -/
theorem ep_Q2_002_partial_09_0748_valid :
    mulPoly ep_Q2_002_coefficient_09_0748
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0749 : Poly :=
[
  term ((-167213155523536847365913978679456 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 749 for generator 9. -/
def ep_Q2_002_partial_09_0749 : Poly :=
[
  term ((-334426311047073694731827957358912 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((167213155523536847365913978679456 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 9. -/
theorem ep_Q2_002_partial_09_0749_valid :
    mulPoly ep_Q2_002_coefficient_09_0749
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0750 : Poly :=
[
  term ((-103278525528881324000688587696596541986476 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 750 for generator 9. -/
def ep_Q2_002_partial_09_0750 : Poly :=
[
  term ((-206557051057762648001377175393193083972952 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((103278525528881324000688587696596541986476 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 9. -/
theorem ep_Q2_002_partial_09_0750_valid :
    mulPoly ep_Q2_002_coefficient_09_0750
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0751 : Poly :=
[
  term ((-93575724189 : Rat) / 7401317245) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 751 for generator 9. -/
def ep_Q2_002_partial_09_0751 : Poly :=
[
  term ((-187151448378 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((93575724189 : Rat) / 7401317245) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 9. -/
theorem ep_Q2_002_partial_09_0751_valid :
    mulPoly ep_Q2_002_coefficient_09_0751
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0752 : Poly :=
[
  term ((20531004075412493720860937769768 : Rat) / 115799135485108289802725034287) [(4, 1), (7, 1), (13, 1)]
]

/-- Partial product 752 for generator 9. -/
def ep_Q2_002_partial_09_0752 : Poly :=
[
  term ((41062008150824987441721875539536 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-20531004075412493720860937769768 : Rat) / 115799135485108289802725034287) [(4, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 9. -/
theorem ep_Q2_002_partial_09_0752_valid :
    mulPoly ep_Q2_002_coefficient_09_0752
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0753 : Poly :=
[
  term ((-694456132358694043644129415759104 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 753 for generator 9. -/
def ep_Q2_002_partial_09_0753 : Poly :=
[
  term ((-1388912264717388087288258831518208 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((694456132358694043644129415759104 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 9. -/
theorem ep_Q2_002_partial_09_0753_valid :
    mulPoly ep_Q2_002_coefficient_09_0753
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0754 : Poly :=
[
  term ((1487464576979102144660415646795368648152448 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 754 for generator 9. -/
def ep_Q2_002_partial_09_0754 : Poly :=
[
  term ((2974929153958204289320831293590737296304896 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-1487464576979102144660415646795368648152448 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 9. -/
theorem ep_Q2_002_partial_09_0754_valid :
    mulPoly ep_Q2_002_coefficient_09_0754
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0755 : Poly :=
[
  term ((112126330424 : Rat) / 7401317245) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 755 for generator 9. -/
def ep_Q2_002_partial_09_0755 : Poly :=
[
  term ((224252660848 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 9. -/
theorem ep_Q2_002_partial_09_0755_valid :
    mulPoly ep_Q2_002_coefficient_09_0755
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0756 : Poly :=
[
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

/-- Partial product 756 for generator 9. -/
def ep_Q2_002_partial_09_0756 : Poly :=
[
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 9. -/
theorem ep_Q2_002_partial_09_0756_valid :
    mulPoly ep_Q2_002_coefficient_09_0756
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0757 : Poly :=
[
  term ((-18921895973847225058390705289269889959176 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 757 for generator 9. -/
def ep_Q2_002_partial_09_0757 : Poly :=
[
  term ((-37843791947694450116781410578539779918352 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((18921895973847225058390705289269889959176 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 9. -/
theorem ep_Q2_002_partial_09_0757_valid :
    mulPoly ep_Q2_002_coefficient_09_0757
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0758 : Poly :=
[
  term ((-712771394654 : Rat) / 22203951735) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 758 for generator 9. -/
def ep_Q2_002_partial_09_0758 : Poly :=
[
  term ((-1425542789308 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((712771394654 : Rat) / 22203951735) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 9. -/
theorem ep_Q2_002_partial_09_0758_valid :
    mulPoly ep_Q2_002_coefficient_09_0758
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0759 : Poly :=
[
  term ((-555590780675668383862024142775913275783 : Rat) / 24487603954914955028839041264616839409) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 759 for generator 9. -/
def ep_Q2_002_partial_09_0759 : Poly :=
[
  term ((-1111181561351336767724048285551826551566 : Rat) / 24487603954914955028839041264616839409) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((555590780675668383862024142775913275783 : Rat) / 24487603954914955028839041264616839409) [(4, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 9. -/
theorem ep_Q2_002_partial_09_0759_valid :
    mulPoly ep_Q2_002_coefficient_09_0759
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0760 : Poly :=
[
  term ((185180610311 : Rat) / 17763161388) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 760 for generator 9. -/
def ep_Q2_002_partial_09_0760 : Poly :=
[
  term ((185180610311 : Rat) / 8881580694) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-185180610311 : Rat) / 17763161388) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 9. -/
theorem ep_Q2_002_partial_09_0760_valid :
    mulPoly ep_Q2_002_coefficient_09_0760
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0761 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 3)]
]

/-- Partial product 761 for generator 9. -/
def ep_Q2_002_partial_09_0761 : Poly :=
[
  term ((2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 3)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 9. -/
theorem ep_Q2_002_partial_09_0761_valid :
    mulPoly ep_Q2_002_coefficient_09_0761
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0762 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

/-- Partial product 762 for generator 9. -/
def ep_Q2_002_partial_09_0762 : Poly :=
[
  term ((-352684980052 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((176342490026 : Rat) / 22203951735) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 9. -/
theorem ep_Q2_002_partial_09_0762_valid :
    mulPoly ep_Q2_002_coefficient_09_0762
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0763 : Poly :=
[
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (11, 1), (15, 1)]
]

/-- Partial product 763 for generator 9. -/
def ep_Q2_002_partial_09_0763 : Poly :=
[
  term ((-814835034818481040455114621785376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 2), (11, 1), (15, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 9. -/
theorem ep_Q2_002_partial_09_0763_valid :
    mulPoly ep_Q2_002_coefficient_09_0763
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0764 : Poly :=
[
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

/-- Partial product 764 for generator 9. -/
def ep_Q2_002_partial_09_0764 : Poly :=
[
  term ((1534486966188140497836179827262592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 9. -/
theorem ep_Q2_002_partial_09_0764_valid :
    mulPoly ep_Q2_002_coefficient_09_0764
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0765 : Poly :=
[
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 2), (15, 2)]
]

/-- Partial product 765 for generator 9. -/
def ep_Q2_002_partial_09_0765 : Poly :=
[
  term ((-6391074025768633430273472365831926049237136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 2), (15, 2)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 9. -/
theorem ep_Q2_002_partial_09_0765_valid :
    mulPoly ep_Q2_002_coefficient_09_0765
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0766 : Poly :=
[
  term ((176342490026 : Rat) / 7401317245) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

/-- Partial product 766 for generator 9. -/
def ep_Q2_002_partial_09_0766 : Poly :=
[
  term ((352684980052 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-176342490026 : Rat) / 7401317245) [(4, 1), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 9. -/
theorem ep_Q2_002_partial_09_0766_valid :
    mulPoly ep_Q2_002_coefficient_09_0766
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0767 : Poly :=
[
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 767 for generator 9. -/
def ep_Q2_002_partial_09_0767 : Poly :=
[
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 9. -/
theorem ep_Q2_002_partial_09_0767_valid :
    mulPoly ep_Q2_002_coefficient_09_0767
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0768 : Poly :=
[
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 768 for generator 9. -/
def ep_Q2_002_partial_09_0768 : Poly :=
[
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 9. -/
theorem ep_Q2_002_partial_09_0768_valid :
    mulPoly ep_Q2_002_coefficient_09_0768
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0769 : Poly :=
[
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (15, 2)]
]

/-- Partial product 769 for generator 9. -/
def ep_Q2_002_partial_09_0769 : Poly :=
[
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((-152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 9. -/
theorem ep_Q2_002_partial_09_0769_valid :
    mulPoly ep_Q2_002_coefficient_09_0769
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0770 : Poly :=
[
  term ((16252345428 : Rat) / 7401317245) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 770 for generator 9. -/
def ep_Q2_002_partial_09_0770 : Poly :=
[
  term ((32504690856 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-16252345428 : Rat) / 7401317245) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 9. -/
theorem ep_Q2_002_partial_09_0770_valid :
    mulPoly ep_Q2_002_coefficient_09_0770
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0771 : Poly :=
[
  term ((-2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1)]
]

/-- Partial product 771 for generator 9. -/
def ep_Q2_002_partial_09_0771 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 9. -/
theorem ep_Q2_002_partial_09_0771_valid :
    mulPoly ep_Q2_002_coefficient_09_0771
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0772 : Poly :=
[
  term ((18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 772 for generator 9. -/
def ep_Q2_002_partial_09_0772 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 9. -/
theorem ep_Q2_002_partial_09_0772_valid :
    mulPoly ep_Q2_002_coefficient_09_0772
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0773 : Poly :=
[
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 773 for generator 9. -/
def ep_Q2_002_partial_09_0773 : Poly :=
[
  term ((151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 9. -/
theorem ep_Q2_002_partial_09_0773_valid :
    mulPoly ep_Q2_002_coefficient_09_0773
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0774 : Poly :=
[
  term ((4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1)]
]

/-- Partial product 774 for generator 9. -/
def ep_Q2_002_partial_09_0774 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 9. -/
theorem ep_Q2_002_partial_09_0774_valid :
    mulPoly ep_Q2_002_coefficient_09_0774
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0775 : Poly :=
[
  term ((-35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 775 for generator 9. -/
def ep_Q2_002_partial_09_0775 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 9. -/
theorem ep_Q2_002_partial_09_0775_valid :
    mulPoly ep_Q2_002_coefficient_09_0775
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0776 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 776 for generator 9. -/
def ep_Q2_002_partial_09_0776 : Poly :=
[
  term ((-284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 9. -/
theorem ep_Q2_002_partial_09_0776_valid :
    mulPoly ep_Q2_002_coefficient_09_0776
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0777 : Poly :=
[
  term ((-152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 777 for generator 9. -/
def ep_Q2_002_partial_09_0777 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 9. -/
theorem ep_Q2_002_partial_09_0777_valid :
    mulPoly ep_Q2_002_coefficient_09_0777
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0778 : Poly :=
[
  term ((-16252345428 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 778 for generator 9. -/
def ep_Q2_002_partial_09_0778 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16252345428 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 9. -/
theorem ep_Q2_002_partial_09_0778_valid :
    mulPoly ep_Q2_002_coefficient_09_0778
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0779 : Poly :=
[
  term ((40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 1)]
]

/-- Partial product 779 for generator 9. -/
def ep_Q2_002_partial_09_0779 : Poly :=
[
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 9. -/
theorem ep_Q2_002_partial_09_0779_valid :
    mulPoly ep_Q2_002_coefficient_09_0779
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0780 : Poly :=
[
  term ((2635507382 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 780 for generator 9. -/
def ep_Q2_002_partial_09_0780 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 9. -/
theorem ep_Q2_002_partial_09_0780_valid :
    mulPoly ep_Q2_002_coefficient_09_0780
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0781 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 3)]
]

/-- Partial product 781 for generator 9. -/
def ep_Q2_002_partial_09_0781 : Poly :=
[
  term ((-1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 9. -/
theorem ep_Q2_002_partial_09_0781_valid :
    mulPoly ep_Q2_002_coefficient_09_0781
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0782 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 782 for generator 9. -/
def ep_Q2_002_partial_09_0782 : Poly :=
[
  term ((-130018763424 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 3), (16, 1)],
  term ((65009381712 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 9. -/
theorem ep_Q2_002_partial_09_0782_valid :
    mulPoly ep_Q2_002_coefficient_09_0782
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0783 : Poly :=
[
  term ((165371048223932897284119218206344 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 783 for generator 9. -/
def ep_Q2_002_partial_09_0783 : Poly :=
[
  term ((330742096447865794568238436412688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-165371048223932897284119218206344 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 9. -/
theorem ep_Q2_002_partial_09_0783_valid :
    mulPoly ep_Q2_002_coefficient_09_0783
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0784 : Poly :=
[
  term ((-2868028696565571505793048669412 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 784 for generator 9. -/
def ep_Q2_002_partial_09_0784 : Poly :=
[
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((2868028696565571505793048669412 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 9. -/
theorem ep_Q2_002_partial_09_0784_valid :
    mulPoly ep_Q2_002_coefficient_09_0784
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0785 : Poly :=
[
  term ((-38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 785 for generator 9. -/
def ep_Q2_002_partial_09_0785 : Poly :=
[
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 9. -/
theorem ep_Q2_002_partial_09_0785_valid :
    mulPoly ep_Q2_002_coefficient_09_0785
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0786 : Poly :=
[
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 786 for generator 9. -/
def ep_Q2_002_partial_09_0786 : Poly :=
[
  term ((199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 9. -/
theorem ep_Q2_002_partial_09_0786_valid :
    mulPoly ep_Q2_002_coefficient_09_0786
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0787 : Poly :=
[
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 787 for generator 9. -/
def ep_Q2_002_partial_09_0787 : Poly :=
[
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 9. -/
theorem ep_Q2_002_partial_09_0787_valid :
    mulPoly ep_Q2_002_coefficient_09_0787
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0788 : Poly :=
[
  term ((-31993269502196257668785831333616 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 788 for generator 9. -/
def ep_Q2_002_partial_09_0788 : Poly :=
[
  term ((-63986539004392515337571662667232 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((31993269502196257668785831333616 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 9. -/
theorem ep_Q2_002_partial_09_0788_valid :
    mulPoly ep_Q2_002_coefficient_09_0788
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0789 : Poly :=
[
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (15, 3)]
]

/-- Partial product 789 for generator 9. -/
def ep_Q2_002_partial_09_0789 : Poly :=
[
  term ((-60329084463266493551152918921920 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (15, 3)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 9. -/
theorem ep_Q2_002_partial_09_0789_valid :
    mulPoly ep_Q2_002_coefficient_09_0789
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0790 : Poly :=
[
  term ((-311424653139791602721403810735648 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 790 for generator 9. -/
def ep_Q2_002_partial_09_0790 : Poly :=
[
  term ((-622849306279583205442807621471296 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((311424653139791602721403810735648 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 9. -/
theorem ep_Q2_002_partial_09_0790_valid :
    mulPoly ep_Q2_002_coefficient_09_0790
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0791 : Poly :=
[
  term ((73559614459782412299710632321338270592284 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (12, 1), (15, 2)]
]

/-- Partial product 791 for generator 9. -/
def ep_Q2_002_partial_09_0791 : Poly :=
[
  term ((147119228919564824599421264642676541184568 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-73559614459782412299710632321338270592284 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 9. -/
theorem ep_Q2_002_partial_09_0791_valid :
    mulPoly ep_Q2_002_coefficient_09_0791
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0792 : Poly :=
[
  term ((-19496827975 : Rat) / 1480263449) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 792 for generator 9. -/
def ep_Q2_002_partial_09_0792 : Poly :=
[
  term ((-38993655950 : Rat) / 1480263449) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((19496827975 : Rat) / 1480263449) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 9. -/
theorem ep_Q2_002_partial_09_0792_valid :
    mulPoly ep_Q2_002_coefficient_09_0792
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0793 : Poly :=
[
  term ((43518094133914337257874085852542201256564 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 793 for generator 9. -/
def ep_Q2_002_partial_09_0793 : Poly :=
[
  term ((87036188267828674515748171705084402513128 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-43518094133914337257874085852542201256564 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 9. -/
theorem ep_Q2_002_partial_09_0793_valid :
    mulPoly ep_Q2_002_coefficient_09_0793
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0794 : Poly :=
[
  term ((37512558977 : Rat) / 7401317245) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 794 for generator 9. -/
def ep_Q2_002_partial_09_0794 : Poly :=
[
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37512558977 : Rat) / 7401317245) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 9. -/
theorem ep_Q2_002_partial_09_0794_valid :
    mulPoly ep_Q2_002_coefficient_09_0794
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0795 : Poly :=
[
  term ((-8960423802158084332622478010441564016718 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 795 for generator 9. -/
def ep_Q2_002_partial_09_0795 : Poly :=
[
  term ((-17920847604316168665244956020883128033436 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((8960423802158084332622478010441564016718 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 9. -/
theorem ep_Q2_002_partial_09_0795_valid :
    mulPoly ep_Q2_002_coefficient_09_0795
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0796 : Poly :=
[
  term ((39643219857 : Rat) / 14802634490) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 796 for generator 9. -/
def ep_Q2_002_partial_09_0796 : Poly :=
[
  term ((39643219857 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39643219857 : Rat) / 14802634490) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 9. -/
theorem ep_Q2_002_partial_09_0796_valid :
    mulPoly ep_Q2_002_coefficient_09_0796
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0797 : Poly :=
[
  term ((-1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 3)]
]

/-- Partial product 797 for generator 9. -/
def ep_Q2_002_partial_09_0797 : Poly :=
[
  term ((-3395624986543086195623681179429696820996736 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 9. -/
theorem ep_Q2_002_partial_09_0797_valid :
    mulPoly ep_Q2_002_coefficient_09_0797
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0798 : Poly :=
[
  term ((-112126330424 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 798 for generator 9. -/
def ep_Q2_002_partial_09_0798 : Poly :=
[
  term ((-224252660848 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((112126330424 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 9. -/
theorem ep_Q2_002_partial_09_0798_valid :
    mulPoly ep_Q2_002_coefficient_09_0798
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0799 : Poly :=
[
  term ((5401035136533888807578975381904 : Rat) / 97983883872014706756151952089) [(4, 1), (13, 2)]
]

/-- Partial product 799 for generator 9. -/
def ep_Q2_002_partial_09_0799 : Poly :=
[
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (13, 2)],
  term ((-5401035136533888807578975381904 : Rat) / 97983883872014706756151952089) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 9. -/
theorem ep_Q2_002_partial_09_0799_valid :
    mulPoly ep_Q2_002_coefficient_09_0799
        ep_Q2_002_generator_09_0700_0799 =
      ep_Q2_002_partial_09_0799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_0700_0799 : List Poly :=
[
  ep_Q2_002_partial_09_0700,
  ep_Q2_002_partial_09_0701,
  ep_Q2_002_partial_09_0702,
  ep_Q2_002_partial_09_0703,
  ep_Q2_002_partial_09_0704,
  ep_Q2_002_partial_09_0705,
  ep_Q2_002_partial_09_0706,
  ep_Q2_002_partial_09_0707,
  ep_Q2_002_partial_09_0708,
  ep_Q2_002_partial_09_0709,
  ep_Q2_002_partial_09_0710,
  ep_Q2_002_partial_09_0711,
  ep_Q2_002_partial_09_0712,
  ep_Q2_002_partial_09_0713,
  ep_Q2_002_partial_09_0714,
  ep_Q2_002_partial_09_0715,
  ep_Q2_002_partial_09_0716,
  ep_Q2_002_partial_09_0717,
  ep_Q2_002_partial_09_0718,
  ep_Q2_002_partial_09_0719,
  ep_Q2_002_partial_09_0720,
  ep_Q2_002_partial_09_0721,
  ep_Q2_002_partial_09_0722,
  ep_Q2_002_partial_09_0723,
  ep_Q2_002_partial_09_0724,
  ep_Q2_002_partial_09_0725,
  ep_Q2_002_partial_09_0726,
  ep_Q2_002_partial_09_0727,
  ep_Q2_002_partial_09_0728,
  ep_Q2_002_partial_09_0729,
  ep_Q2_002_partial_09_0730,
  ep_Q2_002_partial_09_0731,
  ep_Q2_002_partial_09_0732,
  ep_Q2_002_partial_09_0733,
  ep_Q2_002_partial_09_0734,
  ep_Q2_002_partial_09_0735,
  ep_Q2_002_partial_09_0736,
  ep_Q2_002_partial_09_0737,
  ep_Q2_002_partial_09_0738,
  ep_Q2_002_partial_09_0739,
  ep_Q2_002_partial_09_0740,
  ep_Q2_002_partial_09_0741,
  ep_Q2_002_partial_09_0742,
  ep_Q2_002_partial_09_0743,
  ep_Q2_002_partial_09_0744,
  ep_Q2_002_partial_09_0745,
  ep_Q2_002_partial_09_0746,
  ep_Q2_002_partial_09_0747,
  ep_Q2_002_partial_09_0748,
  ep_Q2_002_partial_09_0749,
  ep_Q2_002_partial_09_0750,
  ep_Q2_002_partial_09_0751,
  ep_Q2_002_partial_09_0752,
  ep_Q2_002_partial_09_0753,
  ep_Q2_002_partial_09_0754,
  ep_Q2_002_partial_09_0755,
  ep_Q2_002_partial_09_0756,
  ep_Q2_002_partial_09_0757,
  ep_Q2_002_partial_09_0758,
  ep_Q2_002_partial_09_0759,
  ep_Q2_002_partial_09_0760,
  ep_Q2_002_partial_09_0761,
  ep_Q2_002_partial_09_0762,
  ep_Q2_002_partial_09_0763,
  ep_Q2_002_partial_09_0764,
  ep_Q2_002_partial_09_0765,
  ep_Q2_002_partial_09_0766,
  ep_Q2_002_partial_09_0767,
  ep_Q2_002_partial_09_0768,
  ep_Q2_002_partial_09_0769,
  ep_Q2_002_partial_09_0770,
  ep_Q2_002_partial_09_0771,
  ep_Q2_002_partial_09_0772,
  ep_Q2_002_partial_09_0773,
  ep_Q2_002_partial_09_0774,
  ep_Q2_002_partial_09_0775,
  ep_Q2_002_partial_09_0776,
  ep_Q2_002_partial_09_0777,
  ep_Q2_002_partial_09_0778,
  ep_Q2_002_partial_09_0779,
  ep_Q2_002_partial_09_0780,
  ep_Q2_002_partial_09_0781,
  ep_Q2_002_partial_09_0782,
  ep_Q2_002_partial_09_0783,
  ep_Q2_002_partial_09_0784,
  ep_Q2_002_partial_09_0785,
  ep_Q2_002_partial_09_0786,
  ep_Q2_002_partial_09_0787,
  ep_Q2_002_partial_09_0788,
  ep_Q2_002_partial_09_0789,
  ep_Q2_002_partial_09_0790,
  ep_Q2_002_partial_09_0791,
  ep_Q2_002_partial_09_0792,
  ep_Q2_002_partial_09_0793,
  ep_Q2_002_partial_09_0794,
  ep_Q2_002_partial_09_0795,
  ep_Q2_002_partial_09_0796,
  ep_Q2_002_partial_09_0797,
  ep_Q2_002_partial_09_0798,
  ep_Q2_002_partial_09_0799
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_0700_0799 : Poly :=
[
  term ((381790635174 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-33162853602572616672085597726752 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((62451863800983100189204984877184 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1798864918700863612923282373934692107147696 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2)],
  term ((763581270348 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1)],
  term ((310640109440622316392736689149376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (14, 1)],
  term ((-117530099766188738730213585768288 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (11, 1), (15, 2)],
  term ((146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1)],
  term ((-584993500209622051621771436750592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3709467885651438052561588348460780696555232 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-300100471816 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (14, 1)],
  term ((221331187933253564025651456986496 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1)],
  term ((-15565557134 : Rat) / 4440790347) [(2, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-955096054767820213715764753308696422106864 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (5, 1), (15, 3)],
  term ((-31131114268 : Rat) / 4440790347) [(2, 1), (4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (11, 1)],
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (9, 1), (13, 1)],
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1)],
  term ((97514072568 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((150050235908 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-113537711218008458263363286329440 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-246371363053262827864957827485353387647972 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-38126575709 : Rat) / 3171993105) [(2, 1), (4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((60290186174310940265394395095320 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 2)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (11, 2), (12, 1)],
  term ((1484670962975438063146229491423680 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (6, 1), (13, 1), (15, 1)],
  term ((-1800173297001958647750108601816191463520424 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (6, 1), (15, 2)],
  term ((458410348538 : Rat) / 7401317245) [(2, 1), (4, 1), (6, 1), (15, 2), (16, 1)],
  term ((28315712943328338337392870458976 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (8, 1), (11, 1)],
  term ((-53323790206862476260917094033792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (8, 1), (13, 1)],
  term ((-143493232074946280623259186363914408714656 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1)],
  term ((-21962661328 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-453089127865163734675508137847424 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((853251678587343666835905621355008 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((3665325266919308560444948551146631909122304 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2)],
  term ((390056290272 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-21804527231932132498863075301908 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((177585265180315310980161685920336 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((737532737988762102999703329297024 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (14, 1)],
  term ((271611678272827013485038207261792 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (11, 1), (15, 2)],
  term ((-334426311047073694731827957358912 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-206557051057762648001377175393193083972952 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-187151448378 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((41062008150824987441721875539536 : Rat) / 115799135485108289802725034287) [(2, 1), (4, 1), (7, 1), (13, 1)],
  term ((-1388912264717388087288258831518208 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 1), (14, 1)],
  term ((2974929153958204289320831293590737296304896 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2)],
  term ((224252660848 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 1), (13, 2), (15, 1)],
  term ((-37843791947694450116781410578539779918352 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1425542789308 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1111181561351336767724048285551826551566 : Rat) / 24487603954914955028839041264616839409) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((185180610311 : Rat) / 8881580694) [(2, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2130358008589544476757824121943975349745712 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 1), (15, 3)],
  term ((-352684980052 : Rat) / 22203951735) [(2, 1), (4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-814835034818481040455114621785376 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 2), (11, 1), (15, 1)],
  term ((1534486966188140497836179827262592 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-6391074025768633430273472365831926049237136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (7, 2), (15, 2)],
  term ((352684980052 : Rat) / 7401317245) [(2, 1), (4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (11, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (8, 1), (13, 1), (15, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (8, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(2, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (14, 1)],
  term ((151029709288387911558502712615808 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (11, 1), (15, 2)],
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1)],
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-284417226195781222278635207118336 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-32504690856 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((80975270084164716373576596449152458522768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((5271014764 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1221775088973102853481649517048877303040768 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (9, 1), (15, 3)],
  term ((-130018763424 : Rat) / 7401317245) [(2, 1), (4, 1), (9, 1), (15, 3), (16, 1)],
  term ((330742096447865794568238436412688 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-5736057393131143011586097338824 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (14, 1)],
  term ((199850475640319463763955027265984 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-63986539004392515337571662667232 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-60329084463266493551152918921920 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (11, 1), (15, 3)],
  term ((-622849306279583205442807621471296 : Rat) / 1273790490336191187829975377157) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((147119228919564824599421264642676541184568 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((-38993655950 : Rat) / 1480263449) [(2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((87036188267828674515748171705084402513128 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1)],
  term ((75025117954 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17920847604316168665244956020883128033436 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((39643219857 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3395624986543086195623681179429696820996736 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (4, 1), (13, 1), (15, 3)],
  term ((-224252660848 : Rat) / 7401317245) [(2, 1), (4, 1), (13, 1), (15, 3), (16, 1)],
  term ((10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (4, 1), (13, 2)],
  term ((-190895317587 : Rat) / 7401317245) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (5, 1), (7, 1), (15, 2)],
  term ((-381790635174 : Rat) / 7401317245) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1)],
  term ((-155320054720311158196368344574688 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (11, 1), (15, 2)],
  term ((-73124187526202756452721429593824 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1)],
  term ((292496750104811025810885718375296 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((1854733942825719026280794174230390348277616 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((150050235908 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-463683485706429756570198543557597587069404 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (5, 1), (12, 1), (15, 1)],
  term ((-37512558977 : Rat) / 7401317245) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((7782778567 : Rat) / 4440790347) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (5, 1), (15, 3)],
  term ((15565557134 : Rat) / 4440790347) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-146248375052405512905442859187648 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-927366971412859513140397087115195174138808 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-75025117954 : Rat) / 7401317245) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((56768855609004229131681643164720 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((123185681526631413932478913742676693823986 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((38126575709 : Rat) / 6343986210) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-30145093087155470132697197547660 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2)],
  term ((77660027360155579098184172287344 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (11, 2), (12, 1)],
  term ((-742335481487719031573114745711840 : Rat) / 1273790490336191187829975377157) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((900086648500979323875054300908095731760212 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (6, 1), (15, 2)],
  term ((-229205174269 : Rat) / 7401317245) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((-14157856471664169168696435229488 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (11, 1)],
  term ((26661895103431238130458547016896 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (8, 1), (13, 1)],
  term ((71746616037473140311629593181957204357328 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (8, 1), (15, 1)],
  term ((10981330664 : Rat) / 7401317245) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (9, 1), (15, 2)],
  term ((-195028145136 : Rat) / 7401317245) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((10902263615966066249431537650954 : Rat) / 115799135485108289802725034287) [(4, 1), (7, 1), (11, 1)],
  term ((-88792632590157655490080842960168 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-368766368994381051499851664648512 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (11, 1), (15, 2)],
  term ((167213155523536847365913978679456 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((103278525528881324000688587696596541986476 : Rat) / 103601401347717117429703636119532782115) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((93575724189 : Rat) / 7401317245) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20531004075412493720860937769768 : Rat) / 115799135485108289802725034287) [(4, 1), (7, 1), (13, 1)],
  term ((694456132358694043644129415759104 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1487464576979102144660415646795368648152448 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (13, 1), (15, 2)],
  term ((-112126330424 : Rat) / 7401317245) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 1), (13, 2), (15, 1)],
  term ((18921895973847225058390705289269889959176 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((712771394654 : Rat) / 22203951735) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((555590780675668383862024142775913275783 : Rat) / 24487603954914955028839041264616839409) [(4, 1), (7, 1), (15, 1)],
  term ((-185180610311 : Rat) / 17763161388) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 1), (15, 3)],
  term ((176342490026 : Rat) / 22203951735) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (7, 2), (15, 2)],
  term ((-176342490026 : Rat) / 7401317245) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (11, 1), (15, 1)],
  term ((-35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (8, 1), (15, 2)],
  term ((-16252345428 : Rat) / 7401317245) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((2360428594692159888058201923744 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1)],
  term ((-18878713661048488944812839076976 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-4445129085520707327185426936448 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1)],
  term ((35552153274472652784829400889792 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((152721886121637856685206189631109662880096 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((16252345428 : Rat) / 7401317245) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-40487635042082358186788298224576229261384 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 1)],
  term ((-2635507382 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (9, 1), (15, 3)],
  term ((65009381712 : Rat) / 7401317245) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-165371048223932897284119218206344 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((2868028696565571505793048669412 : Rat) / 97983883872014706756151952089) [(4, 1), (11, 1), (13, 1)],
  term ((38830013680077789549092086143672 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((31993269502196257668785831333616 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (15, 1)],
  term ((30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(4, 1), (11, 1), (15, 3)],
  term ((311424653139791602721403810735648 : Rat) / 1273790490336191187829975377157) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-73559614459782412299710632321338270592284 : Rat) / 269363643504064505317229453910785233499) [(4, 1), (12, 1), (15, 2)],
  term ((19496827975 : Rat) / 1480263449) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-43518094133914337257874085852542201256564 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-37512558977 : Rat) / 7401317245) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((8960423802158084332622478010441564016718 : Rat) / 122438019774574775144195206323084197045) [(4, 1), (13, 1), (15, 1)],
  term ((-39643219857 : Rat) / 14802634490) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(4, 1), (13, 1), (15, 3)],
  term ((112126330424 : Rat) / 7401317245) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-5401035136533888807578975381904 : Rat) / 97983883872014706756151952089) [(4, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 700 through 799. -/
theorem ep_Q2_002_block_09_0700_0799_valid :
    checkProductSumEq ep_Q2_002_partials_09_0700_0799
      ep_Q2_002_block_09_0700_0799 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
