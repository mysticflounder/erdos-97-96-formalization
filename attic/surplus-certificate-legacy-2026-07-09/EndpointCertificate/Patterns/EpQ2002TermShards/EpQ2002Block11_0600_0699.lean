/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 11:600-699

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 11 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_11_0600_0699 : Poly :=
[
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 600 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0600 : Poly :=
[
  term ((-24168574634 : Rat) / 1057331035) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 600 for generator 11. -/
def ep_Q2_002_partial_11_0600 : Poly :=
[
  term ((-48337149268 : Rat) / 1057331035) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48337149268 : Rat) / 1057331035) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((24168574634 : Rat) / 1057331035) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((24168574634 : Rat) / 1057331035) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 600 for generator 11. -/
theorem ep_Q2_002_partial_11_0600_valid :
    mulPoly ep_Q2_002_coefficient_11_0600
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0600 := by
  native_decide

/-- Coefficient term 601 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0601 : Poly :=
[
  term ((-12344905737879794450494276844502 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 601 for generator 11. -/
def ep_Q2_002_partial_11_0601 : Poly :=
[
  term ((-24689811475759588900988553689004 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-24689811475759588900988553689004 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((12344905737879794450494276844502 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 2)],
  term ((12344905737879794450494276844502 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 601 for generator 11. -/
theorem ep_Q2_002_partial_11_0601_valid :
    mulPoly ep_Q2_002_coefficient_11_0601
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0601 := by
  native_decide

/-- Coefficient term 602 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0602 : Poly :=
[
  term ((22715668102636644109985609938080 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 602 for generator 11. -/
def ep_Q2_002_partial_11_0602 : Poly :=
[
  term ((45431336205273288219971219876160 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((45431336205273288219971219876160 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22715668102636644109985609938080 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-22715668102636644109985609938080 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 602 for generator 11. -/
theorem ep_Q2_002_partial_11_0602_valid :
    mulPoly ep_Q2_002_coefficient_11_0602
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0602 := by
  native_decide

/-- Coefficient term 603 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0603 : Poly :=
[
  term ((9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 603 for generator 11. -/
def ep_Q2_002_partial_11_0603 : Poly :=
[
  term ((18774675141240621489640890157728 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((18774675141240621489640890157728 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 603 for generator 11. -/
theorem ep_Q2_002_partial_11_0603_valid :
    mulPoly ep_Q2_002_coefficient_11_0603
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0603 := by
  native_decide

/-- Coefficient term 604 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0604 : Poly :=
[
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2)]
]

/-- Partial product 604 for generator 11. -/
def ep_Q2_002_partial_11_0604 : Poly :=
[
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2), (14, 2)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 604 for generator 11. -/
theorem ep_Q2_002_partial_11_0604_valid :
    mulPoly ep_Q2_002_coefficient_11_0604
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0604 := by
  native_decide

/-- Coefficient term 605 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0605 : Poly :=
[
  term ((-49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 605 for generator 11. -/
def ep_Q2_002_partial_11_0605 : Poly :=
[
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 605 for generator 11. -/
theorem ep_Q2_002_partial_11_0605_valid :
    mulPoly ep_Q2_002_coefficient_11_0605
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0605 := by
  native_decide

/-- Coefficient term 606 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0606 : Poly :=
[
  term ((89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 606 for generator 11. -/
def ep_Q2_002_partial_11_0606 : Poly :=
[
  term ((179991068705380298414186777019276 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((179991068705380298414186777019276 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 606 for generator 11. -/
theorem ep_Q2_002_partial_11_0606_valid :
    mulPoly ep_Q2_002_coefficient_11_0606
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0606 := by
  native_decide

/-- Coefficient term 607 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0607 : Poly :=
[
  term ((-47839301209516070202914888435520 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 607 for generator 11. -/
def ep_Q2_002_partial_11_0607 : Poly :=
[
  term ((-95678602419032140405829776871040 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-95678602419032140405829776871040 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((47839301209516070202914888435520 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((47839301209516070202914888435520 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 607 for generator 11. -/
theorem ep_Q2_002_partial_11_0607_valid :
    mulPoly ep_Q2_002_coefficient_11_0607
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0607 := by
  native_decide

/-- Coefficient term 608 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0608 : Poly :=
[
  term ((-17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 608 for generator 11. -/
def ep_Q2_002_partial_11_0608 : Poly :=
[
  term ((-35356229258193402817733176334976 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-35356229258193402817733176334976 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 608 for generator 11. -/
theorem ep_Q2_002_partial_11_0608_valid :
    mulPoly ep_Q2_002_coefficient_11_0608
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0608 := by
  native_decide

/-- Coefficient term 609 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0609 : Poly :=
[
  term ((20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 609 for generator 11. -/
def ep_Q2_002_partial_11_0609 : Poly :=
[
  term ((41397998152559463221238832853065465972224 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((41397998152559463221238832853065465972224 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((-20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 609 for generator 11. -/
theorem ep_Q2_002_partial_11_0609_valid :
    mulPoly ep_Q2_002_coefficient_11_0609
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0609 := by
  native_decide

/-- Coefficient term 610 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0610 : Poly :=
[
  term ((-5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 610 for generator 11. -/
def ep_Q2_002_partial_11_0610 : Poly :=
[
  term ((-11306494328 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11306494328 : Rat) / 7401317245) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 610 for generator 11. -/
theorem ep_Q2_002_partial_11_0610_valid :
    mulPoly ep_Q2_002_coefficient_11_0610
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0610 := by
  native_decide

/-- Coefficient term 611 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0611 : Poly :=
[
  term ((-541168868510443636159840240576028839285008 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 611 for generator 11. -/
def ep_Q2_002_partial_11_0611 : Poly :=
[
  term ((-1082337737020887272319680481152057678570016 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1082337737020887272319680481152057678570016 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((541168868510443636159840240576028839285008 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((541168868510443636159840240576028839285008 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 611 for generator 11. -/
theorem ep_Q2_002_partial_11_0611_valid :
    mulPoly ep_Q2_002_coefficient_11_0611
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0611 := by
  native_decide

/-- Coefficient term 612 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0612 : Poly :=
[
  term ((-30192572064 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 612 for generator 11. -/
def ep_Q2_002_partial_11_0612 : Poly :=
[
  term ((-60385144128 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60385144128 : Rat) / 7401317245) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((30192572064 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((30192572064 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 612 for generator 11. -/
theorem ep_Q2_002_partial_11_0612_valid :
    mulPoly ep_Q2_002_coefficient_11_0612
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0612 := by
  native_decide

/-- Coefficient term 613 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0613 : Poly :=
[
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 613 for generator 11. -/
def ep_Q2_002_partial_11_0613 : Poly :=
[
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 613 for generator 11. -/
theorem ep_Q2_002_partial_11_0613_valid :
    mulPoly ep_Q2_002_coefficient_11_0613
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0613 := by
  native_decide

/-- Coefficient term 614 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0614 : Poly :=
[
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 614 for generator 11. -/
def ep_Q2_002_partial_11_0614 : Poly :=
[
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (12, 2), (15, 2)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 614 for generator 11. -/
theorem ep_Q2_002_partial_11_0614_valid :
    mulPoly ep_Q2_002_coefficient_11_0614
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0614 := by
  native_decide

/-- Coefficient term 615 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0615 : Poly :=
[
  term ((-46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 615 for generator 11. -/
def ep_Q2_002_partial_11_0615 : Poly :=
[
  term ((-93883265632 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 615 for generator 11. -/
theorem ep_Q2_002_partial_11_0615_valid :
    mulPoly ep_Q2_002_coefficient_11_0615
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0615 := by
  native_decide

/-- Coefficient term 616 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0616 : Poly :=
[
  term ((-94960215526957661946223189304784 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 616 for generator 11. -/
def ep_Q2_002_partial_11_0616 : Poly :=
[
  term ((-189920431053915323892446378609568 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-189920431053915323892446378609568 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((94960215526957661946223189304784 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 2)],
  term ((94960215526957661946223189304784 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 616 for generator 11. -/
theorem ep_Q2_002_partial_11_0616_valid :
    mulPoly ep_Q2_002_coefficient_11_0616
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0616 := by
  native_decide

/-- Coefficient term 617 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0617 : Poly :=
[
  term ((-253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 617 for generator 11. -/
def ep_Q2_002_partial_11_0617 : Poly :=
[
  term ((-506899729590666060841704799123536 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-506899729590666060841704799123536 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 617 for generator 11. -/
theorem ep_Q2_002_partial_11_0617_valid :
    mulPoly ep_Q2_002_coefficient_11_0617
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0617 := by
  native_decide

/-- Coefficient term 618 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0618 : Poly :=
[
  term ((878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 618 for generator 11. -/
def ep_Q2_002_partial_11_0618 : Poly :=
[
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 618 for generator 11. -/
theorem ep_Q2_002_partial_11_0618_valid :
    mulPoly ep_Q2_002_coefficient_11_0618
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0618 := by
  native_decide

/-- Coefficient term 619 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0619 : Poly :=
[
  term ((56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 619 for generator 11. -/
def ep_Q2_002_partial_11_0619 : Poly :=
[
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((112126330424 : Rat) / 7401317245) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 619 for generator 11. -/
theorem ep_Q2_002_partial_11_0619_valid :
    mulPoly ep_Q2_002_coefficient_11_0619
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0619 := by
  native_decide

/-- Coefficient term 620 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0620 : Poly :=
[
  term ((94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 620 for generator 11. -/
def ep_Q2_002_partial_11_0620 : Poly :=
[
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 620 for generator 11. -/
theorem ep_Q2_002_partial_11_0620_valid :
    mulPoly ep_Q2_002_coefficient_11_0620
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0620 := by
  native_decide

/-- Coefficient term 621 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0621 : Poly :=
[
  term ((227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 621 for generator 11. -/
def ep_Q2_002_partial_11_0621 : Poly :=
[
  term ((454577400038449119909909687962631804897302 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((454577400038449119909909687962631804897302 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 1), (15, 3)],
  term ((-227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 621 for generator 11. -/
theorem ep_Q2_002_partial_11_0621_valid :
    mulPoly ep_Q2_002_coefficient_11_0621
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0621 := by
  native_decide

/-- Coefficient term 622 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0622 : Poly :=
[
  term ((-971178168349 : Rat) / 88815806940) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 622 for generator 11. -/
def ep_Q2_002_partial_11_0622 : Poly :=
[
  term ((-971178168349 : Rat) / 44407903470) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-971178168349 : Rat) / 44407903470) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((971178168349 : Rat) / 88815806940) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((971178168349 : Rat) / 88815806940) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 622 for generator 11. -/
theorem ep_Q2_002_partial_11_0622_valid :
    mulPoly ep_Q2_002_coefficient_11_0622
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0622 := by
  native_decide

/-- Coefficient term 623 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0623 : Poly :=
[
  term ((1365796351345116590756252124470305199352677 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 623 for generator 11. -/
def ep_Q2_002_partial_11_0623 : Poly :=
[
  term ((2731592702690233181512504248940610398705354 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((2731592702690233181512504248940610398705354 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (15, 2)],
  term ((-1365796351345116590756252124470305199352677 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 2), (15, 1)],
  term ((-1365796351345116590756252124470305199352677 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 623 for generator 11. -/
theorem ep_Q2_002_partial_11_0623_valid :
    mulPoly ep_Q2_002_coefficient_11_0623
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0623 := by
  native_decide

/-- Coefficient term 624 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0624 : Poly :=
[
  term ((148268679 : Rat) / 29605268980) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 624 for generator 11. -/
def ep_Q2_002_partial_11_0624 : Poly :=
[
  term ((148268679 : Rat) / 14802634490) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((148268679 : Rat) / 14802634490) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-148268679 : Rat) / 29605268980) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-148268679 : Rat) / 29605268980) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 624 for generator 11. -/
theorem ep_Q2_002_partial_11_0624_valid :
    mulPoly ep_Q2_002_coefficient_11_0624
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0624 := by
  native_decide

/-- Coefficient term 625 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0625 : Poly :=
[
  term ((5571074793476721081168 : Rat) / 253528477699481291099) [(7, 2)]
]

/-- Partial product 625 for generator 11. -/
def ep_Q2_002_partial_11_0625 : Poly :=
[
  term ((11142149586953442162336 : Rat) / 253528477699481291099) [(2, 1), (7, 2), (14, 1)],
  term ((11142149586953442162336 : Rat) / 253528477699481291099) [(3, 1), (7, 2), (15, 1)],
  term ((-5571074793476721081168 : Rat) / 253528477699481291099) [(7, 2), (14, 2)],
  term ((-5571074793476721081168 : Rat) / 253528477699481291099) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 625 for generator 11. -/
theorem ep_Q2_002_partial_11_0625_valid :
    mulPoly ep_Q2_002_coefficient_11_0625
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0625 := by
  native_decide

/-- Coefficient term 626 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0626 : Poly :=
[
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1)]
]

/-- Partial product 626 for generator 11. -/
def ep_Q2_002_partial_11_0626 : Poly :=
[
  term ((-9358997311311152291136 : Rat) / 253528477699481291099) [(2, 1), (7, 2), (12, 1), (14, 1)],
  term ((-9358997311311152291136 : Rat) / 253528477699481291099) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1), (14, 2)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 626 for generator 11. -/
theorem ep_Q2_002_partial_11_0626_valid :
    mulPoly ep_Q2_002_coefficient_11_0626
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0626 := by
  native_decide

/-- Coefficient term 627 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0627 : Poly :=
[
  term ((713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 1)]
]

/-- Partial product 627 for generator 11. -/
def ep_Q2_002_partial_11_0627 : Poly :=
[
  term ((1426521820513831896960 : Rat) / 253528477699481291099) [(2, 1), (7, 2), (14, 2)],
  term ((1426521820513831896960 : Rat) / 253528477699481291099) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 1), (15, 2)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 627 for generator 11. -/
theorem ep_Q2_002_partial_11_0627_valid :
    mulPoly ep_Q2_002_coefficient_11_0627
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0627 := by
  native_decide

/-- Coefficient term 628 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0628 : Poly :=
[
  term ((47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 628 for generator 11. -/
def ep_Q2_002_partial_11_0628 : Poly :=
[
  term ((94378634808957158400165611431224 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((94378634808957158400165611431224 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 628 for generator 11. -/
theorem ep_Q2_002_partial_11_0628_valid :
    mulPoly ep_Q2_002_coefficient_11_0628
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0628 := by
  native_decide

/-- Coefficient term 629 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0629 : Poly :=
[
  term ((-641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 629 for generator 11. -/
def ep_Q2_002_partial_11_0629 : Poly :=
[
  term ((-1283250839365435825525372272472830275136816 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1283250839365435825525372272472830275136816 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 629 for generator 11. -/
theorem ep_Q2_002_partial_11_0629_valid :
    mulPoly ep_Q2_002_coefficient_11_0629
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0629 := by
  native_decide

/-- Coefficient term 630 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0630 : Poly :=
[
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 630 for generator 11. -/
def ep_Q2_002_partial_11_0630 : Poly :=
[
  term ((-48641717828 : Rat) / 7401317245) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48641717828 : Rat) / 7401317245) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 630 for generator 11. -/
theorem ep_Q2_002_partial_11_0630_valid :
    mulPoly ep_Q2_002_coefficient_11_0630
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0630 := by
  native_decide

/-- Coefficient term 631 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0631 : Poly :=
[
  term ((164805191649871669795460917864446 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 631 for generator 11. -/
def ep_Q2_002_partial_11_0631 : Poly :=
[
  term ((329610383299743339590921835728892 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((329610383299743339590921835728892 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-164805191649871669795460917864446 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-164805191649871669795460917864446 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 631 for generator 11. -/
theorem ep_Q2_002_partial_11_0631_valid :
    mulPoly ep_Q2_002_coefficient_11_0631
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0631 := by
  native_decide

/-- Coefficient term 632 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0632 : Poly :=
[
  term ((-10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 632 for generator 11. -/
def ep_Q2_002_partial_11_0632 : Poly :=
[
  term ((-20273903886771808923905040148776 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-20273903886771808923905040148776 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 632 for generator 11. -/
theorem ep_Q2_002_partial_11_0632_valid :
    mulPoly ep_Q2_002_coefficient_11_0632
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0632 := by
  native_decide

/-- Coefficient term 633 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0633 : Poly :=
[
  term ((45479680446030329840362312574070108567288 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 633 for generator 11. -/
def ep_Q2_002_partial_11_0633 : Poly :=
[
  term ((90959360892060659680724625148140217134576 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((90959360892060659680724625148140217134576 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((-45479680446030329840362312574070108567288 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-45479680446030329840362312574070108567288 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 633 for generator 11. -/
theorem ep_Q2_002_partial_11_0633_valid :
    mulPoly ep_Q2_002_coefficient_11_0633
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0633 := by
  native_decide

/-- Coefficient term 634 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0634 : Poly :=
[
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 634 for generator 11. -/
def ep_Q2_002_partial_11_0634 : Poly :=
[
  term ((48641717828 : Rat) / 7401317245) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((48641717828 : Rat) / 7401317245) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 634 for generator 11. -/
theorem ep_Q2_002_partial_11_0634_valid :
    mulPoly ep_Q2_002_coefficient_11_0634
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0634 := by
  native_decide

/-- Coefficient term 635 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0635 : Poly :=
[
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

/-- Partial product 635 for generator 11. -/
def ep_Q2_002_partial_11_0635 : Poly :=
[
  term ((-19758102658280666496107177137272 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 2), (14, 1)],
  term ((-19758102658280666496107177137272 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (14, 2)],
  term ((9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 635 for generator 11. -/
theorem ep_Q2_002_partial_11_0635_valid :
    mulPoly ep_Q2_002_coefficient_11_0635
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0635 := by
  native_decide

/-- Coefficient term 636 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0636 : Poly :=
[
  term ((9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1)]
]

/-- Partial product 636 for generator 11. -/
def ep_Q2_002_partial_11_0636 : Poly :=
[
  term ((19758102658280666496107177137272 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((19758102658280666496107177137272 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1), (14, 2)],
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 636 for generator 11. -/
theorem ep_Q2_002_partial_11_0636_valid :
    mulPoly ep_Q2_002_coefficient_11_0636
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0636 := by
  native_decide

/-- Coefficient term 637 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0637 : Poly :=
[
  term ((34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 637 for generator 11. -/
def ep_Q2_002_partial_11_0637 : Poly :=
[
  term ((69376089606963093008630143596641480178528 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((69376089606963093008630143596641480178528 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 637 for generator 11. -/
theorem ep_Q2_002_partial_11_0637_valid :
    mulPoly ep_Q2_002_coefficient_11_0637
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0637 := by
  native_decide

/-- Coefficient term 638 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0638 : Poly :=
[
  term ((-4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 638 for generator 11. -/
def ep_Q2_002_partial_11_0638 : Poly :=
[
  term ((-8904767678 : Rat) / 1057331035) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8904767678 : Rat) / 1057331035) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 638 for generator 11. -/
theorem ep_Q2_002_partial_11_0638_valid :
    mulPoly ep_Q2_002_coefficient_11_0638
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0638 := by
  native_decide

/-- Coefficient term 639 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0639 : Poly :=
[
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 639 for generator 11. -/
def ep_Q2_002_partial_11_0639 : Poly :=
[
  term ((-19061743573978540975638524516832 : Rat) / 97983883872014706756151952089) [(2, 1), (8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-19061743573978540975638524516832 : Rat) / 97983883872014706756151952089) [(3, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 639 for generator 11. -/
theorem ep_Q2_002_partial_11_0639_valid :
    mulPoly ep_Q2_002_coefficient_11_0639
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0639 := by
  native_decide

/-- Coefficient term 640 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0640 : Poly :=
[
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 640 for generator 11. -/
def ep_Q2_002_partial_11_0640 : Poly :=
[
  term ((-1365064308591845151061910205263266880736024 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1365064308591845151061910205263266880736024 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (12, 1), (15, 3)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 640 for generator 11. -/
theorem ep_Q2_002_partial_11_0640_valid :
    mulPoly ep_Q2_002_coefficient_11_0640
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0640 := by
  native_decide

/-- Coefficient term 641 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0641 : Poly :=
[
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 641 for generator 11. -/
def ep_Q2_002_partial_11_0641 : Poly :=
[
  term ((-53160261012 : Rat) / 7401317245) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-53160261012 : Rat) / 7401317245) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 641 for generator 11. -/
theorem ep_Q2_002_partial_11_0641_valid :
    mulPoly ep_Q2_002_coefficient_11_0641
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0641 := by
  native_decide

/-- Coefficient term 642 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0642 : Poly :=
[
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 642 for generator 11. -/
def ep_Q2_002_partial_11_0642 : Poly :=
[
  term ((1365064308591845151061910205263266880736024 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((1365064308591845151061910205263266880736024 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 642 for generator 11. -/
theorem ep_Q2_002_partial_11_0642_valid :
    mulPoly ep_Q2_002_coefficient_11_0642
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0642 := by
  native_decide

/-- Coefficient term 643 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0643 : Poly :=
[
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 643 for generator 11. -/
def ep_Q2_002_partial_11_0643 : Poly :=
[
  term ((53160261012 : Rat) / 7401317245) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((53160261012 : Rat) / 7401317245) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 643 for generator 11. -/
theorem ep_Q2_002_partial_11_0643_valid :
    mulPoly ep_Q2_002_coefficient_11_0643
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0643 := by
  native_decide

/-- Coefficient term 644 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0644 : Poly :=
[
  term ((22603515267098343751094020472534249643114 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 644 for generator 11. -/
def ep_Q2_002_partial_11_0644 : Poly :=
[
  term ((45207030534196687502188040945068499286228 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((45207030534196687502188040945068499286228 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-22603515267098343751094020472534249643114 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-22603515267098343751094020472534249643114 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 644 for generator 11. -/
theorem ep_Q2_002_partial_11_0644_valid :
    mulPoly ep_Q2_002_coefficient_11_0644
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0644 := by
  native_decide

/-- Coefficient term 645 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0645 : Poly :=
[
  term ((-93970851423 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 645 for generator 11. -/
def ep_Q2_002_partial_11_0645 : Poly :=
[
  term ((-187941702846 : Rat) / 7401317245) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-187941702846 : Rat) / 7401317245) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((93970851423 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((93970851423 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 645 for generator 11. -/
theorem ep_Q2_002_partial_11_0645_valid :
    mulPoly ep_Q2_002_coefficient_11_0645
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0645 := by
  native_decide

/-- Coefficient term 646 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0646 : Poly :=
[
  term ((-275324027912111407212350676719928 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

/-- Partial product 646 for generator 11. -/
def ep_Q2_002_partial_11_0646 : Poly :=
[
  term ((-550648055824222814424701353439856 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 2), (14, 1)],
  term ((-550648055824222814424701353439856 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((275324027912111407212350676719928 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 2)],
  term ((275324027912111407212350676719928 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 646 for generator 11. -/
theorem ep_Q2_002_partial_11_0646_valid :
    mulPoly ep_Q2_002_coefficient_11_0646
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0646 := by
  native_decide

/-- Coefficient term 647 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0647 : Poly :=
[
  term ((19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 647 for generator 11. -/
def ep_Q2_002_partial_11_0647 : Poly :=
[
  term ((38179557749296747628004348895392 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 2), (14, 2)],
  term ((38179557749296747628004348895392 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((-19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 647 for generator 11. -/
theorem ep_Q2_002_partial_11_0647_valid :
    mulPoly ep_Q2_002_coefficient_11_0647
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0647 := by
  native_decide

/-- Coefficient term 648 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0648 : Poly :=
[
  term ((-281853442587675481877041598298520075404132 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 648 for generator 11. -/
def ep_Q2_002_partial_11_0648 : Poly :=
[
  term ((-563706885175350963754083196597040150808264 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-563706885175350963754083196597040150808264 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 3)],
  term ((281853442587675481877041598298520075404132 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 2), (15, 2)],
  term ((281853442587675481877041598298520075404132 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 648 for generator 11. -/
theorem ep_Q2_002_partial_11_0648_valid :
    mulPoly ep_Q2_002_coefficient_11_0648
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0648 := by
  native_decide

/-- Coefficient term 649 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0649 : Poly :=
[
  term ((84458026414 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 649 for generator 11. -/
def ep_Q2_002_partial_11_0649 : Poly :=
[
  term ((168916052828 : Rat) / 7401317245) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((168916052828 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-84458026414 : Rat) / 7401317245) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-84458026414 : Rat) / 7401317245) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 649 for generator 11. -/
theorem ep_Q2_002_partial_11_0649_valid :
    mulPoly ep_Q2_002_coefficient_11_0649
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0649 := by
  native_decide

/-- Coefficient term 650 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0650 : Poly :=
[
  term ((104132375324196487941018928269492 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 650 for generator 11. -/
def ep_Q2_002_partial_11_0650 : Poly :=
[
  term ((208264750648392975882037856538984 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((208264750648392975882037856538984 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-104132375324196487941018928269492 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 2)],
  term ((-104132375324196487941018928269492 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 650 for generator 11. -/
theorem ep_Q2_002_partial_11_0650_valid :
    mulPoly ep_Q2_002_coefficient_11_0650
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0650 := by
  native_decide

/-- Coefficient term 651 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0651 : Poly :=
[
  term ((49093356615764722555769502524532 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 651 for generator 11. -/
def ep_Q2_002_partial_11_0651 : Poly :=
[
  term ((98186713231529445111539005049064 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((98186713231529445111539005049064 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-49093356615764722555769502524532 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-49093356615764722555769502524532 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 651 for generator 11. -/
theorem ep_Q2_002_partial_11_0651_valid :
    mulPoly ep_Q2_002_coefficient_11_0651
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0651 := by
  native_decide

/-- Coefficient term 652 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0652 : Poly :=
[
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 652 for generator 11. -/
def ep_Q2_002_partial_11_0652 : Poly :=
[
  term ((25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 652 for generator 11. -/
theorem ep_Q2_002_partial_11_0652_valid :
    mulPoly ep_Q2_002_coefficient_11_0652
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0652 := by
  native_decide

/-- Coefficient term 653 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0653 : Poly :=
[
  term ((-5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2)]
]

/-- Partial product 653 for generator 11. -/
def ep_Q2_002_partial_11_0653 : Poly :=
[
  term ((-10122064788459983149861720095096 : Rat) / 97983883872014706756151952089) [(2, 1), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-10122064788459983149861720095096 : Rat) / 97983883872014706756151952089) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2), (14, 2)],
  term ((5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 653 for generator 11. -/
theorem ep_Q2_002_partial_11_0653_valid :
    mulPoly ep_Q2_002_coefficient_11_0653
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0653 := by
  native_decide

/-- Coefficient term 654 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0654 : Poly :=
[
  term ((12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 654 for generator 11. -/
def ep_Q2_002_partial_11_0654 : Poly :=
[
  term ((25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 654 for generator 11. -/
theorem ep_Q2_002_partial_11_0654_valid :
    mulPoly ep_Q2_002_coefficient_11_0654
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0654 := by
  native_decide

/-- Coefficient term 655 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0655 : Poly :=
[
  term ((-44530740373261072679634299660568 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 655 for generator 11. -/
def ep_Q2_002_partial_11_0655 : Poly :=
[
  term ((-89061480746522145359268599321136 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-89061480746522145359268599321136 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((44530740373261072679634299660568 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((44530740373261072679634299660568 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 655 for generator 11. -/
theorem ep_Q2_002_partial_11_0655_valid :
    mulPoly ep_Q2_002_coefficient_11_0655
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0655 := by
  native_decide

/-- Coefficient term 656 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0656 : Poly :=
[
  term ((-92451984308822795571340621012944 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 656 for generator 11. -/
def ep_Q2_002_partial_11_0656 : Poly :=
[
  term ((-184903968617645591142681242025888 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-184903968617645591142681242025888 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((92451984308822795571340621012944 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((92451984308822795571340621012944 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 656 for generator 11. -/
theorem ep_Q2_002_partial_11_0656_valid :
    mulPoly ep_Q2_002_coefficient_11_0656
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0656 := by
  native_decide

/-- Coefficient term 657 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0657 : Poly :=
[
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 657 for generator 11. -/
def ep_Q2_002_partial_11_0657 : Poly :=
[
  term ((-47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 657 for generator 11. -/
theorem ep_Q2_002_partial_11_0657_valid :
    mulPoly ep_Q2_002_coefficient_11_0657
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0657 := by
  native_decide

/-- Coefficient term 658 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0658 : Poly :=
[
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 658 for generator 11. -/
def ep_Q2_002_partial_11_0658 : Poly :=
[
  term ((-3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 658 for generator 11. -/
theorem ep_Q2_002_partial_11_0658_valid :
    mulPoly ep_Q2_002_coefficient_11_0658
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0658 := by
  native_decide

/-- Coefficient term 659 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0659 : Poly :=
[
  term ((-351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 659 for generator 11. -/
def ep_Q2_002_partial_11_0659 : Poly :=
[
  term ((-703466192 : Rat) / 22496405) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-703466192 : Rat) / 22496405) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 659 for generator 11. -/
theorem ep_Q2_002_partial_11_0659_valid :
    mulPoly ep_Q2_002_coefficient_11_0659
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0659 := by
  native_decide

/-- Coefficient term 660 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0660 : Poly :=
[
  term ((1797031750902010565896280495712292003483452 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 660 for generator 11. -/
def ep_Q2_002_partial_11_0660 : Poly :=
[
  term ((3594063501804021131792560991424584006966904 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3594063501804021131792560991424584006966904 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1797031750902010565896280495712292003483452 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1797031750902010565896280495712292003483452 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 660 for generator 11. -/
theorem ep_Q2_002_partial_11_0660_valid :
    mulPoly ep_Q2_002_coefficient_11_0660
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0660 := by
  native_decide

/-- Coefficient term 661 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0661 : Poly :=
[
  term ((16539477336 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 661 for generator 11. -/
def ep_Q2_002_partial_11_0661 : Poly :=
[
  term ((33078954672 : Rat) / 7401317245) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((33078954672 : Rat) / 7401317245) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16539477336 : Rat) / 7401317245) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16539477336 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 661 for generator 11. -/
theorem ep_Q2_002_partial_11_0661_valid :
    mulPoly ep_Q2_002_coefficient_11_0661
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0661 := by
  native_decide

/-- Coefficient term 662 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0662 : Poly :=
[
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1)]
]

/-- Partial product 662 for generator 11. -/
def ep_Q2_002_partial_11_0662 : Poly :=
[
  term ((19061743573978540975638524516832 : Rat) / 97983883872014706756151952089) [(2, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((19061743573978540975638524516832 : Rat) / 97983883872014706756151952089) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 662 for generator 11. -/
theorem ep_Q2_002_partial_11_0662_valid :
    mulPoly ep_Q2_002_coefficient_11_0662
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0662 := by
  native_decide

/-- Coefficient term 663 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0663 : Poly :=
[
  term ((-30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 663 for generator 11. -/
def ep_Q2_002_partial_11_0663 : Poly :=
[
  term ((-61808108999038478752814093289624785542656 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-61808108999038478752814093289624785542656 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 663 for generator 11. -/
theorem ep_Q2_002_partial_11_0663_valid :
    mulPoly ep_Q2_002_coefficient_11_0663
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0663 := by
  native_decide

/-- Coefficient term 664 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0664 : Poly :=
[
  term ((4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 664 for generator 11. -/
def ep_Q2_002_partial_11_0664 : Poly :=
[
  term ((8904767678 : Rat) / 1057331035) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((8904767678 : Rat) / 1057331035) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 664 for generator 11. -/
theorem ep_Q2_002_partial_11_0664_valid :
    mulPoly ep_Q2_002_coefficient_11_0664
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0664 := by
  native_decide

/-- Coefficient term 665 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0665 : Poly :=
[
  term ((-196100763792989164625805149229264 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 665 for generator 11. -/
def ep_Q2_002_partial_11_0665 : Poly :=
[
  term ((-392201527585978329251610298458528 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-392201527585978329251610298458528 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((196100763792989164625805149229264 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 2)],
  term ((196100763792989164625805149229264 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 665 for generator 11. -/
theorem ep_Q2_002_partial_11_0665_valid :
    mulPoly ep_Q2_002_coefficient_11_0665
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0665 := by
  native_decide

/-- Coefficient term 666 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0666 : Poly :=
[
  term ((83859723474824884472215348316256 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 666 for generator 11. -/
def ep_Q2_002_partial_11_0666 : Poly :=
[
  term ((167719446949649768944430696632512 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((167719446949649768944430696632512 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-83859723474824884472215348316256 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-83859723474824884472215348316256 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 666 for generator 11. -/
theorem ep_Q2_002_partial_11_0666_valid :
    mulPoly ep_Q2_002_coefficient_11_0666
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0666 := by
  native_decide

/-- Coefficient term 667 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0667 : Poly :=
[
  term ((-1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 667 for generator 11. -/
def ep_Q2_002_partial_11_0667 : Poly :=
[
  term ((-3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 667 for generator 11. -/
theorem ep_Q2_002_partial_11_0667_valid :
    mulPoly ep_Q2_002_coefficient_11_0667
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0667 := by
  native_decide

/-- Coefficient term 668 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0668 : Poly :=
[
  term ((-351733096 : Rat) / 22496405) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 668 for generator 11. -/
def ep_Q2_002_partial_11_0668 : Poly :=
[
  term ((-703466192 : Rat) / 22496405) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-703466192 : Rat) / 22496405) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((351733096 : Rat) / 22496405) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((351733096 : Rat) / 22496405) [(9, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 668 for generator 11. -/
theorem ep_Q2_002_partial_11_0668_valid :
    mulPoly ep_Q2_002_coefficient_11_0668
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0668 := by
  native_decide

/-- Coefficient term 669 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0669 : Poly :=
[
  term ((-23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 669 for generator 11. -/
def ep_Q2_002_partial_11_0669 : Poly :=
[
  term ((-47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 669 for generator 11. -/
theorem ep_Q2_002_partial_11_0669_valid :
    mulPoly ep_Q2_002_coefficient_11_0669
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0669 := by
  native_decide

/-- Coefficient term 670 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0670 : Poly :=
[
  term ((258124707825684340263348872789517808996272 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 670 for generator 11. -/
def ep_Q2_002_partial_11_0670 : Poly :=
[
  term ((516249415651368680526697745579035617992544 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((516249415651368680526697745579035617992544 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-258124707825684340263348872789517808996272 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (14, 1), (15, 3)],
  term ((-258124707825684340263348872789517808996272 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 670 for generator 11. -/
theorem ep_Q2_002_partial_11_0670_valid :
    mulPoly ep_Q2_002_coefficient_11_0670
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0670 := by
  native_decide

/-- Coefficient term 671 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0671 : Poly :=
[
  term ((1800988526 : Rat) / 211466207) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 671 for generator 11. -/
def ep_Q2_002_partial_11_0671 : Poly :=
[
  term ((3601977052 : Rat) / 211466207) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3601977052 : Rat) / 211466207) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1800988526 : Rat) / 211466207) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1800988526 : Rat) / 211466207) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 671 for generator 11. -/
theorem ep_Q2_002_partial_11_0671_valid :
    mulPoly ep_Q2_002_coefficient_11_0671
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0671 := by
  native_decide

/-- Coefficient term 672 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0672 : Poly :=
[
  term ((-626919860397990620003505746100299126770248 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 1)]
]

/-- Partial product 672 for generator 11. -/
def ep_Q2_002_partial_11_0672 : Poly :=
[
  term ((-1253839720795981240007011492200598253540496 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1253839720795981240007011492200598253540496 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (15, 2)],
  term ((626919860397990620003505746100299126770248 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 2), (15, 1)],
  term ((626919860397990620003505746100299126770248 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 672 for generator 11. -/
theorem ep_Q2_002_partial_11_0672_valid :
    mulPoly ep_Q2_002_coefficient_11_0672
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0672 := by
  native_decide

/-- Coefficient term 673 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0673 : Poly :=
[
  term ((-83460827249 : Rat) / 7401317245) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 673 for generator 11. -/
def ep_Q2_002_partial_11_0673 : Poly :=
[
  term ((-166921654498 : Rat) / 7401317245) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-166921654498 : Rat) / 7401317245) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((83460827249 : Rat) / 7401317245) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((83460827249 : Rat) / 7401317245) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 673 for generator 11. -/
theorem ep_Q2_002_partial_11_0673_valid :
    mulPoly ep_Q2_002_coefficient_11_0673
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0673 := by
  native_decide

/-- Coefficient term 674 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0674 : Poly :=
[
  term ((192537741553885595505977021011896 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 674 for generator 11. -/
def ep_Q2_002_partial_11_0674 : Poly :=
[
  term ((385075483107771191011954042023792 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((385075483107771191011954042023792 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-192537741553885595505977021011896 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-192537741553885595505977021011896 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 674 for generator 11. -/
theorem ep_Q2_002_partial_11_0674_valid :
    mulPoly ep_Q2_002_coefficient_11_0674
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0674 := by
  native_decide

/-- Coefficient term 675 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0675 : Poly :=
[
  term ((-89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 675 for generator 11. -/
def ep_Q2_002_partial_11_0675 : Poly :=
[
  term ((-178069862470429938216552967711872 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-178069862470429938216552967711872 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 675 for generator 11. -/
theorem ep_Q2_002_partial_11_0675_valid :
    mulPoly ep_Q2_002_coefficient_11_0675
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0675 := by
  native_decide

/-- Coefficient term 676 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0676 : Poly :=
[
  term ((-540011212237374196668315307904259028393734 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 676 for generator 11. -/
def ep_Q2_002_partial_11_0676 : Poly :=
[
  term ((-1080022424474748393336630615808518056787468 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1080022424474748393336630615808518056787468 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((540011212237374196668315307904259028393734 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((540011212237374196668315307904259028393734 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 676 for generator 11. -/
theorem ep_Q2_002_partial_11_0676_valid :
    mulPoly ep_Q2_002_coefficient_11_0676
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0676 := by
  native_decide

/-- Coefficient term 677 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0677 : Poly :=
[
  term ((5173053651 : Rat) / 14802634490) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 677 for generator 11. -/
def ep_Q2_002_partial_11_0677 : Poly :=
[
  term ((5173053651 : Rat) / 7401317245) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5173053651 : Rat) / 7401317245) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5173053651 : Rat) / 14802634490) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5173053651 : Rat) / 14802634490) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 677 for generator 11. -/
theorem ep_Q2_002_partial_11_0677_valid :
    mulPoly ep_Q2_002_coefficient_11_0677
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0677 := by
  native_decide

/-- Coefficient term 678 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0678 : Poly :=
[
  term ((122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1)]
]

/-- Partial product 678 for generator 11. -/
def ep_Q2_002_partial_11_0678 : Poly :=
[
  term ((245396459281069090015310326955904 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((245396459281069090015310326955904 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 678 for generator 11. -/
theorem ep_Q2_002_partial_11_0678_valid :
    mulPoly ep_Q2_002_coefficient_11_0678
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0678 := by
  native_decide

/-- Coefficient term 679 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0679 : Poly :=
[
  term ((10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 679 for generator 11. -/
def ep_Q2_002_partial_11_0679 : Poly :=
[
  term ((21091747703397003614456869803695365162608 : Rat) / 24487603954914955028839041264616839409) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((21091747703397003614456869803695365162608 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((-10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 679 for generator 11. -/
theorem ep_Q2_002_partial_11_0679_valid :
    mulPoly ep_Q2_002_coefficient_11_0679
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0679 := by
  native_decide

/-- Coefficient term 680 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0680 : Poly :=
[
  term ((11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 680 for generator 11. -/
def ep_Q2_002_partial_11_0680 : Poly :=
[
  term ((23239758316 : Rat) / 1480263449) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((23239758316 : Rat) / 1480263449) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 680 for generator 11. -/
theorem ep_Q2_002_partial_11_0680_valid :
    mulPoly ep_Q2_002_coefficient_11_0680
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0680 := by
  native_decide

/-- Coefficient term 681 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0681 : Poly :=
[
  term ((84511687696299744033808786917996 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

/-- Partial product 681 for generator 11. -/
def ep_Q2_002_partial_11_0681 : Poly :=
[
  term ((169023375392599488067617573835992 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((169023375392599488067617573835992 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-84511687696299744033808786917996 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 2)],
  term ((-84511687696299744033808786917996 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 681 for generator 11. -/
theorem ep_Q2_002_partial_11_0681_valid :
    mulPoly ep_Q2_002_coefficient_11_0681
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0681 := by
  native_decide

/-- Coefficient term 682 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0682 : Poly :=
[
  term ((177138719683982816795504944176492 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 682 for generator 11. -/
def ep_Q2_002_partial_11_0682 : Poly :=
[
  term ((354277439367965633591009888352984 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((354277439367965633591009888352984 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-177138719683982816795504944176492 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-177138719683982816795504944176492 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 682 for generator 11. -/
theorem ep_Q2_002_partial_11_0682_valid :
    mulPoly ep_Q2_002_coefficient_11_0682
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0682 := by
  native_decide

/-- Coefficient term 683 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0683 : Poly :=
[
  term ((-73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 683 for generator 11. -/
def ep_Q2_002_partial_11_0683 : Poly :=
[
  term ((-146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 683 for generator 11. -/
theorem ep_Q2_002_partial_11_0683_valid :
    mulPoly ep_Q2_002_coefficient_11_0683
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0683 := by
  native_decide

/-- Coefficient term 684 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0684 : Poly :=
[
  term ((-3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 684 for generator 11. -/
def ep_Q2_002_partial_11_0684 : Poly :=
[
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 3)],
  term ((3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 684 for generator 11. -/
theorem ep_Q2_002_partial_11_0684_valid :
    mulPoly ep_Q2_002_coefficient_11_0684
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0684 := by
  native_decide

/-- Coefficient term 685 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0685 : Poly :=
[
  term ((187675626462231547019655620829214702303053 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 1)]
]

/-- Partial product 685 for generator 11. -/
def ep_Q2_002_partial_11_0685 : Poly :=
[
  term ((375351252924463094039311241658429404606106 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((375351252924463094039311241658429404606106 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (11, 1), (15, 2)],
  term ((-187675626462231547019655620829214702303053 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (14, 2), (15, 1)],
  term ((-187675626462231547019655620829214702303053 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 685 for generator 11. -/
theorem ep_Q2_002_partial_11_0685_valid :
    mulPoly ep_Q2_002_coefficient_11_0685
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0685 := by
  native_decide

/-- Coefficient term 686 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0686 : Poly :=
[
  term ((-68735591367 : Rat) / 14802634490) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 686 for generator 11. -/
def ep_Q2_002_partial_11_0686 : Poly :=
[
  term ((-68735591367 : Rat) / 7401317245) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-68735591367 : Rat) / 7401317245) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((68735591367 : Rat) / 14802634490) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((68735591367 : Rat) / 14802634490) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 686 for generator 11. -/
theorem ep_Q2_002_partial_11_0686_valid :
    mulPoly ep_Q2_002_coefficient_11_0686
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0686 := by
  native_decide

/-- Coefficient term 687 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0687 : Poly :=
[
  term ((56329949751162987301495956994068 : Rat) / 1273790490336191187829975377157) [(11, 2)]
]

/-- Partial product 687 for generator 11. -/
def ep_Q2_002_partial_11_0687 : Poly :=
[
  term ((112659899502325974602991913988136 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 2), (14, 1)],
  term ((112659899502325974602991913988136 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 2), (15, 1)],
  term ((-56329949751162987301495956994068 : Rat) / 1273790490336191187829975377157) [(11, 2), (14, 2)],
  term ((-56329949751162987301495956994068 : Rat) / 1273790490336191187829975377157) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 687 for generator 11. -/
theorem ep_Q2_002_partial_11_0687_valid :
    mulPoly ep_Q2_002_coefficient_11_0687
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0687 := by
  native_decide

/-- Coefficient term 688 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0688 : Poly :=
[
  term ((-23774252033812564812360380990400 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1)]
]

/-- Partial product 688 for generator 11. -/
def ep_Q2_002_partial_11_0688 : Poly :=
[
  term ((-47548504067625129624720761980800 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 2), (12, 1), (14, 1)],
  term ((-47548504067625129624720761980800 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((23774252033812564812360380990400 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (14, 2)],
  term ((23774252033812564812360380990400 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 688 for generator 11. -/
theorem ep_Q2_002_partial_11_0688_valid :
    mulPoly ep_Q2_002_coefficient_11_0688
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0688 := by
  native_decide

/-- Coefficient term 689 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0689 : Poly :=
[
  term ((-65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2)]
]

/-- Partial product 689 for generator 11. -/
def ep_Q2_002_partial_11_0689 : Poly :=
[
  term ((-130309111024476095689828157778912 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 2), (12, 2), (14, 1)],
  term ((-130309111024476095689828157778912 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2), (14, 2)],
  term ((65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 689 for generator 11. -/
theorem ep_Q2_002_partial_11_0689_valid :
    mulPoly ep_Q2_002_coefficient_11_0689
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0689 := by
  native_decide

/-- Coefficient term 690 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0690 : Poly :=
[
  term ((-31075683830057788054928712358560 : Rat) / 1273790490336191187829975377157) [(12, 1)]
]

/-- Partial product 690 for generator 11. -/
def ep_Q2_002_partial_11_0690 : Poly :=
[
  term ((-62151367660115576109857424717120 : Rat) / 1273790490336191187829975377157) [(2, 1), (12, 1), (14, 1)],
  term ((-62151367660115576109857424717120 : Rat) / 1273790490336191187829975377157) [(3, 1), (12, 1), (15, 1)],
  term ((31075683830057788054928712358560 : Rat) / 1273790490336191187829975377157) [(12, 1), (14, 2)],
  term ((31075683830057788054928712358560 : Rat) / 1273790490336191187829975377157) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 690 for generator 11. -/
theorem ep_Q2_002_partial_11_0690_valid :
    mulPoly ep_Q2_002_coefficient_11_0690
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0690 := by
  native_decide

/-- Coefficient term 691 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0691 : Poly :=
[
  term ((-2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 691 for generator 11. -/
def ep_Q2_002_partial_11_0691 : Poly :=
[
  term ((-4328343054104817258683044470864233008902504 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4328343054104817258683044470864233008902504 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 691 for generator 11. -/
theorem ep_Q2_002_partial_11_0691_valid :
    mulPoly ep_Q2_002_coefficient_11_0691
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0691 := by
  native_decide

/-- Coefficient term 692 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0692 : Poly :=
[
  term ((1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 692 for generator 11. -/
def ep_Q2_002_partial_11_0692 : Poly :=
[
  term ((3935984198 : Rat) / 7401317245) [(2, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3935984198 : Rat) / 7401317245) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 692 for generator 11. -/
theorem ep_Q2_002_partial_11_0692_valid :
    mulPoly ep_Q2_002_coefficient_11_0692
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0692 := by
  native_decide

/-- Coefficient term 693 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0693 : Poly :=
[
  term ((247050072910778006354349626786125335382596 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 693 for generator 11. -/
def ep_Q2_002_partial_11_0693 : Poly :=
[
  term ((494100145821556012708699253572250670765192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((494100145821556012708699253572250670765192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-247050072910778006354349626786125335382596 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-247050072910778006354349626786125335382596 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 693 for generator 11. -/
theorem ep_Q2_002_partial_11_0693_valid :
    mulPoly ep_Q2_002_coefficient_11_0693
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0693 := by
  native_decide

/-- Coefficient term 694 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0694 : Poly :=
[
  term ((-79426596257 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 694 for generator 11. -/
def ep_Q2_002_partial_11_0694 : Poly :=
[
  term ((-158853192514 : Rat) / 7401317245) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-158853192514 : Rat) / 7401317245) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((79426596257 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((79426596257 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 694 for generator 11. -/
theorem ep_Q2_002_partial_11_0694_valid :
    mulPoly ep_Q2_002_coefficient_11_0694
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0694 := by
  native_decide

/-- Coefficient term 695 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0695 : Poly :=
[
  term ((-223873301161514259867361063847904 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)]
]

/-- Partial product 695 for generator 11. -/
def ep_Q2_002_partial_11_0695 : Poly :=
[
  term ((-447746602323028519734722127695808 : Rat) / 1273790490336191187829975377157) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-447746602323028519734722127695808 : Rat) / 1273790490336191187829975377157) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((223873301161514259867361063847904 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 2)],
  term ((223873301161514259867361063847904 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 695 for generator 11. -/
theorem ep_Q2_002_partial_11_0695_valid :
    mulPoly ep_Q2_002_coefficient_11_0695
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0695 := by
  native_decide

/-- Coefficient term 696 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0696 : Poly :=
[
  term ((167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 1)]
]

/-- Partial product 696 for generator 11. -/
def ep_Q2_002_partial_11_0696 : Poly :=
[
  term ((335338898495767086320941204468224 : Rat) / 1273790490336191187829975377157) [(2, 1), (12, 1), (13, 2), (14, 2)],
  term ((335338898495767086320941204468224 : Rat) / 1273790490336191187829975377157) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 696 for generator 11. -/
theorem ep_Q2_002_partial_11_0696_valid :
    mulPoly ep_Q2_002_coefficient_11_0696
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0696 := by
  native_decide

/-- Coefficient term 697 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0697 : Poly :=
[
  term ((-3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 1)]
]

/-- Partial product 697 for generator 11. -/
def ep_Q2_002_partial_11_0697 : Poly :=
[
  term ((-6284335703733637029648 : Rat) / 253528477699481291099) [(2, 1), (12, 1), (14, 2)],
  term ((-6284335703733637029648 : Rat) / 253528477699481291099) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 1), (15, 2)],
  term ((3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 697 for generator 11. -/
theorem ep_Q2_002_partial_11_0697_valid :
    mulPoly ep_Q2_002_coefficient_11_0697
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0697 := by
  native_decide

/-- Coefficient term 698 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0698 : Poly :=
[
  term ((-808061106790673033170148933649256615752696 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)]
]

/-- Partial product 698 for generator 11. -/
def ep_Q2_002_partial_11_0698 : Poly :=
[
  term ((-1616122213581346066340297867298513231505392 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1616122213581346066340297867298513231505392 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 3)],
  term ((808061106790673033170148933649256615752696 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (14, 2), (15, 2)],
  term ((808061106790673033170148933649256615752696 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 698 for generator 11. -/
theorem ep_Q2_002_partial_11_0698_valid :
    mulPoly ep_Q2_002_coefficient_11_0698
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0698 := by
  native_decide

/-- Coefficient term 699 from coefficient polynomial 11. -/
def ep_Q2_002_coefficient_11_0699 : Poly :=
[
  term ((36617937257 : Rat) / 7401317245) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 699 for generator 11. -/
def ep_Q2_002_partial_11_0699 : Poly :=
[
  term ((73235874514 : Rat) / 7401317245) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((73235874514 : Rat) / 7401317245) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-36617937257 : Rat) / 7401317245) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-36617937257 : Rat) / 7401317245) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 699 for generator 11. -/
theorem ep_Q2_002_partial_11_0699_valid :
    mulPoly ep_Q2_002_coefficient_11_0699
        ep_Q2_002_generator_11_0600_0699 =
      ep_Q2_002_partial_11_0699 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_11_0600_0699 : List Poly :=
[
  ep_Q2_002_partial_11_0600,
  ep_Q2_002_partial_11_0601,
  ep_Q2_002_partial_11_0602,
  ep_Q2_002_partial_11_0603,
  ep_Q2_002_partial_11_0604,
  ep_Q2_002_partial_11_0605,
  ep_Q2_002_partial_11_0606,
  ep_Q2_002_partial_11_0607,
  ep_Q2_002_partial_11_0608,
  ep_Q2_002_partial_11_0609,
  ep_Q2_002_partial_11_0610,
  ep_Q2_002_partial_11_0611,
  ep_Q2_002_partial_11_0612,
  ep_Q2_002_partial_11_0613,
  ep_Q2_002_partial_11_0614,
  ep_Q2_002_partial_11_0615,
  ep_Q2_002_partial_11_0616,
  ep_Q2_002_partial_11_0617,
  ep_Q2_002_partial_11_0618,
  ep_Q2_002_partial_11_0619,
  ep_Q2_002_partial_11_0620,
  ep_Q2_002_partial_11_0621,
  ep_Q2_002_partial_11_0622,
  ep_Q2_002_partial_11_0623,
  ep_Q2_002_partial_11_0624,
  ep_Q2_002_partial_11_0625,
  ep_Q2_002_partial_11_0626,
  ep_Q2_002_partial_11_0627,
  ep_Q2_002_partial_11_0628,
  ep_Q2_002_partial_11_0629,
  ep_Q2_002_partial_11_0630,
  ep_Q2_002_partial_11_0631,
  ep_Q2_002_partial_11_0632,
  ep_Q2_002_partial_11_0633,
  ep_Q2_002_partial_11_0634,
  ep_Q2_002_partial_11_0635,
  ep_Q2_002_partial_11_0636,
  ep_Q2_002_partial_11_0637,
  ep_Q2_002_partial_11_0638,
  ep_Q2_002_partial_11_0639,
  ep_Q2_002_partial_11_0640,
  ep_Q2_002_partial_11_0641,
  ep_Q2_002_partial_11_0642,
  ep_Q2_002_partial_11_0643,
  ep_Q2_002_partial_11_0644,
  ep_Q2_002_partial_11_0645,
  ep_Q2_002_partial_11_0646,
  ep_Q2_002_partial_11_0647,
  ep_Q2_002_partial_11_0648,
  ep_Q2_002_partial_11_0649,
  ep_Q2_002_partial_11_0650,
  ep_Q2_002_partial_11_0651,
  ep_Q2_002_partial_11_0652,
  ep_Q2_002_partial_11_0653,
  ep_Q2_002_partial_11_0654,
  ep_Q2_002_partial_11_0655,
  ep_Q2_002_partial_11_0656,
  ep_Q2_002_partial_11_0657,
  ep_Q2_002_partial_11_0658,
  ep_Q2_002_partial_11_0659,
  ep_Q2_002_partial_11_0660,
  ep_Q2_002_partial_11_0661,
  ep_Q2_002_partial_11_0662,
  ep_Q2_002_partial_11_0663,
  ep_Q2_002_partial_11_0664,
  ep_Q2_002_partial_11_0665,
  ep_Q2_002_partial_11_0666,
  ep_Q2_002_partial_11_0667,
  ep_Q2_002_partial_11_0668,
  ep_Q2_002_partial_11_0669,
  ep_Q2_002_partial_11_0670,
  ep_Q2_002_partial_11_0671,
  ep_Q2_002_partial_11_0672,
  ep_Q2_002_partial_11_0673,
  ep_Q2_002_partial_11_0674,
  ep_Q2_002_partial_11_0675,
  ep_Q2_002_partial_11_0676,
  ep_Q2_002_partial_11_0677,
  ep_Q2_002_partial_11_0678,
  ep_Q2_002_partial_11_0679,
  ep_Q2_002_partial_11_0680,
  ep_Q2_002_partial_11_0681,
  ep_Q2_002_partial_11_0682,
  ep_Q2_002_partial_11_0683,
  ep_Q2_002_partial_11_0684,
  ep_Q2_002_partial_11_0685,
  ep_Q2_002_partial_11_0686,
  ep_Q2_002_partial_11_0687,
  ep_Q2_002_partial_11_0688,
  ep_Q2_002_partial_11_0689,
  ep_Q2_002_partial_11_0690,
  ep_Q2_002_partial_11_0691,
  ep_Q2_002_partial_11_0692,
  ep_Q2_002_partial_11_0693,
  ep_Q2_002_partial_11_0694,
  ep_Q2_002_partial_11_0695,
  ep_Q2_002_partial_11_0696,
  ep_Q2_002_partial_11_0697,
  ep_Q2_002_partial_11_0698,
  ep_Q2_002_partial_11_0699
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_11_0600_0699 : Poly :=
[
  term ((-48337149268 : Rat) / 1057331035) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((45431336205273288219971219876160 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((18774675141240621489640890157728 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24689811475759588900988553689004 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((179991068705380298414186777019276 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-95678602419032140405829776871040 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-35356229258193402817733176334976 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1082337737020887272319680481152057678570016 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-60385144128 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((41397998152559463221238832853065465972224 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-11306494328 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-189920431053915323892446378609568 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((112126330424 : Rat) / 7401317245) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-506899729590666060841704799123536 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((2731592702690233181512504248940610398705354 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((148268679 : Rat) / 14802634490) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((454577400038449119909909687962631804897302 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-971178168349 : Rat) / 44407903470) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9358997311311152291136 : Rat) / 253528477699481291099) [(2, 1), (7, 2), (12, 1), (14, 1)],
  term ((11142149586953442162336 : Rat) / 253528477699481291099) [(2, 1), (7, 2), (14, 1)],
  term ((1426521820513831896960 : Rat) / 253528477699481291099) [(2, 1), (7, 2), (14, 2)],
  term ((94378634808957158400165611431224 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1283250839365435825525372272472830275136816 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-48641717828 : Rat) / 7401317245) [(2, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((329610383299743339590921835728892 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-20273903886771808923905040148776 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((90959360892060659680724625148140217134576 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((48641717828 : Rat) / 7401317245) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((19758102658280666496107177137272 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-19758102658280666496107177137272 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (11, 2), (14, 1)],
  term ((69376089606963093008630143596641480178528 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8904767678 : Rat) / 1057331035) [(2, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19061743573978540975638524516832 : Rat) / 97983883872014706756151952089) [(2, 1), (8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1365064308591845151061910205263266880736024 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-53160261012 : Rat) / 7401317245) [(2, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((45207030534196687502188040945068499286228 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-187941702846 : Rat) / 7401317245) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1365064308591845151061910205263266880736024 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((53160261012 : Rat) / 7401317245) [(2, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-550648055824222814424701353439856 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 2), (14, 1)],
  term ((38179557749296747628004348895392 : Rat) / 1273790490336191187829975377157) [(2, 1), (8, 1), (13, 2), (14, 2)],
  term ((-563706885175350963754083196597040150808264 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (8, 1), (14, 1), (15, 2)],
  term ((168916052828 : Rat) / 7401317245) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((98186713231529445111539005049064 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-10122064788459983149861720095096 : Rat) / 97983883872014706756151952089) [(2, 1), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((208264750648392975882037856538984 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-89061480746522145359268599321136 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-184903968617645591142681242025888 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((3594063501804021131792560991424584006966904 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((33078954672 : Rat) / 7401317245) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-703466192 : Rat) / 22496405) [(2, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((19061743573978540975638524516832 : Rat) / 97983883872014706756151952089) [(2, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-61808108999038478752814093289624785542656 : Rat) / 103601401347717117429703636119532782115) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((8904767678 : Rat) / 1057331035) [(2, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-392201527585978329251610298458528 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-703466192 : Rat) / 22496405) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((167719446949649768944430696632512 : Rat) / 1273790490336191187829975377157) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(2, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1253839720795981240007011492200598253540496 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-166921654498 : Rat) / 7401317245) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((516249415651368680526697745579035617992544 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((3601977052 : Rat) / 211466207) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((385075483107771191011954042023792 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-178069862470429938216552967711872 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1080022424474748393336630615808518056787468 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((5173053651 : Rat) / 7401317245) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((245396459281069090015310326955904 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((21091747703397003614456869803695365162608 : Rat) / 24487603954914955028839041264616839409) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((23239758316 : Rat) / 1480263449) [(2, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((169023375392599488067617573835992 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((354277439367965633591009888352984 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((375351252924463094039311241658429404606106 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-68735591367 : Rat) / 7401317245) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-47548504067625129624720761980800 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 2), (12, 1), (14, 1)],
  term ((-130309111024476095689828157778912 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 2), (12, 2), (14, 1)],
  term ((112659899502325974602991913988136 : Rat) / 1273790490336191187829975377157) [(2, 1), (11, 2), (14, 1)],
  term ((494100145821556012708699253572250670765192 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-158853192514 : Rat) / 7401317245) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4328343054104817258683044470864233008902504 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((3935984198 : Rat) / 7401317245) [(2, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-447746602323028519734722127695808 : Rat) / 1273790490336191187829975377157) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((335338898495767086320941204468224 : Rat) / 1273790490336191187829975377157) [(2, 1), (12, 1), (13, 2), (14, 2)],
  term ((-62151367660115576109857424717120 : Rat) / 1273790490336191187829975377157) [(2, 1), (12, 1), (14, 1)],
  term ((-1616122213581346066340297867298513231505392 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((73235874514 : Rat) / 7401317245) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6284335703733637029648 : Rat) / 253528477699481291099) [(2, 1), (12, 1), (14, 2)],
  term ((-48337149268 : Rat) / 1057331035) [(3, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((18774675141240621489640890157728 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((45431336205273288219971219876160 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (12, 2), (15, 1)],
  term ((-99925237820159731881977513632992 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((179991068705380298414186777019276 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24689811475759588900988553689004 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-35356229258193402817733176334976 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-95678602419032140405829776871040 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((41397998152559463221238832853065465972224 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-11306494328 : Rat) / 7401317245) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1082337737020887272319680481152057678570016 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-60385144128 : Rat) / 7401317245) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (12, 2), (15, 2)],
  term ((-93883265632 : Rat) / 7401317245) [(3, 1), (7, 1), (12, 2), (15, 2), (16, 1)],
  term ((-506899729590666060841704799123536 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-189920431053915323892446378609568 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((112126330424 : Rat) / 7401317245) [(3, 1), (7, 1), (13, 1), (15, 3), (16, 1)],
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(3, 1), (7, 1), (13, 2), (15, 2)],
  term ((454577400038449119909909687962631804897302 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-971178168349 : Rat) / 44407903470) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((2731592702690233181512504248940610398705354 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (7, 1), (15, 2)],
  term ((148268679 : Rat) / 14802634490) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-9358997311311152291136 : Rat) / 253528477699481291099) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((1426521820513831896960 : Rat) / 253528477699481291099) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((11142149586953442162336 : Rat) / 253528477699481291099) [(3, 1), (7, 2), (15, 1)],
  term ((94378634808957158400165611431224 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1283250839365435825525372272472830275136816 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-48641717828 : Rat) / 7401317245) [(3, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-20273903886771808923905040148776 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((329610383299743339590921835728892 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((90959360892060659680724625148140217134576 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (8, 1), (11, 1), (15, 2)],
  term ((48641717828 : Rat) / 7401317245) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((19758102658280666496107177137272 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-19758102658280666496107177137272 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (11, 2), (15, 1)],
  term ((69376089606963093008630143596641480178528 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8904767678 : Rat) / 1057331035) [(3, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19061743573978540975638524516832 : Rat) / 97983883872014706756151952089) [(3, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1365064308591845151061910205263266880736024 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (12, 1), (15, 3)],
  term ((-53160261012 : Rat) / 7401317245) [(3, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((1365064308591845151061910205263266880736024 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((53160261012 : Rat) / 7401317245) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((45207030534196687502188040945068499286228 : Rat) / 122438019774574775144195206323084197045) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-187941702846 : Rat) / 7401317245) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((38179557749296747628004348895392 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-550648055824222814424701353439856 : Rat) / 1273790490336191187829975377157) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((-563706885175350963754083196597040150808264 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (8, 1), (15, 3)],
  term ((168916052828 : Rat) / 7401317245) [(3, 1), (8, 1), (15, 3), (16, 1)],
  term ((25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((98186713231529445111539005049064 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10122064788459983149861720095096 : Rat) / 97983883872014706756151952089) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((25287768951215770208773407086208 : Rat) / 115799135485108289802725034287) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-89061480746522145359268599321136 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((208264750648392975882037856538984 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (11, 1), (15, 1)],
  term ((-47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-184903968617645591142681242025888 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-703466192 : Rat) / 22496405) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3594063501804021131792560991424584006966904 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (12, 1), (15, 2)],
  term ((33078954672 : Rat) / 7401317245) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((19061743573978540975638524516832 : Rat) / 97983883872014706756151952089) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1)],
  term ((-61808108999038478752814093289624785542656 : Rat) / 103601401347717117429703636119532782115) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((8904767678 : Rat) / 1057331035) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((167719446949649768944430696632512 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-392201527585978329251610298458528 : Rat) / 1273790490336191187829975377157) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3946945401963918297591849430107381252288 : Rat) / 2605064250522867556259472474959238235) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-703466192 : Rat) / 22496405) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-47621604621188099504530861595136 : Rat) / 115799135485108289802725034287) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((516249415651368680526697745579035617992544 : Rat) / 269363643504064505317229453910785233499) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((3601977052 : Rat) / 211466207) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1253839720795981240007011492200598253540496 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (9, 1), (15, 2)],
  term ((-166921654498 : Rat) / 7401317245) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((-178069862470429938216552967711872 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((385075483107771191011954042023792 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1080022424474748393336630615808518056787468 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((5173053651 : Rat) / 7401317245) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((245396459281069090015310326955904 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((21091747703397003614456869803695365162608 : Rat) / 24487603954914955028839041264616839409) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((23239758316 : Rat) / 1480263449) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((354277439367965633591009888352984 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((169023375392599488067617573835992 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-146416059249600270447405510976512 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-7541135557908311693894114865240 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((375351252924463094039311241658429404606106 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (11, 1), (15, 2)],
  term ((-68735591367 : Rat) / 7401317245) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-47548504067625129624720761980800 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-130309111024476095689828157778912 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((112659899502325974602991913988136 : Rat) / 1273790490336191187829975377157) [(3, 1), (11, 2), (15, 1)],
  term ((-4328343054104817258683044470864233008902504 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((3935984198 : Rat) / 7401317245) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((494100145821556012708699253572250670765192 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-158853192514 : Rat) / 7401317245) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((335338898495767086320941204468224 : Rat) / 1273790490336191187829975377157) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-447746602323028519734722127695808 : Rat) / 1273790490336191187829975377157) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6284335703733637029648 : Rat) / 253528477699481291099) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-62151367660115576109857424717120 : Rat) / 1273790490336191187829975377157) [(3, 1), (12, 1), (15, 1)],
  term ((-1616122213581346066340297867298513231505392 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (12, 1), (15, 3)],
  term ((73235874514 : Rat) / 7401317245) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((24168574634 : Rat) / 1057331035) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((24168574634 : Rat) / 1057331035) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-22715668102636644109985609938080 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-9387337570620310744820445078864 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 3)],
  term ((-22715668102636644109985609938080 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2), (14, 2)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 2), (15, 2)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((49962618910079865940988756816496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((-89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((12344905737879794450494276844502 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 2)],
  term ((-89995534352690149207093388509638 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 3)],
  term ((12344905737879794450494276844502 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)],
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((47839301209516070202914888435520 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 3)],
  term ((47839301209516070202914888435520 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((541168868510443636159840240576028839285008 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((30192572064 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20698999076279731610619416426532732986112 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((5653247164 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((541168868510443636159840240576028839285008 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 3)],
  term ((30192572064 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 2), (15, 3)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((94960215526957661946223189304784 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 2)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((253449864795333030420852399561768 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 3)],
  term ((94960215526957661946223189304784 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)],
  term ((-878937346169027455438753096498157458754784 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (13, 1), (15, 4)],
  term ((-56063165212 : Rat) / 7401317245) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-94088967997334090913192549085632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 2), (15, 3)],
  term ((-227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 1), (15, 3)],
  term ((971178168349 : Rat) / 88815806940) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1365796351345116590756252124470305199352677 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 2), (15, 1)],
  term ((-148268679 : Rat) / 29605268980) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-227288700019224559954954843981315902448651 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 3), (15, 1)],
  term ((971178168349 : Rat) / 88815806940) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1365796351345116590756252124470305199352677 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)],
  term ((-148268679 : Rat) / 29605268980) [(7, 1), (15, 3), (16, 1)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1), (14, 2)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (12, 1), (15, 2)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 1), (15, 2)],
  term ((-5571074793476721081168 : Rat) / 253528477699481291099) [(7, 2), (14, 2)],
  term ((-713260910256915948480 : Rat) / 253528477699481291099) [(7, 2), (14, 3)],
  term ((-5571074793476721081168 : Rat) / 253528477699481291099) [(7, 2), (15, 2)],
  term ((-47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-47189317404478579200082805715612 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((641625419682717912762686136236415137568408 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-164805191649871669795460917864446 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((10136951943385904461952520074388 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (14, 3)],
  term ((-164805191649871669795460917864446 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-45479680446030329840362312574070108567288 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-45479680446030329840362312574070108567288 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (11, 1), (15, 3)],
  term ((-24320858914 : Rat) / 7401317245) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1), (14, 2)],
  term ((-9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (14, 2)],
  term ((9879051329140333248053588568636 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (15, 2)],
  term ((-34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-34688044803481546504315071798320740089264 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (12, 1), (13, 1), (15, 3)],
  term ((4452383839 : Rat) / 1057331035) [(8, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2), (14, 2)],
  term ((9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(8, 1), (12, 1), (13, 2), (15, 2)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (14, 2), (15, 2)],
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (12, 1), (15, 4)],
  term ((26580130506 : Rat) / 7401317245) [(8, 1), (12, 1), (15, 4), (16, 1)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-22603515267098343751094020472534249643114 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((93970851423 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-682532154295922575530955102631633440368012 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (13, 1), (14, 3), (15, 1)],
  term ((-26580130506 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-22603515267098343751094020472534249643114 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (15, 3)],
  term ((93970851423 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((275324027912111407212350676719928 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 2)],
  term ((-19089778874648373814002174447696 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 3)],
  term ((275324027912111407212350676719928 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (15, 2)],
  term ((281853442587675481877041598298520075404132 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 2), (15, 2)],
  term ((-84458026414 : Rat) / 7401317245) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((281853442587675481877041598298520075404132 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 4)],
  term ((-84458026414 : Rat) / 7401317245) [(8, 1), (15, 4), (16, 1)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-49093356615764722555769502524532 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (12, 1), (14, 3)],
  term ((-49093356615764722555769502524532 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2), (14, 2)],
  term ((5061032394229991574930860047548 : Rat) / 97983883872014706756151952089) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-12643884475607885104386703543104 : Rat) / 115799135485108289802725034287) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((44530740373261072679634299660568 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-104132375324196487941018928269492 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 2)],
  term ((44530740373261072679634299660568 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 3)],
  term ((-104132375324196487941018928269492 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (15, 2)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((92451984308822795571340621012944 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (12, 1), (13, 1), (14, 3)],
  term ((92451984308822795571340621012944 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1797031750902010565896280495712292003483452 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-16539477336 : Rat) / 7401317245) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (12, 1), (14, 3), (15, 1)],
  term ((351733096 : Rat) / 22496405) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1797031750902010565896280495712292003483452 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 3)],
  term ((-16539477336 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((-9530871786989270487819262258416 : Rat) / 97983883872014706756151952089) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((30904054499519239376407046644812392771328 : Rat) / 103601401347717117429703636119532782115) [(9, 1), (12, 2), (15, 3)],
  term ((-4452383839 : Rat) / 1057331035) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-83859723474824884472215348316256 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((196100763792989164625805149229264 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 2)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((351733096 : Rat) / 22496405) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-83859723474824884472215348316256 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 3)],
  term ((196100763792989164625805149229264 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (15, 2)],
  term ((1973472700981959148795924715053690626144 : Rat) / 2605064250522867556259472474959238235) [(9, 1), (13, 1), (15, 4)],
  term ((351733096 : Rat) / 22496405) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((23810802310594049752265430797568 : Rat) / 115799135485108289802725034287) [(9, 1), (13, 2), (15, 3)],
  term ((-258124707825684340263348872789517808996272 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (14, 1), (15, 3)],
  term ((-1800988526 : Rat) / 211466207) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((626919860397990620003505746100299126770248 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 2), (15, 1)],
  term ((83460827249 : Rat) / 7401317245) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-258124707825684340263348872789517808996272 : Rat) / 269363643504064505317229453910785233499) [(9, 1), (14, 3), (15, 1)],
  term ((-1800988526 : Rat) / 211466207) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((626919860397990620003505746100299126770248 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 3)],
  term ((83460827249 : Rat) / 7401317245) [(9, 1), (15, 3), (16, 1)],
  term ((89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-192537741553885595505977021011896 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((89034931235214969108276483855936 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 3)],
  term ((-192537741553885595505977021011896 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((540011212237374196668315307904259028393734 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-5173053651 : Rat) / 14802634490) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((540011212237374196668315307904259028393734 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (12, 1), (15, 3)],
  term ((-5173053651 : Rat) / 14802634490) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1), (14, 2)],
  term ((-122698229640534545007655163477952 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (14, 2), (15, 1)],
  term ((-11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-10545873851698501807228434901847682581304 : Rat) / 24487603954914955028839041264616839409) [(11, 1), (12, 2), (15, 3)],
  term ((-11619879158 : Rat) / 1480263449) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-177138719683982816795504944176492 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-84511687696299744033808786917996 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 2)],
  term ((-177138719683982816795504944176492 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 3)],
  term ((-84511687696299744033808786917996 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (15, 2)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((73208029624800135223702755488256 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 2), (15, 3)],
  term ((3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 3)],
  term ((-187675626462231547019655620829214702303053 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (14, 2), (15, 1)],
  term ((68735591367 : Rat) / 14802634490) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3770567778954155846947057432620 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 3), (15, 1)],
  term ((-187675626462231547019655620829214702303053 : Rat) / 1346818217520322526586147269553926167495) [(11, 1), (15, 3)],
  term ((68735591367 : Rat) / 14802634490) [(11, 1), (15, 3), (16, 1)],
  term ((23774252033812564812360380990400 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (14, 2)],
  term ((23774252033812564812360380990400 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (15, 2)],
  term ((65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2), (14, 2)],
  term ((65154555512238047844914078889456 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 2), (15, 2)],
  term ((-56329949751162987301495956994068 : Rat) / 1273790490336191187829975377157) [(11, 2), (14, 2)],
  term ((-56329949751162987301495956994068 : Rat) / 1273790490336191187829975377157) [(11, 2), (15, 2)],
  term ((2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-247050072910778006354349626786125335382596 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((79426596257 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2164171527052408629341522235432116504451252 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (14, 3), (15, 1)],
  term ((-1967992099 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-247050072910778006354349626786125335382596 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (13, 1), (15, 3)],
  term ((79426596257 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 1), (15, 2)],
  term ((223873301161514259867361063847904 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 2)],
  term ((-167669449247883543160470602234112 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 3)],
  term ((223873301161514259867361063847904 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (15, 2)],
  term ((3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 1), (15, 2)],
  term ((31075683830057788054928712358560 : Rat) / 1273790490336191187829975377157) [(12, 1), (14, 2)],
  term ((808061106790673033170148933649256615752696 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (14, 2), (15, 2)],
  term ((-36617937257 : Rat) / 7401317245) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((3142167851866818514824 : Rat) / 253528477699481291099) [(12, 1), (14, 3)],
  term ((31075683830057788054928712358560 : Rat) / 1273790490336191187829975377157) [(12, 1), (15, 2)],
  term ((808061106790673033170148933649256615752696 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 4)],
  term ((-36617937257 : Rat) / 7401317245) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 600 through 699. -/
theorem ep_Q2_002_block_11_0600_0699_valid :
    checkProductSumEq ep_Q2_002_partials_11_0600_0699
      ep_Q2_002_block_11_0600_0699 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
